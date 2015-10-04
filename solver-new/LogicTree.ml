open Util

exception LogicException of string*string
let error n msg = raise (LogicException(n,msg))

type ptr = int
type 'a logic =
  | Any of (module Set.S with type elt=('a logic))
  | All of (module Set.S with type elt=('a logic))
  | End
  | Node of 'a*('a logic)
  | Memory of ptr


module Logic : sig
  val to_string : 'a logic -> ('a -> string) -> string
end =
struct
  let to_string l fn = error "to_string" "unimplemented"

end
