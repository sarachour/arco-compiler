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

        def learn_assign(self,pos,default):
           if pos != None:
              a = Assignment().load_sympy(pos)
              self.learn.add_positive(a)
           else:
              a = Assignment().load_sympy(default)
              self.learn.add_negative(a)

        def try_unify_exprs(self,_ns,sub_templ,sub_targ,templ_expr,targ_expr,restrict):
           templ = []
           targ = []
           ns = _ns
           templ.append(self.proc_expr(ns,sub_templ,templ_expr.eqn))
           targ.append(self.proc_expr(ns,sub_targ,targ_expr.eqn))
           if templ_expr.is_diffeq() and targ_expr.is_diffeq():
              templ_ic = templ_expr.ic
              targ_ic = targ_expr.ic
              templ.append(self.proc_expr(ns,sub_templ,templ_ic))
              targ.append(self.proc_expr(ns,sub_targ,targ_ic))
           elif not templ_expr.is_diffeq() and not targ_expr.is_diffeq():
              ()
           else:
              return None

           print("TEMPL:"+str(templ))
           print("TARG:"+str(targ))
           new_asgns = Basic(*targ).match(Basic(*templ))
           print("ASGNS:"+str(new_asgns));
           return new_asgns

        def unify_exprs(self,outs,templv,targv):
           ns = self.ns
           sub_templ = self.sub_templ
           sub_targ = self.sub_targ

           asgns = dict(self.asgns[len(self.asgns)-1])

           templ_expr = self.templ.get_eqn(templv)
           if(isinstance(targv,basestring)):
              targ_expr = self.targ.get_eqn(targv)
              asgns[ns[templv]] = ns[targv]
              sub_templ[ns[templv]] = ns[targv]

           elif(not templ_expr.is_diffeq()):
              targ_expr = Eqn(targv);
              asgns[ns[templv]] = targ_expr.eqn
              sub_templ[ns[templv]] = targ_expr.eqn

           else:
              return None

           
           new_asgns = self.try_unify_exprs(ns,sub_templ,sub_targ,templ_expr,targ_expr,[])

           if new_asgns != None:
              self.asgns.append(dict(new_asgns.items()+asgns.items()))
              curr_asgn = self.asgns[len(self.asgns) - 1]
              #we already unified this
              outs.remove(templv);
              #print(outs)
              #print("------")
              return self.resolve_entanglements(outs,curr_asgn);
              
           elif len(self.asgns) > 0:
              curr_asgn = self.asgns[len(self.asgns) - 1]
              self.learn_assign(None,curr_asgn)
              return None

           else:
              return None

        def resolve_entanglements(self,outs,asgns):
           next_templ = filter(lambda (k,v) : outs.count(k.name)>0, asgns.items())
           # resolve any dependencies
           if(len(next_templ) > 0):
              varb,expr = next_templ[0];
              if isinstance(expr,Symbol):
                 result1 = self.unify_exprs(outs,varb.name,expr.name)
                 result2 = self.unify_exprs(outs,varb.name,expr)
                 self.learn_assign(result1,asgns)
                 self.learn_assign(result2,asgns)
                 if result1 == None and result2 != None:
                    return result2
                 elif result2 == None and result1 != None:
                    return result1
                 elif result1 != None and result2 != None:
                    return [result1[0],result2[0]]
                 else:
                    return None
              else:
                 result = self.unify_exprs(outs,varb.name,expr)
                 if result != None:
                    self.learn_assign(result[0],None)
                    return [result[0]];
                 else:
                    self.learn_assign(None,asgns)
                    return None
              # otherwise return the complete set of assignments
           else:
             self.learn_assign(asgns,None)
             return [asgns] 


        def solve_subproblem(self,cfg,learn):
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
           self.learn = learn; 

           s_templ = self.templ.priority;
           s_targ = self.targ.priority;

           outs = list(self.templ.outs)
           #print("===== SUBPROBLEM ======")
           asgns = self.unify_exprs(outs,s_templ,s_targ)
           if asgns != None:
              asgns_obj = [];
              for asgn in asgns:
                 #print(asgns)
                 asgn_obj = Assignment().load_sympy(asgn);
                 for par in cfg.templ.params:
                    pval = cfg.templ.params[par]
                    asgn_obj.add(par,pval)
                 asgns_obj.append(asgn_obj)

              return asgns_obj;
           else:
              return None;             

        def solve(self):
           generator = PartialConfigGenerator(self);
           asgns = Assignments()
           for cfg_data in generator.generate():
              cfg = PartialConfig()
              lrn = LearnAssignments()
              cfg.load(cfg_data);
              new_asgns = self.solve_subproblem(cfg,lrn);
              if new_asgns != None:
                 for new_asgn in new_asgns:
                    asgns.add(new_asgn);

              s_templ = self.templ.priority;
              s_targ = self.targ.priority;
              exclude = [(s_templ,s_targ)]

              size = 2;
              number = 10;
              total_number = 10;
              for _ in range(0,10):
                 restricts = lrn.restrict(size,number,exclude);
                 for restrict in restricts:
                    newcfg = PartialConfig(cfg)
                    print("-------")
                    for (v,e) in restrict:
                       print("restrict:"+(str(v)+"="+str(e)))
                       newcfg.templ.add_restrict(v,e)

                    new_asgns = self.solve_subproblem(newcfg,lrn)
                    if new_asgns != None:
                       print("-> Assignment!")
                       for new_asgn in new_asgns:
                          asgns.add(new_asgn)
                    
           self.asgns = asgns;

          
engine = SympyEngine()
