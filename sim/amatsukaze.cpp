#include <iostream>
#include <cstring>
#include "exec.h"
using namespace std;

void print_options() {
  cerr <<
    "Usage: amatsukaze code [testfile] [options]\n"
    "Options:\n"
    "  --help     Display this information\n"
    "  -d         Show PCs and codes in every execution\n"
    "  -r         Show contents of all the registers in every execution\n"
    "  -m         Show addresses and values in every memory access\n"
    "  -n <inst>  Use native operations in floating-point instructions\n"
    "  -l <n>     Stop execution in at most n instructions\n"
    "  -s <file>  Output \"bsr\" statistics to <file> (default: code.log)\n"
    "  -ir <file> Output contents of integer registers to <file> "
    "(default: code.ilog)\n"
    "  -fr <file> Output contents of floating-point registers to <file> "
    "(default: code.flog)\n";
}

int main(int argc, char **argv) {
  if(argc < 2) {
    cerr << "usage: amatsukaze code [options]\n";
    return 1;;
  } else if(!strcmp(argv[1], "--help")) {
    print_options();
    return 0;
  }
  core c(argc, argv);
  c.run();

  cerr << c;
  c.write_br_stat();
  return c.verify();
}
