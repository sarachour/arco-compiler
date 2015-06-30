
DIFFEQ=../diffeq
DEPS=*.ml
ARGS=C_INCLUDE_PATH=/opt/local/include LIBRARY_PATH=/opt/local/lib CC=gcc-mp-4.8 

#LIBS=-package extlib  -package yojson -package z3 -package z3overlay
LIBS=-package extlib  -package yojson 

all: solver

solver: $(DEPS)
	 $(ARGS) ocamlbuild -use-ocamlfind CircuitSolver.native && mv CircuitSolver.native solver
	 chmod +x solver

clean:
	ocamlbuild -clean