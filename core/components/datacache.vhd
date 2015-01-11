-------------------------------------------------------------------------------
-- Cache Memory
-- * 128 Line
-- * 8 word(32 byte) per line
-- * total 4KiB
-- * direct mapped
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Declaration
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.sram_p.all;

package datacache_p is

  type datacache_in_t is record
    addr : unsigned(19 downto 0);
    data : unsigned(31 downto 0);
    en   : std_logic;
    we   : std_logic;
  end record datacache_in_t;

  type datacache_out_t is record
    data : unsigned(31 downto 0);
    miss : std_logic;
  end record datacache_out_t;

  component datacache is
    port (
      clk  : in std_logic;
      xrst : in std_logic;

      srami : out sram_in_t;
      sramo : in  sram_out_t;

      din  : in  datacache_in_t;
      dout : out datacache_out_t);
  end component datacache;

end package datacache_p;

-------------------------------------------------------------------------------
-- Definition
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.datacache_p.all;
use work.datacache_ram_p.all;
use work.sram_p.all;

entity datacache is
  port (
    clk : in std_logic;
    xrst : in std_logic;

    srami : out  sram_in_t;
    sramo : in sram_out_t;

    din  : in  datacache_in_t;
    dout : out datacache_out_t);
end entity datacache;

architecture behavior of datacache is

  subtype tag_t is unsigned(9 downto 0);
  type tagarray_t is array (0 to 127) of tag_t;
  signal tagarray : tagarray_t := (others => (others => '0'));
  signal cache_in : datacache_ram_in_t;
  signal cache_out : datacache_ram_out_t;

  type latch_t is record
    miss : std_logic;
  end record latch_t;

  signal r, rin : latch_t := (miss => '0');

begin

  cache : datacache_ram
    port map (
      clk  => clk,
      din  => cache_in,
      dout => cache_out);

  process (din, cache_in, r) is
    variable v  : latch_t;
    variable dv : datacache_out_t;
    variable cv : datacache_ram_in_t;

  begin

    v  := r;
    cv := (we => '-',
           en => '0',
           addr => (others => '-'),
           data => (others => '-'));

    if din.en = '1' then
      case din.we is
        when '0' =>
          if tagarray(to_integer(din.addr(9 downto 3))) = din.addr(19 downto 10) then
            cv := (we => '0',
                   en => '1',
                   addr => din.addr(9 downto 0),
                   data => (others => '-'));
            v.miss := '0';
          else
            assert false report "cache miss! hahaha!" severity error;
            v.miss := '1';
          end if;
          --fixme
        when '1' =>
          if tagarray(to_integer(din.addr(9 downto 3))) = din.addr(19 downto 10) then
            cv := (we   => '1',
                   en   => '1',
                   addr => din.addr(9 downto 0),
                   data => din.data);
            v.miss := '0';
          else
            assert false report "cache miss! hahaha!" severity error;
            v.miss := '1';
          end if;
        when others => null;
      end case;
    end if;

    ---------------------------------------------------------------------------

    dv.miss := r.miss;
    dv.data := cache_out.data;

    ---------------------------------------------------------------------------

    cache_in <= cv;
    dout     <= dv;
    rin      <= v;

  end process;

  process (clk) is
  begin
    if rising_edge(clk) then
      r <= rin;
    end if;
  end process;

end architecture behavior;
