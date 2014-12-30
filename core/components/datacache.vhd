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
  end component zkms_dataccache;

end package zkms_datacache_p;

-------------------------------------------------------------------------------
-- Definition
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.zkms_datacache_p.all;

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
end entity zkms_dataccache;

architecture behavior of zkms_datacache is

begin

  

end architecture behavior;
