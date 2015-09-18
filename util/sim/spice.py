import subprocess as sp
import re 
class Wrapper:
	def input_to_src(name):
		return "V"+name;
	
	def input_to_port(name):
		return "I"+name;
	
	def port_to_var(name):
		v = name[1:];
		return v;
	
	def output_to_port(name):
		return "O"+name;
	
	def in_out_to_file(i,o):
		return "io_"+i+"_"+o+".dat"
	
	def exp_to_file():
		return "experiment.sim"
	
	def dc_port_to_input(name):
		v = name.split("dc.")[1];
		v = v[:-1]
		v = v[2:]
		v = Wrapper.port_to_var(v);
		return v;
		
class Simulation:
	
	#def __init__(self):	
	
	def get_rel(self,ivar,ovar):
		fn = Wrapper.in_out_to_file(ivar,ovar);
		fh = open(fn);
		if fh == False: raise ValueError("Simulation|get_rel: File handle not defined")
		
		for line in fh:
			if line.startswith("---------"):
				break;
				 
		data = {};
		header = None;
		for line in fh:
			line = line.strip()
			els = re.split("[\t ]+",line);
			if header == None:
				header = els;
				for k in els:
					data[k] = [];
					
			if len(els) > 1:
				try:
					for i in range(0,len(header)):
						dp = float(els[i]);
						data[header[i]].append(dp);
						
				except ValueError:
					continue;
		
		for k in header:
			if k.startswith("dc."):
				newk = Wrapper.dc_port_to_input(k);
			elif k == "Index":
				newk = "idx";
			elif k == "v-sweep":
				newk = "value";
			else:
				newk = k;
				
			tmp = data[k];
			del data[k];
			data[newk] = tmp;
			
		return data;
				
	def clean(self):
			sp.call(["rm *.dat"], shell=True);
			#sp.call(["rm", "-f", "experiment.sim"]);
			
	def run(self):
		with open('log.err.txt',"w") as fe:
			with open('log.out.txt',"w") as fo:
				sp.call(["ngspice","-b",Wrapper.exp_to_file()],
					stderr = fe,
					stdout = fo);
