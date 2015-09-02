%{

open Printf
open GenericData
open GenericLib
open Util

exception ParserError of string;;

type meta = {
   mutable syms: gsymbol list;
   mutable rel: grel option;
   ns: string;
}

let meta_data: meta = {syms=[]; ns=""; rel=None}

let _meta : meta ref = ref meta_data

let meta_clear ns = 
   _meta := {syms=[]; ns=ns;rel=None}

let meta_put (n:gsymbol) =
   (!_meta).syms <-  n::(!_meta).syms 

let meta_set_rel (n:grel) = 
   (!_meta).rel <- Some(n)

let meta_get (n:string) : gsymbol option= 
   let rec names_match e = match e with
   | Input(x) -> x = n
   | Output(x) -> x = n
   | Param(x) -> x = n
   | FixedParam(x,v) -> x = n
   in
   match List.filter names_match (!_meta).syms with 
      |[] -> None 
      |[h] -> Some(h)
      |_ -> raise (ParserError "too many defined symbols.")

let meta_get_syms () : gsymbol list = 
   (!_meta).syms

let meta_ns () =
   (!_meta).ns

let meta_get_rel () = 
   (!_meta).rel

%}


%token <string> TOKEN
%token <float> DECIMAL
%token <int> INTEGER
%token NAMESPACE INP OUTP PARAM VAR
%token SEMICOLON 
%token COMMA

%token MULT DIV ADD SUB EXP OPARAN CPARAN
%token EQ ASSIGN
%token EOF



%type <GenericData.genv> main

%type <unit> toplevel
%type <GenericData.grel> rel
%type <GenericData.gexpr> expr_pe
%type <GenericData.gexpr> expr_md
%type <GenericData.gexpr> expr_as
%type <GenericData.gliteral> literal


%start main

%%

main:
   toplevel {
      let rel = meta_get_rel() in 
      match rel with 
         | Some(x) -> 
            let ns = meta_ns() in
            let ports = meta_get_syms() in 
            {ns=ns;ports=ports;rel=x}
         | None ->
            raise (ParserError ("no relation defined")) 
   }

toplevel:
   | NAMESPACE TOKEN SEMICOLON {let ns = $2 in meta_clear ns}  
   | toplevel INP TOKEN SEMICOLON {let name = $3 in meta_put (Input name)}
   | toplevel VAR TOKEN SEMICOLON {let name = $3 in meta_put (Input name)}
   | toplevel OUTP TOKEN SEMICOLON {let name = $3 in meta_put (Output name)}
   | toplevel PARAM TOKEN SEMICOLON {let name = $3 in meta_put (Param name)}
   | toplevel PARAM TOKEN EQ DECIMAL SEMICOLON {
      let name = $3 and value = $5 in meta_put (FixedParam(name,value))
   }
   | toplevel rel SEMICOLON {
      let rel = $2 in meta_set_rel (rel)
   }
;

literal:
   | TOKEN {
      let name = $1 in
      match meta_get name with 
      | Some(x) -> Symbol(x)
      | None -> raise (ParserError ("Symbol not found "^name)) 
   }
   
;

expr_pe:
   | TOKEN OPARAN expr_as CPARAN {let name = $1 and arg = $3 in
      match name with
      |"exp" -> NatExp(arg)
      |"deriv" -> Deriv(arg)
      |_ -> raise (ParserError ("operand 1 function "^name^" not supported"))
   }
   | INTEGER {
      let value = $1 in Integer(value)
   }
   | DECIMAL {
      let value = $1 in Decimal(value)
   }
   | OPARAN expr_as CPARAN {let e = $2 in e}
   | expr_pe EXP expr_pe {let e1 = $1 and e2 = $3 in Exp(e1,e2)}
   | literal {let l = $1 in Literal(l)}
   | TOKEN OPARAN expr_pe CPARAN 
	{
		let fxn = $1 and arg = $3 in 
		match fxn with 
		| "exp" -> NatExp(arg)
		| "deriv" -> Deriv(arg)
		| _ -> raise (ParserError ("1-arg function with name "^fxn^" not supported"))
	}
	

;

expr_md:
   | expr_md MULT expr_pe {let e1 = $1 and e2 = $3 in 
      match e1 with 
         | Mult(a) -> Mult(e2::a)
         | _ -> Mult([e1;e2])
      } 
   | expr_pe DIV expr_pe {let e1 = $1 and e2 = $3 in Div(e1,e2)}
   | expr_pe {let e = $1 in e}
;

expr_as:
   | expr_md {let e = $1 in e}
   | expr_as ADD expr_md {let e1 = $1 and e2 = $3 in 
      match e1 with 
         | Add(a) -> Add(e2::a)
         | _ -> Add([e1;e2])
      } 
   | expr_as SUB expr_md {let e1 = $1 and e2 = $3 in 
      match e1 with 
         | Add(a) -> Add(e2::a)
         | _ -> Add([e1;e2])
      } 
;

expr_top:
   | expr_as {let e = $1 in e}
   
rel:
   | expr_as EQ expr_as {let e1 = $1 and e2 = $3 in Eq(e1,e2)}
;
