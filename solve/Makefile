
DIFFEQ=../diffeq
#DEPS=*.ml *.mly *.ml l
DEPS=*.ml 
DIR_DEPS=
COMP_DEPS=*.mly *.mll
ARGS=C_INCLUDE_PATH=/opt/local/include LIBRARY_PATH=/opt/local/lib CC=gcc-mp-4.8
FLAGS=-use-ocamlfind -use-menhir -menhir "menhir --infer --explain"
DEBUG_FLAGS=-cflag -g



all: solver solver.debug

config:
	cd benchmarks/simple/configs; ./make_configs.sh

solver.debug: $(DEPS) $(COMP_DEPS) $(DIR_DEPS)
	 $(ARGS) ocamlbuild $(DEBUG_FLAGS) $(FLAGS) Main.byte && mv Main.byte solver.debug
	 chmod +x solver.debug

solver: $(DEPS) $(COMP_DEPS) $(DIR_DEPS)
	  $(ARGS) ocamlbuild $(FLAGS) Main.native && mv Main.native solver
	 chmod +x solver

clean:
	ocamlbuild -clean
	rm *.swo *.swp

clean-out:
	rm -rf output/*
