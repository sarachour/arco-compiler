
#all: deps lang solver
all: solver deps

solver:
	cd solver; make

deps:
	cd dep; make
	cp dep/z3/build/libz3.dylib solver/

clean:
	cd solver; make clean
	cd dep; make clean
