BioCadance
=====
make sure you have the following packages installed

   mercurial ocaml ocaml-camlp4 gcc-4.8 g++-4.8 opam


make sure you have the following installed:

   ocamlfind batteries oasis extlib

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
