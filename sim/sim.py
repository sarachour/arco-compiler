#!/usr/bin/python

import argparse
import subprocess
import sys

class Analysis:

    def get_initial_analysis(self):
        return ".OP\n"

    def get_dc_analysis(self,name,prop):
        return ".print DC "+prop+"("+name+")\n"

def parse_args ():
    parser = argparse.ArgumentParser(description='Simulate the topology')


    parser.add_argument("circuit", help="circuit specification")
    parser.add_argument("--lib", help="library to link with circuit specification")

    args = parser.parse_args()
    return args

def conc_inputs(text,inps):

    sub = lambda q,m : q.replace(m,"1.0")

    for input in inps:
        ky = inps[input]["var"]
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
                    inputs[inname] = {"var":mvar}
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

    return outputs,inputs,outs


def run_spice(text):
    tmpfile = "___tmp___.ckt"

    tmphandle = open(tmpfile,'w')
    tmphandle.write(text)
    tmphandle.close()

    subprocess.call(["ngspice","-b",tmpfile])

aly = Analysis()
args = parse_args()
oar,iar,spc = gen_spice(args)
spc = conc_inputs(spc,iar)
spc = conc_outputs(aly,spc,oar)
run_spice(spc)
