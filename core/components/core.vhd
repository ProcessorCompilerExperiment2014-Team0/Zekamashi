-------------------------------------------------------------------------------
-- declaration
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.instcache_p.all;
use work.alu_p.all;
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
      icachei : out instcache_in_t;
      icacheo : in  instcache_out_t;
      alui    : out alu_in_t;
      aluo    : in  alu_out_t;
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
    icachei : out instcache_in_t;
    icacheo : in  instcache_out_t;
    alui    : out alu_in_t;
    aluo    : in  alu_out_t;
    mmui    : out mmu_in_t;
    mmuo    : in  mmu_out_t);
end entity core;

architecture behavior of core is

  subtype word_t is unsigned(31 downto 0);

  constant unop : word_t := b"010001_11111_11111_000_0_0100000_11111";

  type opmode_t is (
    OP_LOAD,
    OP_STORE,
    OP_LDA,
    OP_LDAH,
    OP_ALU,
    OP_FPU,
    OP_BRA,
    OP_JMP);

  -----------------------------------------------------------------------------
  -- Latch
  -----------------------------------------------------------------------------

  type latch_ifid_t is record
    bubble : boolean;
    pc     : word_t;
    inst   : word_t;
  end record latch_ifid_t;

  type latch_idexe_t is record
    bubble   : boolean;
    pc       : word_t;
    opmode   : opmode_t;
    inst     : word_t;
    rav      : word_t;
    rbv      : word_t;
    ra       : reg_index_t;
    rb       : reg_index_t;
    wb       : reg_index_t;
    alu_inst : alu_inst_t;
  end record latch_idexe_t;

  type latch_exemem_t is record
    bubble  : boolean;
    pc      : word_t;
    opmode  : opmode_t;
    wb      : reg_index_t;
    alu_out : word_t;
    data    : word_t;
  end record latch_exemem_t;

  type latch_memwb_t is record
    bubble  : boolean;
    pc      : word_t;
    opmode  : opmode_t;
    wb      : reg_index_t;
    alu_out : word_t;
    mmui    : mmu_in_t;
  end record latch_memwb_t;

  constant d_bubble : latch_ifid_t := (
    bubble   => true,
    pc       => (others => '1'),
    inst     => unop);

  constant e_bubble : latch_idexe_t := (
    bubble   => true,
    pc       => (others => '1'),
    opmode   => OP_ALU,
    inst     => unop,
    rav      => (others => '0'),
    rbv      => (others => '0'),
    ra       => 31,
    rb       => 31,
    wb       => 31,
    alu_inst => ALU_INST_OR);

  constant m_bubble : latch_exemem_t := (
    bubble   => true,
    pc       => (others => '1'),
    opmode   => OP_ALU,
    wb       => 31,
    alu_out  => (others => '-'),
    data     => (others => '-'));

  constant w_bubble : latch_memwb_t := (
    bubble   => true,
    pc       => (others => '1'),
    opmode   => OP_ALU,
    wb       => 31,
    alu_out  => (others => '0'),
    mmui     => (en => '0',
                 we => '-',
                 addr => (others => '-'),
                 data => (others => '-')));

  type latch_t is record
    rs : std_logic;                     -- reset signal
    pc : word_t;                        -- program counter
    -- latches
    d  : latch_ifid_t;
    e  : latch_idexe_t;
    m  : latch_exemem_t;
    w  : latch_memwb_t;
  end record latch_t;

  constant latch_init : latch_t := (  -- fixme
    rs => '1',
    pc => (others   => '0'),
    d  => d_bubble,
    e  => e_bubble,
    m  => m_bubble,
    w  => w_bubble);

  signal r, rin : latch_t := latch_init;

  procedure flush_pipeline (
    v : out latch_t) is
  begin
    v.d := d_bubble;
  end procedure flush_pipeline;

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

  function branch_success (
    cond   : word_t;
    opcode : unsigned(5 downto 0))
    return boolean is
  begin
    case opcode is
      when b"11_1001" =>
        return not is_metavalue(cond) and cond = 0;  -- to suppress warning
      when b"11_1101" => return cond /= 0;  -- BNE
      when others =>
        assert false report "invalid branch instruction" severity warning;
        return false;
    end case;
  end function branch_success;

  ---------------------------------------------------------------------------
  -- Hazard Detection
  ---------------------------------------------------------------------------

  type hazard_t is (
    HZ_FINE, -- there is no hazard
    HZ_ID,
    HZ_EXE, -- there is raw hazard, where op cannot see the result of load
    HZ_WB); -- there is cache miss

  function brc_inst (
    inst : word_t)
    return boolean is
  begin
    return inst(31 downto 29) = "111";
  end function brc_inst;

  function jmp_inst (
    inst : word_t)
    return boolean is
    variable opcode : unsigned(5 downto 0);
  begin
    opcode := inst(31 downto 26);
    return opcode = "011010";    -- 1a jmp
  end function jmp_inst;

  function detect_hz_id (
    r : latch_t)
    return boolean is
    variable ri : reg_index_t;
  begin
    if brc_inst(r.d.inst) then
      ri := to_integer(r.d.inst(25 downto 21));
      return ri /= 31 and ((r.e.opmode = OP_LOAD and ri = r.e.wb) or
                           (r.m.opmode = OP_LOAD and ri = r.m.wb));
    elsif jmp_inst(r.d.inst) then
      ri := to_integer(r.d.inst(20 downto 16));
      return ri /= 31 and ((r.e.opmode = OP_LOAD and ri = r.e.wb) or
                           (r.m.opmode = OP_LOAD and ri = r.m.wb));
    else
      return false;
    end if;
  end function detect_hz_id;

  function detect_hz_exe (
    r : latch_t)
    return boolean is
  begin

    if r.m.opmode = OP_LOAD then
      if r.e.opmode = OP_ALU or r.e.opmode = OP_STORE then
        if r.e.ra /= 31 and r.e.ra = r.m.wb then
          return true;
        end if;
      end if;

      if r.e.opmode = OP_LDA or r.e.opmode = OP_LDAH or r.e.opmode = OP_LOAD or
        r.e.opmode = OP_STORE or (r.e.opmode = OP_ALU and r.e.inst(12) = '0') then
        return r.e.rb /= 31 and r.e.rb = r.m.wb;
      end if;
    end if;
    return false;
  end function detect_hz_exe;

  impure function detect_hazard (
    r : latch_t)
    return hazard_t is
  begin
    if mmuo.miss = '1' then
      assert r.w.opmode = OP_LOAD report "something is wrong with memory operation" severity error;
      return HZ_WB;
    elsif detect_hz_exe(r) then
      return HZ_EXE;
    elsif detect_hz_id(r) then
      return HZ_ID;
    else
      return HZ_FINE;
    end if;
  end function detect_hazard;

  ---------------------------------------------------------------------------
  -- Data Forwarding
  ---------------------------------------------------------------------------

  impure function forward_data_ir_id (
    v   : word_t;
    n   : reg_index_t)
    return word_t is
  begin
    if n = 31 then
      return to_unsigned(0, 32);
    elsif n = r.e.wb then
      case r.e.opmode is
        when OP_ALU | OP_LDA | OP_LDAH | OP_JMP =>
          return aluo.o;
        when others =>
          return (others => '-');
      end case;
    elsif n = r.m.wb then
      case r.m.opmode is
        when OP_ALU | OP_LDA | OP_LDAH | OP_JMP =>
          return r.m.alu_out;
        when others =>
          return (others => '0');
      end case;
    elsif n = r.w.wb then
      case r.w.opmode is
        when OP_ALU | OP_LDA | OP_LDAH | OP_JMP =>
          return r.w.alu_out;
        when OP_LOAD =>
          return mmuo.data;
        when others =>
          return (others => '0');
      end case;
    else
      return v;
    end if;
  end function forward_data_ir_id;

  impure function forward_data_ir_exe (
    v : word_t;
    n : reg_index_t)
    return word_t is
  begin
    if n = 31 then
      return to_unsigned(0, 32);
    elsif n = r.m.wb then
      case r.m.opmode is
        when OP_ALU | OP_LDA | OP_LDAH | OP_JMP =>
          return r.m.alu_out;
        when others =>
          return (others => '-');
      end case;
    elsif n = r.w.wb then
      case r.w.opmode is
        when OP_ALU | OP_LDA | OP_LDAH | OP_JMP =>
          return r.w.alu_out;
        when OP_LOAD =>
          return mmuo.data;
        when others =>
          return (others => '-');
      end case;
    else
      return v;
    end if;
  end function forward_data_ir_exe;

  -----------------------------------------------------------------------------
  -- debug
  -----------------------------------------------------------------------------

  type regfile_t is array (0 to 31) of word_t;

  type debug_t is record
    hz        : hazard_t;
    ir        : regfile_t;
    ir_idx    : reg_index_t;
    ir_data   : word_t;
    ir_bubble : boolean;
    ir_pc     : word_t;
    fr        : regfile_t;
  end record debug_t;

  constant debuginfo_init : debug_t := (
    hz        => HZ_FINE,
    ir        => (others => (others => '0')),
    ir_idx    => 31,
    ir_data   => (others => '-'),
    ir_bubble => true,
    ir_pc     => (others => '1'),
    fr        => (others => (others => '0')));

  signal debuginfo : debug_t := debuginfo_init;

  file ir_dump : text open write_mode is "ir.log";
  file fr_dump : text open write_mode is "fr.log";

