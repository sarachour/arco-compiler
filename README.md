BioCadance
=====
make sure you have the following packages installed

	mercurial gcc-4.8 g++-4.8 wget sbt graphviz

Install the ocaml base packages

	ocaml ocaml-camlp4 opam 

make sure you have the following installed:

   ocamlfind batteries oasis extlib yojson zarith core

## Installing Hascall
install haskell and hackage for the z3 bindings.

	hs-cabal-install

Update cabal

	cabal install cabal-install

update the package list.

	cabal update


## Setting up OPAM

Initialize opam

	opam init

setup the opam environmental variable

	eval $(opam config env)

switch the the supported version of ocaml

	opam switch 4.02.1

install the necessary dependencies

	ocamlfind batteries oasis extlib yojson

install zarith with special flags

	C_INCLUDE_PATH=/opt/local/include LIBRARY_PATH=/opt/local/lib CC=gcc-mp-4.8 opam install zarith

## Setting up GCC/G++ 4.8 for mac

First install gcc 4.8 using ports:

	sudo port install gcc48

DReal requires gcc 4.8, modify the makefile in DEP to point to your install of gcc/g++ 4.8. 

	vim dep/dreal/Makefile


## Installing
run 

	./setup.sh

This script will prompt you with lines to add to your bashrc or a command you can run to setup the environment.

compile the dependencies

	make deps
