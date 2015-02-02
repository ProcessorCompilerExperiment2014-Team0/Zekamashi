CC = gcc
CFLAGS = -std=c99

TESTBENCH = coretb loopbacktb u232ctb
SIMS = u232c_sim coretb sramsim
GHDLC = ghdl
GHDLFLAGS  = -g --ieee=synopsys --mb-comments
GHDL_SIM_OPT = --stop-time=500us

CORETB_DEPS = alu.vhd core.vhd datacache.vhd datacache_ram.vhd inputbuf.vhd instcache.vhd meminit.vhd mmu.vhd regfile.vhd sram.vhd u232c_in.vhd u232c_out.vhd
CORETB_SIM = coretb.vhd rxtx.vhd sramsim.vhd util.vhd
LOOPBACKTB_DEPS = inputbuf.vhd loopback.vhd u232c_in.vhd u232c_out.vhd
LOOPBACKTB_SIM = loopbacktb.vhd rxtx.vhd

.PHONY: clean reload $(TESTBENCH)
all: $(TESTBENCH)

../asm/asagumo:
	cd ../asm; omake

components/code: components/code.s ../asm/asagumo
	../asm/asagumo components/code.s | tee components/code.log

components/meminit.vhd: components/code components/meminit.erb
	cd components; ruby meminit.erb

coretb: $(CORETB_DEPS:%=components/%) $(CORETB_SIM:%=sim/%)
loopbacktb: $(LOOPBACKTB_DEPS:%=components/%) $(LOOPBACKTB_SIM:%=sim/%)
u232ctb: $(U232CTB_DEPS:%=components/%) $(U232CTB_SIM:%=sim/%)

$(TESTBENCH):
	$(GHDLC) -i $(GHDLFLAGS) $(filter %.vhd, $^)
	$(GHDLC) -m $(GHDLFLAGS) $@
	$(GHDLC) -r $(GHDLFLAGS) $@ $(GHDL_SIM_OPT) --wave=$@.ghw

clean :
	$(GHDLC) --clean
	$(RM) coretb.ghw work-obj93.cf misc/tohex misc/fromhex
	$(RM) components/meminit.vhd components/code components/code.log
