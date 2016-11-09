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


module MapHeuristics =
struct



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
  
  

  let mapheuristic2str heuristic =
    ""

  let heuristic (tbl:gltbl) =
      (*go through and assemble mappings*)
      SlnLib.iter_labels tbl.sln_ctx (fun (g:ulabel) routes ->
        let wire = SlnLib.label2wire g in
        let hwival = IntervalCompute.compute_wire_interval tbl wire in
        let mival = IntervalCompute.compute_wire_label_interval tbl wire in
        let hwnoise = NoiseCompute.compute_wire_noise tbl wire in
        let mnoise = NoiseCompute.compute_wire_label_noise tbl wire in
        debug ("label:"^(SlnLib.ulabel2str g)^":\n"^
               " [hw]: "^(IntervalLib.numinterval2str hwival)^"\n"^
               " [math]: "^(IntervalLib.numinterval2str mival)^"\n");
        debug ("label:"^(SlnLib.ulabel2str g)^":\n"^
               "  [hw]: "^(StochLib.randvar2str hwnoise)^"\n"^
               "  [math]: "^(StochLib.randvar2str mnoise)^"\n");
        ()

        (*
        let heuristic = {
          mapping=IntervalLib.compute_mapping hwival mival;
          math_noise=mnoise;hw_noise=hwnoise;
          math_ival=mival;hw_ival=hwival;
          reqs=[]  
        }
        in
        debug ("heuristic: "^(mapheuristic2str heuristic))
             *)
     )

end
