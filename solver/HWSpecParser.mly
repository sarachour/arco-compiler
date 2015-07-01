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
%token BEGIN
%token COLON EOF SEMICOLON OBRACE CBRACE
%token COMPONENT SCHEMATIC AGG_COMPONENT SWITCH_COMPONENT WIRE JOIN ELEM
%token RELATION INPUT_PIN OUTPUT_PIN PARAM
%token COND MAP



%type <HWData.hwarch> main
%type <unit> toplevel

%type <HWData.hwschem> schem
%type <HWData.hwcomp> component
%type <HWData.hwelem> elem

%type <HWData.hwire> wire


%start main

%%


main:
   | toplevel {arch}   
   | main toplevel {arch}
;

toplevel:
   | component {
      let c = $1 in 
         cmap := Util.StringMap.add "comp" (Component c) !(cmap); 
   }
   | schem {
      let s = $1 in
      arch.schem <- s;
   }

component:
   | COMPONENT TOKEN OBRACE {let hid = HWSymTbl.add st "comp" $2 in HWComp.create hid}
   | component CBRACE {let c = $1 in c}  
;
wire:
   WIRE TOKEN SEMICOLON { let hid = HWSymTbl.add st "wire" $2 in {id=hid;conns=[]} }
;

elem:
   ELEM TOKEN COLON TOKEN SEMICOLON {
      let kind = $4 in
      let name = $2 in
      let comp = Util.StringMap.find kind !(cmap) in
      comp
   }
;

schem:
   SCHEMATIC TOKEN OBRACE {let hid = HWSymTbl.add st "schem" $2 in HWSchem.create hid}
   | schem wire {let w = $2 and sc = $1 in HWSchem.add_wire sc w}
   | schem elem {let e = $2 and sc = $1 in HWSchem.add_elem sc e}
   | schem CBRACE {$1}
;