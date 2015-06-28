open Util

type hwid = int*(string maybe)
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
	| Deriv of hwliteral

type hwrel = 
	| Eq of hwexpr*hwexpr

type component = {
	mutable inputs: hwid list;
	mutable output: hwid list;
	mutable relations: hwrel list;
	id: hwid
}

type chip = {
	mutable components: component list;
	mutable instances: (int*hwid) list;
}


module Chip :
sig
   val create : unit -> chip
   val add_component: chip -> component -> int -> chip
end =
struct
   let create () = {instances=[]; components=[];}
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
end