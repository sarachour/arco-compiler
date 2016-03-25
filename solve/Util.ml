open Core
open Camlp4
open Random

exception UtilError of string

let error n m = raise (UtilError (n^":"^m))

type range = float*float
type irange = int*int

type ('a,'b) map = ('a, 'b) Hashtbl.t
type 'a set = ('a,unit) map

type ('a,'b) either = Left of 'a | Right of 'b

type number = Integer of int | Decimal of float


type 'a queue = ('a list) ref

type 'a stack = ('a list) ref

type ('a,'b) graph = {
  mutable adj : ('a,('a,'b) map) map;
  vcmp : 'b -> 'b -> bool;
  node2str: 'a -> string;
  val2str: 'b -> string;
}

type ('a,'b) tree = {
  mutable adj : ('a,(('a,'b) map)*('a option)) map;
  mutable root : 'a option;
  vcmp : 'b -> 'b -> bool;
  ncmp : 'a -> 'a -> bool;
}

let return x b = let _ = x in begin

end
let string_of_number n = match n with
  | Integer(q) -> string_of_int(q)
  | Decimal(q) -> string_of_float(q)

let float_of_number n = match n with
  | Integer(q) -> float_of_int (q)
  | Decimal(q) -> q


let init_utils () =
  let _ = Random.self_init () in
  ()


let str_of_float f =
  let s : string = Printf.sprintf "%8.8f" f in
  s

module OPTION =
struct
  let force_conc (type a) (f:a option): a = match f with
    |Some(q) -> q
    |_ -> error "force_conc" "none is disallowed."

  let casc_some (type a) (f: a option) (dflt :a) = match f with
  | Some(q) -> Some(q)
  | None -> Some dflt

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

  val upd: 'a ref -> ('a -> 'a) -> unit

end =
struct
  let mk v = ref v
  let dr v = !v
  let set v x = v := x
  let upd (type a) (v:a ref) (f:a -> a) =
    v := (f (!v))
end

module MATH =
struct

  let round x : float =
    let v = snd (modf (x +. copysign 0.5 x)) in
    v

  let float_is_int (x:float) =
    let xt : float = round x in
    let diff : float = abs_float(x-.xt) in
    if diff < 1e-10 then
      true
    else
      false

  let int_of_float x =  int_of_float (round x)

  let cmp_numbers (n1:number) (n2:number) (eps:float) =
    let f1 = float_of_number n1 in
    let f2 = float_of_number n2 in
    let diff = abs_float(f1 -. f2) in
    diff < eps

end

module IO =
struct
  let save fname str =
    let oc = open_out fname in
    let _ = Printf.fprintf oc "%s\n" str in
    let _ = close_out oc in
    ()


end

module RAND =
struct


  let rand_int n =
    let i = Random.int(n) in
    i

  let rand_norm () =
    let i = Random.float(1.) in
    i

end

module STRING =
struct
  let split (s:string) (d:string) : string list =
    Str.split (Str.regexp d) s

  let rec repeat (s:string) (n:int) : string =
    if n > 0 then
      s^(repeat s (n-1))
    else
      ""

  let startswith (s:string) (p:string) : bool =
    Str.string_match (Str.regexp p) s 0

  let compare (s1) (s2) : int =
    String.compare s1 s2

  let removeprefix (s:string) (prefix:string)  =
    List.nth (Str.split (Str.regexp prefix) s) 0

end

module FUN =
struct
  let iter_n x n =
    let rec q i =
      if i < n then
        let _ = x () in
        let _ = q (i+1) in
        ()
      else
        ()
    in
    q 0

end

module RANGE =
struct
  let range2str ((a,b):range) = "("^(string_of_float a)^","^(string_of_float b)^")"
  let tostr rng = range2str rng

  let resolve ((a,b):range) ((x,y):range) =
    let min = if a < x then a else x in
    let max = if b < y then b else y in
    (min,max)



end

