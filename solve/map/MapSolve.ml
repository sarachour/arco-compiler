open MapData;;
open HWData;;
open Interactive;;

open MapSpecGen;;
open MapIntervalCompute;;
open IntervalData;;
open IntervalLib;;
open SolverData;;

open Util;;
open Z3Data;;
open Z3Lib;;

exception MapSolverError of string

let error n m  : unit= raise (MapSolverError (n^":"^m))

module MapSolver =
struct

  let scaling : (int,int) map= MAP.make ();;

  let vid_to_name (i:int) =
    "v"^(string_of_int i)

  let vid_to_var (i:int) =
    Z3Mult(Z3Var("v"^(string_of_int i)),Z3Int(MAP.get scaling i))

  let build_z3_prob (tbl:gltbl) (prob:wireid map_circ)  =
    let stmtq = QUEUE.make () in
    let derivq = SET.make () in
    let q s = noop (QUEUE.enqueue stmtq s) in
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
        let map_rng : num_interval = MAP.get prob.mappings w in
        match p.range with
        | None -> ()
        | Some(hw_rng) ->
          let ovar =  p.offset.abs_var in
          let svar =  p.scale.abs_var in 
          let lin_expr = lin_combo map_rng.max svar ovar in
          q (Z3Assert(Z3LTE(lin_expr,Z3Real hw_rng.max)));
          let lin_expr = lin_combo map_rng.min svar ovar in
          q (Z3Assert(Z3LTE(lin_expr,Z3Real hw_rng.min)));
          noop (SET.add derivq (ovar,svar));
          ()
      );
    (*add variable constraints*)
    let freevars = SET.make () in
    MAP.iter prob.vars (fun (vid:int) (v:wireid map_abs_var) ->
        SET.clear freevars;
        let xexpr :z3expr list = List.map
            (fun (expr:int map_expr) ->
               let z3expr = MapExpr.z3
                   freevars ("free_"^(string_of_int vid)) expr
                  (fun (x:int) ->
                    vid_to_var x 
                  )
              in
              z3expr
          ) v.exprs
        in
        SET.iter freevars (fun f -> q (Z3ConstDecl(f, Z3Real)));
        if List.length xexpr == 0 then ()
        else
          let equality = Z3Lib.eq_all xexpr in
          q (Z3Assert(equality))
      );
    (*add the speed constraint*)
    if SET.size derivq > 0 then
      begin
        q (Z3Assert(
            Z3Lib.eq_all
              (SET.map derivq (fun (s,o) -> vid_to_var s))
          ));
        q (Z3Assert(
            Z3Lib.eq_all
              (SET.map derivq (fun (s,o) -> vid_to_var o))
          ));
      end;
    (*range decls*)
    q (Z3SAT);
    q (Z3DispModel);
    let stmts = QUEUE.to_list stmtq in
    QUEUE.destroy stmtq;
    stmts

  let asgn_to_mappings (asgn:z3assign) =
    match asgn with
            | Z3Set(vname,Z3QFloat(dir)) ->
              error "to_mappings" "unhandled flt"

            | Z3Set(vname,Z3QInt(dir)) ->
              error "to_mappings" "unhandled int"

            | Z3Set(vname,Z3QInterval(Z3QInfinite(dir))) ->
              error "to_mappings" "unhandled inf"

            | Z3Set(vname,Z3QInterval(Z3QAny)) ->
                error "to_mappings" "unhandled any"

            | Z3Set(vname,Z3QInterval(Z3QRange(min,max))) ->
                error "to_mappings" "unhandled range"

            | Z3Set(vname,Z3QInterval(Z3QLowerBound(min))) ->
                error "to_mappings" "unhandled lb"

            | Z3Set(vname,Z3QInterval(Z3QUpperBound(max))) ->
              error "to_mappings" "unhandled ub"

            | _ -> error "z3set" "unexpected"

  let to_mappings (circ:wireid map_circ)  (sln:z3sln)=
    if sln.sat = false then None
    else
      begin
        match sln.model with
        | Some(model) ->
          begin
            List.iter (fun (asgn:z3assign)  ->
                asgn_to_mappings asgn
              ) model;
            None
          end

        | None ->  None
      end

  let solve (tbl:gltbl) (prob:wireid map_circ)
    : (wireid,hw_mapping) map option =
    let stmts = build_z3_prob tbl prob in
    let sln =
      Z3Lib.exec "MAPPER" stmts true
    in
    Z3Lib.save_z3_prob "MAPPER_PROB" stmts (Z3Int 0) true;
    let mappings = to_mappings prob sln in
    mappings


end
