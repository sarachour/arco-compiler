
all: deps

deps: 
	cd dep; make

clean:
	cd dep; make clean