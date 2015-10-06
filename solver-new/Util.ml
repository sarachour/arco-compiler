open Core
open Camlp4


type 'a set = {
  mutable lst : 'a list;
  cmp : 'a -> 'a -> bool
}

type ('a,'b) map = ('a, 'b) Hashtbl.t

type ('a,'b) pair = Fst of 'a | Snd of 'b

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
