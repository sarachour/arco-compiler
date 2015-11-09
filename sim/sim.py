#!/usr/bin/python

import argparse


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

    print(outs)

args = parse_args()
spc = gen_spice(args)
