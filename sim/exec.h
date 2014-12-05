#ifndef EXEC_H
#define EXEC_H

#include <iostream>
using namespace std;

#define NUM_OF_R 32
#define SIZE_OF_MEM (1 << 20)

enum Opt {
  OPTION_D, OPTION_R, OPTION_M, OPTION_N
};

union data_type {
  unsigned u;
  int i;
  float f;
};

class core {
private:
  unsigned pc;
  unsigned inst_len;
  data_type ir[NUM_OF_R];
  data_type fr[NUM_OF_R];
  unsigned *mem;

  long long i_count;
  long long i_limit;
  unsigned opt; 

public:
  core(int argc, char **argv);
  ~core();
  void run();
  friend ostream &operator<<(ostream &os, const core &c);
private:
  inline void mem_st_lw(unsigned &src, int addr);
  inline void mem_ld_lw(unsigned &dst, int addr);
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
};

#endif
