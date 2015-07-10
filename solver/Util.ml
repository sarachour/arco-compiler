open ExtString
open Map



type id = int*(string option)


module StringMap = Map.Make (String)

module OptUtils : sig 
  val conc : ('a option) list -> 'a list
  val unify_all : ('a option) list -> ('a list) option
  val unify_atleast_one : ('a option) list -> ('a list) option
end = 
struct
  let rec conc l = match l with 
    |Some(x)::t -> x::(conc t) 
    |None::t -> (conc t)
    |[] -> [] 

  let rec unify_all l = match l with 
    |Some(x)::t -> 
      begin
      match unify_all t with 
      | Some(y) -> Some(x::y)
      | None -> None
      end
    |None::t -> None
    |[] -> Some([]) 

  let rec unify_atleast_one l = match l with 
    |Some(x)::t -> 
      begin
      match unify_atleast_one t with 
      | Some(y) -> Some(x::y)
      | None -> Some([x])
      end
    |None::t -> None
    |[] -> None
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
