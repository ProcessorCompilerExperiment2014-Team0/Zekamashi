TESTBENCH = coretb
COMPONENTS = alu core instcache mmu u232c_in u232c_out
SIMS = u232c_sim coretb sim_sram
GHDLC = ghdl
GHDLFLAGS  = -g --ieee=synopsys --mb-comments
GHDL_SIM_OPT = --stop-time=100us

.PHONY: clean $(TESTBENCH)
all: $(TESTBENCH)

components/code.dat: components/code.s misc/tohex
	../asm/asagumo components/code.s
	misc/tohex 4 < components/code > components/code.dat

work-obj93.cf: $(COMPONENTS:%=components/%.vhd) $(SIMS:%=sim/%.vhd)
	$(GHDLC) -i $(GHDLFLAGS) $^

$(TESTBENCH): work-obj93.cf components/code.dat
	$(GHDLC) -m $(GHDLFLAGS) $@
	$(GHDLC) -r $(GHDLFLAGS) $@ $(GHDL_SIM_OPT) --wave=$@.ghw

clean :
	$(GHDLC) --clean
	$(RM) *.ghw work-obj93.cf misc/tohex misc/fromhex
	$(RM) components/code.dat components/code
