-------------------------------------------------------------------------------
-- Declaration
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package u232c_in_p is

  type u232c_in_in_t is record
    rden : std_logic;
  end record;

  type u232c_in_out_t is record
    empty    : std_logic;
    overflow : std_logic;
    data     : unsigned(7 downto 0);
  end record;

  component u232c_in is

    generic (
      wtime : unsigned(15 downto 0) := x"1adb");
    port (
      clk  : in  std_logic;
      xrst : in  std_logic;
      rx   : in  std_logic;
      din  : in  u232c_in_in_t;
      dout : out u232c_in_out_t);

  end component;

end package;


-------------------------------------------------------------------------------
-- Definition
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.ram_p.all;
use work.u232c_in_p.all;

entity u232c_in is

  generic (
      wtime : unsigned(15 downto 0));
    port (
      clk  : in  std_logic;
      xrst : in  std_logic;
      rx   : in  std_logic;
      din  : in  u232c_in_in_t;
      dout : out u232c_in_out_t);

end entity u232c_in;

architecture behavior of u232c_in is

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


  type latch_t is record
    recvbuf : unsigned(7 downto 0);
    idx     : integer range -1 to 8;
    cnt     : unsigned(15 downto 0);
    head    : unsigned(9 downto 0);
    tail    : unsigned(9 downto 0);
  end record latch_t;

  constant latch_init_value : latch_t := (
    recvbuf => (others => '0'),
    idx     => -1,
    cnt     => shift_right(wtime, 1),
    head    => (others => '0'),
    tail    => (others => '0'));

  signal r, rin : latch_t := latch_init_value;

begin

  inputbuf : blockram_dual
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

  cmb: process (r, bufo, rx, din) is
    variable v    : latch_t;
    variable dv   : u232c_in_out_t;
    variable bufv : buf_in_t;
  begin

    v := r;
    bufv := (
      we    => '-',
      en    => '0',
      addr1 => (others => '0'),
      addr2 => (others => '0'),
      data1 => (others => '0'));
    dv := (
      empty    => '-',
      overflow => '0',
      data     => (others => '0'));

    -- receiver
    case r.idx is
      when -1 =>
        if rx = '0' then
          if r.cnt = 0 then
            v.cnt := wtime;
            v.idx := 0;
          else
            v.cnt := r.cnt - 1;
          end if;
        end if;

      when 8 =>
        if r.cnt = 0 then
          if r.tail + 1 /= r.head then
            bufv.en    := '1';
            bufv.we    := '1';
            bufv.addr1 := r.tail;
            bufv.data1 := r.recvbuf;

            v.cnt  := shift_right(wtime, 1);
            v.tail := r.tail + 1;
          else
            assert false report "u232c_in: input buffer overflow" severity warning;
            dv.overflow := '1';
          end if;

          v.idx  := -1;
        else
          v.cnt := r.cnt - 1;
        end if;

      when others =>
        if r.cnt = 0 then
          v.recvbuf(r.idx) := rx;
          v.cnt            := wtime;
          v.idx            := r.idx + 1;
        else
          v.cnt := r.cnt - 1;
        end if;

    end case;

    -- output
    dv.data := bufo.data2;

    if din.rden = '1' then
      bufv.en    := '1';
      bufv.we    := '0';
      bufv.addr2 := r.head;
      v.head      := r.head + 1;
    end if;

    if r.head = r.tail then
      dv.empty := '1';
    else
      dv.empty := '0';
    end if;

    rin  <= v;
    dout <= dv;
    bufi <= bufv;

  end process;

  seq: process (clk, xrst) is
  begin
    if xrst = '0' then
      r <= latch_init_value;
    elsif rising_edge(clk) then
      assert not (r.head = r.tail and rin.head = r.head + 1)
        report "read from empty buffer" severity error;
      r <= rin;
    end if;
  end process;

end architecture behavior;
