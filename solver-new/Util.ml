open Core
open Camlp4


type 'a set = ('a,unit) Hashtbl.t

type ('a,'b) map = ('a, 'b) Hashtbl.t

type ('a,'b) pair = Fst of 'a | Snd of 'b

let make_map (type a) (type b) (n:int) : (a,b) map =
  Hashtbl.create n


module REF :
sig
  (* ref(x) creates a new ref containing x *)
  val mk : 'a -> 'a ref

  (* !x is the contents of the ref cell x *)
  val deref : 'a ref -> 'a

  (* Effects: x := y updates the contents of x
  * so it contains y. *)
  val set : 'a ref -> 'a -> unit

end =
struct
  let mk v = ref v
  let deref v = !v
  let set v x = v := x
end
