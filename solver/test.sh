#!/bin/bash

#default is min and simple
HW=$1
FORM=$2
ANALOGY=$3

make && ./solver -hwspec hwspecs/$HW.spec -formula formulas/$FORM.math -analogy $ANALOGY

