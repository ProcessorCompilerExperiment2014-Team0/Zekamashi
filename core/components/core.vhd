-------------------------------------------------------------------------------
-- Declaration
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.instcache_p.all;
use work.alu_p.all;
use work.fpu_p.all;
use work.mmu_p.all;
use work.regfile_p.all;

package core_p is

  component core is
    generic (
      dump_ir : boolean;
      dump_fr : boolean);
    port (
      clk  : in std_logic;
      xrst : in std_logic;

      iri     : out regfile_in_t;
      iro     : in  regfile_out_t;
      fri     : out regfile_in_t;
      fro     : in  regfile_out_t;
      icachei : out instcache_read_in_t;
      icacheo : in  instcache_read_out_t;
      alui    : out alu_in_t;
      aluo    : in  alu_out_t;
      fpui    : out fpu_in_t;
      fpuo    : in  fpu_out_t;
      mmui    : out mmu_in_t;
      mmuo    : in  mmu_out_t);
  end component core;

end package core_p;

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
use work.core_p.all;
use work.instcache_p.all;
use work.alu_p.all;
use work.fpu_p.all;
use work.mmu_p.all;
use work.regfile_p.all;
use work.util_p.all;

entity core is
  generic (
    dump_ir : boolean := false;
    dump_fr : boolean := false);
  port (
    clk  : in std_logic;
    xrst : in std_logic;

    iri     : out regfile_in_t;
    iro     : in  regfile_out_t;
    fri     : out regfile_in_t;
    fro     : in  regfile_out_t;
    icachei : out instcache_read_in_t;
    icacheo : in  instcache_read_out_t;
    alui    : out alu_in_t;
    aluo    : in  alu_out_t;
    fpui    : out fpu_in_t;
    fpuo    : in  fpu_out_t;
    mmui    : out mmu_in_t;
    mmuo    : in  mmu_out_t);
end entity core;

