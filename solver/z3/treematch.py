__author__ = 'sachour'

from z3 import *;

class TreeSolver:

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
        return self.Expr.literal(self.Literal.symbol(self.symbols["fwd"][x]))

    def Number(self,x):
        return self.Expr.number(self.Literal.number(x));

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
        return self.vars[n];

    def to_string(self,v):
        if(v.decl().eq(self.Expr.literal)):
            return self.to_string(v.arg(0))
        elif(v.decl().eq(self.Literal.symbol)):
            idx = v.arg(0).as_long().real
            return self.symbols["rev"][idx]
        elif(v.decl().eq(self.Literal.number)):
            return v.arg(0)
        elif(v.decl().eq(self.Expr.add)):
            return (self.to_string(v.arg(0)))+"+"+(self.to_string(v.arg(1)));
        elif(v.decl() == self.Expr.mul):
            return (self.to_string(v.arg(0)))+"*"+(self.to_string(v.arg(1)));
        else:
            return v

    def check(self, lhs, rhs):
        self.s.add(lhs == rhs);
        print (lhs),"==",(rhs)
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





s = TreeSolver()
s.define_var("x");
s.define_var("y");
s.define_symbol("a");
s.define_symbol("b");

print s.Var("x")
l = s.check(s.Op("*",s.Var("x"),s.Var("y")), s.Op("*",s.Op("+",s.Symbol("a"),s.Symbol("b")), s.Symbol("b")) );
