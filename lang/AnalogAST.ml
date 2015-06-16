open Relation
open Yojson

type wire

type sign = Plus | Minus

type port = string

type block= 
   | AnalogAdder
   | AnalogMultiplier 
   | GenericComponent of relation
   | Capacitor of float
   | Ground 
   | Split
   | Join

type component = string*block

type kind = 
   | AnalogAdder
   | AnalogMultiplier
   | GenericComponent
   | Capacitor
   | Ground
   | Split
   | Join
   | CurrentGenerator


type wire = {
   name : string;
   a : component;
   b : component;
}

type circuit = {
   mutable comps : (component) list;
   mutable wires : (wire) list;
}

module Circuit :
sig
   val create : unit -> circuit
   (*get elements*)
   val get_wire : circuit -> string -> wire maybe
   val find_wire : circuit -> string -> string -> wire maybe
   val get_component : circuit -> kind -> string -> component maybe
   (*add elements*)
   val add_wire : circuit -> wire -> circuit
   val add_component : circuit -> component -> circuit
   (*export as string*)
   val to_string : circuit -> string
   val to_json : circuit -> string
end = 
struct
   let create() = {comps=[];wires=[]}
   let get_wire c n = None
   let find_wire c a b = None
   let get_component c k s = None
   let add_wire c w = c 
   let add_component c co = c 
   let to_string = ""
   let to_json = ""

end