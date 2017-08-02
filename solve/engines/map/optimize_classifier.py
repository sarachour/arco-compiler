import numpy as np
import numdifftools as nd

def ltz(v):
    if v < 0:
        return -v;
    else:
        return -v;

class OptimizeClassifier():

    def __init__(self,model):
        self.model = model;

    
    def derive_objective(self,cstrs):
        print("==== Find Unsatisfiable Constraints ====")
        x = self.model.init_guess()
        unsat,sat = self.model.unsat(cstrs,x)
        print("==== Sat Set ====")
        for s in sat:
            print(s["code"])

        print("==== Unsat Set ====")
        terms = []
        for u in unsat:
            term = u['code']
            print(term)
            terms.append("ltz(%s)" % term)

        sot = ",".join(terms);
        if len(sot) > 0:
            new_obj=eval("lambda x:max([%s])\n" % sot)
        else:
            new_obj=eval("lambda x:%d\n" % 0)

        print("================")
        return new_obj,sat
