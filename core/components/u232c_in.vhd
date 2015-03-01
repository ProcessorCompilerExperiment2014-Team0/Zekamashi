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
use work.inputbuf_p.all;
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

  signal ibufi : inputbuf_in_t;
  signal ibufo : inputbuf_out_t;  

  type latch_t is record
    recvbuf : unsigned(7 downto 0);
    idx     : integer range -1 to 8;
    cnt     : unsigned(15 downto 0);
    head    : unsigned(9 downto 0);
    tail    : unsigned(9 downto 0);
  end record latch_t;

  constant latch_init_value : latch_t := (recvbuf => (others => '0'),
                                          idx     => -1,
                                          cnt     => shift_right(wtime, 1),
                                          head    => (others => '0'),
                                          tail    => (others => '0'));

  signal r, rin : latch_t := latch_init_value;

begin

  buf : inputbuf
    port map (
      clk  => clk,
      din  => ibufi,
      dout => ibufo);

  process (r, ibufo, rx, din) is
    variable v     : latch_t;
    variable dv    : u232c_in_out_t;
    variable ibufv : inputbuf_in_t;
  begin

    v     := r;
    ibufv := (we   => '-',
              en   => '0',
              addr1 => (others => '0'),
              addr2 => (others => '0'),
              data1 => (others => '0'));
    dv    := (empty => '-',
              overflow => '0',
              data  => (others => '0'));

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
            ibufv.en    := '1';
            ibufv.we    := '1';
            ibufv.addr1 := r.tail;
            ibufv.data1 := r.recvbuf;

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
    dv.data := ibufo.data2;

    if din.rden = '1' then
      ibufv.en    := '1';
      ibufv.we    := '0';
      ibufv.addr2 := r.head;
      v.head      := r.head + 1;
    end if;

    if r.head = r.tail then
      dv.empty := '1';
    else
      dv.empty := '0';
    end if;

    rin   <= v;
    dout  <= dv;
    ibufi <= ibufv;

  end process;

  process (clk, xrst) is
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
