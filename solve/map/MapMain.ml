open HWData
open MapData
open Util
open SolverData
open MapSpecGen
open Interactive


module MapMain = struct

  let mkctx () =
    {comps=MAP.make()}

  (**)
  let mkctx hwenv (tbl:(hwcompname,ucomp) map) : map_ctx =
    let env = {comps=MAP.make()} in
    MAP.iter tbl (fun name comp ->
        let hwcomp = comp.d in
        let stmts :
          (((string,number) map)*(map_stmt list)) list =
          MapCompSpecGenerator.derive_mapping_comp hwenv hwcomp
        in
        let cfgs =
          List.fold_right (fun (pars,stmts) lst ->
              let cmp : map_comp option =
                MapCompSpecCompressor.compress hwcomp.name stmts
              in
              match cmp with
              | Some(c) -> c::lst
              | None -> lst
            ) stmts []
        in
        MAP.put env.comps name {spec=cfgs};
        () 
      );
    print_string (MapSpec.string_of_map_ctx env);
    env

  (*build a macro-component from building blocks.*)
  let infer (tbl:gltbl) : (wireid,hw_mapping) map option=
    error "test_config" "test the configuration."

  let infer_feasible (tbl:gltbl)
    : bool =
    error "infer_feasible" "unimpl"

  let infer_best (tbl:gltbl) : (wireid,hw_mapping) map option =
    error "find_best_config" "test the config."



end

(*
module MapMain = struct


  let infer (tbl:gltbl)  : (wireid,hw_mapping) map option =
    match MapProblemGenerator.generate_problem tbl with
    | Some(stmts) ->
      let sln : (wireid,hw_mapping) map option = MapSMTResolver.solve tbl stmts in
      sln
    | None -> None

  let save_z3_problem (tbl:gltbl) name inst =
    match MapProblemGenerator.generate_problem tbl with
    | Some(stmts) ->
      noop (MapSMTResolver.save_z3_problem tbl stmts name inst) 
    | None ->() 

end
*)
