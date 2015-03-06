.PHONY: all
all: runHello

runHello: LDLIBS+=-ldl
runHello: runHello.o libhello.so

libhello.so: hello.o

run: export LD_LIBRARY_PATH:=.:$(LD_LIBRARY_PATH)
.PHONY: run
run: all
	./runHello

.PHONY: clean
clean:
	$(RM) *.[adios] runHello libhello.so

include ../../include/makelib/Library.mak
