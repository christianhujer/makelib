TARGETS:=all run clean
DIRS:=$(wildcard */)

.PHONY: $(TARGETS)
$(TARGETS): $(DIRS)

.PHONY: $(DIRS)
$(DIRS):
	$(MAKE) -C $@ $(MAKECMDGOALS)
