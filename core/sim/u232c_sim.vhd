-------------------------------------------------------------------------------
-- Declaraion
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.zkms_u232c_in_p.all;
use work.zkms_u232c_out_p.all;

package zkms_u232c_sim_p is

  component u232c_in_sim is
    generic (
      report_read : boolean := false);
    port (
      clk  : in  std_logic;
      din  : in  u232c_in_in_t;
      dout : out u232c_in_out_t);
  end component u232c_in_sim;

  component u232c_out_sim is
    generic (
      report_write : boolean := false);
    port (
      clk  : in  std_logic;
      din  : in  u232c_out_in_t;
      dout : out u232c_out_out_t);
  end component u232c_out_sim;

  function byte_to_string (v : std_logic_vector(7 downto 0)) return string;

end package zkms_u232c_sim_p;

-------------------------------------------------------------------------------
-- Definition
-------------------------------------------------------------------------------

package body zkms_u232c_sim_p is

  function byte_to_string (
    v : std_logic_vector(7 downto 0))
    return string is
    constant c : string := "0123456789ABCDEF";
    variable s : string(1 to 2);
  begin
--    s(0) := c(to_integer(v(15 downto 8)));
--    s(1) := c(to_integer(v(7 downto 0)));
    s := "hg";                          --fixme
    return s;
  end function byte_to_string;

end package body zkms_u232c_sim_p;

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
use work.zkms_u232c_in_p.all;
use work.zkms_u232c_out_p.all;
use work.zkms_u232c_sim_p.all;

entity u232c_in_sim is
    generic (
      report_read : boolean := false);
    port (
      clk  : in  std_logic;
      din  : in  u232c_in_in_t;
      dout : out u232c_in_out_t);
end entity u232c_in_sim;

architecture simulation of u232c_in_sim is

begin

  process (clk) is
    variable l : line;
    variable v : std_logic_vector(7 downto 0);
  begin
    if rising_edge(clk) then
      if din.rden = '1' then
        if endfile(input) then
          dout.empty <= '1';
          dout.data  <= (others => '1');
        else
          readline(input, l);
          hread(l, v);
          dout.empty <= '0';
          dout.data  <= unsigned(v);
          assert not report_read report "read: " & byte_to_string(v) severity note;
        end if;
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
use work.zkms_u232c_in_p.all;
use work.zkms_u232c_out_p.all;
use work.zkms_u232c_sim_p.all;

entity u232c_out_sim is
  generic (
    report_write : boolean := false);
  port (
    clk  : in  std_logic;
    din  : in  u232c_out_in_t;
    dout : out u232c_out_out_t);
end entity u232c_out_sim;

architecture simulation of u232c_out_sim is
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
        writeline(output, l);
        assert not report_write report "write: " & byte_to_string(v) severity note;
      end if;
    end if;
  end process;

end architecture simulation;
