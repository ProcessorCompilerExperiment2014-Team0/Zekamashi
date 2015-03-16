-------------------------------------------------------------------------------
-- Declaration
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package instcache_p is

  type instcache_read_in_t is record
    addr : unsigned(13 downto 0);
  end record instcache_read_in_t;

  type instcache_read_out_t is record
    data : unsigned(31 downto 0);
  end record instcache_read_out_t;

  type instcache_write_in_t is record
    we   : std_logic;
    addr : unsigned(13 downto 0);
    data : unsigned(31 downto 0);
  end record instcache_write_in_t;

  type instcache_write_out_t is record
    data : unsigned(31 downto 0);
  end record instcache_write_out_t;

  component instcache is
    port (
      clk  : in  std_logic;
      din  : in  instcache_read_in_t;
      dout : out instcache_read_out_t;
      ein  : in  instcache_write_in_t;
      eout : out instcache_write_out_t);
  end component instcache;

end package instcache_p;

-------------------------------------------------------------------------------
-- Definition
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.instcache_p.all;
use work.meminit_p.all;

entity instcache is
  port (
    clk  : in  std_logic;
    din  : in  instcache_read_in_t;
    dout : out instcache_read_out_t;
    ein  : in  instcache_write_in_t;
    eout : out instcache_write_out_t);
end entity instcache;

architecture behavior of instcache is

  signal ram : icache_init_t := icache_init;

begin

  process (clk) is
  begin
    if rising_edge(clk) then
      if ein.we = '1' then
        ram(to_integer(ein.addr)) <= ein.data;
      end if;
      dout.data <= ram(to_integer(din.addr));
      eout.data <= ram(to_integer(ein.addr));
    end if;
  end process;

end architecture behavior;
