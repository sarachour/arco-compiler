#!/bin/bash

HWSPEC="biology"
SLN="mmrxn-biology"
SIM="empty"
HWSPECDIR="benchmarks/specs"
make && ./sim -hwspec ../solve/$HWSPECDIR/$HWSPEC.spec -solution ../solve/output/$SLN.ckt.caml -sim test/$SIM.cfg
