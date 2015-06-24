
CXX=g++-mp-4.8
CC=gcc-mp-4.8

all: bin/dReal bin/dReach

build/dReal: build/Makefile
	cd build; make -j8 && ctest

bin/dReach bin/dReal:build/dReal
	cd tools; make

build/Makefile:
	git pull
	mkdir -p build/
	cd build/; cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_CXX_COMPILER=$(CXX) -DCMAKE_C_COMPILER=$(CC) ../src

clean:
	rm -rf build
	rm -rf bin