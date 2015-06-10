
DIFFEQ=../diffeq
DEPS=Util.cmo Rule.cmo Relation.cmo TypeSystem.cmo \
	MetaLanguageAST.cmo DiffEqAST.cmo Visitor.cmo \
	DiffEqCompiler.cmo CircuitCompiler.cmo


all: biology

biology: $(DEPS) Biology.cmo 
	 ocamlc -g -o biology \
	 	$(DEPS) Biology.cmo
	 chmod +x biology

%.ml: %.mll 
	ocamllex $< -o $@
	

%.mli: %.mly
	ocamlyacc $<

%.mli: %.ml
	ocamlc -i  $< -o $@

diffeq/%.cmo: diffeq/%.ml
	cd $(DIFFEQ) && 
	ocamlc -c $< -o $@

%.cmo: %.ml
	ocamlc -c $< -o $@


clean:
	rm -f *.cmo *.cmi *.mli biology &> /dev/null