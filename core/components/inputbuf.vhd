-------------------------------------------------------------------------------
-- Declaration
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package inputbuf_p is

  type inputbuf_in_t is record
    we    : std_logic;
    en    : std_logic;
    addr1 : unsigned(9 downto 0);
    addr2 : unsigned(9 downto 0);
    data1 : unsigned(7 downto 0);
  end record inputbuf_in_t;

  type inputbuf_out_t is record
    data1 : unsigned(7 downto 0);
    data2 : unsigned(7 downto 0);
  end record inputbuf_out_t;

  component inputbuf is
    port (
      clk  : in  std_logic;
      din  : in  inputbuf_in_t;
      dout : out inputbuf_out_t);
  end component inputbuf;

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
    clk  : in  std_logic;
    din  : in  inputbuf_in_t;
    dout : out inputbuf_out_t);

end entity inputbuf;

architecture behavior of inputbuf is

  type ram_t is array (0 to 1023) of unsigned(7 downto 0);
  signal ram : ram_t := (others => (others => '0'));

begin

  process (clk) is
  begin
    if rising_edge(clk) then
      if din.en = '1' then
        if din.we = '1' then
          ram(to_integer(din.addr1)) <= din.data1;
        end if;
        dout.data1 <= ram(to_integer(din.addr1));
        dout.data2 <= ram(to_integer(din.addr2));
      end if;
    end if;
  end process;

end architecture behavior;
