-------------------------------------------------------------------------------
-- Declaration
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package alu_p is

  type alu_inst_t is (
    ALU_INST_NOP,
    ALU_INST_ADD,
    ALU_INST_SUB,
    ALU_INST_EQ,
    ALU_INST_LE,
    ALU_INST_LT,
    ALU_INST_AND,
    ALU_INST_OR,
    ALU_INST_XOR,
    ALU_INST_EQV,
    ALU_INST_NOT,
    ALU_INST_SLL,
    ALU_INST_SRL,
    ALU_INST_SRA);

  type alu_in_t is record
    inst : alu_inst_t;
    i1   : unsigned(31 downto 0);
    i2   : unsigned(31 downto 0);
  end record;

  type alu_out_t is record
    o : unsigned(31 downto 0);
  end record;

  component alu
    port (
      din  : in  alu_in_t;
      dout : out alu_out_t);
  end component;

end alu_p;

-------------------------------------------------------------------------------
-- Definition
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.alu_p.all;

entity alu is
  port (
    din  : in  alu_in_t;
    dout : out alu_out_t);
end entity alu;

architecture behavior of alu is
begin

  process (din) is
    variable i1, i2 : unsigned(31 downto 0);
    variable o : unsigned(31 downto 0);
  begin
    i1 := din.i1;
    i2 := din.i2;
    
    case din.inst is
      when ALU_INST_NOP => o := to_unsigned(0, 32);
      when ALU_INST_ADD => o := i1 + i2;
      when ALU_INST_SUB => o := i1 - i2;
      when ALU_INST_EQ  => if i1 =  i2 then o := to_unsigned(1, 32); else o := to_unsigned(0, 32); end if;
      when ALU_INST_LE  => if i1 <= i2 then o := to_unsigned(1, 32); else o := to_unsigned(0, 32); end if;
      when ALU_INST_LT  => if i1 <  i2 then o := to_unsigned(1, 32); else o := to_unsigned(0, 32); end if;
      when ALU_INST_AND => o := i1 and i2;
      when ALU_INST_OR  => o := i1 or  i2;
      when ALU_INST_XOR => o := i1 xor i2;
      when ALU_INST_EQV => o := i1 xor not i2;
      when ALU_INST_NOT => o := not i1;
      when ALU_INST_SLL => o := shift_left(i1, to_integer(i2(4 downto 0)));
      when ALU_INST_SRL => o := shift_right(i1, to_integer(i2(4 downto 0)));
      when ALU_INST_SRA => o := unsigned(shift_right(signed(i1), to_integer(i2(4 downto 0))));
    end case;

    dout.o <= o;
  end process;

end architecture behavior;
