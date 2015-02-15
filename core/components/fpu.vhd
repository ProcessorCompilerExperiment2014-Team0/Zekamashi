-------------------------------------------------------------------------------
-- FPU
--  latency: 2clk
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Declaration
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package fpu_p is

  type fpu_inst_t is (
    FPU_INST_NOP,

    FPU_INST_ADD,
    FPU_INST_SUB,
    FPU_INST_INV,
    FPU_INST_MUL,
    FPU_INST_NEG,
    FPU_INST_EQ,
    FPU_INST_LE,
    FPU_INST_LT,
    FPU_INST_SQRT,
    FPU_INST_ITOF,
    FPU_INST_FTOI);

  type fpu_in_t is record
    inst : fpu_inst_t;
    i1   : unsigned(31 downto 0);
    i2   : unsigned(31 downto 0);
  end record;

  type fpu_out_t is record
    o : unsigned(31 downto 0);
  end record;

  component fpu
    port (
      clk  : in  std_logic;
      xrst : in  std_logic;
      din  : in  fpu_in_t;
      dout : out fpu_out_t);
  end component;

end fpu_p;

-------------------------------------------------------------------------------
-- Definition
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
--use work.fpu_common_p.all;
--use work.fadd_p.all;
--use work.fcmp_p.all;
--use work.fdiv_p.all;
--use work.fneg_p.all;
--use work.fmul_p.all;
--use work.fsqrt_p.all;
--use work.fsub_p.all;
--use work.ftoi_p.all;
--use work.itof_p.all;

use work.fpu_p.all;

entity fpu is
  port (
    clk  : in  std_logic;
    xrst : in  std_logic;
    din  : in  fpu_in_t;
    dout : out fpu_out_t);
end fpu;

architecture behavior of fpu is

begin

  -- fixme

end behavior;
