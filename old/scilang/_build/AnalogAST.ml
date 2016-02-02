open Relation
open Yojson
open Util

type marker = Input|Output;;
type hint = Adder | Multiplier;;

type id = int*string option

exception AnalogASTException of string;;

type 'a block= 
   | SMTHole of id*((id*string) list)*relation*((id*string) list)*(hint option)
   | Capacitor of id*float
   | Ground of id
   | Joint of id*('a list)
   | Hole of id

type wire = 
   | Wire of id*id*id


type circuit = {
   mutable blocks : (wire block) list;
   mutable wires : (wire) list;
   mutable inputs: (string*id) list;
   mutable outputs: (string*id) list;
   mutable id: id;
}

type system = {
   mutable circuits : circuit list;
   mutable wires : (wire) list;
   mutable id: id;
}

module Circuit :
sig
   val create : id -> circuit
   (*get elements*)
   val get_wire : circuit -> id -> wire option
   val get_block : circuit -> id -> wire block option
   (*add elements*)
   val add_wire : circuit -> wire -> circuit
   val add_wires : circuit -> wire list -> circuit
   val add_block : circuit -> wire block -> circuit
   val add_blocks : circuit -> wire block list -> circuit
   val add_input : circuit -> (string*id) -> circuit
   val add_inputs : circuit -> (string*id) list -> circuit
   val add_output : circuit -> (string*id) -> circuit
   val add_outputs : circuit -> (string*id) list -> circuit
   
   (*export as string*)
   val to_string : circuit -> string
   val to_json : circuit -> json
end = 
struct
   let _get_block_id b = match b with
      | Capacitor(id,_) -> id
      | Ground(id) -> id
      | Hole(id) -> id 
      | SMTHole(id,_,_,_,_) -> id
      | Joint(id,_) -> id

   let _get_wire_id (w:wire): id = match w with
      | Wire(id,src,snk)-> id
   
   let _id2str (i,n) : string = match n with
      |Some(name) -> name^"["^(string_of_int i)^"]"
      |None ->  "_["^(string_of_int i)^"]"

   let create i = {blocks=[];wires=[];inputs=[];outputs=[];id=i}

   let get_wire (c:circuit) id = 
      let rec _get_wire lst = match lst with
         | h::t -> if (_get_wire_id h) = id then
            Some(h) else _get_wire t
         | [] -> None
      in  
         _get_wire c.wires

   let get_block c id = 
      let rec _get_block lst = match lst with
         | h::t -> if (_get_block_id h) = id then
            Some(h) else _get_block t
         | [] -> None
      in  
         _get_block c.blocks

   let add_wire (c:circuit) w =
      let wid = (_get_wire_id w) in 
      match get_wire c wid with
      | None -> c.wires <- w::c.wires; c
      | Some(_) -> raise (AnalogASTException ("wire "^(_id2str wid)^" already exists."))
   
   let add_block (c:circuit) b =
      let bid = (_get_block_id b) in  
      match get_block c bid with
      | None -> c.blocks <- b::c.blocks; c
      | Some(_) -> raise (AnalogASTException ("block "^(_id2str bid)^" already exists."))
   
   let rec add_wires (c:circuit) w  = 
      match w with
      | h::t -> let x = add_wire c h in add_wires x t
      | [] -> c
   
   let rec add_blocks c b = 

      match b with
      | h::t -> let x = add_block c h in add_blocks x t
      | [] -> c
   let add_input c b = c 
   let add_output c b = c 
   let add_inputs c b = c 
   let add_outputs c b = c 


   let to_json (c:circuit) = 
      let _id_to_json (i:id) : json = 
         match i with
            |(x,None) -> `Assoc([("id",  `Int x)])
            |(x,Some(n)) -> `Assoc([("id",`Int x);("name",`String n)])
      in
      let _wire_to_json (Wire(id,src,sink)) : json = 
         let mid = _id_to_json id in
         let sid = _id_to_json src in 
         let snkid = _id_to_json sink in 
         `Assoc([("source",sid);("sink",snkid);("id",mid)])
      in
      let rec _wires_to_json ws : json list = 
         match ws with 
         |h::t -> (_wire_to_json h)::(_wires_to_json t)
         |[] -> []
      in
      let _block_to_json b : json = match b with
         | Hole(id) -> `Assoc([("type",`String "hole"); ("id", _id_to_json id)])
         | Ground(id) -> `Assoc([("type",`String "ground"); ("id", _id_to_json id)])
         | Capacitor(id,v) -> `Assoc([
            ("type",`String "capacitor"); ("id", _id_to_json id); 
            ("value", `Float v)
         ])
         | Joint(id,lst) -> `Assoc([
            ("type",`String "joint"); ("id", _id_to_json id); 
            ("wires", `List (_wires_to_json lst))
         ])
         | _ -> raise (AnalogASTException ("unsupported by json."))
      in 
      let rec _blocks_to_json bs : json list = 
         match bs with 
         |h::t -> (_block_to_json h)::(_blocks_to_json t)
         |[] -> []
      in
      let rec _idlist_to_json is : json list = 
         match is with 
         |(n,h)::t -> 
            begin
            match (_id_to_json h) with
            |`Assoc(props) -> (`Assoc (("port",`String n)::props))::(_idlist_to_json t)
            | _ -> raise (AnalogASTException ("expected associative array from id."))
            end
         |[] -> []
      in 
         `Assoc([
            ("wires",`List (_wires_to_json c.wires));
            ("blocks",`List (_blocks_to_json c.blocks));
            ("inputs",`List (_idlist_to_json c.inputs));
            ("outputs",`List (_idlist_to_json c.outputs));
            ("id", _id_to_json c.id)
         ])
   let to_string c = Yojson.to_string (to_json c)

end

module System :
sig
   val create : id -> system
   (*get elements*)
   val add_wire : system -> wire -> system
   val get_circuit : system -> id -> circuit option
   (*add elements*)
   val get_wire : system -> id -> wire option
   val add_circuit : system -> circuit -> system
   (*export as string*)
   val to_string : system -> string
   val to_json : system -> json
end = 
struct
   let create i = {circuits=[];wires=[];id=i}
   let get_circuit c id = None
   let add_circuit sys circ = sys.circuits <- circ::sys.circuits; sys 
   let update_circuit c w = c
   let get_wire c id = None
   let add_wire sys wire = sys.wires <- wire::sys.wires; sys 
   let to_json c = 
      let _id_to_json (i:id) : json = 
         match i with
            |(x,None) -> `Assoc([("id",  `Int x)])
            |(x,Some(n)) -> `Assoc([("id",`Int x);("name",`String n)])
      in
      let _wire_to_json (Wire(id,src,sink)) : json = 
         let mid = _id_to_json id in
         let sid = _id_to_json src in 
         let snkid = _id_to_json sink in 
         `Assoc([("source",sid);("sink",snkid);("id",mid)])
      in
      let rec _wires_to_json ws : json list = 
         match ws with 
         |h::t -> (_wire_to_json h)::(_wires_to_json t)
         |[] -> []
      in
      let rec _circuits_to_json cs : json list =
         match cs with 
         |h::t -> (Circuit.to_json h)::(_circuits_to_json t)
         |[] -> []
      in
         `Assoc([
            ("wires",`List (_wires_to_json c.wires));
            ("circuits",`List (_circuits_to_json c.circuits));
            ("id", _id_to_json c.id)
         ])

   let to_string c =  Yojson.to_string (to_json c)
end