#ifndef FPU_H
#define FPU_H

#include <cstdint>

extern "C" {
  uint32_t fadd(uint32_t, uint32_t);
  uint32_t fsub(uint32_t, uint32_t);
  uint32_t fmul(uint32_t, uint32_t);
  uint32_t fneg(uint32_t);
  uint32_t finv(uint32_t);
  uint32_t fsqrt(uint32_t);
  uint32_t ftrc(uint32_t);
  uint32_t itof(uint32_t);
}

#endif
