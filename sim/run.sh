#!/bin/bash

SRCDIR=$PWD
OUTDIR=$SRCDIR/output

mkdir -p $OUTDIR
rm $OUTDIR/*

proc () {
	file=$1
	gp_eps2png.py $file tmp.plt && mv tmp.plt $file
	gnuplot $file
	pkill gnuplot
}

echo ngspice -b $1.ckt -o log.txt
ngspice -b $1.ckt -o out-log.txt 

for file in $(ls *.plt);
do
	proc $file
done

mv out-* $OUTDIR

