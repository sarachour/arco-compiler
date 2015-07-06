
exception SymCamlParserError of string;;
exception SymCamlException of string;;
exception SymCamlFunctionException of string*string;;
exception PyCamlWrapperException of string;;

type spy_sym = string

type 'a spy_maybe = 
   | Some of 'a
   | None 
type spy_expr = 
   | Symbol of spy_sym
   | Integral of spy_expr*spy_sym
   | Cos of spy_expr
   | Sin of spy_expr
   | Tan of spy_expr
   | Mult of spy_expr list
   | Add of spy_expr list
   | Exp of spy_expr*spy_expr
   | NatExp of spy_expr
   | Sub of spy_expr list
   | Paren of spy_expr
   | Decimal of float
   | Integer of int


