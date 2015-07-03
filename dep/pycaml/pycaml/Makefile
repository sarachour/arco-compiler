

all: _build

_build: setup.ml
	ocaml setup.ml -configure
	ocaml setup.ml -build 
	ocaml setup.ml -doc 

setup.ml:
	oasis setup 

install:
	oasis2opam --local 
	opam pin add pycaml .

uninstall:
	opam remove pycaml

clean:
	ocaml setup.ml -clean 