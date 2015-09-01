

all: build

install:
	cd spice; make install
	
build:
	cd z3; make
	cd dreal; make
	cd leon; make
	cd z3overlay; make
	cd pycaml; make
	cd spice; make

clean:
	cd z3; make clean
	cd z3overlay; make clean
	cd dreal; make clean
	cd leon; make clean
	cd pycaml; make clean
	cd spice; make clean
