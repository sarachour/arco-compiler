#!/bin/bash

#default is min and simple
CMD=$1
NAME=$2
HWSPEC=$3

SOLVER=./solver.debug

if [ "$CMD" = "tmath" ]; then
  make && ${SOLVER} -hwspec test/math/empty.spec -formula test/math-parser/$NAME.math -interactive "tm-$NAME.ckt"
fi

if [ "$CMD" = "thw" ]; then
  make && ${SOLVER} -hwspec test/hw/$NAME.spec -formula test/hw-parser/empty.math -interactive "th-$NAME.ckt"
fi

if [ "$CMD" = "tslv" ]; then
  make && ${SOLVER} -hwspec test/solver/$NAME.spec -formula test/solver/$NAME.math -interactive -output "ts-$NAME.ckt"
fi

if [ "$CMD" = "bmark" ]; then
  make && ${SOLVER} -hwspec benchmarks/specs/$HWSPEC.spec -formula benchmarks/math/$NAME.math -output "$NAME-$HWSPEC".ckt -interactive
fi

if [ "$CMD" = "auto" ]; then
  make && time ${SOLVER} -hwspec benchmarks/specs/$HWSPEC.spec -formula benchmarks/math/$NAME.math -output "$NAME-$HWSPEC".ckt > .tmp/log.txt
fi

if [ "$NAME" = "exec" ]; then
  make && ${SOLVER} -hwspec $HWSPEC -formula $NAME
fi

mkdir -p output
mkdir -p .tmp

mv *.ckt output/
mv *.z3 .tmp/
