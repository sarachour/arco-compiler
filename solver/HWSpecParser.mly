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

%type <HWData.hwire> wire
%type <hwterm> entry
%type <hwterm list> entrylist
%type <hwterm*(hwterm list)> join

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
   WIRE TOKEN SEMICOLON { let name = $2 in let hid = HWSymTbl.add st name in {id=(name,hid);conns=[]} }
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

entry:
   | TOKEN DOT TOKEN {let ename = $1 and eport = $3 in Port(ename,eport)}
   | TOKEN {let wname = $1 in Wire(wname)}

entrylist:
   |entry entrylist {let h = $1 and t = $2 in h::t}
   |entry {let h = $1 in [h]}
;

join:
   | JOIN entry TO entrylist SEMICOLON {let src = $2 and dest = $4 in 
      match (src,dest) with
      |(Wire(_),_) -> (src,dest)
      |(Port(_,_),[Wire(x)]) -> (Wire(x),[src])
      |_ -> raise (ParserError "cannot connect port to multiple wires with join command.") 
   }

schem:
   SCHEMATIC TOKEN OBRACE {
      let name = $2 in 
      let hid = HWSymTbl.add st name in 
      let nsc = HWSchem.create name hid in 
      (name,nsc)}
   | schem wire {
      let w = $2 and (n,sc) = $1 in 
      let nsc = HWSchem.add_wire sc w in
      (n,nsc)
   }
   | schem elem {
      let (name_elem,e) = $2 and (name_sch,sc) = $1 in 
      let nsc = HWSchem.add_elem sc name_elem e in 
      (name_sch,nsc)
   }

   | schem INPUT_PIN TOKEN SEMICOLON {
      let (name,sc) = $1 and n = $3 in 
      let nsc = HWSchem.add_input sc n nullid in
      (name,nsc)
   }

   | schem OUTPUT_PIN TOKEN SEMICOLON {
      let (name,sc) = $1 and n = $3 in 
      let nsc = HWSchem.add_output sc n nullid in
      (name,nsc)
   }

   | schem join {
      let (n,sc) = $1 and (src,dest) = $2 in 
         match src with
         | Wire(wire_name) -> let nsc =  HWSchem.add_joins sc wire_name dest in 
            (n,nsc)
         | _ -> raise (ParserError "cannot connect port to multiple wires with join command.") 
   }
   | schem CBRACE {let (n,sc) = $1 in (n,sc)}
;