
CXX=g++-mp-4.8
CC=gcc-mp-4.8

all: build/dreal

build/dreal: build
	cd build; make && ctest
	
build/:
	git pull
	mkdir -p build/
	cd build/; cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_CXX_COMPILER=$(CXX) -DCMAKE_C_COMPILER=$(CC) ../src

clean:
	rm -rf build
