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
                self.labels = {};

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

        def label_variable(self,v,l):
            self.labels[v] = l;

        
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

        def label_param(self,v,l):
            self.labels[v] = l

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
