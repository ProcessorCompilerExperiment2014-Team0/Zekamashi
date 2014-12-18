
-------------------------------------------------------------------------------
-- Declaration
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.zkms_instcache_p.all;
use work.zkms_alu_p.all;

package zkms_core_p is

  type zkms_core_in_t is record
    instcache : zkms_instcache_out_t;
    alu       : zkms_alu_out_t;
  end record zkms_core_in_t;

  type zkms_core_out_t is record
    instcache : zkms_instcache_in_t;
    alu       : zkms_alu_in_t;
  end record zkms_core_out_t;

  component zkms_core is
    port (
      clk  : in  std_logic;
      din  : in  zkms_core_in_t;
      dout : out zkms_core_out_t);
  end component zekamashi_core;

end package zkms_core_p;

-------------------------------------------------------------------------------
-- Definition
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.zkms_core_p.all;
use work.zkms_instcache_p.all;
use work.zkms_alu_p.all;

entity zkms_core is
  port (
    clk  : in  std_logic;
    din  : in  zkms_core_in_t;
    dout : out zkms_core_out_t);
end entity zkms_core;

architecture behavior of zkms_core is

  type opmode_t is (
    OP_NOP,
    OP_LOAD,
    OP_STORE,
    OP_ALU,
    OP_FPU,
    OP_BRA,
    OP_JMP);

  type latch_ifid_t is record
    pc : unsigned(31 downto 0);
  end record latch_ifid_t;

  type latch_idexe_t is record
    pc       : unsigned(31 downto 0);
    i1       : unsigned(31 downto 0);
    i2       : unsigned(31 downto 0);
    wb       : integer range 0 to 63;
    alu_inst : alu_inst_t;
    opmode   : opmode_t;
  end record latch_idexe_t;

  type latch_exemem_t is record
    pc     : unsigned(31 downto 0);
    wb     : integer range 0 to 63;
    data   : unsigned(31 downto 0);
    opmode : opmode_t;
  end record latch_exemem_t;

  type latch_memwb_t is record
    wb     : integer range 0 to 63;
    data   : unsigned(31 downto 0);
    opmode : opmode_t;
  end record latch_memwb_t;


  type latch_t is record
    -- program counter
    pc : unsigned(31 downt0o 0);
    -- register file
    --- 0-31  : integer register
    --- 32-63 : floating-point register
    rf : array(0 to 63) of unsigned(31 downto 0);
    -- latches
    d  : latch_ifid_t;
    e  : latch_idexe_t;
    m  : latch_exemem_t;
    w  : latch_memwb_t;
  end record latch_t;

  constant latch_init_value : latch_t := (
    pc => 0,
    ir => (others => 0),
    fr => (others => 0));

  signal r, rin : latch_t := latch_init_value;

