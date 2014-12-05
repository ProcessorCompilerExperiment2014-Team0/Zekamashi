#include <cstdio>
#include <iostream>
#include <iomanip>
#include <fstream>
#include <cstring>
#include <cmath>
#include "exec.h"
using namespace std;

core::core(int argc, char **argv) {
  mem = new unsigned[SIZE_OF_MEM];
  ifstream input(argv[1], ios::binary);
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
  i_limit = -1LL;

  for(int i=2; i<argc; i++) {
    if(!strcmp(argv[i], "-d")) {
      opt |= 1 << OPTION_D;
    } else if(!strcmp(argv[i], "-r")) {
      opt |= 1 << OPTION_R;
      opt |= 1 << OPTION_D;
    } else if(!strcmp(argv[i], "-m")) {
      opt |= 1 << OPTION_M;
    } else if(!strcmp(argv[i], "-n")) {
      opt |= 1 << OPTION_N;
    } else if(!strcmp(argv[i], "-l")) {
      i++;
      if(i >= argc) {
        throw "Invalid Option";
      }
      sscanf(argv[i], "%lld", &i_limit);
    } else {
      throw "Invalid Option";
    }
  }
}

core::~core() {
  delete [] mem;
}

void core::run() {
  unsigned inst;
  unsigned opcd;
  int ra, rb, rc, df, b;
  for(i_count = 0LL; pc!=inst_len && (i_limit<0 || i_count<i_limit); i_count++) {
    inst = mem[pc];
    opcd = inst >> 26;
    if(opt >> OPTION_D & 1) {
      cerr << hex << uppercase << setfill('0');
      cerr << "PC: " << setw(8) << pc << ", "
           << "inst: " << setw(8) << inst << '\n';
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
    } catch (unsigned i) {
      cerr << "Unknown instruction: "
           << hex << setfill('0') << setw(8) << uppercase << i;
      return;
    }
    ir[NUM_OF_R - 1].i = 0;
    fr[NUM_OF_R - 1].i = 0;
    if(opt >> OPTION_R & 1) {
      cerr << *this << endl;
    }
  }
}

/* sign extend v as (len) bits integer */
int core::extend(int v, int len) {
  if(v >> (len - 1) & 1) {
    v |= ~((1 << len) - 1);
  }
  return v;
}

void core::mem_st_lw(unsigned &src, int addr) {
  if(addr < 0 || addr >= SIZE_OF_MEM) {
    cerr << "ERROR: store: memory address is out of range ("
         << hex << setfill('0') << setw(8) << addr
         << ")\n";
    return;
  }
  unsigned old = mem[addr];
  mem[addr] = src;
  if(opt >> OPTION_M & 1) {
    cerr << hex << setfill('0') << uppercase << "st: addr = "
         << setw(8) << addr << ", value = "
         << setw(8) << old << " -> "
         << setw(8) << src << '\n';
  }
}

void core::mem_ld_lw(unsigned &dst, int addr) {
  if(addr < 0 || addr >= SIZE_OF_MEM) {
    cerr << "ERROR: load: memory address is out of range ("
         << hex << setfill('0') << setw(8) << addr
         << ")\n";
    return;
  }
  dst = mem[addr];
  if(opt >> OPTION_M & 1) {
    cerr << hex << setfill('0') << uppercase << "ld: addr = "
         << setw(8) << addr << ", value = "
         << setw(8) << dst << '\n';
  }
}

void core::inc_pc() {
  pc++;
}

void core::i_lda(int ra, int rb, int disp) {
  ir[ra].i = ir[rb].i + extend(disp, 16);
  inc_pc();
}

void core::i_ldah(int ra, int rb, int disp) {
  ir[ra].i = ir[rb].i + extend(disp, 16) * 65536;
  inc_pc();
}

void core::i_lds(int ra, int rb, int disp) {
  int addr = ir[rb].i + extend(disp, 16);
  mem_ld_lw(fr[ra].u, addr);
  inc_pc();
}

void core::i_sts(int ra, int rb, int disp) {
  int addr = ir[rb].i + extend(disp, 16);
  mem_st_lw(fr[ra].u, addr);
  inc_pc();
}

void core::i_ldl(int ra, int rb, int disp) {
  int addr = ir[rb].i + extend(disp, 16);
  mem_ld_lw(ir[ra].u, addr);
  inc_pc();
}

void core::i_stl(int ra, int rb, int disp) {
  int addr = ir[rb].i + extend(disp, 16);
  mem_st_lw(ir[ra].u, addr);
  inc_pc();
}

int core::i_br(int ra, int disp) {
  ir[ra].i = pc;
  if(disp == 0) {
    return 1;
  }
  pc += extend(disp, 16);
  return 0;
}

void core::i_bsr(int ra, int disp) {
  ir[ra].i = pc;
  pc += extend(disp, 16);
}

void core::i_beq(int ra, int disp) {
  if(ir[ra].i == 0) {
    pc += extend(disp, 16);
  } else {
    inc_pc();
  }
}

