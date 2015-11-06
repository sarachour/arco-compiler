

all: build/z3 test install


build/z3: build
	cd z3/build; make -j 8

install:
	cd z3/build; sudo make install
	cd z3/build; make ocamlfind_install

build:
	cd z3; python scripts/mk_make.py --ml

test:
	cd z3/build; make test

clean:
	rm -rf z3/build
