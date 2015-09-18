#!/usr/bin/python
import re

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
		
	def add_model(self,m):
		if(m == ""): return;
		mdl = self.__parse_model__(m);
		self.models.append(mdl);
	
	def print(self):
		print("in:"+str(self.inputs));
		print("out:"+str(self.outputs));
		print("param:"+str(self.params));
		print(self.models);

	def set_param(self, k, v):
		self.params[k] = v;
		
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
			m["rel"].assign_vars(subs);
			proc = m["rel"].concretize()[0].replace(":","=");
			
			pr(indent + "enforce | "+proc+";");
		
		pr("}");

class SpiceModel:
	def __init__(self):
		self.inputs = [];
		self.outputs = [];
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
	
	def define_use_var(self, v):
		self.use.define_var(v);
		
	def __has_var__(self,s,v):
		return len(re.findall("\$"+v,s)) > 0
		
	def append_use(self, u):
		for i in (self.inputs + self.outputs):
			if self.__has_var__(u,i):
				self.use.define_var(i);
		self.use.append_body(u);
	
	def append_comp(self,d):
		for i in (self.inputs + self.outputs):
			if self.__has_var__(d,i):
				self.comp.define_var(i);
				
		self.comp.append_body(d);
	
	def define_comp_var(self,v):
		self.comp.define_var(v); 
	
	def get_comp_vars(self, v):
		return self.comp.get_vars();
	
	def set_comp_vars(self,v):
		self.comp.assign_vars(v);
		
		
	def add_dep(self, d):
		self.deps.append(d);
	
	def add_input(self,i):
		if(i == ""): return;
		self.inputs.append(i);
		
	def add_output(self,o):
		if(o == ""): return;
		self.outputs.append(o);
	
	def add_param(self,p):
		if(p == ""): return;
		self.params[p] = None;	
	

	def gen_comp(self,strm):
		pr = lambda x : strm.write(x+"\n");
		for l in self.comp.concretize():
			pr(l);
			
	def gen_exp(self,strm):
		pr = lambda x : strm.write(x+"\n");
		self.gen_deps(strm);
		pr(".INCLUDE "+self.name+".ckt;");
		
		assigns = {};
		for i in self.inputs:
			pr("V"+i+" I_"+i+" 0 DC "+" 0");
			assigns[i] = "I_"+i
		
		for o in self.outputs:
			assigns[o] = "O_"+o;
		
		assigns["name"] = "comp";
		pr("\n");
		self.use.assign_vars(assigns);
		for l in self.use.concretize():
			pr(l);
		
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
	

class SpiceDef:
	def get_name(self):
		return self.spice.get_name();
		
	def gen_arco_spec(self,strm):
		self.arco.gen_spec(strm);
	
	def gen_spice_exp(self,strm):
		self.spice.gen_exp(strm);
	
	def gen_spice_comp(self,strm):
		self.spice.gen_comp(strm);
	
	def set_model_param(self,k,v):
		self.arco.set_param(k,v);
	
	def set_spice_comp_vars(self,d):
		self.spice.set_comp_vars(d);
		
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
				if cmd == "@name":
					nm = clean(line);
					self.arco.set_name(nm);
					self.spice.set_name(nm);
					
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
					self.arco.add_model(l);
				
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
		
		
