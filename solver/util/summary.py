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

for k in summary["comps"]:
    v = summary["comps"][k]
    print(k+"\t"+str(len(v)))

print("\n\n")
print("nconns"+"\t"+str(len(summary["conns"])))

nlbls = 0
for k in summary["labels"]:
    v = summary["labels"][k]
    nlbls += 1

print("\n\n")
print("nlbls"+"\t"+str(nlbls))
