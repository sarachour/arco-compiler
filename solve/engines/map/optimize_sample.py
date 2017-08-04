from optimize_model import OptimizeLinearModel
from optimize_process import OptimizeProcess
from scipy.spatial import ConvexHull
import random
import itertools 
import numpy as np

class MockResult:
    def __init__(self,x):
        self.x =x;

class OptimizeLinearSampler:
    def __init__(self,model,proc):
        self.dim = model.dim;
        self.model = model
        self.hull = None;
        self.proc = proc
        self.points = [];
        self.is_sat = True



    def feasible(self):
        return self.is_sat

    def generate(self,ctol):
        prob = self.model.generate(ctol)
        prob.set_c([0]*self.dim);
        self.prob = prob;

        result = self.proc.solve_linear(prob);
        if result == None or result.status == 2:
            self.is_sat = False;
            return;

        self.initial = result;
        return result;
        # move in the positive direction

    def random_weight(self):
        vect = map(lambda x : np.random.normal(0,10), range(0,self.dim))
        return vect


    def try_lin_sample(self,ctol):
        obj = self.random_weight();
        self.prob.set_c(obj);
        result = self.proc.solve_linear(self.prob);

        if result != None and result.status == 1:
            return result;
        else:
            return None;

    # random value
    def try_nl_sample(self,ctol,objective):
        prob = self.model.generate(ctol)
        obj,cstr = self.prob.to_nonlinear()
        if objective != None:
            obj = objective

        result = self.proc.solve_cobyla(obj,self.model.bounds,cstr,self.random_weight());
        if result != None and result.status == 1:
            return result;
        else:
            return None;

    def sample(self,ctol,objective=None):
        if self.is_sat == False:
            return None;

        for i in range(0,3):
            x = self.try_nl_sample(ctol,objective)

            if self.proc.timed_out():
                return MockResult(self.random_weight())

            if x != None:
                return x;

        return MockResult(self.random_weight());

