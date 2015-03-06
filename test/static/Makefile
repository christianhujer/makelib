.PHONY: all
all: runHello

runHello: runHello.o libhello.a

libhello.a: libhello.a(hello.o)

.PHONY: run
run: all
	./runHello

.PHONY: clean
clean:
	$(RM) *.[adios] runHello

include ../../include/makelib/Library.mak