begin

  comb : process (r, icacheo, aluo, mmuo, iro, fro) is
    variable v       : latch_t;
    variable icachev : instcache_in_t;
    variable aluv    : alu_in_t;
    variable mmuv    : mmu_in_t;

    -- variables for instruction decode
    variable opcode : unsigned(5 downto 0);
    variable rc     : reg_index_t;
    variable opfunc : unsigned(6 downto 0);
    variable fpfunc : unsigned(10 downto 0);
    variable bdisp  : unsigned(20 downto 0);
    variable mdisp  : unsigned(15 downto 0);
    variable cond   : word_t;

    -- variables for write back
    variable ir_idx  : reg_index_t;
    variable ir_data : word_t;

    variable hazard : hazard_t := HZ_FINE;

  begin
    v       := r;
    v.rs    := '0';
    icachev := (addr => (others => '-'));
    aluv    := (inst => ALU_INST_NOP,
                i1   => (others => '-'),
                i2   => (others => '-'));
    mmuv    := (addr => (others => '0'),
                data => (others => '0'),
                en   => '0',
                we   => '0');

    hazard  := detect_hazard(r);
    debuginfo.hz <= hazard;

    -------------------------------------------------------------------------
    -- Instruction Fetch
    -------------------------------------------------------------------------

    if r.rs = '0' then
      v.d.bubble := false;
      v.d.inst   := icacheo.data;
      v.d.pc     := r.pc;
      v.pc       := r.pc + 1;
    else
      v.d.bubble := true;
      v.d.inst   := unop;
      v.d.pc     := r.pc;
      v.pc       := (others => '0');
    end if;

    -------------------------------------------------------------------------
    -- Instruction Decode
    -------------------------------------------------------------------------

    v.e.bubble := r.d.bubble;
    v.e.pc     := r.d.pc;
    v.e.ra     := to_integer(r.d.inst(25 downto 21));
    v.e.rb     := to_integer(r.d.inst(20 downto 16));
    v.e.rav    := iro.d1;
    v.e.rbv    := iro.d2;
    v.e.inst   := r.d.inst;

    iri.r1 <= to_integer(r.d.inst(25 downto 21));
    iri.r2 <= to_integer(r.d.inst(20 downto 16));

    rc     := to_integer(r.d.inst(4 downto 0));
    opcode := r.d.inst(31 downto 26);

    case opcode(5 downto 3) is
      when "010" =>                         -- operation format
        case opcode is
          when b"01_0000" | b"01_0001" | b"01_0010" =>   -- integer arithmetic
            v.e.opmode := OP_ALU;
            v.e.wb     := rc;

            opfunc       := r.d.inst(11 downto 5);
            v.e.alu_inst := decode_alu_inst(opcode, opfunc);

          when b"01_1010" =>               -- floating-point arithmetic
            v.e.opmode := OP_FPU;
            -- fixme!

          when others =>
            assert false report "invalid instruction" severity warning;
        end case;

      when "001" | "011" | "101" =>                   -- memory format
        v.e.wb := v.e.ra;
        v.e.alu_inst := ALU_INST_ADD;

        case opcode is
          when b"00_1000" => v.e.opmode := OP_LDA;
          when b"00_1001" => v.e.opmode := OP_LDAH;
          when b"10_1000" => v.e.opmode := OP_LOAD;
          when b"10_1100" => v.e.opmode := OP_STORE;
                             v.e.wb     := 31;
          when b"01_1010" =>
            v.e.opmode := OP_JMP;
            v.pc       := forward_data_ir_id(v.e.rbv, v.e.rb);
            flush_pipeline(v);

          when others => assert false report "invalid instruction" severity warning;
        end case;

      when "110" | "111" =>                      -- branch format
        -- integer conditional branch
        if opcode(5 downto 3) = 7 then
          v.e.wb       := 31;
          v.e.alu_inst := ALU_INST_NOP;
          v.e.opmode   := OP_BRA;
          bdisp        := r.d.inst(20 downto 0);
          cond         := forward_data_ir_id(v.e.rav, v.e.ra);  -- refer v
          if branch_success(cond, opcode) then
            v.pc := unsigned(signed(r.d.pc) + signed(bdisp));
            flush_pipeline(v);
          end if;
        -- unconditional branch
        elsif opcode = b"11_0000" or opcode = b"11_0100" then
          v.e.wb       := v.e.ra;       -- refer v
          v.e.alu_inst := ALU_INST_ADD;
          v.e.opmode   := OP_JMP;
          bdisp        := r.d.inst(20 downto 0);
          v.pc         := unsigned(signed(r.d.pc) + signed(bdisp));
          flush_pipeline(v);
        else
          assert false report "invalid branch instruction" severity warning;
        end if;

      when others =>
        assert false report "invalid instruction" severity warning;
    end case;

    -------------------------------------------------------------------------
    -- Execute
    -------------------------------------------------------------------------

    v.m.bubble := r.e.bubble;
    v.m.pc     := r.e.pc;

    aluv.inst :=  r.e.alu_inst;
    mdisp := r.e.inst(15 downto 0);

    case r.e.opmode is
      when OP_ALU =>
        aluv.i1 := forward_data_ir_exe(r.e.rav, r.e.ra);
        if r.e.inst(12) = '1' then      -- litp
          aluv.i2 := resize(r.e.inst(20 downto 13), 32);
        else
          aluv.i2 := forward_data_ir_exe(r.e.rbv, r.e.rb);
        end if;
      when OP_LDA =>
        aluv.i1 := unsigned(resize(signed(mdisp), 32));
        aluv.i2 := forward_data_ir_exe(r.e.rbv, r.e.rb);
      when OP_LDAH =>
        aluv.i1 := mdisp & x"0000";
        aluv.i2 := forward_data_ir_exe(r.e.rbv, r.e.rb);
      when OP_LOAD | OP_STORE =>
        aluv.i1 := unsigned(resize(signed(mdisp), 32));
        aluv.i2 := forward_data_ir_exe(r.e.rbv, r.e.rb);
      when OP_JMP =>
        aluv.i1 := r.e.pc;
        aluv.i2 := to_unsigned(1, 32);
      when OP_BRA =>
        aluv.i1 := to_unsigned(0, 32);
        aluv.i2 := to_unsigned(0, 32);
      when OP_FPU => null;
                     -- fixme

      when others => null;
    end case;
    
    v.m.alu_out := aluo.o;
    v.m.wb      := r.e.wb;
    v.m.opmode  := r.e.opmode;
    v.m.data    := forward_data_ir_exe(r.e.rav, r.e.ra);  -- necessary for only store

    -------------------------------------------------------------------------
    -- Memory
    -------------------------------------------------------------------------

    v.w.bubble := r.m.bubble;
    v.w.pc     := r.m.pc;

    case r.m.opmode is
      when OP_LOAD =>
        mmuv := (addr => r.m.alu_out(20 downto 0),
                 data => (others => '0'),
                 en   => '1',
                 we   => '0');
      when OP_STORE =>
        mmuv := (addr => r.m.alu_out(20 downto 0),
                 data => r.m.data,
                 en   => '1',
                 we   => '1');
      when others =>
        mmuv := (addr => (others => '0'),
                 data => (others => '0'),
                 en   => '0',
                 we   => '0');
    end case;

    v.w.wb      := r.m.wb;
    v.w.alu_out := r.m.alu_out;
    v.w.mmui    := mmuv;
    v.w.opmode  := r.m.opmode;

    -------------------------------------------------------------------------
    -- Write Back
    -------------------------------------------------------------------------

    case r.w.opmode is
      when OP_ALU | OP_LDA | OP_LDAH | OP_JMP =>
        ir_idx  := r.w.wb;
        ir_data := r.w.alu_out;
      when OP_LOAD =>
        if mmuo.miss = '0' then
          ir_idx  := r.w.wb;
          ir_data := mmuo.data;
        else
          ir_idx  := 31;
          ir_data := (others => '-');
        end if;
      when others =>
        ir_idx  := 31;
        ir_data := (others => '-');
    end case;

    iri.w <= ir_idx;
    iri.d <= ir_data;

    debuginfo.ir_bubble <= r.w.bubble;
    debuginfo.ir_pc     <= r.w.pc;
    debuginfo.ir_idx    <= ir_idx;
    debuginfo.ir_data   <= ir_data;

    -------------------------------------------------------------------------
    -- Instruction Fetch
    -------------------------------------------------------------------------

    icachev := (addr => v.pc(16 downto 0));

    ---------------------------------------------------------------------------
    -- Pipeline Stalling
    ---------------------------------------------------------------------------

    case hazard is
      when HZ_ID =>
        v.pc := r.pc;
        v.d  := r.d;
        v.e  := e_bubble;

      when HZ_EXE =>
        v.pc := r.pc;
        v.d  := r.d;
        v.e  := r.e;
        v.m  := m_bubble;

        icachev := (addr => r.pc(16 downto 0));

      when HZ_WB =>

        v.pc := r.pc;
        v.d  := r.d;
        v.e  := r.e;
        v.m  := r.m;
        v.w  := r.w;

        icachev := (addr => r.pc(16 downto 0));
        mmuv    := r.w.mmui;

      when others => null;
    end case;

    mmui    <= mmuv;
    icachei <= icachev;
    alui    <= aluv;
    rin     <= v;
  end process;

  seq : process (clk, xrst) is
    variable l : line;
  begin
    if xrst = '0' then
      r         <= latch_init;
    elsif rising_edge(clk) then
      r <= rin;

      -- register dump
      if dump_ir then
        if not debuginfo.ir_bubble and debuginfo.hz /= HZ_WB then
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
    end if;
  end process;

end architecture behavior;
