#include <cstdio>
#include <iostream>
#include <iomanip>
#include <fstream>
#include <list>
#include <cstring>
#include <cmath>
#include <cstdint>
#include "exec.h"
#include "fpu.h"
using namespace std;

const char *INST_NAME[] = {
  "LDA    ",
  "LDAH   ",
  "LDL    ",
  "STL    ",
  "BEQ    ",
  "BNE    ",
  "BR     ",
  "BSR    ",
  "JMP    ",
  "JSR    ",
  "RET    ",
  "ADDL   ",
  "SUBL   ",
  "CMPEQ  ",
  "CMPLE  ",
  "CMPLT  ",
  "AND    ",
  "BIS    ",
  "XOR    ",
  "EQV    ",
  "SLL    ",
  "SRL    ",
  "SRA    ",
  "LDS    ",
  "STS    ",
  "FBEQ   ",
  "FBNE   ",
  "CMPSEQ ",
  "CMPSLE ",
  "CMPSLT ",
  "ADDS   ",
  "SUBS   ",
  "MULS   ",
  "INVS   ",
  "SQRTS  ",
  "CVTSL/C",
  "CVTLS  ",
  "FTOIS  ",
  "ITOFS  ",
};

core::core(int argc, char **argv) {
  mem = new uint32_t[SIZE_OF_MEM];
  ifstream input(argv[1], ios::binary);
  if(!input) {
    cerr << "Cannot open input file\n";
    exit(1);
  }
  int l = input.seekg(0, ios::end).tellg();
  input.seekg(0, ios::beg);
  input.read((char*)mem, l);
  input.close();

  pc = 0u;
  inst_len = l / 4;
  for(int i=0; i<NUM_OF_R; i++) {
    ir[i].i = 0;
    fr[i].i = 0;
  }
  opt = 0u;
  i_limit = -1LL;
  for(int i=0; i<I_SENTINEL; i++) {
    i_stat[i] = 0LL;
  }

  if(argc < 3) return;
  int i = 2;
  if(argv[2][0] != '-') {
    try {
      set_test(argv[2]);
      i++;
    } catch (const char *s) {
      cerr << s << '\n';
      exit(1);
    }
  }
  try {
    for(; i<argc; i++) {
      if(!strcmp(argv[i], "-d")) {
        opt |= 1 << OPTION_D;
      } else if(!strcmp(argv[i], "-r")) {
        opt |= 1 << OPTION_R;
        opt |= 1 << OPTION_D;
      } else if(!strcmp(argv[i], "-m")) {
        opt |= 1 << OPTION_M;
      } else if(!strcmp(argv[i], "-n")) {
        if(i+1 >= argc || argv[i+1][0] == '-') {
          opt |= 1 << OPTION_N;
        } else {
          for(i++; i<argc; i++) {
            if(argv[i][0] == '-') {
              i--;
              break;
            } else if(!strcmp(argv[i], "adds")) {
              opt |= 1 << OPTION_N_ADDS;
            } else if(!strcmp(argv[i], "subs")) {
              opt |= 1 << OPTION_N_SUBS;
            } else if(!strcmp(argv[i], "muls")) {
              opt |= 1 << OPTION_N_MULS;
            } else if(!strcmp(argv[i], "invs")) {
              opt |= 1 << OPTION_N_INVS;
            } else if(!strcmp(argv[i], "sqrts")) {
              opt |= 1 << OPTION_N_SQRTS;
            } else if(!strcmp(argv[i], "cvtsl")) {
              opt |= 1 << OPTION_N_CVTSL;
            } else if(!strcmp(argv[i], "cvtls")) {
              opt |= 1 << OPTION_N_CVTLS;
            } else {
              throw argv[i];
            }
          }
        }
      } else if(!strcmp(argv[i], "-s")) {
        opt |= 1 << OPTION_S;
        if(i+1 >= argc || argv[i+1][0] == '-') {
          strcpy(stat_file, argv[1]);
          strcat(stat_file, ".log");
        } else {
          strcpy(stat_file, argv[++i]);
        }
      } else if(!strcmp(argv[i], "-l")) {
        i++;
        if(i >= argc) {
          throw argv[i];
        }
        sscanf(argv[i], "%lld", &i_limit);
      } else {
        throw argv[i];
      }
    }
  } catch (char *s) {
    cerr << "Invalid Option: " << s << endl;
    exit(1);
  }
}

