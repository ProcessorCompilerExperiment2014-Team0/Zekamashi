CC = gcc
CPPFLAGS = -Wall -O2
CXXFLAGS = -std=c++0x
LOADLIBES = -lm

targ = amatsukaze
fpudir = ../FPU/
fpus = def.o fadd.o fsub.o fmul.o fneg.o finv.o fsqrt.o ftrc.o itof.o
fpu = $(addprefix $(fpudir), $(fpus))

exec = ./amatsukaze
asm = ../asm/asagumo
execflags = -d -enable-stall
test_src = $(shell echo test/*.s)
test_targ = $(test_src:%.s=%.test)

all: $(targ)

$(fpu):
	$(MAKE) -C $(fpudir) $(fpus)

amatsukaze.o: amatsukaze.cpp exec.h

exec.o: exec.cpp exec.h fpu.h

amatsukaze: amatsukaze.o exec.o $(fpu)
	$(CXX) $(LDFLAGS) $^ $(LOADLIBES) -o $@

test: $(test_targ)

%.test: %.x $(exec)
	$(exec) $< $(execflags)

%.x: %.s
	$(asm) $< -o $@ > /dev/null

clean:
	$(RM) $(targ) $(fpu) *.o test/*.x

.PHONY: all clean test %.test
