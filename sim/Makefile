
#DEPS=*.ml *.mly *.mll
DEPS=*.ml
COMP_DEPS=*.mly *.mll
ARGS=C_INCLUDE_PATH=/opt/local/include LIBRARY_PATH=/opt/local/lib CC=gcc-mp-4.8
FLAGS=-use-ocamlfind -use-menhir -menhir "menhir --infer --explain"
DEBUG_FLAGS=-cflag -g


all: solver solver.debug


solver.debug: $(DEPS) $(COMP_DEPS)
	 $(ARGS) ocamlbuild $(DEBUG_FLAGS) $(FLAGS) Main.byte && mv Main.byte sim.debug
	 chmod +x sim.debug

solver: $(DEPS) $(COMP_DEPS)
	  $(ARGS) ocamlbuild $(FLAGS) Main.native && mv Main.native sim
	 chmod +x sim

clean:
	ocamlbuild -clean
	rm sim sim.debug