core::~core() {
  delete [] mem;
}

void core::set_test(const char *test_file_path) {
  ifstream test_file(test_file_path);
  if(!test_file) throw "Cannot open test file";
  char s[100];
  int reg;
  uint32_t val;
  while(!test_file.eof()) {
    test_file >> s >> hex >> val;
    if(s[1] == 'f') {
      sscanf(s, "$f%d", &reg);
      reg += NUM_OF_R;
    } else {
      sscanf(s, "$%d", &reg);
    }
    test_map.insert(make_pair(reg, val));
  }
}

void core::run() {
  uint32_t inst;
  uint32_t opcd;
  int ra, rb, rc, df, b;
  for(i_count = 0LL; pc!=inst_len && (i_limit<0 || i_count<i_limit); i_count++) {
    inst = mem[pc];
    opcd = inst >> 26;
    if(opt >> OPTION_R & 1) {
      show(cerr);
      cerr << '\n';
    }
    if(opt >> OPTION_D & 1) {
      cerr << "PC: " << dmanip << pc << ", "
           << "inst: " << dmanip << inst << '\n';
    }
    try {
      switch(opcd >> 3) {
      case 0x1:
      case 0x4:
      case 0x5:                   // mem format
        ra = (inst >> 21) & 0x1F;
        rb = (inst >> 16) & 0x1F;
        df = inst & 0xFFFF;
        switch(opcd) {
        case 0x08:
          i_lda(ra, rb, df);
          break;
        case 0x09:
          i_ldah(ra, rb, df);
          break;
        case 0x22:
          i_lds(ra, rb, df);
          break;
        case 0x26:
          i_sts(ra, rb, df);
          break;
        case 0x28:
          i_ldl(ra, rb, df);
          break;
        case 0x2c:
          i_stl(ra, rb, df);
          break;
        default:
          throw inst;
        }
        break;
      case 0x3:
        switch(opcd) {
        case 0x1a:              // mbr format
          ra = (inst >> 21) & 0x1F;
          rb = (inst >> 16) & 0x1F;
          df = inst & 0xFF;
          switch(df >> 14) {
          case 0x0:
            i_jmp(ra, rb, df);
            break;
          case 0x1:
            i_jsr(ra, rb, df);
            break;
          case 0x2:
            i_ret(ra, rb, df);
            break;
          default:
            throw inst;
          }
          break;
        case 0x1c:              // float
          ra = (inst >> 21) & 0x1F;
          rb = (inst >> 16) & 0x1F;
          rc = inst & 0x1F;
          df = (inst >> 5) & 0x7FF;
          switch(df) {
          case 0x78:
            i_ftois(ra, rc);
            break;
          default:
            throw inst;
          }
          break;
        default:
          throw inst;
        }
        break;
      case 0x6:
      case 0x7:                 // bra format
        ra = (inst >> 21) & 0x1F;
        df = inst & 0x1FFFFF;
        switch(opcd) {
        case 0x30:
          if(i_br(ra, df)) return;
          break;
        case 0x34:
          i_bsr(ra, df);
          break;
        case 0x39:
          i_beq(ra, df);
          break;
        case 0x3d:
          i_bne(ra, df);
          break;
        case 0x31:
          i_fbeq(ra, df);
          break;
        case 0x35:
          i_fbne(ra, df);
          break;
        default:
          throw inst;
        }
        break;
      case 0x2:                   // op format
        if(opcd >> 2 & 1) {       // float
          ra = (inst >> 21) & 0x1F;
          rb = (inst >> 16) & 0x1F;
          rc = inst & 0x1F;
          df = (inst >> 5) & 0x7FF;
          switch(opcd) {
          case 0x14:
            switch(df) {
            case 0x004:
              i_itofs(ra, rc);
              break;
            case 0x08b:
              i_sqrts(rb, rc);
              break;
            default:
              throw inst;
            }
            break;
          case 0x16:
            switch(df) {
            case 0x0a5:
              i_cmpseq(ra, rb, rc);
              break;
            case 0x0a7:
              i_cmpsle(ra, rb, rc);
              break;
            case 0x0a6:
              i_cmpslt(ra, rb, rc);
              break;
            case 0x080:
              i_adds(ra, rb, rc);
              break;
            case 0x081:
              i_subs(ra, rb, rc);
              break;
            case 0x082:
              i_muls(ra, rb, rc);
              break;
            case 0x083:
              i_invs(rb, rc);
              break;
            case 0x02f:
              i_cvtsl_c(rb, rc);
              break;
            case 0x0be:
              i_cvtls(rb, rc);
              break;
            default:
              throw inst;
            }
            break;
          default:
            throw inst;
          }
        } else {                  // integer
          ra = (inst >> 21) & 0x1F;
          df = (inst >> 5) & 0x7F;
          rc = inst & 0x1F;
          if(inst >> 12 & 1) {    // literal
            b = (inst >> 13) & 0xFF;
          } else {                // register
            rb = (inst >> 16) & 0x1F;
            b = ir[rb].i;
          }
          switch(opcd) {
          case 0x10:
            switch(df) {
            case 0x00:
              i_addl(ra, b, rc);
              break;
            case 0x09:
              i_subl(ra, b, rc);
              break;
            case 0x2d:
              i_cmpeq(ra, b, rc);
              break;
            case 0x6d:
              i_cmple(ra, b, rc);
              break;
            case 0x4d:
              i_cmplt(ra, b, rc);
              break;
            default:
              throw inst;
            }
            break;
          case 0x11:
            switch(df) {
            case 0x00:
              i_and(ra, b, rc);
              break;
            case 0x20:
              i_bis(ra, b, rc);
              break;
            case 0x40:
              i_xor(ra, b, rc);
              break;
            case 0x48:
              i_eqv(ra, b, rc);
              break;
            default:
              throw inst;
            }
            break;
          case 0x12:
            switch(df) {
            case 0x39:
              i_sll(ra, b, rc);
              break;
            case 0x34:
              i_srl(ra, b, rc);
              break;
            case 0x3c:
              i_sra(ra, b, rc);
              break;
            default:
              throw inst;
            }
            break;
          default:
            throw inst;
          }
        }
        break;
      default:
        throw inst;
      }
    } catch (uint32_t i) {
      cerr << "Unknown instruction: "
           << hex << setfill('0') << setw(8) << uppercase << i;
      return;
    }
    ir[NUM_OF_R - 1].i = 0;
    fr[NUM_OF_R - 1].i = 0;
  }
}

