#!/usr/bin/python


class SpiceDef:
	
	def load(self,url):
		fn = open(url,"r");
		for line in fn:
			print(line);
