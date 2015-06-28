BioCadance
=====
make sure you have the following packages installed

	mercurial gcc-4.8 g++-4.8 wget

Install the ocaml base packages

	ocaml ocaml-camlp4 opam 


install haskell and hackage for the z3 bindings.

	hs-cabal-install

Update cabal

	cabal install cabal-install

update the package list.

	cabal update


make sure you have the following installed:

   ocamlfind batteries oasis extlib yojson

## Setting up OPAM

Initialize opam

	opam init

setup the opam environmental variable

	eval $(opam config env)

## Setting up GCC/G++ 4.8 for mac

First install gcc 4.8 using ports:

	sudo port install gcc48

DReal requires gcc 4.8, modify the makefile in DEP to point to your install of gcc/g++ 4.8

	vim dep/dreal/Makefile


## Installing
run 

	./setup.sh

This script will prompt you with lines to add to your bashrc or a command you can run to setup the environment.

compile the dependencies

	make dep

install the haskell bindings for z3

	cabal install z3 --extra-include-dirs=$BIOCAD_HOME/dep/z3/src/api --extra-lib-dirs=$BIOCARD_HOME/dep/z3/build

