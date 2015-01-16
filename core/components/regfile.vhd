-------------------------------------------------------------------------------
-- Declaration
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package regfile_p is

  subtype reg_index_t is integer range 0 to 31;

  type regfile_in_t is record
    r1   : reg_index_t;
    r2   : reg_index_t;
    w    : reg_index_t;
    d    : unsigned(31 downto 0);
    dump : std_logic;
  end record regfile_in_t;

  type regfile_out_t is record
    d1 : unsigned(31 downto 0);
    d2 : unsigned(31 downto 0);
  end record regfile_out_t;

  component regfile is
    port (
      clk  : in  std_logic;
      xrst : in  std_logic;
      din  : in  regfile_in_t;
      dout : out regfile_out_t);
  end component regfile;

end package regfile_p;

-------------------------------------------------------------------------------
-- Definition
-------------------------------------------------------------------------------

library std;
use std.textio.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

library work;
use work.regfile_p.all;

entity regfile is
  port (
    clk  : in  std_logic;
    xrst : in  std_logic;
    din  : in  regfile_in_t;
    dout : out regfile_out_t);
end entity regfile;

architecture behavior of regfile is

  type ram_t is array (0 to 30) of unsigned(31 downto 0);
  signal ram : ram_t := (others => (others => '0'));

begin

  seq: process (clk, xrst) is
  begin
    if xrst = '0' then
      ram <= (others => (others => '0'));
    elsif rising_edge(clk) then
      if din.w /= 31 then
        ram(din.w) <= din.d;
      end if;
    end if;
  end process seq;

  dout.d1 <= (others => '0') when din.r1 = 31 else
             ram(din.r1);
  dout.d2 <= (others => '0') when din.r2 = 31 else
             ram(din.r2);

end architecture behavior;
