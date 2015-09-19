
from sim import model as mdl

class Generator:
    def param_file(libdir,model,di):
    	name = model.get_name();
    	f = open(libdir+name+".arco-params", "w");
    	for k in di:
    		f.write(k+","+str(di[k]["value"])+"\n");

    def arco_spec(libdir,model):
    	name = model.get_name();
    	print("== Generating Spec ==");
    	modelfile = open(libdir+name+".spec", "w");
    	pfile = name + ".arco-params"
    	pars = mdl.ParamFile.load(libdir + pfile);
    	model.set_params(pars);
    	model.gen_spec(modelfile);

    def spice_comp(libdir, hwspec):
    	name = hwspec.get_name();
    	print("== Generating Component ==");
    	comp = open(libdir+name+".ckt", "w");
    	pfile = name + ".spice-params"
    	pars = mdl.ParamFile.load(libdir + pfile);
    	hwspec.comp.set_vars(pars);
    	hwspec.gen_comp(comp);
