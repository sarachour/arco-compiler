#!/bin/bash

#default is min and simple
NAME=$1
HWSPEC=$2

SOLVER=./solver.debug

if [ "$NAME" = "test-math" ]; then
  NAME=$2
  make && ${SOLVER} -hwspec test/math/empty.spec -formula test/math-parser/$NAME.math -interactive
  exit 0
fi

if [ "$NAME" = "test-hw" ]; then
  NAME=$2
  make && ${SOLVER} -hwspec test/hw/$NAME.spec -formula test/hw-parser/empty.math -interactive
  exit 0
fi

if [ "$NAME" = "test-solver" ]; then
  NAME=$2
  make && ${SOLVER} -hwspec test/solver/$NAME.spec -formula test/solver/$NAME.math -interactive
  exit 0
fi

if [ "$NAME" = "bmark" ]; then
  SPEC=$2
  NAME=$3
  make && ${SOLVER} -hwspec benchmarks/specs/$SPEC.spec -formula benchmarks/math/$NAME.math -interactive
  exit 0
fi

make && ${SOLVER} -hwspec $HWSPEC -formula $NAME
