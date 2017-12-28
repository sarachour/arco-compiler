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


open HWConnRslvr 
open SolverCompLib
open Simulink

open SMapMain 
open SMapData
open SMapSolverData
(*
A solution is a set of connections  and components. A solution
may additionally contain any pertinent error and magnitude mappings
*)
exception SolverError of string

let error n m = raise (SolverError (n^":"^m))
let slvr_print_debug = print_debug 1
let slvr_menu = menu 1
let slvr_print_inter = print_inter 1

let string_of_opt (opt:mapslvr_opt) =
 let opt_str = match opt with
    | (SMONone) -> "one"
    | (SMOMinTC) -> "slow"
    | (SMOMaxTC) -> "fast"
 in
 opt_str

let simulinkformat2suffix f opt =
  let opt_str = match opt with
    |Some(o) -> string_of_opt o
    | None -> ""
  in
  match f with
  | SFIdealSDE -> "si"
  | SFIdealODE -> "oi"
  | SFRngSDE -> "sh"
  | SFRngODE -> "oh"
  | SFRngDigODE -> "ohd"
  | SFRngDigSDE -> "shd"
  | SFRngMapODE -> "oh_map_"^opt_str
  | SFRngMapSDE -> "sh_map_"^opt_str
  | SFIdealMapSDE -> "si_map_"^opt_str
  | SFIdealMapODE -> "oi_map_"^opt_str
  | SFRngDigMapSDE -> "shd_map_"^opt_str
  | SFRngDigMapODE -> "ohd_map_"^opt_str

let to_mat_file slntbl out i format mappings opt =
  let base = out^"_"^(string_of_int i)^"_"^(simulinkformat2suffix format opt) in
  let matfile = base^".m" in
  let matcode : matst list option= match format,mappings with
    | SFRngMapODE,Some(mappings) ->
      Some(SimulinkGen.to_simulink slntbl mappings base format)

    | SFRngMapSDE,Some(mappings) ->
      Some(SimulinkGen.to_simulink slntbl mappings base format)

    | SFIdealMapODE,Some(mappings) ->
      Some(SimulinkGen.to_simulink slntbl mappings base format)

    | SFIdealMapSDE,Some(mappings) ->
      Some(SimulinkGen.to_simulink slntbl mappings base format)

    | SFRngDigMapODE,Some(mappings) -> 
      Some(SimulinkGen.to_simulink slntbl mappings base format)

    | SFRngDigMapSDE,Some(mappings) ->
      Some(SimulinkGen.to_simulink slntbl mappings base format)

    | SFIdealMapODE,None ->
      warn "to_mat_file" "cannot generate mapped simulink file";
      None

    | SFIdealMapSDE,None ->
      warn "to_mat_file" "cannot generate mapped simulink file";
      None

    | SFRngMapODE,None ->
      warn "to_mat_file" "cannot generate mapped simulink file";
      None
    | SFRngMapSDE,None ->
      warn "to_mat_file" "cannot generate mapped simulink file";
      None
    | SFRngDigMapODE,None ->
      warn "to_mat_file" "cannot generate mapped simulink file";
      None
    | SFRngDigMapSDE,None ->
      warn "to_mat_file" "cannot generate mapped simulink file";
      None


    | _,_ ->
      Some(SimulinkGen.to_simulink slntbl (MAP.make ()) base format)
  in
  match matcode with
  | Some(code) ->
      SimulinkGen.to_file code matfile
  | None ->
    warn "to_mat_file" "cannot emit code"

let proc_sln (out:string) (slntbl:gltbl) (i:int) =
  slvr_print_inter "---- Calculating Concrete slntbl ---";
  let conc_sln = HwConnRslvrLib.get_sln slntbl in
  slvr_print_inter "---- Finished Computing Connection MAppings---";
  let sln_sum : string= SlnLib.sln2str slntbl.sln_ctx ident MathLib.mid2str in
  let cmp_sum :string = SolverCompLib.ccomps2str slntbl in
  IO.save (out^"_"^(string_of_int i)^"_sln.sum") sln_sum;
  IO.save (out^"_"^(string_of_int i)^"_comp.sum") cmp_sum;
  (*
  to_mat_file slntbl out i SFIdealSDE None;
  to_mat_file slntbl out i SFCircSDE None;
  *)
  to_mat_file slntbl out i SFIdealODE None None;
  to_mat_file slntbl out i SFRngODE None None;
  to_mat_file slntbl out i SFRngDigODE None None;
  Printf.printf "===== Solution Found ======\n";
  ()

let proc_sln_mappings (out:string) (slntbl:gltbl)  (i:int)  =
  let save_mappings (opt:mapslvr_opt) =
    let mappings = SMapMain.infer slntbl opt in
    let opt_str = string_of_opt opt in
    match mappings with
    | Some(mappings_c) ->
      begin
        to_mat_file slntbl out i SFRngMapODE mappings (Some opt);
        to_mat_file slntbl out i SFRngDigMapODE mappings (Some opt);
        to_mat_file slntbl out i SFIdealMapODE mappings (Some opt);
        let map_sum = SLinearTransform.map_to_string mappings_c in
        IO.save (out^"_"^(string_of_int i)^"_map_"^opt_str^".sum") map_sum
      end
    | None ->
      Printf.printf "==== No Mappings ===="
  in
  slvr_print_inter "---- Calculating Concrete slntbl ---";
  flush_all(); 
  slvr_print_inter "---- Calculating Close-To-One Config ---";
  flush_all();
  save_mappings SMONone;
  slvr_print_inter "---- Calculating Fast Config ---";
  flush_all();
  save_mappings SMOMaxTC;
  slvr_print_inter "---- Calculating Slow Config ---";
  flush_all();
  save_mappings SMOMinTC;
  Printf.printf "===== Mapping Step Finished ======\n";
  flush_all(); 
  ()


