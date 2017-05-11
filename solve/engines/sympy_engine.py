import sympy;
from engine import * 
from engine import Assignment,Assignments 
from sympy import *

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
          for k in s:
              self.assigns[k] = s[k];
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
             iter(lambda x : self.join(x), assigns)

        def get(self):
           if len(self.results) == 0:
               return None
           else:
               return self.results

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
                  args[k].push(rdict[k])
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
           init_asgn[search_path.templ]=search_path.targ
           self.assigns.join(search_path.assigns)
           self.assigns.join(init_asgn)
           outs = list(self.outputs.last())
           self.outputs.join(outs.remove(search_path.templ))
           self.subs.join(search_path.subs)

        def pop(self):
           self.restricts.pop()
           self.subs.pop()
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
              self._subs[self._ns[v]] = sympify(e,locals=self._ns)

           
        def apply_expr(self,e):
           return sympify(e,locals=self._ns).xreplace(self._subs)

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
              targ_expr = Eqn(targv);

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
           print("TARG",targ)
           print("TEMPL",templ)
           print("ASGN",a_single_asgn)
           return a_single_asgn

        def unify_and_resolve_exprs(self,ctx,search_path):
           asgns = SympyResults();
           search_nodes =  SympyResults();

           init_asgn = self.unify_exprs(ctx,search_path)
           search_nodes.join(search_path)
           asgns.join(init_asgn)
           if not (asgns.empty()):
              # perform more unifications
              parent = search_path
              for _ in range(0,4):
                 restricts = asgns.flatten_dicts()
                 search_node = SympySearchPath().load(parent).add_restricts(subset)
                 new_asgn = self.unify_exprs(ctx,search_node)
                 asgns.join(new_asgn)
                 search_nodes.join(search_node)

           results = SymcamlResults()
           for node in search_nodes:
              ctx.push(node)
              ctx.apply_ctx()
              if ctx.conflicts() > 0:
                 var,expr = ctx.get_conflict()
                 if isinstance(expr,Symbol):
                    path1 = SymcamlSearchPath().load(node).set_targ(var,expr.name)
                    path2 = SymcamlSearchPath().load(node).set_targ(var,expr)
                    results1 = self.unify_and_resolve_exprs(ctx,path1)
                    results2 = self.unify_and_resolve_exprs(ctx,path2)
                    results.join_results(result1)
                    results.join_results(result2)
              else:
                results.join(ctx.get_assigns())
              ctx.pop()

           return results;
             
                
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
           ctx = SympyCtx(self.templ,self.targ,cfg);
           self.learn = learn; 

           s_templ = self.templ.priority;
           s_targ = self.targ.priority;
           init_path = SympySearchPath().set_unify(s_templ,s_targ)
           ctx.push(init_path);
           asgns = self.unify_and_resolve_exprs(ctx,init_path)

           return asgns
           
        def solve(self):
           generator = PartialConfigGenerator(self);
           asgns = Assignments()
           for cfg_data in generator.generate():
              cfg = PartialConfig()
              lrn = LearnAssignments()
              cfg.load(cfg_data);
              print(cfg_data)
              new_asgns = self.solve_subproblem(cfg,lrn);
              print(new_asgns);
              return;
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
