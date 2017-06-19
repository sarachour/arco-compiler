open Core
open Camlp4
open Random

exception UtilError of string

let error n m = raise (UtilError (n^":"^m))

let warn fxn msg = 
  Printf.printf "[WARN][%s] %s\n" fxn msg;
  flush_all ();
  ()

let noop x = x; ()
let ret x r = x; r

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
  mutable id2n : (int,'a) map;
  mutable adj : (int,((int,'b) map)*(int option)) map;
  mutable root : int option;
  n2id : 'a -> int;
  vcmp : 'b -> 'b -> bool
}

let ident x = x 
let return x b =
  x;
  b


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
  let tostr (type a) (f:a option) (ts:a->string) = match f with
    | Some(q) -> ts q
    | None -> "<none>"

  let force_conc (type a) (f:a option): a = match f with
    |Some(q) -> q
    |_ -> error "force_conc" "none is disallowed."

  let casc_some (type a) (f: a option) (dflt :a) = match f with
  | Some(q) -> Some(q)
  | None -> Some dflt

  let map (type a) (type b) (f:a option) (fn:a->b) : b option =
    match f with
    | Some(x) -> Some(fn x)
    | None -> None

  let map_option (type a) (type b) (f:a option) (fn:a->b option) : b option =
    match f with
    | Some(x) -> fn x
    | None -> None


  let conc_list (type a) (f: a option list) : a list =
    List.fold_left (fun lst el -> match el with
        | Some(e) -> e::lst | None -> lst ) [] f
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
  let is_infinite x =
    x = infinity || x = 0.-.infinity

  let max x y = 
          if x < y then y else x

  let round x : float =
    let v = snd (modf (x +. copysign 0.5 x)) in
    v
  
  let round_up x : float = 
    ceil x 

  let float_is_int (x:float) =
    let xt : float = round x in
    let diff : float = abs_float(x-.xt) in
    if diff < 1e-10 then
      true
    else
      false

  let int_of_float x =  int_of_float (round x)

  let cmp (f1:float) (f2:float) (eps:float) : bool =
    let diff = abs_float(f1 -. f2) in
    diff < eps

  let rec countdown (n:int) (fxn: int -> unit) : unit =
    match n with
    | 0 -> ()
    | x -> fxn x; countdown (x-1) fxn


  let max (a:float list) =
    match a with
    | h::t -> List.fold_right (fun x max ->
      if  x > max then x else max) t h
    | [] -> error "max" "cannot take max of empty array"

  let min (a:float list) =
    match a with
    | h::t -> List.fold_right (fun x min ->
      if  x < min then x else min) t h
    | [] -> error "min" "cannot take max of empty array"

end

module NUMBER =
struct
  let float_of_number (x:number) = match x with
    | Integer(i) -> float_of_int i
    | Decimal(f) -> f

  let float_list_of_number_list (x:number list) =
    List.map float_of_number x

  let max numlst = MATH.max (float_list_of_number_list numlst)
  let min numlst = MATH.min (float_list_of_number_list numlst)

  let mult a b = match a, b with
    | Integer(a),Integer(b) -> Integer(a*b)
    | Integer(a),Decimal(b) -> Decimal((float_of_int a)*.b)
    | Decimal(a),Integer(b) -> Decimal((float_of_int b)*.a)
    | Decimal(a),Decimal(b) -> Decimal(a*.b)

  let is_zero x = match x with
    | Integer(0) -> true
    | Decimal(0.0) -> true
    | _ -> false
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
  
  let rand_boolean () = 
    match Random.int(2) with
    | 0 -> true
    | 1 -> false

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

  let count (s:string) (sub:string) : int=
    (List.length (split s sub)) - 1

  let startswith (s:string) (p:string) : bool =
    Str.string_match (Str.regexp p) s 0

  let compare (s1) (s2) : int =
    String.compare s1 s2

  let removeprefix (s:string) (prefix:string)  =
    List.nth (Str.split (Str.regexp prefix) s) 0

  let remove_last_char (s:string) =
    String.sub s 0 (String.length s - 1)
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
    REF.upd s (fun s -> s @ [x]);
    s

  let enqueue_all s lst =
    REF.upd s (fun x -> x @ lst);
    s

  let to_list (type a) (s:a queue) : a list =
    REF.dr s

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


  let filter (type a) (s:a queue) (f:a->bool) : a list =
    List.filter f (REF.dr s)

  let split (type a) (s:a queue) (f:a -> bool) :a list*a list =
    let matches,rest = List.fold_left (fun (matches,rest) (el:a)  ->
        if f el then (el::matches,rest) else (matches,el::rest)
      ) ([],[]) (REF.dr s)
    in
    matches,rest


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

  let clear (type a) (x:a queue) =
    REF.upd x (fun a -> [])

  let map (type a) (type b) (x:a queue) (r:a -> b): (b list) =
    List.map r (REF.dr x)

  let iter (type a) (type b) (x:a queue) (r:a -> unit): unit =
    List.iter r (REF.dr x)

  let fold (type a) (type b) (x:a queue) (r:a -> b -> b) (init:b): b=
    List.fold_left (fun x y -> r y x) init (REF.dr x)

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

  let destroy (type a) (type b) (x:a queue) : unit =
    ()

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

  let size (s) =
    List.length (REF.dr s)

  let push (type a) (s:a stack) (x:a) : a stack =
    let _ : unit = REF.upd s (fun s -> x::s) in s

  let pop (type a) (s:a stack) : a stack =
    let _ : unit = REF.upd s (fun st ->
      match st with
      | h::t -> t
      | [] -> error "stack.pop" "failed to dequeue empty list"
    ) in s

  let pop_bottom (type a) (s:a stack) : a stack =
    let s_lst =  REF.dr s in
    let rec _pop_bottom lst = match lst with
      | h::h2::t -> h::(_pop_bottom (h2::t))
      | [h] -> []
      | [] -> error "tail" "cannot take tail of one element stack"
    in
    REF.mk (_pop_bottom s_lst)

  let peek (type a) (s:a stack) : a =
    match REF.dr s with
    | h::t -> h
    | _ -> error "stack.peek" "can't peek empty list"

  let empty (type a) (s:a stack) : a queue =
    let _ = REF.upd s (fun st -> []) in
    s

  let filter (type a) (s:a stack) (f:a->bool) : a list =
    List.filter f (REF.dr s)

  let fold (type a) (type b)(s:a stack) (f:a->b->b) (x0:b) : b =
    List.fold_right f (REF.dr s) x0

  let iter (type a) (s:a stack) (f:a->unit) : unit =
    List.iter f (REF.dr s)

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
  

  let length2str lst =
    string_of_int (List.length lst)

  let has lst n =
      List.length (List.filter (fun x -> n = x) lst) > 0

  let count_val lst n =
      List.length (List.filter (fun x -> n = x) lst)

  let count lst (fn:'a -> bool) =
      List.length (List.filter (fun x -> fn x) lst)

  let empty x =
    List.length x = 0

  let last x =
    List.nth x (List.length x - 1)

  let rec except_last x = match x with
    | [h] -> []
    | h::t -> h::(except_last t)
    | [] -> []

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

  let split (type a) (s:a list) (f:a -> bool) :a list*a list =
    let matches,rest = List.fold_left (fun (matches,rest) (el:a)  ->
        if f el then (el::matches,rest) else (matches,el::rest)
      ) ([],[]) (s)
    in
    matches,rest

  let merge (type a) (lsts : a list list) : a list = 
    List.fold_left (fun clst lst -> clst @ lst) [] lsts 


  let uniq a =
    List.fold_right (fun x r -> if count_val r x = 0 then x::r else r) a []

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

  let is_subset (type a) (super: a list) (sub:a list): bool =
    List.fold_right (fun x members -> (has super x)&&members) sub true
      

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

  let partition (x:'a list) fn : ('a list*'a list) =
    List.fold_left (fun (y,n) el ->
        if fn el then (el::y,n) else (y,el::n)
      ) ([],[]) x

  let fold x f c0 = List.fold_right f x c0

  let tostr (type a) (fn: a->string) (delim:string) (lst:a list) =
    match lst with
    (*move from beginning to end*)
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

  let sum fxn lst =
    List.fold_left (fun r x -> r +. (fxn x)) 0. lst

  let sub (type a) (t:a) (v:a) (lst:a list) =
    List.map (fun x -> if x = t then v else x) lst

  let rm (type a) (t:a) (lst: a list) =
    List.filter (fun x -> if x = t then false else true) lst

  let rev (type a) (t:a list) =
    List.rev t

  let from_end x i =
    List.nth (rev x) i

  let rm_before (type a) (lst:a list) (heuristic:a->bool) =
    let rec _split l = match l with
      | h::t -> if heuristic h then h::t else _split t
      | [] -> []
    in
    _split lst

  let rm_after (type a) (lst:a list) (heuristic:a->bool) =
    let rec _split l = match l with
      | h::t -> if heuristic h then [h] else h::(_split t)
      | [] -> []
    in
    _split lst

   



  let rand (type a) (s: a list) :a  =
    if List.length s == 0 then
      error "rand" "cannot take random element of empty list."
    else
    let n = List.length s in
    let i = Random.int(n) in
    List.nth s i

  (*select a random subset*)
  let random_subset lst nelems =
    let rec _random_subset lst nelems unused = 
        if nelems > 0 then
         match lst with
         | h::t -> if RAND.rand_boolean ()
            then h::(_random_subset t (nelems - 1) unused)
            else _random_subset t (nelems) (h::unused)       
         | [] ->
            _random_subset unused nelems [] 
        else
        []
    in
    if List.length lst <= nelems then
      lst
    else
      _random_subset lst nelems [] 

  let random_weighted_subset (type a) (fxn:a->int) (lst:a list) (nelems:int) : a list=
    let total (lst:a list) : int= List.fold_left (fun r a -> (fxn a) + r) 0 lst  in
    let except lst el =List.filter (fun q -> q != el) lst in
    let rec compute_el v lst = match lst with
      | h::t -> let wt = fxn h in
        if v <= wt then h else compute_el (v-wt) t
      | [] -> error "random_weighted_subset" "must not exceed total"
    in
    let rec _random_subset lst nelems =
      if nelems == 0 then [] else
      let el = compute_el (RAND.rand_int (total lst)) lst in
      el::(_random_subset (except lst el) (nelems-1))
    in 
    _random_subset lst nelems

  let same_membership lst other =
    let lst_minus_other = List.filter (fun x -> has other x = false) lst in
    let other_minus_lst = List.filter (fun x -> has lst x = false) other in
    List.length lst_minus_other == 0 && List.length other_minus_lst == 0


  let equiv = same_membership

  let permutations (type a) (options:(a list) list) =
    let rec explore options (selections:(a list) list) = match options with
      |(curr_option)::t ->
        (*explode selection so that each selection has prefix of all available current options*)
        let new_options : (a list) list =
          List.fold_right (fun (selection:a list) (new_selections:a list list) ->
              let upd_selection :a list list =
                List.fold_right (
                  fun (option:a) (new_selection:a list list)->
                    (option::selection)::new_selection 
                  ) curr_option []
              in
              upd_selection @ new_selections
          ) selections []
        in
        explore t new_options
      | [] -> selections
    in
    (*make initial set of selections*)
    match options with
    | h::t -> explore t (List.map (fun x -> [x]) h)
    | [] -> []

  let pairwise (type a) (type b) (type c) (alst:(a list)) (blst:(b list)) (fn:a->b->c) : c list =
    List.fold_right (fun ael results->
        List.fold_right (fun bel results ->
            (fn ael bel)::results
          ) blst results
      ) alst []

end

type 'a ord_set_node = {
  d:'a;
  mutable prev:'a ord_set_node ref;
  mutable next:'a ord_set_node ref;
}

type 'a _ord_set = {
  mutable start_node: 'a ord_set_node ref;
  mutable end_node: 'a ord_set_node ref;
}

type ord_dir = Before | After | SameAs
type 'a ord_set = {
  mutable lst: 'a _ord_set option;
  cmp: 'a -> 'a -> ord_dir;
  mutable len : int;
}


module ORDSET = 
struct
  let make (type a) (cmp:a->a->ord_dir) = {
    lst = None;
    cmp = cmp; 
    len = 0;
  }
  let _make_node (type a) (x:a) = 
    let rec n = {
      d=x;
      prev=ref n;
      next=ref n;
    }
    in
    n
  
  let length (type a) (s:a ord_set) = 
    s.len 

  let _insert_before (type a) (s:a _ord_set) (curr_ref:a ord_set_node ref) (x:a) =
    let ins = _make_node x in 
    let ins_ref = REF.mk ins in
    let curr = REF.dr curr_ref in  
    if curr_ref == s.start_node then
      let _ = curr.prev <- ins_ref in
      let _ = ins.next <-curr_ref in
      let _ = s.start_node <- ins_ref in 
      ()
    else
      let before = REF.dr curr.prev in 
      let before_ref = curr.prev in 
      let _ = before.next <- ins_ref in
      let _ = ins.prev <- before_ref in 
      let _ = ins.next <- curr_ref in 
      let _ = curr.prev <- ins_ref in 
      ()
  
  let _insert_after (type a) (s:a _ord_set) (curr_ref:a ord_set_node ref) (x:a) = 
    let ins = _make_node x in 
    let ins_ref = REF.mk ins in 
    let curr = REF.dr curr_ref   in 
    if curr_ref == s.end_node then 
      let _ = curr.next <- ins_ref in 
      let _ = ins.prev <- curr_ref in 
      let _ = s.end_node <- ins_ref in 
      ()
    else
      let after = REF.dr curr.next in
      let after_ref = curr.next in
      let _ = curr.next <- ins_ref in
      let _ = ins.prev <- curr_ref in 
      let _ = after.prev <- curr_ref in 
      let _ = ins.next <- after_ref in 
      ()
  
  let _fold_node (type a) (type b) (s:a _ord_set) (fxn:a ord_set_node ref -> b -> b) (n:a ord_set_node ref) (vl:b) : b=
    let rec __fold_node (n:a ord_set_node ref) (vl:b) : b=
      let new_vl : b= fxn n vl in 
      if  n == s.end_node then
       new_vl
      else
       __fold_node ((REF.dr n).next) new_vl
    in 
    __fold_node n vl

  let rec _fold (type a) (type b) (s:a _ord_set) (fxn:a -> b -> b) (n:a ord_set_node ref) (vl:b) : b = 
    _fold_node s (fun x y -> fxn (REF.dr x).d y) n vl 

  let iter (type a) (s:a ord_set) (fxn:a->unit) = match s.lst with 
  | Some(root) ->
      _fold root (fun x b -> fxn(x) ) root.start_node ()
  | None -> ()
  
  let fold (type a) (type b) (s:a ord_set) (fxn:a->b->b) (vl:b) = match s.lst with 
  | Some(root) -> 
    _fold root fxn root.start_node vl
  | None ->
      vl
  
  let ord2str (type a) (type b) (s:a ord_set) (fxn:a->string) = match s.lst with 
  | Some(root) -> 
    _fold root (fun x r -> r^" "^(fxn x) ) root.start_node ""
  | None ->
      ""
 

  let _rm (type a) (ord : a ord_set) (s: a _ord_set) (x:a) : bool = 
    let sn_ref = s.start_node in 
    let en_ref = s.end_node in 
    let sn = REF.dr sn_ref in 
    let en = REF.dr en_ref in 
    if ord.cmp sn.d x = SameAs then 
      let new_sn = REF.dr sn.next in 
      let new_sn_ref = sn.next in
      let _ = s.start_node <- new_sn_ref in 
      let _ = new_sn.prev <- new_sn_ref in 
      true
    else if ord.cmp en.d x = SameAs then 
      let new_en = REF.dr en.prev in 
      let new_en_ref = en.prev in 
      let _ = s.end_node <- new_en_ref in 
      let _ = new_en.next <- new_en_ref in 
      true
    else
      let rec remove_node curr_ref =
       let curr = REF.dr curr_ref in
       if ord.cmp curr.d x = SameAs then 
          let prev_ref = curr.prev in 
          let next_ref = curr.next in 
          let prev = REF.dr prev_ref in 
          let next = REF.dr next_ref in 
          let _ = prev.next <- next_ref in
          let _ = next.prev <- prev_ref in
          true
       else
        if curr_ref == s.end_node then false
        else remove_node curr.next   
      in
      remove_node sn_ref
      
  
  let front (type a) (s:a ord_set) :a option = match s.lst with 
  | Some(root) -> Some ((REF.dr root.start_node).d)
  | None -> None
  
  let back (type a) (s:a ord_set) :a option = match s.lst with 
  | Some(root) -> Some ((REF.dr root.end_node).d)
  | None -> None
  
  let rm s x = match s.lst with 
  | Some(root) -> 
      if _rm s root x then
        let _ = s.len <- s.len - 1 in 
        if s.len == 0 then
          let _ = s.lst <- None in 
          ()
        else
          ()
      else
        ()
  | None -> ()

  let add s x =  match s.lst with
  | Some(root) ->
      let cmp floating node  = s.cmp floating node in
      let rec find_node curr_ref =
        let curr = REF.dr curr_ref in 
        match cmp x curr.d with
        | Before -> Some curr_ref
        | SameAs-> Some curr_ref 
        | After ->
            if curr_ref == root.end_node then
              None
            else find_node curr.next
      in
      begin 
      match find_node root.start_node with 
      | Some(node) -> 
        if cmp x (REF.dr node).d = SameAs then () 
        else 
          let _ = s.len <- s.len + 1 in 
          _insert_before root node x 
      | None -> 
        let _ = s.len <- s.len + 1 in 
        _insert_after root root.end_node x
    end
  | None ->
    let xn = _make_node x in 
    let xn_ref = REF.mk xn in 
    let _ = s.len <- s.len + 1 in 
    let _ = s.lst <- Some({start_node=xn_ref;end_node=xn_ref}) in  
    ()

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

  let get_dflt (type a) (type b) (x:(a,b) map) (k:a) (dflt:b) : b =
    if has x k then
      get x k
    else
      dflt


  let ifget (type a) (type b) (x:(a,b) map) (k:a) : b option =
    if has x k then
      Some (get x k)
    else
      None

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

  let upd_all (type a) (type b) (x:(a,b) map) (f:b->b)  : (a,b) map =
      iter x (fun k v -> let _ =upd x f k in ());
      x


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

  let diff (type a) (type b) (x:(a,b) map) (y:(a,b) map) cmp:(a*b) list =
    let diff1 = fold x (fun key vl df ->
        if has y key then
          let vl2 = get y key in
          begin
            if  cmp vl vl2 then df else (key,vl)::df
          end
        else
          (key,vl)::df
      ) [] in 
    let diff2 = fold y (fun key vl df ->
        if has x key then
          let vl2 = get x key in
          begin
            if cmp vl vl2 then df else (key,vl)::df
          end
        else
          (key,vl)::df
      ) diff1 in
    diff2

  let equiv x y cmp =
    List.length (diff x y cmp) = 0

  let from_list (type a) (type b) (x:(a*b) list) : (a,b) map =
    let mp = make() in
    let _ = List.iter (fun (k,v) -> let _ = put mp k v in ()) x in
    mp
  
  let merge (type a) (type b) (x:((a,b) map) list) : (a,b) map = 
      let newm = make () in 
      List.iter (fun m -> iter m (fun k v ->  let _ =put newm k v in ())) x;
      newm

  let filter_map (type a) (type b) (x:(a,b) map) (f: a->b->bool) : (a,b) map = 
    from_list (filter x f)


  let set (type a) (type b) (x: (a,b) map) (y: (a,b) map) =
    let _ = clear x in
    let _ = iter y (fun a b -> let _ = put x a b in ()) in
    ()

  let singleton (type a) (type b) (x:(a,b) map): (a*b) =
    if size x != 1 then
      error "MAP.singleton" ("must have exactly one element. has ["^(string_of_int (size x))^"] elements")
    else
      let r = match fold x (fun x y r -> Some(x,y)) None with
        | Some(v) -> v
        | None ->
          error "MAP.singleton" "must have exactly one element."
      in
      r

  let same_membership (type a) (type b) (x:(a,b) map) (y:(a,b) map): bool =
    if LIST.same_membership (keys x) (keys y) = false then false
    else
    fold x (fun k v eq -> ((get y k) = v) && eq)  true



end

module SET =
struct

  let destroy (type a) m =
    ()

  let make (type a) () : a set = MAP.make()

  let make_dflt (type a) () : a set = make ()

  
  let tostr (type a) (a:a set) (f:a -> string) (delim:string) =
    MAP.fold a (fun k v r -> r^delim^(f k)) ""

  let has s e = MAP.has s e

  let has_any (type a) (s:a set) (lst:a list) : bool =
    List.fold_left (fun had k -> has s k || had) false lst 

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

  (*add b to a*)
  let add_set (type a) (a:a set) (b:a set) =
    iter b (fun x -> noop (add a x))

  let fold (type a) (s:a set) f iv =
    MAP.fold (s) (fun k v r -> f k r) iv

  let fold_i  s f iv =
    MAP.fold s (fun x (i,v) -> (f x i v)) (0,iv)

  let iter_i  (type a) (s:a set) (f:a->int->unit) =
    let final : int = MAP.fold s (fun (x:a) y (i:int) -> f x i; i+1) 0 in
    ()

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

  let equiv x y =
    MAP.equiv x y (fun x y -> x = y)

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
  
  let singleton (type a) (s: a set) : a =
    let x,_ = MAP.singleton s in
    x 
end


type 'a prioqueue = {
  mutable order : int set;
  mutable data: (int,'a list) map;
  mutable size:int;
  score : 'a -> int;
}
module PRIOQUEUE =
struct


  let size x : int =
    x.size

  let make (f:'a -> int) : 'a prioqueue =
    {size=0;order=SET.make(); data=MAP.make(); score=f}


  let add (p:'a prioqueue) (x:'a) =
    let score = p.score x in
    SET.add p.order score;
    if MAP.has p.data score  = false then
      noop (MAP.put p.data score [])
    ;
    let els = MAP.get p.data score in
    MAP.put p.data score (x::els);
    p.size <- p.size + 1;
    ()

  let fold (p:'a prioqueue) (f:int->'a -> 'b -> 'b) (x0:'b) =
    let lst : int list= SET.sort p.order (fun x y -> x - y) in
    List.fold_right (fun prio (r0:'b) ->
        let els = MAP.get p.data prio in
        List.fold_right (fun el r -> f prio el r) els r0
      ) lst x0

  let iter (p:'a prioqueue) (f:int -> 'a -> unit) =
    fold p (fun i x () -> f i x) ()

  let to_list x : 'a list =
    fold x (fun i el rst -> el::rst) []

  let delete (p:'a prioqueue) =
    MAP.clear p.data;
    SET.clear p.order;
    ()
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
   
  let reachable (type a) (type b) (g:(a,b) graph) (src:a) (dest:a) (nhops:int) : bool = 
    let rec try_reach (path:a list) (curr:a) (hops:int): bool =
      if curr = dest then true
      else if (LIST.has path curr) then false
      else if nhops >= 0 && hops >= nhops then false
      else
        let chld = children g curr in
        let npath = curr:: path in 
        let result = LIST.fold chld (fun x r -> r || (try_reach npath x (hops+1) ) ) false in
        result
    in
    try_reach [] src 0
    
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

  let make n2id vcmp =
    {
      id2n = MAP.make();
      adj= MAP.make();
      root= None;
      n2id = n2id;
      vcmp = vcmp;
   }
 
  let i2n (type a) (type b) (g:(a,b) tree) i : a = 
    if MAP.has g.id2n i 
        then MAP.get g.id2n i
        else error "i2n" ("tree does not have id "^(string_of_int i))

  let n2i g n = g.n2id n


  let leaves (type a) (type b) (g:(a,b) tree) : a list =
    MAP.fold g.adj (fun k (v,p) r -> if MAP.size v = 0 then (i2n g k)::r else r) []

  let root (type a) (type b) (g:(a,b) tree) : a option =
    match g.root with 
    | Some(x) -> Some (i2n g x) 
    | None -> None 
 
  let filter_nodes (type a) (type b) (g:(a,b) tree) (flt:a->bool) : a list =
    let cands = MAP.filter g.adj (fun k v -> flt (i2n g k))  in
    List.map (fun (k,v) -> i2n g k) cands

  let edge (type a) (type b) (g:(a,b) tree) (x:a) (y:a) : b =
    let yid = n2i g y in
    let xid = n2i g x in 
    let chld,_ = MAP.get g.adj xid in
    match MAP.filter chld (fun n e -> n = yid)  with
    | [(snk,edj)] -> edj
    | _ -> error "edge" "does not exist"


  let children (type a) (type b) (g:(a,b) tree) (n:a) : a list =
    let chld,_ = MAP.get g.adj (n2i g n) in
    MAP.map chld (fun n e -> i2n g n)

  let has_child (type a) (type b) (g:(a,b) tree) (n:a) (c:a) : bool =
    let children,_ = MAP.get g.adj (n2i g n) in
    MAP.has children (n2i g c)

  let parent  (type a) (type b) (g:(a,b) tree) (n:a) : a option =
    let _,p = MAP.get g.adj (n2i g n) in
    match p with 
    | Some(id) -> Some (i2n g id)
    | None -> None 

  let hasnode (type a) (type b) (g) (n:a) : bool =
    MAP.has (g.adj) (n2i g n)


  let hasedge (type a) (type b) (g:(a,b) tree) (s:a) (e:a) (v:b) : bool =
    if hasnode g s == false || hasnode g e == false then
      false
    else
      let chld,_ = MAP.get (g.adj) (n2i g s) in
      MAP.has chld (n2i g e) && g.vcmp (MAP.get chld (n2i g e)) v

  let getconn (type a) (type b) (g:(a,b) tree) (s:a) (e:a) : (a*b) option =
    if hasnode g s = false || hasnode g e = false then
      None
    else
      let chld,_ = MAP.get (g.adj) (n2i g s) in
      if MAP.has chld (n2i g e) then
        Some (e,MAP.get chld (n2i g e))
      else
        None

  let mknode (type a) (type b) (g) (n:a) : (a,b) tree =
    if hasnode g n then
      error "mknode" "node already exists"
    else
      MAP.put (g.id2n) (n2i g n) n;
      MAP.put (g.adj) (n2i g n) (MAP.make (), None);
      g

  let mkedge (type a) (type b) (g) (src:a) (snk:a) (v:b) : (a,b) tree =
    if hasnode g src = false then
      error "mkedge" "source node doesn't exist"
    else if hasnode g snk = false then
      error "mkedge" "sink node doesn't exist"
    else
    (* edges *)
    let edges,_ = MAP.get g.adj (n2i g src) in
    let _ = MAP.put edges (n2i g snk) v in
    let edges,old = MAP.get g.adj (n2i g snk) in
    match old with
    | Some(q) ->
      if q = n2i g src then g
      else error "mkedge" "node already has a parent."
    | None ->
      let _ = MAP.put g.adj (n2i g snk) (edges,Some (n2i g src)) in
      g

  let updedge (type a) (type b) g (src:a) (snk:a) (v:b) : (a,b) tree =
    let edges,back = MAP.get g.adj (n2i g src) in
    let _ = MAP.upd edges (fun _ -> v) (n2i g snk) in 
    g

  let rmnode (type a) (type b) (g) (n:a) : (a,b) tree =
    let rec _rmnode (n:a) =
      if hasnode g n = false then
        error "rmnode" "node does not exist"
      else
        let n_id : int = n2i g n in
        let chld,_ = MAP.get (g.adj) n_id in
        begin
        MAP.iter chld (fun x v -> _rmnode (i2n g x));
        MAP.rm (g.adj) (n2i g n);
        MAP.rm (g.id2n) (n2i g n);
        match g.root with
        | Some(root_id) -> if root_id = n_id then
            g.root <- None; ()
        | None -> ()
        end
    in
    begin
    match parent g n with
      | Some(par) ->
        let parchld,parpar = MAP.get g.adj (n2i g par) in
        let _ = if MAP.has parchld (n2i g n) then 
          return (MAP.rm parchld (n2i g n)) () in
        ()
      | None -> ()
    end;
    _rmnode n;
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
    let pa : a list = get_path t a in
    let pb : a list = get_path t b in
    let anc = List.fold_right (fun (q:a)  (r:a option)->
        if LIST.has pb q then
          Some q
        else
          r
      ) pa None in
    match anc with
    | Some(a) -> a
    | None -> error "ancestor" "two nodes must have an ancestor."


  let setroot (type a) (type b) (g:(a,b) tree) (src:a) =
    if g.root = None then
      begin
        g.root <- Some (n2i g src);
        mknode g src;
        g
      end
    else
      error "setroot" "already exists"



  let depth (type a) (type b) (g: (a,b) tree) (node:a)  : int =
    if hasnode g node = false then 
      error "depth" ("node doesn't exist.")
    else
    fold_path (fun x v -> 1+v) (fun src snk v r -> r ) g node 0


  let fold_tree (type a) (type b) (type c) (nfx:a->c->c) (efx:a->a->b->c->c) (g:(a,b) tree) (ic:c)=
    let rec _traverse src (res:c) : c =
      if hasnode g src  = false then
        error "graph/traverse" "node doesn't exist"
      else
        let res = nfx src res in
        let chldrn,_  = MAP.get (g.adj) (n2i g src) in
        let proc_chld (snk:int) e x =
          let x = efx src (i2n g snk) e x in
          let x = _traverse (i2n g snk) x in
          x
        in
        MAP.fold chldrn proc_chld res
    in
      match g.root with
      | Some(root) ->  _traverse (i2n g root) ic
      | None -> ic


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
