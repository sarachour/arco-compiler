


module DEQEnv:
sig
  type env = {
    mutable names : string list;
  }
  val create: unit -> env
  val print: env -> unit
end =
struct
  type env = {
    mutable names : string list;
  }
  let create() = {names=[];}
  let print e = print_string "TT\n"
end