
type spy_sym = string

type spy_expr = 
   | Symbol of spy_sym
   | Integral of spy_expr*spy_sym
   | Cos of spy_expr
   | Sin of spy_expr
   | Tan of spy_expr
   | Mult of spy_expr list
   | Add of spy_expr list
   | Exp of spy_expr
   | Sub of spy_expr list

