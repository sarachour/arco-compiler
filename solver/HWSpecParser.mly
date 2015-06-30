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
%token COLON EOF SEMICOLON OBRACE CBRACE
%token COMPONENT SCHEMATIC AGG_COMPONENT SWITCH_COMPONENT WIRE JOIN
%token RELATION INPUT_PIN OUTPUT_PIN PARAM
%token COND MAP



%type <HWData.hwarch> main

%type <HWData.hwschem> schem
%type <HWData.hwcomp> component

%type <HWData.hwire> wire


%start main

%%


main:
   | component main {let c = $1 in cmap := Util.StringMap.add "comp" (Component c) !(cmap); arch}
   | schem main {arch.schem <- $1; arch}
   | EOF {arch}
;

component:
   | COMPONENT TOKEN OBRACE {let hid = HWSymTbl.add st "comp" $2 in HWComp.create hid}
   | component CBRACE {$1}  
;
wire:
   WIRE TOKEN SEMICOLON { let hid = HWSymTbl.add st "wire" $2 in {id=hid;conns=[]} }
;

schem:
   SCHEMATIC TOKEN OBRACE {let hid = HWSymTbl.add st "schem" $2 in HWSchem.create hid}
   | schem wire {let w = $2 and sc = $1 in HWSchem.add_wire sc w}
   | schem CBRACE {$1}
;