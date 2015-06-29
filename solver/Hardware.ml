open Util

type hwid = id
type decimal = float 

type hwliteral = 
	| IVoltage of hwid
	| ICurrent of hwid
	| OVoltage of hwid
	| OCurrent of hwid

type hwexpr = 
	| NatExp of hwexpr
	| Exp of hwexpr*hwexpr
	| Div of hwexpr*hwexpr
	| Mult of hwexpr list
	| Add of hwexpr list
	| Sub of hwexpr list
	| CVoltage of decimal
	| CCurrent of decimal
	| Wildcard
	| Literal of hwliteral
	| Deriv of hwexpr


type hwcond = 
   | Eq of hwid
   | And of hwcond list
   | Or of hwcond list

type hwrel = 
	| Eq of hwexpr*hwexpr (*Equality with effects*)
   | Set of hwliteral*hwexpr (* Set the output to something equivalent *)
   | Switch of (hwcond*hwrel) list 

type hwcomp = {
	mutable inputs: hwid list;
	mutable output: hwid list;
   mutable params: hwid list;
	mutable relations: hwrel list;
	id: hwid
}

type hwinst = int*hwid 

(* defines a type of connection allowed *)
type hwrule = 
   | CompToComp of hwcomp*hwid*hwcomp*hwid
   | InstanceToInstance of hwinst*hwid*hwinst*hwid
   | AllOutputToInput
   | AllToAll

type hwconn = {
   src: hwinst*hwid;
   sink: hwinst*hwid;
}

type hwchip = {
   mutable st: SymbolTable.symtable;
	mutable components: hwcomp list;
	mutable instances: hwinst list;
   mutable rules: hwrule list;
}


module Chip :
sig
   val create : unit -> hwchip
   val add_component: hwchip -> hwcomp -> int -> hwchip
   val add_rule: hwchip -> hwrule -> hwchip

end =
struct
   let create () = {instances=[]; components=[];rules=[];st=SymbolTable.create()}
   let add_component c comp qty = 
   	let rec make_inst cid qty = 
   		match qty with
   			| 0 -> []
   			| n -> (n, cid)::(make_inst cid (n-1))
   	in
   	let cid = comp.id in
   		c.components <- comp::c.components;
   		c.instances <- (make_inst cid qty) @ c.instances;
   		c

   let add_rule c r =
      c.rules <- r::c.rules; c

end