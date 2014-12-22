-------------------------------------------------------------------------------
-- Declaraion
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.zkms_u232c_in_p.all;
use work.zkms_u232c_out_p.all;

package zkms_u232c_sim_p is

  component u232c_in_sim is
    generic (
      report_read : boolean := false;
    port (
      clk  : in  std_logic;
      din  : in  u232c_in_in_t;
      dout : out u232c_in_out_t);
  end component u232c_out_sim;

  component u232c_out_sim is
    generic (
      report_write : boolean := false;
    port (
      clk  : in  std_logic;
      din  : in  u232c_out_in_t;
      dout : out u232c_out_out_t);
  end component u232c_out_sim;

end package zkms_u232c_sim_p;

-------------------------------------------------------------------------------
-- Definition
-------------------------------------------------------------------------------

library std;
use std.textio.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

-------------------------------------------------------------------------------
-- Input
-------------------------------------------------------------------------------

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

  -- fixme

end architecture simulation;

-------------------------------------------------------------------------------
-- Output
-------------------------------------------------------------------------------

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

  -- fixme

end architecture simulation;
