open ExtString
open Map

type id = int*(string option)
module StringMap = Map.Make (String)

module type Type = sig 
  type t 
end

module Set (X:Type) : sig 
  type t = X.t
  type set = t list
  val create: unit -> set 
  val add: set -> t -> set 
  val has: set -> t -> bool
  val union: set -> set -> set 
  val intersect: set -> set -> set
end = 
struct 
  type t = X.t
  type set = t list

  let create () = []

  let rec has s e = match s with 
    | h::t -> if h = e then true else (has t e)
    | [] -> false

  let add s e = 
    if has s e then s else e::s 

  
  let union s1 s2 = 
   let lmb x r = if has r x then r else x::r in
   let l1 = List.fold_right lmb s1 [] in 
   let l2 = List.fold_right lmb s2 l1 in 
   l2

  let intersect s1 s2 = 
    let lmb x r = 
      if has r x then r else
          if has s1 x && has s2 x 
          then x::r else r 
    in
    let l1 = List.fold_right lmb s1 [] in 
    l1
end 

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
