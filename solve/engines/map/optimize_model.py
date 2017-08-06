import inspect
import numpy
import sys
import math
from sympy import Symbol
import sympy as sp
import numpy as np

def to_finite(v):
    return v

class ScipySimplexOptimizeProblem():
    def __init__(self,d):
        self._c = [0]*d;
        self._A_ub = [] 
        self._b_ub = []
        self._l_ub = []
        self._A_eq = [] 
        self._b_eq = []
        self._l_eq = []

        # eliminate empty columns
        self._c_nz = None
        self._A_ub_nz = None
        self._A_eq_nz = None
        self.dim = d;
        self.bounds =[(-np.inf,np.inf)]*d

    def __to_nonlinear_code(self,x,ub):
        terms = [];
        for i in range(0,len(x)):
            if x[i] != 0:
                terms.append("(%f*x[%d])" % (x[i],i))

        if len(terms) > 0:
            sop = "+".join(terms)
            code = "lambda x : %e-(%s)" % (ub,sop)
        else:
            code = "lambda x : %e" % ub

        return code

    def to_nonlinear(self):
        Aub = self.A_ub()
        bub = self.b_ub()
        c = self.c()

        obj = lambda x : np.dot(np.copy(c),x)
        cstrs = []
        for row,ub,lbl in zip(self.A_ub(),self.b_ub(),self.l_ub()):
            code = self.__to_nonlinear_code(row,ub);
            # an upper bound
            cstr = {
                "type":"ineq",
                "fun":eval(code),
                "code":code
            }
            cstrs.append(cstr)

        for row,eq, lbl in zip(self.A_eq(),self.b_eq(),self.l_eq()):
            code = self.__to_nonlinear_code(row,eq);
            cstr = {
                "type":"eq",
                "fun":eval(code),
                "code":code
            }
            cstrs.append(cstr)

        return obj, cstrs

    def bounds(self):
        return self._bounds

    def set_bounds(self,value):
        self._bounds = value

    def A_ub(self):
        if self._A_ub_nz != None:
            return self._A_ub_nz
        else:
            return self._A_ub

    def b_ub(self):
        return self._b_ub

    def l_ub(self):
        return self._l_ub

    def A_eq(self):
        if self._A_eq_nz != None:
           return self._A_eq_nz
        else:
           return self._A_eq

    def b_eq(self):
        return self._b_eq

    def l_eq(self):
        return self._l_eq

    def c(self):
        if self._c_nz != None:
            return self._c_nz;
        else:
            return self._c

    def set_c(self,v):
        self._c = v

    def __nonzero(self,x):
        if x > 0:
            return 1
        else:
            return 0

    def constrained(self):
        total = [0]*self.dim
        for cstr in self.A_ub():
            total = np.add(total,abs(cstr))

        for cstr in self.A_eq():
            total = np.add(total,abs(cstr))

        total = np.add(total,np.abs(self.c()))

        return map(lambda x: self.__nonzero(x),total);

    def compress(self,row,nz):
        compressed = [0]*sum(nz)
        idx = 0
        for i in range(0,len(row)):
            if nz[i] > 0:
                compressed[idx] = row[i]
                idx += 1

        return compressed;

    def eliminate(self):
        nonzero = self.constrained()
        self._A_ub_nz = map(lambda row: self.compress(row,nonzero),self._A_ub)
        self._A_eq_nz = map(lambda row: self.compress(row,nonzero),self._A_eq)
        self._c_nz = self.compress(self._c,nonzero)

    def ub(self,vect,maxi,label=None):
        self._b_ub.append(maxi)
        self._A_ub.append(vect)
        self._l_ub.append(label)
        return

    def rm_ub(self):
        self._b_ub.pop()
        self._A_ub.pop()
        self._l_ub.pop()

    def eq(self,vect,maxi,label=None):
        self._b_eq.append(maxi)
        self._A_eq.append(vect)
        self._l_eq.append(label)

    def rm_eq(self):
        self._b_eq.pop()
        self._A_eq.pop()
        self._l_eq.pop()

