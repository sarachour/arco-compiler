

all: build/z3

build/z3: build
	cd build; make -j 8
	make install 
	
build:
	python scripts/mk_make.py --ml


clean:
	rm -rf build
