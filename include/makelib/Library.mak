ifeq (,$(MAKELIB/LIBRARY.MAK))
MAKELIB/LIBRARY.MAK:=$(lastword $(MAKEFILE_LIST))

# File to include from your Makefile like this:
# include makelib/Library.mak

# Act as ranlib, that's what most users want.
ARFLAGS:=rcs

# Wrap with flock, so multiple make jobs on the same archive wouldn't corrupt it, they would simply wait for each other.
AR.saved:=$(AR)
AR=flock .$@.lock $(AR.saved)

## Additional CFLAGS used when building for a shared object.
CFLAGS.so:=-fPIC

## Additional LDFLAGS used when linking a shared object.
LDFLAGS.so:=-shared

## Linker for shared object.
LINK.so=$(LINK.o)

%.so: LDFLAGS+=$(LDFLAGS.so)
%.so: CFLAGS+=$(CFLAGS.so)

%.so:
	$(LINK.so) $^ -o $@

.PHONY: clean
clean: cleanLib

.PHONY: cleanLib
cleanLib:
	$(RM) .*.lock

endif
