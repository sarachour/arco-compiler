open MapData;;
open HWData;;
open HWLib;;
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
    Z3Var(vid_to_name i)
    (*Z3Mult(Z3Var("v"^(string_of_int i)),Z3Int(MAP.get scaling i))*)


  let var_to_vid (st:string) =
    if STRING.startswith st "v" then
      match STRING.split st "v" with
      | [id] -> Some (int_of_string id)
      | _ ->
        begin
          error "var_to_vid" ("malformed:"^st);
          None
        end
    else
      None

  let build_z3_prob (tbl:gltbl) (prob:wireid map_circ)  =
    let stmtq = QUEUE.make () in
    let derivq = SET.make () in
    let q s = noop (QUEUE.enqueue stmtq s) in
    (*var decls*)
    let lin_combo (v:float ) (sc:int) (off:int) =
      Z3Plus(Z3Mult(vid_to_var (sc),Z3Real v),vid_to_var (off))
    in
    let scale_zero_cstr svar (math_rng:num_interval) =
      let min_val = 0.0000001 in
      let min_diff = min_val*.min_val in
      if math_rng.max -. math_rng.min > min_diff then
        q (Z3Assert(Z3Not(Z3And(
            Z3LT(vid_to_var svar,Z3Real min_val),
            Z3GT(vid_to_var svar,Z3Real (0.-.min_val)))
           )))
    in
    q (Z3Comment("Variable Decls"));
    MAP.clear scaling;
    (*construct vars in use*)
    MAP.iter prob.vars (fun k vardata ->
        let prio : int =
          int_of_float (10.**(float_of_int vardata.priority))
        in
        noop (MAP.put scaling k prio) 
      );
    (*add variable constraints*)
    let freevars = SET.make () in
    let set_eq (lst:z3expr list) : z3expr option = match lst with
      | h::h2::t ->
        begin
          let exprs = List.map (fun el -> Z3Eq(el,h)) (h2::t) in
          Some (Z3Lib.fn_all exprs (fun a b -> Z3And(a,b)) )
        end

      | _ -> None
    in
    let in_use = SET.make () in
    let map_expr_to_z3 vid expr =
      MapExpr.z3
        freevars ("free_"^(string_of_int vid)) expr
        (fun (x:int) -> SET.add in_use x; vid_to_var x )
    in
    q (Z3Comment ("=== var cstrs ==="));
    MAP.iter prob.vars (fun (vid:int) (v:wireid map_abs_var) ->
        SET.clear freevars;
        let xexpr :z3expr list = List.map
            (fun (expr:int map_expr) ->
               let z3expr = map_expr_to_z3 vid expr in
               z3expr
          ) v.exprs
        in
        let xcstr : z3expr list = List.map (
            fun ((cstr,expr):map_cstr*int map_expr)  ->
              let z3expr = map_expr_to_z3 vid expr in 
              MapExpr.z3_of_map_cstr cstr (vid_to_var vid) z3expr
          ) v.cstrs
        in
        SET.iter freevars (fun f -> q (Z3ConstDecl(f, Z3Real)));
        match set_eq xexpr with
        | Some(equality) ->
          q (Z3Assert(equality))
        | _ -> ();
        List.iter (fun expr -> q (Z3Assert(expr))) xcstr;
        ()


      );
    q (Z3Comment ("=== derivative cstrs ==="));
    let offset_vars = (SET.map derivq (fun (s,o) -> vid_to_var o)) in
    begin
      match set_eq offset_vars with
      | Some(offset_expr) -> q (Z3Assert offset_expr)
      | None -> ()
    end;
    let scale_vars = (SET.map derivq (fun (s,o) -> vid_to_var s)) in
    begin
      match set_eq scale_vars with
      | Some(scale_expr) -> q (Z3Assert scale_expr)
      | None -> ()
    end;
    q (Z3Comment ("=== port restrictions ==="));
    MAP.iter prob.ports (fun (_) ((w,p):wireid*map_port_info) ->
        match p.range, MapSpec.circ_get_mapping prob w with
          | Some(hw_rng),Some(map_rng) ->
            begin
              let ovar =  p.offset.abs_var in
              let svar =  p.scale.abs_var in
              if SET.has in_use ovar || SET.has in_use svar then 
                begin
                  noop (SET.add in_use ovar);
                  noop (SET.add in_use svar);
                  let lin_expr = lin_combo map_rng.max svar ovar in
                  q (Z3Assert(Z3LTE(lin_expr,Z3Real hw_rng.max)));
                  let lin_expr = lin_combo map_rng.min svar ovar in
                  q (Z3Assert(Z3GTE(lin_expr,Z3Real hw_rng.min)));
                  scale_zero_cstr svar map_rng;
                  (*only make stvars equal*)
                  if p.is_stvar then
                    begin
                      match p.deriv_range,
                            MapSpec.circ_get_deriv_mapping prob w with
                      | Some(hwd_rng),Some(map_d_rng) ->
                        begin
                          let lin_expr = lin_combo map_d_rng.max svar ovar in
                          q (Z3Assert(Z3LTE(lin_expr,Z3Real hwd_rng.max)));
                          let lin_expr = lin_combo map_d_rng.min svar ovar in
                          q (Z3Assert(Z3GTE(lin_expr,Z3Real hwd_rng.min)));
                          noop (SET.add derivq (ovar,svar));
                        end
                      | _ ->
                        raise (MapSolverError("unexpected: must have deriv"))
                    end;
                  ()
                end
            end
          | _ -> ()

      );
    print "!"
      ("<< SOLVER # VARS = "^(string_of_int (SET.size in_use)));
    let decls = MAP.fold prob.vars (fun k vardata decls ->
        if SET.has in_use k then
          Z3ConstDecl(vid_to_name k,Z3Real)::decls
        else
          decls
      ) []
    in
    (*range decls*)
    let stmts = QUEUE.to_list stmtq in
    QUEUE.destroy stmtq;
    decls @ stmts

  (*if the mappings are*)
  let asgn_to_mappings
      (circ:wireid map_circ) (vals:(int,float) map) (valid:bool ref)
      (asgn:z3assign) =
    let name,value = match asgn with
            | Z3Set(vname,Z3QFloat(dir)) ->
              vname,Some (Decimal dir)

            | Z3Set(vname,Z3QInt(dir)) ->
              vname,Some (Integer dir)

            | Z3Set(vname,Z3QInterval(Z3QInfinite(dir))) ->
              vname,None

            | Z3Set(vname,Z3QInterval(Z3QAny)) ->
              vname,Some (Integer 0)

            | Z3Set(vname,Z3QInterval(Z3QRange(min,max))) ->
              let delta = max -. min in
              if delta < 0.001 then
                vname, Some (Decimal (max ))
              else
                begin
                  vname,None
                end

            | Z3Set(vname,Z3QInterval(Z3QLowerBound(min))) ->
              begin
                vname,None
              end

            | Z3Set(vname,Z3QInterval(Z3QUpperBound(max))) ->
              begin
                vname,None
              end

            | _ -> error "z3set" "unexpected"; "",None
    in
    match var_to_vid name, value with
    | Some(id),Some(v) ->
      let scale = MAP.get scaling id in
      let sc_value =
        ((float_of_number v) /. (float_of_int scale))
      in
      noop (MAP.put vals id sc_value)
    | Some(name),None ->
      REF.upd valid (fun _ -> true)
    | None,_ ->
      ()


  let to_mappings (circ:wireid map_circ)  (sln:z3sln)=
    if sln.sat = false then None
    else
      begin
        match sln.model with
        | Some(model) ->
          begin
            let is_valid = REF.mk true in
            let abs_var_map = MAP.make () in 
            List.iter (fun (asgn:z3assign)  ->
                noop (asgn_to_mappings circ abs_var_map is_valid asgn)
              ) model;
            None;
            (*there was an issue converting mappings*)
            if REF.dr  is_valid = false then None
            else
              begin
                let mappings = MAP.make () in
                MAP.iter circ.ports (fun _ (wire,port_info) ->
                    let ovar=
                      MAP.get_dflt
                        abs_var_map port_info.offset.abs_var 0.
                    in
                    let svar=
                      MAP.get_dflt
                        abs_var_map port_info.scale.abs_var 1.
                    in
                    let math_range =
                      match MapSpec.circ_get_mapping circ wire with
                      | Some(mapping) -> mapping
                      | None -> {min=0.; max =1.}
                    in
                      let mapping = {
                        scale=svar;
                        offset=ovar;
                        wire=wire;
                        hrng=OPTION.force_conc port_info.range;
                        mrng=math_range;
                      } in
                      noop (MAP.put mappings wire mapping)

                  );
                Some(mappings)
              end
          end

        | None ->  None
      end


  let timeout = 60;;

  let mappings (tbl:gltbl) (prob:wireid map_circ)
    : (wireid,hw_mapping) map option =
    let stmts = build_z3_prob tbl prob in
    let sln =
      Z3Lib.exec "mapping" stmts timeout true
    in
    let mappings = to_mappings prob sln in
    mappings

  let sat (tbl:gltbl) (prob:wireid map_circ)
    : bool =
    let stmts = build_z3_prob tbl prob in
    let sln =
      Z3Lib.exec "mapping" stmts timeout true
    in
    let mappings = to_mappings prob sln in 
    sln.sat && mappings <> None

end
