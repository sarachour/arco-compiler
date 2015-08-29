
all: diffeq

diffeq: DEQParser.cmo DEQLexer.cmo data.cmo compiler.cmo
	 ocamlc -o diffeq \
	 	data.cmo DEQParser.cmo DEQLexer.cmo compiler.cmo
	 chmod +x diffeq
DEQLexer.cmo: DEQParser.cmo
DEQParser.cmo: data.cmo
compiler.cmo: DEQParser.cmo data.cmo DEQLexer.cmo

%.ml: %.mll 
	ocamllex $< -o $@
	

%.mli: %.mly
	ocamlyacc $<

%.ml: %.mli
	ocamlc -c  $< -o $@


%.cmo: %.ml
	ocamlc -c $< -o $@


clean:
	rm -f *.cmo *.cmi *.mli DEQParser.ml DEQLexer.ml diffeq &> /dev/null