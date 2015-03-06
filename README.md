# makelib
Library makefile for creating *static link libraries* and *dynamic link libraries*.

## Supported features
- Building dynamic link libraries with suffix `.so`
- Building static link libraries with suffix `.a`
- Workaround for glitch in `make` + `ar` which leads to a race condition on library files when using `make -j` 

## Building Shared Libraries and Dynamic Link Libraries
The following sample `Makefile` shows how to build a library which can be used as *shared library* or *dynamic link library* using `makelib`.

~~~~make
.PHONY: all
all: libMylib.so

libMylib.so: object1.o object2.o object3.o

include makelib/Library.mak
~~~~

The big difference between a shared library and a dynamic link library is the load time.
That distinction is not made by the library but by the program that uses the library.
If the program loads the library at load time, it's a shared library.
If the program loads the library at runtime, it's a dynamic link library.
The examples in the `test/` directory contain both cases.

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
- http://tldp.org/HOWTO/Program-Library-HOWTO/index.html
