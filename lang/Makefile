
DIFFEQ=../diffeq
DEPS=Util.cmo Rule.cmo Relation.cmo TypeSystem.cmo \
	MetaLanguageAST.cmo DiffEqAST.cmo AnalogAST.cmo Visitor.cmo \
	DiffEqCompiler.cmo CircuitCompiler.cmo

LIBS=-package extlib  -package yojson

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