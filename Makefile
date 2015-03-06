## Installation prefix.
PREFIX:=/usr/local/

control.Description:=makelib - Reusable make support for creating static and dynamic link libraries.

## Installation directory for include files.
INCDIR=$(PREFIX)/include/

.PHONY: install
## Installs makelib on your system.
install:
	install -d $(INCDIR)/makelib/
	install -m 0644 -t $(INCDIR)/makelib/ include/makelib/*

.PHONY: uninstall
## Removes makelib from your system.
uninstall:
	$(RM) -r $(INCDIR)/makelib/

include makedist/MakeDist.mak
-include makehelp/Help.mak
