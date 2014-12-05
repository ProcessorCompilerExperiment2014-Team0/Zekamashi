library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package zebius_u232c_in_p is

  type u232c_in_in_t is record
    rden : std_logic;
  end record;

  type u232c_in_out_t is record
    empty : std_logic;
    data : unsigned(7 downto 0);
  end record;

  component u232c_in is
    generic (
      wtime: unsigned(15 downto 0) := x"1adb");
    port (
      clk : in std_logic;
      rx : in std_logic;
      din : in u232c_in_in_t;
      dout : out u232c_in_out_t);
  end component;
end package;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

library work;
use work.zebius_u232c_in_p.all;


entity u232c_in is
  generic (
    wtime: unsigned(15 downto 0) := x"1ADB");
  port (
    clk  : in  std_logic;
    rx   : in  std_logic;
    din : in u232c_in_in_t;
    dout : out u232c_in_out_t := (
      empty => '0',
      data => (others => '0')));
end u232c_in;


architecture behavior of u232c_in is

  --
  -- fifo
  --

  type fifo18_in_t is record
    di: std_logic_vector (15 downto 0);
    dip:  std_logic_vector (1 downto 0);
    rdclk: std_ulogic;
    rden: std_ulogic;
    rst: std_ulogic;
    wrclk: std_ulogic;
    wren: std_ulogic;
  end record;

  type fifo18_out_t is record
    -- almostempty : std_ulogic;
    -- almostfull  : std_ulogic;
    do: std_logic_vector (15 downto 0);
    dop: std_logic_vector (1 downto 0);
    empty: std_ulogic;
    full: std_ulogic;
    -- rdcount     : std_logic_vector (11 downto 0);
    rderr: std_ulogic;
    -- wrcount     : std_logic_vector (11 downto 0);
    wrerr: std_ulogic;
  end record;

  signal fifo_in: fifo18_in_t := (
    di => (others => '0'),
    dip => (others => '0'),
    rdclk => '0',
    rden => '0',
    rst => '0',
    wrclk => '0',
    wren => '0');

  signal fifo_out: fifo18_out_t;

  --
  -- inner state
  --

  type state_t is (WAITING, INIT, READING, DONE);

  type ratch_t is record
    dbuf : unsigned(7 downto 0);
    countdown : unsigned(15 downto 0);
    state : state_t;
    idx : integer range 0 to 7;
  end record;

  signal r : ratch_t := (
    dbuf => (others => '1'),
    countdown => (others => '0'),
    state => WAITING,
    idx => 0);

begin
  fifo: fifo18
    generic map (
      data_width => 9,
      en_syn => true,
      do_reg => 1)
    port map (
      almostempty => open,
      almostfull => open,
      do => fifo_out.do,
      dop => fifo_out.dop,
      empty => fifo_out.empty,
      full => fifo_out.full,
      rdcount => open,
      rderr => fifo_out.rderr,
      wrcount => open,
      wrerr => fifo_out.wrerr,

      di => fifo_in.di,
      dip => fifo_in.dip,
      rdclk => fifo_in.rdclk,
      rden => fifo_in.rden,
      rst => fifo_in.rst,
      wrclk => fifo_in.wrclk,
      wren => fifo_in.wren);

  fifo_in.rst <= '0';
  fifo_in.rdclk <= clk;
  fifo_in.wrclk <= clk;
  fifo_in.di(15 downto 8) <= (others => '0');

  fifo_in.rden <= din.rden;

  statemachine: process(clk)
    variable v : ratch_t;
  begin
    if rising_edge(clk) then
      v := r;

      fifo_in.wren <= '0';

      case v.state is
        when WAITING =>
          if rx='0' and v.countdown = 0 then
            v.state  := INIT;
            v.countdown := shift_right(unsigned(wtime), 1);
          elsif v.countdown /= 0 then
            v.countdown := v.countdown-1;
          end if;

        when INIT =>
          if v.countdown = 0 then
            if rx = '0' then
              v.state := READING;
              v.idx := 0;
              v.countdown := wtime;
            else
              v.state := WAITING;
            end if;
          elsif v.countdown /= 0 then
            v.countdown := v.countdown-1;
          end if;

        when READING =>
          if v.countdown = 0 then
            v.dbuf := rx & v.dbuf(7 downto 1);
            v.countdown := wtime;
            if v.idx /= 7 then
              v.idx := v.idx+1;
            else
              v.state := DONE;
            end if;
          else
            v.countdown := v.countdown-1;
          end if;

        when DONE =>
          assert fifo_out.full = '0' report "fifo is full" severity warning;

          fifo_in.wren <= '1';
          fifo_in.di(7 downto 0) <= std_logic_vector(v.dbuf);
          fifo_in.dip <= "00";

          v.state := waiting;
      end case;

      dout.empty <= fifo_out.empty;
      dout.data <= unsigned(fifo_out.do(7 downto 0));

      r <= v;
    end if;
  end process;

end behavior;
