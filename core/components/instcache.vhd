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
use work.instcache_p.all;


entity instcache is
  
  port (
    clk  : in  std_logic;
    din  : in  instcache_in_t;
    dout : out instcache_out_t);

end entity instcache;

architecture behavior of instcache is

  subtype rom_data_t is unsigned(31 downto 0);
  type rom_t is array (0 to 1023) of rom_data_t;

  impure function init_rom(filename: string)
    return rom_t is
    file f : text open read_mode is filename;
    variable tmp : std_logic_vector(31 downto 0);
    variable l : line;
    variable rom : rom_t;
  begin
    for i in rom'range loop
      if not endfile(f) then
        readline(f, l);
        hread(l, tmp);
        rom(i) := unsigned(tmp);
      end if;
    end loop;

    return rom;
  end function;

  signal rom: rom_t := init_rom("components/code.dat");

begin

  process (clk) is
  begin
    if rising_edge(clk) then
      dout.data <= rom(to_integer(din.addr(9 downto 0)));
    end if;
  end process;

end architecture behavior;
