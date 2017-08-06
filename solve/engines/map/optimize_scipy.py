from scipy import optimize
from optimize_model import OptimizeLinearModel
from optimize_model import OptimizeNonlinearModel
from optimize_process import OptimizeProcess,MockResult
from optimize_sample import OptimizeLinearSampler
from optimize_classifier import OptimizeClassifier
import sys
import math
import random

import time
from multiprocessing import Process, Queue
import numpy as np

class OptimizeCounter:
    def __init__(self):
        self._eq = 0;
        self._neq = 0;
        self._gt = 0;
        self._gte = 0;
        self._lt = 0;
        self._lte = 0;
        self._n = 0;

    def eq(self):
        self._eq += 1;
        self._n += 1;

    def neq(self):
        self._neq += 1;
        self._n += 1;

    def gte(self):
        self._gte += 1;
        self._n += 1;

    def gt(self):
        self._gt += 1;
        self._n += 1;

    def lte(self):
        self._lte += 1;
        self._n += 1;

    def lt(self):
        self._lt += 1;
        self._n += 1;


    def n(self):
        return self._n

    def summarize(self):
        print("unimpl")

class OptimizeStats:
    def __init__(self):
        self.nl = OptimizeCounter()
        self.lin = OptimizeCounter()

    def summary(self):
        if self.nl.n() == 0:
            print(" => Linear Problem")
            print(" => # Convex Hulls %f\n" % (2**self.lin._neq))
            print(" => # Cstrs: %d\n" % self.lin.n())
        else:
            print(" => Nonlinear Problem")
            print(" => # Linear Cstrs: %d\n" % self.lin.n())
            print(" => # Nonlinear Cstrs: %d\n" % self.nl.n())
            print("=== Linear Summary ===")
            self.lin.summarize()
            print("=== Nonlinear Summary ===")
            self.nl.summarize()

