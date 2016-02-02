open ExtString


module type GENERIC_TYPE = sig type t end

exception TypeException of string;;
exception GraphException of string;;
exception PrintException of string;;

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
