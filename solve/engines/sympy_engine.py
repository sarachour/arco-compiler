import sympy;
from engine import Engine
from engine import Assignment,Assignments 
from sympy import *



class SympyEngine(Engine):

        def __init__(self):
                Engine.__init__(self)
                self.backend = "sympy"


        def solve_asgn(self,ns,asgn,restrict):
                get_expr = lambda a,x : sympify(a.get_eqn(x).eqn,locals=ns)
                get_ic = lambda a,x : sympify(a.get_eqn(x).ic,locals=ns)
                repls = {};

                excludes = {};
                for (v,e) in restrict:
                        if not (v in excludes):
                                excludes[v] = []
                        excludes[v].append(e)

                for v in excludes:
                        ns[v] = Wild(v,exclude=excludes[v])

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

                new_asgn=Basic(*targs).match(Basic(*templs))
                if new_asgn == None:
                        return None;
                a = Assignment();
                for v in new_asgn:
                        a.add(v.name,new_asgn[v]);

                for (v,e) in asgn:
                        a.add(v,e)

                for v in excludes:
                        ns[v] = Wild(v);
                return a;

        def solve(self):
                ns = {};
                for v in self.templ.variables():
                        ns[v] = Wild(v);

                for v in self.targ.variables():
                        ns[v] = Symbol(v);

                partial_asgns = self.unifications();
                asgns = Assignments()
                for asgn in partial_asgns:
                        completed_asgn = self.solve_asgn(ns,asgn,[])
                        if completed_asgn <> None:
                                asgns.add(completed_asgn);

                for asgn in partial_asgns:
                        restricts = asgns.restrict(asgn,2,5);
                        for restrict in restricts:
                                completed_asgn = self.solve_asgn(ns,asgn,restrict)
                                if completed_asgn <> None:
                                        asgns.add(completed_asgn);

                print(asgn);
engine = SympyEngine()
