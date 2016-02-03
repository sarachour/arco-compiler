
DIFFEQ=../diffeq
DEPS=*.ml *.mly *.mll
ARGS=C_INCLUDE_PATH=/opt/local/include LIBRARY_PATH=/opt/local/lib CC=gcc-mp-4.8 

#LIBS=-package extlib  -package yojson -package z3 -package z3overlay
LIBS=-package extlib  -package yojson 

all: compiler compiler.debug

compiler.debug: $(DEPS)
	 $(ARGS) ocamlbuild -cflag -g -use-ocamlfind CircuitSolver.byte && mv CircuitSolver.byte solver.debug
	 chmod +x solver.debug

compiler: $(DEPS)
	 $(ARGS) ocamlbuild -use-ocamlfind CircuitSolver.native && mv CircuitSolver.native solver
	 chmod +x solver
clean:
	ocamlbuild -clean
