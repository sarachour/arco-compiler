import sympy;
from engine import * 
from engine import Assignment,Assignments 
from sympy import *
import numpy as np
# a partial configuration is a set of parameter assignments, and
# initial conditions.

# a search path is a set of assignments
class SympySearchPath:

        def __init__(self):
            self.restricts = [];
            self.assigns = {};
            self.subs = {};
            self.templ = None;
            self.targ = None;

        def add_restricts(self,r):
            self.restricts += r
            return self;

        def add_substitutions(self,s):
           for k in s:
              self.substitutions[k] = s[k];
           return self;

        def add_assigns(self,a):
          for k in a:
              self.assigns[k] = a[k];
          return self;

        def set_unify(self,v,e):
            self.templ = v;
            self.targ = e;
            return self

        def load(self, v):
            self.restricts = list(v.restricts);
            self.assigns = dict(v.assigns);
            self.subs = dict(v.subs);
            self.templ = (v.templ);
            self.targ = (v.targ);
            return self

class SympyResults:

        def __init__(self):
           self.results = [];

        def join(self,assigns):
           if assigns != None:
                self.results.append(assigns);

        def pop(self):
              self.results.pop()

        def last(self):
              return self.results[len(self.results)-1]

        def join_all(self,assigns):
           if assigns != None:
             for r in assigns:
                self.join(r);

        def join_results(self,other):
           self.join_all(other.results)

        def get(self):
           if len(self.results) == 0:
               return None
           else:
               return self.results

        def flatten_dicts_as_lists(self):
           args = [];
           for r in self.results:
              args = args + r.items()
           return args

        def flatten_lists(self):
           args = [];
           for r in self.results:
              args = args + r 
           return args

        def flatten_dicts(self):
           args = {};
           for rdict in self.results:
              for k in rdict:
                if k in args and isinstance(args[k],list):
                  args[k].append(rdict[k])
                elif k in args:
                  args[k] = [args[k],rdict[k]]
                else:
                  args[k] = rdict[k]

           return args

        def empty(self):
           return len(self.results) == 0
   
class SympyCtx:

        def __init__(self,templ,targ,cfg):
           self.restricts = SympyResults();
           self.assigns = SympyResults();
           self.subs = SympyResults();
           self.outputs = SympyResults();

           self.outputs.join(templ.outputs()+[templ.priority])
           self.targ = targ;
           self.templ = templ;
           self.depth = 0;
           self.max_depth = len(self.outputs.last())

           ns = {};
           templ.namespace(ns,True);
           targ.namespace(ns,False);
           self.ns = ns;
            
           self.restricts.join_all(cfg.templ.get_restrictions())
           self.subs.join(cfg.templ.get_substitutions());
           self.subs.join(cfg.targ.get_substitutions());

        def push(self,search_path):
           self.restricts.join(search_path.restricts)
           init_asgn = {};
           if isinstance(search_path.targ,basestring):
              init_asgn[search_path.templ]=Symbol(search_path.targ)
           else:
              init_asgn[search_path.templ]=search_path.targ
           self.assigns.join(search_path.assigns)
           self.assigns.join(init_asgn)
           outs = list(self.outputs.last())
           outs.remove(search_path.templ)
           self.outputs.join(outs)
           self.depth += 1;
           self.subs.join(search_path.subs)

        def pop(self):
           self.restricts.pop()
           self.subs.pop()
           self.depth -= 1;
           self.assigns.pop()
           self.assigns.pop()
           self.outputs.pop()

        def apply_ctx(self):
           self._ns = dict(self.ns)
           subs = self.subs.flatten_dicts();
           assigns = self.assigns.flatten_dicts();

           restricts = self.restricts.flatten_lists();
           self.templ.restrict(self._ns,restricts);

           self._subs = {}
           for (v,e) in subs.items() + assigns.items():
                if isinstance(e,basestring):
                   self._subs[self._ns[v]] = sympify(e,locals=self._ns)
                else:
                   self._subs[self._ns[v]] = e


        def is_output(self,v):
           return self.outputs.last().count(v) > 0

        def get_conflicts(self,assigns):
           conflicts = [];
           for k in assigns:
              if self.is_output(k):
                 conflicts.append((k,assigns[k]))
           return conflicts;


        def apply_expr(self,e):
           if isinstance(e,basestring):
              expr = sympify(e,locals=self._ns)
           else:
              expr = e
           sub_expr = expr.xreplace(self._subs)
           return sub_expr

