open Util

type gdecimal = float
type gint = int
type gvar = string

type gsymbol = 
  | Param of string 
  | FixedParam of string*gdecimal 
  | Input of string 
  | Output of string


type gliteral = 
	| Symbol of gsymbol
	
type gexpr = 
	| Literal of gliteral
	| Div of gexpr*gexpr
	| Mult of gexpr list
	| Add of gexpr list
	| Sub of gexpr list
	| Exp of gexpr*gexpr
	| NatExp of gexpr
	| Deriv of gexpr
	| Decimal of gdecimal
	| Integer of gint
	| Paren of gexpr

type grel = 
	| Eq of gexpr*gexpr

type genv = {
	rel: grel;
	ports: gsymbol list;
	ns: string
}