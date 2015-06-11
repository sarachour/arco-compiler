
DIFFEQ=../diffeq
DEPS=Util.cmo Rule.cmo Relation.cmo TypeSystem.cmo \
	MetaLanguageAST.cmo DiffEqAST.cmo Visitor.cmo \
	DiffEqCompiler.cmo CircuitCompiler.cmo

LIBS=-package extlib 

all: biology

biology: $(DEPS) Biology.cmo 
	 ocamlfind ocamlc -g $(LIBS) -linkpkg -o biology \
	 	$(DEPS) Biology.cmo
	 chmod +x biology

%.ml: %.mll 
	ocamllex $< -o $@
	

%.mli: %.mly
	ocamlyacc $<


%.cmo: %.ml
	ocamlfind ocamlc $(LIBS) -c $< -o $@


clean:
	rm -f *.cmo *.cmi *.mli biology &> /dev/null