import sys
import math
#from pyomo.environ import *
#from pyomo.opt import SolverFactory
import pyipopt
import inspect
import numdifftools as nd
import numpy as np
from ipoptconst import NLP_LOWER_BOUND_INF
from ipoptconst import NLP_UPPER_BOUND_INF

class OptimizeProblem:

    def __init__(self,tol,iters,n):
        self.cstrs = []
        self.dim = n
        self.tol = tol;
        self.iters = iters;
        self.init = [0.0]*n

        

        self.cstrs = [];
        self.eqs = {};
        self.opt = None;
        self.bounds = None;
        self.result = None;
        self.names = {};


    def initial(self,idx,ic):
        self.init[idx] = ic;


    def _ineq_cstr(self,fn):
        self.cstrs.append((fn,"ineq"));

    def _eq_cstr(self,fn):
        self.cstrs.append((fn,"eq"));

    
    def _neq_cstr(self,fn):
        fnx = "(%s)**2" % (fn);
        print("%s >= 0" % fnx)
        self.cstrs.append((fnx,"neq"));

    
    def eq(self,expr1, expr2):
        if not (expr1 in self.eqs):
            self.eqs[expr1] = []
        if not (expr2 in self.eqs):
            self.eqs[expr2] = []

        self.eqs[expr1].append(expr2)
        self.eqs[expr2].append(expr1)

    def equiv_cstr(self,equiv):
        first = equiv.pop()
        for e in equiv:
            for e2 in equiv:
                if e == e2:
                    continue;
                
                subexpr = "((%s)-(%s))**2" % (e2,e)
                self.lte(subexpr,self.tol)

    def compile_eqs(self):
        exprs = self.eqs.keys()
        covered = []
        for expr in exprs:
           if expr in covered:
              continue

           other = self.eqs[expr]
           equiv = other + [expr]
           self.equiv_cstr(equiv)
           covered += equiv

    def eval_obj(self,x,user_data=None):
        return self.compiled_obj(x)

    def eval_cstr(self,x,user_data=None):
        cstrs = map(lambda i : self.compiled_cstr[i](x),range(0,len(self.cstrs)))
        return np.array(cstrs);

    def eval_jac_cstr(self,x,flag,user_data=None):
        cstrs = map(lambda i : self.compiled_jac_cstr[i](x),range(0,len(self.cstrs)))
        if not flag:
            ncstr = np.reshape(np.array(cstrs),(-1));
            return ncstr
        else:
            return ncstr;

    def eval_hess_cstr(self,x,user_data=None):
        cstrs = map(lambda i : self.compiled_hess_cstr[i](x),range(0,len(self.cstrs)))
        return cstrs;

    def compile_model(self):
        lower_bnd = map(lambda (mini,maxi) : mini, self.bounds)
        upper_bnd = map(lambda (mini,maxi) : maxi, self.bounds)

        self.compiled_obj = eval("lambda x : %s" % self.opt);
        self.compiled_cstr = [];
        self.compiled_jac_cstr = [];
        self.compiled_hess_cstr = [];
        x0 = self.init
        obj_fn = self.eval_obj
        obj_fn_grad = nd.Gradient(obj_fn);

        nonzero_min = 1e-15;
        zero_max = 0 
        zero_min = 0-zero_max
        inf_min = NLP_LOWER_BOUND_INF
        inf_max = NLP_UPPER_BOUND_INF

        ncstr = len(self.cstrs)
        lower_cstr = []
        upper_cstr = []

        i = 0;
        for (cstr,typ) in self.cstrs:
            cstr_lambda = eval("lambda x : %s" % cstr)
            self.compiled_cstr.append(cstr_lambda)
            self.compiled_jac_cstr.append(nd.Jacobian(cstr_lambda));
            self.compiled_hess_cstr.append(nd.Hessian(cstr_lambda));
            if typ == "eq":
                lower = (zero_min)
                upper = (zero_max)
            elif typ == "ineq":
                lower = (zero_min)
                upper = (inf_max)
            elif typ == "neq":
                lower = (nonzero_min)
                upper = (inf_max)

            lower_cstr.append(lower);
            upper_cstr.append(upper);
            print(cstr,lower,upper)
            i+=1;


        cstr_fn = self.eval_cstr
        cstr_jac_fn = self.eval_jac_cstr 
        cstr_hess_fn = self.eval_hess_cstr
        cstr0=cstr_fn(x0);
        size_cstr_jac = ncstr*self.dim 
        size_cstr_hess =  self.dim*self.dim
        
        # compute objective  
        nlp = pyipopt.create(self.dim,
                             np.array(lower_bnd), np.array(upper_bnd),
                             ncstr,
                             np.array(lower_cstr), np.array(upper_cstr),
                             size_cstr_jac, size_cstr_hess,
                             obj_fn, obj_fn_grad,
                             cstr_fn, cstr_jac_fn
        )

        
        return np.array(x0),nlp 

    def neq(self,expr1,expr2):
        nfn = "(%s) - (%s)" % (expr1,expr2)
        self._neq_cstr(nfn)

    def lte(self,expr1,expr2):
        nfn = "(%s) - (%s)" % (expr2,expr1)
        self._ineq_cstr(nfn);

    def gte(self,expr1,expr2):
        nfn = "(%s) - (%s)" % (expr1,expr2)
        self._ineq_cstr(nfn);
   

    def interval(self,expr,mini,maxi):
        self.lte(expr,str(maxi));
        self.gte(expr,str(mini));

    def objective(self,expr):
        self.opt = "%s" % expr;

    def bound(self,mini,maxi):
        self.bounds = [(mini,maxi)]*self.dim

    
    def solve(self):
        self.compile_eqs()
        ics,model = self.compile_model()
        results = model.solve(ics)
        print(results)


  
    def write(self,filename):
        fh = open(filename,'w');
        if self.result == None:
            fh.write("unknown\n")
        elif self.result.status == 0: 
            fh.write("success\n")
            i = 0;
            fh.write("%e\n" % self.result.tolerance)
            for ident in self.result.x:
                fh.write("%d=%e\n" % (i,ident))
                i+=1;
        else:
            fh.write("failure\n")
            fh.write("%d\n" % self.result.status)
