#!/bin/bash

HWSPEC="biology"
SLN="mmrxn-biology.ckt"
SIM="_tags"
HWSPECDIR="benchmarks/specs"
./sim -hwspec ../solver/$HWSPECDIR/$HWSPEC.spec -solution ../solver/output/$SLN.ckt -sim $SIM
