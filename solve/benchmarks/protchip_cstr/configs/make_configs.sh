#!/bin/bash
make_config () {  
  TARG=$1
  IACTIVE=$2
  DEBUG=$3
  cp default.cfg $TARG
  echo "int debug $DEBUG" >> $TARG
  echo "int interactive $IACTIVE" >> $TARG
}

make_config debug.cfg 3 4
make_config debug_eq.cfg 2 3
make_config eq.cfg 1 2 
make_config prod.cfg 0 3 