void core::i_bne(int ra, int disp) {
  if(ir[ra].i != 0) {
    pc += extend(disp, 16);
  } else {
    inc_pc();
  }
}

void core::i_fbeq(int fa, int disp) {
  if(fr[fa].f == 0.0) {
    pc += extend(disp, 16);
  } else {
    inc_pc();
  }
}

void core::i_fbne(int fa, int disp) {
  if(fr[fa].f != 0.0) {
    pc += extend(disp, 16);
  } else {
    inc_pc();
  }
}

void core::i_jmp(int ra, int rb, int func) {
  ir[ra].i = pc;
  pc = ir[rb].i;
}

void core::i_jsr(int ra, int rb, int func) {
  ir[ra].i = pc;
  pc = ir[rb].i;
}

void core::i_ret(int ra, int rb, int func) {
  ir[ra].i = pc;
  pc = ir[rb].i;
}

void core::i_addl(int ra, int b, int rc) {
  ir[rc].i = ir[ra].i + b;
  inc_pc();
}

void core::i_subl(int ra, int b, int rc) {
  ir[rc].i = ir[ra].i - b;
  inc_pc();
}

void core::i_cmpeq(int ra, int b, int rc) {
  ir[rc].i = ir[ra].i == b ? 1 : 0;
  inc_pc();
}

void core::i_cmple(int ra, int b, int rc) {
  ir[rc].i = ir[ra].i <= b ? 1 : 0;
  inc_pc();
}

void core::i_cmplt(int ra, int b, int rc) {
  ir[rc].i = ir[ra].i < b ? 1 : 0;
  inc_pc();
}

void core::i_and(int ra, int b, int rc) {
  ir[rc].i = ir[ra].i & b;
  inc_pc();
}

void core::i_bis(int ra, int b, int rc) {
  ir[rc].i = ir[ra].i | b;
  inc_pc();
}

void core::i_xor(int ra, int b, int rc) {
  ir[rc].i = ir[ra].i ^ b;
  inc_pc();
}

void core::i_sll(int ra, int b, int rc) {
  ir[rc].i = ir[ra].i << b;
  inc_pc();
}

void core::i_srl(int ra, int b, int rc) {
  ir[rc].u = ir[ra].u >> b;
  inc_pc();
}

void core::i_sra(int ra, int b, int rc) {
  ir[rc].i = ir[ra].i >> b;
  inc_pc();
}

void core::i_itofs(int ra, int fc) {
  fr[fc].u = ir[ra].u;
  inc_pc();
}

void core::i_adds(int fa, int fb, int fc) {
  fr[fc].f = fr[fa].f + fr[fb].f;
  inc_pc();
}

void core::i_subs(int fa, int fb, int fc) {
  fr[fc].f = fr[fa].f - fr[fb].f;
  inc_pc();
}

void core::i_muls(int fa, int fb, int fc) {
  fr[fc].f = fr[fa].f * fr[fb].f;
  inc_pc();
}

void core::i_invs(int fb, int fc) {
  fr[fc].f = 1.0 / fr[fb].f;
  inc_pc();
}

void core::i_sqrts(int fb, int fc) {
  fr[fc].f = sqrtf(fr[fb].f);
  inc_pc();
}

void core::i_cmpseq(int fa, int fb, int fc) {
  fr[fc].f = fr[fa].f == fr[fb].f ? 2.0 : 0.0;
  inc_pc();
}

void core::i_cmpsle(int fa, int fb, int fc) {
  fr[fc].f = fr[fa].f <= fr[fb].f ? 2.0 : 0.0;
  inc_pc();
}

void core::i_cmpslt(int fa, int fb, int fc) {
  fr[fc].f = fr[fa].f < fr[fb].f ? 2.0 : 0.0;
  inc_pc();
}

void core::i_cvtsl_c(int fb, int fc) {
  fr[fc].i = (int)fr[fb].f;
  inc_pc();
}

void core::i_cvtls(int fb, int fc) {
  fr[fc].f = (float)fr[fb].i;
  inc_pc();
}

void core::i_ftois(int fa, int rc) {
  ir[rc].u = fr[fa].u;
  inc_pc();
}

ostream &operator<<(ostream &os, const core &c) {
  ios_base::fmtflags initflag = os.flags();
  os << hex << setfill('0') << uppercase;
  os << "PC  : " << setw(8) << c.pc << '\n';
  for(int i=0; i<NUM_OF_R; i++) {
    os << "$" << dec << setfill(' ') << setw(2) << left << i << " : "
       << hex << setfill('0') << setw(8) << right << c.ir[i].u
       << " = " << dec << setfill(' ') << setw(11) << c.ir[i].i
       << "    $f" << setw(2) << left << i << " : "
       << hex << setfill('0') << setw(8) << right << c.fr[i].u
       << " = " << c.fr[i].f << '\n';
  }
  os.flags(initflag);
  return os;
}
