import itertools
import random
from scipy.special import comb
from sympy import * 
from data.eqn import *
from data.assign import *
from data.partial import *
from data.search import *

def get_key_value_pairs(dictarr):
        els = map(lambda x : x.items(), dictarr);
        return reduce(lambda x,lst: x+lst, els)



class LearnAssignments:
        def __init__(self):
           self.positive = Assignments();
           self.negative = Assignments();

        def add_negative(self,asgn):
           self.negative.add(asgn);

        def add_positive(self,asgn):
           self.positive.add(asgn);


        def restrict(self,size,number,exclude):
           pos = self.positive.all_assigns(exclude)
           neg = self.negative.all_assigns(exclude)
           choices = set(neg).union(set(pos))
           restricts = [];
           all_restricts= itertools.combinations(choices,size);
           prob = number/(comb(len(choices),size));
           sel=filter(lambda x : random.random() <= prob,all_restricts);
           return map(lambda x: list(x),sel)

class Engine:

        def __init__(self):
            self._targ = SOEq()
            self._templ = SOEq()
            self.restrict_size = 1;
            self.restrict_branches = 2;
            self.asgns = None

        @property
        def targ(self):
            return self._targ

        @property
        def templ(self):
            return self._templ

        @targ.setter
        def targ(self,v):
            raise Exception();


        def set_restrict_size(self,n):
            self.restrict_size = n;

        def set_restrict_branches(self,n):
            self.restrict_fanout = n;

        @templ.setter
        def templ(self,v):
            raise Exception();

        def _1to1_set(self,setv):
            templvs = map(lambda (a,b) : a, setv);
            targvs = map(lambda (a,b) : b, setv);
            return len(templvs) == len(set(templvs)) and \
                len(targvs) == len(set(targvs))

        def unifications(self):
            pairs = []
            pairs += itertools.product(self._templ.outputs(),self._targ.outputs());
            pairs += itertools.product(self._templ.diffeq_outputs(),self._targ.diffeq_outputs());

            n_outputs = len(self._targ.outputs()) + len(self._targ.diffeq_outputs())
            sets = itertools.combinations(pairs,n_outputs)
            usets = filter(lambda s : self._1to1_set(s),sets);
            return list(map(lambda x : list(x), usets));

        def solve(self,n):
            raise Exception();


        def write(self,out):
          repr = str(self.asgns)
          fh = open(out,'w')
          fh.write(repr)
          fh.close()



        def clear(self):
            self._targ.clear()
            self._templ.clear()
            self.asgns = None


class PartialConfigGenerator:

        def __init__(self,eng):
            self.prob = eng;

        def generate(self):
            choices= [];
            for p in self.prob.templ.pars:
               vals = self.prob.templ.pars[p]
               choices.append(map(lambda v:("xp",p,v),vals))

            for p in self.prob.targ.pars:
               vals = self.prob.targ.pars[p]
               choices.append(map(lambda v:("vp",p,v),vals))

            for o in self.prob.templ.inits:
               vals = self.prob.templ.inits[o]
               choices.append(map(lambda v:("x",o,v),vals))

            for o in self.prob.targ.inits:
               vals = self.prob.targ.inits[o]
               choices.append(map(lambda v:("v",o,v),vals))
  
            
            configs = itertools.product(*choices);
            return configs;
