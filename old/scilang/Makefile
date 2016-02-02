
DEPS=*.ml
ARGS=C_INCLUDE_PATH=/opt/local/include LIBRARY_PATH=/opt/local/lib CC=gcc-mp-4.8 

#LIBS=-package extlib  -package yojson -package z3 -package z3overlay
LIBS=-package extlib  -package yojson 

all: biology

biology: $(DEPS)
	 $(ARGS) ocamlbuild -use-ocamlfind Biology.native && mv Biology.native biology
	 chmod +x biology

clean:
	ocamlbuild -clean
	rm biology