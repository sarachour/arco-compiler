#!/usr/bin/python


class SpiceDef:
	
	def load(self,url):
		clean = lambda x : x.split("\n")[0].strip()
		fn = open(url,"r");
		cmd = None;
		self.inputs = [];
		self.outputs = [];
		self.spice = {};
		self.spice["def"] = [];
		self.spice["use"] = "";
		self.model = "";
		
		for line in fn:
			if line.startswith("@"):
				cmd = clean(line);
			else:
				if cmd == "@inputs":
					inp = clean(line)
					self.inputs.append(inp);
					
				elif cmd == "@outputs":
					outp = clean(line)
					self.outputs.append(outp);
					
				elif cmd == "@model" and self.model == "":
					model = clean(line)
					self.model = model;
				
				elif cmd == "@spice-use" and self.spice["use"] == "":
					use = clean(line)
					self.spice["use"] = use;
				
				elif cmd == "@spice-def":
					defn = clean(line)
					self.spice["def"].append(defn);
		
		
