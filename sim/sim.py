#!/usr/bin/python

import argparse
import subprocess
import sys
import random

class Analysis:

    def get_initial_analysis(self):
        return ".OP\n"

    def get_dc_analysis(self,name,prop):
        return ".print DC "+prop+"("+name+")\n"

def rand(min,max):
    return (random.random()*(max-min) + min)

def parse_args ():
    parser = argparse.ArgumentParser(description='Simulate the topology')


    parser.add_argument("circuit", help="circuit specification")
    parser.add_argument("--lib", help="library to link with circuit specification")
    parser.add_argument("--inputs", help="input values")

    args = parser.parse_args()
    return args

def conc_inputs(text,inps):
    sub = lambda q,m : q.replace(m["var"],str(m["val"]))

    for input in inps:
        ky = inps[input]
        text=sub(text,ky)

    return text

def conc_outputs(aly,text,outs):

    append = lambda x:  text+x

    aline = aly.get_initial_analysis()
    text = append(aline)

    for oname in outs:
        port = outs[oname]["port"]
        prop = outs[oname]["prop"]

        aline = aly.get_dc_analysis(str(port),prop)
        text = append(aline)

    return text

def gen_spice(args):
    circ = (args.circuit)
    lib = (args.lib)

    outs = ""
    append = lambda x:  outs+x

    fcirc = open(circ,'r')

    include_st=".include "+lib+"\n"
    outs = append(include_st)

    outputs = {}
    inputs = {}
    outname = None
    inname = None
    icnt = 1

    for line in fcirc:

        if line.startswith("*@"):
            # parse command in pragma
            cmd = line.strip("\n").split("@")[1]
            cmdargs = cmd.split(" ")
            cmd = cmdargs[0];
            # determine the kind of command
            if cmd == "input":
                inname = cmdargs[1]
                if not (inname in inputs):
                    mvar = "@"+str(icnt)+"@"
                    inputs[inname] = {"var":mvar,"val":rand(-5,5)}
                    icnt += 1

            elif cmd == "output":
                outname = cmdargs[1]
                outputs[outname] = {"prop":None,"port":None}

            elif cmd == "args":
                if outname != None:
                    outputs[outname]["port"] = int(cmdargs[1])
                    outputs[outname]["prop"] = cmdargs[2]
                    outname = None
        else:
            if inname != None:
                line = line.replace("#",inputs[inname]["var"])
                inname = None

            outs = append(line)

    fcirc.close()

    return outputs,inputs,outs

def get_input_params(args, ips):
    if args.inputs == None:
        return iar

    ipfile = (args.inputs)

    iph = open(ipfile,'r')

    for line in iph:
        args = line.strip("\n").split(" ")
        inp = args[0]
        val = args[1]
        ips[inp]["val"] = val

    return iar

def run_spice(text):
    tmpfile = "___tmp___.ckt"

    tmphandle = open(tmpfile,'w')
    tmphandle.write(text)
    tmphandle.close()

    subprocess.call(["ngspice","-b",tmpfile])

aly = Analysis()
args = parse_args()
oar,iar,spc = gen_spice(args)
iar = get_input_params(args,iar)

spc = conc_inputs(spc,iar)
spc = conc_outputs(aly,spc,oar)
run_spice(spc)
