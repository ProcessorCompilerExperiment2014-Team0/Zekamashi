library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package blockram_p is

  type blockram_in_t is record
    we : std_logic;
    en : std_logic;
    addr : unsigned(7 downto 0);
    data : unsigned(31 downto 0);
  end record;

  type blockram_out_t is record
    data : unsigned(31 downto 0);
  end record;

  component blockram is
    port (
      clk : in std_logic;
      din : in blockram_in_t;
      dout : out blockram_out_t);
  end component;

end blockram_p;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.blockram_p.all;

entity blockram is
  port (
    clk : in std_logic;
    din : in blockram_in_t;
    dout : out blockram_out_t);
end blockram;


architecture syn of blockram is
  type ram_type is array (255 downto 0) of unsigned(31 downto 0);
  signal RAM: ram_type := (
    0 => x"E10AE001", -- MOV     #1, R0    ;; .start : MOV     #10, R1
    1 => x"E100401D", -- SHLD    R1, R0 : MOV     #0, R1
    2 => x"E308E204", -- MOV     #4, R2 : MOV     #8, R3
    3 => x"E6006403", -- MOV     R0, R4 : MOV     #0, R6
    4 => x"3287E800", -- MOV     #0, R8 : CMP/GT  R8, R2    ;; .read_length
    5 => x"05018B04", -- BF      .read_program : READ    R5
    6 => x"265B463D", -- SHLD    R3, R6 : OR      R5, R6
    7 => x"AFF87801", -- ADD     #1, R8 : BRA     .read_length
    8 => x"8B0E3617", -- CMP/GT  R1, R6    ;; .read_program : BF      .run_program
    9 => x"E700E800", -- MOV     #0, R8 : MOV     #0, R7
    10 => x"3287E900", -- MOV     #0, R9 : CMP/GT  R8, R2    ;; .read_data
    11 => x"05018B05", -- BF      .store_data : READ    R5
    12 => x"275B459D", -- SHLD    R9, R5 : OR      R5, R7
    13 => x"78017908", -- ADD     #8, R9 : ADD     #1, R8
    14 => x"2472AFF7", -- BRA     .read_data : MOV.L   R7, @R4    ;; .store_data
    15 => x"76FC7404", -- ADD     #4, R4 : ADD     #-4, R6
    16 => x"9701AFEE", -- BRA     .read_program : MOV.L   .exit_code, R7    ;; .run_program
    17 => x"402B2472", -- MOV.L   R7, @R4 : JMP     @R0
    18 => x"0000AFFE", -- .data.l #45054    ;; .exit_code
    others => x"00000000");
begin

  process(clk)
  begin
    if rising_edge(clk) then
      if din.en = '1' then
        if din.we = '1' then
          RAM(to_integer(din.addr)) <= din.data;
        end if;
        dout.data <= RAM(to_integer(din.addr));
      end if;
    end if;
  end process;

end syn;
