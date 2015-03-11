-------------------------------------------------------------------------------
-- Declaration
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package u232c_out_p is

  type u232c_out_in_t is record
    data : unsigned (7 downto 0);
    go   : std_logic;
  end record;

  type u232c_out_out_t is record
    busy : std_logic;
  end record;

  component u232c_out
    generic (
      report_write : boolean := false;
      wtime : unsigned(15 downto 0));
    port (
      clk  : in  std_logic;
      xrst : in  std_logic;
      tx   : out std_logic;

      din  : in  u232c_out_in_t;
      dout : out u232c_out_out_t);
  end component;

end u232c_out_p;

-------------------------------------------------------------------------------
-- Definition
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.ram_p.all;
use work.u232c_out_p.all;

entity u232c_out is
  generic (
    report_write : boolean;
    wtime        : unsigned(15 downto 0) := x"1ADB");
  port (
    clk  : in  std_logic;
    xrst : in  std_logic;
    tx   : out std_logic;

    din  : in  u232c_out_in_t;
    dout : out u232c_out_out_t);
end u232c_out;

architecture behavior of u232c_out is

  -- signals for outputbuf
  type buf_in_t is record
    we    : std_logic;
    en    : std_logic;
    addr1 : unsigned(9 downto 0);
    addr2 : unsigned(9 downto 0);
    data1 : unsigned(7 downto 0);
  end record buf_in_t;

  type buf_out_t is record
    data1 : unsigned(7 downto 0);
    data2 : unsigned(7 downto 0);
  end record buf_out_t;

  signal bufi : buf_in_t;
  signal bufo : buf_out_t;

  -- latch

  type latch_t is record
    -- fifo
    head : unsigned(9 downto 0);
    tail : unsigned(9 downto 0);
    -- output
    buf   : unsigned(8 downto 0);
    count : unsigned(15 downto 0);
    state : integer range -2 to 9;
  end record;

  constant latch_init : latch_t := (
    head  => (others => '0'),
    tail  => (others => '0'),
    buf   => (others => '1'),
    count => (others => '0'),
    state => -1);

  signal r, rin : latch_t := latch_init;

begin

  outputbuf : blockram_dual
    generic map (
      length     => 8,
      width      => 10,
      init_value => x"00")
    port map (
      clk    => clk,
      en     => bufi.en,
      we     => bufi.we,
      addr1  => bufi.addr1,
      addr2  => bufi.addr2,
      idata1 => bufi.data1,
      odata1 => bufo.data1,
      odata2 => bufo.data2);

  process (din, bufo, r) is
    variable v    : latch_t;
    variable dv   : u232c_out_out_t;
    variable bufv : buf_in_t;
  begin
    v  := r;
    dv := (
      busy => '-');
    bufv := (
      we    => '0',
      en    => '0',
      addr1 => (others => '-'),
      addr2 => (others => '-'),
      data1 => (others => '-'));

    -- push data to fifo
    if din.go = '1' then
      assert r.head /= r.tail + 1 report "u232c_out: push data to full buffer" severity warning;
      bufv.en    := '1';
      bufv.we    := '1';
      bufv.addr1 := r.tail;
      bufv.data1 := din.data;
      v.tail     := r.tail+1;
    end if;

    -- send tx
    case r.state is
      when -1 =>
        if r.head /= r.tail then
          bufv.en    := '1';
          bufv.addr2 := r.head;
          v.buf(0)   := '0';
          v.state    := -2;
          v.head     := r.head + 1;
        end if;
      when -2 =>
        v.buf(8 downto 1) := bufo.data2;
        v.state           := 9;
        v.count           := wtime - 2;
      when others =>
        if r.count = 0 then
          v.buf   := "1" & r.buf(8 downto 1);
          v.count := wtime;
          v.state := r.state - 1;
        else
          v.count := r.count - 1;
        end if;
    end case;

    -- output
    if r.tail + 1 = r.head then
      dv.busy := '1';
    else
      dv.busy := '0';
    end if;

    tx   <= r.buf(0);
    bufi <= bufv;
    dout <= dv;
    rin  <= v;
  end process;

  process (clk, xrst)
  begin
    if xrst = '0' then
      r <= latch_init;
    elsif rising_edge (clk) then
      r <= rin;
    end if;
  end process;

end behavior;
