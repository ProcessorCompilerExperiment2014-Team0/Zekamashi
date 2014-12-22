-------------------------------------------------------------------------------
-- Declaration
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package zkms_mmu_p is

  type zkms_mmu_in_t is record
    addr : unsigned(20 downto 0);
    data : unsigned(31 downto 0);
    en   : std_logic;
    we   : std_logic;
  end record zkms_mmu_in_t;

  type zkms_mmu_out_t is record
    data : unsigned(31 downto 0);
    miss : std_logic;
  end record zkms_mmu_out_t;

  component zkms_mmu is
    port (
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

      din  : in  zkms_mmu_in_t;
      dout : out zkms_mmu_out_t);
  end component zkms_mmu;

end package zkms_mmu_p;

-------------------------------------------------------------------------------
-- Definition
-------------------------------------------------------------------------------

-- fixme!
