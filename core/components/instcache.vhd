-------------------------------------------------------------------------------
-- Declaration
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

package zkms_instcache_p is

  type zkms_instcache_in_t is record
    addr : unsigned(16 downto 0);
  end record zkms_instcache_in_t;

  type zkms_instcache_out_t is record
    data : unsigned(31 downto 0);
  end record zkms_instcache_out_t;

  component zkms_instcache is
    port (
      clk  : in  std_logic;
      din  : in  zkms_instcache_in_t;
      dout : out zkms_instcache_out_t);
  end component zkms_instcache;

end package zkms_intcache_p;

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
use work.zkms_instcache_p.all;


entity zkms_instcache is
  
  port (
    clk  : in  std_logic;
    din  : in  zkms_instcache_in_t;
    dout : out zkms_instcache_out_t);

end entity zkms_instcache;

architecture behavior of zkms_instcache is

  subtype rom_data_t is unsigned 31 downto 0;
  type rom_t is array (0 to 1023) of rom_data_t;

  impure function init_rom(filename: string)
    return rom_t is
    file f : text open read_mode is filename;
    variable tmp : std_logic_vector(35 downto 0);
    variable l : line;
    variable rom : rom_t;
  begin
    for i in rom'range loop
      readline(f, l);
      hread(l, hoge);
      rom(i) := unsigned(hoge);
    end loop;

    return rom;
  end function;

  signal rom: rom_t := init_rom("code.dat");

begin

  process (clk) is
  begin
    if rising_edge(clk) then
      data <= rom(addr);
    end if;
  end process;

end architecture behavior;
