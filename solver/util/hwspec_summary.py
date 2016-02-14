#!/usr/bin/python

import sys

fn=sys.argv[1]
fh=open(fn)

dc = {}

def add_entry(src,snk):
	if not (src in dc):
		dc[src] = []
	
	dc[src].append(snk)

def fix(x):
	
    if x == "input(V)":
       return "vin" 
    elif x == "output(V)":
       return "outv"
    elif x == "input(I)":
	   return "iin"
    elif x == "output(I)":
	   return "outi"
    else:
	   return x
	   
for line in fh: 
   if "conn" in line: 
      if "%" in line:
         continue;
		
      args=line.strip().split(" ")
      src = args[1]
      snk = args[3]
      src = fix(src)
      snk = fix(snk)
      
      add_entry(src,snk)
    
print("#Connection Constraints");  
order=["vgain","iadd","vin","vadd","vtoi","itov","iin","ihill","igenebind","switch","mm"]
for src in order:
	snks = ""
	for snk in dc[src]:
		snks += " "+snk
	line = src+" -> "+snks	
	print(line)
