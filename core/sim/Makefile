LIBDIR = ../mylib

COM = vcom
COMFLAGS = -work $(LIBDIR)
SRCS = coretb.vhd loopbacktb.vhd sramsim.vhd rxtx.vhd rxtxtb.vhd
TAGS = $(patsubst %.vhd,.%.tag,$(SRCS))

.PHONY: clean

all: $(TAGS)
	touch ../.simtag

.coretb.tag: .sramsim.tag .rxtx.tag
.loopbacktb.tag: .rxtx.tag
.rxtxtb.tag: .rxtx.tag

.%.tag: %.vhd ../.mylibtag ../.componentstag
	$(COM) $(COMFLAGS) $<
	touch $@

clean:
	$(RM) $(TAGS)
