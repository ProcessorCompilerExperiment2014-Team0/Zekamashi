-------------------------------------------------------------------------------
-- Declaration
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package ram_p is

  component blockram_single is
    generic (
      length     : integer;
      width      : integer;
      init_value : unsigned);
    port (
      clk   : in  std_logic;
      en    : in  std_logic;
      we    : in  std_logic;
      addr  : in  unsigned(width - 1 downto 0);
      idata : in  unsigned(length - 1 downto 0);
      odata : out unsigned(length - 1 downto 0));
  end component blockram_single;

  component blockram_dual is
    generic (
      length     : integer;
      width      : integer;
      init_value : unsigned);
    port (
      clk    : in  std_logic;
      en     : in  std_logic;
      we     : in  std_logic;
      addr1  : in  unsigned(width - 1 downto 0);
      addr2  : in  unsigned(width - 1 downto 0);
      idata1 : in  unsigned(length - 1 downto 0);
      odata1 : out unsigned(length - 1 downto 0);
      odata2 : out unsigned(length - 1 downto 0));
  end component blockram_dual;

  component blockram_dual_writefirst is
    generic (
      length     : integer;
      width      : integer;
      init_value : unsigned);
    port (
      clk    : in  std_logic;
      en     : in  std_logic;
      we     : in  std_logic;
      addr1  : in  unsigned(width - 1 downto 0);
      addr2  : in  unsigned(width - 1 downto 0);
      idata1 : in  unsigned(length - 1 downto 0);
      odata1 : out unsigned(length - 1 downto 0);
      odata2 : out unsigned(length - 1 downto 0));
  end component blockram_dual_writefirst;

  component distram_single is
    generic (
      length     : integer;
      width      : integer;
      init_value : unsigned);
    port (
      clk   : in  std_logic;
      we    : in  std_logic;
      addr  : in  unsigned(width - 1 downto 0);
      idata : in  unsigned(length - 1 downto 0);
      odata : out unsigned(length - 1 downto 0));
  end component distram_single;

  component distram_dual is
    generic (
      length     : integer;
      width      : integer;
      init_value : unsigned);
    port (
      clk    : in  std_logic;
      we     : in  std_logic;
      addr1  : in  unsigned(width - 1 downto 0);
      addr2  : in  unsigned(width - 1 downto 0);
      idata1 : in  unsigned(length - 1 downto 0);
      odata1 : out unsigned(length - 1 downto 0);
      odata2 : out unsigned(length - 1 downto 0));
  end component distram_dual;

end package ram_p;

-------------------------------------------------------------------------------
-- Definition
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- blockram-single

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.ram_p.all;

entity blockram_single is

  generic (
    length     : integer;
    width      : integer;
    init_value : unsigned := "0");
  port (
    clk   : in  std_logic;
    en    : in  std_logic;
    we    : in  std_logic;
    addr  : in  unsigned(width - 1 downto 0);
    idata : in  unsigned(length - 1 downto 0);
    odata : out unsigned(length - 1 downto 0));
  
end entity blockram_single;

architecture behavior of blockram_single is

  subtype ram_word_t is unsigned(length - 1 downto 0);
  type ram_array_t is array (0 to 2 ** width - 1) of ram_word_t;

  signal ram : ram_array_t := (others => resize(init_value, length));

begin

  process (clk) is
  begin
    if rising_edge(clk) then
      if en = '1' then
        if we = '1' then
          ram(to_integer(addr)) <= idata;
        end if;
        odata <= ram(to_integer(addr));
      end if;
    end if;
  end process;

end architecture behavior;


-------------------------------------------------------------------------------
-- blockram_dual

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.ram_p.all;

entity blockram_dual is

  generic (
    length     : integer;
    width      : integer;
    init_value : unsigned := "0");
  port (
    clk    : in  std_logic;
    en     : in  std_logic;
    we     : in  std_logic;
    addr1  : in  unsigned(width - 1 downto 0);
    addr2  : in  unsigned(width - 1 downto 0);
    idata1 : in  unsigned(length - 1 downto 0);
    odata1 : out unsigned(length - 1 downto 0);
    odata2 : out unsigned(length - 1 downto 0));
  
end entity blockram_dual;

architecture behavior of blockram_dual is

  subtype ram_word_t is unsigned(length - 1 downto 0);
  type ram_array_t is array (0 to 2 ** width - 1) of ram_word_t;

  signal ram : ram_array_t := (others => resize(init_value, length));

