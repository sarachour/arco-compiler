

all: build/z3 test install

build/z3: build
	cd build; make -j 8

install:
	cd build; sudo make install 
	cd build; sudo make ocamlfind_install

build:
	python scripts/mk_make.py --ml

test:
	cd build; make test

clean:
	rm -rf build
