.PHONY: all run clean
all run clean: dynamic shared static

.PHONY: dynamic shared static
dynamic shared static:
	$(MAKE) -C $@ $(MAKECMDGOALS)
