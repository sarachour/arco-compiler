#!/usr/bin/python

import sys 
import os

script_dir = os.path.dirname(__file__)

def analyze_file(smtfile,resfile):
    smtpath = os.path.join(script_dir,smtfile)
    respath = os.path.join(script_dir,resfile)
    h_smt = open(smtpath);
    h_res = open(respath);

    nvars = 0;
    nasserts = 0;
    status = 0;

    for line in h_smt:
        if line.startswith("(declare-fun v"):
            nvars += 1
        elif line.startswith("(assert"):
            nasserts += 1
            nasserts += line.count("and") - 1

    for line in h_res:
        if "unsat" in line:
            status = "unsat"
        elif "delta-sat" in line:
            status = "delta-sat"
        elif "sat" in line:
            status = "sat"

    h_smt.close()
    h_res.close()
    return {"vars":nvars,"asserts":nasserts,"status":status}

def main():
    if len(sys.argv) < 2:
        print("usage: analyze_smt cmd")
        sys.exit(1)
    path = sys.argv[1];
    smt_path = path+"/smt"

    datas = {}
    for filename in os.listdir(smt_path):
        if filename.endswith(".mapping.smt2"):
            basename = filename.split(".smt2")[0];
            smtfile = smt_path + "/"+basename + ".smt2"
            resfile = smt_path + "/"+ basename + ".smt2.model"
            try:
                data = analyze_file(smtfile,resfile)
                ident = int(basename.split(".")[0].split("-")[2])
                datas[ident] = data
            except Exception:
                continue;
    output = path+".csv"
    outputpath = os.path.join(script_dir,output)
    h_output = open(outputpath,"w+")
    els = [(k,datas[k]) for k in sorted(datas,key=int)]

    header = "id,vars,asserts,status"
    h_output.write(header);

    for (ident,data) in els:
        line = str(ident)+",";
        line += str(data["vars"])+",";
        line += str(data["asserts"])+",";
        line += str(data["status"])+"\n";
        h_output.write(line);

    h_output.close()

main()
