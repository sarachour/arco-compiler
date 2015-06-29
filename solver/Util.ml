open ExtString
open Map


type 'a maybe = 
   Some of 'a 
   | None
;;

type id = int*(string maybe)


module StringMap = Map.Make (String)

module SymbolTable : 
sig
  type symtable = {
    mutable fid: int ref;
    mutable map: id StringMap.t ref;
  }
  val create : unit -> symtable 
  val add : symtable -> string -> id 
  val get: symtable -> string -> id
  val make : symtable -> id 

end = 
struct
  type symtable = {
    mutable fid: int ref;
    mutable map: id StringMap.t ref;
  }
  let create() = {fid=(ref 0); map=(ref StringMap.empty)}
  let add s name = 
    let fid = s.fid in
    let id = (!fid, Some name) in
    fid := !fid + 1;
    s.map := StringMap.add name id !(s.map);
    id

  let make s = add s ("_var"^(string_of_int !(s.fid)))
  let get s name = StringMap.find name !(s.map)

end



let sanitize s : string = 
  let rec _sanitize (lst: char list) (cap:bool): char list = 
    match (lst,cap) with
      | ('_'::t,_) -> _sanitize t true
      | ('-'::t,_) -> _sanitize t true
      | (x::t,true) -> '_'::(x)::(_sanitize t false)
      | (x::t,false) -> (x)::(_sanitize t false)
      | ([],_) -> []
  in
    ExtString.String.implode (_sanitize (ExtString.String.explode s) false)
