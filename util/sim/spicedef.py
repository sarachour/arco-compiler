#!/usr/bin/python
# A template class that allows for one to define variables with $x
class Template:
	def __init__(self):
		self.vars = {};
		self.body = [];
	
	def define_var(self,a):
		self.vars[a] = None;
	
	def get_vars(self):
		return self.vars;
	
	def assign_vars(self,d):
		for v in self.vars:
			self.vars[v] = None;
			
		for v in d:
			self.vars[v] = d[v];
	
	def concretize(self):
		return self.body;
		
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
		self.props = {};
		self.model = [];
	
	def add_input(self,i):
		if(i == ""): return;
		self.inputs.append(i);
		self.props[i] = [];
		
	def add_output(self,o):
		if(o == ""): return;
		self.outputs.append(o);
	
	def add_param(self,p):
		if(p == ""): return;
		self.params[p] = None;	
	
	def set_model(self,m):
		if(m == ""): return;
		
		self.model.append(m);
	
	def print(self):
		print("in:"+str(self.inputs));
		print("out:"+str(self.outputs));
		print("param:"+str(self.params));
		print(self.model);

	def gen_spec(self):
		indent = "  ";
		print("component XXXX {");
		for i in self.inputs:
			print(indent+"in "+i+";");
		for o in self.outputs:
			print(indent+"out "+o+";");
		for p in self.params:
			print(indent+"param "+p+"="+self.params[p]+";");
		
		for m in self.models:
			print(indent + "enforce | ??;");
		
		print("}");

class SpiceModel:
	def __init__(self):
		self.inputs = [];
		self.outputs = [];
		self.params = {};
		self.use = Template();
		self.comp = Template();
		self.deps = [];
		
		
	def add_input(self,i):
		if(i == ""): return;
		self.inputs.append(i);
		
	def add_output(self,o):
		if(o == ""): return;
		self.outputs.append(o);
	
	def add_param(self,p):
		if(p == ""): return;
		self.params[p] = None;	
	
	def define_use_var(self, v):
		self.use.define_var(v);
		
	def append_use(self, u):
		self.use.append_body(u);
	
	
	def define_comp_var(self,v):
		self.comp.define_var(v); 
		
	def append_comp(self,d):
		self.comp.append_body(d);
		
	def add_dep(self, d):
		self.deps.append(d);
	
	def print(self):
		print("deps:"+str(self.deps));
		print("#comp");
		self.comp.print();
		print("#use");
		self.use.print();
	

class SpiceDef:
	
	def get_inputs(self):
		return self.inputs;
	
	def get_outputs(self):
		return self.outputs;
		
	def get_use(self):
		return self.spice["use"];
	
	def get_def(self):
		return self.spice["def"];
	
	def print_spicedef(self):
		print("#ARCO");
		self.arco.print();
		print("\n#SPICE");
		self.spice.print();
		
	def load(self,url):
		clean = lambda x : x.split("\n")[0].strip()
		isvar = lambda x : x.startswith(":var")
		isdep = lambda x : x.startswith(":dep")
		getvar = lambda x : x.split(":var")[1].strip();
		getdep = lambda x : x.split(":dep")[1].strip();
		
		fn = open(url,"r");
		cmd = None;
		self.spice = SpiceModel();
		self.arco = ArcoModel();
		
		for line in fn:
			if line.startswith("@"):
				cmd = clean(line);
			else:
				if cmd == "@inputs":
					inp = clean(line)
					self.spice.add_input(inp);
					self.arco.add_input(inp);
					
				elif cmd == "@outputs":
					outp = clean(line)
					self.spice.add_output(outp);
					self.arco.add_output(outp);
				
				elif cmd == "@params":
					par = clean(line);
					self.spice.add_param(par);
					self.arco.add_param(par);
					
				elif cmd == "@model":
					l = clean(line)
					self.arco.set_model(l);
				
				elif cmd == "@spice-use":
					use = clean(line)
					if isvar(use):
						self.spice.define_use_var(getvar(use));
					else:
						self.spice.append_use(use);
				
				elif cmd == "@spice-comp":
					defn = clean(line)
					if isvar(defn):
						self.spice.define_comp_var(getvar(defn));
					elif isdep(defn):
						self.spice.add_dep(getdep(defn));
					else:
						self.spice.append_comp(defn);
		
		
