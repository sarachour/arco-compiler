open Globals

open HWLib
open HWData

open MathLib
open MathData

open AST
open ASTUnifyData

open Util
open Unit

open SymCamlData

open Interactive

open SearchData
open Search

open SolverData
open SolverUtil
open SlnLib
open SolverSearch
open SolverMulti


open HWConnRslvr 
open SolverCompLib
open Simulink

open MapMain 
open MapUtil
(*
A solution is a set of connections  and components. A solution
may additionally contain any pertinent error and magnitude mappings
*)
exception SolverError of string

let error n m = raise (SolverError (n^":"^m))
let slvr_print_debug = print_debug 1
let slvr_menu = menu 1
let slvr_print_inter = print_inter 1

let solve (hw:hwvid hwenv) (prob:mid menv) (out:string) =
  init_utils();
  let sl = {hw=hw;math=prob;goal_cnt=0;} in

  let msearch = MultiSearch.mkmulti sl out in
  slvr_print_inter "===== Beginning Interactive Solver ======\n";
  let nslns : int = Globals.get_glbl_int "slvr-solutions" in
  slvr_print_inter ("### Looking for :"^(string_of_int nslns)^" Solutions ======\n");
  let maybe_slns : (gltbl list) option =
    MultiSearch.msolve (REF.mk sl) msearch nslns in
  match maybe_slns with
  | Some(slns) ->
    slvr_print_inter "===== Found Solutions ======\n";
    ()
  | None ->
    flush_all(); error "solver" "no solutions found"
