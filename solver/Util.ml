open Core
open Camlp4
open Random

exception UtilError of string

let error n m = raise (UtilError (n^":"^m))
type 'a set = {
  mutable lst : 'a list;
  cmp : 'a -> 'a -> bool
}

type range = float*float

type ('a,'b) map = ('a, 'b) Hashtbl.t

type ('a,'b) either = Left of 'a | Right of 'b

let init_utils () =
  let _ = Random.self_init () in
  ()

module STRING =
struct
  let split (s:string) (d:string) : string list =
    Str.split (Str.regexp d) s

end

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
  type sortorder =
    SortAscending | SortDescending

  let has lst n =
      List.length (List.filter (fun x -> n = x) lst) > 0

  (*joins list into tuples*)
  let zip a b =
      let rec zip_i x y  =
        match x,y with
        | (h1::t1,h2::t2) -> (h1,h2)::(zip_i t1 t2)
        | (h::t,[]) -> error "zip" "list sizes mismatched"
        | ([],h::t) -> error "zip" "list sizes mismatched"
        | ([],[]) -> []
      in
      zip_i a b



  (*makes a list of tuples that is the product of the two lists*)
  let prod (a:'a list) (b:'b list) : ('a*'b) list =
    let prod_sc a x =
      List.map (fun r -> (a,r)) x
    in
    let rec _prod x =
      match x with
      | h::t -> (prod_sc h b) @ (_prod t)
      | [] -> []
    in
    _prod a


  let mkrange s e =
    let rec cnc x =
      if x < s+e
      then x::(cnc (x+1))
      else []
    in
    cnc s

  let mkvalue v n =
    let rec mk i =
      if i < n
      then
        v::(mk (i+1))
      else []
    in
    mk 0

  let sort (type a) (fn: a->int) (lst:a list) strategy=
    if strategy = SortAscending then
      List.sort (fun x y -> (fn x) - (fn y)) lst
    else
      List.sort (fun x y -> (fn y) - (fn x)) lst

  let max (type a) (fxn: a -> int) (lst : a list) =
    match lst with
    | h::t ->
      List.fold_right (fun q (sc,p) ->
        let nsc = fxn q in
        if sc < nsc then (nsc,q) else (sc,p) ) t (fxn h, h)
    | [] -> error "max" "cannot take max of empty list."

  let fold_i (type a) (type b) (fxn : a -> int -> b -> b) (lst: a list) (init:b) =
    let nfxn (x:a) ((i,v):(int*b)) =
      let nv = fxn x i v in (i+1, nv)
    in
    let _, v = List.fold_right nfxn lst (0,init) in
    v

  let sub (type a) (t:a) (v:a) (lst:a list) =
    List.map (fun x -> if x = t then v else x) lst
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

  let size x =
    Hashtbl.length x


  let fold (type a) (type b) (type c) (x:(a,b) map) (f: a -> b -> c -> c) (iv: c) : c =
    Hashtbl.fold f x iv

  let to_values (type a) (type b) (x:(a,b) map) : b list =
    fold x (fun k v rst -> v::rst) []

  let to_keys (type a) (type b) (x:(a,b) map) : a list =
      fold x (fun k v rst -> k::rst) []

  let iter (type a) (type b) (x:(a,b) map) (f: a -> b -> unit) : unit =
    Hashtbl.iter f x

  let str (type a) (type b) (x:(a,b) map) (kf: a -> string) (vf: b->string):string =
    Hashtbl.fold (fun k v r -> r^(kf k)^" = "^(vf v)^"\n") x ""

  let map (type a) (type b) (type c)  (x:(a,b) map) (f: a -> b -> b) : (a,b) map =
    let repl k v = let _ = put x k (f k v) in () in
    let _ = iter x repl in
    x

  let from_list (type a) (type b) (x:(a*b) list) : (a,b) map =
    let mp = make() in
    let _ = List.iter (fun (k,v) -> let _ = put mp k v in ()) x in
    mp

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

  let map (type a) (type b) (s:a set) (f:a->b): b list  =
    let v = List.map f (s.lst) in
    v

  let filter s f =
    List.filter f (s.lst)

  let to_list (type a) (s: a set) : a list=
    s.lst

  let to_set (type a) (l: a list) fn : a set =
    List.fold_right (fun x s -> add s x) l (make fn)

  let add_all (type a) (s: a set) (lst: a list): a set =
    List.iter (fun x -> add s x; ()) lst;
    s

  let from_list (type a) (a: a list) : a set =
    let s = make (fun x y -> x = y) in
    add_all s a

  let size s =
    List.length s.lst

  let rand (type a) (s: a set) :a  =
    let n = size s in
    let i = Random.int(n) in
    List.nth s.lst i

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
          let visitset ((x,v):a*b) :c = visit x v in
          let subres : c list = SET.map (chldrn) visitset in
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
