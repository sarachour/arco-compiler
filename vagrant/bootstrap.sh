#!/bin/bash

echo "==== BOOSTRAP ROOT ==="
export DEBIAN_FRONTEND=noninteractive
apt-get update
echo "Installing DebConf"
apt-get install debconf-utils -y > /dev/null

echo "Install Basic"
apt-get install m4 git -y > /dev/null

echo "Install OCaml"
apt-get install ocaml opam -y > /dev/null
echo "Initializing Opam"
apt-get install ocaml opam -y > /dev/null

echo "Install Python"
apt-get install python python-pip -y > /dev/null
pip install --upgrade pip
echo "Install Python Dependencies"
pip install scipy numpy sympy  > /dev/null

echo "Install DReal"
apt-get install -y python-software-properties  # only for 12.04 to have add-apt-repository
add-apt-repository -y ppa:dreal/dreal
add-apt-repository -y ppa:ubuntu-toolchain-r/test
apt-get update
apt-get install -y dreal > /dev/null