module QUEUE =
struct
  let make () : 'a queue = REF.mk []

  let enqueue (type a) (s:a queue) (x:a) : a queue =
    let _ : unit = REF.upd s (fun s -> s @ [x]) in s

  let enqueue_front (type a) (s:a queue) (x:a) : a queue =
    let _ : unit = REF.upd s (fun s -> x::s) in s


  let dequeue (type a) (s:a queue) : a queue =
    let _ : unit = REF.upd s (fun st ->
      match st with
      | h::t -> t
      | [] -> error "stack.dequeue" "failed to dequeue empty list"
    ) in s

  let front (type a) (s:a queue) : a =
    match REF.dr s with
    | h::t -> h
    | _ -> error "queue.front" "can't peek empty list"

  let empty (type a) (s:a queue) : a queue =
    let _ = REF.upd s (fun x -> []) in
    s

  let filter (type a) (s:a queue) (f:a->bool) : a list =
    List.filter f (REF.dr s)

  let rm (type a) (s: a queue) (z:a) : a queue =
    let _ = REF.upd s (fun (x:a list) -> List.filter (fun (r:a) -> r <> z) x) in
    s

  let has (type a) (s:a queue) (x:a) : bool =
    match filter s (fun q -> q = x) with
    | [] -> false
    | _ -> true

  let tostr (type a) (s:a queue) (st : a -> string) =
    List.fold_left (fun r x -> r^" "^(st x) ) "" (REF.dr s)

  let length (type a) (s:a queue) =
    List.length (REF.dr s)

  let empty (type a) (s:a queue) =
    length s = 0

  let from_list (type a) (x:a list) : (a queue) =
    let q = make () in
    let _ = REF.upd q (fun q -> x) in
    q

  let map (type a) (type b) (x:a queue) (r:a -> b): (b list) =
    List.map r (REF.dr x)

  let iter (type a) (type b) (x:a queue) (r:a -> unit): unit =
    List.iter r (REF.dr x)

  let dequeue_back (type a) (type b) (x:a queue) : a queue =
    let rec deq_back l = match l with
      | [] -> []
      | [h] -> []
      | h::t -> h::(deq_back t)
    in
    let _ = REF.upd x (fun lst ->
      deq_back lst
    ) in
    x

  let back (type a) (x:a queue) : a =
    let rec _back (r:a list) =
      match (r) with
      | [] -> error "QUEUE.back" "empty queue"
      | [h] -> h
      | _::t -> _back t
    in
    _back (REF.dr x)
end

module STACK =
struct
  let make () : 'a stack = REF.mk []

  let push (type a) (s:a stack) (x:a) : a stack =
    let _ : unit = REF.upd s (fun s -> x::s) in s

  let pop (type a) (s:a stack) : a stack =
    let _ : unit = REF.upd s (fun st ->
      match st with
      | h::t -> t
      | [] -> error "stack.pop" "failed to dequeue empty list"
    ) in s

  let peek (type a) (s:a stack) : a =
    match REF.dr s with
    | h::t -> h
    | _ -> error "stack.peek" "can't peek empty list"

  let empty (type a) (s:a stack) : a queue =
    let _ = REF.upd s (fun st -> []) in
    s

  let filter (type a) (s:a stack) (f:a->bool) : a list =
    List.filter f (REF.dr s)

  let has (type a) (s:a stack) (x:a) : bool =
    match filter s (fun q -> q = x) with
    | [] -> false
    | _ -> true

  let tostr (type a) (s:a stack) (st : a -> string) =
    List.fold_left (fun r x -> r^" "^(st x) ) "" (REF.dr s)

  let length (type a) (s:a stack) =
    List.length (REF.dr s)

  let empty (type a) (s:a stack) =
    length s = 0
end


