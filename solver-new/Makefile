
DIFFEQ=../diffeq
#DEPS=*.ml *.mly *.mll
DEPS=*.ml
COMP_DEPS=*.mly *.mll
ARGS=C_INCLUDE_PATH=/opt/local/include LIBRARY_PATH=/opt/local/lib CC=gcc-mp-4.8
FLAGS=-use-ocamlfind
DEBUG_FLAGS=-cflag -g
#LIBS=-package extlib  -package yojson -package z3 -package z3overlay
LIBS=-package extlib

all: solver solver.debug

parse-gen: $(COMP_DEPS) $(DEPS)
	 $(ARGS) ocamlbuild $(FLAGS) -use-menhir -menhir ParseAST.ml
	 #$(ARGS) ocamlbuild $(FLAGS) -use-menhir -menhir "menhir --infer --explain --external-tokens LexAST" ParseHW.ml
	 #$(ARGS) ocamlbuild $(FLAGS) -use-menhir -menhir "menhir --infer --explain --external-tokens LexAST" ParseMath.ml


solver.debug: $(DEPS) parse-gen
	 #$(ARGS) ocamlbuild $(DEBUG_FLAGS) $(FLAGS) Main.byte && mv Main.byte solver.debug
	 #chmod +x solver.debug

solver: $(DEPS) parse-gen
	  $(ARGS) ocamlbuild $(FLAGS) -use-menhir -menhir "menhir --infer --explain" Main.native && mv Main.native solver
	 chmod +x solver

clean:
	ocamlbuild -clean
