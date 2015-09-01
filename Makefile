
all: deps lang solver

lang:
	cd lang; make

solver:
	cd solver; make

deps: 
	cp dep/z3/build/libz3.dylib solver/

clean:
	cd solver; make clean
	cd lang; make clean
