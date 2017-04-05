open MapData;;
open HWData;;
open Interactive;;

open MapIntervalCompute;;
open IntervalData;;
open IntervalLib;;
open SolverData;;

open Util;;
open Z3Data;;

exception MapSolverError of string

let error n m = raise (MapSolverError (n^":"^m))

module MapSolver =
struct

  let scaling : (int,int) map= MAP.make ();;

  let vid_to_name (i:int) =
    "v"^(string_of_int i)

  let vid_to_var (i:int) =
    Z3Mult(Z3Var("v"^(string_of_int i)),Z3Int(MAP.get scaling i))

  let build_z3_prob (tbl:gltbl) (prob:wireid map_circ)  =
    let stmtq = QUEUE.make () in
    let derivq = QUEUE.make () in
    let q s = noop (QUEUE.enqueue stmtq s) in
    let qstvar s = noop (QUEUE.enqueue stmtq s) in
    (*var decls*)
    let lin_combo (v:float ) (sc:int) (off:int) =
      Z3Plus(Z3Mult(vid_to_var (sc),Z3Real v),vid_to_var (off))
    in
    q (Z3Comment("Variable Decls"));
    MAP.clear scaling;
    MAP.iter prob.vars (fun k vardata ->
        q (Z3ConstDecl(vid_to_name k,Z3Real));
        noop (MAP.put scaling k 10)
      );

    MAP.iter prob.ports (fun (w:wireid) (p:map_port_info) ->
        let mapping : mid ast = MAP.get prob.mappings w in
        let map_rng : num_interval =
          MapIntervalCompute.compute_mexpr_interval tbl mapping
        in
        let ovar =  p.offset.abs_var in
        let svar =  p.scale.abs_var in 
        match p.range with
        | HWDAnalog(def) ->
          begin
            let hw_rng : num_interval =
              IntervalLib.interval2numinterval def.ival
            in
            let lin_expr = lin_combo map_rng.max svar ovar in
            q (Z3Assert(Z3LTE(lin_expr,Z3Real hw_rng.max)));
            let lin_expr = lin_combo map_rng.min svar ovar in
            q (Z3Assert(Z3LTE(lin_expr,Z3Real hw_rng.min)))
          end

        | HWDAnalogState(def) ->
          begin
            let hw_rng : num_interval = num_interval def.ival in
            let lin_expr = lin_combo map_rng.max svar ovar in
            qstvar (ovar,svar);
            q (Z3Assert(Z3LTE(lin_expr,z3_of_const hw_rng.max)));
          end

        | HWDDigital(def) ->
          ()
      );
    (*range decls*)
    q (Z3SAT);
    q (Z3DispModel);
    ()


  let solve (prob:wireid map_circ) =
    let stmts = build_z3_prob prob in
    error "solve" "unimpl"



end
