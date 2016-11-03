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
open SolverMapper 
open SolverCompLib
open Simulink

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
let proc_sln (out:string) (slntbl:gltbl) (i:int) =
  slvr_print_inter "---- Calculating Concrete slntbl ---";
  let conc_sln = HwConnRslvrLib.get_sln slntbl in
  slvr_print_inter "---- Calculating Mappings ---";
  let mappings_maybe = SolverMapper.infer slntbl in
  begin
    match mappings_maybe with
    | Some(mappings) ->
      begin
      slvr_print_inter "---- Generating Simulink File ---";
      let matfile = (out^"_"^(string_of_int 0)^".m") in
      let matcode : matst list =
        SimulinkGen.to_simulink slntbl mappings 
      in
      SimulinkGen.to_file matcode matfile
      end
    | None -> ()
  end;
  slvr_print_inter "---- Generating Summary File ---";
  let sln_sum : string= SlnLib.sln2str slntbl.sln_ctx ident MathLib.mid2str in
  let cmp_sum :string = SolverCompLib.ccomps2str slntbl in
  let map_sum :string =
    match mappings_maybe with
    | Some(mappings) -> SolverMapper.mappings2str mappings
    | None -> "<no mappings found>"
  in
  IO.save (out^"_"^(string_of_int i)^"_sln.sum") sln_sum;
  IO.save (out^"_"^(string_of_int i)^"_comp.sum") cmp_sum;
  IO.save (out^"_"^(string_of_int i)^"_map.sum") map_sum;
  Printf.printf "===== Solution Found ======\n";
  ()

let solve (hw:hwvid hwenv) (prob:mid menv) (out:string) =
  init_utils();
  let sl = {hw=hw;math=prob;goal_cnt=0;} in

  let msearch = MultiSearch.mkmulti sl in
  slvr_print_inter "===== Beginning Interactive Solver ======\n";
  let nslns : int = Globals.get_glbl_int "slvr-solutions" in
  slvr_print_inter ("### Looking for :"^(string_of_int nslns)^" Solutions ======\n");
  let maybe_slns : (gltbl list) option =
    MultiSearch.msolve (REF.mk sl) msearch nslns in
  match maybe_slns with
  | Some(slns) ->
    List.iteri (fun id (x:gltbl) -> proc_sln out x id) slns;
    ()
  | None ->
    flush_all(); error "solver" "no solutions found"
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
