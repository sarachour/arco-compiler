#!/bin/bash

BIOCAD_PATH=$PWD

echo "eval $(opam config env)"
echo "export ARCO_HOME=$BIOCAD_PATH"
echo 'export PATH=$ARCO_HOME/dep/z3/build:$ARCO_HOME/dep/dReal/bin:$PATH'
echo 'export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:$ARCO_HOME/z3/build'
