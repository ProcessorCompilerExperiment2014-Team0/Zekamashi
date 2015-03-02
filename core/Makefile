CC = gcc
CFLAGS = -std=c99

TESTBENCH = coretb coretb_nomiss coretb_u232c_nobusy loopbacktb u232ctb
GHDLC = ghdl
GHDLFLAGS  = -g --ieee=synopsys --mb-comments -fexplicit
GHDL_SIM_OPT = --stop-time=100us
CORETB_DEPS = alu.vhd core.vhd datacache.vhd datacache_ram.vhd fpu.vhd inputbuf.vhd instcache.vhd meminit.vhd mmu.vhd regfile.vhd sram.vhd u232c_in.vhd u232c_out.vhd
CORETB_SIM = coretb.vhd rxtx.vhd sramsim.vhd util.vhd
CORETB_NOMISS_SIM = coretb_nomiss.vhd datacache_nomiss.vhd rxtx.vhd sramsim.vhd util.vhd
CORETB_U232C_NOBUSY_SIM = coretb_u232c_nobusy.vhd u232c_nobusy.vhd sramsim.vhd util.vhd
LOOPBACKTB_DEPS = inputbuf.vhd loopback.vhd u232c_in.vhd u232c_out.vhd
LOOPBACKTB_SIM = loopbacktb.vhd rxtx.vhd
FPU_DEPS = fpu_common.vhd fadd_pipeline.vhd fmul_pipeline.vhd ftoi_func.vhd \
	   ftoi_pipeline.vhd itof_func.vhd itof_pipeline.vhd fcmp.vhd feq_pipeline.vhd \
	   fle_pipeline.vhd flt_pipeline.vhd finv.vhd fsqrt.vhd table.vhd

.PHONY: clean reload $(TESTBENCH)
all: $(TESTBENCH)

../asm/asagumo:
	cd ../asm; omake

../FPU/table.vhd:
	cd ../FPU; make table.vhd

components/code: components/code.s ../asm/asagumo
	../asm/asagumo components/code.s | tee components/code.log

components/meminit.vhd: components/code components/meminit.erb
	cd components; ruby meminit.erb

coretb: $(CORETB_DEPS:%=components/%) $(CORETB_SIM:%=sim/%) $(FPU_DEPS:%=../FPU/%)
coretb_nomiss: $(CORETB_DEPS:%=components/%) $(CORETB_NOMISS_SIM:%=sim/%) $(FPU_DEPS:%=../FPU/%)
coretb_u232c_nobusy: $(CORETB_DEPS:%=components/%) $(CORETB_U232C_NOBUSY_SIM:%=sim/%) $(FPU_DEPS:%=../FPU/%)
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
