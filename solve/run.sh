#!/bin/bash

#default is min and simple
CMD=$1
HWSPEC=$2
CFG=$3
NAME=$4

SOLVER=./solver.debug


./killall.sh dReal
./killall.sh solver.debug 
./killall.sh solver 
./mkconfigs.sh

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
  make && \
    ${SOLVER} -hwspec benchmarks/$HWSPEC/specs/hardware.spec -formula benchmarks/$HWSPEC/math/$NAME.math -config benchmarks/$HWSPEC/configs/$CFG.cfg -output "ckt_$NAME"
fi


if [ "$CMD" = "config" ]; then
  make && time ${SOLVER} -print-config -output "$NAME".cfg > .tmp/log.txt
fi


OUTDIR=output/$HWSPEC
TMPDIR=tmp

mkdir -p $OUTDIR/$NAME
mkdir -p $TMPDIR

mv ckt_* $OUTDIR/$NAME/

mv *.smt2 $TMPDIR/
mv *.debug.txt $TMPDIR
