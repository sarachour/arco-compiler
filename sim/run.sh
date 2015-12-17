#!/bin/bash

HWSPEC="biology"
SLN="mmrxn-biology"
SIM="empty"
HWSPECDIR="benchmarks/specs"
make && ./sim -hwspec ../solver/$HWSPECDIR/$HWSPEC.spec -solution ../solver/output/$SLN.ckt.caml -sim test/$SIM.cfg