module LIST =
struct
  type sortorder =
    SortAscending | SortDescending

  let has lst n =
      List.length (List.filter (fun x -> n = x) lst) > 0

  let count lst n =
      List.length (List.filter (fun x -> n = x) lst)

  let empty x =
    List.length x = 0

  let iter = List.iter
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



  let uniq a =
    List.fold_right (fun x r -> if count r x = 0 then x::r else r) a []

  let exclude lst v =
    List.filter (fun x -> x <> v) lst

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

  let shuffle lst =
    let rec extract acc n = function
      | [] -> raise Not_found
      | h :: t -> if n = 0 then (h, acc @ t) else extract (h::acc) (n-1) t
    in
    let extract_rand lst len =
      extract [] (Random.int len) lst
    in
    let rec aux acc list len =
      if len = 0 then acc else
        let picked, rest = extract_rand list len in
        aux (picked :: acc) rest (len-1)
    in
    aux [] lst (List.length lst);;

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

  let filter x y = List.filter x y

  let fold x f c0 = List.fold_right f x c0

  let tostr (type a) (fn: a->string) (delim:string) (lst:a list) =
    match lst with
    | h::t -> List.fold_left (fun r x -> r^delim^(fn x)) (fn h) t
    | [] -> ""

  let sort2 (type a) (fn: a->int) (lst:a list) strategy=
    if strategy = SortAscending then
      List.sort (fun x y -> (fn x) - (fn y)) lst
    else
      List.sort (fun x y -> (fn y) - (fn x)) lst

  let max (type a) (fxn: a -> float) (lst : a list) : float*a=
    match lst with
    | h::t ->
      let sc,v =  List.fold_right (fun q (sc,p) ->
        let nsc = fxn q in
        if sc < nsc then (nsc,q) else (sc,p) ) t (fxn h, h)
      in
      (sc,v)
    | [] -> error "max" "cannot take max of empty list."

  let fold_i (type a) (type b) (fxn : a -> int -> b -> b) (lst: a list) (init:b) =
    let nfxn (x:a) ((i,v):(int*b)) =
      let nv = fxn x i v in (i+1, nv)
    in
    let _, v = List.fold_right nfxn lst (0,init) in
    v

  let sub (type a) (t:a) (v:a) (lst:a list) =
    List.map (fun x -> if x = t then v else x) lst

  let rm (type a) (t:a) (lst: a list) =
    List.filter (fun x -> if x = t then false else true) lst

  let rev (type a) (t:a list) =
    List.rev t

  let from_end x i =
    List.nth (rev x) i

  let sublist (type a) (t:a list) (st:a) (en:a) =
    let gen (lst,add) v  =
      if add = true && v = st then
        (v::lst,false)
      else if add = true || v = en then
        (v::lst,true)
      else
        (lst,false)
    in
    if st = en then
      [st]
    else
      let f,_ = List.fold_left gen ([],false) t in
      f

  let sublist_i (type a) (t:a list) (st:int) (en:int) =
    let gen (lst,idx,add) v  =
      if add = true && idx = st then
        (v::lst,idx+1,false)
      else if add = true || idx <= en then
        (v::lst,idx+1,true)
      else
        (lst,idx+1,false)
    in
    if st = en then
      [List.nth t st]
    else
      let f,_,_ = List.fold_left gen ([],0,false) t in
      f

  let rand (type a) (s: a list) :a  =
    if List.length s == 0 then
      error "rand" "cannot take random element of empty list."
    else
    let n = List.length s in
    let i = Random.int(n) in
    List.nth s i
end

