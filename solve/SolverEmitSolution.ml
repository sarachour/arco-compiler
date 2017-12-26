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
(*
A solution is a set of connections  and components. A solution
may additionally contain any pertinent error and magnitude mappings
*)
exception SolverError of string

let error n m = raise (SolverError (n^":"^m))
let slvr_print_debug = print_debug 1
let slvr_menu = menu 1
let slvr_print_inter = print_inter 1

let simulinkformat2suffix f = match f with
  | SFIdealSDE -> "sde_ideal"
  | SFIdealODE -> "ode_ideal"
  | SFRngSDE -> "sde_rng"
  | SFRngODE -> "ode_rng"
  | SFRngMapODE -> "ode_rng_map"
  | SFRngMapSDE -> "sde_rng_map"
  | SFIdealMapSDE -> "sde_ideal_map"
  | SFIdealMapODE -> "ode_ideal_map"
  | SFRngDigSDE -> "sde_digrng"
  | SFRngDigODE -> "ode_digrng"
  | SFRngDigMapSDE -> "sde_digrng_map"
  | SFRngDigMapODE -> "ode_digrng_map"

let to_mat_file slntbl out i format mappings =
  let base = out^"_"^(string_of_int i)^"_"^(simulinkformat2suffix format) in
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
  to_mat_file slntbl out i SFIdealODE None;
  to_mat_file slntbl out i SFRngODE None;
  to_mat_file slntbl out i SFRngDigODE None;
  Printf.printf "===== Solution Found ======\n";
  ()

let proc_sln_mappings (out:string) (slntbl:gltbl) (i:int) =
  slvr_print_inter "---- Calculating Concrete slntbl ---";
  flush_all(); 
  let conc_sln = HwConnRslvrLib.get_sln slntbl in
  slvr_print_inter "---- Calculating Mappings ---";
  flush_all(); 
  let mappings = SMapMain.infer slntbl in
  upd_glbl "jaunt-scale-range" (GlblPropString "+");
  upd_glbl "jaunt-offset-range" (GlblPropString "0");
  upd_glbl "jaunt-optimize-localopt-enabled" (GlblPropBool true);
  SMapMain.infer slntbl;
  (*MapMain.save_z3_problem slntbl out i;*)
  (*
  to_mat_file slntbl out i SFCircMapSDE mappings;
  to_mat_file slntbl out i SFIdealMapSDE mappings;
  *)
  to_mat_file slntbl out i SFRngMapODE mappings;
  to_mat_file slntbl out i SFRngDigMapODE mappings;
  to_mat_file slntbl out i SFIdealMapODE mappings;
  slvr_print_inter "---- Generating Summary File ---";
  flush_all(); 
  let cmp_sum :string = SolverCompLib.ccomps2str slntbl in
  begin
    match mappings with
    | Some(mappings) ->
      begin
        let map_sum = SLinearTransform.map_to_string mappings in
        IO.save (out^"_"^(string_of_int i)^"_map.sum") map_sum
      end

    | None -> ()
  end;
  Printf.printf "===== Mapping Step Finished ======\n";
  flush_all(); 
  ()