begin

  process (clk) is
  begin
    if rising_edge(clk) then
      if en = '1' then
        if we = '1' then
          ram(to_integer(addr1)) <= idata1;
        end if;
        odata1 <= ram(to_integer(addr1));
        odata2 <= ram(to_integer(addr2));
      end if;
    end if;
  end process;

end architecture behavior;


-------------------------------------------------------------------------------
-- blockram_dual_writefirst

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.util_p.all;
use work.ram_p.all;

entity blockram_dual_writefirst is

  generic (
    length     : integer;
    width      : integer;
    init_value : unsigned := "0");
  port (
    clk    : in  std_logic;
    en     : in  std_logic;
    we     : in  std_logic;
    addr1  : in  unsigned(width - 1 downto 0);
    addr2  : in  unsigned(width - 1 downto 0);
    idata1 : in  unsigned(length - 1 downto 0);
    odata1 : out unsigned(length - 1 downto 0);
    odata2 : out unsigned(length - 1 downto 0));
  
end entity blockram_dual_writefirst;

architecture behavior of blockram_dual_writefirst is

  signal odata2_rf : unsigned(length - 1 downto 0);

  type latch_t is record
    hit       : std_logic;
    data      : unsigned(length - 1 downto 0);
  end record latch_t;

  constant latch_init : latch_t := (
    hit => '0',
    data => (others => '-'));

  signal r, rin : latch_t := latch_init;

begin

  readfirst : blockram_dual
    generic map (
      length     => length,
      width      => width,
      init_value => init_value)
    port map (
      clk    => clk,
      en     => en,
      we     => we,
      addr1  => addr1,
      addr2  => addr2,
      idata1 => idata1,
      odata1 => odata1,
      odata2 => odata2_rf);

  process (r, en, we, addr1, addr2, idata1, odata2_rf) is
    variable v : latch_t;
  begin
    v := r;

    -- input
    if en = '1' then
      v.data := idata1;

      if we = '1'
        and (not is_metavalue(addr1))
        and (not is_metavalue(addr2))
        and addr1 = addr2 then
        v.hit := '1';
      else
        v.hit := '0';
      end if;
    end if;

    -- output
    if r.hit = '1' then
      odata2 <= r.data;
    else
      odata2 <= odata2_rf;
    end if;

    rin <= v;
  end process;

  process (clk) is
  begin
    if rising_edge(clk) then
      r <= rin;
    end if;
  end process;

end architecture behavior;


-------------------------------------------------------------------------------
-- distram_single

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.ram_p.all;

entity distram_single is

  generic (
    length     : integer;
    width      : integer;
    init_value : unsigned := "0");
  port (
    clk   : in  std_logic;
    we    : in  std_logic;
    addr  : in  unsigned(width - 1 downto 0);
    idata : in  unsigned(length - 1 downto 0);
    odata : out unsigned(length - 1 downto 0));
  
end entity distram_single;

architecture behavior of distram_single is

  subtype ram_word_t is unsigned(length - 1 downto 0);
  type ram_array_t is array (0 to 2 ** width - 1) of ram_word_t;

  signal ram : ram_array_t := (others => resize(init_value, length));

begin

  process (clk) is
  begin
    if rising_edge(clk) then
      if we = '1' then
        ram(to_integer(addr)) <= idata;
      end if;
    end if;
  end process;

  odata <= ram(to_integer(addr));

end architecture behavior;

-------------------------------------------------------------------------------
-- distram_dual

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.ram_p.all;

entity distram_dual is

  generic (
    length     : integer;
    width      : integer;
    init_value : unsigned := "0");
  port (
    clk    : in  std_logic;
    we     : in  std_logic;
    addr1  : in  unsigned(width - 1 downto 0);
    addr2  : in  unsigned(width - 1 downto 0);
    idata1 : in  unsigned(length - 1 downto 0);
    odata1 : out unsigned(length - 1 downto 0);
    odata2 : out unsigned(length - 1 downto 0));
  
end entity distram_dual;

architecture behavior of distram_dual is

  subtype ram_word_t is unsigned(length - 1 downto 0);
  type ram_array_t is array (0 to 2 ** width - 1) of ram_word_t;

  signal ram : ram_array_t := (others => resize(init_value, length));

begin

  process (clk) is
  begin
    if rising_edge(clk) then
      if we = '1' then
        ram(to_integer(addr1)) <= idata1;
      end if;
    end if;
  end process;

  odata1 <= ram(to_integer(addr1));
  odata2 <= ram(to_integer(addr2));

end architecture behavior;
