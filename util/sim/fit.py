#!/usr/bin/python

from sim import spicedef as sd


def run(libdir, indir, outdir):
	print("fitting");
	inp = sd.SpiceDef();
	inp.load(libdir + indir);
	
	inp.set_model_param("a",0.5);
	spec = open("spec.txt", "w");
	exp = open("exp.txt", "w");
	comp = open("comp.txt", "w");
	inp.gen_arco_spec(spec);
	inp.gen_spice_exp(exp);
	inp.gen_spice_comp(comp);
