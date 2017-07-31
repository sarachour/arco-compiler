open HWData;;
open HWLib;;
open Util;;
open SolverData;;
open MathData;;
open MathLib;;


open IntervalData;;
open IntervalLib;;

open AST;;
open SMapSolverData;;

open SMapData;;
open SMapIntervalCompute;;
open SMapHwSpecGen;;

exception SMapHwConfigGen_error of string
module SMapCfggenUtil=
struct

  let bind_val_to_wire: cfggen_ctx -> map_loc_val -> wireid -> unit=
    fun ctx v wire ->
      let cmp : map_comp_ctx = MAP.get ctx.insts wire.comp in
      MAP.put cmp.ports wire.port v;
      ()

  let bind_val_to_wire_collection: cfggen_ctx -> map_loc_val -> (wireid->wireid list) -> wire_coll -> unit =
    fun ctx v wirefxn wires ->
        match wires with
          | WCollOne(wid) ->
            List.iter (fun wire -> bind_val_to_wire ctx v wire) (wirefxn wid)
          | WCollMany(wlist) ->
            List.iter (fun wid ->
                List.iter
                  (fun wire -> bind_val_to_wire ctx v wire)
                  (wirefxn wid)
              ) wlist
          | WCollEmpty -> ()

  let bind_time_cstrs_to_wire: cfggen_ctx -> number option -> number option -> wireid -> unit=
    fun ctx sample_maybe speed_maybe wire ->
      let cmp : map_comp_ctx = MAP.get ctx.insts wire.comp in
      begin
        match speed_maybe with
        | Some(speed) -> noop (MAP.put cmp.speed wire.port speed)
        | _ -> ()
      end;
      ()

  let bind_time_cstrs_to_wire_collection: cfggen_ctx -> number option -> number option -> wire_coll -> unit =
    fun ctx sample speed wires ->
        match wires with
          | WCollOne(wid) ->
            bind_time_cstrs_to_wire ctx sample speed wid
          | WCollMany(wlist) ->
            List.iter (fun wire -> bind_time_cstrs_to_wire ctx sample speed wire) wlist
        | WCollEmpty -> ()

  
  let connect_bins_by_cstr :cfggen_ctx -> hwcompinst -> map_cstr -> bool =
    fun ctx inst cstr ->
      match cstr with
      | SCVarEqVar(mv1,mv2) ->
        ret (SMapCfggenCtx.connect_bins ctx (SMBMapVar(inst,mv1)) (SMBMapVar(inst,mv2))) true

      | SCVarEqConst(mv1,n) ->
        ret (SMapCfggenCtx.connect_bins ctx (SMBMapVar(inst,mv1)) (SMBNumber n)) true

      | SCVarEqExpr(mv1,me1) ->
        ret (SMapCfggenCtx.connect_bins ctx (SMBMapVar(inst,mv1)) (SMBMapExpr(inst,me1))) true

      | SCExprEqExpr(me1,me2) ->
        ret (SMapCfggenCtx.connect_bins ctx (SMBMapExpr(inst,me1)) (SMBMapExpr(inst,me2))) true

      | SCExprEqConst(me1,n) ->
        ret (SMapCfggenCtx.connect_bins ctx (SMBMapExpr(inst,me1)) (SMBNumber n)) true

      | SCExprIneq(_,me) ->
        ret (SMapCfggenCtx.make_bin ctx (SMBMapExpr(inst,me))) false

      | SCVarIneq(_,mv) ->
        ret (SMapCfggenCtx.make_bin ctx (SMBMapVar(inst,mv))) false

      | SCCoverInterval(mrng,hrng,mexpr,hexpr) -> false
      | SCCoverTime(n,n2) -> false

      | SCTrue -> false | SCFalse -> false
      | _ -> false 

end


