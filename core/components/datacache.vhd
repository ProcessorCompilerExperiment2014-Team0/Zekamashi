-------------------------------------------------------------------------------
-- Cache Memory
-- * 128 Line
-- * 8 word(32 byte) per line
-- * total 4KiB
-- * direct mapped
--
-- tag:10 | idx:7 | line:3
---------------------------------------------------------------------------------

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
  signal cache_in : datacache_ram_in_t;
  signal cache_out : datacache_ram_out_t;

  type state_t is (ST_FINE, ST_MISS, ST_DONE);

  type latch_t is record
    state    : state_t;
    tagarray : tagarray_t;
    head     : unsigned(16 downto 0);
    idx      : integer range 0 to 7;
    data     : unsigned(31 downto 0);
    cnt      : integer range 0 to 11;
  end record latch_t;

  constant latch_init : latch_t := (
    state    => ST_FINE,
    tagarray => (others => (others => '0')),
    head     => (others => '-'),
    idx      => 0,
    data     => (others => '-'),
    cnt      => 0);

  signal r, rin : latch_t := latch_init;

begin

  cache : datacache_ram
    port map (
      clk  => clk,
      din  => cache_in,
      dout => cache_out);

  process (din, cache_out, sramo, r) is
    variable v  : latch_t;
    variable dv : datacache_out_t;
    variable cv : datacache_ram_in_t;
    variable sramv : sram_in_t;
  begin

    v := r;
    cv := (we   => '-',
           en   => '0',
           addr => (others => '-'),
           data => (others => '-'));
    sramv := (addr => (others => '0'),
              data => (others => '-'),
              we   => '0');

    case r.state is
      when ST_FINE | ST_DONE =>
        if din.en = '1' then
          case din.we is
            when '0' =>
              if r.tagarray(to_integer(din.addr(9 downto 3))) = din.addr(19 downto 10) then
                cv := (we   => '0',
                       en   => '1',
                       addr => din.addr(9 downto 0),
                       data => (others => '-'));
                v.state := ST_FINE;
              else
                v := (state    => ST_MISS,
                      tagarray => r.tagarray,
                      head     => din.addr(19 downto 3),
                      idx      => to_integer(din.addr(2 downto 0)),
                      data     => (others => '-'),
                      cnt      => 0);
              end if;

            when '1' =>
              if r.tagarray(to_integer(din.addr(9 downto 3))) = din.addr(19 downto 10) then
                cv := (we   => '1',
                       en   => '1',
                       addr => din.addr(9 downto 0),
                       data => din.data);
              end if;

              sramv := (addr => din.addr,
                        data => din.data,
                        we   => '1');
              v.state := ST_FINE;

            when others => null;
          end case;
        end if;

      when ST_MISS =>
        if r.cnt < 8 then
          sramv := (addr => r.head & to_unsigned(r.cnt, 3),
                    data => (others => '-'),
                    we   => '0');
        end if;

        if r.cnt >= 4 then
          cv := (we   => '1',
                 en   => '1',
                 addr => r.head(6 downto 0) & to_unsigned(r.cnt - 4, 3),
                 data => sramo.data);

          if r.idx = r.cnt - 4 then
            v.data := sramo.data;
          end if;
        end if;

        if r.cnt = 11 then
          v.state := ST_DONE;
          v.tagarray(to_integer(r.head(6 downto 0))) := r.head(16 downto 7);
        else
          v.cnt := r.cnt + 1;
        end if;
    end case;

    ---------------------------------------------------------------------------

    case r.state is
      when ST_FINE =>
        dv.miss := '0';
        dv.data := cache_out.data;
      when ST_MISS =>
        dv.miss := '1';
        dv.data := (others => '-');
      when ST_DONE =>
        dv.miss := '0';
        dv.data := r.data;
    end case;

    ---------------------------------------------------------------------------

    srami    <= sramv;
    cache_in <= cv;
    dout     <= dv;
    rin      <= v;
  end process;

  process (clk) is
  begin
    if xrst = '0' then
      r <= latch_init;
    elsif rising_edge(clk) then
      r <= rin;
    end if;
  end process;

end architecture behavior;
