#!/usr/bin/python
import re
from sim import spice as Spice 

wr = Spice.Wrapper

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
			
			
# A template class that allows for one to define variables with $x
class Template:
	def __init__(self):
		self.vars = {};
		self.body = [];
		
	def define_var(self,a):
		self.vars[a] = None;
	
	def get_vars(self):
		return self.vars;
	
	def set_vars(self,d):
		for v in self.vars:
			self.vars[v] = None;
			
		for v in d:
			self.vars[v] = d[v];
	
	def concretize(self):
		nbody = [];
		for l in self.body:
			for v in self.vars:
				if self.vars[v] == None:
					raise ValueError("ERROR: template: var <"+v+"> is not defined");
				l = l.replace("$"+v, self.vars[v]);
			nbody.append(l);	
			
		return nbody;
		
	def append_body(self,l):
		self.body.append(l);
	
	def print(self):
		for v in self.vars:
			print("var "+v)

		for l in self.body:
			print("  "+l);
			
class ArcoModel:
	def __init__(self):
		self.inputs = [];
		self.outputs = [];
		self.params = {};
		self.models = [];
		self.name = "???";
	
	def get_name(self):
		return self.name;
		
	def set_name(self,n):
		if(n == ""): return;
		self.name = n;
		
	def add_input(self,i):
		if(i == ""): return;
		self.inputs.append(i);
		
	def add_output(self,o):
		if(o == ""): return;
		self.outputs.append(o);
	
	def add_param(self,p):
		if(p == ""): return;
		self.params[p] = None;	
	
	def __get_prop__(self,s,v):
		matches = re.findall("\$"+v+"\.([A-Za-z]+)",s);
		props = [];
		for match in matches:
			props.append(match);
		return props;
	
	def __has_var__(self,s,v):
		matches = re.findall("\$"+v,s);
		return len(matches) > 0;
			
	def __parse_model__(self,s):
		mdl = {};
		mdl["inputs"] = {};
		mdl["outputs"] = {};
		mdl["params"] = [];
		mdl["rel"] = {};
		mdl["rel"] = Template(); 
		mdl["rel"].append_body(s.strip());
		
		for v in (self.inputs+self.outputs):
			if self.__has_var__(s,v) == False:
				continue;
			
			mdl["rel"].define_var(v)
				
			props = self.__get_prop__(s,v);
			if v in self.inputs:
				mdl["inputs"][v] = props;
			else:
				mdl["outputs"][v] = props;
		
		for x in self.params:
			if self.__has_var__(s,x) == False:
				continue;
				
			mdl["params"].append(x);
			mdl["rel"].define_var(x)
		
		return mdl
	
	def get_models(self):
		return self.models;
		
	def add_model(self,m):
		if(m == ""): return;
		mdl = self.__parse_model__(m);
		self.models.append(mdl);
	
	def print(self):
		print("in:"+str(self.inputs));
		print("out:"+str(self.outputs));
		print("param:"+str(self.params));
		print(self.models);

	def set_params(self, v):
		for k in v:
			self.params[k] = v[k];
		
	def gen_spec(self,strm):
		pr = lambda x : strm.write(x+"\n");
		
		indent = "  ";
		pr("component "+self.name+" {");
		for i in self.inputs:
			pr(indent+"in "+i+";");
		for o in self.outputs:
			pr(indent+"out "+o+";");
		for p in self.params:
			if (self.params[p] == None):
				raise ValueError("ERROR: "+p+" is not defined");
			pr(indent+"param "+p+"="+str(self.params[p])+";");
		
		
		for m in self.models:
			subs = {};
			for v in m["rel"].get_vars():
				subs[v] = v;
			
			print(str(subs));
			m["rel"].set_vars(subs);
			proc = m["rel"].concretize()[0].replace(":","=");
			
			pr(indent + "enforce | "+proc+";");
		
		pr("}");