class OptimizeLinearModel:
    def __init__(self,n):
        self.init = [0]*n
        self.cstrs = [];
        self.dim = n;
        self.obj = None;
        self._bounds = [(None,None)]*n

    def __dict_to_vect(self,els):
        vals = [0.0]*self.dim
        offset = 0.0;
        for k in els:
            if k == "offset":
                offset = els[k]
                continue;

            idx = int(k);
            vals[idx] = els[k]

        return offset,vals;

    def __vect_to_string(self,vect):
        terms = []
        for idx in range(0,len(vect)):
            coeff = vect[idx]
            if coeff == 0:
                continue;
            elif coeff == 1:
                terms.append("x[%d]" % idx)
            else:
                terms.append("%f*x[%d]" % (coeff,idx))

        return "+".join(terms)

    def gte(self,ld1,ld2):
        ln1,lv1 = self.__dict_to_vect(ld1);
        ln2,lv2 = self.__dict_to_vect(ld2);
        vect = np.subtract(lv1,lv2);
        minimum = ln2 - ln1
        cstr = {
            "vect": vect,
            "lower_bound":minimum,
            "upper_bound":None,
            "code":"%s >= %f" % (self.__vect_to_string(vect),minimum)
        }
        print(cstr["code"]);
        self.cstrs.append(cstr)


    def gt(self,ld1,ld2):
        ln1,lv1 = self.__dict_to_vect(ld1);
        ln2,lv2 = self.__dict_to_vect(ld2);
        vect = np.subtract(lv1,lv2);
        minimum = (ln2 - ln1)
        cstr = {
            "vect": vect,
            "lower_bound":minimum,
            "upper_bound":None,
            "strict_lb":True,
            "code":"%s > %f" % (self.__vect_to_string(vect),minimum)
        }
        print(cstr["code"]);
        self.cstrs.append(cstr)

    def eq(self,ld1,ld2):
        ln1,lv1 = self.__dict_to_vect(ld1);
        ln2,lv2 = self.__dict_to_vect(ld2);
        vect = np.subtract(lv1,lv2);
        value = ln2 - ln1
        cstr = {
            "vect": vect,
            "lower_bound":value,
            "upper_bound":value,
            "code":"%s > %f" % (self.__vect_to_string(vect),value)
        }
        self.cstrs.append(cstr)

    def interval(self,sc,off,v,mini,maxi):
        vals = [0]*self.dim;
        vals[sc] = v;
        vals[off] = 1;
        
        cstr = {
            "vect":vals,
            "upper_bound":maxi,
            "lower_bound":mini,
            "code":"x[%d]*%f + x[%d] in [%f,%f]" % (sc,v,off,mini,maxi)
        }

        self.cstrs.append(cstr)

    def test(self,x):
        print(x)
        if np.isscalar(x) and (math.isnan(x) or math.isinf(x)):
            return False

        for cstr in self.cstrs:
            v = sum(np.multiply(cstr["vect"],x))
            ub = cstr["upper_bound"]
            lb = cstr["lower_bound"]
            print("%f <= %s <= %f" % (lb,cstr["expr"],ub))
            if v < lb or v > ub:
                return False

        return True

    @property
    def bounds(self):
        return self._bounds

    def set_bounds(self,mini,maxi):
        self._bounds = [(mini,maxi)]*self.dim

    def lower_bound(self,idx,mini):
        lb,ub= self._bounds[idx]
        if lb > mini:
            self._bounds[idx] = (mini,ub)

    def objective(self,expr):
        c,obj = self.__dict_to_vect(expr);
        self.obj = obj;

    def sample(self):
        return;

    def generate(self,ctol):
        prob = ScipySimplexOptimizeProblem(self.dim);
        prob.set_bounds(self.bounds);
        prob.set_c(self.obj);
        for cstr in self.cstrs:
            v = cstr["vect"]
            mini = cstr["lower_bound"]
            maxi = cstr["upper_bound"]

            if maxi <> None:
                if "strict_ub" in cstr:
                    maxi = maxi - ctol
                prob.ub(np.array(v),maxi,label=cstr["code"])

            if mini <> None:
                if "strict_lb" in cstr:
                    mini = mini + ctol;
                prob.ub(np.multiply(-1,v),mini*(-1),label=cstr["code"])
                


        return prob

