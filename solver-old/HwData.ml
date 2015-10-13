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




type hwcomp = {
	mutable ports: hwsymbol list;
  mutable params: (string*float) list;
	mutable relations: hwrel list;
  mutable spice: string;
  mutable name: string;
}



type 'a hwschemT = {
   mutable elems : 'a list;
   mutable ports: hwsymbol list;
   mutable name: string;
}

type hwelem =
   | Component of hwcomp
   | Schematic of hwelem hwschemT

type hwschem = hwelem hwschemT

type hwconfig =
   | None


type hwarch = {
   mutable schem: hwschem;

}
