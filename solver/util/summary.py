#!/usr/bin/python

import sys

fn=sys.argv[1]
fh=open(fn)

NONE=0
COMPS=1
CONNS=2
LABELS=3
mode=NONE

summary = {
    "conns":[],
    "labels":{},
    "comps":{}
}
for l in fh:
    l = l.strip("\n")
    if l.startswith("Conns"):
        mode = CONNS

    if l.startswith("Comps"):
        mode = COMPS

    if l.startswith("Labels"):
        mode = LABELS

    if mode == COMPS:
        sides = l.split("=")
        if len(sides) < 2:
            continue

        lhs = sides[0].split("|")[0].strip(" ")
        rhs = eval(sides[1].strip())
        summary["comps"][lhs] = rhs

    if mode == CONNS:
        sides = l.split("->")
        if len(sides) < 2:
            continue
        lhs = sides[0]
        rhs = sides[1]
        summary["conns"].append((lhs,rhs))

    if mode == LABELS:
        sides = l.split(":")
        if len(sides) < 2:
            continue
        lhs = sides[0].strip(" ")
        rhs = sides[1].replace("bind","").strip(" .")
        summary["labels"][lhs] = rhs

def filter_d(f,m):
	nm = {}
	for k in m:
		v = m[k]
		if f(k,v):
			nm[k] = v
	return nm
	
def count_d(m):
	n = 0
	for k in m:
		n += 1
	return n

def to_list(f,m):
	n = 0
	lst = [];
	for k in m:
		v = m[k];
		d = f(k,v);
		if d != None:
			lst.append(d);
	
	return lst
	
for k in summary["comps"]:
    v = summary["comps"][k]
    print(k+"\t"+str(len(v)))

print("\n\n")
print("nconns"+"\t"+str(len(summary["conns"])))


nlbls = count_d(summary["labels"])
print("\n\n")
print("nlbls"+"\t"+str(nlbls))
vlbls = filter_d(lambda k,v : "input" in k and v[0].isalpha(), summary["labels"])
print("n input vars: "+str(count_d(vlbls)))
vlbls = filter_d(lambda k,v : "output" in k and v[0].isalpha(), summary["labels"])
print("n output vars: "+str(count_d(vlbls)))
vlbls = filter_d(lambda k,v : "input" in k and not v[0].isalpha(), summary["labels"])
print("n input vals: "+str(count_d(vlbls)))
vlbls = filter_d(lambda k,v : "output" in k and not v[0].isalpha(), summary["labels"])
print("n output vals: "+str(count_d(vlbls)))
print("================")
outs = to_list(lambda k,v : v if "output" in k else None, summary["labels"])
excins = filter_d(lambda k,v : "input" in k and v[0].isalpha() and v in outs, summary["labels"])
print("n bound outputs: "+str(count_d(excins)))
print(excins)
