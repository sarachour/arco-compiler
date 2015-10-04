
DIFFEQ=../diffeq
#DEPS=*.ml *.mly *.mll
DEPS=*.ml
ARGS=C_INCLUDE_PATH=/opt/local/include LIBRARY_PATH=/opt/local/lib CC=gcc-mp-4.8

#LIBS=-package extlib  -package yojson -package z3 -package z3overlay
LIBS=-package extlib

all: solver solver.debug

solver.debug: $(DEPS)
	 $(ARGS) ocamlbuild -cflag -g -use-ocamlfind Main.byte && mv Main.byte solver.debug
	 chmod +x solver.debug

solver: $(DEPS)
	 $(ARGS) ocamlbuild -use-ocamlfind Main.native && mv Main.native solver
	 chmod +x solver

clean:
	ocamlbuild -clean
