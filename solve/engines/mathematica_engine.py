import pythonica


class MathematicaUnify:
        def __init__(self,pat,expr):
                self.pattern = pat;
                self.expr = expr;

class MathematicaEngine:

        def __init__(self):
            self.m = pythonica.Pythonica();
            self.wildcards = {};
            self.variables = {};
            self.unifications = [];

        def define_wildcard(self,v):
            self.wildcards[v] = [];

        def define_variable(self,v):
            self.variables[v] = Symbol(v);

        def disable_expr(self,v,expr):
            if not (v in self.wildcards):
                    self.wildcards[v] = [];
            self.wildcards[v].push(expr);

        def add_unify_cstr(self,a,b):
            self.unifications.append(MathematicaUnify(a,b))

        def solve(self,n):
            # concretize each expression.
            cstrs = ""
            for unify in self.unifications:
                cstrs += ""

            for wild in self.wildcards:
                cstrs += ""
                wilds += ""

            prob = "Solve["+cstrs+",{"+wilds+"}]"
            res = self.m.eval(prob)
