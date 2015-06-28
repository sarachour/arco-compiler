#!/bin/bash

BIOCAD_PATH=$PWD

echo "eval $(opam config env)"
echo "export BIOCAD_HOME=$BIOCAD_PATH"
echo 'export PATH=$BIOCAD_HOME/dep/z3/build:$BIOCAD_HOME/dep/dReal/bin:$PATH'
