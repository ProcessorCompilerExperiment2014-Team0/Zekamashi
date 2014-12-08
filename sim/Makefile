targ = amatsukaze
fpudir = ../FPU/
fpus = def.o fadd.o fsub.o fmul.o fneg.o finv.o fsqrt.o ftrc.o itof.o
CC = gcc
CPPFLAGS = -Wall -O2
CXXFLAGS = -std=c++0x
LOADLIBES = -lm

all: $(targ)

amatsukaze.o: exec.h

exec.o: exec.cpp exec.h fpu.h

amatsukaze: amatsukaze.o exec.o $(addprefix $(fpudir), $(fpus))
	$(CXX) $(LDFLAGS) $^ $(LOADLIBES) -o $@

clean:
	rm -rf $(targ) $(addprefix $(fpudir), $(fpus)) *.o

.PHONY: all clean
