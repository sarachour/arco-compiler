
DEPS=*.ml
#LIBS=-package extlib  -package yojson -package z3 -package z3overlay
all: symcaml_test

symcaml_test: $(DEPS)
	$(ARGS) ocamlbuild -use-ocamlfind SymCaml.native
	mv SymCaml.native symcaml_test
	chmod +x symcaml_test

clean:
	ocamlbuild -clean