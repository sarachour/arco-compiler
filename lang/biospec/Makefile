
all: biospec

biospec: BSParser.cmo BSLexer.cmo data.cmo compiler.cmo
	 ocamlc -o biospec \
	 	 data.cmo BSParser.cmo BSLexer.cmo compiler.cmo
	 chmod +x biospec
BSLexer.cmo: BSParser.cmo
BSParser.cmo: data.cmo
compiler.cmo: BSParser.cmo data.cmo BSLexer.cmo

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