int core::verify() {
  int diff = 0;
  int r;
  map<int, uint32_t>::iterator p;
  for(p=test_map.begin(); p!=test_map.end(); p++) {
    if(p->first < NUM_OF_R) {
      r = p->first;
      if(ir[r].u != p->second) {
        cerr << "test failed: $" << dec << r << '\n'
             << "expected: " << dmanip << p->second << '\n'
             << "actual  : " << dmanip << ir[r].u << '\n';
        diff = 1;
      }
    } else {
      r = p->first - NUM_OF_R;
      if(fr[r].u != p->second) {
        cerr << "test failed: $f" << dec << r << '\n'
             << "expected: " << dmanip << p->second << '\n'
             << "actual  : " << dmanip << fr[r].u << '\n';
        diff = 1;
      }
    }
  }
  return diff;
}

/* sign extend v as (len) bits integer */
int core::extend(int v, int len) {
  if(v >> (len - 1) & 1) {
    v |= ~((1 << len) - 1);
  }
  return v;
}

void core::mem_st_lw(uint32_t &src, int addr) {
  if(addr < 0 || addr >= ADDR_SENTINEL) {
    cerr << "ERROR: store: memory address is out of range ("
         << dmanip << addr
         << ")\n";
    return;
  } else if(addr >= SIZE_OF_MEM && addr < ADDR_SENTINEL) {
    switch(addr) {
    case ADDR_RD_STATUS:
      cerr << "WARNING: read status register is read-only\n";
      break;
    case ADDR_RD_DATA:
      cerr << "WARNING: read data register is read-only\n";
      break;
    case ADDR_WT_STATUS:
      cerr << "WARNING: write status register is read-only\n";
      break;
    case ADDR_WT_DATA:
      wt_data.u = src & 0xFFu;
      cout << (char)wt_data.u;
      break;
    }
    return;
  }
  uint32_t old = mem[addr];
  mem[addr] = src;
  if(opt >> OPTION_M & 1) {
    cerr << "st: addr = "
         << dmanip << addr << ", value = "
         << dmanip << old << " -> "
         << dmanip << src << '\n';
  }
}

