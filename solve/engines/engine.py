import itertools

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

