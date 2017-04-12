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
open MapExpr

open SymCamlData
open StrMap


exception MapSpecError of string

let error n m = raise (MapSpecError (n^":"^m))

let debug = print_debug 4 "prob-gen"
let dumb_cstrs_DBG = false 
  



module MapSpec =
struct

  let get_abs_comp (ctx:'a map_ctx) (name:hwcompname) : 'a map_abs_comp =
    let key = (HwLib.hwcompname2str name) in
    if MAP.has ctx.comps key then
      MAP.get ctx.comps key
    else
      begin
        print (MAP.str ctx.comps (fun s -> s) (fun _ -> ""));
        raise
          (MapSpecError("get_comp: comp_dne:"^(HwLib.hwcompname2str name)))
      end

  let get_comp (ctx:'a map_ctx) (name:hwcompname) id : 'a map_comp =
    let cmp = get_abs_comp ctx name in 
    let ccmp = MAP.get cmp.spec id in
    ccmp

  let find_comp_config (ctx:'a map_ctx) (cmp:hwcompname)
      (params:(string,number) map) =
    let param_list = MAP.to_list params in 
    let same_params (cmp:'a map_comp) : bool =
      List.fold_right (fun ((par,value):string*number) (eq:bool) ->
          let cmp_value = MAP.get cmp.params par in
          cmp_value = value && eq
        ) param_list true
    in
    let cmps : 'a map_abs_comp = get_abs_comp ctx cmp in 
    MAP.fold cmps.spec (
      fun _ (cmp:'a map_comp) (matches:'a map_comp list) ->
        if same_params cmp then
          cmp::matches
        else
          matches
      ) []

  let string_of_abs_var_id (id:int) =
    "v("^(string_of_int id)^")"

  let string_of_map_abs_var (avar:'a map_abs_var) (conv:'a -> string) =
    let expr2str (i:int map_expr) =
      MapExpr.string_of_map_expr i (string_of_abs_var_id)
    in
    let cstr2str (cstr,expr) =
      (MapExpr.string_of_map_cstr cstr)^(expr2str expr)
    in
    "exprs="^(LIST.tostr expr2str "=" avar.exprs )^"\n"^
    "cstrs="^(LIST.tostr cstr2str "," avar.cstrs )^"\n"^
    "value="^(OPTION.tostr avar.value (string_of_number))^"\n"^
    "mems="^(LIST.tostr MapExpr.string_of_map_port_var "," avar.members)^"\n"


  let map_var (type a) (type b)
      (x:a map_var) (f:a->b) : b map_var =
    match x with
    | MPVScale(r) -> MPVScale(f r)
    | MPVOffset(r) -> MPVOffset(f r)

  

  
  let _get_port comp name =
    let key = name in 
    let portinfo=
      if MAP.has comp.inps key then
        MAP.get comp.inps key 
      else
        MAP.get comp.outs key 
    in
    portinfo


  let circ_get_abs_var (ctx:'a map_circ) (id:int) =
    let q = MAP.get ctx.vars id in
    q


  let circ_get_math_info (ctx:'a map_circ)
      (wire:wireid) =
    let d = SMAP.get ctx.mappings wire in
    d


  let circ_get_port_info (ctx:'a map_circ)
      (wire:wireid) =
    let d = SMAP.get ctx.ports wire in
    d

  let circ_get_mapping (ctx:'a map_circ)
      (wire:wireid) : map_math_info option =
    SMAP.ifget ctx.mappings wire


  let circ_set_offset_var (ctx:'a map_circ)
      (wire:wireid) (id:int) =
    let d = circ_get_port_info ctx wire in
    let m = circ_get_math_info ctx wire in
    d.offset.abs_var <- id;
    m.offset.abs_var <- id;
    ()

  let circ_set_scale_var (ctx:'a map_circ)
      (wire:wireid) (id:int) =
    let d = circ_get_port_info ctx wire in
    let m = circ_get_math_info ctx wire in
    d.scale.abs_var <- id;
    m.offset.abs_var <- id;
    ()

  let circ_get_offset_var (ctx:'a map_circ)
      (wire:wireid)  =
    let d = circ_get_port_info ctx wire in
    d.offset.abs_var 

  let circ_get_scale_var (ctx:'a map_circ)
      (wire:wireid)  =
    let d = circ_get_port_info ctx wire in
    d.scale.abs_var 

  let ctx_get_abs_var (ctx:'a map_ctx)
      (name:hwcompname) (id:int) (aid:int) : 'a map_abs_var=
    let comp = get_comp ctx name id in 
    let a = MAP.get comp.vars aid in
    a

  let ctx_get_offset_var (ctx:'a map_ctx)
      (name:hwcompname) (id:int) (port:string) : 'a map_abs_var =
    let comp = get_comp ctx name id in 
    let d = _get_port comp port in
    MAP.get comp.vars d.offset.abs_var 

  let ctx_get_scale_var (ctx:'a map_ctx)
      (name:hwcompname) (id:int) (port:string) : 'a map_abs_var=
    let comp = get_comp ctx name id in 
    let d = _get_port comp port in
    MAP.get comp.vars d.scale.abs_var 

  
  let string_of_map_port_info (aport:map_port_info) =
    "string_of_map_port: unimpl"

  let string_of_map_port ((a,b):map_port) =
     (HwLib.hwcompname2str a)^"."^b

  let string_of_map_comp (comp:'a map_comp) (f:'a -> string) =
    ("====== #"^(string_of_int comp.id)^" ======")^"\n"^
    (MAP.str comp.vars (string_of_abs_var_id)
       (fun q -> string_of_map_abs_var q f))^"\n"^
    (MAP.str comp.inps (ident) (string_of_map_port_info))^"\n"^
    (MAP.str comp.outs (ident) (string_of_map_port_info))^"\n"
    
  let string_of_map_ctx (env:'a map_ctx) (f:'a->string) =
    MAP.str env.comps
      (fun q -> "=== "^(q)^" ===\n")
      (fun (x:'a map_abs_comp) ->
         MAP.str x.spec (fun _ -> "\n")
           (fun q -> string_of_map_comp q f)
      )


end