void core::mem_ld_lw(uint32_t &dst, int addr) {
  if(addr < 0 || addr >= ADDR_SENTINEL) {
    cerr << "ERROR: load: memory address is out of range ("
         << dmanip << addr
         << ")\n";
    return;
  } else if(addr >= SIZE_OF_MEM && addr < ADDR_SENTINEL) {
    switch(addr) {
    case ADDR_RD_STATUS:
      dst = 1u;
      break;
    case ADDR_RD_DATA:
      dst = rd_data.u = getchar();
      break;
    case ADDR_WT_STATUS:
      dst = 1u;
      break;
    case ADDR_WT_DATA:
      dst = wt_data.u;
      break;
    }
    return;
  }
  dst = mem[addr];
  if(opt >> OPTION_M & 1) {
    cerr << "ld: addr = "
         << dmanip << addr << ", value = "
         << dmanip << dst << '\n';
  }
}

void core::inc_pc() {
  pc++;
}

void core::i_lda(int ra, int rb, int disp) {
  ir[ra].i = ir[rb].i + extend(disp, 16);
  inc_pc();
  i_stat[I_LDA]++;
}

void core::i_ldah(int ra, int rb, int disp) {
  ir[ra].i = ir[rb].i + extend(disp, 16) * 65536;
  inc_pc();
  i_stat[I_LDAH]++;
}

void core::i_lds(int ra, int rb, int disp) {
  int addr = ir[rb].i + extend(disp, 16);
  mem_ld_lw(fr[ra].u, addr);
  inc_pc();
  i_stat[I_LDS]++;
}

void core::i_sts(int ra, int rb, int disp) {
  int addr = ir[rb].i + extend(disp, 16);
  mem_st_lw(fr[ra].u, addr);
  inc_pc();
  i_stat[I_STS]++;
}

void core::i_ldl(int ra, int rb, int disp) {
  int addr = ir[rb].i + extend(disp, 16);
  mem_ld_lw(ir[ra].u, addr);
  inc_pc();
  i_stat[I_LDL]++;
}

void core::i_stl(int ra, int rb, int disp) {
  int addr = ir[rb].i + extend(disp, 16);
  mem_st_lw(ir[ra].u, addr);
  inc_pc();
  i_stat[I_STL]++;
}

int core::i_br(int ra, int disp) {
  ir[ra].i = pc + 1;
  if(disp == 0) {
    return 1;
  }
  pc += extend(disp, 16);
  i_stat[I_BR]++;
  return 0;
}

void core::i_bsr(int ra, int disp) {
  ir[ra].i = pc + 1;
  pc += extend(disp, 16);
  if(opt >> OPTION_S & 1) {
    map<unsigned, long long>::iterator p = br_map.find(pc);
    if(p == br_map.end()) {
      br_map.insert(make_pair(pc, 1LL));
    } else {
      p->second++;
    }
  }
  i_stat[I_BSR]++;
}

void core::i_beq(int ra, int disp) {
  if(ir[ra].i == 0) {
    pc += extend(disp, 16);
  } else {
    inc_pc();
  }
  i_stat[I_BEQ]++;
}

void core::i_bne(int ra, int disp) {
  if(ir[ra].i != 0) {
    pc += extend(disp, 16);
  } else {
    inc_pc();
  }
  i_stat[I_BNE]++;
}

void core::i_fbeq(int fa, int disp) {
  if(fr[fa].f == 0.0) {
    pc += extend(disp, 16);
  } else {
    inc_pc();
  }
  i_stat[I_FBEQ]++;
}