module MAP =
struct
  let max = 25;;


  let make (type a) (type b) () : (a,b) map =
    Hashtbl.create max

  let copy (type a) (type b) a : (a,b) map =
    Hashtbl.copy a

  let put (type a) (type b) (x:(a,b) map) (k:a) (v:b) : (a,b) map =
    Hashtbl.replace x k v;
    x

  let rm  (type a) (type b) (x:(a,b) map) (k:a) : (a,b) map =
    Hashtbl.remove x k;
    x

  let has (type a) (type b) x k : bool =
    Hashtbl.mem x k

  let get (type a) (type b) (x:(a,b) map) (k:a) : b =
    Hashtbl.find x k

  let upd (type a) (type b) (x:(a,b) map) (f:b->b) (k:a) : (a,b) map =
    let va = get x k in
    let vap = f va in
    put x k vap

  let size (type a) (type b) (x:(a,b) map) =
    Hashtbl.length x

  let size x =
    Hashtbl.length x

  let empty x =
    size x = 0

  let clear x =
    Hashtbl.clear x

  let fold (type a) (type b) (type c) (x:(a,b) map) (f: a -> b -> c -> c) (iv: c) : c =
    Hashtbl.fold f x iv


  let to_values (type a) (type b) (x:(a,b) map) : b list =
    fold x (fun k v rst -> v::rst) []

  let to_keys (type a) (type b) (x:(a,b) map) : a list =
      fold x (fun k v rst -> k::rst) []

  let rand x =
    let k = LIST.rand (to_keys x) in
    let v = get x k in
    k,v

  let iter (type a) (type b) (x:(a,b) map) (f: a -> b -> unit) : unit =
    Hashtbl.iter f x

  let str (type a) (type b) (x:(a,b) map) (kf: a -> string) (vf: b->string):string =
    Hashtbl.fold (fun k v r -> r^(kf k)^" = "^(vf v)^"\n") x ""


  let repl (type a) (type b) (type c)  (x:(a,b) map) (f: a -> b -> b) : (a,b) map =
    let _repl k v = let _ = put x k (f k v) in () in
    let _ = iter x _repl in
    x

  let map_vals (type a) (type b) (type c)  (x:(a,b) map) (f: a -> b -> c) : (a,c) map =
    let xn = make () in
    let repl k v = let _ = put xn k (f k v) in () in
    let _ = iter x repl in
    xn

  let map_keys (type a) (type b) (type c)  (x:(a,b) map) (f: a -> b -> c) : (c,b) map =
    let xn = make () in
    let repl k v = let _ = put xn (f k v) v in () in
    let _ = iter x repl in
    xn

  let map (type a) (type b) (type c)  (x:(a,b) map) (f: a -> b -> c) : c list =
    let repl k v r = (f k v)::r in
    let res = fold x repl [] in
    res

  let filter (type a) (type b) (x:(a,b) map) (f: a->b->bool) : (a*b) list =
    fold x (fun q v k -> if f q v then (q,v)::k else k) []

   let to_list (type a) (type b) (x:(a,b) map) : (a*b) list =
    fold x (fun q v k -> (q,v)::k) []
   
   
  let keys (type a) (type b) (x:(a,b) map) : (a) list =
    fold x (fun q v k -> (q)::k) []

  let from_list (type a) (type b) (x:(a*b) list) : (a,b) map =
    let mp = make() in
    let _ = List.iter (fun (k,v) -> let _ = put mp k v in ()) x in
    mp
  
  let filter_map (type a) (type b) (x:(a,b) map) (f: a->b->bool) : (a,b) map = 
    from_list (filter x f)


  let set (type a) (type b) (x: (a,b) map) (y: (a,b) map) =
    let _ = clear x in
    let _ = iter y (fun a b -> let _ = put x a b in ()) in
    ()

  let singleton (type a) (type b) (x:(a,b) map): (a*b) =
    if size x != 1 then
      error "MAP.singleton" "must have exactly one element."
    else
      let r = match fold x (fun x y r -> Some(x,y)) None with
        | Some(v) -> v
        | None ->
          error "MAP.singleton" "must have exactly one element."
      in
      r

end

