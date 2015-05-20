
all: biospec

biospec: BSParser.cmo BSLexer.cmo data.cmo compiler.cmo
	 ocamlc -o biospec \
	 	BSParser.cmo BSLexer.cmo data.cmo compiler.cmo
	 chmod +x biospec
bslexer.cmo: BSParser.cmo


%.ml: %.mll 
	ocamllex $< -o $@
	

%.mli: %.mly
	ocamlyacc $<

%.ml: %.mli
	ocamlfind ocamlc -c  $< -o $@


%.cmo: %.ml
	ocamlfind ocamlc -c $< -o $@


clean:
	rm -f *.cmo *.cmi *.mli BSParser.ml BSLexer.ml biospec &> /dev/null