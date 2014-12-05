library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.zebius_type_p.all;

package zebius_alu_p is

  type alu_inst_t is (
    ALU_INST_NOP,
    ALU_INST_ADD,
    ALU_INST_SUB,
    ALU_INST_AND,
    ALU_INST_OR,
    ALU_INST_NOT,
    ALU_INST_XOR,
    ALU_INST_SHLD,
    ALU_INST_EQ,
    ALU_INST_GT,
    ALU_INST_INC_PC,
    ALU_INST_DISP_PC_L);

  type alu_in_t is record
    inst : alu_inst_t;
    i1   : reg_data_t;
    i2   : reg_data_t;
  end record;

  type alu_out_t is record
    o : reg_data_t;
  end record;

  component zebius_alu
    port ( din  : in  alu_in_t;
           dout : out alu_out_t);
  end component;

end zebius_alu_p;



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.zebius_alu_p.all;
use work.zebius_type_p.all;


entity zebius_alu is
  port ( din  : in  alu_in_t;
         dout : out alu_out_t);
end zebius_alu;


architecture behavior of zebius_alu is

  function alu_add ( a: reg_data_t; b: reg_data_t) return reg_data_t is
  begin return a+b; end;

  function alu_sub ( a: reg_data_t; b: reg_data_t) return reg_data_t is
  begin return a-b; end;

  function alu_and ( a: reg_data_t; b: reg_data_t) return reg_data_t is
  begin return a and b; end;

  function alu_or ( a: reg_data_t; b: reg_data_t) return reg_data_t is
  begin return a or b; end;

  function alu_not ( a: reg_data_t; b: reg_data_t) return reg_data_t is
  begin return not a; end;

  function alu_xor ( a: reg_data_t; b: reg_data_t) return reg_data_t is
  begin return a xor b; end;

  function alu_shld ( a: reg_data_t; b: reg_data_t) return reg_data_t is
    variable c: reg_data_t;
    variable tmp: reg_data_t;
  begin

    if signed(a) > 0 then
      c := shift_left(b, to_integer(a(4 downto 0)));
    elsif a(4 downto 0) = "00000" then
      c := b;
    else
      tmp := unsigned(-signed(a));
      c := shift_right(b, to_integer(tmp(4 downto 0)));
    end if;

    return c;
  end;

  function alu_eq ( a: reg_data_t; b: reg_data_t) return reg_data_t is
  begin
    if a = b then
      return to_unsigned(1, 32);
    else
      return to_unsigned(0, 32);
    end if;
  end;

  function alu_gt ( a: reg_data_t; b: reg_data_t) return reg_data_t is
  begin
    if signed(a) > signed(b) then
      return to_unsigned(1, 32);
    else
      return to_unsigned(0, 32);
    end if;
  end;

  function alu_nop ( a: reg_data_t; b: reg_data_t) return reg_data_t is
  begin return to_unsigned(0, 32); end;


  function alu_inc_pc ( a: reg_data_t; disp: reg_data_t) return reg_data_t is
  begin
    return unsigned(signed(a+4)+signed(disp(11 downto 0))*2);
  end;

  function alu_disp_pc_l ( a: reg_data_t; disp: reg_data_t) return reg_data_t is
  begin
    return unsigned(signed(a and x"fffffffc")+signed(disp(11 downto 0))*4+4);
  end;


begin

  process(din)
  begin
    case din.inst is
      when ALU_INST_ADD  => dout.o <= alu_add(din.i1, din.i2);
      when ALU_INST_SUB  => dout.o <= alu_sub(din.i1, din.i2);
      when ALU_INST_AND  => dout.o <= alu_and(din.i1, din.i2);
      when ALU_INST_OR   => dout.o <= alu_or(din.i1, din.i2);
      when ALU_INST_NOT  => dout.o <= alu_not(din.i1, din.i2);
      when ALU_INST_XOR  => dout.o <= alu_xor(din.i1, din.i2);
      when ALU_INST_SHLD => dout.o <= alu_shld(din.i1, din.i2);
      when ALU_INST_EQ   => dout.o <= alu_eq(din.i1, din.i2);
      when ALU_INST_GT   => dout.o <= alu_gt(din.i1, din.i2);
      when ALU_INST_INC_PC => dout.o <= alu_inc_pc(din.i1, din.i2);
      when ALU_INST_DISP_PC_L => dout.o <= alu_disp_pc_l(din.i1, din.i2);
      when ALU_INST_NOP => dout.o <= alu_nop(din.i1, din.i2);
    end case;
  end process;

end behavior;
