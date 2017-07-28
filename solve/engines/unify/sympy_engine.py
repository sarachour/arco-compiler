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

        
        
        def solve_subproblem(self,cfg,learn):
           ctx = SympyCtx(self.templ,self.targ,cfg);
           self.learn = learn; 

           s_templ = self.templ.priority;
           s_targ = self.targ.priority;
           init_path = SympySearchPath().set_unify(s_templ,s_targ)

           generator = SympySlnGenerator(ctx);
           generator.get_sln(init_path);
           #asgns = self.unify_and_resolve_exprs(ctx,init_path)


           #ntries = 25 
           ntries = 50

           restrict_frac = 1.0;
           total_slns = 0;
           sln_ratio = 1;
           target_ratio = 0.2;

           # control system for number of results
           for i in range(0,ntries):
                   init_path = SympySearchPath().set_unify(s_templ,s_targ)
                   n_cstrs = generator.history.n_restricts()*restrict_frac
                   cstrs = generator.get_constraints(1 + int(n_cstrs))
                   if cstrs == None:
                      return generator.get_assignments();

                   init_path.add_restricts(cstrs);
                   nslns = generator.get_sln(init_path);
                   total_slns += nslns;

                   # control system
                   sln_ratio = total_slns / float(1+i) + 1e-6
                   restrict_frac = (target_ratio/sln_ratio)*0.2 + restrict_frac*0.8
                   print("# slns:" + str(nslns))
                   print("ratio:" + str(restrict_frac))


           # ASSIGNMENTS
           generator.print_assignments();
           return zip(generator.get_solved(),generator.get_assignments()); 
           
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
              new_slns = self.solve_subproblem(cfg,lrn);
              print("==== PARTIAL CONFIG "+str(i)+"/"+str(n)+" ====")
              k =0;
              for (solved, asgn) in new_slns:
                 assignment = Assignment()
                 # load concrete component
                 assignment.load_list(cfg.templ.get_substitution_list());
                 # load set of assignments
                 assignment.load_dict(asgn)
                 assignment.load_solved(solved.items())
                 asgns.add(assignment)
                 k += 1;
              print(" ->"+str(k)+" solutions.")
              i += 1;

           self.asgns = asgns;
            

          
engine = SympyEngine()
