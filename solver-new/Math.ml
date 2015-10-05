
type mid = string

type mv_cstr =
  | MMagCstr of float*float
  | MErrCstr of mid ast

type mvar =
  | MInput of string*(mv_cstr list)
  | MOutput of string*(mv_cstr list)
  | MInOut of string*(mv_cstr list)
  | MParam of string*float

type mrel =
  | StateRel of (mid ast_term)*(mid ast)*(float)
  | FxnRel of (mid ast_term)*(mid ast)

type msim_prop =
  | MTimeCstr of float*float
  | MSampleCstr of float

type menv = {
  vars : mvar list;
  rels : mrel list;
  sim : msim_prop list;
}


module MathLib : sig


end =
struct


end
