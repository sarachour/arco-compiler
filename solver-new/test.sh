#!/bin/bash

#default is min and simple
NAME=$1
ANALOGY=$2

make && ./solver -hwspec test/$NAME.spec -formula test/$NAME.math -analogy $ANALOGY