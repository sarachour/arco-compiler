
#DEPS=*.ml *.mly *.mll
DEPS=*.ml
COMP_DEPS=*.mly *.mll
ARGS=C_INCLUDE_PATH=/opt/local/include LIBRARY_PATH=/opt/local/lib CC=gcc-mp-4.8
FLAGS=-use-ocamlfind -use-menhir -menhir "menhir --infer --explain"
DEBUG_FLAGS=-cflag -g


all: sim sim.debug solver

solver:
	ln -s ../solver solver

sim.debug: $(DEPS) $(COMP_DEPS) solver
	 $(ARGS) ocamlbuild $(DEBUG_FLAGS) $(FLAGS) Main.byte && mv Main.byte sim.debug
	 chmod +x sim.debug

sim: $(DEPS) $(COMP_DEPS) solver
	  $(ARGS) ocamlbuild $(FLAGS) Main.native && mv Main.native sim
	 chmod +x sim

clean:
	ocamlbuild -clean
	rm -f sim sim.debug
