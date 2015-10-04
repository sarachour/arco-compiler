open Core
open Camlp4



let make_set (type s) () =
  let module S = Set.Make(
    struct
      type t = s
      let compare = Pervasives.compare
    end) in
    (module S : Set.S with type elt = s)


type ('a,'b) pair = Fst of 'a | Snd of 'b
