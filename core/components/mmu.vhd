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
      din  : in  zkms_mmu_in_t;
      dout : out zkms_mmu_out_t);
  end component zkms_mmu;

end package zkms_mmu_p;

-------------------------------------------------------------------------------
-- Definition
-------------------------------------------------------------------------------

-- fixme!