module SET =
struct
  let make (type a) () : a set = MAP.make()

  let make_dflt (type a) () : a set = make ()

  let tostr (type a) (a:a set) (f:a -> string) (delim:string) =
    MAP.fold a (fun k v r -> r^delim^(f k)) ""

  let has s e = MAP.has s e

  let add s e = MAP.put s e ()

  let empty (type a) (x:a set) = MAP.empty x

  let sort (type a)  (lst:a set)  (fn: a->a->int): a list =
    let lst = MAP.keys lst in
    List.sort (fun x y -> fn x y) lst


  let tostr (type a) (s:a set) (f:a->string) (delim:string) : string =
    let lst = MAP.keys s in
    LIST.tostr f delim lst

  let iter (type a) (s:a set) f =
    MAP.iter s (fun k v -> f k)

  let fold (type a) (s:a set) f iv =
    MAP.fold (s) (fun k v r -> f k r) iv

  let fold_i  s f iv =
    MAP.fold s (fun x (i,v) -> (f x i v)) (0,iv)

  let map (type a) (type b) (s:a set) (f:a->b): b list  =
    let v = List.map f (MAP.keys s) in
    v

  let get s q =
    if MAP.has s q then
      Some(q)
    else
      None

  let nth s n =
    let lst = MAP.keys s in
    List.nth lst n

  let count s f : int =
    MAP.fold s (fun x v r -> if f x then r+1 else r) 0

  let clear (type a) (s:a set) =
    MAP.clear s

  let setv (type a) (s:a set) (cpy:a set) : a set =
    let _ = clear s in
    let _ = iter cpy (fun q -> return (add s q) ()) in
    s

  let filter (type a) (s:a set) f : a list =
    MAP.fold s (fun x v r -> if f x then x::r else r) []

  let rm s v =
    let _ = MAP.rm s v in
    ()

  let sub (type a) (src:a set) (sub:a set) =
    let diff = make_dflt () in
    let _ = iter src
      (fun x -> if has sub x then () else return (add diff x) ())
    in
    diff
  let rand (type a) (s:a set) =
    let lst = MAP.keys s in
    LIST.rand lst

  let to_list (type a) (s: a set) : a list=
    let lst = MAP.keys s in
    lst

  let to_set (type a) (l: a list) fn : a set =
    List.fold_right (fun x s -> add s x) l (make fn)

  let add_all (type a) (s: a set) (lst: a list): a set =
    List.iter (fun x -> add s x; ()) lst;
    s

  let from_list (type a) (a: a list) : a set =
    let s = make_dflt () in
    add_all s a

  let size s =
    MAP.size s

  let rand (type a) (s: a set) :a  =
    let n = size s in
    let i = Random.int(n) in
    List.nth (MAP.keys s) i

end




