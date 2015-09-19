#!/usr/bin/python

from sim import model as mdl
from sim import gen as g
from sim import spice as spice
import matplotlib.pyplot as plt
import scipy as sc
from scipy import optimize
from scipy import spatial
import numpy as np;
import itertools
import sys



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
	fxn_header = "def "+name+"( INPUTS";
	unpack_state = "";
	for i in range(0,len(inp)):
		assigns[inp[i]] = inp[i];
		unpack_state += inp[i];
		if i < len(inp) - 1: unpack_state += ",";
	unpack_state += " = INPUTS;"

	ret_state = "return (";
	for i in range(0,len(outp)):
		assigns[outp[i]] = outp[i];
		ret_state += outp[i];
		if i < len(outp) - 1: ret_state += ",";
	ret_state += ");";

	for k in param:
		assigns[k] = k;
		fxn_header += ", "+k;
	fxn_header += "):";

	rel.set_vars(assigns);
	ln = rel.concretize()[0];
	ln = ln.replace(".V","").replace(":","=");

	res = {};
	routine = fxn_header+"\n";
	routine += "   "+unpack_state+"\n";
	routine += "   "+ln+"\n"
	routine += "   "+ret_state+"\n";
	routine += "print(\"> loaded "+name+"\")\n";
	routine += "res[\"fxn\"] = "+name+"\n";
	print("------\n"+routine+"-----\n");
	exec(routine);
	return res["fxn"];

def invoke_callback(cbk,m,inps,pdict):
	param = m["params"];
	args = [np.array(inps)];
	for p in param:
		args.append(pdict[p]["value"]);

	res = cbk(*args);
	return res;

def analyze_experiment(sim, hwspec, model):

		for m in model.get_models():
			cbk = model_to_python(m);
			dataset = {};
			inps = hwspec.get_inputs(); # input.value is the default value
			outs = hwspec.get_outputs();
			pars = hwspec.get_params();

			linps = list(inps);
			louts = list(outs);
			lpars = list(pars);

			for k in (linps+louts):
				dataset[k] = [];

			# unify all data into a giant dataset
			for (ci,co) in itertools.product(inps,outs):
				# get dataset for an input,output pair
				data = sim.get_rel(ci,co);
				# for each data point
				for i in range(0,len(data[ci]) ):
					for k in linps+louts:
						if k == ci:
							dv = data[ci][i]
						elif k == co:
							dv = data[co][i]
						else:
							dv = inps[k]["value"];


						dataset[k].append(dv);
			#cluster by inputs

			inputs = [];
			for idx in range(0,len(linps) ):
				inputs.append(dataset[linps[idx]]);

			outputs = [];
			for idx in range(0,len(louts) ):
				outputs.append(dataset[louts[idx]]);

			p0 = len(lpars)*[1];
			print(p0);

			print("=== Starting Fitting Process ===")

			if len(inputs) == 1:
				inputs = inputs[0];
			if len(outputs) == 1:
				outputs = outputs[0];
			(sol,cov) = sc.optimize.curve_fit(cbk,inputs,outputs, p0);

			print("=== Found Solution, Building Dictionary ===")
			pars = {};
			for i in range(0,len(lpars)):
				el = {};
				el["value"] = sol[i];
				pars[lpars[i]] = el;

			res = invoke_callback(cbk, m, inputs, pars);

			rms = lambda x,y : np.sqrt(np.mean(np.square(np.subtract(x,y) )))
			err = rms(res,outputs)
			print("Associated Error",err)
			return pars;



def run(libdir, infile, outfile):
	sim = spice.Simulation();
	sim.clean();

	hwspec,model = mdl.ModelLoader.load(libdir + infile);


	# Add Sweep experiment across each input for min to max
	g.Generator.spice_comp(libdir, hwspec);
	gen_experiment(libdir,hwspec,model);
	sim = run_experiment();
	sols = analyze_experiment(sim,hwspec,model);
	g.Generator.param_file(libdir,model,sols);

	print(sols);
	sys.exit(0);
	print("== Analyzing Data ==");


	fun = lambda n : inv(n,sol[0],sol[1])
	zmod = list(map(fun, x));

	fun = lambda n : inv(n,1,0)
	zperf = list(map(fun, x));

	print("Model-Hardware Error", rms(z,zmod));
	plt.savefig("relation.png");

	#sim.clean();
