from sympy import *
from eqn import *
import numpy as np

# a search path is a set of assignments
class SympySearchPath:

        def __init__(self):
            self.restricts = [];
            self.assigns = {};
            self.solved = None;
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

        def set_solved(self,v):
          if v != None:
            v1,v2 = v         
            self.solved = (v1,v2)
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
            self.solved = (v.solved);
            return self


class SympyResults:

        def __init__(self,remove_none=True):
           self.results = [];
           self._remove_none = remove_none;

        def join(self,assigns):
           if assigns != None or not self._remove_none:
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
           self.solved = SympyResults(false);
           self.subs = SympyResults();
           self.outputs = SympyResults();

           self.outputs.join(templ.outputs())
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
           self.subs.join(templ.get_inits());
           self.subs.join(targ.get_inits())

        def push(self,search_path):

           new_asgns = {};
           if isinstance(search_path.targ,basestring):
              new_asgns[search_path.templ]=Symbol(search_path.targ)
           else:
              new_asgns[search_path.templ]=search_path.targ

           for v in search_path.assigns:
              new_asgns[v] = search_path.assigns[v]

                      
        

           #outputs that are still un-unified
           outs = list(self.outputs.last())
           if not(search_path.templ in outs):
               print("Already DNE",self.outputs.results,search_path.templ)
           else:
               outs.remove(search_path.templ)

           self.restricts.join(search_path.restricts)
           self.assigns.join(new_asgns)
           self.solved.join(search_path.solved)
           self.outputs.join(outs)
           self.subs.join(search_path.subs)
           self.depth += 1;

        def pop(self):
           self.depth -= 1;
           print(self.depth);
           print(self.solved.results)
           print(self.subs.results)
           print(self.assigns.results)
           self.restricts.pop()
           self.subs.pop()
           self.assigns.pop()
           self.solved.pop()
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
           all_assigns = dict(self.assigns.flatten_dicts_as_lists() + assigns.items())
           for k in all_assigns:
              if self.is_output(k):
                 conflicts.append((k,all_assigns[k]))
           return conflicts;


        def apply_expr(self,e):
           if isinstance(e,basestring):
              expr = sympify(e,locals=self._ns)
           else:
              expr = e
           sub_expr = expr.xreplace(self._subs)
           return sub_expr


class AssignStats:
    def __init__(self):
        self.n = 0;

        self.succ = 0;
        self.fail = 0;
        self.conf = 0;

    def success(self):
        self.succ += 1;

    def failure(self):
        self.fail += 1;

    def conflict(self):
        self.conf += 1;

    def grade(self):
        # if more successes than failures.
        weight = (self.succ + self.fail)
        return weight

    def __repr__(self):
        return str(self.succ)+"/"+str(self.fail)+"/"+str(self.conf)

class RestrictStats:

    def __init__(self):
        self.n = 0;

        self.succ = 0;
        self.fail = 0;

    def failure(self):
        self.fail += 1;
        self.n += 1;


    def success(self):
        self.succ += 1;
        self.n += 1;

    def grade(self):
        weight = self.succ + self.fail*2
        return weight

    def __repr__(self):
        return str(self.succ) +"/"+str(self.fail)

class AssignExprHeuristic:
    def __init__(self):
        return;

    def grade(self,v,e):
        r = srepr(e)
        #print(r);
        return len(str(e));

class AssignFreqMap:
    def __init__(self):
        self.data = {};
        self.heuristic = AssignExprHeuristic();

    def add(self,v,e):
        if not (v in self.data):
           self.data[v] = {}

        if not (e in self.data[v]):
           self.data[v][e] = AssignStats();


    def has(self,v,e):
        return (v in self.data and e in self.data[v])

    def get(self,v,e):
        if self.has(v,e):
           return self.data[v][e];
        else:
           return None;

    def update(self,v,e,lamb):
        self.add(v,e);
        stat = self.get(v,e)
        lamb(stat)

    def update_list(self,d,lamb):
        for (v,e) in d:
           self.update(v,e,lamb)

    def to_list(self):
       obj = []
       for v in self.data:
           for e in self.data[v]:
                obj.append((v,e))

       return obj


    def __repr__(self):
        srepr = ""
        for v in self.data:
           for e in self.data[v]:
                stats = self.data[v][e]
                srepr += str(v)+"="+str(e)+"   "+str(stats)+"\n"

        return srepr

