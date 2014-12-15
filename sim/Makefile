targ = amatsukaze
fpudir = ../FPU/
fpus = def.o fadd.o fsub.o fmul.o fneg.o finv.o fsqrt.o ftrc.o itof.o
fpu = $(addprefix $(fpudir), $(fpus))
CC = gcc
CPPFLAGS = -Wall -O2
CXXFLAGS = -std=c++0x
LOADLIBES = -lm

all: $(targ)

$(fpu):
	$(MAKE) -C $(fpudir) $(fpus)

amatsukaze.o: amatsukaze.cpp exec.h

exec.o: exec.cpp exec.h fpu.h

amatsukaze: amatsukaze.o exec.o $(fpu)
	$(CXX) $(LDFLAGS) $^ $(LOADLIBES) -o $@

clean:
	rm -rf $(targ) $(fpu) *.o

.PHONY: all clean
