#!/usr/bin/python


class SpiceDef:
	
	def load(self,url):
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
				cmd = line.split("\n")[0].split("@")[1];
			else:
				if cmd == "inputs":
					inp = line.split("\n")[0];
					self.inputs.append(inp);
					
				elif cmd == "outputs":
					outp = line.split("\n")[0];
					self.outputs.append(outp);
					
				elif cmd == "model":
					model = line.split("\n")[0];
					self.model = model;
				
				elif cmd == "spice-use":
					use = line.split("\n")[0];
					self.spice["use"] = use;
				
				elif cmd == "spice-def":
					defn = line.split("\n")[0];
					self.spice["def"].append(defn);
		
		print self