class SpiceModel:
	def __init__(self):
		self.inputs = {};
		self.outputs = {};
		self.params = {};
		self.use = Template();
		self.comp = Template();
		self.deps = [];
		self.name = "???";
		
	def set_name(self,n):
		if(n == ""): return;
		self.name = n;
	
	def get_name(self):
		return self.name;
		
	def __has_var__(self,s,v):
		return len(re.findall("\$"+v,s)) > 0
		
		
	def add_dep(self, d):
		self.deps.append(d);
	
	def get_inputs(self):
		return self.inputs;
	def add_input(self,i,v):
		if(i == ""): return;
		self.inputs[i] = {"value": v};
		
	def add_output(self,o):
		if(o == ""): return;
		self.outputs[o] = {};
	
	def make_io_exp(self,inp,outp,lo,hi):
		NPTS = 1000;
		step = (hi-lo)/NPTS;
		obj = {};
		obj["kind"] = "input-output";
		obj["low"] = lo;
		obj["high"] = hi;
		obj["step"] = step;
		obj["input"] = inp;
		obj["output"] = outp;
		return obj;
		
	def add_param(self,p):
		if(p == ""): return;
		self.params[p] = None;	
	

	def gen_comp(self,strm):
		pr = lambda x : strm.write(x+"\n");
		for l in self.comp.concretize():
			pr(l);
	
	def gen_exp(self,libdir, strm, exps):
		pr = lambda x : strm.write(x+"\n");
		
		for d in self.deps:
			pr(".INCLUDE "+libdir+d+".ckt")
			
		pr(".INCLUDE "+self.name+".ckt;");
		pr("");
		pr("* == Input Sources ==");
		
		assigns = {};
		for i in self.inputs:
			pr(wr.input_to_src(i)+" "+wr.input_to_port(i)+" 0 DC "+" "+str(self.inputs[i]["value"]));
			assigns[i] = wr.input_to_port(i);
		
		for o in self.outputs:
			assigns[o] = wr.output_to_port(o);
		
		assigns["name"] = "comp";
		pr("");
		pr("* == Relation ==");
		self.use.set_vars(assigns);
		for l in self.use.concretize():
			pr(l);
		pr("* == Experiment ==");
		pr(".control");
		for ex in exps:
			#print(str(ex))
			inp = ex["input"];
			outp = ex["output"];
			if ex["kind"] == "input-output":
				pr("dc "+wr.input_to_src(inp)+" "+str(ex["low"])+" "+str(ex["high"])+" "+str(ex["step"])+";")
				#pr("gnuplot io_"+ex["input"]+"_"+ex["output"]+" dc.V(O"+ex["output"]+") > ")
				pr("print dc.V("+wr.input_to_port(inp)+") dc.V("+wr.output_to_port(outp)+") > "+wr.in_out_to_file(inp, outp))
		#dc comp min max step
		pr("op");
		pr("run");
		pr(".endc");
		
		pr(".end")
		
	def gen_deps(self,strm):
		pr = lambda x : strm.write(x+"\n");
		for d in self.deps:
			pr(".INCLUDE "+d+".ckt")
			
	def print(self):
		print("deps:"+str(self.deps));
		print("#comp");
		self.comp.print();
		print("#use");
		self.use.print();
	

class ModelLoader:

		
	def load(url):
		clean = lambda x : x.split("\n")[0].strip()
		isvar = lambda x : x.startswith(":var")
		isdep = lambda x : x.startswith(":dep")
		getvar = lambda x : x.split(":var")[1].strip();
		getdep = lambda x : x.split(":dep")[1].strip();
		
		fn = open(url,"r");
		cmd = None;
		spice = SpiceModel();
		arco = ArcoModel();
		
		for line in fn:
			if line.startswith("@"):
				cmd = clean(line);
			else:
				if cmd == "@name":
					nm = clean(line);
					arco.set_name(nm);
					spice.set_name(nm);
					
				if cmd == "@inputs":
					inp = clean(line)
					if(len(inp.split(":")) < 2): continue;
					name = inp.split(":")[0].strip();
					dv = inp.split(":")[1].strip();
					spice.add_input(name,dv);
					arco.add_input(name);
					
				elif cmd == "@outputs":
					outp = clean(line)
					spice.add_output(outp);
					arco.add_output(outp);
				
				elif cmd == "@params":
					par = clean(line);
					spice.add_param(par);
					arco.add_param(par);
					
				elif cmd == "@model":
					l = clean(line)
					arco.add_model(l);
				
				elif cmd == "@spice-use":
					use = clean(line)
					if isvar(use):
						spice.use.define_var(getvar(use));
					else:
						spice.use.append_body(use);
				
				elif cmd == "@spice-comp":
					defn = clean(line)
					if isvar(defn):
						spice.comp.define_var(getvar(defn));
					elif isdep(defn):
						spice.add_dep(getdep(defn));
					else:
						spice.comp.append_body(defn);
		
		return (spice,arco);
