import sympy;
from engine import Engine
from sympy import *

class SympyEngine(Engine):

        def __init__(self):
                Engine.__init__(self)
                self.backend = "sympy"


        def solve_asgn(self,ns,asgn):
                get_expr = lambda a,x : sympify(a.get_eqn(x).eqn,locals=ns)
                get_ic = lambda a,x : sympify(a.get_eqn(x).ic,locals=ns)
                repls = {};
                for (templv,targv) in asgn:
                        repls[sympify(templv,locals=ns)] = sympify(targv,locals=ns);

                templs = []
                targs = []
                for (templv,targv) in asgn:
                        targ_expr = get_expr(self.targ,targv);
                        templ_expr = get_expr(self.templ,templv).xreplace(repls);
                        targs.append(targ_expr);
                        templs.append(templ_expr);
                        if self.templ.get_eqn(templv).is_diffeq():
                                targ_ic = get_ic(self.targ,targv);
                                templ_ic = get_ic(self.templ,templv).xreplace(repls);
                                targs.append(targ_ic);
                                templs.append(templ_ic);

                print(targs);
                print(templs);
                asgn=Basic(*targs).match(Basic(*templs))
                print(asgns);
                #for (temple,targe) in zip(templs,targs):
                #        asgns=targe.match(temple);
                #        print(asgns)

                return asgn

        def solve(self):
                ns = {};
                for v in self.templ.variables():
                        ns[v] = Wild(v);

                for v in self.targ.variables():
                        ns[v] = Symbol(v);

                for asgn in self.unifications():
                        self.solve_asgn(ns,asgn)

                
engine = SympyEngine()
