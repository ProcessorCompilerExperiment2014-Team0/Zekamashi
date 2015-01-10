TESTBENCH = coretb loopbacktb u232ctb
SIMS = u232c_sim coretb sim_sram
GHDLC = ghdl
GHDLFLAGS  = -g --ieee=synopsys --mb-comments
GHDL_SIM_OPT = --stop-time=2ms

CORETB_DEPS = alu.vhd core.vhd instcache.vhd mmu.vhd datacache.vhd u232c_in.vhd inputbuf.vhd u232c_out.vhd
CORETB_SIM = coretb.vhd u232c_sim.vhd sim_stam.vhd
LOOPBACKTB_DEPS = loopback.vhd  u232c_in.vhd inputbuf.vhd u232c_out.vhd
LOOPBACKTB_SIM = loopbacktb.vhd fileio.vhd
U232CTB_DEPS = u232c_in.vhd inputbuf.vhd u232c_out.vhd
U232CTB_SIM = u232ctb.vhd fileio.vhd


.PHONY: clean reload $(TESTBENCH)
all: $(TESTBENCH)

../asm/asagumo:
	cd ../asm; omake

components/code.dat: components/code.s misc/tohex ../asm/asagumo
	../asm/asagumo components/code.s
	misc/tohex 4 < components/code > components/code.dat

coretb: $(CORETB_DEPS:%=components/%) $(CORETB_SIM:%=sim/%)
loopbacktb: $(LOOPBACKTB_DEPS:%=components/%) $(LOOPBACKTB_SIM:%=sim/%)
u232ctb: $(U232CTB_DEPS:%=components/%) $(U232CTB_SIM:%=sim/%)

$(TESTBENCH):
	$(GHDLC) -i $(GHDLFLAGS) $^
	$(GHDLC) -m $(GHDLFLAGS) $@
	$(GHDLC) -r $(GHDLFLAGS) $@ $(GHDL_SIM_OPT) --wave=$@.ghw

clean :
	$(GHDLC) --clean
	$(RM) coretb.ghw work-obj93.cf misc/tohex misc/fromhex
	$(RM) components/code.dat components/code
