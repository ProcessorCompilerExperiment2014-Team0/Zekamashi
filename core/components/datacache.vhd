-------------------------------------------------------------------------------
-- Cache Memory
-- * 128 Line
-- * 8 word(32 byte) per line
-- * total 32KiB
-- * direct mapped
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Declaration
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package zkms_datacache_p is

  type zkms_datacache_in_t is record
    addr : unsigned(19 downto 0);
    data : unsigned(31 downto 0);
    en   : std_logic;
    we   : std_logic;
  end record zkms_datacache_in_t;

  type zkms_datacache_out_t is record
    data : unsigned(31 downto 0);
    miss : std_logic;
  end record zkms_datacache_out_t;

  component zkms_datacache is
    port (
      clk    : in    std_logic;
      rst    : in    std_logic;

      zd     : inout std_logic_vector(31 downto 0);
      zdp    : inout std_logic_vector(3 downto 0);
      za     : out   std_logic_vector(19 downto 0);
      xe1    : out   std_logic;
      e2a    : out   std_logic;
      xe3    : out   std_logic;
      xzbe   : out   std_logic_vector(3 downto 0);
      xga    : out   std_logic;
      xwa    : out   std_logic;
      xzcke  : out   std_logic;
      zclkma : out   std_logic_vector(1 downto 0);
      adva   : out   std_logic;
      xft    : out   std_logic;
      xlbo   : out   std_logic;
      zza    : out   std_logic;

      din    : in    zkms_datacache_in_t;
      dout   : out   zkms_datacache_out_t);
  end component zkms_datacache;

end package zkms_datacache_p;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package zkms_datacache_internal_p is

  subtype word_t is unsigned(31 downto 0);

  type cachetable_in_t is record
    we   : std_logic;
    en   : std_logic;
    addr : unsigned(9 downto 0);
    data : word_t;
  end record cachetable_in_t;

  type cachetable_out_t is record
    data : word_t;
  end record cachetable_out_t;

  component cachetable is
    port (
      clk  : in  std_logic;
      din  : in  cachetable_in_t;
      dout : out cachetable_out_t);
  end component cachetable;

end package zkms_datacache_internal_p;

-------------------------------------------------------------------------------
-- Cache table
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.zkms_datacache_internal_p.all;

entity cachetable is

  port (
    clk  : in  std_logic;
    din  : in  cachetable_in_t;
    dout : out cachetable_out_t);

end entity cachetable;

architecture behavior of cachetable is

  type ram_t is array (0 to 1023) of word_t;
  signal ram : ram_t := (others => (others => '0'));

begin

  process (clk) is
  begin
    if rising_edge(clk) then
      if din.en = '1' then
        if din.we = '1' then
          ram(to_integer(din.addr)) <= din.data;
        end if;
        dout.data <= ram(to_integer(din.addr));
      end if;
    end if;
  end process;

end architecture behavior;

-------------------------------------------------------------------------------
-- implementation
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.zkms_datacache_p.all;
use work.zkms_datacache_internal_p.all;

entity zkms_datacache is
  port (
    clk    : in    std_logic;
    rst    : in    std_logic;

    zd     : inout std_logic_vector(31 downto 0);
    zdp    : inout std_logic_vector(3 downto 0);
    za     : out   std_logic_vector(19 downto 0);
    xe1    : out   std_logic;
    e2a    : out   std_logic;
    xe3    : out   std_logic;
    xzbe   : out   std_logic_vector(3 downto 0);
    xga    : out   std_logic;
    xwa    : out   std_logic;
    xzcke  : out   std_logic;
    zclkma : out   std_logic_vector(1 downto 0);
    adva   : out   std_logic;
    xft    : out   std_logic;
    xlbo   : out   std_logic;
    zza    : out   std_logic;

    din    : in    zkms_datacache_in_t;
    dout   : out   zkms_datacache_out_t);
end entity zkms_datacache;

architecture behavior of zkms_datacache is

  subtype tag_t is unsigned(9 downto 0);
  type tagarray_t is array (0 to 127) of tag_t;
  signal tagarray : tagarray_t := (others => (others => '0'));
  signal cache_in : cachetable_in_t;
  signal cache_out : cachetable_out_t;

  type latch_t is record
    miss : std_logic;
  end record latch_t;

  signal r, rin : latch_t := (miss => '0');

begin

  cache : cachetable
    port map (
      clk  => clk,
      din  => cache_in,
      dout => cache_out);

  process (din, cache_in, r) is
    variable v  : latch_t;
    variable dv : zkms_datacache_out_t;
    variable cv : cachetable_in_t;

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
