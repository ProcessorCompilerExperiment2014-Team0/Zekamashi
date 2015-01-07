-------------------------------------------------------------------------------
-- Declaration
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package inputbuf_p is

  type inputbuf_in_t is record
    we   : std_logic;
    en   : std_logic;
    addr : unsigned(9 downto 0);
    data : unsigned(7 downto 0);
  end record inputbuf_in_t;

  type inputbuf_out_t is record
    data : unsigned(7 downto 0);
  end record inputbuf_out_t;

end package inputbuf_p;

-------------------------------------------------------------------------------
-- Definition
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.inputbuf_p.all;

entity inputbuf is
  
  port (
    din  : in  inputbuf_in_t;
    dout : out inputbuf_out_t);

end entity inputbuf;

architecture behavior of inputbuf is

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
