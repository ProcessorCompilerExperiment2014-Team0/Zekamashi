-------------------------------------------------------------------------------
-- Declaration
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package datacache_ram_p is

  subtype word_t is unsigned(31 downto 0);

  type datacache_ram_in_t is record
    we   : std_logic;
    en   : std_logic;
    addr : unsigned(9 downto 0);
    data : word_t;
  end record datacache_ram_in_t;

  type datacache_ram_out_t is record
    data : word_t;
  end record datacache_ram_out_t;

  component datacache_ram is
    port (
      clk  : in  std_logic;
      din  : in  datacache_ram_in_t;
      dout : out datacache_ram_out_t);
  end component datacache_ram;

end package datacache_ram_p;

-------------------------------------------------------------------------------
-- Definition
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.datacache_ram_p.all;

entity datacache_ram is

  port (
    clk  : in  std_logic;
    din  : in  datacache_ram_in_t;
    dout : out datacache_ram_out_t);

end entity datacache_ram;

architecture behavior of datacache_ram is

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