class RestrictFreqMap:

   def __init__(self):
        self.data = {};
        self.restrict_space = [];
        self.restrictions = {};

   def add_assign(self,v,e):
        if not ((v,e) in self.restrict_space):
           self.restrict_space.append((v,e))
           self.restrictions[(v,e)] = RestrictStats() 

   def indices_of_restrict(self,restrict):
        indices = []
        for (v,e) in restrict:
           self.add_assign(v,e)
           indices.append(self.restrict_space.index((v,e)))

        indices.sort();
        return str(indices)


   def restrict_of_indices(self,indices_str):
        indices = eval(indices_str)
        restricts = map(lambda i : self.restrict_space[i], indices);
        return restricts;

   def has_assign(self,v,e):
      for (vc,ec) in self.restrictions:
         if(vc == v and ec == e):
            return True

      return False;

   def has(self,restrict):
        indices = self.indices_of_restrict(restrict);
        return indices in self.data

   def get_assign(self,v,e):

        for (vc,ec) in self.restrictions:
           if(vc == v and ec == e):
              return self.restrictions[(vc,ec)];

        return None

   def get(self,restrict):
        indices = self.indices_of_restrict(restrict)
        return self.data[indices]

   def add(self,restrict):
        indices = self.indices_of_restrict(restrict);
        
        if not (indices in self.data):
                self.data[indices] = RestrictStats();

   def update(self,restrict,lamb):
        self.add(restrict);
        q = self.get(restrict);
        lamb(q)
        for (v,e) in restrict:
           vstats = self.get_assign(v,e);
           lamb(vstats)

   def __repr__(self):
        srepr = ""
        for indices in self.data:
           restricts = self.restrict_of_indices(indices)
           stats = self.data[indices]
           srepr += str(restricts)+":="+str(stats)+ "\n"

        srepr += "--- Individual ---\n"
        for (v,e) in self.restrictions:
           stats = self.restrictions[(v,e)]
           srepr += str(v)+"="+str(e)+"   "+str(stats)+"\n"
        return srepr;

class SearchHistory:

   def __init__(self):
        self.assigns = AssignFreqMap();
        self.restricts = RestrictFreqMap();

   def weight(self,assign,restrict):
      #rest_succ =restrict.succ
      #rest_fail =restrict.fail
      #asgn_succ = assign.succ
      #asgn_fail = assign.fail
      asgn_score = assign.grade()
      rest_score = restrict.grade()
      return float(asgn_score + rest_score + 1)

      #return float(asgn_succ + asgn_fail+1)

   def n_restricts(self):
        return len(self.restricts.restrict_space)

   def select_restricts(self,n):
        total = 0;
        options = [];
        weights = [];
        for (v,e) in self.assigns.to_list():
           if not self.restricts.has_assign(v,e):
              self.restricts.add_assign(v,e);

           grade = self.assigns.heuristic.grade(v,e)

           assign_stat = self.assigns.get(v,e);
           restrict_stat = self.restricts.get_assign(v,e);
           score = self.weight(assign_stat,restrict_stat)

           total += score;
           options.append((v,e));
           weights.append(score);

        weights_norm = np.array(weights) / total 
        # determine the size of the set of restrictions
        if len(options)/2 < n:
           n = (len(options)+1)/2

        if len(options) == 0:
           return None

        subset_idx = np.random.choice(range(0,len(options)),n,p=weights_norm,replace=False)
        subset = map(lambda i : options[i], subset_idx)
        return subset;

   def __repr__(self):
        reprs = "=== Assigns ===\n";
        reprs += str(self.assigns)
        reprs += "=== Restricts ===\n";
        reprs += str(self.restricts)
        return reprs

