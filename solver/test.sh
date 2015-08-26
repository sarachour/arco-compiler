#!/bin/bash

#default is min and simple
HW=$1
FORM=$2

make && ./solver -hwspec hwspecs/$HW.spec -formula formulas/$FORM.math
