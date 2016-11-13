open Util

open ASTUnifyData
open ASTXUnify

open AST
open Interactive
open Globals

open HWData
open HWLib

open MathData
open MathLib

open Search
open SearchData

open SolverData
open SolverUtil

open SlnLib

open GoalLib
open SolverCompLib

open IntervalData
open IntervalLib

open StochData
open StochLib

open MapData

exception MapUtilError of string

let error n m = raise (MapUtilError (n^":"^m))

let debug = print_debug 2 "eqn"



module MapUtil = struct

  let linearid2str (x:linear_id) = match x with
    | (SVScaleVar(w)) -> "sc."^(SlnLib.wireid2str w)
    | (SVOffsetVar(w)) -> "of."^(SlnLib.wireid2str w)

  let linearsmtid2str (x:linear_smt_id) : string = match x with
    | SVLinVar(x) -> linearid2str x
    | SVSlackVar(SVMin,_,w,i) -> "sl.min."^(SlnLib.wireid2str w)^"."^(string_of_int i)
    | SVSlackVar(SVMax,_,w,i) -> "sl.max."^(SlnLib.wireid2str w)^"."^(string_of_int i)

  let linearexpr2str (x:linear_id ast) : string =
    ASTLib.ast2str x linearid2str

  let linearsmtexpr2str (x:linear_smt_id ast) : string =
    ASTLib.ast2str x linearsmtid2str


  let linearstmt2str (x:linear_stmt) :string =
    let _plst (lst) (f) :string =
      List.fold_left (fun r x -> r^" {"^(f x)^"}") "" lst 
    in
    match x with
    | SVEquals(lst) ->
      "= "^(_plst lst linearexpr2str)
    | SVCoverEq(lst) ->
      "= "^(_plst lst linearsmtexpr2str)
    | SVCoverGTE(lst) ->
      "<= "^(_plst lst linearsmtexpr2str)
    | SVCoverLTE(lst) ->
      ">= "^(_plst lst linearsmtexpr2str)
    | SVDeclMapVar(id) ->
      "decl "^(linearsmtid2str id)
    | SVNoOffset(ast) ->
      "!off "^(linearexpr2str ast)
    | SVNoScale(ast) ->
      "!sc "^(linearexpr2str ast)
    | SVLTE(lhs,rhs) ->
      (linearexpr2str lhs)^"<"^(linearexpr2str rhs)

  let mkhwmapping () =
    {
      offset=999.;
      scale=999.;
      mrng = IntervalLib.mk_num_ival ();
      hrng = IntervalLib.mk_num_ival ();
      wire = SlnLib.mkdflt_wire ();
      expr = Term(MathId(MNVar(MInput,"UNSET")));
    }

  let hwmapping2str (x:hw_mapping) =
    let f2s x = if x = 999. then "?" else string_of_float x in
    let eff_hrng = IntervalLib.clamp x.hrng (IntervalLib.transform x.mrng x.scale x.offset) in 
    let eff_mrng = IntervalLib.inv_transform eff_hrng x.scale x.offset in 
    (SlnLib.wireid2str x.wire)^"  = "^(uast2str x.expr)^"\n"^
    "LIN: "^(f2s x.scale)^"* @ + "^(f2s x.offset)^"\n"^
    "   [H]:"^(IntervalLib.numinterval2str x.hrng)^"\n"^
    "   [M]:"^(IntervalLib.numinterval2str x.mrng)^"\n"^
    "   [h]:"^(IntervalLib.numinterval2str eff_hrng)^"\n"^
    "   [m]:"^(IntervalLib.numinterval2str eff_mrng)^"\n"

 let mappings2str (lst:(wireid,hw_mapping) map ) =
    MAP.fold lst (fun wire mapping str ->
        str^(hwmapping2str mapping)
      ) ""


end
