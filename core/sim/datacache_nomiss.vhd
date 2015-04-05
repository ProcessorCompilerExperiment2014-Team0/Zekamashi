-------------------------------------------------------------------------------
-- Datacache_nomiss
--   Debug component for check useage of datacache
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Declaration
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.datacache_p.all;

package datacache_nomiss_p is

  component datacache_nomiss is
    port (
      clk  : in std_logic;
      xrst : in std_logic;

      din  : in  datacache_in_t;
      dout : out datacache_out_t);
  end component datacache_nomiss;

end package datacache_nomiss_p;

-------------------------------------------------------------------------------
-- Definition
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

library work;
use work.datacache_p.all;

entity datacache_nomiss is
  port (
    clk : in std_logic;
    xrst : in std_logic;

    din  : in  datacache_in_t;
    dout : out datacache_out_t);
end entity datacache_nomiss;

architecture simulation of datacache_nomiss is

begin

  dout.miss <= '0';

  process (clk, xrst) is
    type ram_t is array (0 to 1048575) of unsigned(31 downto 0);
    variable ram : ram_t;
  begin
    if xrst = '0' then
      null;
    elsif rising_edge(clk) then
      if din.en = '1' then
        if din.we = '1' then
          ram(to_integer(din.addr)) := din.data;
        else
          dout.data <= ram(to_integer(din.addr));
        end if;
      end if;
    end if;
  end process;

end architecture simulation;