module SMapGraphSimplifier =
struct




  
  (*
     a = b*a and a != 0 then b = 1. match node sets in equivalence class. Disable these
     nodes and add the 
     
  *)


  (*
     TODO: wireid -> hwcompinst
     TODO: write the a*b = a rule
     TODO: write rule composition

  *)

  type cfggen_xform = {
    connect: (cfggen_bin*cfggen_bin) list;
    disable:cfggen_bin list;
    disable_eq:(cfggen_bin*cfggen_bin) list;
    cstr:map_cstr list;
    tag: string;
  }
  
  let generic_rewrite : cfggen_ctx ->
    (cfggen_bin ->cfggen_bin -> cfggen_xform list) ->
    (hwcompinst -> map_cstr -> map_cstr -> cfggen_xform list) ->
    unit =
    fun ctx rewrite cstr_rewrite ->
      let rewritten = SET.make_dflt () in
      let apply xform inst_maybe =
        if SET.has rewritten xform.tag == false then
          begin
            Printf.printf " -> %s\n" xform.tag;
            noop (SET.add rewritten xform.tag);
            List.iter (fun (a,b) ->
                SMapCfggenCtx.connect_bins ctx a b
              ) xform.connect;
            List.iter (fun a ->
                SMapCfggenCtx.export_bin ctx a false;
              ) xform.disable;
            List.iter (fun (a,b) ->
                SMapCfggenCtx.export_edge ctx a b false;
              ) xform.disable_eq;
            match inst_maybe with
            | Some(inst) ->
              List.iter (fun cstr ->
                  SMapCfggenCtx.add_cstr ctx inst cstr
                ) xform.cstr
            | None -> ()
          end
      in

      let rec _work () =
        let cnt = SET.size rewritten in
        GRAPH.iter_node ctx.bins (fun node ->
            let connected = GRAPH.connected ctx.bins node in
            List.iter (fun othernode ->
                if node == othernode then () else
                let xforms = rewrite node othernode in
                List.iter (fun xform ->
                    apply xform None
                  ) xforms
              ) connected
          );
        MAP.iter ctx.cstrs (fun inst nodes ->
            let app_nodes = List.filter (fun x ->
                match x with
                | SCCoverInterval(_) -> true
                | SCCoverTime(_) -> true
                | SCVarIneq(_) -> true
                | SCExprIneq(_) -> true
                | _ -> false
              ) nodes
            in
            LIST.diag_iter app_nodes (fun n1 n2 ->
                let xforms = cstr_rewrite inst n1 n2 in
                List.iter (fun xform ->
                    apply xform (Some inst)
                  ) xforms;
              ) 
          );
        let new_rewrites = (SET.size rewritten) - cnt in
        Printf.printf ("=> New Rewrites: %d\n") new_rewrites;
        if cnt < SET.size rewritten then
          _work ()
        else
          ()
      in
      _work ()


  let merge_rewrites : (cfggen_bin -> cfggen_bin -> cfggen_xform list) list ->
    (cfggen_bin -> cfggen_bin -> cfggen_xform list) =
    fun xforms -> 
      let rewrite : cfggen_bin ->cfggen_bin -> cfggen_xform list =
        fun node1 node2 ->
          List.fold_right (fun xform results -> (xform node1 node2) @ results ) xforms []
      in
      rewrite

  let merge_cstr_rewrites :
    (hwcompinst -> map_cstr -> map_cstr -> cfggen_xform list) list ->
    (hwcompinst -> map_cstr -> map_cstr -> cfggen_xform list) =
    fun xforms -> 
      let rewrite : hwcompinst -> map_cstr ->map_cstr -> cfggen_xform list =
        fun inst node1 node2 ->
          List.fold_right (fun xform results -> (xform inst node1 node2) @ results ) xforms []
      in
      rewrite


  let a_eq_ab_rewrite : cfggen_ctx ->
    (cfggen_bin ->cfggen_bin -> cfggen_xform list )=
    fun ctx ->
      let extract_term expr targ =
        SMapExpr.factor expr (fun e -> e = targ)
      in
      let rec xform : cfggen_bin -> cfggen_bin -> cfggen_xform list =
        fun node1 node2 ->
          let tag newb = Printf.sprintf "a=ab: (%s = %s) -> (%s = 1)"
                      (SMapCfggenCtx.string_of_bin node1)
                      (SMapCfggenCtx.string_of_bin node2)
                      (SMapCfggenCtx.string_of_bin newb)
          in
          match node1,node2 with
          | SMBMapExpr(i,expr1),SMBMapExpr(j,expr2) ->
            if i == j &&
               (SMapCfggenCtx.ineq_expr ctx j (SCNEQ(Integer 0)) expr2)
            then
              begin
                (*factor *)
                match extract_term expr1 expr2 with
                | Some(_,new_expr) ->
                  let new_bin = SMapCfggenCtx.expr_to_bin i new_expr in
                  begin
                    [{
                      connect=[(new_bin,SMBNumber(Integer 1))];
                      disable=[];
                      disable_eq=[(node1,node2)];
                      cstr=[];
                      tag=tag new_bin
                    }]
                  end

                | None -> []
              end

            else
              []

          | SMBMapExpr(i,expr), SMBMapVar(j,cvar) ->
            if i ==j  &&
               SMapCfggenCtx.ineq_var ctx j (SCNEQ(Integer 0)) cvar 
            then
              begin
                match extract_term expr (SEVar cvar) with
                | Some(_,new_expr) ->
                  let new_bin = SMapCfggenCtx.expr_to_bin i new_expr in
                  begin
                    [{
                      connect=[new_bin,SMBNumber(Integer 1)];
                      disable=[];
                      disable_eq=[(node1,node2)];
                      cstr=[];
                      tag=tag new_bin;
                    }]
                  end

                | None -> []
              end

            else
              []

          | SMBMapVar(j,v2),SMBMapExpr(i,term) ->
            xform node2 node1

          | _ -> [] 
      in
      xform

  let pow_exp_eq_rewrite : cfggen_ctx -> (cfggen_bin -> cfggen_bin -> cfggen_xform list) =
    fun ctx ->
      let extract_pow_expr expr =
        let res = SMapExpr.factor expr (fun e -> match e with | SEPow(_) -> true | _ -> false) in
        OPTION.map res (fun (term,rest) -> term)
      in
      let extract_second_pow_expr expr power =
        let res = SMapExpr.factor expr (fun e -> match e,power with
            | SEPow(b,exp),SEPow(_,exp2) -> exp = exp2 | _ -> false)
        in
        OPTION.map res (fun (term,rest) -> term)
      in
      let rec xform : cfggen_bin -> cfggen_bin -> cfggen_xform list =
        fun node1 node2 ->
          let tag new_base1 new_base2 = Printf.sprintf "a**n=b**n: (%s=%s) -> (%s=%s)"
              (SMapCfggenCtx.string_of_bin node1)
              (SMapCfggenCtx.string_of_bin node2)
              (SMapCfggenCtx.string_of_bin new_base1)
              (SMapCfggenCtx.string_of_bin new_base2)
          in
          match node1,node2 with
          | SMBMapExpr(i,e1),SMBMapExpr(j,e2) ->
            if i == j then
              let pow1 = extract_pow_expr e1 in
              let pow2 =
                match pow1 with | Some(p1) -> extract_second_pow_expr e2 p1 | _ -> None
              in
              begin
                match pow1, pow2 with
                | Some(SEPow(base1,_)),Some(SEPow(base2,_)) ->
                  if base1 = base2 then [] else
                  let base1_bin = SMapCfggenCtx.expr_to_bin i base1 in 
                  let base2_bin = SMapCfggenCtx.expr_to_bin j base2 in 
                  [{
                    connect=[(base1_bin,base2_bin)];
                    disable=[];
                    disable_eq=[(node1,node2)];
                    cstr=[];
                    tag=tag base1_bin base2_bin
                  }]

                | Some(_),Some(_) -> raise (SMapHwConfigGen_error "expected two power terms")
                | _ -> []
              end
            else
              []
          | _ -> []

      in
      xform

  let pow_base_eq_rewrite : cfggen_ctx -> (cfggen_bin -> cfggen_bin -> cfggen_xform list) =
    fun ctx ->
      let extract_pow_expr expr =
        let res = SMapExpr.factor expr (fun e -> match e with | SEPow(_) -> true | _ -> false) in
        OPTION.map res (fun (term,rest) -> term)
      in
      let extract_second_pow_expr expr power =
        let res = SMapExpr.factor expr (fun e -> match e,power with
            | SEPow(base,_),SEPow(base2,_) -> base = base2 | _ -> false)
        in
        OPTION.map res (fun (term,rest) -> term)
      in
      let rec xform : cfggen_bin -> cfggen_bin -> cfggen_xform list =
        fun node1 node2 ->
          let tag new_exp1 new_exp2 = Printf.sprintf "a**n=a**m: (%s,%s) -> (%s,%s)"
              (SMapCfggenCtx.string_of_bin node1)
              (SMapCfggenCtx.string_of_bin node2)
              (SMapCfggenCtx.string_of_bin new_exp1)
              (SMapCfggenCtx.string_of_bin new_exp2)
          in
          match node1,node2 with
          | SMBMapExpr(i,e1),SMBMapExpr(j,e2) ->
            if i == j then
              let pow1 = extract_pow_expr e1 in
              let pow2 =
                match pow1 with | Some(p1) -> extract_second_pow_expr e2 p1 | _ -> None
              in
              begin
                match pow1, pow2 with
                | Some(SEPow(_,exp1)),Some(SEPow(_,exp2)) ->
                  if exp1 = exp2 then [] else
                  let exp1_bin = SMapCfggenCtx.expr_to_bin i exp1 in 
                  let exp2_bin = SMapCfggenCtx.expr_to_bin j exp2 in 
                  [{
                    connect=[(exp1_bin,exp2_bin)];
                    disable=[];
                    cstr=[];
                    disable_eq=[(node1,node2)];
                    tag=tag exp1_bin exp2_bin
                  }]

                | Some(_),Some(_) -> raise (SMapHwConfigGen_error "expected two power terms")
                | _ -> []
              end
            else
              []
          | _ -> []

      in
      xform

  let a_over_b_eq_1_rewrite : cfggen_ctx ->
    (cfggen_bin -> cfggen_bin -> cfggen_xform list) =
    fun ctx ->
      let get_rational expr =
        let numer_terms,denom_terms = SMapExpr.to_rational expr in
        let numer_expr = match numer_terms with
          | h::t -> Some(SMapExpr.product_of numer_terms) | [] -> None
        in
        let denom_expr = match denom_terms with
          | h::t -> Some(SMapExpr.product_of denom_terms) | [] -> None
        in
        numer_expr,denom_expr
      in 
      let rec xform : cfggen_bin -> cfggen_bin -> cfggen_xform list =
        fun node1 node2 ->
          let tag new_exp1 new_exp2 = Printf.sprintf "a/b=n>a=b: (%s,%s) -> (%s,%s)"
              (SMapCfggenCtx.string_of_bin node1)
              (SMapCfggenCtx.string_of_bin node2)
              (SMapCfggenCtx.string_of_bin new_exp1)
              (SMapCfggenCtx.string_of_bin new_exp2)
          in
          let do_rewrite i expr eq_term =
            match get_rational expr with
            | Some(numer),Some(denom) ->
              let expr1_bin = SMapCfggenCtx.expr_to_bin i numer in 
              let expr2_bin = SMapCfggenCtx.expr_to_bin i (SEMult(eq_term,denom)) in 
              [{
                connect=[(expr1_bin,expr2_bin)];
                disable=[];
                cstr=[];
                disable_eq=[(node1,node2)];
                tag=tag expr1_bin expr2_bin
              }]
              
            | None, Some(denom) ->
              let num_bin = SMBNumber(Integer 1) in
              let expr_bin = SMapCfggenCtx.expr_to_bin i (SEMult(eq_term,denom)) in 
              [{
                connect=[(num_bin,expr_bin)];
                disable=[];
                cstr=[];
                disable_eq=[(node1,node2)];
                tag=tag expr_bin num_bin 
              }]
            | _ -> []
          in
          match node1,node2 with
          | SMBMapExpr(i,e1),SMBNumber(n) ->
            do_rewrite i e1 (SENumber n)

          | SMBMapExpr(i,e1), SMBMapVar(j,v) ->
            if i <> j then [] else
              do_rewrite i e1 (SEVar v)

          | SMBMapExpr(i,e1), SMBMapExpr(j,e2) ->
            if i <> j then [] else
              begin
                let result=
                  match get_rational e1, get_rational e2 with
                  | (Some(numer1),Some(denom1)),(Some(numer2),Some(denom2)) ->
                    Some (SEMult(numer1,denom2),SEMult(numer2,denom1))
                  | (None,Some(denom1)),(Some(numer2),Some(denom2)) ->
                    Some (denom2,SEMult(numer2,denom1))
                  | (Some(numer1),Some(denom1)),(None,Some(denom2)) ->
                    Some (denom1, SEMult(denom2,numer1))
                  | (None,Some(denom1)),(None,Some(denom2)) ->
                    Some (denom1,denom2)
                  | _ -> None
                in
                match result with
                | Some(expr1,expr2) ->
                  if expr1 = expr2 then [] else
                  let expr1_bin = SMapCfggenCtx.expr_to_bin i expr1 in 
                  let expr2_bin = SMapCfggenCtx.expr_to_bin i (expr2) in 
                  [{
                    connect=[(expr1_bin,expr2_bin)];
                    disable=[];
                    cstr=[];
                    disable_eq=[(node1,node2)];
                    tag=tag expr1_bin expr2_bin;
                  }]
                | None -> []
              end

          | _ -> []
      in
      xform

  let an_eq_bn_rewrite : cfggen_ctx ->
    (cfggen_bin -> cfggen_bin -> cfggen_xform list )=
    fun ctx ->
      raise (SMapHwConfigGen_error "unimpl")

  let collect_const_rewrite: cfggen_ctx -> (string,number) map ->
    (cfggen_bin -> cfggen_bin -> cfggen_xform list)=
    fun ctx subs ->
      
      let put_sub : hwcompinst -> map_var -> number -> bool =
        fun i v num ->
          let key = SMapCfggenCtx.string_of_bin (SMBMapVar(i,v)) in
          if MAP.has subs key then false else
            begin
              MAP.put subs key num;
              true
            end
      in
      let xform : cfggen_bin -> cfggen_bin -> cfggen_xform list =
        fun node1 node2 -> match node1,node2 with
          | SMBMapVar(i,v),SMBNumber(n) ->
            if put_sub i v n then
              [{connect=[];disable=[];disable_eq=[];
                cstr=[];
                tag=Printf.sprintf "x=n: %s => %s"
                    (SMapCfggenCtx.string_of_bin node1) (string_of_number n)
               }]
            else
              []
          | SMBNumber(n), SMBMapVar(i,v) ->
            if put_sub i v n then 
              [{connect=[];disable=[];disable_eq=[];
                cstr=[];
                tag=Printf.sprintf "x=n : %s => %s"
                    (SMapCfggenCtx.string_of_bin node2) (string_of_number n)
               }]
            else
              []
          | _ -> []
      in
      xform

  let sub_const_rewrite: cfggen_ctx -> (string,number) map ->
    (cfggen_bin -> cfggen_bin ->cfggen_xform list) =
    fun ctx subs ->
      let get_sub : hwcompinst -> map_var -> number option =
        fun i v ->
          let key = SMapCfggenCtx.string_of_bin (SMBMapVar(i,v)) in
          MAP.ifget subs key
      in
      let simplify_xform : cfggen_bin -> hwcompinst -> map_expr -> cfggen_xform list =
        fun orig_bin inst expr ->
          if SMapCfggenCtx.disabled ctx orig_bin then [] else
            let simpl_expr = SMapExpr.simpl
                (SMapExpr.sub expr (
                    fun v -> OPTION.map
                        (get_sub inst v)
                        (fun x -> SENumber(x))
                  )
                )
            in
            let simpl_bin = SMapCfggenCtx.expr_to_bin inst simpl_expr in 
            if expr = simpl_expr || SMapCfggenCtx.equal_bins ctx orig_bin simpl_bin then []
            else
              [{
                connect=[(orig_bin,simpl_bin)];
                disable=[(orig_bin)];
                disable_eq=[];
                cstr=[];
                tag=Printf.sprintf "simplx: %s => %s"
                    (SMapCfggenCtx.string_of_bin orig_bin)
                    (SMapCfggenCtx.string_of_bin simpl_bin)
              }]
      in
      let xform : cfggen_bin -> cfggen_bin -> cfggen_xform list =
        fun node1 node2 -> 
          match node1,node2 with
          | SMBMapExpr(i,e), SMBMapExpr(i2,e2) ->
            (simplify_xform node1 i e) @
            (simplify_xform node2 i2 e2) 
          | SMBMapExpr(i,e),_ ->
            simplify_xform node1 i e
          | _, SMBMapExpr(i,e) ->
            simplify_xform node2 i e
          | _ -> []
      in
      xform


  let neq_and_pos_rewrite :cfggen_ctx ->
    (hwcompinst -> map_cstr -> map_cstr -> cfggen_xform list) =
    fun ctx ->
      let rec xform : hwcompinst -> map_cstr -> map_cstr -> cfggen_xform list =
        fun inst cstr1 cstr2 ->
          let tag = Printf.sprintf "pneg[%s]: (%s,%s)"
              (HwLib.hwcompinst2str inst)
              (SMapCstr.to_string cstr1)
              (SMapCstr.to_string cstr2)
          in
          match cstr1, cstr2 with
          | SCVarIneq(SCNEQ(Integer 0),v), SCVarIneq(SCGTE(Integer 0),v2) ->
            if v = v2 then
              [{
                connect=[]; disable=[]; disable_eq=[];
                cstr=[SCVarIneq(SCGT(Integer 0),v2)];
                tag=tag
              }]
            else
              []
          | SCExprIneq(SCNEQ(Integer 0),e), SCExprIneq(SCGTE(Integer 0),e2) ->
            if e = e2 then
              [{
                connect=[]; disable=[]; disable_eq=[];
                cstr=[SCExprIneq(SCGT(Integer 0),e2)];
                tag=tag
              }]
            else
              []
          | SCCoverInterval(mrng,hwrng,sc,off), SCExprIneq(SCNEQ(Integer 0),e) ->
            let expr1 = SEAdd(SEMult(sc,SENumber mrng.min),off) in
            let expr2 = SEAdd(SEMult(sc,SENumber mrng.max),off) in
            if NUMBER.lte hwrng.min (Integer 0) then [] else
            if expr1 = e then
              [{
                connect=[];disable=[];disable_eq=[];
                cstr=[SCExprIneq(SCGT(Integer 0),e)];
                tag=tag;
              }]
            else if expr2 = e then
              [{
                connect=[];disable=[];disable_eq=[];
                cstr=[SCExprIneq(SCGT(Integer 0),e)];
                tag=tag;
              }]
            else
              []
          | SCExprIneq(SCNEQ(Integer 0),e), SCCoverInterval(mrng,hwrng,sc,off) ->
            let expr1 = SEAdd(SEMult(sc,SENumber mrng.min),off) in
            let expr2 = SEAdd(SEMult(sc,SENumber mrng.max),off) in
            if NUMBER.lte hwrng.min (Integer 0) then [] else
            if expr1 = e then
              [{
                connect=[];disable=[];disable_eq=[];
                cstr=[SCExprIneq(SCGT(Integer 0),e)];
                tag=tag;
              }]
            else if expr2 = e then
              [{
                connect=[];disable=[];disable_eq=[];
                cstr=[SCExprIneq(SCGT(Integer 0),e)];
                tag=tag;
              }]
            else
              []
          | _ -> 
            [] 
      in
      xform 

  let simplify : cfggen_ctx -> unit =
    fun ctx ->
      (*
      numerical_rewrite(ctx);
      simplify_expressions(ctx);
      *)
      Printf.printf("==== REWRITE =====\n");
      let numer_assign : (string,number) map = MAP.make () in
      let phase1= [
        collect_const_rewrite ctx numer_assign;
      ] in
      let phase2= [
        sub_const_rewrite ctx numer_assign;
        collect_const_rewrite ctx numer_assign;
      ] in
      let phase3 = [
        (*algebra rewrite rules*)
        a_eq_ab_rewrite ctx;
        pow_base_eq_rewrite ctx;
        pow_exp_eq_rewrite ctx;
        a_over_b_eq_1_rewrite ctx;
        (*constant rewrite rules*)
        collect_const_rewrite ctx numer_assign;
        sub_const_rewrite ctx numer_assign;
      ] in
      let c_phase3 = [
        neq_and_pos_rewrite ctx; 
      ] in
      generic_rewrite ctx (merge_rewrites phase1) (merge_cstr_rewrites []);
      generic_rewrite ctx (merge_rewrites phase2) (merge_cstr_rewrites []);
      generic_rewrite ctx (merge_rewrites phase3) (merge_cstr_rewrites c_phase3);
      ()
