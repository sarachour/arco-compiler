#!/usr/bin/python

import sys

if len(sys.argv) < 1:
    print("USAGE: conc.py filename ")
    sys.exit(1)

f=sys.argv[1]
fh=open(f)

mp = {}
lst = []
for l in fh:
    l = l.strip("\n")
    if l.startswith ("rel rxn"):
        args = l.replace("rel ","").split("=")
        if(len(args) < 2):
            continue;
        args[0] = args[0].strip(" ")
        mp[args[0]] = "("+args[1]+")"
        lst.append(args[0])

    elif l.startswith("local rxn") or l.startswith("output rxn"):
        continue;

    elif l.startswith("rel"):
        lst.sort(lambda x,y: -cmp(len(x), len(y)))
        for k in lst:
            v = mp[k]
            l = l.replace(k,v)

        print(l)
    else:
        print(l)
