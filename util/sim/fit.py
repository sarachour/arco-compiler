#!/usr/bin/python

from sim import model as mdl
from sim import spice as spice
import matplotlib.pyplot as plt

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
	(hwspec,model) = mdl.ModelLoader.load(libdir + infile);
	
	
	name = hwspec.get_name();
	pfile = infile.split(".")[0] + ".spice-params"
	pars = ParamFile.load(libdir + pfile);
	hwspec.comp.set_vars(pars);
	# Add Sweep experiment across each input for min to max
	
	
	print("== Generating Spec ==");
	modelfile = open(name+".spec", "w");
	model.set_param("a",0.5);
	model.gen_spec(modelfile);
	
	print("== Generating Component ==");
	comp = open(name+".ckt", "w");
	hwspec.gen_comp(comp);
	
	print("== Generating Experiment ==");
	exp = open("experiment.sim", "w");
	measures = [];
	measures.append(hwspec.make_io_exp("x","z",-250,250));
	hwspec.gen_exp(libdir, exp, measures);
	
	print("== Running Experiment ==");
	sim = spice.Simulation();
	sim.run();
	
	print("== Analyzing Data ==");
	data = sim.get_rel("x","z");
	plt.plot(data["x"],data["z"]);
	plt.savefig("relation.png");
