import inspect
import numpy
import sys
import math
from sympy import Symbol
import sympy as sp

class OptimizeModel:
    def __init__(self,n):
        self.init = [0.0]*n
        self.mask_const = [None]*n
        self.mask_var = [None]*n
        self._eq_tmp = {};
        self._neq = [];
        self._geq = [];
        self.dim = n
        self.obj = "0"
        self.success = False;

    def initial(self,idx,ic):
        self.init[idx] = ic

    def bounds(self,vmin,vmax):
        self.bound = [(vmin,vmax)]*self.dim

    def eq(self,a,b):
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
        self.obj = obj;
        return;

    def neq(self,a,b):
        self._neq.append((a,b))

    def gte(self,a,b):
        self._geq.append((a,b))

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
        print("=== Write to String=====")
        self._eq  = [];
        for equiv in sym_equivs:
            exprs = map(lambda e : str(e), equiv)
            self._eq.append(exprs)

        neq = self._neq;
        self._neq = [];
        print("=== Neq =====")
        for (a,b) in neq:
            an = self.replace(self.evaluate(a,x),all_subs)
            bn = self.replace(self.evaluate(b,x),all_subs)
            if not ((an,bn) in self._neq or (bn,an) in self._neq):
                print(an,bn)
                self._neq.append((str(an),str(bn)))

        print("=== Geq =====")
        geq = self._geq;
        self._geq = [];
        for (a,b) in geq:
            an = self.replace(self.evaluate(a,x),all_subs)
            bn = self.replace(self.evaluate(b,x),all_subs)
            if an == bn:
                continue;

            if not ((an,bn) in self._geq or (bn,an) in self._geq):
                print(an,bn)
                self._geq.append((str(an),str(bn)))

    def _mkcstr(self,fn):
        fnx = "lambda x: %s" % fn
        print("%s >= 0" % fnx)
        cstr = {
            "fun":eval(fnx),
            "type":"ineq",
            "code":fnx+" >= 0",
        };
        return cstr

    def generate(self):
        cstrs = [];
        for equiv in self._eq:
            for e1 in equiv:
                for e2 in equiv:
                    if not (e1 == e2):
                        c = self._mkcstr("0-((%s) - (%s))**2" % (e1,e2))
                        cstrs.append(c)

        for (a,b) in self._neq:
            c = self._mkcstr("((%s) - (%s))**2 - %e" % (a,b,1e-64))
            cstrs.append(c)

        for (a,b) in self._geq:
            c = self._mkcstr("(%s) - (%s)" % (a,b))
            cstrs.append(c)

        objfun = eval("lambda x : %s\n" % self.obj)
        return objfun,cstrs;

    def result(self,vect):
        print(self.mask_const)
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

    def _random_val(self,i):
        iv = self.init[i]
        bmin,bmax = self.bound[i]
        rv = numpy.random.normal(loc=0,scale=10)
        return rv

    def random_point(self):
        newguess = map(lambda i : self._random_val(i), range(0,self.dim))
        return newguess
