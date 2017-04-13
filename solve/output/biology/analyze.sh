#!/bin/bash

cdir=$PWD
cd $1
SAT=`cat output.log | grep "^SAT" | wc -l`
UNSAT=`cat output.log | grep "^UNSAT" | wc -l`
TIME=`cat time.log`

echo "SAT=$SAT"
echo "UNSAT=$UNSAT"
echo "TIME=$TIME"
