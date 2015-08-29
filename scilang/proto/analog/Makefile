
DIFFEQ=../diffeq
DEPS=components.cmo main.cmo $(DIFFEQ)/data.cmo


all: analog

analog: diffeq $(DEPS)
	 ocamlc -o analog \
	 	 $(DEPS)
	 chmod +x analog

diffeq: 
	cd $(DIFFEQ) && make

%.ml: %.mll 
	ocamllex $< -o $@
	

%.mli: %.mly
	ocamlyacc $<

%.ml: %.mli
	ocamlc -c  $< -o $@

diffeq/%.cmo: diffeq/%.ml
	cd $(DIFFEQ) && 
	ocamlc -c $< -o $@

%.cmo: %.ml
	ocamlc -c $< -o $@


clean:
	rm -f *.cmo *.cmi *.mli &> /dev/null