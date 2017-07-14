from scipy import optimize
import inspect
import numpy
import sys

class OptimizeProblem:

    def __init__(self,tol,iters,n):
        self.cstrs = []
        self.dim = n
        self.tol = tol;
        self.iters = iters;
        self.init = [0.0]*n

        self.opt = None;
        self.bounds = None;
        self.maxIter = 100;
        self.result = None;
        self.names = {};

    def var(self, name):
        return;

    def initial(self,idx,ic):
        self.init[idx] = ic;

    def eq(self,expr1,expr2):
        fn = lambda x : expr1(x) - expr2(x)
        cstr = {
            "fun":fn,
            "type":"eq"
        };
        self.cstrs.append(cstr);

    def _ineq_cstr(self,fn):
        fnx = "lambda x: %s" % fn
        print("%s >= 0" % fnx)
        cstr = {
            "fun":eval(fnx),
            "type":"ineq"
        };
        self.cstrs.append(cstr);

    def _eq_cstr(self,fn):
        fn_min = "%e - (%s)" % (self.tol,fn) 
        fn_max = "(%s) + %e" % (fn,self.tol) 
        self._ineq_cstr(fn_min);
        self._ineq_cstr(fn_max);
        #fnx = "lambda x: %s" % fn
        #print("%s = 0" % fnx)
        #cstr = {
        #    "fun":eval(fnx),
        #    "type":"eq"
        #};
        #self.cstrs.append(cstr);

    def _neq_cstr(self,fn):
        fnx = "lambda x: (%s)**2 - %e*%e" % (fn,self.tol,self.tol);
        print("%s >= 0" % fnx)
        cstr = {
            "fun":eval(fnx),
            "type":"ineq"
        };
        self.cstrs.append(cstr);

    
    def name(self,idx,name):
        self.names[idx] = name;

    def eq(self,expr1, expr2):
        nfn = "%s - (%s)" % (expr1,expr2)
        self._eq_cstr(nfn)

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

    def solve(self):

        print(self.init)
        res=optimize.minimize(
            self.opt,
            self.init,
            constraints=self.cstrs,
            tol=self.tol,
            bounds=self.bounds,
            options={
                'maxiter':self.maxIter ,
                'disp': True
            }
        )
        print(res)
        self.result = res

    def wrap(self,xi):
        if abs(xi) <= self.tol:
            return 0
        else:
            return xi

    def is_sat(self,x):
        for cstr in self.cstrs:
           value = cstr["fun"](x)
           if cstr["type"] == "eq":
              result = (abs(value) <= self.tol)
           else:
              result = (value >= 0)

           if not result:
              print(str(value)+"-> fail "+cstr["type"])
              return False;
           else:
              print(str(value)+"-> pass "+cstr["type"])

        return True;

    def round_vect(self,x,n):
        res = []
        trunc = "%."+str(n)+"g"
        for v in x:
            vr = float(trunc % v)
            res.append(vr)

        return res;

    def find_sigfigs(self,x):
        for sigfigs in range(1,128):
            xrnd = self.round_vect(x,sigfigs)
            print("-> ",sigfigs)
            print(xrnd,self.is_sat(xrnd))

    def write(self,filename):
        fh = open(filename,'w');
        if self.result == None:
            fh.write("unknown\n")
        elif self.result.status == 0: 
            fh.write("success\n")
            i = 0;
            #self.find_sigfigs(self.result.x);
            for ident in self.result.x:
                fh.write("%d=%e\n" % (i,ident))
                i+=1;
        else:
            fh.write("failure\n")
            fh.write("%d\n" % self.result.status)