architecture behavior of core is

  subtype word_t is unsigned(31 downto 0);

  constant unop : word_t := b"010001_11111_11111_000_0_0100000_11111";

  type branch_op_t is (
    BRANCH_TRUE,
    BRANCH_FALSE,
    BRANCH_EQ,
    BRANCH_NE,
    BRANCH_FEQ,
    BRANCH_FNE);

  type alu_input_t is (
    ALU_INPUT_ARITH,
    ALU_INPUT_ARITH_LIT,
    ALU_INPUT_MEM,
    ALU_INPUT_LDAH,
    ALU_INPUT_PC,
    ALU_INPUT_NONE);

  type memop_t is (
    MEM_LOAD,
    MEM_STORE,
    MEM_NOP);

  type fwd_mode_t is (
    FWD_IR,
    FWD_FR,
    FWD_NONE);

  type iwb_src_t is (
    IWB_SRC_ALU,
    IWB_SRC_MEM);

  type fwb_src_t is (
    FWB_SRC_FPU,
    FWB_SRC_IR);

  -----------------------------------------------------------------------------
  -- Latch
  -----------------------------------------------------------------------------

  type latch_if_t is record
    pc_now          : word_t;
    pc_inc          : word_t;
    pc_jmp          : word_t;
    br_op           : branch_op_t;
    cond            : word_t;
    -- forwarded values
    fwd_pc_jmp      : std_logic;
    fwd_cond        : std_logic;
    fwd_data        : word_t;
  end record latch_if_t;

  type latch_id_t is record
    bubble : boolean;
    reset  : std_logic;
    pc     : word_t;
    stall  : std_logic;
    inst   : word_t;
  end record latch_id_t;

  -- integer pipeline

  type latch_exe_t is record
    bubble    : boolean;
    pc        : word_t;
    arg       : unsigned(20 downto 0);
    rav       : word_t;
    rbv       : word_t;
    ra        : reg_index_t;
    rb        : reg_index_t;
    fwd_a     : fwd_mode_t;
    fwd_b     : fwd_mode_t;
    alu_input : alu_input_t;
    alu_inst  : alu_inst_t;
    fpu_inst  : fpu_inst_t;
    memop     : memop_t;
    iwb       : reg_index_t;
    isrc      : iwb_src_t;
    fwb       : reg_index_t;
    fsrc      : fwb_src_t;
  end record latch_exe_t;

  type latch_mem_t is record
    bubble     : boolean;
    pc         : word_t;
    wb         : reg_index_t;
    src        : iwb_src_t;
    memop      : memop_t;
    alu_out    : word_t;
    store_data : word_t;
  end record latch_mem_t;

  type latch_wb_t is record
    bubble  : boolean;
    pc      : word_t;
    wb      : reg_index_t;
    src     : iwb_src_t;
    alu_out : word_t;
  end record latch_wb_t;

  type latch_fwb_t is record
    bubble : boolean;
    pc     : word_t;
    wb     : reg_index_t;
    src    : fwb_src_t;
  end record latch_fwb_t;

  -- bubbles

  constant f_bubble : latch_if_t := (
    pc_now     => (others => '0'),
    pc_inc     => (others => '0'),
    pc_jmp     => (others => '-'),
    br_op      => BRANCH_FALSE,
    cond       => (others => '-'),
    fwd_pc_jmp => '-',
    fwd_cond   => '-',
    fwd_data   => (others => '-')) ;

  constant d_bubble : latch_id_t := (
    bubble   => true,
    reset    => '1',
    pc       => (others => '1'),
    stall    => '0',
    inst     => (others => '-'));

  constant e_bubble : latch_exe_t := (
    bubble    => true,
    pc        => (others => '1'),
    arg       => (others => '-'),
    rav       => (others => '-'),
    rbv       => (others => '-'),
    ra        => 31,
    rb        => 31,
    fwd_a     => FWD_NONE,
    fwd_b     => FWD_NONE,
    alu_input => ALU_INPUT_NONE,
    alu_inst  => ALU_INST_NOP,
    fpu_inst  => FPU_INST_NOP,
    memop     => MEM_NOP,
    iwb       => 31,
    isrc      => IWB_SRC_ALU,
    fwb       => 31,
    fsrc      => FWB_SRC_FPU);

  constant m_bubble : latch_mem_t := (
    bubble     => true,
    pc         => (others => '1'),
    wb         => 31,
    src        => IWB_SRC_ALU,
    memop      => MEM_NOP,
    alu_out    => (others => '-'),
    store_data => (others => '-'));

  constant w_bubble : latch_wb_t := (
    bubble  => true,
    pc      => (others => '1'),
    wb      => 31,
    src     => IWB_SRC_ALU,
    alu_out => (others => '0'));

  constant fw_bubble : latch_fwb_t :=  (
    bubble => true,
    pc     => (others => '1'),
    wb     => 31,
    src    => FWB_SRC_FPU);

  type latch_t is record
    f     : latch_if_t;
    d     : latch_id_t;
    e     : latch_exe_t;
    m     : latch_mem_t;
    w     : latch_wb_t;
    fw1   : latch_fwb_t;
    fw2   : latch_fwb_t;
  end record latch_t;

  constant latch_init : latch_t := (
    f     => f_bubble,
    d     => d_bubble,
    e     => e_bubble,
    m     => m_bubble,
    w     => w_bubble,
    fw1   => fw_bubble,
    fw2   => fw_bubble);

  signal r, rin : latch_t := latch_init;

  -----------------------------------------------------------------------------
  -- Subroutines for Instruction Decode
  -----------------------------------------------------------------------------

  function decode_alu_inst (
    opcode : unsigned(5 downto 0);
    opfunc : unsigned(6 downto 0))
    return alu_inst_t is
  begin
    case opcode is
      when b"01_0000" =>
        case opfunc is
          when b"000_0000" => return ALU_INST_ADD;
          when b"000_1001" => return ALU_INST_SUB;
          when b"010_1101" => return ALU_INST_EQ;
          when b"110_1101" => return ALU_INST_LE;
          when b"100_1101" => return ALU_INST_LT;
          when others => null;
        end case;

      when b"01_0001" =>
        case opfunc is
          when b"000_0000" => return ALU_INST_AND;
          when b"010_0000" => return ALU_INST_OR;
          when b"100_0000" => return ALU_INST_XOR;
          when b"100_1000" => return ALU_INST_EQV;
          when others => null;
        end case;

      when b"01_0010" =>
        case opfunc is
          when b"011_1001" => return ALU_INST_SLL;
          when b"011_0100" => return ALU_INST_SRL;
          when b"011_1100" => return ALU_INST_SRA;
          when others => null;
        end case;

      when others => null;
    end case;

    assert false report "invalid alu instruction" severity warning;
    return ALU_INST_NOP;
  end function decode_alu_inst;

  function decode_fpu_inst (
    fpfunc : unsigned(10 downto 0))
    return fpu_inst_t is
  -- This function does not returns FPU_INST_SQRT, because
  -- SQRTS is placed at other opcode.
  begin
    case fpfunc is
      when b"000_1010_0101" => return FPU_INST_EQ;
      when b"000_1010_0111" => return FPU_INST_LE;
      when b"000_1010_0110" => return FPU_INST_LT;
      when b"000_1000_0000" => return FPU_INST_ADD;
      when b"000_1000_0001" => return FPU_INST_SUB;
      when b"000_1000_0010" => return FPU_INST_MUL;
      when b"000_1000_0011" => return FPU_INST_INV;
      when b"000_0010_1111" => return FPU_INST_FTOI;
      when b"000_1011_1110" => return FPU_INST_ITOF;
      when others =>
        assert false report "invalid FPU instruction" severity error;
        return FPU_INST_NOP;
    end case;
  end function decode_fpu_inst;

  ---------------------------------------------------------------------------
  -- Data Forwarding
  ---------------------------------------------------------------------------

  procedure forward_data_ir_id (
    dst   : out   word_t;
    hz    : inout std_logic;
    later : out   std_logic;
    v     : in    word_t;
    n     : in    reg_index_t) is
  begin
    hz    := '0';
    later := '0';

    if n = 31 then
      dst := to_unsigned(0, 32);
      hz  := hz;
    elsif n = r.e.iwb then
      case r.e.isrc is
        when IWB_SRC_ALU =>
          dst       := (others => '-');
          later     := '1';
          hz        := hz;
        when IWB_SRC_MEM =>
          dst := (others => '-');
          hz  := '1';
      end case;
    elsif n = r.m.wb then
      case r.m.src is
        when IWB_SRC_ALU =>
          dst := r.m.alu_out;
          hz  := hz;
        when IWB_SRC_MEM =>
          dst := (others => '-');
          hz  := '1';
      end case;
    elsif n = r.w.wb then
      case r.w.src is
        when IWB_SRC_ALU =>
          dst := r.w.alu_out;
          hz  := hz;
        when IWB_SRC_MEM =>
          dst := mmuo.data;
          hz  := hz;
      end case;
    else
      dst := v;
      hz  := hz;
    end if;
  end procedure forward_data_ir_id;

  procedure forward_data_ir_exe (
    dst : out   word_t;
    hz  : inout std_logic;
    v   : in    word_t;
    n   : in    reg_index_t) is
  begin
    if n = 31 then
      dst := to_unsigned(0, 32);
      hz  := hz;
    elsif n = r.m.wb then
      case r.m.src is
        when IWB_SRC_ALU =>
          dst := r.m.alu_out;
          hz  := hz;
        when IWB_SRC_MEM =>
          dst := (others => '-');
          hz  := '1';
      end case;
    elsif n = r.w.wb then
      case r.w.src is
        when IWB_SRC_ALU =>
          dst := r.w.alu_out;
          hz  := hz;
        when IWB_SRC_MEM =>
          dst := mmuo.data;
          hz  := hz;
      end case;
    else
      dst := v;
      hz  := hz;
    end if;
  end procedure forward_data_ir_exe;

  procedure forward_data_fr_id (
    dst : out   word_t;
    hz  : inout std_logic;
    v   : in    word_t;
    n   : in    reg_index_t) is
  begin
    if n = 31 then
      dst := to_unsigned(0, 32);
      hz  := hz;
    elsif n = r.e.fwb then
      dst := (others => '-');
      hz  := '1';
    elsif n = r.fw1.wb then
      dst := (others => '-');
      hz  := '1';
    elsif n = r.fw2.wb then
      dst := (others => '-');
      hz  := '1';
    else
      dst := v;
      hz  := hz;
    end if;
  end procedure forward_data_fr_id;

  procedure forward_data_fr_exe (
    dst : out   word_t;
    hz  : inout std_logic;
    v   : in    word_t;
    n   : in    reg_index_t) is
  begin
    if n = 31 then
      dst := to_unsigned(0, 32);
      hz  := hz;
    elsif n = r.fw1.wb then
      dst := (others => '-');
      hz  := '1';
    elsif n = r.fw2.wb then
      dst := (others => '-');
      hz  := '1';
    else
      dst := v;
      hz  := hz;
    end if;
  end procedure forward_data_fr_exe;

  -----------------------------------------------------------------------------
  -- Debug
  -----------------------------------------------------------------------------

  type regfile_t is array (0 to 31) of word_t;

  type debug_t is record
    count     : unsigned(31 downto 0);
    hz_id     : std_logic;
    hz_exe    : std_logic;
    hz_wb     : std_logic;
    ir        : regfile_t;
    ir_idx    : reg_index_t;
    ir_data   : word_t;
    ir_bubble : boolean;
    ir_pc     : word_t;
    fr        : regfile_t;
    fr_idx    : reg_index_t;
    fr_data   : word_t;
    fr_bubble : boolean;
    fr_pc     : word_t;
  end record debug_t;

  constant debuginfo_init : debug_t := (
    count     => (others => '0'),
    hz_id     => '0',
    hz_exe    => '0',
    hz_wb     => '0',
    ir        => (others => (others => '0')),
    ir_idx    => 31,
    ir_data   => (others => '-'),
    ir_bubble => true,
    ir_pc     => (others => '1'),
    fr        => (others => (others => '0')),
    fr_idx    => 31,
    fr_data   => (others => '-'),
    fr_bubble => true,
    fr_pc     => (others => '1'));

  signal debuginfo : debug_t := debuginfo_init;

  file ir_dump : text open write_mode is "ir.log";
  file fr_dump : text open write_mode is "fr.log";

