targ = amatsukaze
fpudir = ../FPU/
fpu_obj = def.o fadd.o fsub.o fmul.o fneg.o finv.o fsqrt.o ftrc.o itof.o
fpu_dat = finv_table.dat fsqrt_table.dat
CC = gcc
CPPFLAGS = -Wall -O2
CXXFLAGS = -std=c++0x
LOADLIBES = -lm

all: $(targ)

fpu:
	$(MAKE) -C $(fpudir) $(fpu_obj) $(fpu_dat)
	cp $(addprefix $(fpudir), $(fpu_dat)) .

amatsukaze.o: amatsukaze.cpp exec.h

exec.o: exec.cpp exec.h fpu.h

amatsukaze_obj = amatsukaze.o exec.o $(addprefix $(fpudir), $(fpu_obj))
amatsukaze: amatsukaze.o exec.o fpu
	$(CXX) $(LDFLAGS) $(amatsukaze_obj) $(LOADLIBES) -o $@

clean:
	rm -rf $(targ) $(fpu) *.o

.PHONY: all clean fpu
