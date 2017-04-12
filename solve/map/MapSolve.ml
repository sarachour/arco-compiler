open MapData;;
open HWData;;
open HWLib;;
open Interactive;;

open MapExpr;;
open MapSpec;;
open MapSpecGen;;
open MapPartition;;
open MapIntervalCompute;;
open IntervalData;;
open IntervalLib;;
open SolverData;;

open Util;;
open Z3Data;;
open Z3Lib;;
open StrMap;;

exception MapSolverError of string

let error n m  : unit= raise (MapSolverError (n^":"^m))

module MapSolver =
struct


  let vid_to_name (i:int) =
    "v"^(string_of_int i)

  type prob_state = {
    in_use: int set;
    (*free variables and variables that are derivatives*)
    freevars: string set;
    stmtq: z3st queue;
    scale: (int,int) map;

    (*solution*)
    mutable is_valid : bool;
    absvar_map : (int,float) map;
  }

  let vid_to_var_name z3st (i:int) =
    let nominal = (vid_to_name i)
    in
    nominal 

  let vid_to_var z3st (i:int) =
    let nominal = Z3Var(vid_to_var_name z3st i) in
    nominal
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


  let scale_zero_cstr z3st svar (math_rng:num_interval) =
    let q s = noop (QUEUE.enqueue z3st.stmtq s) in
    let min_val = 0.0012 in
    let min_diff = min_val*.min_val in
    if math_rng.max -. math_rng.min > min_diff then
      q (Z3Assert(Z3Not(Z3And(
          Z3LT(vid_to_var z3st svar,Z3Real min_val),
          Z3GT(vid_to_var z3st svar,Z3Real (0.-.min_val)))
        )))

  


  let set_eq (lst:z3expr list) : z3expr option = match lst with
      | h::h2::t ->
        begin
          let exprs = List.map (fun el -> Z3Eq(el,h)) (h2::t) in
          Some (Z3Lib.fn_all exprs (fun a b -> Z3And(a,b)) )
        end

      | _ -> None

  let lin_combo z3st (v:float ) (sc:int) (off:int) =
    Z3Plus(Z3Mult(vid_to_var z3st (sc),Z3Real v),vid_to_var z3st (off))

  let var_in_use (z3st:prob_state) vid =
    SET.has z3st.in_use vid

  let mark_var_in_use (z3st:prob_state) vid =
    noop (SET.add z3st.in_use vid);
    ()

  let map_expr_to_z3 (z3st:prob_state) (prefix:string) expr =
      MapExpr.z3
        z3st.freevars ("free_"^(prefix)) expr
        (fun (x:int) ->
           mark_var_in_use z3st x;
           vid_to_var z3st x
        )

  let declare_scaling_factors (z3st:prob_state) (circ:wireid map_circ) =
    MAP.iter circ.vars (fun k vardata ->
        let prio : int =
          int_of_float (10.**(float_of_int vardata.priority))
        in
        noop (MAP.put z3st.scale k prio) 
      )

  let emit_absvar_cstrs (z3st:prob_state) (v:wireid map_abs_var) =
    let q s = noop (QUEUE.enqueue z3st.stmtq s) in
    SET.clear z3st.freevars;
    let xexpr :z3expr list = List.map
        (fun (expr:int map_expr) ->
            let z3expr = map_expr_to_z3 z3st (string_of_int v.id) expr in
            z3expr
      ) v.exprs
    in
    let xcstr : z3expr list = List.map (
        fun ((cstr):int map_cstr)  ->
          MapExpr.z3_of_map_cstr cstr (map_expr_to_z3 z3st (string_of_int v.id))
      ) v.cstrs
    in
    (*declare any free variables you need.*)
    SET.iter z3st.freevars (fun f -> q (Z3ConstDecl(f, Z3Real)));
    (*declare any equality constraints*)
    begin
      match set_eq xexpr with
      | Some(equality) ->
        q (Z3Assert(equality))
      | _ -> ()
    end;
    begin
      match v.value with
      | Some(Integer c) -> q (Z3Assert(Z3Eq(vid_to_var z3st v.id,Z3Int(c))))
      | Some(Decimal c) -> q (Z3Assert(Z3Eq(vid_to_var z3st v.id,Z3Real(c))))
      | _ -> ()
    end;
    (*declare any outstanding constraints*)
    List.iter (fun expr -> q (Z3Assert(expr))) xcstr;
    ()

  (*merge derivative variables.*)
  let preprocess_abs_vars (z3st:prob_state) circ (p:map_port_info) (m:map_math_info)=
    ()

  let emit_port_cstrs (z3st:prob_state) circ (p:map_port_info) (m:map_math_info) = 
    let q s = noop (QUEUE.enqueue z3st.stmtq s) in
    match p.range, m.range with
     | Some(hw_rng),Some(map_rng) ->
        begin
          let ovar =  p.offset.abs_var in
          let svar =  p.scale.abs_var in
          (*variable is being used*)
          if var_in_use z3st ovar || var_in_use z3st svar then 
            begin
              noop (SET.add z3st.in_use ovar);
              noop (SET.add z3st.in_use svar);
              let lin_expr = lin_combo z3st map_rng.max svar ovar in
              q (Z3Assert(Z3LTE(lin_expr,Z3Real hw_rng.max)));
              let lin_expr = lin_combo z3st map_rng.min svar ovar in
              q (Z3Assert(Z3GTE(lin_expr,Z3Real hw_rng.min)));
              scale_zero_cstr z3st svar map_rng;
              (*only make stvars equal*)
              begin
                  match p.deriv_range, m.deriv_range with
                  | Some(hwd_rng),Some(map_d_rng) ->
                    begin
                      let lin_expr = lin_combo z3st map_d_rng.max svar ovar in
                      q (Z3Assert(Z3LTE(lin_expr,Z3Real hwd_rng.max)));
                      let lin_expr = lin_combo z3st map_d_rng.min svar ovar in
                      q (Z3Assert(Z3GTE(lin_expr,Z3Real hwd_rng.min)));
                    end
                  | None,None -> ()
                  | _ ->
                    raise (MapSolverError("unexpected: must have deriv"))
              end;
              ()
            end
        end
        | _ -> ()

  let emit_equality z3st (args:int map_expr list) =
    let q s = noop (QUEUE.enqueue z3st.stmtq s) in
    SET.clear z3st.freevars;
    let xexpr :z3expr list = List.map
        (fun (expr:int map_expr) ->
            let z3expr = map_expr_to_z3 z3st "glbl" expr in
            z3expr
      ) args  
    in
    SET.iter z3st.freevars (fun f -> q (Z3ConstDecl(f, Z3Real)));
    match set_eq xexpr with
    | Some(eq) -> q (Z3Assert(eq))
    | None -> raise (MapSolverError "unexpected.")

  let build_z3_prob (tbl:gltbl) (circ:wireid map_circ)  =
    let deriv_scale : wireid map_abs_var = {
      exprs=[]; cstrs=[];
      id=MAP.size circ.vars;
      priority=0;
      value=None;
      members=[];
    }
    in
    let deriv_offset: wireid map_abs_var = {
      exprs=[]; cstrs=[];
      id=MAP.size circ.vars+1;
      priority=0;
      value=None;
      members=[];
    } in
    noop (MAP.put circ.vars deriv_scale.id deriv_scale);
    noop (MAP.put circ.vars deriv_offset.id deriv_offset);
    let z3state : prob_state = {
      in_use = SET.make();
      freevars = SET.make();
      stmtq = QUEUE.make();
      scale = MAP.make();
      is_valid = true;
      absvar_map = MAP.make();
    } in
    let q s = noop (QUEUE.enqueue z3state.stmtq s) in
    (*var decls*)
    q (Z3Comment("Variable Decls"));
    (*add variable constraints*)
    q (Z3Comment ("=== port restrictions ==="));
    SMAP.iter circ.ports (fun (w:wireid) (port:map_port_info) ->
        let math = SMAP.get circ.mappings w in
        preprocess_abs_vars z3state circ port math
    );
    (*construct vars in use*)
    declare_scaling_factors z3state circ;
    q (Z3Comment ("=== var cstrs ==="));
    MAP.iter circ.vars (fun (vid:int) (v:wireid map_abs_var) ->
        emit_absvar_cstrs z3state v
    );
    q (Z3Comment ("=== global cstrs ==="));
    MapPartition.iter circ.equiv (fun  (v:int map_expr list) ->
        emit_equality z3state v
    );
    q (Z3Comment ("=== port restrictions ==="));
    SMAP.iter circ.ports (fun (w:wireid) (port:map_port_info) ->
        let math = SMAP.get circ.mappings w in
        emit_port_cstrs z3state circ port math 
    );
    print "!"
      ("<< SOLVER # VARS = "^(string_of_int (SET.size z3state.in_use)));
    let decls = MAP.fold circ.vars (fun k vardata decls ->
        if var_in_use z3state k then
          Z3ConstDecl(vid_to_var_name z3state k,Z3Real)::decls
        else
          decls
      ) []
    in
    (*range decls*)
    let stmts = QUEUE.to_list z3state.stmtq in
    QUEUE.destroy z3state.stmtq;
    z3state,decls @ stmts

  (*if the mappings are*)
  let asgn_to_mappings
      z3st (circ:wireid map_circ) 
      (asgn:z3assign) =
    let name,value = match asgn with
            | Z3Set(vname,Z3QFloat(dir)) ->
              vname,Some (Decimal dir)

            | Z3Set(vname,Z3QInt(dir)) ->
              vname,Some (Integer dir)

            | Z3Set(vname,Z3QInterval(Z3QInfinite(dir))) ->
              begin
                z3st.is_valid <- false;
                vname,None
              end

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
                z3st.is_valid <- false;
                vname,None
              end

            | Z3Set(vname,Z3QInterval(Z3QUpperBound(max))) ->
              begin
                z3st.is_valid <- false;
                vname,None
              end

            | _ -> error "z3set" "unexpected"; "",None
    in
    match var_to_vid name, value with
    | Some(id),Some(v) ->
      let scale = MAP.get z3st.scale id in
      let sc_value =
        ((float_of_number v) /. (float_of_int scale))
      in
      noop (MAP.put z3st.absvar_map id sc_value)
    | Some(name),None ->
      ()
    | None,_ ->
      ()


  let to_mappings z3st (circ:wireid map_circ)  (sln:z3sln)=
    if sln.sat = false then None
    else
      begin
        match sln.model with
        | Some(model) ->
          begin
            List.iter (fun (asgn:z3assign)  ->
                noop (asgn_to_mappings z3st circ asgn)
              ) model;
            if z3st.is_valid = false then None
            else
              begin
                let mappings = MAP.make () in
                SMAP.iter circ.ports (fun wire (port_info) ->
                    let ovar:float =
                      MAP.get_dflt
                        z3st.absvar_map port_info.offset.abs_var 0.
                    in
                    let svar : float=
                      MAP.get_dflt
                        z3st.absvar_map port_info.scale.abs_var 1.
                    in
                    let math_range :num_interval =
                      match
                        OPTION.map_option (MapSpec.circ_get_mapping circ wire)
                          (fun x -> x.range)
                      with
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
    let z3st,stmts = build_z3_prob tbl prob in
    let sln =
      Z3Lib.exec "mapping" stmts timeout true
    in
    let mappings = to_mappings z3st prob sln in
    mappings

  let sat (tbl:gltbl) (prob:wireid map_circ)
    : bool =
    let z3st,stmts = build_z3_prob tbl prob in
    let sln =
      Z3Lib.exec "mapping" stmts timeout true
    in
    let mappings = to_mappings z3st prob sln in
    let is_sat = sln.sat && mappings <> None in
    is_sat
end
