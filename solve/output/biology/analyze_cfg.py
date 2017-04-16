#!/usr/bin/python

import sys 
import os

script_dir = os.path.dirname(__file__)

def array_to_count_map(arr):
    cnt = {};
    for a in arr:
        if not (a in cnt):
            cnt[a] = 0
        cnt[a] += 1

    return cnt

def analyze_sln(filename):
    filepath = os.path.join(script_dir,filename)
    h_file = open(filepath);

    phase = "unknown"

    comps = [];
    nwires = 0;
    portvals = {};
    porttypes = {};

    for line in h_file:

        if "Generate" in line:
            phase = "generate";

        if "Route" in line:
            phase = "route";

        if "Connect" in line:
            phase = "connect";

        segs = line.split("->");
        if len(segs) < 2:
            continue;

        if phase == "connect":
            nwires += 1;

        elif phase == "route" or phase == "generate":
                port = segs[1].strip()
                prefix = segs[0].split(" ")
                typ = prefix[0].strip()
                value = prefix[1].strip()

                if port.startswith("["):
                    n = len(port);
                    els = port[1:(n-1)].split(",");
                    for port in els:
                        portvals[port] = value;
                        porttypes[port] = typ;
                        comps.append(port.split("].")[0]);

                else: 
                    portvals[port] = value;
                    porttypes[port] = typ;
                    comps.append(port.split("].")[0]);


    data = {};
    uniqcomps = set(comps);
    ccomps = map(lambda x : x.split("[")[0], uniqcomps)

    data["comps"] = array_to_count_map(ccomps);
    data["wires"] =  nwires

    pinfo = {};
    pinfo["values"] = portvals;
    pinfo["types"] = porttypes;
    print(data);
    return pinfo,data;

def analyze_map(portinfo, filename):
    filepath = os.path.join(script_dir,filename)
    h_file = open(filepath);

    internal = []
    inputs= []
    outputs = []
    ports = []
   
    for line in h_file:

       if len(line.split("->")) < 2:
           continue;

       linmap = line.split("->")[1];
       port= line.split("=")[0].strip();
       scale = float(linmap.split("@")[0])
       offset = float(linmap.split("+")[1])

       if port in portinfo["types"]:
           typ = portinfo["types"][port];
       else:
           typ = "lcl"

       ports.append((scale,offset))
       
       if line.startswith("input") and line.split(".")[2].startswith("X"):
           if typ == "in":
               inputs.append((scale,offset));

           if typ == "val":
               v = float(portinfo["values"][port]);
               if v == 0:
                   inputs.append((1,0));
               else:
                   print(scale,offset,v)
                   inputs.append((scale,offset));

       elif line.startswith("output") and line.split(".")[2].startswith("O"):
           if typ == "out":
               outputs.append((scale,offset));

       else:
           internal.append((scale,offset));

    h_file.close()
    data = {};
    data["ports"] = array_to_count_map(ports);
    data["inputs"] = array_to_count_map(inputs);
    data["outputs"] = array_to_count_map(outputs);
    data["internal"] = array_to_count_map(internal);
    return data



def writelines(summary,data,key,h_output,ident):
    for (scale,offset) in data[key]:
        amt = data[key][(scale,offset)]
        line = str(ident)+",";
        line += str(scale)+",";
        line += str(offset)+",";
        line += str(amt)+","
        line += key+"\n"
        h_output.write(line);
        if scale == 1. and offset == 0.:
            summary[key]["direct"] += amt
        elif scale == 1.:
            summary[key]["no-scale"] += amt
        elif offset == 0.:
            summary[key]["no-offset"] += amt
        else:
            summary[key]["linear"] += amt

def mksummary_entry():
    data = {};
    data["direct"] = 0;
    data["no-scale"] = 0;
    data["no-offset"] = 0;
    data["linear"] = 0;
    return data;

def mksummary():
    summary = {};
    summary["ports"] = mksummary_entry();
    summary["inputs"] = mksummary_entry();
    summary["outputs"] = mksummary_entry();
    summary["internal"] = mksummary_entry();
    return summary

def print_summary(summary):
    keys = ["direct","no-scale","no-offset","linear"]
    fldkeys = ["ports","inputs","outputs","internal"]
    for key in fldkeys:
        data = summary[key];
        print("=== "+key+" ===");
        for knd in keys:
            print(knd+": "+str(data[knd]));


def main():
    if len(sys.argv) < 2:
        print("usage: analyze_smt cmd")
        sys.exit(1)
    path = sys.argv[1];
    base_path = path
    datas = {}
    
    for filename in os.listdir(base_path):
        if filename.endswith("_map.sum"):
            basename = filename.split("_map.sum")[0];
            mapfile = filename;
            slnfile = basename +"_sln.sum";

            portinfo,slndata = analyze_sln(base_path + "/" + slnfile);
            mapdata = analyze_map(portinfo,base_path + "/" + mapfile);

            data = {};
            data["map"] = mapdata;
            data["sln"] = slndata;


            clauses = (filename.split(".")[0].split("_"))
            ident = int(clauses[len(clauses)-2])
            datas[ident] = data

    output = path+"_map.csv"
    outputpath = os.path.join(script_dir,output)
    h_output = open(outputpath,"w+")
    els = [(k,datas[k]) for k in sorted(datas,key=int)]

    header = "cfgno,scale,offset,count,scope\n"

    h_output.write(header);

    for (ident,data) in els:
        summary = mksummary();
        writelines(summary,data["map"],"ports",h_output,ident)
        writelines(summary,data["map"],"inputs",h_output,ident)
        writelines(summary,data["map"],"outputs",h_output,ident)
        writelines(summary,data["map"],"internal",h_output,ident)
        print_summary(summary)
        print("\n\n")
    h_output.close()

    output = path+"_cfgs.csv"
    outputpath = os.path.join(script_dir,output)
    h_output = open(outputpath,"w+")
    els = [(k,datas[k]) for k in sorted(datas,key=int)]

    header = "cfgno,ncomps,nwires\n"

    h_output.write(header);

    allcomps = []
    for (ident,data) in els:
        cmps = data["sln"]["comps"]
        wires = data["sln"]["wires"]
        line = str(ident)+",";
        line += str(len(cmps))+",";
        line += str((wires));
        line += "\n";
        h_output.write(line);
        allcomps = allcomps + cmps.keys()


    output = path+"_comps.csv"
    outputpath = os.path.join(script_dir,output)
    h_output = open(outputpath,"w+")
    els = [(k,datas[k]) for k in sorted(datas,key=int)]

    header = "comp,cfgs\n"

    cmps = set(allcomps);
    for comp in cmps:
        line = comp;
        for (ident,data) in els:
            ccmp= data["sln"]["comps"]
            if comp in ccmp:
                line += ","+str(ccmp[comp])
            else:
                line += ",0"
        line += "\n"
        h_output.write(line);

            
    output = path+"_cfg.csv"
main()
