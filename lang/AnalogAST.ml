open Relation
open Yojson
open Util

type flow = Forward|Backward;;
type marker = Input|Output;;
type hint = Adder | Multiplier;;

type id = int*string maybe


type 'a block= 
   | SMTHole of id*relation*relation*hint
   | Capacitor of id*float
   | Ground of id
   | Joint of id*('a list)

type wire = 
   | Wire of id*id*id*flow

type kind = 
   | SMTHole
   | Capacitor
   | Ground
   | Joint


type circuit = {
   mutable blocks : (wire block) list;
   mutable wires : (wire) list;
   mutable inputs: id list;
   mutable outputs: id list;
   mutable id: id;
}

type system = {
   mutable circuits : circuit list;
   mutable wires : (wire) list;
   mutable inputs: id list;
   mutable outputs: id list;
   mutable id: id;
}

module Circuit :
sig
   val create : id -> circuit
   (*get elements*)
   val get_wire : circuit -> id -> wire maybe
   val get_block : circuit -> kind -> id -> wire block maybe
   (*add elements*)
   val add_wire : circuit -> wire -> marker maybe-> circuit
   val add_block : circuit -> wire block -> circuit
   (*export as string*)
   val to_string : circuit -> string
   val to_json : circuit -> string
end = 
struct
   let create i = {blocks=[];wires=[];inputs=[];outputs=[];id=i}
   let get_wire c id = None
   let get_block c k id = None
   let add_wire c w m = c 
   let add_block c b = c 
   let to_string c = ""
   let to_json c = ""

end

module System :
sig
   val create : id -> system
   (*get elements*)
   val add_wire : system -> wire -> marker maybe-> system
   val get_circuit : system -> id -> circuit maybe
   (*add elements*)
   val get_wire : system -> id -> wire maybe
   val add_circuit : system -> circuit -> system
   (*export as string*)
   val to_string : system -> string
   val to_json : system -> string
end = 
struct
   let create i = {circuits=[];wires=[];inputs=[];outputs=[];id=i}
   let get_circuit c id = None
   let add_circuit c w = c 
   let update_circuit c w = c
   let get_wire c id = None
   let add_wire c w m = c 
   let to_string c = ""
   let to_json c = ""

end