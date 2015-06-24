

all: build/z3

build/z3: build
	cd build; make -j 8
	
build:
	git pull
	./configure
	python scripts/mk_make.py


clean:
	rm -rf build
