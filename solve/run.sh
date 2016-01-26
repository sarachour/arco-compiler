#!/bin/bash

#default is min and simple
CMD=$1
NAME=$2
HWSPEC=$3
CFG=$4

SOLVER=./solver.debug

if [ "$CMD" = "test-math" ]; then
  make && ${SOLVER} -hwspec test/math/empty.spec -formula test/math-parser/$NAME.math -interactive "tm-$NAME.ckt"
fi

if [ "$CMD" = "test-hw" ]; then
  make && ${SOLVER} -hwspec test/hw/$NAME.spec -formula test/hw-parser/empty.math -interactive "th-$NAME.ckt"
fi

if [ "$CMD" = "test-slv" ]; then
  make && ${SOLVER} -hwspec test/solver/$NAME.spec -formula test/solver/$NAME.math -interactive -output "ts-$NAME.ckt"
fi

if [ "$CMD" = "run" ]; then
  make && ${SOLVER} -hwspec benchmarks/$HWSPEC/specs/hardware.spec -formula benchmarks/$HWSPEC/math/$NAME.math -config benchmarks/$HWSPEC/configs/$CFG.cfg -output "$NAME-$HWSPEC".ckt
fi


if [ "$CMD" = "config" ]; then
  make && time ${SOLVER} -print-config -output "$NAME".cfg > .tmp/log.txt
fi


mkdir -p output
mkdir -p .tmp

mv *.ckt output/
mv *.ckt.caml output/
mv *.summary output/
mv *.z3 .tmp/