class SympyEngine(Engine):

        def __init__(self):
           Engine.__init__(self)
           self.backend = "sympy"

        
        def learn_assign(self,pos,default):
           if pos != None:
              a = Assignment().load_sympy(pos)
              self.learn.add_positive(a)
           else:
              a = Assignment().load_sympy(default)
              self.learn.add_negative(a)


        def unify_exprs(self,ctx,search_path):
           ctx.apply_ctx();
           templ_expr = self.templ.get_eqn(search_path.templ)

           if(isinstance(search_path.targ,basestring)):
              targ_expr = self.targ.get_eqn(search_path.targ)

           elif(not templ_expr.is_diffeq()):
              targ_expr = Eqn(search_path.targ);

           else:
              return None
       
           templ = []
           targ = []
           templ.append(ctx.apply_expr(templ_expr.eqn))
           targ.append(ctx.apply_expr(targ_expr.eqn))

           if templ_expr.is_diffeq() and targ_expr.is_diffeq():
              templ.append(ctx.apply_expr(templ_expr.ic))
              targ.append(ctx.apply_expr(targ_expr.ic))

           elif not templ_expr.is_diffeq() and not targ_expr.is_diffeq():
              ()
           else:
              return None

           a_single_asgn = Basic(*targ).match(Basic(*templ))
           return a_single_asgn

        def restrict_weight(self,ctx,v,e):
           if ctx.is_output(v):
              return 10.0;
           else:
              return 1.0;

        def unify_and_resolve_exprs(self,ctx,search_path):
           asgns = SympyResults();
           # add the paths

           depth = ctx.depth;
           fanout = ctx.max_depth - ctx.depth + 1;
           nre = 3
           ctx.push(search_path);
           init_asgn = self.unify_exprs(ctx,search_path)
           ctx.pop();

           if init_asgn != None:
              asgns.join({key.name: val for key,val in init_asgn.items()})

           parent = search_path
           if not (asgns.empty()):
              # perform more unifications
              for _ in range(0,12*fanout):
                 all_results = map(lambda x: x.items(),asgns.results)
                 restricts = reduce(lambda x,lst:x+lst,all_results)
                 weights = map(lambda(v,e): self.restrict_weight(ctx,v,e),restricts)
                 weights_norm = np.array(weights) / np.sum(weights)
                 # select a random set of restrictions
                 nban = min(nre,len(restricts)/2)
                 subset_idx = np.random.choice(range(0,len(restricts)),nban,p=weights_norm,replace=False)
                 print(subset_idx)
                 subset = map(lambda i : restricts[i], subset_idx)
                 print(subset)
                 # add the restrictions to the child node
                 sibling_node = SympySearchPath().load(parent)
                 sibling_node.add_restricts(subset)

                 ctx.push(sibling_node);
                 new_asgn = self.unify_exprs(ctx,sibling_node)
                 ctx.pop();

                 if new_asgn != None:
                    asgns.join({key.name: val for key,val in new_asgn.items()})

           results = SympyResults()
           ctx.push(parent);
           for asgn in asgns.results:

              conflicts = ctx.get_conflicts(asgn)
              if len(conflicts) > 0:
                 var,expr= conflicts[0] 

                 if isinstance(expr,Symbol):
                    path1 = SympySearchPath().add_assigns(asgn)
                    path1.set_unify(var,expr.name)

                    path2 = SympySearchPath().add_assigns(asgn)
                    path2.set_unify(var,expr)

                    results1 = self.unify_and_resolve_exprs(ctx,path1)
                    results2 = self.unify_and_resolve_exprs(ctx,path2)
                    results.join_results(results1)
                    results.join_results(results2)
                 else:
                    path1 = SympySearchPath().add_assigns(asgn)
                    path1.set_unify(var,expr)
                    results1 = self.unify_and_resolve_exprs(ctx,path1)
                    results.join_results(results1)

              else:
                old_asgns = ctx.assigns.flatten_dicts_as_lists();
                all_asgns = set(asgn.items() + old_asgns);
                results.join(dict(all_asgns))
                

           ctx.pop();
           return results;
             
                
        

        def solve_subproblem(self,cfg,learn):
           ctx = SympyCtx(self.templ,self.targ,cfg);
           self.learn = learn; 

           s_templ = self.templ.priority;
           s_targ = self.targ.priority;
           init_path = SympySearchPath().set_unify(s_templ,s_targ)
           asgns = self.unify_and_resolve_exprs(ctx,init_path)

           return asgns
           
        def solve(self):
           generator = PartialConfigGenerator(self);
           asgns = Assignments()

           for cfg_data in generator.generate():
              cfg = PartialConfig()
              lrn = LearnAssignments()
              cfg.load(cfg_data);
              new_asgns = self.solve_subproblem(cfg,lrn);
              print("==== Done ====")
              for asgn in new_asgns.results:
                 print(asgn)
                 assignment = Assignment()
                 assignment = assignment.load_sympy(asgn)
                 asgns.add(assignment)

           self.asgns = asgns;
            

          
engine = SympyEngine()
