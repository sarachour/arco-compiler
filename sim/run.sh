#!/bin/bash

SRCDIR=$PWD
OUTDIR=$SRCDIR/output

mkdir -p $OUTDIR
rm $OUTDIR/*

echo ngspice -b $1.ckt -o log.txt
ngspice -b $1.ckt -o out-log.txt 
gp_eps2png.py out-trans.plt tmp.plt && mv tmp.plt out-trans.plt
gnuplot out-trans.plt
#gv out-trans.eps
#ps2pdf out-trans.ps out-trans.pdf
	
mv out-* $OUTDIR