class OptimizeProblem:

    def __init__(self,n):
        self.model = OptimizeNonlinearModel(n);
        self.linear_model = OptimizeLinearModel(n);
        self.stats = OptimizeStats()

        tol = 1e-6;
        # The error allowed for the sum of constraints.
        ctol = 1e-8;
        iters = 2000;
        self.max_time = 15;

        self.processor = OptimizeProcess(self.max_time,tol,ctol,iters);
        self.linear_sampler = OptimizeLinearSampler(self.linear_model,self.processor)

        self.model.objective("0");
        self.linear_model.objective({"offset":0});
        # oth#er parameters
        self.method = "COBYLA"
        self.tries = 100;
        self.n_results = 3;
        self._reflow = {};
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

    def reflow(self,origidx,refidx):
        self._reflow[origidx] =refidx 

    def initial(self,idx,ic):
        self.model.initial(idx,ic)
    
    
    def eq(self,expr1, expr2):
        print(expr1 + "=" + expr2)
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

    def lt(self,expr1,expr2):
        self.model.gt(expr2,expr1)
        return;

    def gt(self,expr1,expr2):
        self.model.gt(expr1,expr2)
        return;

    def lower_bound(self,idx,mini):
        expr = "x[%d]" % idx
        self.linear_model.cstr(expr,mini,1e60);
        self.model.lower_bound(idx,mini)
        self.linear_model.lower_bound(idx,mini)

    def upper_bound(self,idx,maxii):
        expr = "x[%d]" % idx
        self.linear_model.cstr(expr,maxi,1e60);
        self.model.lower_bound(idx,maxi)
        self.linear_model.lower_bound(idx,maxi)

    
    def interval(self,expr,mini,maxi):
        self.model.gte(expr,str(mini))
        self.model.gte(str(maxi),expr)


    def __lin_dict_to_expr(self,lin):
        terms = []
        for k in lin:
            if k == "offset":
                terms.append("%f" % lin[k])
                continue;

            idx = int(k)
            v = lin[k]
            if v == 0.0:
                continue
            if v == 1.0:
                terms.append("x[%d]" % idx)
            else:
                terms.append("x[%d]*%f" %(idx,v))

        return "+".join(terms)

    def lin_eq(self,lin1,lin2):
        self.eq(self.__lin_dict_to_expr(lin1),self.__lin_dict_to_expr(lin2))
        self.linear_model.eq(lin1,lin2);

    def lin_gte(self,lin1,lin2):
        self.gte(self.__lin_dict_to_expr(lin1),self.__lin_dict_to_expr(lin2))
        self.linear_model.gte(lin1,lin2);

    def lin_lte(self,lin1,lin2):
        self.lte(self.__lin_dict_to_expr(lin1),self.__lin_dict_to_expr(lin2))
        self.linear_model.gte(lin2,lin1);

    def lin_gt(self,lin1,lin2):
        self.gt(self.__lin_dict_to_expr(lin1),self.__lin_dict_to_expr(lin2))
        self.linear_model.gt(lin1,lin2);

    def lin_lt(self,lin1,lin2):
        self.lt(self.__lin_dict_to_expr(lin1),self.__lin_dict_to_expr(lin2))
        self.linear_model.gt(lin2,lin1);

    def lin_neq(self,lin1,lin2):
        self.neq(self.__lin_dict_to_expr(lin1),self.__lin_dict_to_expr(lin2))

    def lin_interval(self,sc,off,v,mini,maxi):
        expr = "x[%d]*%f + x[%d]" % (sc,v,off)
        self.interval(expr,mini,maxi)
        self.linear_model.interval(sc,off,v,mini,maxi);

    def lin_objective(self,lin):
        self.objective(self.__lin_dict_to_expr(lin));
        self.linear_model.objective(lin)

    def objective(self,expr):
        self.model.objective(expr);

    
    def bound(self,mini,maxi):
        self.model.bounds(mini,maxi)
        self.linear_model.set_bounds(mini,maxi)

    
    def _solve_global(self,obj,init_guess):
        return self.processor.solve_diffevol(obj,self.model.bound,init_guess);



    def _solve_local(self,obj,cstrs,init_guess):
        if self.method == "SLSQP":
            return self.processor.solve_slsqp(obj,self.model.bound,cstrs,init_guess);

        if self.method == "COBYLA":
            return self.processor.solve_cobyla(obj,self.model.bound,cstrs,init_guess);

        if self.method == "MLSL":
            return self.processor.solve_mlsl(obj,self.model.bound,cstrs,init_guess);

        if self.method == "MMA":
            return self.processor.solve_mma(obj,self.model.bound,cstrs,init_guess);

    def add_result_if_valid(self,cstrs,result,emit=False):
        ctol = self.processor.ctol*1
        if result != None:
            is_succ,tol = self.model.test(cstrs,result.x,ctol=ctol,emit=emit)
            self.minima.append((tol,result))
            if is_succ:
                self.results.append(result)
            return is_succ

        return False

    def get_best_result(self):
        if len(self.minima) > 0:
            tb,vb = min(self.minima,key=lambda (t,v): t)
            return vb.x
        else:
            return self.model.init_guess()

    def get_random_result(self):
        if len(self.minima) > 0:
            tb,vb = min(self.minima,key=lambda (t,v): random.random())
            return vb.x
        else:
            return self.model.init_guess()

    def safe_vect(self,v):
        v2 = v[:]
        for i in range(0,len(v)):
            v2[i] += (np.random.random() - 0.5)*1e-20

        return v

    def perturb_vector(self,vect,percent=5,idx = None):
        pert_vect = np.array(vect,copy=True)
        if idx != None:
            pct = np.random.normal(0,percent*2) - percent
            pct2 = np.random.normal(0,percent*2) - percent
            pert_vect[idx] += pct*0.01*vect[idx];

        for idx in range(0,len(vect)):
            pct = np.random.normal(0,percent*2) - percent
            pct2 = np.random.normal(0,percent*2) - percent
            pert_vect[idx] += pct*0.01*vect[idx]; 

        return pert_vect

    def solve_nonlinear(self):
        ctol = self.processor.ctol*1
        orig_obj,orig_cstrs = self.model.generate(self.processor.ctol)
        get_tol = lambda (k,v) : k;

        self.cstrs = orig_cstrs;
        if self.model.model_success() == False:
            print("[[MODEL FAILED]]");
            return;

        #return;
        self.linear_sampler.generate(ctol)
        if self.linear_sampler.feasible() == False:
            print("[[UNSAT]]");
            return;

        #classifier = OptimizeClassifier(self.model)
        #der_obj,_= classifier.derive_objective(orig_cstrs)

        # scratch derived objective
        obj = orig_obj

        print("=== First Solution for Constrained Problem ===")
        first_guess = self.safe_vect(self.model.init_guess())
        result = self._solve_local(obj,self.cstrs,first_guess);
        is_succ= self.add_result_if_valid(self.cstrs,result)

        print(result)
        if self.processor.timed_out():
            print("-> decrease number iters.")
            self.processor.iters -= self.processor.iters*0.5
            #self.max_time = self.max_time*2;

        if is_succ:
            print("-> added result -> meets ctol.")


        print("=== Solving Fully Constrained Problem ===")
        for j in range(0,self.model.dim):
            for do_min in [False,True]:
                print("=== Dim %d (do_min=%s) ===" % (j,str(do_min)))
                #if do_min:
                #    obj = lambda x : abs(x[j] - first_guess[j])
                #else:
                #    obj = lambda x : 0-x[j]

                for i in range(0,self.tries):
                    if len(self.results) >= self.n_results:
                        return;

                    print("=== Iter %d ===" % i)

                    if do_min:
                        next_guess = self.perturb_vector(self.get_best_result(), percent=0.1);
                    else:
                        next_guess = self.perturb_vector(first_guess, percent=1);

                
                    result = self._solve_local(obj,self.cstrs,next_guess);
                
                    print(result)
                    if self.processor.timed_out():
                        print("-> decrease number iters.")
                        self.processor.iters -= self.processor.iters*0.5
                        #self.max_time = self.max_time*2;
                        continue;

                    is_succ = self.add_result_if_valid(self.cstrs,result)
                    if is_succ:
                        print("-> added result -> meets ctol.")
                        self.model.test(self.cstrs,result.x,ctol=ctol,emit=False)


        
        best_to_worst = sorted(self.minima,key=lambda (k,v):k)
        print("=== Score Order ===")
        for score,result in best_to_worst:
            print(score)

        #return;

        print("=== Emitting Results (# results : %d) ===" % (len(self.results)))
        for score,result in best_to_worst:
            print(score);
            if len(self.results) >= self.n_results:
                return;

            if not (result in self.results):
                _,tol = self.model.test(self.cstrs,result.x,ctol=ctol,emit=False)
                print(score,tol)
                self.results.append(result)
        # TODO: Find minima if no solution is found.

    def solve_linear(self):
        ctol = self.processor.ctol*10
        obj,cstr = self.model.generate(ctol)
        self.cstrs = cstr

        if self.model.model_success() == False:
            return;

        result = self.linear_sampler.generate(ctol)
        is_succ = self.add_result_if_valid(self.cstrs,result)
        if is_succ:
            print("-> initial\n")
            self.model.test(self.cstrs,result.x,ctol=ctol,emit=False)

        if self.linear_sampler.feasible() == False:
            print("unsat");
            return;

        #return;
        for i in range(0,self.tries):
            print("-> attempt %d\n" % i)
            if len(self.results) >= self.n_results:
                return;

            result = self.linear_sampler.sample(ctol)
            is_succ = self.add_result_if_valid(self.cstrs,result)
            if is_succ:
                self.model.test(self.cstrs,result.x,ctol=ctol,emit=False)


    def solve(self):
        self.model.finish()
        self.model.rewrite()
        self.results = [];
        self.minima = [];
        if self.method == "LINOPT":
            self.solve_linear();
            
        else:
            self.solve_nonlinear();

    def write_result(self,fh,result):
        ctol = self.processor.ctol

        if result == None:
            return
        _,tol = self.model.test(self.cstrs,result.x,ctol=ctol,emit=False)
        fh.write("success\n")
        fh.write("%e\n" % tol)
        result_vect = self.model.result(result.x);
        print(result_vect);
        for idx in range(0,len(result.x)):
            ref_idx = self._reflow[idx]
            value = result.x[idx]
            fh.write("%d=%.16e\n" % (ref_idx,value))

    def write(self,filename):
        print("=== Writing %d Results ===" % len(self.results));
        fh = open(filename,'w');
        fh.write("%d\n" % self.model.dim)

        for result in self.results:
            self.write_result(fh,result)

        print("=== Written %d Results ===" % len(self.results));
        fh.close()
        print("=== Closed ===");

