#!/usr/bin/python

import getopt
import sys
from sim import fit 

def main(argv):
	help_string = 'sim.py -t <tool> -l <library-path>'
	libdir = None;
	tool = None;
	inp = None;
	out = None;
	try:
		opts, args = getopt.getopt(argv, "hl:t:i:o:", ["library-dir=","tool=","input=","output="])
	except getopt.GetoptError:
		print(help_string)
		sys.exit(2)
		
	for opt,arg in opts:
		if opt == '-h':
			print(help_string)
			sys.exit(0);
		elif opt in ("-l", "--lib"):
			libdir = arg
		elif opt in ("-t", "--tool"):
			tool = arg
		elif opt in ("-i", "--input"):
			inp = arg
		elif opt in ("-o", "--output"):
			out = arg
			
	if tool == "fit":
		fit.run(libdir, inp, out)
	
if __name__ == "__main__":
	main(sys.argv[1:]);

