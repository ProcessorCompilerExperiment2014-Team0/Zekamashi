LIBDIR	= mylib

MKLIB	= vlib
MAP	= vmap
SIM	= vsim
SIMFLAGS	= -c -lib mylib -do "run 20ms; quit"
TESTBENCH = coretb loopbacktb u232ctb

.PHONY: clean .simtag .componentstag

all: $(TESTBENCH)

../asm/asagumo:
	cd ../asm; omake

components/code.s:
components/code.dat: components/code.s misc/tohex ../asm/asagumo
	../asm/asagumo components/code.s
	misc/tohex 4 < components/code > components/code.dat

.componentstag: .mylibtag
	cd components; make

.simtag: .mylibtag .componentstag
	cd sim; make

coretb: components/code.dat
$(TESTBENCH): .mylibtag .simtag .componentstag
	$(SIM) $(SIMFLAGS) $@

.mylibtag:
	$(MKLIB) $(LIBDIR)
	$(MAP) work $(LIBDIR)
	touch $@

## Cleaning target.
clean:
	cd sim; make clean
	cd components; make clean
	rm -rf transcript modelsim.ini .simtag .componentstag .mylibtag mylib
