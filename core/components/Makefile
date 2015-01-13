LIBDIR = ../mylib

COM = vcom
COMFLAGS = -work $(LIBDIR)
SRCS = alu.vhd  core.vhd datacache_ram.vhd  instcache.vhd  mmu.vhd u232c_in.vhd datacache.vhd  inputbuf.vhd loopback.vhd sram.vhd  u232c_out.vhd
TAGS = $(patsubst %.vhd,.%.tag,$(SRCS))

.PHONY: clean

all: $(TAGS)
	touch ../.simtag

.core.tag: .alu.tag .mmu.tag
.mmu.tag: .datacache.tag .u232c_in.tag .u232c_out.tag
.u232c_in.tag: .inputbuf.tag
.datacache.tag: .datacache_ram.tag .sram.tag
.loopback.tag: .u232c_in.tag .u232c_out.tag

.%.tag: %.vhd ../.mylibtag
	$(COM) $(COMFLAGS) $<
	touch $@

clean:
	$(RM) $(TAGS)
