#!/usr/bin/python

import sys

if len(sys.argv) < 3:
	print("USAGE: gp_eps2png.py input output")
	sys.exit(1)
	
infile = sys.argv[1]
outfile = sys.argv[2]

inp = open(infile,"r")
outp = open(outfile,"w");

line_a = "set terminal post"
repl_a = "set terminal png size 800,600\n"

line_b = "set term pop"
repl_b = "set term png\n"

for line in inp:
	nline = line;
	if line.startswith(line_a):
		nline = repl_a
	elif line.startswith(line_b):
		nline = repl_b
	else:
		nline = line.replace(".eps",".png")
	
	outp.write(nline);
