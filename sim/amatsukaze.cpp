#include <iostream>
#include <cstring>
#include "exec.h"
using namespace std;

void print_options() {
  cerr <<
    "Usage: amatsukaze code [testfile] [options]\n"
    "Options:\n"
    "  --help      Display this information\n"
    "  -d          Show PCs and codes in every execution\n"
    "  -r          Show contents of all the registers in every execution\n"
    "  -m          Show addresses and values in every memory access\n"
    "  -n <inst>   Use native operations in floating-point instructions\n"
    "  -l <n>      Stop execution in at most n instructions\n"
    "  -s <file>   Output \"bsr\" statistics to <file> (default: code.log)\n"
    "  -ir <file>  Output contents of integer registers to <file> "
    "(default: code.ilog)\n"
    "  -fr <file>  Output contents of floating-point registers to <file> "
    "(default: code.flog)\n"
    "  -cache x y  Use direct-mapped cache whose index is x bits and line is y bits "
    "(default: -cache 7 3)\n"
    "  -cache2 x y Use 2way set associative cache\n"
    "  -nc         Do not update cache in memory store\n";
}

int main(int argc, char **argv) {
  if(argc < 2) {
    cerr << "usage: amatsukaze code [options]\n";
    return 1;;
  } else if(!strcmp(argv[1], "--help")) {
    print_options();
    return 0;
  }
  string program(argv[1]);
  ifstream *test_file = NULL;
  ofstream *blog = NULL;
  ofstream *ilog = NULL;
  ofstream *flog = NULL;
  unsigned opt = 0u;
  long long i_limit = -1ll;
  int cache_way = 1;
  int cache_idx = 7;
  int cache_line = 3;
  string buf;
  if(argc >= 3) {
    int i = 2;
    if(argv[2][0] != '-') {
      test_file = new ifstream(argv[2]);
      i++;
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
        } else if(!strcmp(argv[i], "-nc")) {
          opt |= 1 << OPTION_NC;
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
          if(i+1 >= argc || argv[i+1][0] == '-') {
            buf.assign(program);
            buf.append(".log");
          } else {
            buf.assign(argv[++i]);
          }
          blog = new ofstream(buf);
        } else if(!strcmp(argv[i], "-ir")) {
          if(i+1 >= argc || argv[i+1][0] == '-') {
            buf.assign(program);
            buf.append(".ilog");
          } else {
            buf.assign(argv[++i]);
          }
          ilog = new ofstream(buf);
        } else if(!strcmp(argv[i], "-fr")) {
          if(i+1 >= argc || argv[i+1][0] == '-') {
            buf.assign(program);
            buf.append(".flog");
          } else {
            buf.assign(argv[++i]);
          }
          flog = new ofstream(buf);
        } else if(!strcmp(argv[i], "-l")) {
          i++;
          if(i >= argc) {
            throw argv[i];
          }
          sscanf(argv[i], "%lld", &i_limit);
        } else if(!strcmp(argv[i], "-cache")) {
          if(i+2 >= argc) {
            throw argv[i];
          }
          sscanf(argv[++i], "%d", &cache_idx);
          sscanf(argv[++i], "%d", &cache_line);
        } else if(!strcmp(argv[i], "-cache2")) {
          cache_way = 2;
          if(i+2 >= argc) {
            throw argv[i];
          }
          sscanf(argv[++i], "%d", &cache_idx);
          sscanf(argv[++i], "%d", &cache_line);
        } else {
          throw argv[i];
        }
      }
    } catch (char *s) {
      cerr << "Invalid Option: " << s << endl;
      exit(1);
    }
  }

  core c(program, test_file, opt, i_limit, blog, ilog, flog,
         cache_way, cache_idx, cache_line);
  c.run();

  cerr << c;
  c.write_br_stat();
  return c.verify();
}
