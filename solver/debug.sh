#!/bin/bash

#default is min and simple
HW=$1
FORM=$2

make && ocamldebug ./solver.debug -hwspec hwspecs/$HW.spec -formula formulas/$FORM.math
