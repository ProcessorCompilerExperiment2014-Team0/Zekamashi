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
    FPU_INST_MUL,
    FPU_INST_SUB,
    FPU_INST_EQ,
    FPU_INST_LE,
    FPU_INST_LT,
    FPU_INST_INV,
    FPU_INST_SQRT,
    FPU_INST_FTOI,
    FPU_INST_ITOF);

  type fpu_in_t is record
    stall : std_logic;
    inst  : fpu_inst_t;
    i1    : unsigned(31 downto 0);
    i2    : unsigned(31 downto 0);
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
use work.fadd_pipeline_p.all;
use work.fmul_pipeline_p.all;
use work.fsub_pipeline_p.all;
use work.ftoi_pipeline_p.all;
use work.itof_pipeline_p.all;
use work.feq_pipeline_p.all;
use work.fle_pipeline_p.all;
use work.flt_pipeline_p.all;
use work.finv_p.all;
use work.fsqrt_p.all;

use work.fpu_p.all;

entity fpu is
  port (
    clk  : in  std_logic;
    xrst : in  std_logic;
    din  : in  fpu_in_t;
    dout : out fpu_out_t);
end fpu;

architecture behavior of fpu is

  signal s_add  : unsigned(31 downto 0);
  signal s_mul  : unsigned(31 downto 0);
  signal s_sub  : unsigned(31 downto 0);
  signal s_eq   : unsigned(31 downto 0);
  signal s_le   : unsigned(31 downto 0);
  signal s_lt   : unsigned(31 downto 0);
  signal s_inv  : unsigned(31 downto 0);
  signal s_sqrt : unsigned(31 downto 0);
  signal s_ftoi : unsigned(31 downto 0);
  signal s_itof : unsigned(31 downto 0);

  type latch_t is record
    inst0 : fpu_inst_t;
    inst1 : fpu_inst_t;
  end record latch_t;

  constant latch_init : latch_t := (
    inst0 => FPU_INST_NOP,
    inst1 => FPU_INST_NOP);

  signal r, rin : latch_t := latch_init;

begin

  add : fadd_pipeline port map (
    clk   => clk,
    xrst  => xrst,
    stall => din.stall,
    a     => din.i1,
    b     => din.i2,
    s     => s_add);

  mul : fmul_pipeline port map (
    clk   => clk,
    xrst  => xrst,
    stall => din.stall,
    a     => din.i1,
    b     => din.i2,
    s     => s_mul);

  sub : fsub_pipeline port map (
    clk   => clk,
    xrst  => xrst,
    stall => din.stall,
    a     => din.i1,
    b     => din.i2,
    s     => s_sub);

  eq : feq_pipeline port map (
    clk   => clk,
    xrst  => xrst,
    stall => din.stall,
    a     => din.i1,
    b     => din.i2,
    s     => s_eq);

  le : fle_pipeline port map (
    clk   => clk,
    xrst  => xrst,
    stall => din.stall,
    a     => din.i1,
    b     => din.i2,
    s     => s_le);

  lt : flt_pipeline port map (
    clk   => clk,
    xrst  => xrst,
    stall => din.stall,
    a     => din.i1,
    b     => din.i2,
    s     => s_lt);

  ftoi : ftoi_pipeline port map (
    clk   => clk,
    xrst  => xrst,
    stall => din.stall,
    a     => din.i2,
    s     => s_ftoi);

  itof : itof_pipeline port map (
    clk   => clk,
    xrst  => xrst,
    stall => din.stall,
    a     => din.i2,
    s     => s_itof);

  inv : finv port map (
    clk   => clk,
    xrst  => xrst,
    stall => din.stall,
    a     => din.i2,
    s     => s_inv);

  sqrt : fsqrt port map (
    clk   => clk,
    xrst  => xrst,
    stall => din.stall,
    a     => din.i2,
    s     => s_sqrt);

  comb: process (r, din, s_add, s_mul, s_sub, s_eq, s_le, s_lt, s_inv, s_sqrt, s_ftoi, s_itof) is
    variable v : latch_t;
  begin
    v := r;

    v.inst0 := din.inst;
    v.inst1 := r.inst0;

    case r.inst1 is
      when FPU_INST_NOP  => dout.o <= (others => '-');
      when FPU_INST_ADD  => dout.o <= s_add;
      when FPU_INST_MUL  => dout.o <= s_mul;
      when FPU_INST_SUB  => dout.o <= s_sub;
      when FPU_INST_EQ   => dout.o <= s_eq;
      when FPU_INST_LE   => dout.o <= s_le;
      when FPU_INST_LT   => dout.o <= s_lt;
      when FPU_INST_INV  => dout.o <= s_inv;
      when FPU_INST_SQRT => dout.o <= s_sqrt;
      when FPU_INST_FTOI => dout.o <= s_ftoi;
      when FPU_INST_ITOF => dout.o <= s_itof;
    end case;

    rin <= v;
  end process comb;

  seq: process (clk, xrst) is
  begin
    if xrst = '0' then
      r <= latch_init;
    elsif rising_edge(clk) then
      r <= rin;
    end if;
  end process seq;

end behavior;
