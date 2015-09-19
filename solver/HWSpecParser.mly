%{

open Printf
open HWData
open HWLib
open Util

exception ParserError of string;;

type meta = {
   mutable syms: hwsymbol list;
   ns: string
}
let arch = HWLib.HWArch.create()
let cmap: hwelem Util.StringMap.t ref = ref StringMap.empty

let meta_data: meta = {syms=[]; ns=""}

let _meta : meta ref = ref meta_data

let meta_clear ns =
   _meta := {syms=[]; ns=ns}

let meta_put (n:hwsymbol) =
   (!_meta).syms <- (Namespace ((!_meta).ns,n))::(!_meta).syms

let meta_get (n:string) : hwsymbol option=
   let rec names_match e = match e with
   | Input(x) -> x = n
   | Output(x) -> x = n
   | Param(x) -> x = n
   | FixedParam(x,v) -> x = n
   | Namespace(v,x) -> names_match x
   in
   match List.filter names_match (!_meta).syms with
      |[] -> None
      |[h] -> Some(h)
      |_ -> raise (ParserError "too many defined symbols.")

let meta_ns () =
   (!_meta).ns

%}



%token <string> TOKEN
%token <float> DECIMAL
%token <int> INTEGER
%token BEGIN
%token COLON EOF SEMICOLON OBRACE CBRACE VBAR DOT OPARAN CPARAN
%token COMPONENT SCHEMATIC AGG_COMPONENT SWITCH_COMPONENT WIRE JOIN ELEM TO
%token RELATION INPUT_PIN OUTPUT_PIN PARAM

%token MULT DIV ADD SUB EXP
%token EQ ASSIGN

%token COND MAP



%type <HWData.hwarch> main
%type <unit> toplevel

%type <string*HWData.hwschem> schem
%type <string*HWData.hwcomp> component
%type <string*HWData.hwelem> elem


%type <HWData.hwrel> rel
%type <HWData.hwexpr> expr_pe
%type <HWData.hwexpr> expr_md
%type <HWData.hwexpr> expr_as
%type <HWData.hwliteral> literal


%start main

%%


main:
   | toplevel {arch}
   | main toplevel {arch}
;

toplevel:
   | component {
      let (name,c) = $1 in
         cmap := Util.StringMap.add name (Component c) !(cmap);
   }
   | schem {
      let (name,s) = $1 in
      if name = "main" then
         arch.schem <- s
      else
         cmap := Util.StringMap.add name (Schematic s) !(cmap);
   }

literal:
   | TOKEN DOT TOKEN {
      let prop = $3 and vname = $1 in
      match meta_get vname with
      | Some(x) ->
         begin
         match prop with
            |"V" -> Voltage (x)
            |"I" -> Current (x)
            | _ -> raise (ParserError ("Unknown property "^prop))
         end
      | None -> raise (ParserError ("Symbol not found "^vname))
   }
   | TOKEN {
      let name = $1 in
      match meta_get name with
      | Some(x) -> Voltage (x)
      | None -> raise (ParserError ("Symbol not found "^name))
   }
;
expr_nl:
   | literal {let l = $1 in Literal(l)}
   | DECIMAL {let d = $1 in Decimal(d)}
   | INTEGER {let i = $1 in Integer(i)}

expr_pe:
   | TOKEN OPARAN expr_as CPARAN {let name = $1 and arg = $3 in
      match name with
      |"exp" -> NatExp(arg)
      |"deriv" -> Deriv(arg)
      |_ -> raise (ParserError ("operand 1 function "^name^" not supported"))
   }
   | OPARAN expr_as CPARAN {let e = $2 in e}
   | expr_pe EXP expr_pe {let e1 = $1 and e2 = $3 in Exp(e1,e2)}
   | expr_nl {let e = $1 in e}
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
         | Sub(a) -> Sub(e2::a)
         | _ -> Sub([e1;e2])
      }
;

rel:
   | expr_as EQ expr_as {let e1 = $1 and e2 = $3 in Eq(e1,e2)}
;

component:
   | COMPONENT TOKEN OBRACE {
      let name = $2 in
      let c = HWComp.create name in
      meta_clear name;
      (name, c)
   }
   | component INPUT_PIN TOKEN SEMICOLON {
      let (name,c) = $1 and n = $3 in
      let newc = HWComp.add_input c n in
      meta_put (Input n);
      (name,newc)
   }
   | component OUTPUT_PIN TOKEN SEMICOLON {
      let (name,c) = $1 and n = $3 in
      let newc = HWComp.add_output c n in
      meta_put (Output n);
      (name,newc)
   }
   | component PARAM TOKEN SEMICOLON {
      let (name,c) = $1 and n = $3 in
      let newc = HWComp.add_param c n None in
      meta_put (Param n);
      (name,newc)
   }
   | component PARAM TOKEN DECIMAL SEMICOLON {
      let (name,c) = $1 and n = $3 and v = $4 in
      let newc = HWComp.add_param c n (Some v) in
      meta_put (FixedParam(n,v));
      (name,newc)
   }
   | component RELATION VBAR rel SEMICOLON {
      let (name,c) = $1 and r = $4 in
      let newc = HWComp.add_constraint c r in
      (name,newc)
   }
   | component CBRACE {let (name,c) = $1 in (name,c)}
;

elem:
   ELEM TOKEN COLON TOKEN SEMICOLON {
      let kind = $4 in
      let name = $2 in
      let _ = Printf.printf "%s\n" kind in
      try
        let elem = Util.StringMap.find kind !(cmap) in
        let newelem = HWElem.clone elem in
        (name,newelem)
      with
        Not_found -> raise (ParserError ("elem/Not_found: component with name <"^kind^"> not defined."))
   }
;


schem:
   SCHEMATIC TOKEN OBRACE {
      let name = $2 in
      let nsc = HWSchem.create name in
      (name,nsc)
   }
   | schem elem {
      let (name_elem,e) = $2 and (name_sch,sc) = $1 in
      let nsc = HWSchem.add_elem sc name_elem e in
      (name_sch,nsc)
   }

   | schem INPUT_PIN TOKEN SEMICOLON {
      let (name,sc) = $1 and n = $3 in
      let nsc = HWSchem.add_input sc n in
      (name,nsc)
   }

   | schem OUTPUT_PIN TOKEN SEMICOLON {
      let (name,sc) = $1 and n = $3 in
      let nsc = HWSchem.add_output sc n in
      (name,nsc)
   }
   | schem CBRACE {let (n,sc) = $1 in (n,sc)}
;
