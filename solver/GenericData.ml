open Util

type gdecimal = float
type gint = int

type gliteral = 
	| Symbol of string
	| Parameter of string
	
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

type grel = 
	| Eq of gexpr*gexpr

type genv = {
	rel: grel;
	inputs: string list;
	outputs: string list;
	params: (string*(gdecimal maybe)) list
}