
DIFFEQ=../diffeq
DEPS=Util.cmo Hardware.cmo Cytomorphic.cmo SimpleFPAA.cmo

LIBS=-package extlib  -package yojson -package z3

all: solver

solver: $(DEPS) Solver.cmo 
	 ocamlfind ocamlc -g $(LIBS) -linkpkg -o solver \
	 	$(DEPS) Solver.cmo
	 chmod +x solver

%.ml: %.mll 
	ocamllex $< -o $@
	

%.mli: %.mly
	ocamlyacc $<


%.cmo: %.ml
	ocamlfind ocamlc $(LIBS) -c $< -o $@


clean:
	rm -f *.cmo *.cmi *.mli solver &> /dev/null