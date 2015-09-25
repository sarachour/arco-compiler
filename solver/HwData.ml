open Util


exception HWDataException of string;;
(* Hardware Identifiers *)


type inst = Any | Instance of int
type compid = string*inst
type portid = string*compid
(* Hardware Logic *)

type hwprop =
  Current | Voltage

type hwsymbol =
  | Input of portid
  | Output of portid
  | Namespace of string*hwsymbol

type hwliteral =
	| Var of hwprop*hwsymbol
  | Param of string

type hwexpr =
  | NatExp of hwexpr
  | Exp of hwexpr*hwexpr
  | Div of hwexpr*hwexpr
  | Mult of hwexpr list
  | Add of hwexpr list
  | Sub of hwexpr list
  | Literal of hwliteral
  | Deriv of hwexpr
  | Decimal of float
  | Integer of int

type hwrel =
   | Eq of hwexpr*hwexpr (*Equality with effects*)



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
  mutable params: (string*float) list;
	mutable relations: hwrel list;
  mutable spice: string;
  mutable name: string;
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
   mutable name: string;
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
