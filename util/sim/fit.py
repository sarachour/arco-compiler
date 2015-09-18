#!/usr/bin/python

from sim import model as mdl

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
	(spice,arco) = mdl.ModelLoader.load(libdir + infile);
	
	
	name = spice.get_name();
	pfile = infile.split(".")[0] + ".spice-params"
	pars = ParamFile.load(libdir + pfile);
	spice.set_comp_vars(pars);
	# Add Sweep experiment across each input for min to max
	
	arco.set_param("a",0.5);
	
	print("== Generating Spec ==");
	spec = open(name+".spac", "w");
	arco.gen_spec(spec);
	
	print("== Generating Component ==");
	comp = open(name+".ckt", "w");
	spice.gen_comp(comp);
	
	print("== Generating Experiment ==");
	exp = open("experiment.sim", "w");
	spice.gen_exp(libdir, exp);
