#!/usr/bin/python

from sim import spicedef as sd

class ParamFile:
	def load(name):
		fd = open(name);
		dic = {};
		for line in fd:
			fields = line.strip().split(",");
			k = fields[0];
			v = fields[1];
			dic[k] = v
		return dic
			
def run(libdir, infile, outfile):
	inp = sd.SpiceDef();
	inp.load(libdir + infile);
	
	
	name = inp.get_name();
	pfile = infile.split(".")[0] + ".spice-params"
	pars = ParamFile.load(libdir + pfile);
	inp.set_spice_comp_vars(pars);
	inp.set_model_param("a",0.5);
	
	spec = open(name+".spac", "w");
	exp = open("experiment.sim", "w");
	comp = open(name+".ckt", "w");
	
	print("== Generating Spec ==");
	inp.gen_arco_spec(spec);
	print("== Generating Component ==");
	inp.gen_spice_comp(comp);
	print("== Generating Experiment ==");
	inp.gen_spice_exp(exp);
