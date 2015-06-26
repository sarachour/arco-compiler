from z3 import *

class TopologySolvingProblem:

    def __init__(self):
        self.comps = {};
        self.edgemat = [];

    def check(self):
        print "checked.";
        t=self.s.check()
        if t==sat:
            print "==== Satisfiable ===="
            m = self.s.model();
            print m
        else:
           print t

t = TopologySolvingProblem();