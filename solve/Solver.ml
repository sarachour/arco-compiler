open Common
open Globals

open HWLib
open HWData

open MathLib
open MathData

open AST
open ASTUnifyData
open ASTUnify

open Util
open Unit

open SymCamlData

open Interactive

open SearchData
open Search

open SolverData
open SolverUtil
open SolverSln
open SolverSearch
open SolverRslv
open SolverGoalTable
open SolverMulti


(*
A solution is a set of connections  and components. A solution
may additionally contain any pertinent error and magnitude mappings
*)
exception SolverError of string

let error n m = raise (SolverError (n^":"^m))
let slvr_print_debug = print_debug 1
let slvr_menu = menu 1
let slvr_print_inter = print_inter 1

(*
let canonicalize_sln (hw:hwvid hwenv) (s:sln) =
  
  let newlabels = MAP.make () in
  let mklbl wire propmap =
    MAP.put newlabels wire propmap
  in
  let proc_wire wire propmap =
    let c,i,p = wire in
    let cname : string = UnivLib.unodeid2name c in
    match c with
    | UNoInput(prop) -> if HwLib.getkind hw cname p = HNInput then ()
      else let _ = mklbl wire propmap in ()
    | UNoOutput(prop) -> if HwLib.getkind hw cname p = HNOutput then ()
      else let _ = mklbl wire propmap in ()
    | _ -> let _ = mklbl wire propmap in ()
  in
  (*only keep assignments on one end of the input or output port*)
  let _ = MAP.iter s.labels (fun wire props -> proc_wire wire props) in
  let _ = MAP.set s.labels newlabels in
  ()

*)
let solve (hw:hwvid hwenv) (prob:mid menv) (out:string) =
  init_utils();
  let sl = {hw=hw;math=prob;goal_cnt=0;} in
  let msearch = MultiSearch.mkmulti sl in
  ()
(*
  let _ = slvr_print_inter "===== Beginning Interactive Solver ======\n" in
  let nslns = Globals.get_glbl_int "slvr-solutions" in
  let slns : (sln list) option = MultiSearch.msolve (REF.mk sl) msearch nslns in
  match slns with
    | Some(slns) ->
      let outp_sln sln i =
        (*canonicalize the solution*)
        let sln = SlnLib.conc_sln sl sln in 
        let _ = canonicalize_sln hw sln in
        (*
        let _ = Printf.printf "===== Concretizing to Spice File ======\n" in
        let _ = try
          let sp = SpiceLib.to_spice sl sln in
          IO.save (out^"."^(string_of_int i)) (SpiceLib.to_str sp)
        with
          | SpiceLibException(m) -> Printf.printf "ERROR: SPICE Generation Failed. %s" m
        in
        *)
        let _ = Printf.printf "===== Concretizing to summary file =====\n" in
        let _ = IO.save (out^".summary."^(string_of_int i)) (SlnLib.tostr sln) in
        let _ = SlnLib.repr2file (out^".caml."^(string_of_int i)) sln in
        let _ = Printf.printf "===== Solution Found ======\n" in
        ()
      in
      let _ = List.iteri (fun i x -> outp_sln x i) slns in
      ()
    | None ->
      let _ = flush_all () in
      error "solve" " no solution Found."
  ()
      *)
