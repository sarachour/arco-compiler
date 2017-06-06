#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

echo "==== BOOSTRAP USERSPACE ==="
opam init -y
eval `opam config env`
echo "Initializing Opam Dependencies"
opam install menhir oasis core -y > /dev/null

#echo "eval `source ~/.bashrc.user" >>> .bashrc.user
#echo "eval `opam config env`" >>> .bashrc.user

echo "Install Pycaml"
cd /deps/symcaml/repo/deps/pycaml
git pull
./init.sh
make clean; make
make install

echo "Install Symcaml"
cd /deps/symcaml/repo/src
git pull
make clean; make
make install

echo "Compile Z3"
cd /deps/z3/repo
rm -rf build
git checkout z3-4.5.0
python scripts/mk_make.py
cd build
make

echo "Compile Arco"
cd /proj/arco
make
