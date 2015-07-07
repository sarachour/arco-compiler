
exception SymCamlParserError of string;;
exception SymCamlException of string;;
exception SymCamlFunctionException of string*string;;
exception PyCamlWrapperException of string;;

type symvar = string


type symexpr = 
   | Symbol of symvar
   | Integral of symexpr*symvar
   | Cos of symexpr
   | Sin of symexpr
   | Tan of symexpr
   | Mult of symexpr list
   | Add of symexpr list
   | Exp of symexpr*symexpr
   | NatExp of symexpr
   | Sub of symexpr list
   | Paren of symexpr
   | Decimal of float
   | Integer of int


