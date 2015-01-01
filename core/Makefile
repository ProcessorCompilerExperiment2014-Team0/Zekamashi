TESTBENCH = coretb
COMPONENTS = alu core instcache mmu datacache u232c_in u232c_out
SIMS = u232c_sim coretb sim_sram
GHDLC = ghdl
GHDLFLAGS  = -g --ieee=synopsys --mb-comments
GHDL_SIM_OPT = --stop-time=100us

.PHONY: clean reload $(TESTBENCH)
all: $(TESTBENCH)

../asm/asagumo:
	cd ../asm; omake

components/code.dat: components/code.s misc/tohex ../asm/asagumo
	../asm/asagumo components/code.s
	misc/tohex 4 < components/code > components/code.dat

work-obj93.cf reload: $(COMPONENTS:%=components/%.vhd) $(SIMS:%=sim/%.vhd)
	$(GHDLC) -i $(GHDLFLAGS) $^

$(TESTBENCH): components/code.dat | work-obj93.cf
	$(GHDLC) -m $(GHDLFLAGS) $@
	$(GHDLC) -r $(GHDLFLAGS) $@ $(GHDL_SIM_OPT) --wave=$@.ghw

clean :
	$(GHDLC) --clean
	$(RM) coretb.ghw work-obj93.cf misc/tohex misc/fromhex
	$(RM) components/code.dat components/code
