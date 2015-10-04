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

let file_to_lexbuf f =
  let in_chan = open_in(f) in
  let lexbuf = Lexing.from_channel in_chan in
  lexbuf
