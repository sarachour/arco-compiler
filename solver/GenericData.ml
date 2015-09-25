open Util



type gsymbol =
  | Param of string*float
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
	| Decimal of float
	| Integer of int
	| Paren of gexpr

type grel =
	| Eq of gexpr*gexpr

type genv = {
	rels: grel list;
	syms: gsymbol list;
	ns: string
}
