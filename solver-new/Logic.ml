open Util

exception LogicException of string*string
let error n msg = raise (LogicException(n,msg))

type ptr = int
type 'a logic_node =
  | End
  | Data of 'a
  | Memory of ptr

type 'a logic =
  | Any of (module Set.S with type elt=('a logic))
  | All of (module Set.S with type elt=('a logic))
  | Node of 'a logic_node


module Logic : sig
  val to_string : 'a logic -> ('a -> string) -> string
  val map : 'a logic -> ('a logic_node -> 'b logic_node) -> 'b logic_node
end =
struct
  let to_string l fn = error "to_string" "unimplemented"
  let map fn = error "map" "unimplemented"

end
