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

  let map_cstr_to_z3 (z3st:prob_state) (prefix:string) cstr =
    MapExpr.z3_of_map_cstr cstr (map_expr_to_z3 z3st (prefix))

  let declare_scaling_factors (z3st:prob_state) (circ:wireid map_circ) =
    MAP.iter circ.vars (fun k vardata ->
        let prio : int =
          int_of_float (10.**(float_of_int vardata.priority))
        in
        noop (MAP.put z3st.scale k prio) 
      )

  let emit_absvar_cstrs (z3st:prob_state) (v:wireid map_abs_var) =
    let q s = noop (QUEUE.enqueue z3st.stmtq s) in
    (*clear the set of free variables in use.*)
    let xexpr :z3expr list = List.map
        (fun (expr:int map_expr) ->
            let z3expr = map_expr_to_z3 z3st (string_of_int v.id) expr in
            z3expr
      ) v.exprs
    in
    let xcstr : z3expr list = List.map (
        fun ((cstr):int map_cstr)  ->
          map_cstr_to_z3 z3st (string_of_int v.id) cstr 
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
  let preprocess_abs_vars (z3st:prob_state) circ
      (p:map_port_info) (m:map_math_info)=
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
    let xexpr :z3expr list = List.map
        (fun (expr:int map_expr) ->
            let z3expr = map_expr_to_z3 z3st ("glbl") expr in
            z3expr
      ) args  
    in
    match set_eq xexpr with
    | Some(eq) -> q (Z3Assert(eq))
    | _ -> ()


  let dumb_guesser_traverse_expr dumb_guesses expr  =
    let q e =
      let lst = List.map (fun e -> Z3Assert(e)) e in
      noop (QUEUE.enqueue_all dumb_guesses lst)
    in
    let is_equiv term targ =
      let matches = QUEUE.filter dumb_guesses
          (fun (e:z3st) -> match e with
          | Z3Assert(Z3Eq(a,b)) ->
            (a = term && b = targ) || (b = term && a = targ)
          | _ -> false
        ) in
      List.length matches > 0
    in

    let rec _work e = match e with
      | Z3And(a,b) -> begin _work a; _work b end

      | Z3Eq(Z3Power(base,exp),Z3Power(base2,exp2)) ->
        if exp = exp2 then q [Z3Eq((base),(base2))]
      | Z3Eq(Z3Div(x,y),Z3Int(1)) ->
        q [Z3Eq(x,y)]

      | Z3Eq(Z3Div(x,y),Z3Var(v)) ->
        if is_equiv (Z3Var v) (Z3Int 1) then
          q [Z3Eq(x,y)]

      | Z3Eq(Z3Mult(i,expr),Z3Mult(j,expr2)) ->
        if i = j then q [Z3Eq(expr,expr2)]
        else if expr = expr2 then q [Z3Eq(i,j)]

      | Z3Eq(Z3Mult(Z3Var(i),Z3Var(j)),Z3Var(k)) ->
        (* a*b = a*)
        begin
          if i = k && i != j then
            q [Z3Eq(Z3Var(j),Z3Int(1))]
          else if j = k && i != j then
            q [Z3Eq(Z3Var(i),Z3Int(1))]
          else if i = k && i = j then
            
            q [Z3Eq(Z3Var(i),Z3Int 1)]
        end

      | Z3Eq(Z3Var(k),Z3Mult(Z3Var(i),Z3Var(j))) ->
        (* a*b = a*)
        begin
          if i = k && i != j then
            q [Z3Eq(Z3Var(j),Z3Int(1))]
          else if j = k && i != j then
            q [Z3Eq(Z3Var(i),Z3Int(1))]
          else if i = k && i = j then
            q [Z3Eq(Z3Var(i),Z3Int 1)]
        end

      | Z3Eq(Z3Mult(Z3Var(i),j),Z3Var(k)) ->
        if i = k then
          q [Z3Eq(j,Z3Int(1))];
        _work j

      | Z3Eq(Z3Mult(j,Z3Var(i)),Z3Var(k)) ->
        if i = k then
          q [Z3Eq(j,Z3Int(1))];
        _work j

      | Z3Eq(Z3Var(k),Z3Mult(Z3Var(i),j)) ->
        if i = k then
          q [Z3Eq(j,Z3Int(1))];
        _work j

      | Z3Eq(Z3Var(k),Z3Mult(j,Z3Var(i))) ->
        if i = k then
          q [Z3Eq(j,Z3Int(1))];
        _work j

      

      | _ -> ()
    in
    _work expr;
    ()

  let dumb_guesser (z3stmts: z3st list) =
    let dumb_guesses = QUEUE.make () in 
    List.iter (fun st ->
        match st with
        | Z3Assert(expr) ->
          dumb_guesser_traverse_expr dumb_guesses expr
        | _ -> ()
      ) z3stmts;
    let stmts = QUEUE.to_list (dumb_guesses) in
    QUEUE.destroy dumb_guesses;
    stmts

  let emit_time_cstrs (z3st) (circ:'a map_circ) =
    let q s = noop (QUEUE.enqueue z3st.stmtq s) in
    let time = circ.time in
    let delta = 0.0012 in
    begin
      match time.min_speed with
      | Some(speed) ->
        let cstr = MCGTE((time.vid), MEConst(Decimal (speed-.delta))) in
        let z3expr = map_cstr_to_z3 z3st ("time") cstr in
        q (Z3Assert(z3expr))
      | None -> ()
    end;
    begin
      match time.max_speed with
      | Some(speed) ->
        let cstr = MCLTE((time.vid), MEConst(Decimal (speed+.delta))) in
        let z3expr = map_cstr_to_z3 z3st ("time") cstr in
        q (Z3Assert(z3expr))
      | None -> ()
    end


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
    q (Z3Comment ("===summarize  ==="));
    MAP.iter circ.vars (fun id (a:wireid map_abs_var) ->
        let memstr = LIST.tostr
            (fun v -> MapExpr.string_of_map_var v HwLib.wireid2str)
            "," a.members in
        q (Z3Comment((string_of_int id)^"="^memstr))
    );
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
    MapPartition.iter circ.glbleq (fun  (v:int map_expr list) ->
        emit_equality z3state v
      );
    q (Z3Comment ("=== math cstrs ==="));
    MapPartition.iter circ.matheq (fun  (v:int map_expr list) ->
        emit_equality z3state v
    );
    q (Z3Comment ("=== time cstrs ==="));
    emit_time_cstrs z3state circ;
    q (Z3Comment ("=== port restrictions ==="));
    SMAP.iter circ.ports (fun (w:wireid) (port:map_port_info) ->
        let math = SMAP.get circ.mappings w in
        emit_port_cstrs z3state circ port math 
    );
    print "!"
      ("<< SOLVER # VARS = "^(string_of_int (SET.size z3state.in_use)));
    let decls = MAP.fold circ.vars (fun k vardata decls ->
        if var_in_use z3state k then
          let vname = vid_to_var_name z3state k in
          let decl = Z3ConstDecl(vid_to_var_name z3state k,Z3Real) in
          let finite =
            Z3Assert(Z3And(
                Z3LTE(Z3Var vname,Z3Int(max_float)),
                Z3GTE(Z3Var vname,Z3Int(min_float))
              ))
          in
          let non_negligable =
            Z3Assert(Z3Or(
                Z3Eq(Z3Var vname, Z3Int(0)),
                Z3IfThenElse(
                  Z3LT(Z3Var vname, Z3Int(0)),
                  Z3LTE(Z3Var vname, Z3Decimal(0.-epsilon_float)),
                  Z3GTE(Z3Var vname, Z3Decimal(epsilon_float))
                )
              ))
          in
          decl::finite::decls
        else
          decls
      ) []
    in
    let free_decls = SET.map z3state.freevars (fun freevar ->
        Z3ConstDecl(freevar, Z3Real);
      )
    in
    (*range decls*)
    let stmts = QUEUE.to_list z3state.stmtq in
    let dumb_guesses = dumb_guesser stmts in 
    QUEUE.destroy z3state.stmtq;
    z3state,decls @ free_decls @ stmts @
            (Z3Comment("===dumb guesses ===")::dumb_guesses)





  (*if the mappings are*)
  let asgn_to_mappings
      z3st (circ:wireid map_circ) 
      (asgn:z3assign) =
    let set_invalid n =
      if STRING.startswith n "v" then
        z3st.is_valid <- false
      else
        ()
    in
    let name,value = match asgn with
            | Z3Set(vname,Z3QFloat(dir)) ->
              vname,Some (Decimal dir)

            | Z3Set(vname,Z3QInt(dir)) ->
              vname,Some (Integer dir)

            | Z3Set(vname,Z3QInterval(Z3QInfinite(dir))) ->
              begin
                set_invalid (vname);
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
                set_invalid (vname);
                vname,None
              end

            | Z3Set(vname,Z3QInterval(Z3QUpperBound(max))) ->
              begin
                set_invalid(vname);
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
                    begin
                      match port_info.range with
                      | (Some(hwrange)) ->
                        let mapping = {
                          scale=svar;
                          offset=ovar;
                          wire=wire;
                          hrng=hwrange;
                          mrng=math_range;
                        } in
                        noop (MAP.put mappings wire mapping)
                      | None -> ()
                    end
                  );
                Some(mappings)
              end
          end

        | None ->  None
      end


  let mappings (tbl:gltbl) (prob:wireid map_circ) timeout
    : (wireid,hw_mapping) map option =
    let z3st,stmts = build_z3_prob tbl prob in
    let sln =
      Z3Lib.exec "mapping" stmts timeout true
    in
    let mappings = to_mappings z3st prob sln in
    mappings

  let sat (tbl:gltbl) (prob:wireid map_circ) timeout
    : bool =
    let z3st,stmts = build_z3_prob tbl prob in
    let sln =
      Z3Lib.exec "mapping" stmts timeout true
    in
    let mappings = to_mappings z3st prob sln in
    let is_sat = sln.sat && mappings <> None in
    is_sat
end