end

module SMapHwConfigGen =
struct


  (*get range of expression*)
  let interval_of_expr : gltbl -> mid ast -> interval =
    fun tbl expr ->
      let ival = SMapIntervalCompute.compute_mexpr_interval tbl expr in
      Printf.printf " : interval.e %s : %s\n" (MathLib.mast2str expr) (IntervalLib.interval2str ival);
      ival

  (*get range of variable*)
  let interval_of_var : gltbl -> mkind -> string -> interval =
    fun tbl knd name ->
      let id = MNVar(knd,name) in
      let ival = SMapIntervalCompute.compute_mid_interval tbl id in
      Printf.printf " : interval.v %s : %s\n" (MathLib.mid2str id) (IntervalLib.interval2str ival);
      ival

  let time_constraints_of_var : gltbl ->  string -> number option*number option =
    fun gltbl mvar ->
      let sample,speed = MathLib.var_gettimecstr gltbl.env.math mvar in
      sample,speed
  (*
     Given a label conversion algorithm that converts labels to map values
     and a wire conversion algorithm that returns the set of wires to apply the label to given
      a wire
  *)
  let bind_labels_to_wires : gltbl -> cfggen_ctx -> (string,mid) labels->
    (wireid->wireid list) ->
    (string->interval->map_loc_val) ->
    (string->interval->map_loc_val) ->
    (string->interval->map_loc_val) ->
    (mid ast -> interval -> map_loc_val) -> 
    (number -> map_loc_val) -> unit =
    fun gltbl ctx lbls wirefxn infxn outfxn localfxn exprfxn numfxn ->
      begin
        MAP.iter lbls.outs (fun name wire_coll ->
            let ival : interval = interval_of_var gltbl MOutput name in
            SMapCfggenUtil.bind_val_to_wire_collection ctx (outfxn name ival) wirefxn wire_coll 
          );
        MAP.iter lbls.ins (fun name wire_coll ->
            let ival : interval = interval_of_var gltbl MInput name in
            SMapCfggenUtil.bind_val_to_wire_collection ctx (infxn name ival) wirefxn wire_coll
          );
        MAP.iter lbls.locals (fun name wire_coll ->
            let ival : interval = interval_of_var gltbl MLocal name in
            SMapCfggenUtil.bind_val_to_wire_collection ctx (localfxn name ival)  wirefxn wire_coll
          );
        MAP.iter lbls.exprs (fun (expr:mid ast) (wire_coll) ->
            let ival : interval = interval_of_expr gltbl expr in
            SMapCfggenUtil.bind_val_to_wire_collection ctx (exprfxn expr ival)  wirefxn wire_coll
          );
        MAP.iter lbls.vals (fun (num:number) (wire_coll) ->
            (*TODO: if input number then transformable. Otherwise not. *)
            SMapCfggenUtil.bind_val_to_wire_collection ctx (numfxn num)  wirefxn wire_coll
          );
        ()
      end

  
  let bind_time_constraints_to_wires : gltbl -> cfggen_ctx -> (string,mid) labels -> unit =
    fun gltbl ctx lbls ->
      MAP.iter lbls.outs (fun name wire_coll ->
          let min_sample_period,max_speed= time_constraints_of_var gltbl name in
          SMapCfggenUtil.bind_time_cstrs_to_wire_collection ctx min_sample_period max_speed wire_coll
        );
      MAP.iter lbls.ins (fun name wire_coll ->
          let min_sample_period,max_speed= time_constraints_of_var gltbl name in
          SMapCfggenUtil.bind_time_cstrs_to_wire_collection ctx min_sample_period max_speed wire_coll
        );
      MAP.iter lbls.locals (fun name wire_coll ->
          let min_sample_period,max_speed= time_constraints_of_var gltbl name in
          SMapCfggenUtil.bind_time_cstrs_to_wire_collection ctx min_sample_period max_speed wire_coll
        );
      ()


  
  let bind_numbers_to_params : gltbl -> cfggen_ctx -> unit =
    fun tbl ctx ->
      MAP.iter tbl.comp_ctx (fun (compname:hwcompname) compctx ->
          MAP.iter compctx.insts (fun (compinst:int) (conccomp:ucomp_conc) ->
              let inst : hwcompinst = {name=compname; inst=compinst} in
              let map_inst = MAP.get ctx.insts inst in
              MAP.iter conccomp.cfg.pars (
                fun (param_name:string) (param_val:number) ->
                  Printf.printf "par: %s[%d].%s = %s\n"
                    (HwLib.hwcompname2str compname) compinst 
                    (param_name) (string_of_number param_val);
                  MAP.put map_inst.params param_name param_val;
                  ()
              );
          )
        )

    
  

  let evaluate : map_comp_ctx -> map_hw_spec -> hwcompname -> string -> map_result =
    fun comp_ctx mapspec comp port ->
      let cstr_generator : map_cstr_gen = SMapHwSpec.get_port mapspec comp port in
      let cstr_gen_params : map_params = {allow_reflow = false} in
      let result : map_result =
        SMapHwSpecLateBind.evaluate comp_ctx cstr_gen_params cstr_generator 
      in
      result

  let build_config : map_hw_spec -> gltbl ->  cfggen_ctx option =
    fun tblspec tbl ->
      let ctx : cfggen_ctx = SMapCfggenCtx.mkctx() in
      let sln : (string,mid) sln = tbl.sln_ctx in
      SMapCfggenCtx.make_bin ctx (SMBTimeConstant);
      SET.iter sln.comps (fun (inst:hwcompinst) ->
          let data : map_comp_ctx =
            {
              ports = MAP.make(); params = MAP.make();
              sample = MAP.make(); speed = MAP.make();
            }
          in
          let spec : map_comp = MAP.get tblspec.comps inst.name in
          MAP.iter spec.inputs (fun port _ ->
              SMapCfggenCtx.make_bin ctx (SMBMapVar(inst,SMScale(port)));
              SMapCfggenCtx.make_bin ctx (SMBMapVar(inst,SMOffset(port)));
              ()
            );
          MAP.iter spec.outputs (fun port _ ->
              SMapCfggenCtx.make_bin ctx (SMBMapVar(inst,SMScale(port)));
              SMapCfggenCtx.make_bin ctx (SMBMapVar(inst,SMOffset(port)));
              ()
            );
          (*all the component time constants are the same*)
          SMapCfggenCtx.make_bin ctx (SMBMapVar(inst,SMTimeConstant));
          SMapCfggenCtx.connect_bins ctx
            SMBTimeConstant (SMBMapVar(inst,SMTimeConstant));
          MAP.put ctx.insts inst data;
          ()
        );
      let interval_to_val : interval -> map_loc_val =
        fun interval ->
          if IntervalLib.is_value interval then
            let num = IntervalLib.get_value interval in
            if num = 0.0 then SVZero
            else SVNumber(Decimal num)
          else
            SVSymbol(interval)
      in
      (*bind route values to the ports in each inst.*)
      bind_labels_to_wires tbl ctx sln.route
        (fun (wire:wireid) -> [wire])
        (fun (port:string) (interval:interval) -> interval_to_val interval)
        (fun (port:string) (interval:interval) -> interval_to_val interval )
        (fun (port:string) (interval:interval) -> interval_to_val interval )
        (fun expr interval -> interval_to_val interval )
        (fun number -> SVNumber(number) )
      ;
      (*map generate values to the ports in each inst. Also map the value to each
      sink the generate port feeds into.*)
      bind_labels_to_wires tbl ctx sln.generate
        (fun (wire:wireid) -> [wire] )
        (fun (port:string) (interval:interval) -> interval_to_val interval )
        (fun (port:string) (interval:interval) -> interval_to_val interval )
        (fun (port:string) (interval:interval) -> interval_to_val interval )
        (fun expr interval -> interval_to_val interval )
        (fun number -> SVNumber(number) )
      ;
      bind_time_constraints_to_wires tbl ctx sln.generate;
      bind_time_constraints_to_wires tbl ctx sln.route;
      bind_numbers_to_params tbl ctx;
      (* Merge variables joined through a connection *)
      MAP.iter sln.conns.src2dest (fun (src:wireid) (dests:wireid set) ->
          SET.iter dests (fun (dest:wireid) ->
              SMapCfggenCtx.connect_bins ctx
                (SMBMapVar(src.comp,SMScale(src.port)))
                (SMBMapVar(dest.comp,SMScale(dest.port)));
              SMapCfggenCtx.connect_bins ctx
                (SMBMapVar(src.comp,SMOffset(src.port)))
                (SMBMapVar(dest.comp,SMOffset(dest.port)));
           )
        );
      (* begin evaluation process *)
      let config_success = REF.mk true in
      let evaluate_port : hwcompinst -> map_comp_ctx -> string -> unit =
        fun inst comp_ctx port ->
          (* bind config and evaluate constraints *)
          let result : map_result = evaluate comp_ctx tblspec inst.name port in
          let remaining_cstrs : map_cstr list =
            List.filter (fun (cstr:map_cstr) ->
                (*Printf.printf "  -> cstr %s\n" (SMapCstr.to_string cstr);*)
                let is_eq_cstr = SMapCfggenUtil.connect_bins_by_cstr ctx inst cstr in
                is_eq_cstr == false
              )
              result.cstrs
          in
          (*if any of the constraints are false, terminate early during sunthesis process*)
          REF.upd config_success
            (fun is_succ -> is_succ && (not (LIST.has result.cstrs SCFalse)));
          let curr_cstrs = if MAP.has ctx.cstrs inst then MAP.get ctx.cstrs inst else [] in
          MAP.put ctx.cstrs inst (remaining_cstrs@curr_cstrs);
          ()
      in
      (*evaluate components to get results*)
      MAP.iter ctx.insts (fun (inst:hwcompinst) (inst_data:map_comp_ctx) ->
          let spec : map_comp = MAP.get tblspec.comps inst.name in
          Printf.printf "=== Component %s.%d ===\n"
            (HwLib.hwcompname2str inst.name) inst.inst;
          MAP.iter spec.inputs (fun (port:string) _ ->
              Printf.printf "-> evaluate input <%s>\n" port;
              evaluate_port inst inst_data port 
            );
          MAP.iter spec.outputs (fun (port:string) _ ->
              Printf.printf "-> evaluate output <%s>\n" port;
              evaluate_port inst inst_data port 
          )
        );
      (*Derive simpler rules from graph*)
      SMapGraphSimplifier.simplify ctx;
      (*found a trivially false clause*)
      if REF.dr config_success = false then
        None
      (*otherwise, flatten graph into buckets*)
      else
        (*TODO: perform rewriting*)
        Some ctx 

      
      

end