void core::i_fbne(int fa, int disp) {
  if(fr[fa].f != 0.0) {
    pc += extend(disp, 16);
  } else {
    inc_pc();
  }
  i_stat[I_FBNE]++;
}

void core::i_jmp(int ra, int rb, int func) {
  ir[ra].i = pc + 1;
  pc = ir[rb].i;
  i_stat[I_JMP]++;
}

void core::i_jsr(int ra, int rb, int func) {
  ir[ra].i = pc + 1;
  pc = ir[rb].i;
  i_stat[I_JSR]++;
}

void core::i_ret(int ra, int rb, int func) {
  ir[ra].i = pc + 1;
  pc = ir[rb].i;
  i_stat[I_RET]++;
}

void core::i_addl(int ra, int b, int rc) {
  ir[rc].i = ir[ra].i + b;
  inc_pc();
  i_stat[I_ADDL]++;
}

void core::i_subl(int ra, int b, int rc) {
  ir[rc].i = ir[ra].i - b;
  inc_pc();
  i_stat[I_SUBL]++;
}

void core::i_cmpeq(int ra, int b, int rc) {
  ir[rc].i = ir[ra].i == b ? 1 : 0;
  inc_pc();
  i_stat[I_CMPEQ]++;
}

void core::i_cmple(int ra, int b, int rc) {
  ir[rc].i = ir[ra].i <= b ? 1 : 0;
  inc_pc();
  i_stat[I_CMPLE]++;
}

void core::i_cmplt(int ra, int b, int rc) {
  ir[rc].i = ir[ra].i < b ? 1 : 0;
  inc_pc();
  i_stat[I_CMPLT]++;
}

void core::i_and(int ra, int b, int rc) {
  ir[rc].i = ir[ra].i & b;
  inc_pc();
  i_stat[I_AND]++;
}

void core::i_bis(int ra, int b, int rc) {
  ir[rc].i = ir[ra].i | b;
  inc_pc();
  i_stat[I_BIS]++;
}

void core::i_xor(int ra, int b, int rc) {
  ir[rc].i = ir[ra].i ^ b;
  inc_pc();
  i_stat[I_XOR]++;
}

void core::i_eqv(int ra, int b, int rc) {
  ir[rc].i = ir[ra].i ^ ~b;
  inc_pc();
  i_stat[I_EQV]++;
}

void core::i_sll(int ra, int b, int rc) {
  ir[rc].i = ir[ra].i << b;
  inc_pc();
  i_stat[I_SLL]++;
}

void core::i_srl(int ra, int b, int rc) {
  ir[rc].u = ir[ra].u >> b;
  inc_pc();
  i_stat[I_SRL]++;
}

void core::i_sra(int ra, int b, int rc) {
  ir[rc].i = ir[ra].i >> b;
  inc_pc();
  i_stat[I_SRA]++;
}

void core::i_itofs(int ra, int fc) {
  fr[fc].u = ir[ra].u;
  inc_pc();
  i_stat[I_ITOFS]++;
}

void core::i_adds(int fa, int fb, int fc) {
  if(opt >> OPTION_N & 1 || opt >> OPTION_N_ADDS & 1) {
    fr[fc].f = fr[fa].f + fr[fb].f;
  } else {
    fr[fc].u = fadd(fr[fa].u, fr[fb].u);
  }
  inc_pc();
  i_stat[I_ADDS]++;
}

void core::i_subs(int fa, int fb, int fc) {
  if(opt >> OPTION_N & 1 || opt >> OPTION_N_SUBS & 1) {
    fr[fc].f = fr[fa].f - fr[fb].f;
  } else {
    fr[fc].u = fsub(fr[fa].u, fr[fb].u);
  }
  inc_pc();
  i_stat[I_SUBS]++;
}

void core::i_muls(int fa, int fb, int fc) {
  if(opt >> OPTION_N & 1 || opt >> OPTION_N_MULS & 1) {
    fr[fc].f = fr[fa].f * fr[fb].f;
  } else {
    fr[fc].u = fmul(fr[fa].u, fr[fb].u);
  }
  inc_pc();
  i_stat[I_MULS]++;
}