begin

  -----------------------------------------------------------------------------
  -- Core Logic
  -----------------------------------------------------------------------------

  comb : process (r, icacheo, aluo, fpuo, mmuo, iro, fro) is
    variable v       : latch_t;
    variable icachev : instcache_read_in_t;
    variable aluv    : alu_in_t;
    variable fpuv    : fpu_in_t;
    variable mmuv    : mmu_in_t;

    -- variables for instruction fetch
    variable br_cond      : word_t;
    variable pcinc, pcjmp : unsigned(12 downto 0);
    variable nextpc       : unsigned(12 downto 0);

    -- variables for instruction decode
    variable inst   : word_t;
    variable opcode : unsigned(5 downto 0);
    variable ra     : reg_index_t;
    variable rb     : reg_index_t;
    variable rc     : reg_index_t;
    variable opfunc : unsigned(6 downto 0);
    variable fpfunc : unsigned(10 downto 0);
    variable bdisp  : unsigned(20 downto 0);
    variable cond   : word_t;
    variable frad    : word_t;
    variable frbd    : word_t;
    variable rad     : word_t;
    variable rbd     : word_t;

    -- variables for execution
    variable fadata : word_t;
    variable fbdata : word_t;
    variable adata  : word_t;
    variable bdata  : word_t;

    -- variables for write back
    variable wb_ir_idx  : reg_index_t;
    variable wb_ir_data : word_t;
    variable wb_fr_idx  : reg_index_t;
    variable wb_fr_data : word_t;

    variable flush  : boolean;
    variable hz_id  : std_logic;
    variable hz_exe : std_logic;
    variable hz_wb  : std_logic;

  begin
    v       := r;
    icachev := (addr => (others => '-'));
    aluv := (inst => ALU_INST_NOP,
             i1   => (others => '-'),
             i2   => (others => '-'));
    fpuv := (stall => '0',
             inst  => FPU_INST_NOP,
             i1    => (others => '-'),
             i2    => (others => '-'));
    mmuv := (addr => (others => '0'),
             data => (others => '0'),
             en   => '0',
             we   => '0');

    hz_id  := '0';
    hz_exe := '0';
    hz_wb  := '0';

    -------------------------------------------------------------------------
    -- Write Back
    -------------------------------------------------------------------------

    case r.w.src is
      when IWB_SRC_ALU =>
        wb_ir_idx  := r.w.wb;
        wb_ir_data := r.w.alu_out;
      when IWB_SRC_MEM =>
        if mmuo.miss = '0' then
          wb_ir_idx  := r.w.wb;
          wb_ir_data := mmuo.data;
        else
          wb_ir_idx  := 31;
          wb_ir_data := (others => '-');
          hz_wb      := '1';
        end if;
    end case;

    iri.w <= wb_ir_idx;
    iri.d <= wb_ir_data;

    case r.fw2.src is
      when FWB_SRC_FPU =>
        wb_fr_idx  := r.fw2.wb;
        wb_fr_data := fpuo.o;
      when FWB_SRC_IR =>
        if hz_wb = '0' then
          wb_fr_idx  := r.fw2.wb;
          wb_fr_data := wb_ir_data;
        else
          wb_fr_idx  := 31;
          wb_fr_data := (others => '-');
        end if;
    end case;

    fri.w <= wb_fr_idx;
    fri.d <= wb_fr_data;


    -------------------------------------------------------------------------
    -- Instruction Fetch
    -------------------------------------------------------------------------

    pcinc := r.f.pc_inc(12 downto 0);
    if r.f.fwd_pc_jmp = '1' then
      pcjmp := r.f.fwd_data(12 downto 0);
    else
      pcjmp := r.f.pc_jmp(12 downto 0);
    end if;
    if r.f.fwd_cond = '1' then
      br_cond := r.f.fwd_data;
    else
      br_cond := r.f.cond;
    end if;

    flush := false;

    case r.f.br_op is
      when BRANCH_TRUE =>
        flush  := true;
        nextpc := pcjmp;
      when BRANCH_FALSE =>
        nextpc := pcinc;
      when BRANCH_EQ =>
        if br_cond = 0 then
          flush  := true;
          nextpc := pcjmp;
        else
          nextpc := pcinc;
        end if;
      when BRANCH_NE =>
        if br_cond /= 0 then
          flush  := true;
          nextpc := pcjmp;
        else
          nextpc := pcinc;
        end if;
      when BRANCH_FEQ =>
        if br_cond(30 downto 0) = 0 then
          flush  := true;
          nextpc := pcjmp;
        else
          nextpc := pcinc;
        end if;
      when BRANCH_FNE =>
        if br_cond(30 downto 0) /= 0 then
          flush  := true;
          nextpc := pcjmp;
        else
          nextpc := pcinc;
        end if;
    end case;

    icachev.addr := nextpc;

    v.f := (
      pc_now     => resize(nextpc, 32),
      pc_inc     => resize(nextpc, 32) + 1,
      pc_jmp     => (others => '-'),    -- these properties
      br_op      => BRANCH_FALSE,       -- will may be set at
      cond       => (others => '-'),
      fwd_pc_jmp => '0',
      fwd_cond   => '0',
      fwd_data   => aluo.o);         -- instruction decode

    v.d := (
      bubble => false,
      reset  => '0',
      pc     => resize(nextpc, 32),
      stall  => '0',
      inst   => (others => '-'));

    -------------------------------------------------------------------------
    -- Instruction Decode
    -------------------------------------------------------------------------

    if r.d.reset = '1' then
      inst := unop;
    elsif r.d.stall = '1' then
      inst := r.d.inst;
    else
      inst := icacheo.data;
    end if;

    ra := to_integer(inst(25 downto 21));
    rb := to_integer(inst(20 downto 16));
    rc := to_integer(inst(4 downto 0));

    iri.r1 <= ra;
    iri.r2 <= rb;
    fri.r1 <= ra;
    fri.r2 <= rb;

    if ra /= 31 and ra = wb_ir_idx then
      rad := wb_ir_data;
    else
      rad := iro.d1;
    end if;

    if rb /= 31 and rb = wb_ir_idx then
      rbd := wb_ir_data;
    else
      rbd := iro.d2;
    end if;

    if ra /= 31 and ra = wb_fr_idx then
      frad := wb_fr_data;
    else
      frad := fro.d1;
    end if;

    if rb /= 31 and rb = wb_fr_idx then
      frbd := wb_fr_data;
    else
      frbd := fro.d2;
    end if;
    
    v.e.bubble := r.d.bubble;
    v.e.pc     := r.d.pc;
    v.e.ra     := to_integer(inst(25 downto 21));
    v.e.rb     := to_integer(inst(20 downto 16));
    v.e.arg    := inst(20 downto 0);

    opcode := inst(31 downto 26);
    opfunc := inst(11 downto 5);
    fpfunc := inst(15 downto 5);

    case opcode(5 downto 3) is
      when "010" =>                                     -- operation format
        case opcode is
          when b"01_0000" | b"01_0001" | b"01_0010" =>  -- integer arithmetic
            v.e.rav      := rad;
            v.e.rbv      := rbd;
            v.e.fwd_a    := FWD_IR;
            v.e.fpu_inst := FPU_INST_NOP;
            v.e.memop    := MEM_NOP;
            v.e.iwb      := rc;
            v.e.isrc     := IWB_SRC_ALU;
            v.e.fwb      := 31;
            v.e.fsrc     := FWB_SRC_FPU;

            if inst(12) = '0' then
              v.e.alu_input := ALU_INPUT_ARITH;
              v.e.fwd_b     := FWD_IR;
            else
              v.e.alu_input := ALU_INPUT_ARITH_LIT;
              v.e.fwd_b     := FWD_NONE;
            end if;

            v.e.alu_inst := decode_alu_inst(opcode, opfunc);

          when b"01_0110" =>            -- floating-point arithmetic
            v.e.rav       := frad;
            v.e.rbv       := frbd;
            v.e.alu_input := ALU_INPUT_NONE;
            v.e.alu_inst  := ALU_INST_NOP;
            v.e.fwd_a     := FWD_FR;
            v.e.fwd_b     := FWD_FR;
            v.e.memop     := MEM_NOP;
            v.e.iwb       := 31;
            v.e.isrc      := IWB_SRC_ALU;
            v.e.fwb       := rc;
            v.e.fsrc      := FWB_SRC_FPU;

            v.e.fpu_inst := decode_fpu_inst(fpfunc);

          when b"01_0100" =>
            v.e.rav   := rad;
            v.e.rbv   := frbd;
            v.e.fwd_a := FWD_IR;
            v.e.fwd_b := FWD_FR;

            case fpfunc is
              when b"000_0000_0100" =>  -- ITOFS
                v.e.alu_input := ALU_INPUT_ARITH;
                v.e.alu_inst  := ALU_INST_ADD;
                v.e.fpu_inst  := FPU_INST_NOP;
                v.e.memop     := MEM_NOP;
                v.e.iwb       := 31;
                v.e.isrc      := IWB_SRC_ALU;
                v.e.fwb       := rc;
                v.e.fsrc      := FWB_SRC_IR;

              when b"000_1000_1011" =>  -- SQRTS
                v.e.alu_input := ALU_INPUT_ARITH;
                v.e.alu_inst  := ALU_INST_NOP;
                v.e.fpu_inst  := FPU_INST_SQRT;
                v.e.memop     := MEM_NOP;
                v.e.iwb       := 31;
                v.e.isrc      := IWB_SRC_ALU;
                v.e.fwb       := rc;
                v.e.fsrc      := FWB_SRC_FPU;

              when others =>
                assert false report "invalid instruction" severity error;
            end case;

          when others =>
            assert false report "invalid instruction" severity error;
        end case;

      when "100" =>                     -- memory format / fr
        v.e.rav       := frad;
        v.e.rbv       := rbd;
        v.e.alu_input := ALU_INPUT_MEM;
        v.e.alu_inst  := ALU_INST_ADD;
        v.e.fpu_inst  := FPU_INST_NOP;
        v.e.fwd_b     := FWD_IR;

        case opcode is
          when b"10_0010" =>            -- LDS
            v.e.fwd_a := FWD_NONE;
            v.e.memop := MEM_LOAD;
            v.e.iwb   := 31;
            v.e.isrc  := IWB_SRC_MEM;
            v.e.fsrc  := FWB_SRC_IR;
            v.e.fwb   := ra;

          when b"10_0110" =>            -- STS
            v.e.fwd_a := FWD_FR;
            v.e.memop := MEM_STORE;
            v.e.iwb   := 31;
            v.e.isrc  := IWB_SRC_MEM;
            v.e.fwb   := 31;
            v.e.fsrc  := FWB_SRC_FPU;

          when others =>
            assert false report "invalid instruction" severity error;
        end case;

      when "011" =>                     -- JSR / FTOIS
        v.e.rav       := frad;
        v.e.rbv       := rbd;

        case opcode is
          when b"01_1010" =>            -- JMP
            v.e.alu_inst  := ALU_INST_ADD;
            v.e.alu_input := ALU_INPUT_PC;
            v.e.fwd_a     := FWD_NONE;
            v.e.fwd_b     := FWD_NONE;
            v.e.memop     := MEM_NOP;
            v.e.iwb       := ra;
            v.e.isrc      := IWB_SRC_ALU;
            v.e.fwb       := 31;
            v.e.fsrc      := FWB_SRC_FPU;

            forward_data_ir_id(v.f.pc_jmp, hz_id, v.f.fwd_pc_jmp, v.e.rbv, rb);
            v.f.cond  := (others => '-');
            v.f.br_op := BRANCH_TRUE;

          when b"01_1100" =>
            if fpfunc = b"000_0111_1000" then
              v.e.alu_inst  := ALU_INST_ADD;
              v.e.alu_input := ALU_INPUT_ARITH;
              v.e.fwd_a     := FWD_FR;
              v.e.fwd_b     := FWD_IR;
              v.e.memop     := MEM_NOP;
              v.e.iwb       := rc;
              v.e.isrc      := IWB_SRC_ALU;
              v.e.fwb       := 31;
              v.e.fsrc      := FWB_SRC_FPU;
            else
              assert false report "invalid instruction" severity error;
            end if;

          when others =>
            assert false report "invalid instruction" severity error;
        end case;

      when "001" | "101" =>     -- memory format
        v.e.rav      := rad;
        v.e.rbv      := rbd;

        v.e.alu_inst := ALU_INST_ADD;

        case opcode is
          when b"00_1000" =>            -- LDA
            v.e.alu_input := ALU_INPUT_MEM;
            v.e.fwd_a     := FWD_NONE;
            v.e.fwd_b     := FWD_IR;
            v.e.memop     := MEM_NOP;
            v.e.isrc      := IWB_SRC_ALU;
            v.e.iwb       := ra;
            v.e.fsrc      := FWB_SRC_FPU;
            v.e.fwb       := 31;

          when b"00_1001" =>            -- LDAH
            v.e.alu_input := ALU_INPUT_LDAH;
            v.e.fwd_a     := FWD_NONE;
            v.e.fwd_b     := FWD_IR;
            v.e.memop     := MEM_NOP;
            v.e.iwb       := ra;
            v.e.isrc      := IWB_SRC_ALU;
            v.e.fwb       := 31;
            v.e.fsrc      := FWB_SRC_FPU;

          when b"10_1000" =>            -- LDL
            v.e.alu_input := ALU_INPUT_MEM;
            v.e.fwd_a     := FWD_NONE;
            v.e.fwd_b     := FWD_IR;
            v.e.memop     := MEM_LOAD;
            v.e.iwb       := ra;
            v.e.isrc      := IWB_SRC_MEM;
            v.e.fwb       := 31;
            v.e.fsrc      := FWB_SRC_FPU;

          when b"10_1100" =>            -- STL
            v.e.alu_input := ALU_INPUT_MEM;
            v.e.fwd_a     := FWD_IR;
            v.e.fwd_b     := FWD_IR;
            v.e.memop     := MEM_STORE;
            v.e.iwb       := 31;
            v.e.isrc      := IWB_SRC_MEM;
            v.e.fwb       := 31;
            v.e.fsrc      := FWB_SRC_FPU;

          when others => assert false report "invalid instruction" severity error;
        end case;

      when "111" =>                     -- integer conditional branch
        v.e.rav       := rad;
        v.e.rbv       := rbd;
        v.e.fwd_a     := FWD_NONE;
        v.e.fwd_b     := FWD_NONE;
        v.e.isrc      := IWB_SRC_ALU;
        v.e.fsrc      := FWB_SRC_FPU;
        v.e.memop     := MEM_NOP;
        v.e.alu_inst  := ALU_INST_NOP;
        v.e.alu_input := ALU_INPUT_NONE;
        v.e.iwb       := 31;
        v.e.fwb       := 31;

        bdisp        := inst(20 downto 0);

        forward_data_ir_id(cond, hz_id, v.f.fwd_cond, v.e.rav, ra);  -- refer v
        v.f.cond     := cond;
        v.f.pc_jmp   := unsigned(signed(r.d.pc) + signed(bdisp));

        case opcode is
          when b"11_1001" => v.f.br_op := BRANCH_EQ;
          when b"11_1101" => v.f.br_op := BRANCH_NE;
          when others =>
            assert false report "invalid branch instruction" severity warning;
            v.f.br_op := BRANCH_FALSE;
        end case;

      when "110" =>  -- unconditional branch / floating-point branch
        v.e.rav   := frad;
        v.e.rbv   := (others => '-');
        v.e.fwd_a := FWD_NONE;
        v.e.fwd_b := FWD_NONE;
        v.e.isrc  := IWB_SRC_ALU;
        v.e.fwb   := 31;
        v.e.fsrc  := FWB_SRC_FPU;
        v.e.memop := MEM_NOP;

        bdisp        := inst(20 downto 0);

        if opcode(1 downto 0) = "00" then  -- BR/BSR
          v.e.alu_inst  := ALU_INST_ADD;
          v.e.alu_input := ALU_INPUT_PC;
          v.e.iwb       := ra;

          v.f.cond   := (others => '-');
          v.f.pc_jmp := unsigned(signed(r.d.pc) + signed(bdisp));
          v.f.br_op  := BRANCH_TRUE;
        else
          -- floating-point conditional branch
          v.e.alu_inst  := ALU_INST_NOP;
          v.e.alu_input := ALU_INPUT_NONE;
          v.e.iwb       := 31;

          forward_data_fr_id(cond, hz_id, v.e.rav, ra);  -- refer v
          v.f.cond     := cond;
          v.f.pc_jmp   := unsigned(signed(r.d.pc) + signed(bdisp));

          case opcode is
            when b"11_0001" => v.f.br_op := BRANCH_FEQ;
            when b"11_0101" => v.f.br_op := BRANCH_FNE;
            when others =>
              assert false report "invalid branch instruction" severity warning;
              v.f.br_op := BRANCH_FALSE;
          end case;
        end if;

      when others =>
        assert false report "invalid instruction" severity error;
    end case;

    -------------------------------------------------------------------------
    -- Execute
    -------------------------------------------------------------------------

    v.m.bubble := r.e.bubble;
    v.m.pc     := r.e.pc;
    v.m.wb     := r.e.iwb;
    v.m.src    := r.e.isrc;
    v.m.memop  := r.e.memop;

    v.fw1.bubble := r.e.bubble;
    v.fw1.pc     := r.e.pc;
    v.fw1.wb     := r.e.fwb;
    v.fw1.src    := r.e.fsrc;

    -- Data Forwarding
    case r.e.fwd_a is
      when FWD_IR =>
        forward_data_ir_exe(adata, hz_exe, r.e.rav, r.e.ra);
        fadata := (others => '0');
      when FWD_FR =>
        forward_data_fr_exe(adata, hz_exe, r.e.rav, r.e.ra);
        fadata := adata;
      when FWD_NONE =>
        adata  := (others => '-');
        fadata := (others => '-');
    end case;

    case r.e.fwd_b is
      when FWD_IR =>
        forward_data_ir_exe(bdata, hz_exe, r.e.rbv, r.e.rb);
        fbdata := (others => '0');
      when FWD_FR =>
        forward_data_fr_exe(bdata, hz_exe, r.e.rbv, r.e.rb);
        fbdata := bdata;
      when FWD_NONE =>
        bdata  := (others => '-');
        fbdata := (others => '-');
    end case;

    -- Set ALU Input
    aluv.inst := r.e.alu_inst;

    case r.e.alu_input is
      when ALU_INPUT_ARITH =>
        aluv.i1 := adata;
        aluv.i2 := bdata;
      when ALU_INPUT_ARITH_LIT =>
        aluv.i1 := adata;
        aluv.i2 := resize(r.e.arg(20 downto 13), 32);  -- literal
      when ALU_INPUT_MEM =>
        aluv.i1 := unsigned(resize(signed(r.e.arg(15 downto 0)), 32)); -- memory displacement
        aluv.i2 := bdata;
      when ALU_INPUT_LDAH =>
        aluv.i1 := r.e.arg(15 downto 0) & x"0000"; -- memory displacement
        aluv.i2 := bdata;
      when ALU_INPUT_PC =>
        aluv.i1 := r.e.pc;
        aluv.i2 := to_unsigned(1, 32);
      when ALU_INPUT_NONE =>
        aluv.i1 := (others => '-');
        aluv.i2 := (others => '-');
    end case;

    v.m.alu_out := aluo.o;

    -- Set FPU Input
    fpuv.inst := r.e.fpu_inst;
    fpuv.i1   := fadata;
    fpuv.i2   := fbdata;

    -- Save data to write memory
    v.m.store_data := adata;

    -------------------------------------------------------------------------
    -- Memory
    -------------------------------------------------------------------------

    case r.m.memop is
      when MEM_LOAD =>
        mmuv := (addr => r.m.alu_out(20 downto 0),
                 data => (others => '-'),
                 en   => '1',
                 we   => '0');
      when MEM_STORE =>
        mmuv := (addr => r.m.alu_out(20 downto 0),
                 data => r.m.store_data,
                 en   => '1',
                 we   => '1');
      when MEM_NOP =>
        mmuv := (addr => (others => '-'),
                 data => (others => '-'),
                 en   => '0',
                 we   => '0');
    end case;

    v.w.bubble  := r.m.bubble;
    v.w.pc      := r.m.pc;
    v.w.wb      := r.m.wb;
    v.w.src     := r.m.src;
    v.w.alu_out := r.m.alu_out;

    v.fw2 := r.fw1;


    debuginfo.ir_bubble <= r.w.bubble;
    debuginfo.ir_pc     <= r.w.pc;
    debuginfo.ir_idx    <= wb_ir_idx;
    debuginfo.ir_data   <= wb_ir_data;
    debuginfo.fr_bubble <= r.fw2.bubble;
    debuginfo.fr_pc     <= r.fw2.pc;
    debuginfo.fr_idx    <= wb_fr_idx;
    debuginfo.fr_data   <= wb_fr_data;
    debuginfo.hz_id     <= hz_id;
    debuginfo.hz_exe    <= hz_exe;
    debuginfo.hz_wb     <= hz_wb;

    ---------------------------------------------------------------------------
    -- Pipeline Flushing/Stalling
    ---------------------------------------------------------------------------

    if flush then
      v.e       := e_bubble;
      v.f.br_op := BRANCH_FALSE;
    end if;

    if hz_wb = '1' then
      v.f       := r.f;
      v.d       := r.d;
      v.d.stall := '1';
      v.d.inst  := inst;
      v.e       := r.e;
      v.m       := r.m;
      v.w       := r.w;
      v.fw1     := r.fw1;
      v.fw2     := r.fw2;

      fpuv.stall   := '1';
      mmuv.en      := '0';

    elsif hz_exe = '1' then
      v.f       := r.f;
      v.d       := r.d;
      v.d.stall := '1';
      v.d.inst  := inst;
      v.e       := r.e;
      v.m       := m_bubble;
      v.fw1     := fw_bubble;

      if r.e.fwd_a = FWD_IR and wb_ir_idx /= 31 and wb_ir_idx = r.e.ra then
        v.e.rav := wb_ir_data;
      elsif r.e.fwd_a = FWD_FR and wb_fr_idx /= 31 and wb_fr_idx = r.e.ra then
        v.e.rav := wb_fr_data;
      end if;
      if r.e.fwd_b = FWD_IR and wb_ir_idx /= 31 and wb_ir_idx = r.e.rb then
        v.e.rbv := wb_ir_data;
      elsif r.e.fwd_b = FWD_FR and wb_fr_idx /= 31 and wb_fr_idx = r.e.rb then
        v.e.rbv := wb_fr_data;
      end if;

    elsif hz_id = '1' then
      if not flush then
        v.f       := r.f;
        v.d       := r.d;
        v.d.stall := '1';
        v.d.inst  := inst;
        v.e       := e_bubble;
      end if;
    end if;

    mmui    <= mmuv;
    icachei <= icachev;
    alui    <= aluv;
    fpui    <= fpuv;
    rin     <= v;
  end process;

  seq : process (clk, xrst) is
    variable l : line;
  begin
    if xrst = '0' then
      r <= latch_init;
    elsif rising_edge(clk) then
      r <= rin;

      if (not debuginfo.ir_bubble and debuginfo.hz_wb = '0')
        or (not debuginfo.fr_bubble and debuginfo.hz_wb = '0') then
        debuginfo.count <= debuginfo.count + 1;
      end if;

      -- register dump
      if dump_ir then
        if not debuginfo.ir_bubble and debuginfo.hz_wb = '0' then
          write(l, string'("PC : "));
          hwrite(l, std_logic_vector(debuginfo.ir_pc));
          writeline(ir_dump, l);
          for i in 0 to 31 loop
            write(l, string'("$"));
            write(l, i, LEFT, 2);
            write(l, string'(" : "));
            hwrite(l, std_logic_vector(debuginfo.ir(i)));
            writeline(ir_dump, l);
          end loop;
          writeline(ir_dump, l);
        end if;

        if debuginfo.ir_idx /= 31 then
          debuginfo.ir(debuginfo.ir_idx) <= debuginfo.ir_data;
        end if;
      end if;

      if dump_fr then
        if not debuginfo.fr_bubble and debuginfo.hz_wb = '0' then
          write(l, string'("PC : "));
          hwrite(l, std_logic_vector(debuginfo.fr_pc));
          writeline(fr_dump, l);
          for i in 0 to 31 loop
            write(l, string'("$f"));
            write(l, i, LEFT, 2);
            write(l, string'(" : "));
            hwrite(l, std_logic_vector(debuginfo.fr(i)));
            writeline(fr_dump, l);
          end loop;
          writeline(fr_dump, l);
        end if;

        if debuginfo.fr_idx /= 31 then
          debuginfo.fr(debuginfo.fr_idx) <= debuginfo.fr_data;
        end if;
      end if;

    end if;
  end process;

end architecture behavior;
