from scipy import optimize
from optimize_model import OptimizeModel
import sys
import math

class OptimizeProblem:

    def __init__(self,n):
        self.model = OptimizeModel(n);

        self.method = "COBYLA";
        self.tol = 1e-2;
        # The error allowed for the sum of constraints.
        self.ctol = 1e-10;
        self.iters = 1000;
        self.tries = 1000;
        self.n_results = 10;
        print("algo-tol="+str(self.tol))
        print("cstr-tol="+str(self.ctol))
        self.result = None;


    def set_prop(self,key,v):
        if key == "method":
            self.method = v
        elif key == "iters":
            self.iters = v
        elif key == "ctol":
            self.ctol = v
        elif key == "tol":
            self.tol = v
        elif key == "tries":
            self.tries = v
        elif key == "results":
            self.n_results = v

    def var(self, name):
        return;

    def initial(self,idx,ic):
        self.model.initial(idx,ic)

    def test(self,cstrs,x,emit=False):
        print("---> Testing")
        print(x);
        max_error = 0;
        error_tol = self.ctol;

        for cstr in cstrs:
            val = cstr['fun'](x)
            if cstr['type'] == "ineq":
                if val < 0.0:
                    error = abs(val)
                else:
                    error = 0.0;
                this_test = (val >= 0.0 )

            if cstr['type'] == "eq":
                error = abs(val)
                this_test = (val == 0.0 )

            max_error = max(max_error,error)
            if emit == True:
                print("  "+cstr['code']+" => "+str(this_test))
                print("     ->"+str(error))
                print("");

        print("pass:"+str(max_error <= error_tol))
        print("error:"+str(max_error));
        return (max_error <= error_tol, max_error)

    
    
    def eq(self,expr1, expr2):
        self.model.eq(expr1,expr2)
        return;
    
    def neq(self,expr1,expr2):
        self.model.neq(expr1,expr2,label="cstr")
        return

    def lte(self,expr1,expr2):
        self.model.gte(expr2,expr1, label="cstr")
        return;

    def gte(self,expr1,expr2):
        self.model.gte(expr1,expr2, label="cstr")
        return;

    def interval(self,expr,mini,maxi):
        cmini = mini + self.ctol
        cmaxi = maxi - self.ctol
        if cmaxi < cmini:
            cmaxi = cmini = (maxi+mini)/2.0 
        self.model.gte(expr,str(cmini), label="bound")
        self.model.gte(str(cmaxi),expr, label="bound")

    def objective(self,expr):
        self.model.objective(expr);

    def bound(self,mini,maxi):
        self.model.bounds(mini,maxi)

   
    def _solve_cobyla(self,opt,cstrs,init_guess):
        res=optimize.minimize(
            opt,
            init_guess,
            method='COBYLA',
            constraints=cstrs,
            tol=self.tol,
            options={
                'rhobeg':10,
                'maxiter':self.iters,
                'disp': False,
                'catol':self.ctol,
                'tol': self.tol
            }
        )
        return res

    def _solve_slsqp(self,opt,cstrs,init_guess):
        res=optimize.minimize(
            opt,
            init_guess,
            method='SLSQP',
            constraints=self.cstrs,
            tol=self.tol,
            bounds=self.model.bound,
            options={
                'maxiter':self.iters,
                'disp': True,
            }
        )
        return res

    def _solve(self,obj,cstrs,init_guess):
        if self.method == "SLSQP":
            return self._solve_slsqp(obj,cstrs,init_guess);

        if self.method == "COBYLA":
            return self._solve_cobyla(obj,cstrs,init_guess);

    
    def is_success(self):
        print(self.result)
        if self.method == "SLSQP":
            return (self.result.status == 0)
        elif self.method == "COBYLA":
            return self.result.success

    def random_ic(self,pt,obj,cstrs):
        result = self._solve(obj,cstrs,pt);
        is_succ,_ = self.test(cstrs,result.x);
        if is_succ:
            return result.x;
        else:
            return None

    def solve(self):
        self.model.finish()
        self.model.rewrite()
        self.results = []

        if self.model.model_success() == False:
            return;

        best_tol = None;
        # generate relevant problems
        obj,cstrs = self.model.generate()
        ic_obj,ic_cstrs = self.model.generate(label=["bound"], equiv=False)
        get_ic = lambda x : self.random_ic(x,ic_obj,ic_cstrs)
        
        self.cstrs = cstrs;

        first_guess = get_ic(self.model.init_guess())
        if first_guess == None:
            return;

        result = self._solve(obj,cstrs,first_guess)
        is_succ,tol = self.test(cstrs,result.x)

        if is_succ:
            self.results.append(result)

        for tries in range(0,self.tries):
            if len(self.results) > self.n_results:
                continue;

            new_guess = get_ic(self.model.random_point());
            if new_guess == None:
                continue;

            print("Guess="+str(new_guess));

            result = self._solve(obj,cstrs,new_guess)
            is_succ,tol = self.test(cstrs,result.x)
            if is_succ:
                self.results.append(result)

  
    def write_result(self,fh,result):

        if result == None:
            fh.write("unknown\n")
            return

        is_succ,tol = self.test(self.cstrs,result.x,emit=True)
        if is_succ:
            fh.write("success\n")
            i = 0;
            fh.write("%e\n" % tol)
            result_vect = self.model.result(result.x);
            print(result_vect);
            for ident in result.x:
                fh.write("%d=%e\n" % (i,ident))
                i+=1;
        else:
            fh.write("failure\n")
            fh.write("%d\n" % self.result.status)

    def write(self,filename):
        fh = open(filename,'w');
        fh.write("%d\n" % self.model.dim)
        for result in self.results:
            self.write_result(fh,result)

        fh.close()

