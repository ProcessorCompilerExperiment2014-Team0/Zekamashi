-------------------------------------------------------------------------------
-- Declaraion
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.u232c_in_p.all;
use work.u232c_out_p.all;

package u232c_nobusy_p is

  component u232c_in_nobusy is
    generic (
      i : string);
    port (
      clk  : in  std_logic;
      xrst : in  std_logic;
      din  : in  u232c_in_in_t;
      dout : out u232c_in_out_t);
  end component u232c_in_nobusy;

  component u232c_out_nobusy is
    generic (
      o : string);
    port (
      clk  : in  std_logic;
      xrst : in  std_logic;
      din  : in  u232c_out_in_t;
      dout : out u232c_out_out_t);
  end component u232c_out_nobusy;

end package u232c_nobusy_p;

-------------------------------------------------------------------------------
-- Definition
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Input
-------------------------------------------------------------------------------

library std;
use std.textio.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

library work;
use work.u232c_in_p.all;
use work.u232c_out_p.all;
use work.u232c_nobusy_p.all;

entity u232c_in_nobusy is
    generic (
      i : string);
    port (
      clk  : in  std_logic;
      xrst : in  std_logic;
      din  : in  u232c_in_in_t;
      dout : out u232c_in_out_t);
end entity u232c_in_nobusy;

architecture simulation of u232c_in_nobusy is
  file ifile : text open read_mode is i;
begin

  process (clk) is
    variable l : line;
    variable v : std_logic_vector(7 downto 0);
  begin
    if rising_edge(clk) then
      if din.rden = '1' then
        if endfile(ifile) then
          dout.data  <= (others => '1');
        else
          readline(ifile, l);
          hread(l, v);
          dout.data  <= unsigned(v);
        end if;
      end if;

      if endfile(ifile) then
        dout.empty <= '1';
      else
        dout.empty <= '0';
      end if;
    end if;
  end process;

end architecture simulation;

-------------------------------------------------------------------------------
-- Output
-------------------------------------------------------------------------------

library std;
use std.textio.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

library work;
use work.u232c_in_p.all;
use work.u232c_out_p.all;
use work.u232c_nobusy_p.all;

entity u232c_out_nobusy is
  generic (
    o : string);
  port (
    clk  : in  std_logic;
    xrst : in  std_logic;
    din  : in  u232c_out_in_t;
    dout : out u232c_out_out_t);
end entity u232c_out_nobusy;

architecture simulation of u232c_out_nobusy is
  file ofile : text open write_mode is o;
begin

  dout.busy <= '0';

  process (clk) is
    variable l : line;
    variable v : std_logic_vector(7 downto 0);
  begin
    if rising_edge(clk) then
      if din.go = '1' then
        v := std_logic_vector(din.data);
        hwrite(l, v);
        writeline(ofile, l);
      end if;
    end if;
  end process;

end architecture simulation;
