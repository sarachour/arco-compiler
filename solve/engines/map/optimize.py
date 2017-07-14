from scipy import optimize
import inspect
import numpy
import sys
import math

class OptimizeProblem:

    def __init__(self,tol,iters,n):
        self.cstrs = []
        self.dim = n
        self.tol = tol;
        self.iters = iters;
        self.init = [0.0]*n
        self.eqs = {};
        self.opt = None;
        self.bounds = None;
        self.result = None;
        self.names = {};

    def var(self, name):
        return;

    def initial(self,idx,ic):
        self.init[idx] = ic;


    def _ineq_cstr(self,fn):
        fnx = "lambda x: %s" % fn
        print("%s >= 0" % fnx)
        cstr = {
            "fun":eval(fnx),
            "type":"ineq"
        };
        self.cstrs.append(cstr);

    def _eq_cstr(self,fn):
        fnx = "lambda x: %s" % fn
        print("%s == 0" % fnx)
        cstr = {
            "fun":eval(fnx),
            "type":"eq"
        };
        self.cstrs.append(cstr);

    
    def _neq_cstr(self,fn):
        tol = self.tol*0
        fnx = "lambda x: (%s)**2 - %e*%e" % (fn,tol,tol);
        print("%s >= 0" % fnx)
        cstr = {
            "fun":eval(fnx),
            "type":"ineq"
        };
        self.cstrs.append(cstr);

    
    def name(self,idx,name):
        self.names[idx] = name;

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
        self.opt = eval("lambda x: %s" % expr);

    def bound(self,mini,maxi):
        self.bounds = [(mini,maxi)]*self.dim

    def _solve(self,tol):
        init_guess = self.init 
        res=optimize.minimize(
            self.opt,
            init_guess,
            constraints=self.cstrs,
            tol=tol,
            bounds=self.bounds,
            options={
                'maxiter':self.iters,
                'disp': True
            }
        )
        return res

    def solve(self):
        tols = [self.tol]
        steps = int(0-math.log(self.tol))
        for i in range(0,steps-3):
           last_tol = tols[-1]
           next_tol = last_tol*10
           tols.append(next_tol)

        self.compile_eqs()
        for tol in tols:
           print("Tolerance="+str(tol));
           res = self._solve(tol)
           self.result = res
           self.result.tolerance = tol
           if self.result.status == 0:
               return;


  
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
