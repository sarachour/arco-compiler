open Util

open AST
open Interactive
open Globals

open HWData
open HWLib

open MathData
open MathLib


open SolverData
open SolverUtil
open SlnLib
open SolverCompLib

open IntervalData
open IntervalLib

open StochData
open StochLib


open MapNoiseCompute
open MapIntervalCompute
open MapData
open MapUtil
open MapProblemGenerator

exception MapHeuristicError of string

let error n m = raise (MapHeuristicError (n^":"^m))

let debug = print_debug 3 "map-heur"

module MapHeuristics =
struct

  (*derive c*)
  let noise_summary (tbl:gltbl) =
    (*for each generated output*)
    SlnLib.iter_labels tbl.sln_ctx (fun (g:ulabel) routes ->
        let wire = SlnLib.label2wire g in
        let hwnoise = NoiseCompute.compute_wire_noise tbl wire in
        let mnoise = NoiseCompute.compute_wire_label_noise tbl wire in
        debug ("label:"^(SlnLib.ulabel2str g)^":\n"^
               "  [hw]: "^(StochLib.randvar2str hwnoise)^"\n"^
               "  [math]: "^(StochLib.randvar2str mnoise)^"\n")
      )


  let map_summary (tbl:gltbl) =
    SlnLib.iter_labels tbl.sln_ctx (fun (g:ulabel) routes ->
        let wire = SlnLib.label2wire g in
        let hwival = IntervalCompute.compute_wire_interval tbl wire in
        let mival = IntervalCompute.compute_wire_label_interval tbl wire in
        debug ("label:"^(SlnLib.ulabel2str g)^":\n"^
               " [hw]: "^(IntervalLib.numinterval2str hwival)^"\n"^
               " [math]: "^(IntervalLib.numinterval2str mival)^"\n")
      )

  
  (*
    is a direct mapping possible and what
    mapping does it require to be successful
  *)
  
  let mkheuristics () =
    {mappings=MAP.make();valid=true}

  let mkheuristic tbl heur wire =
    let hwival = IntervalCompute.compute_wire_interval tbl wire in
    let mival = IntervalCompute.compute_wire_label_interval tbl wire in
    let hwnoise = NoiseCompute.compute_wire_noise tbl wire in
    let mnoise = NoiseCompute.compute_wire_label_noise tbl wire in
    let heuristic : map_heuristic = {
      hw_rng = hwival; math_rng= mival; hw_noise=hwnoise; math_noise=mnoise;
      scale = true; offset = true;
    } in
    MAP.put heur.mappings wire heuristic;
    ()


  let get_heuristic tbl heur x =
    if MAP.has heur.mappings x  = false then
      mkheuristic tbl heur x;
    let h = MAP.get heur.mappings x in
    h

  let compute_score tbl (heur:map_heuristics) (wire:wireid) =
    let h = get_heuristic tbl heur wire in
    let i2ni = IntervalLib.interval2numinterval in
    let evaluate fxn h =
      let igap = fxn h.hw_rng h.math_rng in
      let iscore = IntervalLib.compute_frac_gap h.math_rng igap in
      if IntervalLib.is_mixed_interval h.hw_noise.std then
        0. -. iscore
      else
      if IntervalLib.has_inf_bound h.hw_noise.std
         || IntervalLib.has_inf_bound h.math_noise.std
      then
        begin
          heur.valid <- false;
          0. -. (infinity)
        end
      else
        let hwnoise = (i2ni h.hw_noise.std) in
        let mathnoise = (i2ni h.math_noise.std) in 
        (*
         let ngap =fxn hwnoise  mathnoise in
         let nscore= IntervalLib.compute_frac_gap (i2ni h.math_noise.std) ngap in
        *)
        0. -. (iscore) 
    in
    match h.scale,h.offset with
    | true,true ->
      evaluate (fun hw math ->
          let sc,off,gap= IntervalLib.compute_linear hw math in
          debug ("> scale="^(string_of_float sc)^", offset="^(string_of_float off));
          debug ("[gap] "^(IntervalLib.covergap2str gap));
          gap
        ) h

    | true,false ->
      evaluate (fun hw math ->
          let scale,gap= IntervalLib.compute_scale hw math in
          debug (">scale="^(string_of_float scale));
          debug ("[gap] "^(IntervalLib.covergap2str gap));
          gap
        ) h

    | false,true ->
      evaluate (fun hw math ->
          let offset,gap= IntervalLib.compute_offset hw math in 
          debug (">offset="^(string_of_float offset));
          debug ("[gap] "^(IntervalLib.covergap2str gap));
          gap

        ) h

    | false,false ->
      evaluate (fun hw math ->
          let gap= IntervalLib.compute_direct hw math in
          debug(">direct=1,0");
          debug ("[gap] "^(IntervalLib.covergap2str gap));
          gap
        ) h
 

  let upd_heuristic tbl heur (x:wireid) (fn:map_heuristic->unit) =
    let h = get_heuristic tbl heur x in
    fn h;
    ()

  let upd_heuristics tbl heur (x:wireid list) fn =
    List.iter (fun xs -> upd_heuristic tbl heur xs fn) x


  let mapheuristic2str h =
    "--- MEAN ---\n"^
    "   [math]: "^(IntervalLib.numinterval2str h.math_rng)^"\n"^
    "   [hw]: "^(IntervalLib.numinterval2str h.hw_rng)^"\n"^
    "--- STDEV ---\n"^
    "   [math]: "^(StochLib.randvar2str h.math_noise)^"\n"^
    "   [hw]: "^(StochLib.randvar2str h.hw_noise)^"\n"^
    "--- MAP ----\n"^
    "["^(if h.scale then "scale" else "")^" "^(if h.offset then "offset" else "")^"]\n"


  let heuristic_n_direct_offsets heur = 0
  let heuristic_n_direct_scales heur = 0

  (*derive which wires have no offsets*)
  let rec derive_no_offset_cstrs expr =
    match expr with
    | Term(SVOffsetVar(wire)) -> [wire]
    | _ -> []

  (*derive which wires have no offsets*)
  let rec derive_no_scale_cstrs expr =
    match expr with
    | Term(SVScaleVar(wire)) -> [wire]
    | _ -> []



  let derive_equiv_cstrs tbl heur exprs =
    let scale_equiv = QUEUE.make () in
    let offset_equiv = QUEUE.make () in
    let add_expr_to_equiv expr = 
      match expr with
      | Term(SVOffsetVar(wire)) ->
        noop (QUEUE.enqueue offset_equiv wire)
      | Term(SVScaleVar(wire)) ->
        noop (QUEUE.enqueue scale_equiv wire)
      | _ -> ()
    in
    List.iter add_expr_to_equiv exprs;
    let direct_scales =
      LIST.count (QUEUE.to_list scale_equiv)
        (fun wire -> (get_heuristic tbl heur wire).scale = false)
    in
    let direct_offsets =
      LIST.count (QUEUE.to_list scale_equiv)
        (fun wire -> (get_heuristic tbl heur wire).offset = false)
    in
    if direct_offsets > 0 then
      QUEUE.iter offset_equiv
        (fun wire -> upd_heuristic tbl heur wire (fun x -> x.offset <- false));
    if direct_scales > 0 then
      QUEUE.iter scale_equiv
        (fun wire -> upd_heuristic tbl heur wire (fun x -> x.scale <- false));
    ()


  let derive_heuristics (tbl:gltbl) =
    let heur = mkheuristics () in
    let proc_stmt_pass1 (s) = match s with
      | SVNoOffset(expr) ->
        begin
          let wires = derive_no_offset_cstrs expr in
          upd_heuristics tbl heur wires (fun x -> x.offset <- false)
        end
      | SVNoScale(expr) ->
        begin
          let wires = derive_no_scale_cstrs expr in
          upd_heuristics tbl heur wires (fun x -> x.scale <- false)
        end
      | _ -> ()
    in
    let proc_stmt_pass2 (s) = match s with
      | SVEquals(exprs) -> derive_equiv_cstrs tbl heur exprs
      | _ -> ()
    in
    let rec proc_stmt_pass2_until_done stmts =
      let prev_offsets =
        heuristic_n_direct_offsets heur
      in
      let prev_scales =
        heuristic_n_direct_scales heur
      in
      List.iter proc_stmt_pass2 stmts;
      let new_offsets = 
        heuristic_n_direct_offsets heur
      in
      let new_scales = 
        heuristic_n_direct_scales heur
      in
      if new_offsets > prev_offsets || new_scales > prev_scales then
        proc_stmt_pass2_until_done stmts
    in
    match MapProblemGenerator.generate_problem tbl with
    | Some(cstrs) ->
      List.iter proc_stmt_pass1 cstrs;
      List.iter proc_stmt_pass2 cstrs;
      Some(heur)
    | None ->
      None

    
  let heuristic (tbl:gltbl) =
    (*go through and assemble mappings*)
    match derive_heuristics tbl with
    | Some(heuristics) ->
      begin
        let run_score = REF.mk 0. in
        SlnLib.iter_labels tbl.sln_ctx (fun (g:ulabel) routes ->
          let wire = SlnLib.label2wire g in
          debug ("label:"^(SlnLib.ulabel2str g)^":\n");
          let h = get_heuristic tbl heuristics wire in 
          debug (mapheuristic2str h);
          let score = compute_score tbl heuristics wire in
          debug ("score:"^(string_of_float score)^"\n");
          REF.upd run_score (fun x -> x +. score);
          ()
          );
        if heuristics.valid then
          Some (REF.dr run_score)
        else
          None
      end
    | None ->
      None
end
