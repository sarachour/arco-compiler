

DEPS=data.cmo BSParser.cmo BSLexer.cmo BSLexicon.cmo \
	BSTypes.cmo BSTypeTable.cmo BSActions.cmo BSActionTable.cmo \
	BSLibrary.cmo compiler.cmo

all: biospec

biospec: $(DEPS)
	 ocamlc -o biospec \
	 	 $(DEPS)
	 chmod +x biospec

BSTypes.cmo: BSLexicon.cmo
BSActions.cmo: BSLexicon.cmo


BSTypeTable.cmo: BSTypes.cmo
BSActionTable.cmo: BSActions.cmo

BSLibrary.cmo: BSTypes.cmo BSActions.cmo BSTypeTable.cmo BSActionTable.cmo 


BSParser.cmo: data.cmo
BSLexer.cmo: BSParser.cmo
compiler.cmo: BsLibrary.cmo BSLexer.cmo

%.ml: %.mll 
	ocamllex $< -o $@
	

%.mli: %.mly
	ocamlyacc $<

%.ml: %.mli
	ocamlc -c  $< -o $@


%.cmo: %.ml
	ocamlc -c $< -o $@


clean:
	rm -f *.cmo *.cmi *.mli BSParser.ml BSLexer.ml biospec &> /dev/null