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
  | SFIdealSDE -> "sdeIdeal"
  | SFIdealODE -> "odeIdeal"
  | SFCircSDE -> "sdeCirc"
  | SFCircODE -> "odeCirc"
  | SFCircMapODE -> "odeCircMap"
  | SFCircMapSDE -> "sdeCircMap"

let to_mat_file slntbl out i format mappings =
  let base = out^"_"^(string_of_int i)^"_"^(simulinkformat2suffix format) in
  let matfile = base^".m" in
  let matcode : matst list option= match format,mappings with
    | SFCircMapODE,Some(mappings) ->
      Some(SimulinkGen.to_simulink slntbl mappings base format)
    | SFCircMapSDE,Some(mappings) ->
      Some(SimulinkGen.to_simulink slntbl mappings base format)
    | SFCircMapODE,_ ->
      warn "to_mat_file" "cannot generate mapped simulink file";
      None
    | SFCircMapSDE,_ ->
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
  let sln_sum : string= SlnLib.sln2str slntbl.sln_ctx ident MathLib.mid2str in
  let cmp_sum :string = SolverCompLib.ccomps2str slntbl in
  IO.save (out^"_"^(string_of_int i)^"_sln.sum") sln_sum;
  IO.save (out^"_"^(string_of_int i)^"_comp.sum") cmp_sum;
  to_mat_file slntbl out i SFIdealSDE None;
  to_mat_file slntbl out i SFIdealODE None;
  to_mat_file slntbl out i SFCircSDE None;
  to_mat_file slntbl out i SFCircODE None;
  Printf.printf "===== Solution Found ======\n";
  ()

let proc_sln_mappings (out:string) (slntbl:gltbl) (i:int) =
  slvr_print_inter "---- Calculating Concrete slntbl ---";
  let conc_sln = HwConnRslvrLib.get_sln slntbl in
  slvr_print_inter "---- Calculating Mappings ---";
  let mappings = SMapMain.infer slntbl in
  (*MapMain.save_z3_problem slntbl out i;*)
  to_mat_file slntbl out i SFCircMapSDE mappings;
  to_mat_file slntbl out i SFCircMapODE mappings;
  slvr_print_inter "---- Generating Summary File ---";
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
  ()


