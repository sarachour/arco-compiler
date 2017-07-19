from scipy import optimize
from optimize_model import OptimizeLinearModel
from optimize_model import OptimizeNonlinearModel
import sys
import math


import time
from multiprocessing import Process, Queue
import numpy as np

class OptimizeProcess:
    def __init__(self,max_time,tol,ctol,iters):
        self._tol = tol
        self._ctol = ctol
        self._iters = iters;
        self._max_time = max_time;

    @property
    def max_time(self):
        return self._max_time

    @property
    def ctol(self):
        return self._ctol

    @property
    def tol(self):
        return self._tol

    @property
    def iters(self):
        return self._iters

    @max_time.setter
    def max_time(self,value):
        self._max_time = value

    @iters.setter
    def iters(self,value):
        self._iters = value

    @tol.setter
    def tol(self,value):
        self._tol = value

    @ctol.setter
    def ctol(self,value):
        self._ctol = value

    def _execute(self,func,max_time,args):
        proc = Process(target=func,args=args);
        t0 = time.time();
        self.queue = Queue()
        proc.start()
        while time.time() - t0 < max_time:
            proc.join(timeout=1)
            if not proc.is_alive():
                break;

        if proc.is_alive():
            print("-> Terminate")
            proc.terminate()
            result = None
        else:
            result = self.queue.get()

        return result

    def _solve_diffevol(self,opt,bound,init_guess):
        res = optimize.differential_evolution(
            opt,
            bounds=bound,
            maxiter=1000
        )
        self.queue.put(res);

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
        self.queue.put(res);

    def _solve_linear(self,prob):
        res = optimize.linprog(
            prob.c,
            A_ub=prob.A_ub,
            b_ub=prob.b_ub,
            bounds=prob.bounds
        )
        self.queue.put(res)

    def _solve_slsqp(self,opt,bound,cstrs,init_guess):
        res=optimize.minimize(
            opt,
            init_guess,
            method='SLSQP',
            constraints=self.cstrs,
            tol=self.tol,
            bounds=self.model.bound,
            options={
                'maxiter':self.iters,
                'disp': False,
            }
        )
        self.queue.put(res)

    def solve_slsqp(self,opt,bound,cstrs,init_guess):
        return self._execute(self._solve_slsqp,self.max_time,(opt,bound,cstrs,init_guess))

    def solve_cobyla(self,opt,cstrs,init_guess):
        return self._execute(self._solve_cobyla,self.max_time,(opt,cstrs,init_guess))


    def solve_diffevol(self,opt,init_guess):
        return self._execute(self._solve_diffevol,self.max_time,(opt,init_guess))


    def solve_linear(self,prob):
        return self._execute(self._solve_linear,self.max_time,[prob]);
       
class OptimizeProblem:

    def __init__(self,n):
        self.model = OptimizeNonlinearModel(n);
        self.interval_model = OptimizeLinearModel(n);

        tol = 1e-6;
        # The error allowed for the sum of constraints.
        ctol = 1e-8;
        iters = 1000;
        max_time = 5;

        self.processor = OptimizeProcess(max_time,tol,ctol,iters);
        self.method = "COBYLA";
        self.tries = 100;
        self.n_results = 10;
        self.result = None;


    def set_prop(self,key,v):
        if key == "method":
            self.method = v
        elif key == "iters":
            self.processor.iters = v
        elif key == "ctol":
            self.processor.ctol = v
        elif key == "tol":
            self.processor.tol = v
        elif key == "tries":
            self.tries = v
        elif key == "results":
            self.n_results = v

    def var(self, name):
        return;

    def initial(self,idx,ic):
        self.model.initial(idx,ic)
    
    
    def eq(self,expr1, expr2):
        self.model.eq(expr1,expr2)
        return;
    
    def neq(self,expr1,expr2):
        self.model.neq(expr1,expr2)
        return

    def lte(self,expr1,expr2):
        self.model.gte(expr2,expr1)
        return;

    def gte(self,expr1,expr2):
        self.model.gte(expr1,expr2)
        return;

    def interval(self,expr,mini,maxi):
        self.model.gte(expr,str(mini))
        self.model.gte(str(maxi),expr)
        self.interval_model.cstr(expr,mini,maxi);

    def objective(self,expr):
        self.model.objective(expr);
        self.interval_model.objective("0");

    def bound(self,mini,maxi):
        self.model.bounds(mini,maxi)
        self.interval_model.bounds = (mini,maxi)

    
    def _solve_global(self,obj,init_guess):
        return self.processor.solve_diffevol(obj,init_guess);



    def _solve_local(self,obj,cstrs,init_guess):
        if self.method == "SLSQP":
            return self.processor.solve_slsqp(obj,self.model.bound,cstrs,init_guess);

        if self.method == "COBYLA":
            return self.processor.solve_cobyla(obj,cstrs,init_guess);


    def random_weight(self):
        dim = self.interval_model.dim
        pt = map(lambda i : np.random.random()-0.5, range(0,dim))
        return pt

    def random_ic(self,prob):
        weight = self.random_weight()
        prob.c = weight;
        result = self.processor.solve_linear(prob);
        print(result)
        if not (result == None):
            is_succ = self.interval_model.test(result.x);
            if is_succ:
                return result.x;

        
        return None


    def add_result_if_valid(self,cstrs,result):
        ctol = self.processor.ctol
        if result != None:
            is_succ,tol = self.model.test(cstrs,result.x,ctol=ctol,emit=False)
            if is_succ:
                self.results.append(result)

    def solve_local(self):
        # generate relevant problems
        ival_prob = self.interval_model.generate();
        obj,cstrs = self.model.generate()
        
        self.cstrs = cstrs;

        first_guess = self.random_ic(ival_prob);
        if first_guess == None:
            print("-> No initial guess")
            first_guess = self.model.init_guess()

        result = self._solve_local(obj,cstrs,first_guess)
        self.add_result_if_valid(cstrs,result);

        for tries in range(0,self.tries):
            print("%d/%d tries, %d/%d results" % (tries,self.tries,len(self.results),self.n_results))
            if len(self.results) > self.n_results:
                continue;

            new_guess = self.random_ic(ival_prob);
            if new_guess == None:
                continue;

            print("Guess="+str(new_guess));

            result = self._solve_local(obj,cstrs,new_guess)
            self.add_result_if_valid(cstrs,result);



    def solve_global(self):
        ctol = self.processor.ctol
        obj,cstrs = self.model.generate_nocstr()
        get_ic = lambda x : self.random_ic(x)

        self.cstrs = cstrs;

        first_guess = get_ic(self.model.init_guess())
        if first_guess == None:
            first_guess = self.model.init_guess()

        print("==== GLOBAL OPTIMIZE ===")
        result = self._solve_global(obj,first_guess)
        print(result)
        is_succ,tol = self.model.test(cstrs,result.x,ctol=ctol)

    def solve(self):
        self.model.finish()
        self.model.rewrite()
        self.results = []

        if self.model.model_success() == False:
            return;

        self.solve_local()

    def write_result(self,fh,result):
        ctol = self.processor.ctol

        if result == None:
            fh.write("unknown\n")
            return

        is_succ,tol = self.model.test(self.cstrs,result.x,ctol=ctol,emit=True)
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
        print("=== Writing %d Results ===" % len(self.results));
        fh = open(filename,'w');
        fh.write("%d\n" % self.model.dim)

        for result in self.results:
            self.write_result(fh,result)

        print("=== Written %d Results ===" % len(self.results));
        fh.close()
        print("=== Closed ===");

