#include <iostream>
#include "exec.h"
using namespace std;

int main(int argc, char **argv) {
  if(argc < 2) {
    cerr << "usage: amatsukaze code [options]\n";
  }
  core c(argc, argv);
  c.run();

  cerr << c;
  return 0;
}
