#!/usr/bin/python

from sim import spicedef as sd


def run(libdir, indir, outdir):
	print("fitting");
	inp = sd.SpiceDef();
	inp.load(libdir + indir);
