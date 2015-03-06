ifeq (,$(MAKELIB/LIBRARY.MAK))
MAKELIB/LIBRARY.MAK:=$(lastword $(MAKEFILE_LIST))

ARFLAGS:=rcs
AR.saved:=$(AR)
AR=flock .$@.lock $(AR.saved)

# File to include from your Makefile like this:
# include makelib/Library.mak

%.so: override LDFLAGS+=-shared
%.so: CFLAGS+=-fPIC

%.so:
	$(LINK.o) $^ -o $@

.PHONY: clean
clean: cleanLib

.PHONY: cleanLib
cleanLib:
	$(RM) .*.lock

endif
