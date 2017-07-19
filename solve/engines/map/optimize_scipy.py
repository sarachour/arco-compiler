from scipy import optimize
from optimize_model import OptimizeModel
import sys
import math


import time
from multiprocessing import Process, Queue
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

        print(result)
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

class OptimizeProblem:

    def __init__(self,n):
        self.model = OptimizeModel(n);

        tol = 1e-6;
        # The error allowed for the sum of constraints.
        ctol = 1e-8;
        iters = 1000;
        max_time = 10;

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


    
    def _solve_global(self,obj,init_guess):
        return self._solve_diffevol(obj,init_guess);



    def _solve_local(self,obj,cstrs,init_guess):
        if self.method == "SLSQP":
            return self.processor.solve_slsqp(obj,self.model.bound,cstrs,init_guess);

        if self.method == "COBYLA":
            return self.processor.solve_cobyla(obj,cstrs,init_guess);

    

    def random_ic(self,pt,obj,cstrs):
        ctol = self.processor.ctol
        result = self._solve_local(obj,cstrs,pt);
        if result == None:
            return None;

        is_succ,_ = self.model.test(cstrs,result.x,ctol=ctol);
        if is_succ:
            return result.x;
        else:
            return None


    def add_result_if_valid(self,cstrs,result):
        ctol = self.processor.ctol
        if result != None:
            is_succ,tol = self.model.test(cstrs,result.x,ctol=ctol,emit=False)
            if is_succ:
                self.results.append(result)

    def solve_local(self):
        # generate relevant problems
        obj,cstrs = self.model.generate()
        ic_obj,ic_cstrs = self.model.generate(label=["bound"], equiv=False)
        get_ic = lambda x : self.random_ic(x,ic_obj,ic_cstrs)
        
        self.cstrs = cstrs;

        first_guess = get_ic(self.model.init_guess())
        if first_guess == None:
            print("-> No initial guess")
            first_guess = self.model.init_guess()

        result = self._solve_local(obj,cstrs,first_guess)
        self.add_result_if_valid(cstrs,result);

        for tries in range(0,self.tries):
            print("%d/%d tries, %d/%d results" % (tries,self.tries,len(self.results),self.n_results))
            if len(self.results) > self.n_results:
                continue;

            new_guess = get_ic(self.model.random_point());
            if new_guess == None:
                continue;

            print("Guess="+str(new_guess));

            result = self._solve_local(obj,cstrs,new_guess)
            self.add_result_if_valid(cstrs,result);



    def solve_global(self):
        ctol = self.processor.ctol
        obj,cstrs = self.model.generate_nocstr()
        ic_obj,ic_cstrs = self.model.generate_nocstr(label=["bound"], equiv=False)
        get_ic = lambda x : self.random_ic(x,ic_obj,ic_cstrs)

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

