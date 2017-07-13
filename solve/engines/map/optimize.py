from scipy import optimize
import inspect
import sys

class OptimizeProblem:

    def __init__(self,n):
        self.cstrs = []
        self.dim = n
        self.tol = 1e-15;
        self.init = None;
        self.opt = None;
        self.bounds = None;
        self.maxIter = 100;
        self.result = None;
        self.names = {};

    def var(self, name):
        return;

    def initial(self,ic):
        self.init = ic;

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

    def eq_num(self,expr, n):
        nfn = "(%s) - (%f)" % (expr,n)
        self._eq_cstr(nfn)
        
    def neq(self,expr1,expr2):
        nfn = "(%s) - (%s)" % (expr1,expr2)
        self._neq_cstr(nfn)

    def neq_num(self,expr,n):
        nfn = "(%s) - (%f)" % (expr,n)
        self._neq_cstr(nfn)
   
    
    def interval(self,expr,mini,maxi):
        cstr_min = "(%s) - %f" % (expr,mini);
        cstr_max= "%f - (%s)" % (maxi,expr);
        self._ineq_cstr(cstr_min)
        self._ineq_cstr(cstr_max)

    def objective(self,expr):
        self.opt = eval("lambda x: %s" % expr);

    def bound(self,mini,maxi):
        self.bounds = [(mini,maxi)]*self.dim

    def solve(self):

        res=optimize.minimize(
            self.opt,
            self.init,
            constraints=self.cstrs,
            tol=self.tol,
            bounds=self.bounds,
            options={'maxiter':self.maxIter , 'disp': True}
        )
        self.result = res

    def write(self,filename):
        fh = open(filename,'w');
        if self.result = None:
            fh.write("unknown")
        else if self.result.status = 0:
            fh.write("success")
            

model= OptimizeProblem(5);

model.initial([0,1,1,0,0])

model.bound(-10000,10000)
model.eq_num(" x[0]",0)
model.eq(" x[0]", "x[3] - x[0]*(x[4]+x[2]*0.2525)")
model.eq_num(" x[3] - x[0]*(x[4]+x[2]*0.2525)", 0)
model.eq(" x[1]", "x[1]*(x[2]+x[4]*3.960396)")

model.neq_num(" x[1]", 0)
model.neq_num(" x[2]*0.2525+x[4]", 0)
model.neq_num(" x[1]*(x[2]+x[4]*3.96096)", 0)

model.interval("x[1]*0 + x[0]", 0, 12000)
model.interval("x[1]*0 + x[3]", 0, 12000)
model.interval("x[1]*1.32468e-6 + x[3]", 0, 12000)
model.interval("x[1]*0 + x[0]", 0, 3300)
model.interval("x[1]*0 + x[0]", 0, 12000)
model.interval("x[1]*0.0014 + x[0]", 0, 12000)
model.interval("x[2]*0.2525 + x[4]", 0, 10)


model.objective("-x[1]-x[2]")

model.solve();



