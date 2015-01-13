LIBDIR	= mylib

MKLIB	= vlib
MAP	= vmap
SIM	= vsim
SIMFLAGS =
TESTBENCH = coretb loopbacktb u232ctb rxtxtb

.PHONY: clean .simtag .componentstag $(TESTBENCH) $(TESTBENCH:%=%wave)

all: $(TESTBENCH)

../asm/asagumo:
	cd ../asm; omake

components/code.s:

components/code.dat: components/code.s misc/tohex ../asm/asagumo
	../asm/asagumo components/code.s
	misc/tohex 4 < components/code > components/code.dat

.mylibtag:
	$(MKLIB) $(LIBDIR)
	$(MAP) work $(LIBDIR)
	touch .mylibtag

.componentstag: .mylibtag
	cd components; make
	touch .componentstag

.simtag: .mylibtag .componentstag
	cd sim; make
	touch .simtag

coretbwave: components/code.dat
$(TESTBENCH:%=%wave): SIMFLAGS += -do "add wave -r *; run 20ms"
$(TESTBENCH:%=%wave): .mylibtag .simtag .componentstag
	$(SIM) $(SIMFLAGS) $(@F:%wave=%)

coretb: components/code.dat
$(TESTBENCH): SIMFLAGS += -c -do "run 20ms; quit"
$(TESTBENCH): .mylibtag .simtag .componentstag
	$(SIM) $(SIMFLAGS) $@

clean:
	cd components; make clean
	cd sim; make clean
	$(RM) -rf .mylibtag .componentstag .simtag mylib
