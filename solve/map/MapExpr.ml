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
open Z3Data

open SolverData
open SolverUtil

open SlnLib

open GoalLib
open SolverCompLib

open MapIntervalCompute
open IntervalData
open IntervalLib

open StochData
open StochLib

open MapData
open MapUtil

open SymCamlData


exception MapExprError of string

let error n m = raise (MapExprError (n^":"^m))

let debug = print_debug 4 "prob-gen"
let dumb_cstrs_DBG = false 
  

module MapExpr =
struct

  let unwrap_map_var (p:'a map_var) : 'a =
    match p with
    | MPVScale(v) -> v
    | MPVOffset(v) -> v

  let get_abs_var (p:('a -> map_port_info)) (v:'a map_var) =
    match v with
    | MPVScale(vr) ->
      let data = p vr in
      data.scale
    | MPVOffset(vr) ->
      let data = p vr in
      data.offset

  let string_of_map_cstr (p:'a map_cstr) =
    match p with
    | MCGT(v,e) -> ">"
    | MCGTE(v,e) -> ">="
    | MCEQ(v,e) -> "="
    | MCNot(cstr) -> "!"
    | MCAnd(a,b) -> "^"
    | MCOr(a,b) -> "|"

  let z3_of_map_cstr (cstr:'a map_cstr) (fxn:'a map_expr -> z3expr) =
    let rec _work cstr = 
      match cstr with
      |MCGT(v,e) -> Z3GT(fxn (MEVar v),fxn e)
      |MCLT(v,e) -> Z3LT(fxn (MEVar v),fxn e)
      |MCGTE(v,e) -> Z3GTE(fxn (MEVar v),fxn e)
      |MCLTE(v,e) -> Z3LTE(fxn (MEVar v),fxn e)
      |MCEQ(v,e) -> Z3Eq(fxn (MEVar v),fxn e)
      |MCNot(cstr) -> Z3Not(_work cstr)
      |MCAnd(a,b) -> Z3And(_work a, _work b)
      |MCOr(a,b) -> Z3Or(_work a, _work b)
    in
    _work cstr 
  let string_of_map_port (p:map_port) =
    let comp,port = p in
    "<"^(HwLib.hwcompname2str comp)^","^port^">"

  let string_of_map_var (type a) (p:a map_var ) tostr = match p with
    | MPVOffset(o) -> "offset("^(tostr o)^")"
    | MPVScale(o) -> "scale("^(tostr o)^")"

  let string_of_map_port_var q =
    string_of_map_var q string_of_map_port


  
  let string_of_map_expr (type a) (x:a map_expr) (tostr:a -> string) =
    let rec _tostr e =
      match e with
        | MEVar(q) -> tostr q
        | MEAdd(a,b) -> (_tostr a)^"+"^(_tostr b)
        | MESub(a,b) -> (_tostr a)^"-"^(_tostr b)
        | MEMult(a,b) -> (_tostr a)^"*"^(_tostr b)
        | MEDiv(a,b) -> (_tostr a)^"/"^(_tostr b)
        | MEPower(a,b) -> (_tostr a)^"^"^(string_of_number b)
        | MEConst(a) -> string_of_number a
        | MEAny -> "@"
    in
    _tostr x


  let string_of_map_stmt (type a) (x:map_stmt) =
    match x with
    | MSDeclInput(x) -> "input("^(string_of_map_port x)^")"
    | MSDeclOutput(x) -> "output("^(string_of_map_port x)^")"
    | MSDeclParam(x,n) -> "par("^(string_of_map_port x)^")"
    | MSVarEqualsVar(x,y) ->
      "vv("^(string_of_map_port_var x)^"="
      ^(string_of_map_port_var y)^")"
    | MSVarEqualsConst(x,c) ->
      (string_of_map_port_var x)^"="^(string_of_number c)
    | MSVarEqualsExpr(x,e) ->
      "ve("^(string_of_map_port_var x)^"="^
      (string_of_map_expr e string_of_map_port_var)^")"
    | MSValid -> "valid"
    | MSInvalid -> "invalid"
    | MSVarHasCstr(v,cstr) ->
       (string_of_map_cstr cstr)
    | MSExprEqualsConst(e,c) ->
      "ec("^(string_of_map_expr e string_of_map_port_var)^
      "="^(string_of_number c)^")"
    | MSExprEqualsExpr(e1,e2) ->
      "ee("^(string_of_map_expr e1 string_of_map_port_var)^"="^
      (string_of_map_expr e2 string_of_map_port_var)^")"
    | MSSetVarPriority(_) -> "priority"
    | MSSetPortCover(_) -> "cover"

  let to_ast (type a) (expr: a map_expr) (any:a) : a ast =
    let rec _toast e =
      match e with
      | MEVar(q) -> Term(q)
      | MEConst(Integer q) -> Integer q
      | MEConst(Decimal q) -> Decimal q
      | MEDiv(a,b) -> Op2(Div,_toast a, _toast b)
      | MEPower(a,Integer b) -> Op2(Power,_toast a, Integer b)
      | MEPower(a,Decimal b) -> Op2(Power,_toast a, Decimal b)
      | MEMult(a,b) -> OpN(Mult,[_toast a;_toast b])
      | MEAdd(a,b) -> OpN(Add,[_toast a;_toast b])
      | MESub(a,b) -> OpN(Sub,[_toast a;_toast b])
      | MEAny -> Term(any)
    in
    _toast expr 

  let from_ast (type a) (expr: a ast) (any:a) : a map_expr =
    let pair_off (fxn:a map_expr -> a ast -> a map_expr)
        (start:a map_expr) (rest:a ast list) :a map_expr =
      List.fold_left
        (fun (rest:a map_expr) (curr:a ast) ->
           fxn rest curr
        ) start rest 
    in
    let rec _fromast e : a map_expr=
      match e with
      | Term(q) -> if q = any then MEAny else MEVar(q)
      | Integer(i) -> MEConst(Integer i)
      | Decimal(i) -> MEConst(Decimal i)
      | Op2(Div,a,b) -> MEDiv(_fromast a, _fromast b)
      | OpN(Add,h::t) ->
        pair_off
          (fun a b -> MEAdd(a, _fromast b))
          (_fromast h) t
      | OpN(Sub,h::t) ->
        pair_off
        (fun a b -> MESub(a, _fromast b))
         (_fromast h) t
      | OpN(Mult,h::t) ->
        pair_off
         (fun a b -> MEMult(a, _fromast b))
         (_fromast h) t
      | Op1(Neg,h) ->
        MESub(MEConst(Integer 0),_fromast h)
      | Op2(Power,h,Integer(i)) ->
        MEPower(_fromast h,(Integer i))
      | Op2(Power,h,Decimal(i)) ->
        MEPower(_fromast h,(Decimal i))
      | _ -> error "fromast" "unimpl"
    in
    _fromast expr

  let simpl (type a) (expr:a map_expr) (any:a)
      (tosym:a->symvar) (fromsym:symvar->a) =
    let expr = to_ast expr any in
    let decl v cnv =
      SymbolVar(cnv v)
    in
    let res = ASTLib.simpl expr tosym fromsym decl in
    from_ast res any

  let z3 (type a) freshvars prefix (expr:a map_expr) (atoz3 : a -> z3expr) =
    let fresh_var () =
      let i = SET.size freshvars in
      let vname = prefix^"_"^(string_of_int i) in
      SET.add freshvars vname;
      vname
    in
    let rec _work e = match e with
      | MEVar(q) -> atoz3 q
      | MEAdd(a,b) -> Z3Plus(_work a, _work b)
      | MESub(a,b) -> Z3Sub(_work a, _work b)
      | MEConst(Integer x) -> Z3Int(x)
      | MEConst(Decimal x) -> Z3Real(x)
      | MEMult(a,b) -> Z3Mult(_work a,_work b)
      | MEDiv(a,b) -> Z3Div(_work a,_work b)
      | MEPower(a,Integer b) -> Z3Power(_work a, Z3Int b)
      | MEPower(a,Decimal b) -> Z3Power(_work a, Z3Real b)
      | MEAny -> Z3Var(fresh_var ())

    in
    _work expr

  let string_of_map_port_var_expr (x:map_port map_var map_expr) =
    string_of_map_expr x string_of_map_port_var

  let map e f =
    let rec _map e =
      match e with
      | MEVar(q) -> MEVar(f q)
      | MEAdd(a,b) -> MEAdd(_map a, _map b)
      | MESub(a,b) -> MESub(_map a, _map b)
      | MEPower(a,b) -> MEPower(_map a, b)
      | MEMult(a,b) -> MEMult(_map a, _map b)
      | MEDiv(a,b) -> MEDiv(_map a, _map b)
      | MEAny -> MEAny
      | MEConst(v) -> MEConst(v)
    in
    _map e

  let map_cstr (type a) (type b) (c:a map_cstr) (f:a -> b) =
    let rec _map (cstr:a map_cstr) : b map_cstr =
      match cstr with
      | MCGT(v,e) -> MCGT(f v, map e f)
      | MCGTE(v,e) -> MCGTE(f v, map e f)
      | MCLT(v,e) -> MCLT(f v, map e f)
      | MCLTE(v,e) -> MCLTE(f v, map e f)
      | MCEQ(v,e) -> MCEQ(f v, map e f)
      | MCNot(e) -> MCNot(_map e)
      | MCAnd(a,b) -> MCAnd(_map a,_map b)
      | MCOr(a,b) -> MCOr(_map a, _map b)
    in
    _map c
end

