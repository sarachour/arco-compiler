import itertools
import random
from scipy.special import comb
from sympy import * 

class Eqn:
        def __init__(self,e):
                self.kind = "eqn"
                self.eqn = e

        def is_diffeq(self):
            return False;

class DiffEqn:
        def __init__(self,e):
                self.kind = "diffeqn"
                self.eqn = e
                self.ic = None

        def set_ic(self,ic):
                self.ic = ic;

        def is_diffeq(self):
            return True;



class SOEq:
        def __init__(self):
                self.vrbs = [];
                self.outs = [];
                self.pars = {};
                self.eqns = {};
                self.inits = {};
                self.diffeqns = {};
                self.priority = None;

        def clear(self):
                self.vrbs = [];
                self.outs = [];
                self.pars = {};
                self.eqns = {};
                self.inits = {};
                self.diffeqns = {};
                self.priority = None;

        def variables(self):
            return self.vrbs

        def outputs(self):
            return self.eqns.keys();

        def diffeq_outputs(self):
            return self.diffeqns.keys();


        def define_variable(self,v):
            self.vrbs.append(v);

        def init_var(self,v,expr):
            if not(v in self.inits):
                self.inits[v] = [];

            self.inits[v].append(v);

        def get_eqn(self,v):
            if v in self.eqns:
                return self.eqns[v]
            else:
                return self.diffeqns[v]

        def add_eqn(self,v,e):
            self.outs.append(v);
            self.eqns[v] = Eqn(e);

        def add_diff_eqn(self,v,e):
            self.outs.append(v);
            self.diffeqns[v] = DiffEqn(e);

        def add_ic(self,v,ic):
            self.diffeqns[v].set_ic(ic);

        def define_param(self,v,vals):
            self.pars[v] = vals;

        def prioritize(self,v):
            self.priority = v

        def restrict(self,ns,restricts):
            tmp = {};
            for (k,v) in restricts:
               if not (k in tmp):
                  tmp[k] = []
               tmp[k].append(v)

            for r in tmp:
               if isinstance(ns[r], Wild):
                  exc = list(set(tmp[r]))
                  ns[r] = Wild(r,exclude=exc)

        
        def namespace(self,ns,is_wild):
            for v in self.variables():
               if is_wild:
                  ns[v] = Wild(v)
               else:
                  ns[v] = Symbol(v)

            for v in self.pars:
                  ns[v] = Symbol(v)

class Assignment:
        def __init__(self):
                self.assigns = {};

        def load_sympy(self,asgns):
           a = Assignment()
           for v in asgns:
              a.add(v,asgns[v])
           return a;

        def add(self,v,expr):
                self.assigns[v] = expr;


        def equals(self,other):
                for v in self.assigns:
                        if not (v in other.assigns):
                                return False;
                        else:
                                other_e = other.assigns[v];
                                self_e = self.assigns[v];
                                if other_e != self_e:
                                        return False;

                return True;



        def __repr__(self):
                return "unimpl.repr"

        def __str__(self):
                assign_str= [(k+"$"+(srepr(v))) for k,v in self.assigns.iteritems()]
                strn="|".join(assign_str)
                return strn


class Assignments:
        def __init__(self):
                self.assigns = [];

        def add(self,asgn):
                for c_asgn in self.assigns:
                        if c_asgn.equals(asgn):
                                return False

                self.assigns.append(asgn);
                return True;

        def __repr__(self):
                return "unimpl.repr"

        def __str__(self):
                st = "";
                for asgn in self.assigns:
                        st += asgn.__str__() + "\n"

                return st


        def _contains(self,var,expr,exclude):
                if var in exclude:
                        e = exclude[expr];
                        if expr == e:
                                return True;
                return False;

        def all_assigns(self,exclude):
           all_asgns = [];
           for asgn in self.assigns:
              all_asgns += [(k,v) for k,v in asgn.assigns.iteritems() if not self._contains(k,v,exclude)];
           return all_asgns;

        def restrict(self,exclude,size,number):
                all_asgns = self.assigns();
                restricts = [];
                all_restricts= itertools.combinations(all_asgns,size);
                prob = number/(comb(len(all_asgns),size));
                sel=filter(lambda x : random.random() <= prob,all_restricts);
                return map(lambda x: list(x),sel)

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
            self.restrict_n = 10;
            self.restrict_size = 1;
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

        def set_restrict_n(self,n):
            self.restrict_n = n;

        def set_restrict_size(self,n):
            self.restrict_size = n;

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

class PartialConfigSOEQ:
        def __init__(self,cfg=None):
            if cfg == None:
                self.params = {};
                self.inits = {};
                self.restricts = {};
                self.assigns = {};
            else:
                self.params = dict(cfg.params);
                self.inits = dict(cfg.inits);
                self.restricts = dict(cfg.restricts);
                self.assigns = dict(cfg.assigns);

        def restrictions(self,ns):
           excludes = {};
           for v in self.restricts:
              exprs = self.restricts[v]
              excludes[v] = map(lambda x:sympify(x,locals=ns),exprs)
           return excludes

        def substitutions(self,ns):
           repls = {}
           for (v,e) in self.inits.items():
              repls[ns[v]] = sympify(e,locals=ns)

           for (p,v) in self.params.items():
              repls[ns[p]] = sympify(v,locals=ns)

           for (v,e) in self.assigns.items():
              repls[ns[v]] = sympify(e,locals=ns)

           return repls;


        def get_restrictions(self):
           restricts = [];
           for v in self.restricts:
             exc = self.restricts[v]
             restricts.push(v,exc)

           return restricts

        def get_substitutions(self):
           repls = {}
           for (v,e) in self.inits.items():
              repls[v] = e
           for (v,e) in self.params.items():
              repls[v] = e
           for (v,e) in self.assigns.items():
              repls[v] = e

           return repls

        def add_restrict(self,v,e):
           if not (v in self.restricts):
             self.restricts[v] = []
           self.restricts[v].append(e);

        def set_param(self,v,e):
           self.params[v] = e

        def set_init(self,v,e):
           self.inits[v] = e;

class PartialConfig:
        def __init__(self,cfg=None):
            if cfg == None:
               self.templ = PartialConfigSOEQ();
               self.targ = PartialConfigSOEQ();
            else:
               self.templ = PartialConfigSOEQ(cfg.templ)
               self.targ = PartialConfigSOEQ(cfg.targ)


        def load(self,d):
            for (k,v,expr) in list(d):
                if k == "vp":
                   self.targ.set_param(v,expr)
                elif k == "xp":
                   self.templ.set_param(v,expr)
                elif k == "v":
                   self.targ.set_init(v,expr)
                elif k == "x":
                   self.templ.set_init(v,expr)

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
