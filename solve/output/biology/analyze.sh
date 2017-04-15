#!/bin/bash

cdir=$PWD
cd $1
SAT=`cat output.log | grep "^SAT" | wc -l`
UNSAT=`cat output.log | grep "^UNSAT" | wc -l`
TIME=`cat time.log`

OUTFILE="$cdir/$1.summary"
echo "SAT=$SAT" > $OUTFILE
echo "UNSAT=$UNSAT" >> $OUTFILE
echo "TIME=$TIME" >> $OUTFILE
