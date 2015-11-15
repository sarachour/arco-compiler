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

type number = Integer of int | Decimal of float

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

let force_conc (type a) (f:a option): a = match f with
  |Some(q) -> q
  |_ -> error "force_conc" "none is disallowed."

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

module LIST =
struct
  type sortorder =
    SortAscending | SortDescending

  let has lst n =
      List.length (List.filter (fun x -> n = x) lst) > 0

  let count lst n =
      List.length (List.filter (fun x -> n = x) lst)

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

  let tostr (type a) (fn: a->string) (delim:string) (lst:a list) =
    match lst with
    | h::t -> List.fold_left (fun r x -> r^delim^(fn x)) (fn h) t
    | [] -> ""

  let sort (type a) (fn: a->int) (lst:a list) strategy=
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

  let sublist (type a) (t:a list) (st:a) (en:a) =
    let gen (lst,add) v  =
      if add = true && v = st then
        (v::lst,false)
      else if add = true || v = en then
        (v::lst,true)
      else
        (lst,false)
    in
    let f,_ = List.fold_left gen ([],false) t in
    f

  let rand (type a) (s: a list) :a  =
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

  let filter (type a) (type b) (type c) (x:(a,b) map) (f: a->b->bool) : (a*b) list =
    fold x (fun q v k -> if f q v then (q,v)::k else k) []

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

  let tostr (type a) (s:a set) (f:a->string) (delim:string) : string =
    LIST.tostr f delim s.lst

  let iter s f =
    List.iter f (s.lst)

  let fold s f iv =
    List.fold_right f (s.lst) iv


  let map (type a) (type b) (s:a set) (f:a->b): b list  =
    let v = List.map f (s.lst) in
    v

  let get s q =
    match List.filter (fun x -> s.cmp x q) s.lst with
    | [h] -> Some(h)
    | _ -> None

  let filter s f =
    List.filter f (s.lst)

  let rm s v =
    let _ = s.lst <- filter s (fun x -> s.cmp x v = false) in
    ()

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
      let cmp ((n1,v1):a*b) (n2,v2) = (n1 = n2) && g.vcmp v1 v2 in
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


  let tostr g n =
    let prodstr src snk edge r  =
      let src_str = g.node2str src in
      let dest_str = g.node2str snk in
      let edge_str = g.val2str edge in
      true, r^(src_str^" -> "^dest_str^" : "^edge_str)
    in
    let redstr lst =
      List.fold_right (fun x r -> x^"\n"^r) lst ""
    in
    visit g n "" prodstr redstr

end


type ('a,'b) tree = {
  mutable adj : ('a,(('a*'b) set)*('a option)) map;
  mutable root : 'a option;
  ecmp : 'b -> 'b -> bool;
  ncmp : 'a -> 'a -> bool;
}

type ('a,'b) cursor = 'a

module TREE =
struct

  let make ncmp ecmp  =
    {
      adj= MAP.make();
      root= None;
      ncmp= ncmp;
      ecmp= ecmp;

    }
  let leaves g =
    MAP.fold g.adj (fun k (v,p) r -> if SET.size v = 0 then k::r else r) []

  let root g =
    g.root

  let filter_nodes (type a) (type b) (g:(a,b) tree) (flt:a->bool) : a list =
    let cands = MAP.filter g.adj (fun k v -> flt k)  in
    List.map (fun (k,v) -> k) cands

  let edge (type a) (type b) (g:(a,b) tree) (x:a) (y:a) : b =
    let chld,_ = MAP.get g.adj x in
    match SET.filter chld (fun (n,e) -> n = y)  with
    | [(snk,edj)] -> edj
    | _ -> error "edge" "does not exist"


  let parent  (type a) (type b) (g:(a,b) tree) (n:a) : a option =
    let _,p = MAP.get g.adj n in
    p

  let hasnode (type a) (type b) (g) (n:a) : bool =
    MAP.has (g.adj) n

  let hasedge (type a) (type b) g s e v : bool =
    if hasnode g s == false || hasnode g e == false then
      false
    else
      let chld,_ = MAP.get (g.adj) s in
      SET.has chld (e,v)

  let mknode (type a) (type b) (g) (n:a) : (a,b) tree =
    if hasnode g n then
      error "mknode" "node already exists"
    else
      let cmp ((n1,v1):a*b) (n2,v2) = g.ncmp n1 n2 && g.ecmp v1 v2 in
      let _ = MAP.put (g.adj) n (SET.make cmp, None) in
      g

  let mkedge (type a) (type b) (g) (src:a) (snk:a) (v:b) : (a,b) tree =
    let chld,_ = MAP.get g.adj src in
    let _ = SET.add chld (snk,v) in
    let chld,_ = MAP.get g.adj snk in
    let _ = MAP.put g.adj snk (chld,Some src) in
    g


  let rmnode (type a) (type b) (g) (n:a) : (a,b) tree =
    let rec _rmnode (n:a) =
      if hasnode g n = false then
        error "mknode" "node does not exist"
      else
        let chld,_ = MAP.get (g.adj) n in
        let _ = SET.iter chld (fun (x,v) -> _rmnode x) in
        let _ = MAP.rm (g.adj) n in
        ()
    in
    let _ = match parent g n with
      | Some(par) ->
        let parchld,parpar = MAP.get g.adj par in
        let parchld = SET.to_set (SET.filter parchld (fun (x,v) -> g.ncmp x n == false)) parchld.cmp in
        let _ = MAP.put g.adj par (parchld,parpar) in
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

  let get_path (type a) (type b) (g: (a,b) tree) (en:a) : a list =
    fold_path (fun x lst -> lst @ [x]) (fun src snk v r -> r) g en []


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
        let proc_chld (snk,e) x =
          let x = _traverse snk x in
          let x = efx src snk e x in
          x
        in
        SET.fold chldrn proc_chld res
    in
      match g.root with
      |Some(root) ->  _traverse root ic
      |None -> ic


  let tostr (type a) (type b) (g:(a,b) tree) (a2str:int->a->string) =
    let fold_node n str =
      str^(a2str (depth g n) n)^"\n"
    in
    let fold_edge src snk v str =
      str
    in
    let v = fold_tree fold_node fold_edge g "" in
    v

  let select (type a) (type b) (g:(a,b) tree) (x:a) =
    if hasnode g x then
      x
    else
      error "select" "cannot select node that does not exist in tree."
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
