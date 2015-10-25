#!/bin/bash

#default is min and simple
NAME=$1
ANALOGY=$2

if [ "$NAME" = "test-math" ]; then
  NAME=$2
  make && ./solver -hwspec test/math/empty.spec -formula test/math-parser/$NAME.math -analogy voltage
  exit 0
fi

if [ "$NAME" = "test-hw" ]; then
  NAME=$2
  make && ./solver -hwspec test/hw/$NAME.spec -formula test/hw-parser/empty.math -analogy voltage
  exit 0
fi

if ["$NAME" = "test-solver"]; then
  NAME=$2
  make && ./solver -hwspec test/solver/$NAME.spec -formula test/solver/$NAME.math -analogy voltage
  exit 0
fi

make && ./solver -hwspec test/$NAME.spec -formula test/$NAME.math -analogy $ANALOGY
