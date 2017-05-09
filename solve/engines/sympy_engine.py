import sympy;
from engine import * 
from engine import Assignment,Assignments 
from sympy import *

# a partial configuration is a set of parameter assignments, and
# initial conditions.


class SympyEngine(Engine):

        def __init__(self):
                Engine.__init__(self)
                self.backend = "sympy"
                

        def proc_expr(self,ns,repl,e):
           return sympify(e,locals=ns).xreplace(repl)

        def unify_exprs(self,outs,templv,targv):
           ns = self.ns
           sub_templ = self.sub_templ
           sub_targ = self.sub_targ
           
           templ_expr = self.templ.get_eqn(templv)
           targ_expr = self.targ.get_eqn(targv)
           asgns = dict(self.asgns[len(self.asgns)-1])
           asgns[ns[templv]] = ns[targv]

           templ = []
           targ = []

           templ.append(self.proc_expr(ns,sub_templ,templ_expr.eqn))
           targ.append(self.proc_expr(ns,sub_targ,targ_expr.eqn))
           if templ_expr.is_diffeq():
              templ_ic = templ_expr.ic
              targ_ic = targ_expr.ic
              templ.append(self.proc_expr(ns,sub_templ,templ_ic))
              targ.append(self.proc_expr(ns,sub_targ,targ_ic))


           print(templ)
           print(targ)
           asgns = Basic(*targ).match(Basic(*templ))
           if asgns != None:
              self.asgns.append(dict(asgns.items()+asgns.items()))
              #we already unified this
              print(outs)
              outs.remove(templv);
              next_templ = filter(lambda (k,v) : k in outs, asgns.items())
              # resolve any dependencies
              if(len(next_templ) > 0):
                 expr = asgns[next_templ[0]]
                 print(next_templ,expr)
              # otherwise return the complete set of assignments
              else:
                 return self.asgns[len(self.asgns)-1]

           else:
              return None

        def solve_subproblem(self,cfg):
           ns = {}
           self.templ.namespace(ns,True);
           self.targ.namespace(ns,False);
           self.ns = ns;
            
           exc_templ = cfg.templ.restrictions(ns)
           exc_targ = cfg.targ.restrictions(ns)
           self.templ.restrict(ns,exc_templ);
           self.targ.restrict(ns,exc_targ);

           self.sub_templ = cfg.templ.substitutions(ns);
           self.sub_targ = cfg.targ.substitutions(ns);
           self.asgns = [{}]

           start_templ = self.templ.priority;
           start_targ = self.targ.priority;

           
           asgns = self.unify_exprs(self.templ.outs,start_templ,start_targ)
           print(asgns)
           if asgns != None:
              a = Assignment()
              for v in asgns:
                 a.add(v.name,asgns[v])
              return a;

        def solve(self):
           generator = PartialConfigGenerator(self);
           asgns = Assignments()
           for cfg_data in generator.generate():
              cfg = PartialConfig()
              cfg.load(cfg_data);
              a = self.solve_subproblem(cfg);
              if a != None:
                 asgns.add(a);

           self.asgns = asgns;

        def write(self,ofile):
          repr = str(self.asgns)
          fh = open(ofile,'w')
          fh.write(repr)
          fh.close()

engine = SympyEngine()