module GRAPH =
struct
  let make (type a) (type b) vcmp astr bstr =
    {adj=MAP.make(); vcmp = vcmp; node2str = astr; val2str = bstr}

  let hasnode (type a) (type b) (g:(a,b) graph) (n:a) : bool =
    MAP.has (g.adj) n

  let iter (type a) (type b) (g:(a,b) graph) (fn : a-> a-> b -> unit) =
    let iterset src snk v =
      fn src snk v
    in
    let itermap k v =
      let src = k in
      MAP.iter v (fun snk vl -> iterset src snk vl)
    in
    MAP.iter (g.adj) itermap

  let fold (type a) (type b) (type c) (g:(a,b) graph) (fn : a -> a -> b -> c -> c) (c0:c)=
    MAP.fold g.adj (fun src dests r0 ->
      MAP.fold dests (fun dest edj r -> fn src dest edj r) r0 ) c0

  let iter_node g f =
    let _ = MAP.iter g.adj (fun x dests -> f x ) in
    ()

  let srcs (type a) (type b) (g:(a,b) graph) (node:a) : (a*b) list =
    let proc_edge (srcn:a) (snkn:a) (edj:b) (r:(a*b) list) =
      if snkn = node then
        (srcn,edj)::r
      else
        r
    in
    fold g proc_edge []

  let getedge (type a) (type b) (g:(a,b) graph) (n1:a) (n2:a) : b option =
    let chld = MAP.get (g.adj) n1 in
    if MAP.has chld n2 then
      Some (MAP.get chld n2)
    else
      None

  let hasedge (type a) (type b) (g:(a,b) graph) s e : bool =
    if hasnode g s == false || hasnode g e == false then
      false
    else
      if getedge g s e = None then
        false
      else
        true

  let getnodes (type a) (type b) (g:(a,b) graph) (f:a->bool) : a list =
    MAP.fold g.adj (fun k v r -> if f k then k::r else r) []

  let children (type a) (type b) (g:(a,b) graph) (n:a) : a list =
    let conns = MAP.get g.adj n in
    let nodes = MAP.map conns (fun x b -> x)  in
    nodes

  let parents (type a) (type b) (g:(a,b) graph) (n:a) : a list =
    let pars = MAP.fold g.adj (fun par chmap rest ->
      if MAP.has chmap n  then
        par::rest
      else
        rest
    ) []
    in
      pars
  (*get all the nodes going to and from*)
  let connected (type a) (type b) (g:(a,b) graph) (n:a) : a list =
    let children = children g n in
    let parents = parents g n in
    children @ parents

  (*get disjoint graph nodes*)
  let disjoint (type a) (type b) (g:(a,b) graph) : (a set) list =
    let rec get_subset (s:a set) (n:a) : a set =
      let conn = connected g n in
      let nconn = List.filter (fun x -> SET.has s x = false) conn in
      if List.length nconn = 0 then s else
        let _ = SET.add_all s nconn in
        let nset = List.fold_right (fun x ns -> get_subset ns x) nconn s in
        nset
    in
    (*all the nodes *)
    let remaining_nodes : a set = SET.add_all (SET.make_dflt ()) (getnodes g (fun x -> true)) in
    let rec build_subset (remaining:a set) : (a set) list =
      if SET.empty remaining then [] else
      let rand_node = SET.rand remaining in
      let subst = get_subset (SET.make_dflt ()) rand_node in
      (*update remaining nodes*)
      let remaining = SET.sub remaining subst in
      subst::(build_subset remaining)
    in
    let disj = build_subset remaining_nodes in
    disj

  (*subtrees *)
  let subtrees (type a) (type b) (g:(a,b) graph) (roots:(a list) option): (a set) list =
    let roots : a list = if roots = None
      then MAP.fold (g.adj) (fun k chld r -> if MAP.empty chld then k::r else r) []
      else OPTION.force_conc roots
    in
    let get_tree (n:a) : a set =
      let nodes = SET.make () in
      let rec _get_tree path n =
        if LIST.has path n then ()
        else
          let npath = n::path in
          let _ = SET.add nodes n in
          let pars =  parents g n in
          let _ = List.iter (fun q -> return (_get_tree npath q) ()) pars in
          ()
      in
      let _ = _get_tree [] n in
      nodes
    in
    let subtrees : (a set) list = List.map (fun x -> get_tree x) roots in
    subtrees
  (*get all the cycles, iterate through paths in a graph determine, if there is a cycle*)
  let cycles (type a) (type b) (g:(a,b) graph) : (a list) set =
    let cycles = SET.make () in
    let rec strip_cyc lst n = match lst with
      | h::t -> if h = n then h::t else strip_cyc t n
      | [] -> []
    in
    let rec track_path (path:a list) (curr:a) : unit =
      (*cycle detected*)
      if LIST.has path curr then
        let cycpath = curr::path in
        (*make path oldest -> newest*)
        let stripped = strip_cyc (LIST.rev cycpath) curr in
        let _ = SET.add cycles stripped in
        ()
      else
        let chld : a list = children g curr in
        let npath = curr::path in
        let _ = List.iter (fun x -> track_path npath x) chld in
        ()
    in
    let _ = MAP.iter g.adj (fun src snks -> track_path [] src) in
    cycles

  let mknode (type a) (type b) (g:(a,b) graph) (n:a) : (a,b) graph =
    if hasnode g n then
      error "mknode" "node already exists"
    else
      let cmp ((n1,v1):a*b) (n2,v2) = (n1 = n2) && g.vcmp v1 v2 in
      let _ = MAP.put (g.adj) n (MAP.make ()) in
      g


  let mkedge (type a) (type b) (g) (a:a) (b:a) (v:b) : (a,b) graph =
    if hasnode g a && hasnode g b && hasedge g a b = false then
      let dest = MAP.get (g.adj) (a) in
      let _ = MAP.put dest b v in
      g
    else
      if hasnode g a = false then
        error "mkedge" ("node "^(g.node2str a)^" does not exist in graph.")
      else if hasnode g b = false then
        error "mkedge" ("node "^(g.node2str a)^" does not exist in graph.")
      else if hasedge g a b = true then
        error "mkedge" ("edge "^(g.node2str a)^"->"^(g.node2str b)^":"^(g.val2str v)^" already exists in graph.")
      else
        error "mkedge" "unknown"





  let tostr g : string =
    let prodstr src snk edge r  =
      let src_str = g.node2str src in
      let dest_str = g.node2str snk in
      let edge_str = g.val2str edge in
      let str = src_str^" -> "^dest_str^" : "^edge_str^"\n" in
      let _ = Printf.printf "map : %s" str in
      (r^str)
    in
    MAP.fold g.adj (fun n chl r -> MAP.fold chl (fun c e r -> prodstr n c e r) r) ""