begin

  comb : process (din, r) is
    variable v : latch_t;

    procedure flush_pipeline (
      v : out latch_t) is
    begin
      
    end procedure flush_pipeline;

    -- purpose: fetch register data, fowarding data if necessary
    function fetch_reg (
      n   : integer range 0 to 63;
      r   : latch_t;
      din : zkms_core_in_t)
      return unsigned(31 downto 0) is
    begin
      if n = 31 or n = 63 then
        return to_unsigned(0, 32);
      else
        return r.rf(n);
      end if;
    end function fetch_reg;

    function decode_alu_inst (
      opcode : unsigned(5 downto 0);
      opfunc : unsigned(6 downto 0))
      return alu_inst_t is
    begin
      case opcode is
        when x"10" =>
          case opfunc is
            when x"00" => return ALU_INST_ADD;
            when x"09" => return ALU_INST_SUB;
            when x"2d" => return ALU_INST_EQ;
            when x"6d" => return ALU_INST_LE;
            when x"4d" => return ALU_INST_LT;
          end case;

        when x"11" =>
          case opfunc is
            when x"00" => return ALU_INST_AND;
            when x"20" => return ALU_INST_OR;
            when x"40" => return ALU_INST_XOR;
            when x"48" => return ALU_INST_EQV;
          end case;

        when x"12" =>
          case opfunc is
            when x"39" => return ALU_INST_SLL;
            when x"34" => return ALU_INST_SRL;
            when x"3c" => return ALU_INST_SRA;
          end case;
      end case;

      assert false report "invalid alu instruction" severity failure;
      return ALU_INST_NOP;
    end function decode_alu_inst;

    -- variables for instruction decode
    variable opcode : unsigned(5 downto 0);
    variable ra     : integer range 0 to 31;
    variable rb     : integer range 0 to 31;
    variable mdisp  : unsigned(15 downto 0);
    variable bdisp  : unsigned(20 downto 0);
    variable rc     : integer range 0 to 31;
    variable lit    : unsigned(7 downto 0);
    variable litp   : std_logic;
    variable opfunc : unsigned(6 downot 0);
    variable fpfunc : unsigned(10 downto 0);

  end procedure decode_instruction;

  begin
    v := r;

    -------------------------------------------------------------------------
    -- Instruction Fetch
    -------------------------------------------------------------------------

    v.d.inst := din.instcache.data;
    v.d.pc   := r.pc;
    v.pc     := r.pc + 1;

    -------------------------------------------------------------------------
    -- Instruction Decode
    -------------------------------------------------------------------------

    v.e.nextpc := r.d.nextpc;

    opcode := r.d.inst(31 downto 26);
    ra     := to_integer(r.d.inst(25 downto 21));
    rb     := to_integer(r.d.inst(20 downto 16));

    case opcode(5 downto 3) is
      when 2 =>                         -- operation format
        rc := to_integer(r.d.inst(4 downto 0));

        case opcode is
          when x"10", x"11", x"12" =>   -- integer arithmetic
            v.e.opmode := OP_ALU;
            v.e.i1     := fetch_reg(ra, r, din);
            v.e.wb     := rc;

            litp := r.d.inst(12);
            lit  := resize(r.d.inst(20 downto 13), 32);
            if litp = '1' then
              v.e.i2 := lit;
            else
              v.e.i2 := fetch_reg(rb, r, din);
            end if;
            opfunc       := r.d.inst(11 downto 5);
            v.e.alu_inst := decode_alu_inst(opcode, opfunc);

          when x"16" =>               -- floating-point arithmetic
            v.e.opmode := OP_FPU;
            -- fixme!

          when others =>
            assert false report "invalid instruction" severity failure;
        end case;

      when 1, 3, 5 =>                   -- memory format
        mdisp := r.d.inst(15 downto 0);
        v.e.wb := ra;

        case opcode is
          when x"08" =>               -- LDA
            v.e.opmode   := OP_ALU;
            v.e.i1       := fetch_reg(rb, r, din);
            v.e.i2       := x"0000" & mdisp;
            v.e.wb       := ra;
            v.e.alu_inst := ALU_INST_ADD;

          when x"09" =>               -- LDAH
            v.e.opmode   := OP_ALU;
            v.e.i1       := fetch_reg(rb, r, din);
            v.e.i2       := mdisp & x"0000";
            v.e.wb       := ra;
            v.e.alu_inst := ALU_INST_ADD;

          when x"28" =>               -- LDL
            v.e.opmode := OP_LOAD;
            -- fixme

          when x"2c" =>               -- STL
            v.e.opmode := OP_STORE;
            -- fixme

          when x"1a" =>               -- JMP
            v.e.opmode   := OP_JMP;
            v.e.i1       := r.d.pc;
            v.e.i2       := to_unsigned(1, 32);
            v.e.wb       := ra;
            v.e.alu_inst := ALU_INST_ADD;

            v.pc := fetch_reg(rb, r, din);
            flush_pipeline(v);

          when others =>
            assert false report "invalid instruction" severity failure;
        end case;

      when 4, 6 =>                      -- branch format
        v.e.opmode := OP_BRA;
        bdisp := r.d.inst(20 downto 0);

        if branch_p(fetch_reg(ra, r, din), opcode) then
          v.e.opmode   := OP_BRA;
          v.e.i1       := r.d.pc;
          v.e.i2       := to_unsigned(1, 32);
          v.e.wb       := rb;
          v.e.alu_inst := ALU_INST_ADD;

          v.pc := fetch_reg(rb, r, din);
          flush_pipeline(v);
        end if;

      when others =>
        assert false report "invalid instruction" severity failure;
    end case;

    -------------------------------------------------------------------------
    -- Execute
    -------------------------------------------------------------------------

    case r.e.opmode is
      when OP_ALU | OP_LOAD | OP_STORE =>
        dout.alu.i1   <= r.e.i1;
        dout.alu.i2   <= r.e.i2;
        dout.alu.inst <= r.e.alu_inst;

        v.m.data := din.alu.o;

      when OP_FPU => ;
                     -- fixme

      when others => null;
    end case;

    v.m.wb     := r.e.wb;
    v.m.opmode := r.e.opmode;

    -------------------------------------------------------------------------
    -- Memory
    -------------------------------------------------------------------------

    v.w.wb     := r.m.wb;
    v.w.data   := r.m.data;
    v.w.opmode := r.m.opmode;

    -------------------------------------------------------------------------
    -- Write Back
    -------------------------------------------------------------------------

    if r.w.opmode /= OP_NOP and r.w.opmode /= OP_STORE then
      v.rf(r.w.wb) := r.w.data;
    end if;

    -------------------------------------------------------------------------
    -- Instruction Fetch
    -------------------------------------------------------------------------

    dout.instcache.addr <= v.pc;

    rin <= v;
  end process;

  seq : process (clk, rst) is
  begin
    if rst = '1' then
      r <= latch_init_value;
    elsif rising_edge(clk) then
      r <= rin;
    end if;
  end process;

end architecture behavior;
