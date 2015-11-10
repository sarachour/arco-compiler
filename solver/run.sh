#!/bin/bash

#default is min and simple
NAME=$1
HWSPEC=$2

if [ "$NAME" = "test-math" ]; then
  NAME=$2
  make && ./solver -hwspec test/math/empty.spec -formula test/math-parser/$NAME.math -interactive
  exit 0
fi

if [ "$NAME" = "test-hw" ]; then
  NAME=$2
  make && ./solver -hwspec test/hw/$NAME.spec -formula test/hw-parser/empty.math -interactive
  exit 0
fi

if [ "$NAME" = "test-solver" ]; then
  NAME=$2
  make && ./solver -hwspec test/solver/$NAME.spec -formula test/solver/$NAME.math -interactive
  exit 0
fi

if [ "$NAME" = "bmark" ]; then
  SPEC=$2
  NAME=$3
  make && ./solver -hwspec benchmarks/hwspecs/$SPEC.spec -formula benchmarks/math/$NAME.math -interactive
  exit 0
fi

make && ./solver -hwspec $HWSPEC -formula $NAME
