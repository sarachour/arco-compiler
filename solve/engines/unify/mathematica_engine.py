from subprocess import call
from engine import Engine 
from engine import Engine
from engine import Assignment,Assignments 
from sympy import *

class MathematicaEngine(Engine):

        def construct_asgn(self,ns,asgn,restrict):
                
                get_expr = lambda a,x : sympify(a.get_eqn(x).eqn,locals=ns)
                get_ic = lambda a,x : sympify(a.get_eqn(x).ic,locals=ns)

                clauses = [];
                for (v,e) in restrict:
                        clauses.append(v+"!="+str(e))

                repls = {};
                for (templv,targv) in asgn:
                        repls[sympify(templv,locals=ns)] = sympify(targv,locals=ns);

                for (templv,targv) in asgn:
                        targ_expr = str(get_expr(self.targ,targv));
                        templ_expr = str(get_expr(self.templ,templv).xreplace(repls));
                        clauses.append(targ_expr +"=="+templ_expr)
                        if self.templ.get_eqn(templv).is_diffeq():
                                targ_ic = str(get_ic(self.targ,targv));
                                templ_ic = str(get_ic(self.templ,templv).xreplace(repls));
                                clauses.append(targ_ic + "==" + templ_ic)


                clause_str = "&&".join(clauses);
                wcs = ",".join(map(lambda x : x+"_",self.templ.variables()));
                syms = ",".join(self.targ.variables());
                cmd1 = "preds=Resolve[ForAll[{%s},%s],Reals]"% (syms,clause_str);
                cmd2 = "asgns=Solve[preds,{%s}]" % wcs;
                cmd3 = "Print[asgns]"
                return [cmd1,cmd2,cmd3]

        def solve(self):
                # concretize each expression.
                ns={};
                for v in self.templ.variables():
                        ns[v] = Wild(v)
                        
                for v in self.targ.variables():
                        ns[v] = Symbol(v);

                #res = self.m.eval(prob)
                partial_asgns = self.unifications();
                asgns = Assignments();

                cmds = [];
                for asgn in partial_asgns:
                        solve_cmd = self.construct_asgn(ns,asgn,[])
                        cmds += solve_cmd;

                tmpfile = "tmp.mmka";
                with open(tmpfile,"w") as h:
                        for cmd in cmds:
                                h.write(cmd+"\n")

                #prob = "Solve["+cstrs+",{"+wilds+"}]"
                result= call(["math","-script",tmpfile])



engine = MathematicaEngine();
