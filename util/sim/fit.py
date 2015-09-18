#!/usr/bin/python

from sim import model as mdl
from sim import spice as spice
import matplotlib.pyplot as plt
import scipy as sc
from scipy import optimize
from scipy import spatial
import numpy as np;


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
			
def inv(x,a,b):
	return -(x*a)+b;
	 
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
	x = data["x"];
	z = data["z"];
	plt.plot(x,z);
	# note the input can be an array
	(sol,cov) = sc.optimize.curve_fit(inv,x,z);
	print("Solution",(sol));
	
	rms = lambda x,y : np.sqrt(np.mean(np.square(np.subtract(x,y) )))
	
	fun = lambda n : inv(n,sol[0],sol[1])
	zmod = list(map(fun, x));
	
	fun = lambda n : inv(n,1,0)
	zperf = list(map(fun, x));
	
	print(type(z));
	print(type(zmod));
	print("Model-Hardware Error", rms(z,zmod));
	plt.savefig("relation.png");
