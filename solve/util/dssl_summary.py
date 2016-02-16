#!/usr/bin/python

import sys

fn=sys.argv[1]
fh=open(fn)


param = 0
rel = 0
drel = 0

for line in fh:
	line = line.strip()
	if "%" in line:
		continue;
	print(line)
	if line.startswith("param"):
		param += 1
	if line.startswith("rel"):
		if "deriv(" in line:
			drel += 1
		else:
			rel += 1

print("parameters: "+str(param))
print("functions: "+str(rel))
print("diffeqs: "+str(drel))
