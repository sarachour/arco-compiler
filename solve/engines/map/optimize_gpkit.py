from gpkit import VectorVariable, Variable, Model, Monomial, Posynomial
from gpkit.nomials.math import MonomialEquality, PosynomialInequality
from gpkit.constraints.bounded import Bounded
import gpkit
from math_expr_parser import Parser, Expression, Token, TNUMBER

class OptimizeProblem:
    class ExpressionHandler:
        @staticmethod
        def compile_to_posy(vars,expr,require_positive=False):
            def to_symbol(v):
                return "%s[%s]" % (v.key.descr['name'],v.key.descr['idx'][0])

            symtbl = dict(map(lambda v: (to_symbol(v),v), vars))
            def var_func(name):
                if name in symtbl:
                    return Monomial(symtbl[name],require_positive=require_positive)
                else:
                    print(symtbl)
                    raise Exception("not in symbol table: %s" % name)

            def val_func(value):
                return value

            try:
                return expr.compile(var_func,val_func)

            except ValueError as e:
                print('[WARN] cannot coerce %s [%s]' % (expr,e))
                return None

            except TypeError as e:
                print('[WARN] cannot coerce %s [%s]' % (expr,e))
                return None

    class NLTermHandler:
        parser = Parser()

        @staticmethod
        def nl_expr_to_ast(nl):
            expr = OptimizeProblem.NLTermHandler.parser.parse(nl)
            return expr

        @staticmethod
        def nl_expr_to_posy(vars,nl):
            expr = OptimizeProblem.NLTermHandler.nl_expr_to_ast(nl)
            posy = OptimizeProblem.ExpressionHandler.compile_to_posy(vars,expr)
            return posy

        @staticmethod
        def nl_expr_to_number(nl):
            expr = OptimizeProblem.NLTermHandler.parser.parse(nl)
            value = expr.get_value()
            if value is not None:
                return value
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
        def balance(args1,args2):
            def update(other,key,delta):
                if not key in other:
                    other[key] = 0
                other[key] += delta

            expr1 = dict(args1)
            expr2 = dict(args2)
            print(args1,args2)
            for k,v in args1.items():
                if v < 0:
                    update(expr1,k,-1*v)
                    update(expr2,k,-1*v)

            for k,v in args2.items():
                if v < 0:
                    update(expr1,k,-1*v)
                    update(expr2,k,-1*v)

            for k,v in expr1.items():
                if v == 0 and k != 'offset':
                    del expr1[k]

            for k,v in expr2.items():
                if v == 0 and k != 'offset':
                    del expr2[k]

            return expr1,expr2

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
        self._success = True
        terms = map(lambda v : v**(-1), self._vars)
        prod = reduce(lambda x,y : x*y, terms)
        self._opt = prod + prod**(-1)
        print("OPT: %s" % str(self._opt))
        self._buf = []
        self._to_id = {}
        self._to_index = {}
        for idx,v in enumerate(self._vars):
            self._to_index[v] = idx

        self._assigns = {}

    def fail(self,msg):
        self._success = False
        self._msg = msg

    def objective(self,nl):
        opt = OptimizeProblem.NLTermHandler.nl_expr_to_posy(self._vars,nl)
        if opt:
            self._opt = opt

    def add_constraint(self,c):
        if (type(c) == bool):
            raise Exception("not a standard comparison: %s" %(type(c)))
        self._cstrs.append(c)

    def set_prop(self,key,value):
        print("prop %s = %s" % (key,value))

    def bound(self,min,max):
        if min < 0:
            print("[WARN] ignoring min=%s" % min)

        amin = min if min > 0 else None

        for i in range(0,self._n):
            c1 = (self._vars[i] <= max)
            self.add_constraint(c1)
            if amin is not None:
                c2 = (self._vars[i] >= amin)
                self.add_constraint(c2)

    def initial(self,v,n):
        print('[WARN] ignoring initial guess %s=%s' % (v,n))

    def reflow(self,index,prob_id):
        self._to_id[index] = prob_id

    def eq(self,expr1,expr2):
        is_valid = lambda x : x is not None and x != 0.0
        is_monom = lambda x : isinstance(x,Monomial) or isinstance(x,int) or isinstance(x,float)

        e1 = OptimizeProblem.NLTermHandler.nl_expr_to_ast(expr1)
        e2 = OptimizeProblem.NLTermHandler.nl_expr_to_ast(expr2)
        p1 = OptimizeProblem.ExpressionHandler.compile_to_posy(self._vars,e1)
        p2 = OptimizeProblem.ExpressionHandler.compile_to_posy(self._vars,e2)
        if is_valid(p1) and is_valid(p2):
            if is_monom(p1) and is_monom(p2):
                print('%s == %s' % (p1,p2))
                c = MonomialEquality(p1,'=',p2)
                self.add_constraint(c)
            else:
                print('[eq] delay %s = %s' % (p1,p2))
                self._buf.append({'type':'eq', 'args':[p1,p2]})

        elif e1.is_zero() and is_valid(e2):
            self._buf.append({'type':'eq', 'args':[e1,e2]})

        elif is_valid(e1) and e2.is_zero():
            self._buf.append({'type':'eq', 'args':[e1,e2]})

        elif e1.is_zero() and e2.is_zero():
            return
        else:
            self._buf.append({'type':'eq', 'args':[e1,e2]})
            print("unexpected: %s == %s" % (e1,e2))
            #self._buf.append({'type':'eq','args':[expr1,expr2]})

    def get_variable_from_sig(self,e1):
        args = e1.hmap.items()
        if len(args) == 1:
            term_dict,coeff =args[0]
            terms = term_dict.items()
            if len(terms) == 1:
                var, exp = terms[0]
                if exp == 1:
                    return var
                else:
                    return None
        else:
            return None

    def lin_eq(self,unbal_expr1,unbal_expr2):
        is_valid = lambda x : x is not None and x != 0.0
        is_monom = lambda x : isinstance(x,Monomial) or isinstance(x,int) or isinstance(x,float)
        expr1,expr2 = OptimizeProblem.LinTermHandler.balance(unbal_expr1,unbal_expr2)
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
            var = self.get_variable_from_sig(e2)
            if var:
                self._assigns[var] = 0.0
            else:
                print('[lin_eq][WARN-REDUNDENT] %s = 0 [%s]' % (e2,type(e2)))
        elif is_valid(e1) and e2 == 0.0:
            var = self.get_variable_from_sig(e1)
            if var:
                self._assigns[var] = 0.0
            else:
                print('[lin_eq][WARN-REDUNDENT] %s = 0 [%s]' % (e1,type(e1)))
            #self._assigns[e1] = e2

        elif e1 == 0.0 and e2 == 0.0:
            return
        else:
            print("[WARN] eq: %s=%s" % (expr1,expr2))
            #self._buf.append({'type':'lin_eq','args':[expr1,expr2]})

    def lin_lower_bound(self,scale,value,minimum):
        flip_sign = False
        if value == 0.0:
            if not (minimum <= 0.0):
                self.fail("llb: %s <= scf*%s => False" % (minimum,value))
            return

        elif minimum == 0.0 and value > 0.0:
            return

        elif minimum == 0.0 and value < 0.0:
            self.fail("llb: %s <= scf*%s => False" % (minimum,value))
            return

        elif minimum < 0.0 and value > 0.0:
            print('[WARN] minimum will be ignored')
            return

        elif minimum < 0.0 and value < 0.0:
            flip_sign = True

        elif minimum > 0.0 and value > 0.0:
            flip_sign = False

        elif minimum > 0.0 and value < 0.0:
            self.fail("%s <= scf*%s => False" % (minimum,value))
            return

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
            self.fail("scf*%s <= %s => False" % (value,maximum))
            return

        elif maximum == 0.0 and value < 0.0:
            return

        elif maximum < 0.0 and value < 0.0:
            flip_sign = True

        elif maximum < 0.0 and value > 0.0:
            self.fail("scf*%s <= %s => False" % (value,maximum))
            return

        elif maximum > 0.0 and value > 0.0:
            flip_sign = False

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
            self.fail("%s >= %s => False" % (e1,e2))
            return

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
        n1 = OptimizeProblem.NLTermHandler.nl_expr_to_number(expr1)
        n2 = OptimizeProblem.NLTermHandler.nl_expr_to_number(expr2)
        if n1 != None and n2 != None:
            assert(n1 != n2)
        elif n1 == 0.0 or n2 == 0.0:
            return
        else:
            raise Exception("cannot test two expressions: %s != %s" % (n1,n2))

    def gte(self,expr1,expr2):
        is_valid = lambda x : x is not None and x != 0.0
        is_monom = lambda x : isinstance(x,Monomial) or isinstance(x,int) or isinstance(x,float)
        e1 = OptimizeProblem.NLTermHandler.nl_expr_to_ast(expr1)
        e2 = OptimizeProblem.NLTermHandler.nl_expr_to_ast(expr2)

        p1 = OptimizeProblem.ExpressionHandler.compile_to_posy(self._vars,e1)
        p2 = OptimizeProblem.ExpressionHandler.compile_to_posy(self._vars,e2)

        if is_valid(p1) and is_valid(p2):
            if is_monom(p1) and is_monom(p2):
                c = MonomialEquality(p1,'=',p2)
                self.add_constraint(c)
            else:
                print('[gte] delay %s = %s' % (p1,p2))
                self._buf.append({'type':'gte', 'args':[p1,p2]})

        elif e1.is_zero() and e2.is_zero():
            return
        elif e2.is_zero():
            return
        elif e1.is_zero():
            self.fail("%s >= %s => False" % (e1,e2))
            return
        else:
            self._buf.append({'type':'gte', 'args':[e1,e2]})

    def solve_buffer(self):
        is_number = lambda x : isinstance(x,int) or isinstance(x,float)
        is_monom = lambda x : isinstance(x,Monomial) or is_number(x)
        def to_expr_dict(v,value):
            vname = "%s[%s]" % (v.key.descr['name'],v.key.descr['idx'][0])
            evalue = Token(TNUMBER, 0, 0, value)
            return (vname,evalue)

        me_assigns = dict(map(lambda (k,v): to_expr_dict(k,v), self._assigns.items()))
        posy_assigns = self._assigns
        def concretize(arg):
            if not is_number(arg):
                if isinstance(arg,Expression):
                    sub_arg = arg.substitute_all(me_assigns).simplify()
                    print("%s -> %s" % (str(arg),str(sub_arg)))
                    posy = OptimizeProblem.ExpressionHandler\
                        .compile_to_posy(self._vars,sub_arg,require_positive=False)
                    if posy is not None:
                        return posy
                    else:
                        print(' -> could not convert to posy')
                        return None

                else:
                    return arg.sub(posy_assigns,require_positive=False)
            else:
                return arg

        buf = self._buf
        if len(buf) == 0:
            return True

        for b in buf:
            arg1,arg2 = b['args'][0:2]
            print(b['type'],arg1.__class__.__name__,arg2.__class__.__name__)
            print("%s %s %s" % (arg1,b['type'],arg2))
            simpl_arg1 = concretize(arg1)
            simpl_arg2 = concretize(arg2)
            if b['type'] == 'eq':
                if simpl_arg1 == simpl_arg2:
                    continue
                if is_monom(simpl_arg1) and is_monom(simpl_arg2):
                    c = MonomialEquality(simpl_arg1,'=',simpl_arg2)
                    self.add_constraint(c)
                    print('-> added!')
                else:
                    print('[FAILED] cannot convert %s == %s -> %s == %s' % (arg1,arg2,simpl_arg1,simpl_arg2))
                    return False

            elif b['type'] == 'gte':
                if is_monom(simpl_arg2):
                    c = PosynomialInequality(simpl_arg1,'>=',simpl_arg2)
                    self.add_constraint(c)
                    print('-> added')
                else:
                    print('[FAILED] cannot convert %s >= %s -> %s >= %s' % (arg1,arg2,simpl_arg1,simpl_arg2))
                    return False
            else:
                raise Exception('gte unhandled')
        return True


    def solve(self):
        print('-- SOLVE -----')
        if not self._success:
            print('[FAILED TO CONSTRUCT] %s' % self._msg)
            self._sln = None
            return

        succ = self.solve_buffer()
        if not succ:
            self._sln = None
            return

        model = Model(self._opt,Bounded(self._cstrs))
        try:
            self._sln = model.solve()
            print(self._sln.table())
        except RuntimeWarning as w:
            print('[FAILED TO SOLVE] %s' % w)
            self._sln = None
            model.debug()

    def write(self,filename):
        print("=== Writing Solution ===")
        fh = open(filename,'w')
        fh.write("%d\n" % self._n)
        if self._sln:
            fh.write("success\n")
            fh.write("%e\n" % 0.0)
            result_vect = self._sln(self._vars)
            write_vect = [0]*self._n
            for var,value in zip(self._vars,result_vect):
                idx = self._to_index[var]
                write_vect[idx] = value
                print("%s = %s" % (var,value))
                if var.key in self._assigns:
                    new_value = self._assigns[var.key]
                    print("=> replace with %s=%s" % (var.key,new_value))
                    write_vect[idx] = new_value

            for idx,value in enumerate(write_vect):
                id = self._to_id[idx]
                fh.write("%d=%.16e\n" % (id,value))

        print("=== Closed ===")
        fh.close()
