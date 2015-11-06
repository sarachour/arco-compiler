
#ARGS=C_INCLUDE_PATH=/opt/local/include LIBRARY_PATH=/opt/local/lib CC=gcc-mp-4.8
ARGS=

all: build

z3overlay:
	git clone https://github.com/termite-analyser/z3overlay.git

build: z3overlay
	cd z3overlay; ./configure --enable-tests
	cd z3overlay; $(ARGS) make
	cd z3overlay; make install

test:
	cd z3overlay; make test


clean:
	cd z3overlay; make clean
