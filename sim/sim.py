#!/usr/bin/python

import argparse
import subprocess
import sys
import random
import os


# .control
# dc Vx -250 250 0.5;
# print dc.V(Ix) dc.V(Oz) > io_x_z.dat
# op
# run
def data(fname):
    return ".data/"+fname

def tmp(fname):
    return ".tmp/"+fname

class Analysis:

    def __init__(self):
        self.inputs = []
        self.outputs = []
        self.text = ".control\n"

    def append(self,t):
        self.text = self.text+"  "+t+"\n"


    def dc_sweep(self,vname,prop,start,stop,step):
        cmd="dc "+prop+"("+vname+") start="+str(start)+" stop="+str(stop)+" step="+str(step)
        self.append(cmd)

    def trans(self,start,stop):
        cmd="tran "+str(start)+" "+str(stop)
        self.append(cmd)


    def save(self,oper,vr,prop,fl):
        cmd = "print "+str(oper)+"."+prop+"("+str(vr)+") > "+data(fl)
        self.append(cmd)

    def op(self):
        self.append("op")


    def get_analysis(self):
        t = self.text+"  run\n.endc\n"
        return t



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
    aly.trans(0,200)
    aly.op()
    for oname in outs:
        port = outs[oname]["port"]
        prop = outs[oname]["prop"]

        aly.dc_sweep(str(port),prop,0,5,0.001)
        aly.save("dc",port,prop,oname+".dc")

    text = text + "\n\n" + aly.get_analysis()
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
    tmpfile = tmp("generated.ckt")

    tmphandle = open(tmpfile,'w')
    tmphandle.write(text)
    tmphandle.close()

    subprocess.call(["ngspice","-b",tmpfile])

def mkdir(f):
    d = os.path.dirname(f)
    if not os.path.exists(d):
        os.makedirs(d)

mkdir(data(""))
mkdir(tmp(""))

aly = Analysis()
args = parse_args()
oar,iar,spc = gen_spice(args)
iar = get_input_params(args,iar)

spc = conc_inputs(spc,iar)
spc = conc_outputs(aly,spc,oar)
run_spice(spc)
