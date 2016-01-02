
#all: deps lang solver
all: simulator solver deps

simulator:
	cd sim; make 

solver:
	cd solver; make

deps:
	cd dep; make
	#cp dep/z3/build/libz3.dylib solver/

clean:
	cd solver; make clean
	cd sim; make clean
	cd dep; make clean
