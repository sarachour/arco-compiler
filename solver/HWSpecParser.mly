%{

open Printf
open HWData
open HWLib
open Util

exception ParserError of string;;

let arch = HWLib.HWArch.create()
let st = arch.st
let cmap: hwelem Util.StringMap.t ref = ref StringMap.empty

%}


%token <string> TOKEN
%token <float> DECIMAL
%token BEGIN
%token COLON EOF SEMICOLON OBRACE CBRACE VBAR DOT OPARAN CPARAN
%token COMPONENT SCHEMATIC AGG_COMPONENT SWITCH_COMPONENT WIRE JOIN ELEM
%token RELATION INPUT_PIN OUTPUT_PIN PARAM

%token MULT DIV ADD SUB EXP
%token EQ ASSIGN

%token COND MAP



%type <HWData.hwarch> main
%type <unit> toplevel

%type <HWData.hwschem> schem
%type <string*HWData.hwcomp> component
%type <string*HWData.hwelem> elem

%type <HWData.hwire> wire

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
      let s = $1 in
      arch.schem <- s;
   }

literal:
   | TOKEN DOT TOKEN {
      let prop = $3 and vname = $1 in
      match prop with
         |"V" -> Voltage (vname)
         |"I" -> Current (vname)
         | _ -> raise (ParserError ("Unknown property "^prop))
   }
   | TOKEN {
      let name = $1 in
      Parameter(name)
   }
;

expr_pe:
   | TOKEN OPARAN expr_as CPARAN {let name = $1 and arg = $3 in
      match name with
      |"exp" -> NatExp(arg)
      |"deriv" -> Deriv(arg)
      |_ -> raise (ParserError ("operand 1 function "^name^" not supported"))
   }
   | OPARAN expr_as CPARAN {let e = $2 in e}
   | expr_pe EXP expr_pe {let e1 = $1 and e2 = $3 in Exp(e1,e2)}
   | literal {let l = $1 in Literal(l)}
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

rel:
   | expr_as EQ expr_as {let e1 = $1 and e2 = $3 in Eq(e1,e2)}
;

component:
   | COMPONENT TOKEN OBRACE {
      let name = $2 in
      let hid = HWSymTbl.add st name in 
      let c = HWComp.create name hid in
      (name, c)
   }
   | component INPUT_PIN TOKEN SEMICOLON {
      let (name,c) = $1 and n = $3 in 
      let newc = HWComp.add_input c n nullid in
      (name,newc)
   }
   | component OUTPUT_PIN TOKEN SEMICOLON {
      let (name,c) = $1 and n = $3 in 
      let newc = HWComp.add_output c n nullid in
      (name,newc)
   }
   | component PARAM TOKEN SEMICOLON {
      let (name,c) = $1 and n = $3 in 
      let newc = HWComp.add_param c n None in
      (name,newc)
   }
   | component PARAM TOKEN DECIMAL SEMICOLON {
      let (name,c) = $1 and n = $3 and v = $4 in 
      let newc = HWComp.add_param c n (Some v) in
      (name,newc)
   }
   | component RELATION VBAR rel SEMICOLON {
      let (name,c) = $1 and r = $4 in 
      let newc = HWComp.add_constraint c r in
      (name,newc)
   }
   | component CBRACE {let (name,c) = $1 in (name,c)}  
;
wire:
   WIRE TOKEN SEMICOLON { let name = $2 in let hid = HWSymTbl.add st name in {id=hid;conns=[]} }
;

elem:
   ELEM TOKEN COLON TOKEN SEMICOLON {
      let kind = $4 in
      let name = $2 in
      let elem = Util.StringMap.find kind !(cmap) in
      let newelem = HWElem.clone (fun (n:string) -> HWSymTbl.add st n) elem in 
      (name,newelem)
   }
;

schem:
   SCHEMATIC TOKEN OBRACE {let name = $2 in let hid = HWSymTbl.add st name in HWSchem.create hid}
   | schem wire {let w = $2 and sc = $1 in HWSchem.add_wire sc w}
   | schem elem {let (n,e) = $2 and sc = $1 in HWSchem.add_elem sc n e}
   | schem CBRACE {$1}
;