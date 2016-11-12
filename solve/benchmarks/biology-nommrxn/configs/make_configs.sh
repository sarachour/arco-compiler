#!/bin/bash
make_config () {  
  BASELINE=$1
  TARG=$2
  IACTIVE=$3
  DEBUG=$4
  cp $BASELINE $TARG
  echo "int debug $DEBUG" >> $TARG
  echo "int interactive $IACTIVE" >> $TARG
}

make_config default.cfg eq.cfg 2 2 
make_config default.cfg multi.cfg 1 1 
make_config default.cfg prod.cfg 0 1 
make_config default-nomap.cfg prod_nomap.cfg 0 1 

make_config default.cfg debug.cfg 3 4
make_config default.cfg debug_eq.cfg 2 3
make_config default.cfg debug_prod.cfg 0 3
make_config default.cfg debug_multi.cfg 1 3
