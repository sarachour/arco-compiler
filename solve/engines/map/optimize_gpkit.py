from gpkit import VectorVariable, Variable, Model, Monomial, Posynomial
from gpkit.nomials.math import MonomialEquality, PosynomialInequality
import gpkit

class OptimizeProblem:
    class NLTermHandler:

        @staticmethod
        def nl_expr_to_posy(vars,nl):
            expr = eval(nl,{'x':vars})
            return expr

        @staticmethod
        def nl_expr_to_number(vars,nl):
            expr = eval(nl,{'x':vars})
            if type(expr) == float or type(expr) == int:
                return expr
            else:
                return None

    class LinTermHandler:

        @staticmethod
        def lin_expr_to_term(idx,coeff):
            if idx == 'offset':
                return coeff
            elif coeff == 0:
                return 0.0
            else:
                return (coeff,int(idx))

        @staticmethod
        def lin_expr_to_posy(vars,args):
            def combine(x,y):
                if x == 0.0:
                    return y

                elif y == 0.0:
                    return x
                else:
                    return (x+y)

            def to_term(k,v):
                res = OptimizeProblem.LinTermHandler.lin_expr_to_term(k,v)
                if res == 0.0:
                    return res
                elif type(res) == float or type(res) == int:
                    return res
                else:
                    c,i = res
                    return c*vars[i]

            terms = map(lambda (k,v) : to_term(k,v), args.items())
            return reduce(lambda x,y : combine(x,y), terms)

        @staticmethod
        def lin_expr_to_number(lin):
            if len(lin.keys()) > 1:
                return None

            idx,coeff = lin.items()[0]
            if idx == 'offset':
                return coeff
            else:
                return None


    def __init__(self,n):
        self._n = n
        self._vars = VectorVariable(n,'x')
        self._cstrs = []
        self._opt = self._vars[1]
        self._buf = []
        self._to_id = {}
        self._assigns = {}

    def add_constraint(self,c):
        if (type(c) == bool):
            raise Exception("not a standard comparison: %s" %(type(c)))
        self._cstrs.append(c)

    def set_prop(self,key,value):
        print("prop %s = %s" % (key,value))

    def bound(self,min,max):
        if min < 0:
            print("[WARN] ignoring min=%s" % min)

        amin = min if min > 0 else 1e-20

        for i in range(0,self._n):
            c1 = (self._vars[i] <= max)
            c2 = (self._vars[i] >= amin)
            self.add_constraint(c1)
            self.add_constraint(c2)

    def initial(self,v,n):
        print('[WARN] ignoring initial guess %s=%s' % (v,n))

    def reflow(self,index,prob_id):
        self._to_id[index] = prob_id

    def eq(self,expr1,expr2):
        is_valid = lambda x : x is not None and x != 0.0
        is_monom = lambda x : isinstance(x,Monomial) or isinstance(x,int) or isinstance(x,float)

        e1 = OptimizeProblem.NLTermHandler.nl_expr_to_posy(self._vars,expr1)
        e2 = OptimizeProblem.NLTermHandler.nl_expr_to_posy(self._vars,expr2)
        if is_valid(e1) and is_valid(e2):
            if is_monom(e1) and is_monom(e2):
                c = MonomialEquality(e1,'=',e2)
                self.add_constraint(c)
            else:
                print('[eq] delay %s = %s' % (e1,e2))
                self._buf.append({'type':'eq', 'args':[e1,e2]})

        elif e1 == 0.0 and is_valid(e2):
            assert(False)
        elif is_valid(e1) and e2 == 0.0:
            assert(False)
        elif e1 == 0.0 and e2 == 0.0:
            return
        else:
            raise Exception("unexpected")
            #self._buf.append({'type':'eq','args':[expr1,expr2]})

    def lin_eq(self,expr1,expr2):
        is_valid = lambda x : x is not None and x != 0.0
        is_monom = lambda x : isinstance(x,Monomial) or isinstance(x,int) or isinstance(x,float)
        e1 = OptimizeProblem.LinTermHandler.lin_expr_to_posy(self._vars,expr1)
        e2 = OptimizeProblem.LinTermHandler.lin_expr_to_posy(self._vars,expr2)
        if is_valid(e1) and is_valid(e2):
            if is_monom(e1) and is_monom(e2):
                try:
                    c = MonomialEquality(e1,'=', e2)
                    self.add_constraint(c)
                except ValueError:
                    print('[lin_eq] delay %s = %s' % (e1,e2))
                    self._buf.append({'type':'eq', 'args':[e1,e2]})

            else:
                print('[lin_eq] delay %s = %s' % (e1,e2))
                self._buf.append({'type':'eq', 'args':[e1,e2]})

        elif e1 == 0.0 and is_valid(e2):
            #self._assigns[e2] = e1
            print('[lin_eq][WARN-REDUNDENT] %s = 0' % (e2))
        elif is_valid(e1) and e2 == 0.0:
            print('[lin_eq][WARN-REDUNDENT] %s = 0' % (e1))
            #self._assigns[e1] = e2


        else:
            print("[WARN] not : %s=%s" % (expr1,expr2))
            #self._buf.append({'type':'lin_eq','args':[expr1,expr2]})

    def lin_lower_bound(self,scale,value,minimum):
        flip_sign = False
        if value == 0.0:
            assert(minimum <= 0.0)
            return

        elif minimum == 0.0 and value > 0.0:
            return

        elif minimum == 0.0 and value < 0.0:
            assert(False)

        elif minimum < 0.0 and value > 0.0:
            print('[WARN] minimum will be ignored')
            return

        elif minimum < 0.0 and value < 0.0:
            flip_sign = True

        if not flip_sign:
            self.add_constraint(value*self._vars[scale] >= minimum)
        else:
            self.add_constraint((-1*value)*self._vars[scale] <= (-1*minimum))

    def lin_upper_bound(self,scale,value,maximum):
        flip_sign = False

        if value == 0.0:
            assert(maximum >= 0)
            return

        elif maximum == 0.0 and value > 0.0:
            assert(False)
            return

        elif maximum == 0.0 and value < 0.0:
            return

        elif maximum < 0.0 and value < 0.0:
            flip_sign = True

        elif maximum > 0.0 and value < 0.0:
            return

        if not flip_sign:
            self.add_constraint(value*self._vars[scale] <= maximum)
        else:
            self.add_constraint((-1*value)*self._vars[scale] >= -1*maximum)

    def lin_interval(self,scale,offset,value,minimum,maximum):
        #self._cstrs.append(self._vars[offset] == 0.0)
        self._assigns[self._vars[offset]] = 0.0
        self.lin_lower_bound(scale,value,minimum)
        self.lin_upper_bound(scale,value,maximum)


    def lin_gte(self,expr1,expr2):
        is_valid = lambda x : x is not None and x != 0.0
        e1 = OptimizeProblem.LinTermHandler.lin_expr_to_posy(self._vars,expr1)
        e2 = OptimizeProblem.LinTermHandler.lin_expr_to_posy(self._vars,expr2)
        if is_valid(e1) and is_valid(e2):
            if isinstance(e1,Posynomial) and isinstance(e2,Monomial):
                c = PosynomialInequality(e1,'>=', e2)
                self.add_constraint(c)
            else:
                print('delaying.')
                self._buf.append({'type':'gte', 'args':[e1,e2]})
            self.add_constraint(e1 >= e2)

        elif is_valid(e1) and e2 == 0.0:
            return

        elif e1 == 0.0 and is_valid(e2):
            assert(False)

        elif e1 == 0.0 and e2 == 0.0:
            return

        else:
            raise Exception("unexpected")

    def lin_neq(self,expr1,expr2):
        n1 = OptimizeProblem.LinTermHandler.lin_expr_to_number(expr1)
        n2 = OptimizeProblem.LinTermHandler.lin_expr_to_number(expr2)
        if n1 != None and n2 != None:
            assert(n1 != n2)
        elif n1 == 0.0 or n2 == 0.0:
            return
        else:
            raise Exception("cannot test two expressions")

    def neq(self,expr1,expr2):
        n1 = OptimizeProblem.NLTermHandler.nl_expr_to_number(self._vars,expr1)
        n2 = OptimizeProblem.NLTermHandler.nl_expr_to_number(self._vars,expr2)
        if n1 != None and n2 != None:
            assert(n1 != n2)
        elif n1 == 0.0 or n2 == 0.0:
            return
        else:
            raise Exception("cannot test two expressions")

    def gte(self,expr1,expr2):
        n1 = OptimizeProblem.NLTermHandler.nl_expr_to_number(self._vars,expr1)
        n2 = OptimizeProblem.NLTermHandler.nl_expr_to_number(self._vars,expr2)
        if n1 != None and n2 != None:
            assert(n1 != n2)
        elif n2 == 0.0:
            return
        elif n1 == 0.0:
            assert(False)
        else:
            raise Exception("cannot test two expressions")

    def solve_buffer(self):
        is_number = lambda x : isinstance(x,int) or isinstance(x,float)
        is_monom = lambda x : isinstance(x,Monomial) or is_number(x)
        buf = self._buf
        if len(buf) == 0:
            return

        print(self._assigns)
        for b in buf:
            if b['type'] == 'eq':
                arg1,arg2 = b['args'][0:2]
                print("%s == %s" % (arg1,arg2))
                simpl_arg1 = arg1.sub(self._assigns,require_positive=False) \
                    if not is_number(arg1) else arg1
                simpl_arg2 = arg2.sub(self._assigns,require_positive=False) \
                    if not is_number(arg2) else arg2
                print("%s == %s" % (simpl_arg1,simpl_arg2))
                if simpl_arg1 == simpl_arg2:
                    continue
                if is_monom(simpl_arg1) and is_monom(simpl_arg2):
                    c = MonomialEquality(simpl_arg1,'=',simpl_arg2)
                    self.add_constraint(c)
                    print('-> added!')
                else:
                    print('-> did not add')
                    raise Exception('failed to add buffered ocnstraint')
            else:
                raise Exception('gte unhandled')


    def solve(self):
        print('-- SOLVE -----')
        self.solve_buffer()
        model = Model(self._opt,self._cstrs)
        self._sln = model.solve()
        print(self._sln.table())


    def write(self,filename):
        print("=== Writing Solution ===")
        fh = open(filename,'w')
        fh.write("%d\n" % self._n)
        if self._sln:
            fh.write("success\n")
            fh.write("%e\n" % 0.0)
            result_vect = self._sln(self._vars)
            for idx,value in enumerate(result_vect):
                id = self._to_id[idx]
                fh.write("%d=%.16e\n" % (id,value))

        print("=== Closed ===")
        fh.close()
