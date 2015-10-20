open Core
open Camlp4

exception UtilError of string

let error n m = raise (UtilError (n^":"^m))
type 'a set = {
  mutable lst : 'a list;
  cmp : 'a -> 'a -> bool
}

type range = float*float

type ('a,'b) map = ('a, 'b) Hashtbl.t

type ('a,'b) either = Left of 'a | Right of 'b


module RANGE =
struct
  let range2str ((a,b):range) = "("^(string_of_float a)^","^(string_of_float b)^")"
  let resolve ((a,b):range) ((x,y):range) =
    let min = if a < x then a else x in
    let max = if b < y then b else y in
    (min,max)
end

module LIST =
struct
  let has lst n =
      List.length (List.filter (fun x -> n = x) lst) > 0

end

module MAP =
struct
  let max = 25;;

  let make (type a) (type b) () : (a,b) map =
    Hashtbl.create max

  let put (type a) (type b) (x:(a,b) map) (k:a) (v:b) : (a,b) map =
    Hashtbl.replace x k v;
    x

  let has (type a) (type b) x k : bool =
    Hashtbl.mem x k

  let get (type a) (type b) (x:(a,b) map) (k:a) : b =
    Hashtbl.find x k

  let upd (type a) (type b) (x:(a,b) map) (f:b->b) (k:a) : (a,b) map =
    let va = get x k in
    let vap = f va in
    put x k vap


  let fold (type a) (type b) (type c) (x:(a,b) map) (f: a -> b -> c -> c) (iv: c) : c =
    Hashtbl.fold f x iv

  let iter (type a) (type b) (x:(a,b) map) (f: a -> b -> unit) : unit =
    Hashtbl.iter f x

  let map (type a) (type b) (type c)  (x:(a,b) map) (f: a -> b -> b) : (a,b) map =
    let repl k v = let _ = put x k (f k v) in () in
    let _ = iter x repl in
    x

end

module SET =
struct
  let make (type a) fn : a set = {lst=[]; cmp=fn}

  let has s e =
    List.length (List.filter (fun x ->s.cmp x e) s.lst) > 0

  let add s e =
    if has s e = false then
      begin
        s.lst <- e::s.lst;
        s
      end
    else
      s

  let iter s f =
    List.iter f (s.lst)

  let fold s f iv =
    List.fold_right f (s.lst) iv

  let map s f =
    List.map f (s.lst)

  let filter s f =
    List.filter f (s.lst)

  let to_list (type a) (s: a set) : a list=
    s.lst
  let add_all (type a) (s: a set) (lst: a list): a set =
    List.iter (fun x -> add s x; ()) lst;
    s
end


type ('a,'b) graph = {
  mutable adj : ('a,('a*'b) set) map;
  vcmp : 'b -> 'b -> bool;
  node2str: 'a -> string;
  val2str: 'b -> string;
}


module GRAPH =
struct
  let make (type a) (type b) vcmp astr bstr =
    {adj=MAP.make(); vcmp = vcmp; node2str = astr; val2str = bstr}

  let hasnode (type a) (type b) (g) (n:a) : bool =
    MAP.has (g.adj) n

  let hasedge (type a) (type b) g s e v : bool =
    if hasnode g s == false || hasnode g e == false then
      false
    else
      let chld = MAP.get (g.adj) s in
      SET.has chld (e,v)

  let mknode (type a) (type b) (g) (n:a) : (a,b) graph =
    if hasnode g n then
      error "mknode" "node already exists"
    else
      let cmp ((n1,v1):a*b) (n2,v2) = n1 = n2 && g.vcmp v1 v2 in
      let _ = MAP.put (g.adj) n (SET.make cmp) in
      g


  let mkedge (type a) (type b) (g) (a:a) (b:a) (v:b) : (a,b) graph =
    if hasnode g a && hasnode g b && hasedge g a b v = false then
      let dest = MAP.get (g.adj) (a) in
      let _ = SET.add dest (b,v) in
      g
    else
      if hasnode g a = false then
        error "mkedge" ("node "^(g.node2str a)^" does not exist in graph.")
      else if hasnode g b = false then
        error "mkedge" ("node "^(g.node2str a)^" does not exist in graph.")
      else if hasedge g a b v = true then
        error "mkedge" ("edge "^(g.node2str a)^"->"^(g.node2str b)^":"^(g.val2str v)^" already exists in graph.")
      else
        error "mkedge" "unknown"

  let iter (type a) (type b) (g) (fn : a-> a-> b -> unit) =
    let iterset src snk v =
      fn src snk v
    in
    let itermap k v =
      let src = k in
      SET.iter v (fun (snk,vl) -> iterset src snk vl)
    in
    MAP.iter (g.adj) itermap

  let visit (type a) (type b) (type c) (g) (st:a) (init) (fxn: a -> a -> b  -> c -> bool*c) (red: c list -> c) =
    let rec _traverse n (path:a list) (res:c) : c =
      if hasnode g n  = false then
        error "graph:traverse" "node doesn't exist"
      else
        let chldrn  = MAP.get (g.adj) (n) in
        let visit ch v : c =
          let cont,vl = fxn n ch v res in
          if cont && LIST.has path ch then
            _traverse ch (ch::path) vl
          else
            vl
        in
          let subres : c list = SET.map (chldrn) (fun (x,v) -> visit x v)  in
          red subres
    in
      let path = [st] in
      _traverse st path init
end


module REF :
sig
  (* ref(x) creates a new ref containing x *)
  val mk : 'a -> 'a ref

  (* !x is the contents of the ref cell x *)
  val dr : 'a ref -> 'a

  (* Effects: x := y updates the contents of x
  * so it contains y. *)
  val set : 'a ref -> 'a -> unit

end =
struct
  let mk v = ref v
  let dr v = !v
  let set v x = v := x
end