class OptimizeNonlinearModel:
    def __init__(self,n):
        self.init = [0.0]*n
        self.mask_const = [None]*n
        self.mask_var = [None]*n
        self._eq_tmp = {};
        self._neq = [];
        self._geq = [];
        self._gt = [];
        self.dim = n
        self.obj = "0.0"
        self.success = True;

    def initial(self,idx,ic):
        self.init[idx] = ic

    def bounds(self,vmin,vmax):
        self.bound = [(vmin,vmax)]*self.dim

    def lower_bound(self,idx,vmin):
        lb,ub = self.bound[idx]
        if lb > vmin:
            self.bound[idx] = (vmin,ub)

    def eq(self,a,b,label=None):
        if not (a in self._eq_tmp):
            self._eq_tmp[a] = [a]

        if not (b in self._eq_tmp):
            self._eq_tmp[b] = [b]

        self._eq_tmp[a].append(b)
        self._eq_tmp[b].append(a)

    def finish(self):
        eqs = []
        for eq in self._eq_tmp:
            lst = self._eq_tmp[eq];
            exists = False
            for other in eqs:
                exists = exists or (eq in other)

            if exists == False:
                eqs.append(lst)

        print(eqs)
        self._eq = ((eqs))

    def objective(self,obj):
        #self.obj = obj;
        return;

    def neq(self,a,b,label=None):
        self._neq.append((a,b,label))

    def gte(self,a,b,label=None):
        self._geq.append((a,b,label))

    def gt(self,a,b,label=None):
        self._gt.append((a,b,label))

    def model_success(self):
        return self.success


    def remove_dups(self,equivs):
        new_equivs = []
        for equiv in equivs:
            new_equiv = [];
            for el in equiv:
                if new_equiv.count(el) == 0:
                    new_equiv.append(el)

            if len(new_equiv) > 1:
                print(new_equiv)
                new_equivs.append(new_equiv)

        return new_equivs

    def _mkcstr(self,fn):
        fnx = "lambda x: to_finite(%s)" % fn
        print("%s >= 0" % fnx)
        cstr = {
            "fun":eval(fnx),
            "type":"ineq",
            "code":fn,
        };
        return cstr

    def get_model(self):
        return self._eq,self._neq,self._geq

    def generate(self,ctol,label=None,equiv=True):
        cstrs = [];
        fxn_type = "sharp";

        for equiv in self._eq:
            # disable equivalence constraints
            if equiv == False:
                continue;

            for e1 in equiv:
                for e2 in equiv:
                    if (e1 == e2):
                        continue;

                    else:
                        if fxn_type == "smooth":
                            c = self._mkcstr("0-(((%s) - (%s))**2)**0.5" % (e1,e2))
                        else:
                            c = self._mkcstr("0-abs((%s) - (%s))" % (e1,e2))

                    cstrs.append(c)



        for (a,b,l) in self._neq:
            if label == None or l in label:
                if fxn_type == "smooth":
                    c = self._mkcstr("(((%s) - (%s))**2)**0.5 - %e" % (a,b,ctol))
                else:
                    c = self._mkcstr("abs((%s) - (%s)) - %e" % (a,b,ctol))

                cstrs.append(c)

        for (a,b,l) in self._geq:
            # a > b -> (a - b) > 0
            if label == None or l in label:
                c = self._mkcstr("(%s) - (%s)" % (a,b))
                cstrs.append(c)

        for (a,b,l) in self._gt:
            if label == None or l in label:
                c = self._mkcstr("(%s) - (%s) - %e" % (a,b,ctol))
                cstrs.append(c)

        objfun = eval("lambda x : %s\n" % self.obj)
        return objfun,cstrs;



    def result(self,vect):
        for idx in range(0,len(vect)):
            v = self.mask_const[idx]
            if not (v == None):
                vect[idx] = v;

        for idx in range(0,len(vect)):
            v = self.mask_var[idx]
            if not (v == None):
                vect[idx] = vect[v];

        return vect;



    def init_guess(self):
        return self.init;

    #def _random_val(self,i):
    #    iv = self.init[i]
    #    bmin,bmax = self.bound[i]
    #    rv = numpy.random.normal(loc=0,scale=100)
    #    return rv

    #def _random_weight(self,i):
    #    iv = self.init[i]
    #    bmin,bmax = self.bound[i]
    #    rv = numpy.random.normal(loc=0,scale=100)
    #    return rv

    #def random_point(self):
    #    newguess = map(lambda i : self._random_val(i), range(0,self.dim))
    #    return newguess


    def unsat(self,cstrs,x):
        unsat_cstr = []
        sat_cstr = []

        for cstr in cstrs:
            try:
                val = cstr['fun'](x)

            except OverflowError:
                unsat_cstr.append(cstr)
                continue;

            if cstr['type'] == "ineq":
                this_test = (val >= 0.0 )

            if cstr['type'] == "eq":
                this_test = (val == 0.0 )

            if this_test == False:
                unsat_cstr.append(cstr)
            else:
                sat_cstr.append(cstr)


        return unsat_cstr,sat_cstr

    def test(self,cstrs,x,ctol=1e-6,emit=False):
        print("---> Testing")
        if False:
            for i in range(0,len(x)):
                print("x[%d] = %f\n" % (i,x[i]))

        max_error = 0;
        error_tol = ctol;

        emit = True
        for cstr in cstrs:
            val = cstr['fun'](x)

            if math.isnan(val) or math.isinf(val):
                val = 0; 

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
            if False: 
                print("  "+cstr['code']+" => "+str(this_test))
                print("     ->"+str(error))
                print("");

        print("pass:"+str(max_error <= error_tol))
        print("error:"+str(max_error));
        return (max_error <= error_tol, max_error)




    def rewrite(self):
         xlate, x = self.variables()
         nmap = {};
         sym_equivs = [];
         
         print("=== Orig =====")
         for equiv in self._eq:
             sym_equiv = map(lambda e : self.evaluate(e,x),equiv)
             sym_equivs.append(sym_equiv);
             print(sym_equiv);
 
         rewritten = True;
         all_subs = []
         print("=== Simpl Const =====")
         while rewritten:
             subs,diffs,sym_equivs = self.simpl_constants(sym_equivs,xlate,x)
             rewritten = (diffs > 0)
             all_subs += subs
             print("==========")

         rewritten = True;
         print("=== Simpl Var =====")
         while rewritten:
             subs,diffs,sym_equivs = self.simpl_vars(sym_equivs,xlate,x)
             rewritten = (diffs > 0)
             all_subs += subs
             print("==========")

         print("=== Dedup =====")
         sym_equivs = self.remove_dups(sym_equivs);
         print(all_subs);
         print("=== Subs =====")
         for (v,num) in all_subs:
             exprs =  [str(v),str(num)]
             print(exprs)
             self._eq.append(exprs);

         print("=== Eq =====")
         self._eq  = [];
         for equiv in sym_equivs:
             exprs = map(lambda e : str(e), equiv)
             print(exprs)
             self._eq.append(exprs)

         neq = self._neq;
         self._neq = [];
         print("=== Neq =====")
         for (a,b,l) in neq:
             an = self.replace(self.evaluate(a,x),all_subs)
             bn = self.replace(self.evaluate(b,x),all_subs)
             if not ((an,bn) in self._neq or (bn,an) in self._neq):
                 print(an,bn)
                 self._neq.append((str(an),str(bn),l))

         print("=== Geq =====")
         geq = self._geq;
         self._geq = [];
         for (a,b,l) in geq:
             an = self.replace(self.evaluate(a,x),all_subs)
             bn = self.replace(self.evaluate(b,x),all_subs)
             if an == bn:
                 continue;

             if not ((an,bn) in self._geq or (bn,an) in self._geq):
                 print(an,bn)
                 self._geq.append((str(an),str(bn),l))



    def variables(self):
        xlate = {};
        x = []
        for i in range(0,self.dim):
            sym = Symbol("x[%d]" % i)
            xlate[sym] = i
            x.append(sym)

        return xlate,x

    def evaluate(self,str_expr,x):
        expr = sp.sympify(str_expr,{"x":x})
        return expr;

    def replace(self,expr,repl):
        simpl = expr.subs(repl)
        self.success = self.success and simpl.is_real
        return simpl

    def _reduce_number_list(self,numbers):
        num = None;
        for n in numbers:
            if num == None or n == num:
                num = n
            else:
                self.success = False
                num = None

        return num;

    def simpl_constants(self,equivs,xlate,x):
        nmap = {};
        new_equivs = []
        diffs = 0
        for equiv in equivs:
            numbers = filter(lambda e:e.is_constant(),equiv)
            number = self._reduce_number_list(numbers); 
            if number <> None:
                print(number)
                for eq in equiv:
                    if eq.is_Symbol:
                        self.mask_const[xlate[eq]] = number
                        nmap[eq] = number
                        diffs += 1;

                    
        for equiv in equivs:
            new_equiv = map(lambda e : self.replace(e,nmap), equiv)
            print(new_equiv)
            new_equivs.append(new_equiv)

        return nmap.items(),diffs, new_equivs

    def simpl_vars(self,equivs,xlate,x):
        smap = {};
        new_equivs = []
        diffs = 0
        for equiv in equivs:
            symbols = filter(lambda e:e.is_Symbol,equiv)
            if len(symbols) > 1:
                repl_symbol = symbols[0]
                rest = symbols[1:]
                for sym in rest:
                    if sym <> repl_symbol:
                        self.mask_var[xlate[sym]] = xlate[repl_symbol]
                        smap[sym] =repl_symbol 
                        diffs += 1
                    
        for equiv in equivs:
            new_equiv = map(lambda e : self.replace(e,smap), equiv)
            print(new_equiv)
            new_equivs.append(new_equiv)

        return smap.items(),diffs, new_equivs

