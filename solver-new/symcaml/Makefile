
DEPS=*.ml
EXTERN_REPO_ROOT=git-repo/symcaml
#LIBS=-package extlib  -package yojson -package z3 -package z3overlay
all: symcaml_test

symcaml_test: $(DEPS)
	$(ARGS) ocamlbuild -use-ocamlfind SymCamlTest.native
	mv SymCamlTest.native symcaml_test
	chmod +x symcaml_test

clean:
	ocamlbuild -clean

repo:
	cp *.ml git-repo/symcaml/src/
	cp *.mll git-repo/symcaml/src/
	cp *.mly git-repo/symcaml/src/
	cp *.py git-repo/symcaml/src/
	cd git-repo/symcaml/src/; git add *.ml *.mll *.mly *.py
	cd git-repo/symcaml/; git commit -a 
	cd git-repo/symcaml/; git push origin
	cd git-repo/symcaml/; git status