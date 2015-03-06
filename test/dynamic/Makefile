.PHONY: all
all: runHello libhello.so

runHello: LDLIBS+=-ldl
runHello: runHello.o

libhello.so: hello.o

.PHONY: run
run: all
	./runHello

.PHONY: clean
clean:
	$(RM) *.[adios] runHello libhello.so

include ../../include/makelib/Library.mak
