import itertools
import random
from scipy.special import comb

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
                self.eqns = {};
                self.diffeqns = {};

        def variables(self):
            return self.vrbs

        def outputs(self):
            return self.eqns.keys();

        def diffeq_outputs(self):
            return self.diffeqns.keys();


        def define_variable(self,v):
            self.vrbs.append(v);

        def get_eqn(self,v):
            if v in self.eqns:
                return self.eqns[v]
            else:
                return self.diffeqns[v]

        def add_eqn(self,v,e):
            self.eqns[v] = Eqn(e);

        def add_diff_eqn(self,v,e):
            self.diffeqns[v] = DiffEqn(e);

        def add_ic(self,v,ic):
            self.diffeqns[v].set_ic(ic);

class Assignment:
        def __init__(self):
                self.assigns = {};

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
                return "unimpl.str"

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

        def restrict(self,exclude,size,number):
                all_asgns = [];
                for asgn in self.assigns:
                        print(asgn.assigns)
                        all_asgns += [(k,v) for k,v in asgn.assigns.iteritems() if not self._contains(k,v,exclude)];

                restricts = [];
                all_restricts= itertools.combinations(all_asgns,size);

                prob = 1.0/(comb(len(all_asgns),size));
                return filter(lambda x : random.random() < prob,all_restricts);

class Engine:

        def __init__(self):
            self._targ = SOEq()
            self._templ = SOEq()

        @property
        def targ(self):
            return self._targ

        @property
        def templ(self):
            return self._templ

        @targ.setter
        def targ(self,v):
            raise Exception();

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

