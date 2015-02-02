-------------------------------------------------------------------------------
-- Declaration
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package instcache_p is

  type instcache_in_t is record
    addr : unsigned(16 downto 0);
  end record instcache_in_t;

  type instcache_out_t is record
    data : unsigned(31 downto 0);
  end record instcache_out_t;

  component instcache is
    port (
      clk  : in  std_logic;
      din  : in  instcache_in_t;
      dout : out instcache_out_t);
  end component instcache;

end package instcache_p;

-------------------------------------------------------------------------------
-- Definition
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

library work;
use work.meminit_p.all;
use work.instcache_p.all;

entity instcache is
  
  port (
    clk  : in  std_logic;
    din  : in  instcache_in_t;
    dout : out instcache_out_t);

end entity instcache;

architecture behavior of instcache is

  signal rom: icache_init_t := icache_init;

begin

  process (clk) is
  begin
    if rising_edge(clk) then
      dout.data <= rom(to_integer(din.addr(9 downto 0)));
    end if;
  end process;

end architecture behavior;
