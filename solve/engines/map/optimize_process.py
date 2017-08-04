from scipy import optimize
from optimize_model import OptimizeLinearModel
from optimize_model import OptimizeNonlinearModel

try:
        import nlopt
except Exception as (e):
    print("[warn]: nlopt not found")

import sys
import math

import numdifftools as nd

import time
from multiprocessing import Process, Queue
import numpy as np

class MockResult:
    def __init__(self,x):
        self.x =x;

class OptimizeProcess:
    def __init__(self,max_time,tol,ctol,iters):
        self._tol = tol
        self._ctol = ctol
        self._iters = iters;
        self._max_time = max_time;
        self.timeout = False;


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


    def timed_out(self):
        return self.timeout;

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
            self.timeout = True;
            proc.terminate()
            result = None
        else:
            self.timeout = False;
            result = self.queue.get()

        return result

    def _solve_diffevol(self,opt,bound,init_guess):
        minimizer_kwargs = {"method": "COBYLA"}
        print(opt)
        res = optimize.differential_evolution(
            opt,init_guess,
            minimizer_kwargs=minimizer_kwargs,
            niter=200
        )
        self.queue.put(res);

    def _solve_cobyla(self,opt,bound,cstrs,init_guess):
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
        print(prob)
        c = prob.c()
        A_ub = prob.A_ub()
        b_ub = prob.b_ub()
        bound = prob.bounds

        res = optimize.linprog(
            c,
            A_ub=A_ub,
            b_ub=b_ub,
            bounds=(-np.inf,np.inf),
            options={
                'bland':True
            }
        )
        self.queue.put(res)

    def _solve_slsqp(self,opt,bound,cstrs,init_guess):
        res=optimize.minimize(
            opt,
            init_guess,
            method='SLSQP',
            constraints=cstrs,
            tol=self.tol,
            bounds=bound,
            options={
                'maxiter':self.iters,
                'disp': False,
            }
        )
        self.queue.put(res)


        
    def _solve_mlsl_func(self,x_func,g_func,x,grad,verbose=False):
        if grad.size > 0:
            grad[:] = g_func(x)

        xval = x_func(x)
        if verbose:
            print(xval)

        return xval;

    def _create_mlsl_func(self,x_func_orig,verbose=False,flip_sign=False):
        if flip_sign:
            x_func = lambda x : -x_func_orig(x);
        else:
            x_func = x_func_orig

        g_grad= nd.Gradient(x_func)
        g_func = lambda x : g_grad(x);
        return (lambda x,grad : self._solve_mlsl_func(x_func,g_func,x,grad,verbose=verbose))

    def _solve_mlsl(self,minfxn,bound,cstrs,init_guess):
        dim = len(init_guess);
        opt = nlopt.opt(nlopt.GN_MLSL, dim)
        loc_opt = nlopt.opt(nlopt.LN_COBYLA,dim)

        opt.set_local_optimizer(loc_opt)
        lower_bound = map(lambda (mini,maxi) : mini, bound)
        upper_bound = map(lambda (mini,maxi) : maxi, bound)

        opt.set_lower_bounds(np.array(lower_bound));
        opt.set_upper_bounds(np.array(upper_bound));

        ofxn = self._create_mlsl_func(minfxn,flip_sign=False,verbose=False)
        opt.set_min_objective(ofxn)

        for cstr in cstrs:
            if cstr['type'] == "ineq":
                cfxn = self._create_mlsl_func(cstr['fun'],flip_sign=True)
                loc_opt.add_inequality_constraint(cfxn,self.ctol)

        opt.set_xtol_rel(self.tol)
        opt.set_ftol_rel(self.tol)
        opt.set_maxtime(self._max_time-1)

        x = opt.optimize(np.array(init_guess))
        minf = opt.last_optimum_value()
        print "optimum at ", x
        print "minimum value = ", minf
        print "result code = ", opt.last_optimize_result()
        self.queue.put(MockResult(x))

        # NLOPT_STOPVAL_REACHED = 2
        # NLOPT_FTOL_REACHED = 3
        # NLOPT_XTOL_REACHED = 4
        # NLOPT_MAXEVAL_REACHED = 5
        # NLOPT_MAXTIME_REACHED = 6




    def _solve_mma(self,minfxn,bound,cstrs,init_guess):
        dim = len(init_guess);
        opt = nlopt.opt(nlopt.LN_COBYLA,dim)

        lower_bound = map(lambda (mini,maxi) : mini, bound)
        upper_bound = map(lambda (mini,maxi) : maxi, bound)

        opt.set_lower_bounds(np.array(lower_bound));
        opt.set_upper_bounds(np.array(upper_bound));

        ofxn = self._create_mlsl_func(minfxn,flip_sign=False,verbose=False)
        opt.set_min_objective(ofxn)

        for cstr in cstrs:
            if cstr['type'] == "ineq":
                cfxn = self._create_mlsl_func(cstr['fun'],flip_sign=True)
                opt.add_inequality_constraint(cfxn,self.ctol)

        opt.set_maxtime(self._max_time-1)
        #opt.set_xtol_rel(self.tol)
        #opt.set_ftol_rel(self.tol)

        x0 = np.array(init_guess)
        try:
            x = opt.optimize(x0)

        except nlopt.RoundoffLimited:
            minf = opt.last_optimum_value()
            print "optimum at ", x0
            print "minimum value = ", minf
            self.queue.put(MockResult(x0));
            return;

        minf = opt.last_optimum_value()
        print "optimum at ", x
        print "minimum value = ", minf
        print "result code = ", opt.last_optimize_result()
        self.queue.put(MockResult(x))


    def solve_slsqp(self,opt,bound,cstrs,init_guess):
        return self._execute(self._solve_slsqp,self.max_time,(opt,bound,cstrs,init_guess))

    def solve_cobyla(self,opt,bound,cstrs,init_guess):
        return self._execute(self._solve_cobyla,self.max_time,(opt,bound,cstrs,init_guess))

    def solve_mlsl(self,opt,bound,cstrs,init_guess):
        return self._execute(self._solve_mlsl,self.max_time,(opt,bound,cstrs,init_guess))

    def solve_mma(self,opt,bound,cstrs,init_guess):
        return self._execute(self._solve_mma,self.max_time,(opt,bound,cstrs,init_guess))

    def solve_diffevol(self,opt,bound,init_guess):
        return self._execute(self._solve_diffevol,self.max_time,(opt,bound,init_guess))


    def solve_linear(self,prob):
        return self._execute(self._solve_linear,self.max_time,[prob]);
