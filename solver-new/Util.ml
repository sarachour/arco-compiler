open Core
open Camlp4


type 'a set = ('a,unit) Hashtbl.t

type ('a,'b) map = ('a, 'b) Hashtbl.t

type ('a,'b) pair = Fst of 'a | Snd of 'b
