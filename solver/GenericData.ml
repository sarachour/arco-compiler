open Util

type gid = id
type gdecimal = float

type gliteral = 
	| Symbol of gid
	| Number of gdecimal

type gexpr = 
	| Literal of gliteral
	| Div of gexpr*gexpr
	| Mult of gexpr list
	| Add of gexpr list
	| Sub of gexpr list
	| Exp of gexpr*gexpr
	| NatExp of gexpr
	| Deriv of gexpr

type grel = 
	| Eq of gexpr*gexpr

type genv = {
	rel: grel;
	inputs: string list;
	outputs: string list;
	params: (string*(gdecimal maybe)) list
}