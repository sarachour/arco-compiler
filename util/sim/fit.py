#!/usr/bin/python

from sim import model as mdl
from sim import spice as spice
import matplotlib.pyplot as plt
import scipy as sc
from scipy import optimize
from scipy import spatial
import numpy as np;
import itertools
import sys


def inv(x,a,b):
	return -(x*a)+b;
	
def gen_spec(libdir,model):
	name = model.get_name();
	print("== Generating Spec ==");
	modelfile = open(name+".spec", "w");
	pfile = name + ".arco-params"
	pars = mdl.ParamFile.load(libdir + pfile);
	model.set_params(pars);
	model.gen_spec(modelfile);

def gen_comp(libdir, hwspec):
	name = hwspec.get_name();
	print("== Generating Component ==");
	comp = open(name+".ckt", "w");
	pfile = name + ".spice-params"
	pars = mdl.ParamFile.load(libdir + pfile);
	hwspec.comp.set_vars(pars);
	hwspec.gen_comp(comp);

def gen_experiment(libdir, hwspec, model):
	print("== Generating Experiment ==");
	exp = open("experiment.sim", "w");
	measures = [];
	
	# For each model output product
	for m in model.get_models():
		inp = m["inputs"];
		outp = m["outputs"];
		for (i,j) in itertools.product(inp,outp):
			for (ik,jk) in itertools.product(inp[i],outp[j]):
				if ik == "V" and jk == "V":
					trial = hwspec.make_io_exp(i,j,-250,250);
					measures.append(trial);
				else:
					raise ValueError("unknown kinds: "+ik+","+jk);
				
			
	hwspec.gen_exp(libdir, exp, measures);


def run_experiment():
	print("== Running Experiment ==");
	sim = spice.Simulation();
	sim.run();
	return sim;

def model_to_python(m):
		inp = list(m["inputs"]);
		outp = list(m["outputs"]);
		param = m["params"];
		rel = m["rel"];
		
		name = "__tmp__";
		assigns = {};
		fxn_header = "def "+name+"(_i";
		
		for i in range(0,len(inp)):
			assigns[inp[i]] = "_i["+str(i)+"]";
			
		
		for i in range(0,len(outp)):
			assigns[outp[i]] = "_o["+str(i)+"]";
		
		for k in param:
			assigns[k] = k;
			fxn_header += ", "+k;
		fxn_header += "):";
		
		rel.set_vars(assigns);
		ln = rel.concretize()[0];
		ln = ln.replace(".V","").replace(":","=");
		
		res = {};
		routine = fxn_header+"\n";
		routine += "   _o = [0]*"+str(len(outp))+"\n" 
		routine += "   "+ln+"\n"
		routine += "   return _o\n"
		routine += "print(\"> loaded "+name+"\")\n";
		routine += "res[\"fxn\"] = "+name+"\n";
		
		exec(routine);	
		return res["fxn"];
		
def analyze_experiment(sim, hwspec, model):
		
		for m in model.get_models():
			cbk = model_to_python(m);
			print(str(cbk));
		
		'''
		for (i,j) in itertools.product(inp,outp):
			hwinps = hwspec.get_inputs();
			els = {};
			
			print(i,j,v);
			data = sim.get_rel("x","z");
		'''
		
def run(libdir, infile, outfile):
	sim = spice.Simulation();
	sim.clean();
	
	hwspec,model = mdl.ModelLoader.load(libdir + infile);

	
	# Add Sweep experiment across each input for min to max
	
	gen_spec(libdir,model);
	gen_comp(libdir, hwspec);
	gen_experiment(libdir,hwspec,model);
	sim = run_experiment();
	analyze_experiment(sim,hwspec,model);
	
	sys.exit(0);
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
	
	print("Model-Hardware Error", rms(z,zmod));
	plt.savefig("relation.png");
	
	#sim.clean();
