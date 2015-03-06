# makelib
Library makefile for creating *static link libraries* and *dynamic link libraries*.

## Supported features
- Building dynamic link libraries with suffix `.so`
- Building static link libraries with suffix `.a`
- Workaround for glitch in `make` + `ar` which leads to a race condition on library files when using `make -j` 

## Building Dynamic Link Libraries
The following sample `Makefile` shows how to build a *dynamic link library* using `makelib`.

~~~~make
.PHONY: all
all: libMylib.so

libMylib.so: object1.o object2.o object3.o

include makelib/Library.mak
~~~~

## Building Static Link Libraries
The following sample `Makefile` shows how to build a *static link library* using `makelib`.

~~~make
.PHONY: all
all: libMylib.a

libMylib.a: object1.o object2.o object3.o

include makelib/Library.mak
~~~~

## See also
- the `test/` directory
- [http://tldp.org/HOWTO/Program-Library-HOWTO/index.html]
