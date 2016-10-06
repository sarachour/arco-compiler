#!/bin/bash
make_config () {  
  TARG=$1
  IACTIVE=$2
  DEBUG=$3
  cp default.cfg $TARG
  echo "int debug $DEBUG" >> $TARG
  echo "int interactive $IACTIVE" >> $TARG
}

make_config debug.cfg 2 3
make_config prod.cfg 0 2
