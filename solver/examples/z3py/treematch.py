__author__ = 'sachour'

from z3 import *;

class ExpressionMatchingProblem:

    def __init__(self):
        self.s=Solver()

        self.Literal = Datatype("Literal");
        self.Literal.declare('number', ('id', RealSort()))
        self.Literal.declare('symbol', ('id', IntSort()))
        self.Literal = self.Literal.create();

        self.Expr = Datatype("Expr");
        self.Expr.declare('literal', ('val', self.Literal))
        self.Expr.declare('add', ('e1',self.Expr), ('e2',self.Expr))
        self.Expr.declare('sub', ('e1',self.Expr), ('e2',self.Expr))
        self.Expr.declare('mul', ('e1',self.Expr), ('e2',self.Expr))
        self.Expr.declare('div', ('e1',self.Expr), ('e2',self.Expr))
        self.Expr.declare('exp', ('e1',self.Expr), ('e2',self.Expr))

        self.Expr = self.Expr.create()

        self.x = Const("__x",self.Expr);
        self.y = Const("__y",self.Expr);
        self.simpl = Function('simpl', self.Expr, self.Expr);

        t1 = self.Expr.exp(self.x,self.Expr.literal(self.Literal.number(1)))
        '''
        self.axioms = [

            ForAll(
                [self.x, self.y],
                Implies(
                        self.simpl(self.y) == self.simpl(t1),
                        self.simpl(self.y) == self.simpl(self.y)
                ),
                patterns=[MultiPattern(self.simpl(self.y), self.simpl(t1))]
            )

        ]
        '''
        print self.Expr.is_mul
        self.axioms = [
            Forall([self.x],

                   pattern=self.simpl(self.x))
        ]
        self.symbols = {"fwd":{},"rev":{}};
        self.symbol_id = 0;

        self.vars = {};

    def define_var(self, varname):
        self.vars[varname] = Const(varname, self.Expr);

    def define_symbol(self,varname):
        self.symbols["fwd"][varname] = self.symbol_id;
        self.symbols["rev"][self.symbol_id] =varname;
        self.symbol_id+=1;

    def Symbol(self,x):
        if x not in self.symbols["fwd"]:
            raise ValueError('Symbol '+x+' is not defined.')
        return self.Expr.literal(self.Literal.symbol(self.symbols["fwd"][x]))

    def Number(self,x):
        return self.Expr.literal(self.Literal.number(x));

    def Op(self,op,e1,e2):
        if op == "+":
            return self.Expr.add(e1,e2);
        elif op == "-":
            return self.Expr.sub(e1,e2);
        elif op == "*":
            return self.Expr.mul(e1,e2);
        elif op == "/":
            return self.Expr.div(e1,e2);
        elif op == "^":
            return self.Expr.exp(e1,e2);

    def Var(self, n):
        if n not in self.vars:
            raise ValueError('Variable '+n+' is not defined.')
        return self.vars[n];

    def to_string(self,v):
        conv = lambda v:"("+self.to_string(v.arg(0))+","+self.to_string(v.arg(1))+")";
        if(v.decl().eq(self.Expr.literal)):
            return self.to_string(v.arg(0))
        elif(v.decl().eq(self.Literal.symbol)):
            idx = v.arg(0).as_long().real
            return "sym("+self.symbols["rev"][idx]+")"
        elif(v.decl().eq(self.Literal.number)):
            idx = v.arg(0).as_decimal(5)
            return "num("+idx+")"
        elif(v.decl().eq(self.Expr.add)):
            return "Add"+conv(v);
        elif(v.decl() == self.Expr.mul):
            return "Mul"+conv(v);
        else:
            return v

    def check(self, lhs, rhs):

        self.s.add(self.axioms)
        self.s.add(self.simpl(lhs) == self.simpl(rhs));
        print lhs,"==",rhs;
        #(apply (then simplify solve-eqs))
        t=self.s.check()
        if t==sat:
            print "==== Satisfiable ===="
            m = self.s.model();
            # print m
            for key in self.vars:
                v = self.vars[key]
                val = m.eval(v)
                print key,"=",self.to_string(val)
        else:
           print t





s = ExpressionMatchingProblem()
s.define_var("R");
s.define_var("I");
s.define_symbol("a");
s.define_symbol("k");

#comp = s.Op("/",s.Op("^",s.Var("x"),s.Var("k")),s.Op("+",s.Number(1),s.Op("^",s.Var("x"),s.Var("k"))))
#expr = s.Op("/",s.Symbol("a"),s.Op("+",s.Number(1),s.Symbol("a")))
comp = s.Op("^",s.Var("I"),s.Var("R"))
expr = s.Symbol("a")
s.check(comp,expr)