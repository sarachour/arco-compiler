#!/usr/bin/python

import argparse
import subprocess

def parse_args ():
    parser = argparse.ArgumentParser(description='Simulate the topology')


    parser.add_argument("circuit", help="circuit specification")
    parser.add_argument("--lib", help="library to link with circuit specification")

    args = parser.parse_args()
    return args

def gen_spice(args):
    circ = (args.circuit)
    lib = (args.lib)

    outs = ""
    append = lambda x:  outs+x

    fcirc = open(circ,'r')

    include_st=".include "+lib+"\n"
    outs = append(include_st)

    for line in fcirc:
        outs = append(line)

    return outs

def run_spice(text):
    tmpfile = "___tmp___.ckt"

    tmphandle = open(tmpfile,'w')
    tmphandle.write(text)
    tmphandle.close()

    subprocess.call(["ngspice","-b",tmpfile])

args = parse_args()
spc = gen_spice(args)
run_spice(spc)
