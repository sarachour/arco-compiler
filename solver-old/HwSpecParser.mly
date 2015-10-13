%{

open Printf
open HwData
open HwLib
open Util

exception ParserError of string;;
type kind =
  | KInput of string
  | KOutput of string
  | KParam of string

type meta = {
   mutable syms: kind list;
   mutable name: string;
}

let arch = HwLib.HwArch.create()
let cmap: hwelem Util.StringMap.t ref = ref StringMap.empty

let meta_data: meta = {syms=[];name="";}

let _meta : meta ref = ref meta_data

let meta_clear ns =
   _meta := {syms=[];name=ns}

let meta_put (n:kind) =
   (!_meta).syms <- n::(!_meta).syms

let meta_get (n:string) : kind option=
   let rec var_names_match e = match e with
   | KInput(x) -> x = n
   | KOutput(x) -> x = n
   | KParam(x) -> x = n
   in
   let matchv = List.filter var_names_match (!_meta).syms in
   match (matchv) with
      |[] -> None
      |[h] -> Some(h)
      |_ -> raise (ParserError "too many defined symbols.")


let meta_name () : string =
  (!_meta).name
%}



%token <string> TOKEN
%token <float> DECIMAL
%token <int> INTEGER
%token <string> STRING
%token BEGIN
%token DOLLAR COLON EOF SEMICOLON OBRACE CBRACE VBAR DOT OPARAN CPARAN
%token COMPONENT SPICE SCHEMATIC AGG_COMPONENT SWITCH_COMPONENT WIRE JOIN ELEM TO
%token RELATION INPUT_PIN OUTPUT_PIN PARAM

%token MULT DIV ADD SUB EXP
%token EQ ASSIGN

%token COND MAP



%type <HwData.hwarch> main
%type <unit> toplevel

%type <string*HwData.hwschem> schem
%type <string*HwData.hwcomp> component
%type <string*HwData.hwelem> elem


%type <HwData.hwrel> rel
%type <HwData.hwexpr> expr_pe
%type <HwData.hwexpr> expr_md
%type <HwData.hwexpr> expr_as
%type <HwData.hwliteral> literal


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
           let vprop = HwUtil.str2hwprop prop in
           let cnm = meta_name() in
           begin
           match x with
           | KInput(nm) -> Var(vprop, Input (HwUtil.mkportid nm cnm None) )
           | KOutput(nm) -> Var(vprop, Output (HwUtil.mkportid nm cnm None))
           | KParam(nm) -> raise (ParserError ("Symbol with property cannot be parameter <"^nm^">"))
           end
      | None -> raise (ParserError ("Symbol not found <"^vname^">"))
   }
   | TOKEN {
      let name = $1 in
      match meta_get name with
      | Some(KParam(nm)) -> Param(name)
      | Some(_) -> raise (ParserError ("Variable must reference property carry property <"^name^">"))
      | None -> raise (ParserError ("Symbol not found <"^name^">"))
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
      let c = HwComp.create name in
      meta_clear name;
      (name, c)
   }
   | component INPUT_PIN TOKEN SEMICOLON {
      let (name,c) = $1 and n = $3 in
      let newc = HwComp.add_input c n in
      meta_put (KInput n);
      (name,newc)
   }
   | component OUTPUT_PIN TOKEN SEMICOLON {
      let (name,c) = $1 and n = $3 in
      let newc = HwComp.add_output c n in
      meta_put (KOutput n);
      (name,newc)
   }
   | component PARAM TOKEN SEMICOLON {
      raise (ParserError "HWSpec: Parameter must be set")
   }
   | component PARAM TOKEN DECIMAL SEMICOLON {
      let (name,c) = $1 and n = $3 and v = $4 in
      let newc = HwComp.add_param c n v in
      meta_put (KParam(n));
      (name,newc)
   }
   | component RELATION COLON rel SEMICOLON {
      let (name,c) = $1 and r = $4 in
      let newc = HwComp.add_constraint c r in
      (name,newc)
   }
   | component SPICE COLON STRING SEMICOLON {
      let (name,c) = $1 and r = $4 in
      let newc = HwComp.set_spice c r in
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
        let newelem = HwElem.clone elem in
        (name,newelem)
      with
        Not_found -> raise (ParserError ("elem/Not_found: component with name <"^kind^"> not defined."))
   }
;


schem:
   SCHEMATIC TOKEN OBRACE {
      let name = $2 in
      let nsc = HwSchem.create name in
      (name,nsc)
   }
   | schem elem {
      let (name_elem,e) = $2 and (name_sch,sc) = $1 in
      let nsc = HwSchem.add_elem sc name_elem e in
      (name_sch,nsc)
   }

   | schem INPUT_PIN TOKEN SEMICOLON {
      let (name,sc) = $1 and n = $3 in
      let nsc = HwSchem.add_input sc n in
      (name,nsc)
   }

   | schem OUTPUT_PIN TOKEN SEMICOLON {
      let (name,sc) = $1 and n = $3 in
      let nsc = HwSchem.add_output sc n in
      (name,nsc)
   }
   | schem CBRACE {let (n,sc) = $1 in (n,sc)}
;