end




type ('a,'b) cursor = 'a

module TREE =
struct

  let make ncmp ecmp  =
    {
      adj= MAP.make();
      root= None;
      vcmp= ecmp;
      ncmp = ncmp

    }
  let leaves g =
    MAP.fold g.adj (fun k (v,p) r -> if MAP.size v = 0 then k::r else r) []

  let root g =
    g.root

  let filter_nodes (type a) (type b) (g:(a,b) tree) (flt:a->bool) : a list =
    let cands = MAP.filter g.adj (fun k v -> flt k)  in
    List.map (fun (k,v) -> k) cands

  let edge (type a) (type b) (g:(a,b) tree) (x:a) (y:a) : b =
    let chld,_ = MAP.get g.adj x in
    match MAP.filter chld (fun n e -> n = y)  with
    | [(snk,edj)] -> edj
    | _ -> error "edge" "does not exist"


  let children (type a) (type b) (g:(a,b) tree) (n:a) : a list =
    let chld,_ = MAP.get g.adj n in
    MAP.map chld (fun n e -> n)

  let has_child (type a) (type b) (g:(a,b) tree) (n:a) (c:a) : bool =
    let children,_ = MAP.get g.adj n in
    MAP.has children c

  let parent  (type a) (type b) (g:(a,b) tree) (n:a) : a option =
    let _,p = MAP.get g.adj n in
    p

  let hasnode (type a) (type b) (g) (n:a) : bool =
    MAP.has (g.adj) n


  let hasedge (type a) (type b) (g:(a,b) tree) (s:a) (e:a) (v:b) : bool =
    if hasnode g s == false || hasnode g e == false then
      false
    else
      let chld,_ = MAP.get (g.adj) s in
      MAP.has chld e && g.vcmp (MAP.get chld e) v

  let getconn (type a) (type b) (g:(a,b) tree) (s:a) (e:a) : (a*b) option =
    if hasnode g s = false || hasnode g e = false then
      None
    else
      let chld,_ = MAP.get (g.adj) s in
      if MAP.has chld e then
        Some (e,MAP.get chld e)
      else
        None

  let mknode (type a) (type b) (g) (n:a) : (a,b) tree =
    if hasnode g n then
      error "mknode" "node already exists"
    else
      let _ = MAP.put (g.adj) n (MAP.make (), None) in
      g

  let mkedge (type a) (type b) (g) (src:a) (snk:a) (v:b) : (a,b) tree =
    if hasnode g src = false then
      error "mkedge" "source node doesn't exist"
    else if hasnode g snk = false then
      error "mkedge" "sink node doesn't exist"
    else
    (* edges *)
    let edges,_ = MAP.get g.adj src in
    let _ = MAP.put edges snk v in
    let edges,old = MAP.get g.adj snk in
    match old with
    | Some(q) ->
      if q = src then g
      else error "mkedge" "node already has a parent."
    | None ->
      let _ = MAP.put g.adj snk (edges,Some src) in
      g

  let updedge (type a) (type b) g (src:a) (snk:a) (v:b) : (a,b) tree =
    let edges,back = MAP.get g.adj src in
    let _ = match getconn g src snk with
      | Some(conn) -> let _ = MAP.rm edges snk in ()
      | None -> ()
    in
    let _ = mkedge g src snk v in
    g

  let rmnode (type a) (type b) (g) (n:a) : (a,b) tree =
    let rec _rmnode (n:a) =
      if hasnode g n = false then
        error "rmnode" "node does not exist"
      else
        let chld,_ = MAP.get (g.adj) n in
        let _ = MAP.iter chld (fun x v -> _rmnode x) in
        let _ = MAP.rm (g.adj) n in
        ()
    in
    let _ = match parent g n with
      | Some(par) ->
        let parchld,parpar = MAP.get g.adj par in
        let _ = if MAP.has parchld n then return (MAP.rm parchld n) () in
        ()
      | None -> ()
    in
    let _ = _rmnode n in
    g

  let fold_path (type a) (type b) (type c) (nf:a->c->c) (ef:a->a->b->c->c) (g:(a,b) tree) (node:a) (ic:c) =
    let rec _fold_path (node:a) (r:c) : c =
      match parent g node with
      | Some(par) ->
        let edj :b = edge g par node in
        let r = nf node r in
        let r = ef par node edj r in
        let r = _fold_path par r in
        r
      | None ->
        let r = nf node r in
        r
    in
    _fold_path node ic

  let has_ancestor (type a) (type b) (g:(a,b) tree) (en:a) (anc:a) : bool =
    let is_anc = fold_path (fun n c -> if n = anc then true else c) (fun x y z c -> c) g en false in
    is_anc

  let get_path (type a) (type b) (g: (a,b) tree) (en:a) : a list =
    fold_path (fun x lst -> lst @ [x]) (fun src snk v r -> r) g en []

  let fold_from_node (type a) (type b) (type c) (nf:a->c->c) (ef:a->a->b->c->c) (g: (a,b) tree) (en:a) (ic:c) : c =
    let rec proc_path (pth:a list) (r:c) : c = match pth with
      | n1::n2::t ->
        let r = nf n1 r in
        let r = ef n1 n2 (edge g n2 n1) r in
        proc_path (n2::t) r
      | [n1] ->
        let r = nf n1 r in
        r
      | [] -> r
    in
    let path : a list = get_path g en in
    let res : c = proc_path path ic in
    res

  let fold_to_node (type a) (type b) (type c) (nf:a->c->c) (ef:a->a->b->c->c) (g: (a,b) tree) (en:a) (ic:c) : c =
    let rec proc_path (pth:a list) (r:c) : c = match pth with
      | n1::n2::t ->
        let r = nf n1 r in
        let r = ef n1 n2 (edge g n1 n2) r in
        proc_path (n2::t) r
      | [n1] ->
        let r = nf n1 r in
        r
      | [] -> r
    in
    let path = get_path g en in
    proc_path (LIST.rev path) ic

  let ancestor (type a) (type b) (t:(a,b) tree) (a:a) (b:a) : a =
    let pa = get_path t a in
    let pb = get_path t b in
    (*let _ = Printf.printf "LENGTHS: a=%d b=%d\n" (List.length pa) (List.length pb) in*)
    let anc = List.fold_right (fun (q:a)  (r:a option)-> if LIST.has pb q then Some q else r) pa None in
    match anc with
    | Some(a) -> a
    | None -> error "ancestor" "two nodes must have an ancestor."


  let setroot (type a) (type b) (g:(a,b) tree) (src:a) =
    if g.root = None then
      let _ = g.root <- Some src in
      g
    else
      error "setroot" "already exists"



  let depth (type a) (type b) (g: (a,b) tree) (node:a)  : int =
    fold_path (fun x v -> 1+v) (fun src snk v r -> r ) g node 0


  let fold_tree (type a) (type b) (type c) (nfx:a->c->c) (efx:a->a->b->c->c) (g:(a,b) tree) (ic:c)=
    let rec _traverse src (res:c) : c =
      if hasnode g src  = false then
        error "graph/traverse" "node doesn't exist"
      else
        let res = nfx src res in
        let chldrn,_  = MAP.get (g.adj) (src) in
        let proc_chld snk e x =
          let x = efx src snk e x in
          let x = _traverse snk x in
          x
        in
        MAP.fold chldrn proc_chld res
    in
      match g.root with
      |Some(root) ->  _traverse root ic
      |None -> ic


  let tostr (type a) (type b) (g:(a,b) tree) (a2str:int->a->string) (b2str:int->b->string) =
    let fold_node n str =
      let nstr = (a2str (depth g n) n) in
      str^nstr^"\n"
    in
    let fold_edge src snk v str =
      let estr = (b2str (depth g snk) v) in
      str^estr^"\n"
    in
    let v = fold_tree fold_node fold_edge g "" in
    v

  let select (type a) (type b) (g:(a,b) tree) (x:a) =
    if hasnode g x then
      x
    else
      error "select" "cannot select node that does not exist in tree."
end
