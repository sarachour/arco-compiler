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
    return "data/"+fname

def tmp(fname):
    return ".tmp/"+fname

def rand(min,max):
    return (random.random()*(max-min) + min)

class Analysis:

    def __init__(self):
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


    def code(self):
        t = self.text+"  run\n.endc\n"
        return t



class Sim:
    def __init__(self, text):
        self.an = Analysis()
        self.text = text
        self.inputs = {}
        self.outputs = {}
        self.proc_inputs();
        self.proc_outputs();

    def define_input(self,name,mvar_var,mvar_port,mvar_val):
        self.inputs[name] = {
        "mvar_val":mvar_val,
        "mvar_var":mvar_var,
        "mvar_port":mvar_port,
        "val":None
        }

    def define_output(self,name,mvar_port,mvar_prop):
        self.outputs[name] = {
            "mvar_port": mvar_port,
            "mvar_prop": mvar_prop
        }

    def assign_input(self,inname,vl):
        self.inputs[inname]["value"] = vl;
        vr = self.inputs[inname]["var"];
        self.text = self.text.replace(v,vl);

    def set_value(self,name,vl):
        self.inputs[name]["val"] = vl;
        mvar = self.inputs[name]["mvar_val"]
        self.text = self.text.replace(mvar,vl)

    def proc_inputs(self):
        inp = None
        ntext = ""
        for l in self.text.split('\n'):
            if l.startswith("*@input"):
                cmd = l.strip("\n").split("@")[1]
                cmdargs = cmd.split(" ")
                inp = cmdargs[1]

            elif inp != None:
                cmd = l.strip("\n").split("@")[0]
                args = cmd.split("\t")
                term = args[0]
                port = args[2]
                mvar_val = "@"+inp+"@"

                self.define_input(inp,term,port,mvar_val)
                l = l.replace("#",mvar_val)
                inp = None

            ntext += l+"\n"

        self.text = ntext

    def proc_outputs(self):
        out=None
        ntext = ""

        for l in self.text.split("\n"):

            ntext += l + "\n"

            if l.startswith("*@output"):
                cmd = l.strip("\n").split("@")[1]
                cmdargs = cmd.split(" ")
                out = cmdargs[1]

            if l.startswith("*@args"):
                cmd = l.strip("\n").split("@")[1]
                cmdargs = cmd.split(" ")
                ccmdargs = cmdargs[1].split(",")
                port = ccmdargs[0]
                prop = ccmdargs[1]

                if(prop == "I"):
                    ntext += "V"+str(port)+" _O"+str(port)+" "+str(port)+" 0\n"
                    self.define_output(out,"V"+port+"#branch",prop)
                else:
                    self.define_output(out,port,prop)

                out = None


        self.text = ntext

    def get_analysis(self):
        return self.an

    def get_inputs(self):
        return self.inputs

    def get_outputs(self):
        return self.outputs

    def code(self):
        acode = self.an.code()
        return (self.text + "\n\n"+acode)




def gen_spice(args):
    circ = (args.circuit)
    lib = (args.lib)

    spc = ""
    append = lambda x:  spc+x

    fcirc = open(circ,'r')
    if not fcirc:
        print("ERROR: circuit file does not exist: "+circ)
        sys.exit(1)
    include_st=".include "+lib+"\n"
    spc = append(include_st)

    for line in fcirc:
        spc = append(line)

    fcirc.close()

    return Sim(spc)

def get_input_params(args, spc):
    if args.inputs == None:
        return

    ipfile = (args.inputs)

    iph = open(ipfile,'r')

    for line in iph:
        args = line.strip("\n").split(" ")
        inp = args[0]
        val = args[1]
        spc.set_value(inp,val)

def build_analysis(args,spc):
    an = spc.get_analysis()
    an.trans(0.0001,0.1)
    for oname in spc.get_outputs():
        odata = spc.get_outputs()[oname]
        prop = odata['mvar_prop']
        port = odata["mvar_port"]

        an.save("tran",port,prop,oname+".tran")


def run_spice(spc):
    tmpfile = tmp("generated.ckt")

    tmphandle = open(tmpfile,'w')
    tmphandle.write(spc.code())
    tmphandle.close()

    subprocess.call(["ngspice","-b",tmpfile])

def mkdir(f):
    d = os.path.dirname(f)
    if not os.path.exists(d):
        os.makedirs(d)

def parse_args ():
    parser = argparse.ArgumentParser(description='Simulate the topology')


    parser.add_argument("circuit", help="circuit specification")
    parser.add_argument("--lib", help="library to link with circuit specification")
    parser.add_argument("--inputs", help="input values")

    args = parser.parse_args()
    return args


mkdir(data(""))
mkdir(tmp(""))

args = parse_args()
spc = gen_spice(args)
get_input_params(args,spc)
build_analysis(args,spc)
run_spice(spc)
