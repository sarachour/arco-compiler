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
                self.restricts = {};
                self.diffeqns = {};
                self.priority = None;
                self.labels = {};

        def clear(self):
                self.vrbs = [];
                self.outs = [];
                self.pars = {};
                self.eqns = {};
                self.inits = {};
                self.restricts = {};
                self.diffeqns = {};
                self.priority = None;

        def label_expr(self,e):
            return sympify(e).subs(self.labels)

        def variables(self):
            return self.vrbs

        def outputs(self):
            return self.eqns.keys() + self.diffeqns.keys();


        def define_variable(self,v):
            self.vrbs.append(v);

        def label_variable(self,v,l):
            self.labels[v] = Symbol(l);

        def label_param(self,v,l):
            self.labels[v] = Symbol(l);

        def restrict_var(self,v,expr):
            if not(v in self.restricts):
                self.restricts[v] = [];

            self.restricts[v].append(expr);

        def get_restricts(self,v):
            if not(v in self.restricts):
               return []

            return self.restricts[v]


        def get_inits(self):
            return self.inits

        # remove initial assigns from assign list
        def new_assigns(self,asgns):
            novel_asgns = {}
            for v in asgns:
               e = asgns[v]
               if v in self.inits:
                  e2 = self.inits[v]
                  assert(e != e2)
               else:
                  novel_asgns[v] =e

            return novel_asgns
 
        def init_var(self,v,expr):
            self.inits[v] = expr
            
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
                  exc = list(set(tmp[r] + self.get_restricts(r)))
                  ns[r] = Wild(r,exclude=exc)

        
        def namespace(self,ns,is_wild):
            for v in self.variables():
               if is_wild:
                  ns[v] = Wild(v)
               else:
                  ns[v] = Symbol(v)

            for v in self.pars:
                  ns[v] = Symbol(v)
