open Relation
open Yojson
open Util

type flow = Forward|Backward
type op = Plus|Minus

type id = int*string maybe


type 'a block= 
   | SMTHole of id*relation*relation
   | Capacitor of id*float
   | Ground 
   | Joint of id*('a list)
   | Adder of id*('a list)
   | Multiplier of id*('a list)

type wire = 
   | Wire of id*(wire block)*(wire block)*flow

type kind = 
   | SMTHole
   | Capacitor
   | Ground
   | Joint
   | Adder
   | Multiplier
   | Wire


type circuit = {
   mutable blocks : (wire block) list;
   mutable wires : (wire) list;
}

module Circuit :
sig
   val create : unit -> circuit
   (*get elements*)
   val get_wire : circuit -> string -> wire maybe
   val find_wire : circuit -> string -> string -> wire maybe
   val get_block : circuit -> kind -> string -> wire block maybe
   (*add elements*)
   val add_wire : circuit -> wire -> circuit
   val add_block : circuit -> wire block -> circuit
   (*export as string*)
   val to_string : circuit -> string
   val to_json : circuit -> string
end = 
struct
   let create() = {blocks=[];wires=[]}
   let get_wire c n = None
   let find_wire c a b = None
   let get_block c k s = None
   let add_wire c w = c 
   let add_block c co = c 
   let to_string c = ""
   let to_json c = ""

end