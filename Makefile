
#all: deps lang solver
all: solver

lang:
	cd lang; make

solver:
	cd solver; make

deps: 
	cd dep; make
	cp dep/z3/build/libz3.dylib solver/

clean:
	cd solver; make clean
	cd lang; make clean
