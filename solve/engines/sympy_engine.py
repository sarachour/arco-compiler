import sympy;
from data import * 
from engine import *
from sympy import *
import numpy as np
# a partial configuration is a set of parameter assignments, and
# initial conditions.


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

           #perform unification
           a_single_asgn = Basic(*targ).match(Basic(*templ))
           return a_single_asgn

        def restrict_weight(self,ctx,v,e):
           if ctx.is_output(v):
              return 100.0;
           else:
              return len(repr(e));

        def generate_restrictions(self,ctx,restrictions):
           restrict = []
           weight = []

           for (v,e) in restrictions:
              if (v,e) in restrict:
                 idx = restrict.index((v,e));
                 weight[idx] += 1;
              else:
                 weight.append(1);
                 restrict.append((v,e));

           for idx in range(0,len(restrict)):
              (v,e) = restrict[idx]
              weight[idx] = weight[idx]*self.restrict_weight(ctx,v,e)*1.0

           return weight,restrict

        def select_restrictions(self,prev_subsets,restricts,weights,size):
           weights_norm = np.array(weights) / np.sum(weights)
           # determine the size of the set of restrictions
           subset_idx = np.random.choice(range(0,len(restricts)),size,p=weights_norm,replace=False)
           subset = map(lambda i : restricts[i], subset_idx)

           tries =0
           while subset in prev_subsets and tries < 12:
                   subset_idx = np.random.choice(range(0,len(restricts)),size,p=weights_norm,replace=True)
                   subset = map(lambda i : restricts[i], subset_idx)
                   tries += 1

           if subset in prev_subsets:
                   return None;

           print(subset)
           return subset

        def unify_and_resolve_exprs(self,ctx,search_path):
           # add the paths

           depth = ctx.depth;
           fanout = ctx.max_depth - ctx.depth + 1;
           restrict_set_size = self.restrict_size;
           restrict_branches = self.restrict_branches;
           ctx.push(search_path);

           #perform unification
           new_asgns = SympyResults();
           init_asgn = self.unify_exprs(ctx,search_path)
           ctx.pop();

           generator = SympySlnGenerator(ctx);

           if init_asgn != None:
              new_asgns.join({key.name: val for key,val in init_asgn.items()})

           parent = search_path
           if not (new_asgns.empty()):
              # perform more unifications
              prev_subsets = [[]];
              for _ in range(0,restrict_branches*fanout):
                 #compute restictions
                 restricts = new_asgns.flatten_dicts_as_lists()
                 weights,options = self.generate_restrictions(ctx,restricts);
                 restrict_set_size = min(restrict_set_size,len(restricts)/2)

                 restrict_set = self.select_restrictions(prev_subsets,options,weights,restrict_set_size)
                 if restrict_set == None:
                         continue;
                 prev_subsets.append(restrict_set);
                 #compute weights for each of the restrictions
                 sibling_node = SympySearchPath().load(parent)
                 sibling_node.add_restricts(restrict_set)

                 ctx.push(sibling_node);
                 new_asgn = self.unify_exprs(ctx,sibling_node)
                 ctx.pop();

                 if new_asgn != None:
                    new_asgns.join({key.name: val for key,val in new_asgn.items()})

           results = SympyResults()
           ctx.push(parent);
           for new_asgn in new_asgns.results:
              conflicts = ctx.get_conflicts(new_asgn)
              if len(conflicts) > 0:
                 var,expr= conflicts[0] 

                 if isinstance(expr,Symbol):
                    path1 = SympySearchPath().add_assigns(new_asgn)
                    path1.set_unify(var,expr.name)

                    path2 = SympySearchPath().add_assigns(new_asgn)
                    #path2.set_unify(var,expr)

                    results1 = self.unify_and_resolve_exprs(ctx,path1)
                    #results2 = self.unify_and_resolve_exprs(ctx,path2)
                    results.join_results(results1)
                    #results.join_results(results2)
                 else:
                    path1 = SympySearchPath().add_assigns(new_asgn)
                    path1.set_unify(var,expr)
                    results1 = self.unify_and_resolve_exprs(ctx,path1)
                    results.join_results(results1)

              else:
                old_asgns = ctx.assigns.flatten_dicts_as_lists();
                all_asgns = set(new_asgn.items() + old_asgns);
                results.join(dict(all_asgns))
                
           ctx.pop();
           return results;
             
                
        

        def solve_subproblem(self,cfg,learn):
           ctx = SympyCtx(self.templ,self.targ,cfg);
           self.learn = learn; 

           s_templ = self.templ.priority;
           s_targ = self.targ.priority;
           init_path = SympySearchPath().set_unify(s_templ,s_targ)

           generator = SympySlnGenerator(ctx);
           generator.get_sln(init_path);
           #asgns = self.unify_and_resolve_exprs(ctx,init_path)


           for i in range(0,100):
                   init_path = SympySearchPath().set_unify(s_templ,s_targ)
                   n_cstrs = generator.history.n_restricts()*0.2
                   cstrs = generator.get_constraints(1 + int(n_cstrs))
                   if cstrs == None:
                      return generator.get_assignments();

                   init_path.add_restricts(cstrs);
                   nslns = generator.get_sln(init_path);
                   print("# slns:" + str(nslns))


           return generator.get_assignments(); 
           
        def solve(self):
           generator = PartialConfigGenerator(self);
           asgns = Assignments()

           configs = generator.generate()
           n =0;
           for _ in configs:
              n+=1;

           configs = generator.generate()
           i=0;
           for cfg_data in configs:
              cfg = PartialConfig()
              lrn = LearnAssignments()
              cfg.load(cfg_data);
              new_asgns = self.solve_subproblem(cfg,lrn);
              print("==== PARTIAL CONFIG "+str(i)+"/"+str(n)+" ====")
              k =0;
              for asgn in new_asgns.results:
                 assignment = Assignment()
                 # load concrete component
                 assignment.load_list(cfg.templ.get_substitution_list());
                 # load set of assignments
                 assignment.load_dict(asgn)
                 asgns.add(assignment)
                 k += 1;
              print(" ->"+str(k)+" solutions.")
              i += 1;  
           self.asgns = asgns;
            

          
engine = SympyEngine()
