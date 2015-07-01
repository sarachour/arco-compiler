open Util


exception HWDataException of string;;
(* Hardware Identifiers *)
type hwid = 
   |InputPin of id
   |OutputPin of id
   |Component of id
   |AggregateComponent of id
   |SwitchComponent of id
   |Wire of id
   |Parameter of id
   |Schematic of id
   |AnalogInput of id
   |AnalogOutput of id 
   |Null 

module HWSymTbl : 
sig
  type symtable = {
    mutable fid: int ref;
    mutable map: hwid StringMap.t ref;
  }
  val create : unit -> symtable 
  val get_id : hwid -> id
  val get_by_name : symtable -> string -> string -> hwid maybe
  val get_by_id : symtable -> string -> int -> hwid maybe
  val add : symtable -> string -> string -> hwid 
  val make : symtable -> string -> hwid 
end = 
struct
  type symtable = {
    mutable fid: int ref;
    mutable map: hwid StringMap.t ref;
  }
  let create() = {fid=(ref 0); map=(ref StringMap.empty)}
  
  let gen (kind:string) (name:string) (i:int) : hwid = match kind with
      | "in" -> InputPin(i, Some ("in_"^name))
      | "out" -> OutputPin(i, Some ("out_"^name))
      | "comp" -> Component(i, Some ("comp_"^name))
      | "agg" -> AggregateComponent(i, Some ("acomp_"^name))
      | "switch" -> SwitchComponent(i, Some ("swcomp_"^name))
      | "wire" -> Wire(i, Some ("w_"^name))
      | "param" -> Parameter(i, Some ("p_"^name))
      | "schem" -> Schematic(i, Some ("schem_"^name))
      | "gin" -> AnalogInput(i, Some ("gin_"^name))
      | "gout" -> AnalogOutput(i, Some ("gout_"^name))
      | _ -> raise (HWDataException ("Unknown kind: "^kind))
   
  let get_id (id:hwid) : id = match id with
      | InputPin(x) -> x
      | OutputPin(x) -> x
      | Component(x) -> x
      | AggregateComponent(x) -> x
      | SwitchComponent(x) -> x
      | Wire(x) -> x
      | Parameter(x) -> x
      | Schematic(x) -> x
      | AnalogInput(x) -> x
      | AnalogOutput(x) -> x
      | Null -> (-1,None)

  let add s kind name = 
    let fid = s.fid in
    let id = gen kind name (!fid) in
    match get_id id with
      | (_, Some(n)) ->
         begin
          fid := !fid + 1;
          s.map := StringMap.add n id !(s.map);
          id
         end 
      | _ -> raise (HWDataException "Must have name.")

  let make s = add s ("v"^(string_of_int !(s.fid)))
  let get_by_name s kind name : hwid maybe = 
      match get_id (gen kind name 0) with
         | (_, Some(kname)) -> Some(StringMap.find kname !(s.map))
         | _ -> None

  let get_by_id s kind id : hwid maybe = 
      match get_id (gen kind ("v"^(string_of_int id)) 0) with
         | (_, Some(kname)) -> Some(StringMap.find kname !(s.map))
         | _ -> None

end


type decimal = float 
type hwparam = string*(decimal maybe)

(* Hardware Logic *)

type hwliteral = 
	| Voltage of string
	| Current of string
   | Parameter of string

type hwexpr = 
	| NatExp of hwexpr
	| Exp of hwexpr*hwexpr
	| Div of hwexpr*hwexpr
	| Mult of hwexpr list
	| Add of hwexpr list
	| Sub of hwexpr list
	| Literal of hwliteral
	| Deriv of hwexpr

type hwrel = 
   | Eq of hwexpr*hwexpr (*Equality with effects*)
   | Set of hwliteral*hwexpr (* Set the output to something equivalent, treated as a new terminal *)

(* Hardware Conditions *)
type hwcond_digital = 
   | HIGH of hwid 
   | LOW of hwid 

type hwcond_analog = 
   |GreaterThanEq of hwid*decimal
   |LessThanEq of hwid*decimal
   |Between of hwid*decimal*decimal

type hwcond = 
   | Digital of hwcond_digital
   | Analog of hwcond_analog
   | And of hwcond*hwcond
   | Or of hwcond*hwcond


type hwcomp = {
	mutable inputs: (string*hwid) list;
	mutable outputs: (string*hwid) list;
   mutable params: hwparam list;
	mutable constraints: hwrel list;
   id: hwid;
}

type hwcomp_agg = {
   mutable inputs: (string*hwid) list;
   mutable outputs: (string*hwid) list;
   mutable params: hwparam list;
   mutable conns : (string*string) list;
   mutable subcomps : hwcomp list;
   id: hwid;
}

type hwcomp_switch = {
   mutable inputs: (string*hwid) list;
   mutable outputs: (string*hwid) list;
   mutable params: hwparam list;
   mutable conns : (hwcond*(hwid*hwid)) list;
   mutable subcomps : hwcomp list;
   id: hwid;
}

type hwire = {
   id : hwid;
   conns: hwid list;
}

type 'a hwschemT = {
   mutable elems : 'a list;
   mutable wires : hwire list;
   mutable inputs: hwid list;
   mutable outputs: hwid list;
   id : hwid;
}

type hwinput = {
   id:hwid   
}

type hwoutput = {
   id:hwid   
}
type hwelem = 
   | Component of hwcomp
   | AggComponent of hwcomp_agg
   | SwitchComponent of hwcomp_switch
   | Schematic of hwelem hwschemT
   | AnalogInput of hwinput
   | AnalogOutput of hwoutput

type hwschem = hwelem hwschemT

type hwconfig = 
   | Constraints of hwconfig list
   | Fuse of hwid*hwid
   | Set of hwid*decimal


type hwarch = {
   mutable st: HWSymTbl.symtable;
   mutable schem: hwschem;

}

