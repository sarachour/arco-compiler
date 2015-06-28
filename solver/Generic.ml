open Util

type gid = int*(string maybe)
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
	| Deriv of gliteral