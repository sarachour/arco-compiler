#!/bin/bash

#default is min and simple
CMD=$1
HWSPEC=$2
CFG=$3
NAME=$4
SUBDIR=$5

SOLVER=./solver.debug

OUTDIR=output/$HWSPEC
TMPDIR=tmp

./killall.sh dReal
./killall.sh z3 
./killall.sh solver.debug 
./killall.sh solver 
rm $TMPDIR/*
rm z3*

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
    ${SOLVER} -hwspec benchmarks/$HWSPEC/specs/hardware.spec -formula benchmarks/$HWSPEC/math/$NAME.math -config benchmarks/$HWSPEC/configs/$CFG.cfg -output "ckt_$NAME" 2> error.log
fi


if [ "$CMD" = "config" ]; then
  make && time ${SOLVER} -print-config -output "$NAME".cfg > .tmp/log.txt
fi



rm -rf $OUTDIR/$NAME/$SUBDIR/*

mkdir -p $OUTDIR/$NAME/$SUBDIR
mkdir -p $OUTDIR/$NAME/$SUBDIR/smt
mkdir -p $TMPDIR

mv ckt_* $OUTDIR/$NAME/$SUBDIR

mv *.smt2 $OUTDIR/$NAME/$SUBDIR/smt
mv *.res $OUTDIR/$NAME/$SUBDIR/smt
mv *.model $OUTDIR/$NAME/$SUBDIR/smt

mv *.debug.txt $TMPDIR
