open Util


exception HWDataException of string;;
(* Hardware Identifiers *)
type hwid = id
let nullid : hwid = (0,None)

module HWSymTbl :
sig
  type symtable = {
    mutable fid: int ref;
    mutable map: hwid StringMap.t ref;
  }
  val create : unit -> symtable
  val add : symtable -> string -> hwid
  val make : symtable -> hwid
end =
struct
  type symtable = {
    mutable fid: int ref;
    mutable map: hwid StringMap.t ref;
  }
  let create() = {fid=(ref 1); map=(ref StringMap.empty)}

  let add (s:symtable) (n:string) =
   let fid = s.fid in
   let id = (!fid,Some(n)) in
   fid := !fid + 1;
   s.map := StringMap.add (string_of_int (!fid)) id !(s.map);
   id

  let make s = add s ("v"^(string_of_int (!(s.fid)) ) )

end


type hwdecimal = float
type hwint = int
type hwvar = string
(* Hardware Logic *)

type hwsymbol =
  | Param of hwvar
  | FixedParam of hwvar*hwdecimal
  | Input of hwvar
  | Output of hwvar
  | Namespace of hwvar*hwsymbol

type hwliteral =
	| Voltage of hwsymbol
	| Current of hwsymbol

type hwexpr =
  | NatExp of hwexpr
  | Exp of hwexpr*hwexpr
  | Div of hwexpr*hwexpr
  | Mult of hwexpr list
  | Add of hwexpr list
  | Sub of hwexpr list
  | Literal of hwliteral
  | Deriv of hwexpr
  | Decimal of hwdecimal
  | Integer of hwint

type hwrel =
   | Eq of hwexpr*hwexpr (*Equality with effects*)
   | Set of hwliteral*hwexpr (* Set the output to something equivalent, treated as a new terminal *)



(* Hardware Conditions *)
(*
type hwcond_digital =
   | HIGH of hwid
   | LOW of hwid

type hwcond_analog =
   |GreaterThanEq of hwid*hwdecimal
   |LessThanEq of hwid*hwdecimal
   |Between of hwid*hwdecimal*hwdecimal

type hwcond =
   | Digital of hwcond_digital
   | Analog of hwcond_analog
   | And of hwcond*hwcond
   | Or of hwcond*hwcond
*)

type hwcomp = {
	mutable ports: hwsymbol list;
	mutable relations: hwrel list;
  mutable spice: string;
  mutable ns: string;
}


(*
type hwcomp_agg = {
   mutable inputs: (string*hwid) list;
   mutable outputs: (string*hwid) list;
   mutable params: hwparam list;
   mutable conns : (string*string) list;
   mutable subcomps : hwcomp list;
   mutable id: string*hwid;
}

type hwcomp_switch = {
   mutable inputs: (string*hwid) list;
   mutable outputs: (string*hwid) list;
   mutable params: hwparam list;
   mutable conns : (hwcond*(hwid*hwid)) list;
   mutable subcomps : hwcomp list;
   mutable id: string*hwid;
}
type hwterm =
   |Wire of string
   |Port of string*string

type hwire = {
   id : string*hwid;
   mutable conns: hwterm list;
}
*)

type 'a hwschemT = {
   mutable elems : 'a list;
   (*mutable wires : hwire list;*)
   mutable ports: hwsymbol list;
   mutable ns: string;
}
(*
type hwinput = {
   id:hwid
}

type hwoutput = {
   id:hwid
}
*)
type hwelem =
   | Component of hwcomp
   (*
   | AggComponent of hwcomp_agg
   | SwitchComponent of hwcomp_switch
    *)
   | Schematic of hwelem hwschemT
   (*
   | AnalogInput of hwinput
   | AnalogOutput of hwoutput
  *)
type hwschem = hwelem hwschemT

type hwconfig =
   | None


type hwarch = {
   mutable schem: hwschem;

}