class SympySlnGenerator:

    def __init__(self,ctx):
        self.ctx = ctx;
        self.assigns = SympyResults();
        self.solved = SympyResults();
        self.history = SearchHistory();

    def is_var(self,expr):
       return isinstance(expr,basestring)

    # TODO: if eqn on on math side and diffeq on hw side -> eqn to diffeq rewrite
    # TODO: if diffeqn on math side and eq on hw side  -> diffeq to eqn rewrite
    def unify_exprs(self,search_path):
        ctx = self.ctx
        ctx.apply_ctx();
        templ_expr = ctx.templ.get_eqn(search_path.templ)
        
        if(self.is_var(search_path.targ)):
            solved = (search_path.templ,search_path.targ);
            targ_expr = ctx.targ.get_eqn(search_path.targ)

        else:
            solved = None;
            targ_expr = Eqn(search_path.targ);

        templ = []
        targ = []
        templ.append(ctx.apply_expr(templ_expr.eqn))
        targ.append(ctx.apply_expr(targ_expr.eqn))

        print(templ,targ)
        if templ_expr.is_diffeq() and targ_expr.is_diffeq():
            templ.append(ctx.apply_expr(templ_expr.ic))
            targ.append(ctx.apply_expr(targ_expr.ic))
            
        elif (not templ_expr.is_diffeq()) and (not targ_expr.is_diffeq()):
            ()
        elif (not templ_expr.is_diffeq()) and targ_expr.is_diffeq():
            return solved,None;
        elif templ_expr.is_diffeq() and (not targ_expr.is_diffeq()):
            return solved,None;
        else:
            raise (Exception("unexpected.. covered all cases"))

        a_single_asgn = Basic(*targ).match(Basic(*templ))
        return solved,a_single_asgn

    def get_asgn_list(self,latest):
        ctx = self.ctx
        complete_asgns = ctx.assigns.results[:]
        complete_asgns.append(latest)
        indep_asgns = []
        for i in range(0,len(complete_asgns)):
            indep_asgns += complete_asgns[i].items()
        return indep_asgns

    def get_restrict_list(self):
        return self.ctx.restricts.flatten_lists()

    def get_solved_list(self,latest):
        ctx = self.ctx
        complete_solved = ctx.solved.results[:]
        complete_solved.append(latest);
        indep_solved = []
        for i in range(0,len(complete_solved)):
           if complete_solved[i] != None:
              indep_solved.append(complete_solved[i])

        return indep_solved

    def add_sln(self,new_asgns,new_solved):
        indep_asgns = self.get_asgn_list(new_asgns);
        indep_solved = self.get_solved_list(new_solved);
        print("succ",indep_asgns)
        #mark sln as great
        self.history.assigns.update_list(indep_asgns,lambda x: x.success())
        self.assigns.join(dict(indep_asgns));
        print(indep_solved)
        self.solved.join(dict(indep_solved));
        restricts = self.get_restrict_list()
        self.history.restricts.update(restricts,lambda x: x.success())

    def add_failure(self):
        ctx = self.ctx
        indep_asgns = self.get_asgn_list({});
        print("fail",indep_asgns);
        self.history.assigns.update_list(indep_asgns,lambda x: x.failure())
        restricts = self.get_restrict_list()
        self.history.restricts.update(restricts,lambda x: x.failure())

    def get_sln(self,search_path):

        self.ctx.push(search_path);
        solved,new_asgn_maybe = self.unify_exprs(search_path)

        if new_asgn_maybe == None:
            self.ctx.pop()
            self.add_failure()
            return 0;

        new_asgn = {key.name: val for key,val in new_asgn_maybe.items()}
        conflicts = self.ctx.get_conflicts(new_asgn)

        print("-> Solved",solved)
        print("-> Conflicts",conflicts)
        if len(conflicts) > 0:
            var, expr = conflicts[0]
            self.history.assigns.update(var,expr,lambda x: x.conflict())

            if isinstance(expr,Symbol):
                path1 = SympySearchPath().add_assigns(new_asgn)
                path2 = SympySearchPath().add_assigns(new_asgn)

                path1.set_unify(var,expr.name).set_solved(solved)
                path2.set_unify(var,expr).set_solved(solved)

                results1 = self.get_sln(path1)
                results2 = self.get_sln(path2)
                self.ctx.pop();
                return results1 + results2;

            else:
                path1 = SympySearchPath().add_assigns(new_asgn);
                path1.set_unify(var,expr).set_solved(solved)
                results1 = self.get_sln(path1)
                self.ctx.pop();
                return results1;

        else:
            self.add_sln(new_asgn,solved);
            self.ctx.pop()
            return 1;


    def get_constraints(self,n):
        restricts = self.history.select_restricts(n);
        print(self.history)
        print("")
        print("restrict="+str(restricts));
        return restricts

    def get_assignments(self):
        return self.assigns.results

    def get_solved(self):
        return self.solved.results

    def print_assignments(self):
        for asgns in self.assigns.results:
           for v in asgns:
              vr = self.ctx.templ.labels[v]
              expr = self.ctx.targ.label_expr(asgns[v])
              ve = simplify(nsimplify(expr),ratio=0.9).evalf()
              print(str(vr)+"="+str(ve))

           print("=======")