void core::i_invs(int fb, int fc) {
  if(opt >> OPTION_N & 1 || opt >> OPTION_N_INVS & 1) {
    fr[fc].f = 1.0 / fr[fb].f;
  } else {
    fr[fc].u = finv(fr[fb].u);
  }
  inc_pc();
  i_stat[I_INVS]++;
}

void core::i_sqrts(int fb, int fc) {
  if(opt >> OPTION_N & 1 || opt >> OPTION_N_SQRTS & 1) {
    fr[fc].f = sqrtf(fr[fb].f);
  } else {
    fr[fc].u = fsqrt(fr[fb].u);
  }
  inc_pc();
  i_stat[I_SQRTS]++;
}

void core::i_cmpseq(int fa, int fb, int fc) {
  fr[fc].f = fr[fa].f == fr[fb].f ? 2.0 : 0.0;
  inc_pc();
  i_stat[I_CMPSEQ]++;
}

void core::i_cmpsle(int fa, int fb, int fc) {
  fr[fc].f = fr[fa].f <= fr[fb].f ? 2.0 : 0.0;
  inc_pc();
  i_stat[I_CMPSLE]++;
}

void core::i_cmpslt(int fa, int fb, int fc) {
  fr[fc].f = fr[fa].f < fr[fb].f ? 2.0 : 0.0;
  inc_pc();
  i_stat[I_CMPSLT]++;
}

void core::i_cvtsl_c(int fb, int fc) {
  if(opt >> OPTION_N & 1 || opt >> OPTION_N_CVTSL & 1) {
    fr[fc].i = (int32_t)fr[fb].f;
  } else {
    fr[fc].u = ftrc(fr[fb].u);
  }
  inc_pc();
  i_stat[I_CVTSL]++;
}

void core::i_cvtls(int fb, int fc) {
  if(opt >> OPTION_N & 1 || opt >> OPTION_N_CVTLS & 1) {
    fr[fc].f = (float)fr[fb].i;
  } else {
    fr[fc].u = itof(fr[fb].u);
  }
  inc_pc();
  i_stat[I_CVTLS]++;
}

void core::i_ftois(int fa, int rc) {
  ir[rc].u = fr[fa].u;
  inc_pc();
  i_stat[I_FTOIS]++;
}

ostream &core::dmanip(ostream &st) {
  st << hex << setfill('0') << setw(8) << right << uppercase;
  return st;
}

void core::show(ostream &os) {
  ios_base::fmtflags initflag = os.flags();
  os << "PC  : " << dmanip << pc << '\n';
  for(int i=0; i<NUM_OF_R; i++) {
    os << "$" << dec << setfill(' ') << setw(2) << left << i << " : "
       << dmanip << ir[i].u
       << "    $f" << dec << setfill(' ') << setw(2) << left << i << " : "
       << dmanip << fr[i].u << '\n';
  }
  
  os.flags(initflag);
}  

ostream &operator<<(ostream &os, const core &c) {
  ios_base::fmtflags initflag = os.flags();
  os << "PC  : " << core::dmanip << c.pc << '\n';
  for(int i=0; i<NUM_OF_R; i++) {
    os << "$" << dec << setfill(' ') << setw(2) << left << i << " : "
       << core::dmanip << c.ir[i].u
       << " = " << dec << setfill(' ') << setw(11) << c.ir[i].i
       << "    $f" << setw(2) << left << i << " : "
       << core::dmanip << c.fr[i].u
       << " = " << c.fr[i].f << '\n';
  }
  os << "total  : " << dec << c.i_count << '\n';
  for(int i=0; i<I_SENTINEL; i++) {
    os << INST_NAME[i] << ": " << c.i_stat[i] << '\n';
  }
  os.flags(initflag);
  return os;
}

void core::write_br_stat() {
  if(!(opt >> OPTION_S & 1)) return;
  ofstream os(stat_file);
  map<unsigned, long long>::iterator p;
  for(p = br_map.begin(); p != br_map.end(); p++) {
    os << p->first << " " << p->second << '\n';
  }
  os.close();
}
