#!/usr/bin/python
import sys

def proc(d,t):
    dh = open(d,'r')

    was_hdr = False
    data = {}
    hdrs = [];
    for line in dh:
        line = line.strip("\n")

        if line.startswith("---"):
            was_hdr = True
        elif line[0].isalpha() and was_hdr:
            args = line.split(" ")
            hdrs = args = filter(lambda x : x != "",args)
            for i in range(0,len(hdrs)):
                if hdrs[i] not in data:
                    data[hdrs[i]] = []

        elif line[0].isdigit():
            args = line.split("\t")
            args = filter(lambda x : x != "",args)
            setv =  lambda i : data[hdrs[i]].append(float(args[i]))
            for i in range(0,len(args)):
                data[hdrs[i]].append(float(args[i]))

    text = str(data)
    print(text)
    th = open(t,'w')

if len(sys.argv) < 2:
    print("USAGE: dat2tab.py datafile tabfile")
    sys.exit(1)

datfile = sys.argv[1]
tabfile = sys.argv[2]

proc(datfile,tabfile)
