LIBDIR = ../mylib

COM = vcom
COMFLAGS = -work $(LIBDIR)
SRCS = coretb.vhd  fileio.vhd loopbacktb.vhd sramsim.vhd u232c_sim.vhd u232ctb.vhd
TAGS = $(patsubst %.vhd,.%.tag,$(SRCS))

.PHONY: clean

all: $(TAGS)
	touch ../.simtag

.coretb.tag: .sramsim.tag .u232c_sim.tag
.loopbacktb.tag: .fileio.tag
.u232ctb.tag: .fileio.tag

.%.tag: %.vhd ../.mylibtag ../.componentstag
	$(COM) $(COMFLAGS) $<
	touch $@

clean:
	$(RM) $(TAGS)
