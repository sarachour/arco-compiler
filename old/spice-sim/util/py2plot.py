#!/usr/bin/python

import matplotlib.pyplot as plt
import argparse

def plot(args):
    fn = args.data
    x = args.x
    y = args.y

    if args.output != None:
        out = args.output
    else:
        out = "out.png"

    fh = open(fn,'r')
    txt = fh.read()

    obj = eval(txt)
    xd = obj[x]
    yd = obj[y]

    fig = plt.figure(1)
    plt.plot(xd,yd)
    plt.savefig(out)

def parse_args():
    parser = argparse.ArgumentParser(description='Plot data')


    parser.add_argument("data", help="data, as a python dictionary")
    parser.add_argument("--output", help="output image name")
    parser.add_argument("--x", help="x axis variable")
    parser.add_argument("--y", help="y axis variable")

    args = parser.parse_args()
    return args

args = parse_args()
plot(args)
print(args)
