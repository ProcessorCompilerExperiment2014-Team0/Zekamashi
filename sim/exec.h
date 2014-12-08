#ifndef EXEC_H
#define EXEC_H

#include <iostream>
#include <map>
#include <cstdint>
using namespace std;

#define NUM_OF_R 32
#define SIZE_OF_MEM (1 << 20)

enum Opt {
  OPTION_D, OPTION_R, OPTION_M, OPTION_S, OPTION_N,
  OPTION_N_ADDS, OPTION_N_SUBS, OPTION_N_MULS, OPTION_N_INVS, OPTION_N_SQRTS,
  OPTION_N_CVTSL, OPTION_N_CVTLS
};

enum Inst {
  I_LDA, I_LDAH, I_LDL, I_STL, I_BEQ, I_BNE, I_BR, I_BSR, I_JMP, I_JSR, I_RET,
  I_ADDL, I_SUBL, I_CMPEQ, I_CMPLE, I_CMPLT, I_AND, I_BIS, I_XOR, I_SLL, I_SRL,
  I_SRA, I_LDS, I_STS, I_FBEQ, I_FBNE, I_CMPSEQ, I_CMPSLE, I_CMPSLT,
  I_ADDS, I_SUBS, I_MULS, I_INVS, I_SQRTS, I_CVTSL, I_CVTLS, I_FTOIS, I_ITOFS,
  I_SENTINEL
};

union data_type {
  uint32_t u;
  int32_t i;
  float f;
};

class core {
private:
  unsigned pc;
  unsigned inst_len;
  data_type ir[NUM_OF_R];
  data_type fr[NUM_OF_R];
  uint32_t *mem;

  long long i_count;
  long long i_limit;
  long long i_stat[I_SENTINEL];
  char stat_file[256];
  unsigned opt; 
  map<int, uint32_t> test_map;
  map<unsigned, long long> br_map;
public:
  core(int argc, char **argv);
  ~core();
  int verify();
  void run();
  void show(ostream &os);
  void write_br_stat();
  friend ostream &operator<<(ostream &os, const core &c);
private:
  void set_test(const char*);
  inline void mem_st_lw(uint32_t &src, int addr);
  inline void mem_ld_lw(uint32_t &dst, int addr);
  inline void inc_pc();
  inline void i_lda(int ra, int rb, int disp);
  inline void i_ldah(int ra, int rb, int disp);
  inline void i_lds(int ra, int rb, int disp);
  inline void i_sts(int ra, int rb, int disp);
  inline void i_ldl(int ra, int rb, int disp);
  inline void i_stl(int ra, int rb, int disp);
  inline int i_br(int ra, int disp);
  inline void i_bsr(int ra, int disp);
  inline void i_beq(int ra, int disp);
  inline void i_bne(int ra, int disp);
  inline void i_fbeq(int fa, int disp);
  inline void i_fbne(int fa, int disp);
  inline void i_jmp(int ra, int rb, int func);
  inline void i_jsr(int ra, int rb, int func);
  inline void i_ret(int ra, int rb, int func);
  inline void i_addl(int ra, int b, int rc);
  inline void i_subl(int ra, int b, int rc);
  inline void i_cmpeq(int ra, int b, int rc);
  inline void i_cmple(int ra, int b, int rc);
  inline void i_cmplt(int ra, int b, int rc);
  inline void i_and(int ra, int b, int rc);
  inline void i_bis(int ra, int b, int rc);
  inline void i_xor(int ra, int b, int rc);
  inline void i_sll(int ra, int b, int rc);
  inline void i_srl(int ra, int b, int rc);
  inline void i_sra(int ra, int b, int rc);
  inline void i_itofs(int ra, int fc);
  inline void i_adds(int fa, int fb, int fc);
  inline void i_subs(int fa, int fb, int fc);
  inline void i_muls(int fa, int fb, int fc);
  inline void i_invs(int fb, int fc);
  inline void i_sqrts(int fb, int fc);
  inline void i_cmpseq(int fa, int fb, int fc);
  inline void i_cmpsle(int fa, int fb, int fc);
  inline void i_cmpslt(int fa, int fb, int fc);
  inline void i_cvtsl_c(int fb, int fc);
  inline void i_cvtls(int fb, int fc);
  inline void i_ftois(int fa, int rc);

  inline static int extend(int v, int len);
  inline static ostream &dmanip(ostream &st);
};

#endif
