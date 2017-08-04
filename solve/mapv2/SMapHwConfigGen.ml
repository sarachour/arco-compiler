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

      | SCExprIneq(map_op,me) ->
        ret (SMapCfggenCtx.connect_bins ctx (SMBMapExpr(inst,me))  (SMBIneq(inst,map_op,me)) ) true 

      | SCVarIneq(map_op,mv) ->
        ret (SMapCfggenCtx.connect_bins ctx (SMBMapVar(inst,mv))  (SMBIneq(inst,map_op,SEVar mv)) ) true 


      | SCCoverTime(n,n2) ->
        ret (SMapCfggenCtx.connect_bins ctx (SMBTimeConstant) (SMBCoverTime(n,n2))) true

      | SCCoverInterval(mrng,hrng,mexpr,hexpr) -> false

      | SCTrue -> false

      | SCFalse ->
        Printf.printf "-> found false constraint";
        (ctx.success <- false);
        false


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

  let apply_xform : cfggen_ctx -> hwcompinst option -> cfggen_xform -> unit =
    fun ctx inst_maybe xform ->
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

  let generic_rewrite : cfggen_ctx ->
    (cfggen_bin ->cfggen_bin -> cfggen_xform list) ->
    (hwcompinst -> map_cstr -> map_cstr -> cfggen_xform list) ->
    unit =
    fun ctx rewrite cstr_rewrite ->
      let rewritten = SET.make_dflt () in
      let apply xform gtag inst_maybe =
        let tag = xform.tag^" <= "^gtag in
        if SET.has rewritten (tag) == false then
          begin
            noop (SET.add rewritten tag);
            apply_xform ctx inst_maybe xform
          end
      in
      let rec _work () =
        let bin_sets = GRAPH.disjoint ctx.bins in
        let cnt = SET.size rewritten in
        List.iter (fun node_set ->
            LIST.diag_iter (SET.to_list node_set) (fun node othernode ->
                if node == othernode then () else
                  let xforms = rewrite node othernode in
                  let global_tag = Printf.sprintf "xform(%s,%s)"
                      (SMapCfggenCtx.string_of_bin node)
                      (SMapCfggenCtx.string_of_bin othernode)
                  in
                  List.iter (fun xform ->
                      apply xform global_tag None
                    ) xforms
              )
          ) bin_sets;
        let new_rewrites = (SET.size rewritten) - cnt in
        Printf.printf ("=> New Rewrites: %d\n") new_rewrites;
        flush_all();
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
          let tag = Printf.sprintf "a=a*b"
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
                      tag=tag
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
                      tag=tag
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

  let frac_pow_const : cfggen_ctx -> (cfggen_bin -> cfggen_bin -> cfggen_xform list) =
    fun ctx ->
      let rec xform : cfggen_bin -> cfggen_bin -> cfggen_xform list =
        fun node1 node2 ->
          let tag = Printf.sprintf "nnineq." in
          match node1,node2 with
          | _ -> []
      in
      xform

  let frac_op_const : cfggen_ctx -> (cfggen_bin -> cfggen_bin -> cfggen_xform list) =
    fun ctx ->
      let get_rational expr =
        let numer_terms,denom_terms = SMapExpr.to_rational expr in
        let numer_c,numer_nc = LIST.split numer_terms
            (fun x -> match x with |SENumber(_) -> true | _ -> false)
        in
        let denom_c,denom_nc = LIST.split denom_terms
            (fun x -> match x with |SENumber(_) -> true | _ -> false)
        in
        let cexpr = SEDiv(SMapExpr.product_of numer_c, SMapExpr.product_of denom_c) in
        let cvalue = match (SMapExpr.simpl cexpr) with
          | SENumber(n) -> n
          | _ -> raise (SMapHwConfigGen_error "frac_op_const: must be number")
        in
        let numer_expr = match numer_nc with
          | h::t -> (SMapExpr.product_of numer_nc) | [] -> SENumber(Integer 1) 
        in
        let denom_expr = match denom_nc with
          | h::t -> Some (SMapExpr.product_of denom_nc) | [] -> None 
        in
        cvalue, numer_expr,denom_expr
      in
      let rec xform : cfggen_bin -> cfggen_bin -> cfggen_xform list =
        fun node1 node2 ->
          let tag : string = Printf.sprintf "ineq_const"
          in
          match node1, node2 with
          | SMBMapExpr(i,expr), SMBNumber(Integer 0) ->
            let number, numer_expr,denom_expr = get_rational expr in
            (*either remove the denominator or a constant factor.*)
            if NUMBER.eq_int number 0 then
              [{
                connect=[];
                disable_eq=[(node1,node2)];
                disable=[];
                cstr=[];
                tag=tag


              }]
           (* c*n/d = 0 *)
            else if denom_expr <> None || NUMBER.eq_int number 1 = false then
              let numer_bin = SMapCfggenCtx.expr_to_bin i numer_expr in 
              [{
                connect=[(numer_bin,SMBNumber(Integer 0))];
                disable_eq=[(node1,node2)];
                disable=[];
                cstr=[];
                tag=tag
              }]
            else
              []

           (*
          | SMBMapExpr(i,expr), SMBNumber(n) ->
            let number, numer_expr,denom_expr = get_rational expr in
            if NUMBER.eq_int number 1 || NUMBER.eq_int number 0 then [] else
              let new_expr = match denom_expr with
                | Some(denom) -> SEDiv(numer_expr,denom)
                | None -> numer_expr
              in
              let new_number = NUMBER.div n number in
              [{
                connect=[(SMBMapExpr(i,new_expr),SMBNumber(new_number))];
                disable_eq=[(node1,node2)];
                disable=[];
                cstr=[];
                tag=tag
              }]
              *)

          | SMBMapExpr(i,expr), SMBIneq(j,op,e) ->
            let number, numer_expr,denom_expr = get_rational expr in
            (*case OP 0*)
            if NUMBER.eq (SMapCstr.op_const op) (Integer 0) then
              begin
                (*0*expr OP 0*)
                if NUMBER.eq_int number 0 then
                  [{
                    connect=[(SMBNumber(Integer 0), SMBIneq(i,op,SENumber(Integer 0)))];
                    disable_eq=[(node1,node2)];
                    disable=[];
                    cstr=[];
                    tag=tag

                  }]
                (*c*n/d OP 0 *)
                else if denom_expr <> None || NUMBER.eq_int number 1 = false then
                  let numer_bin = SMapCfggenCtx.expr_to_bin i numer_expr in 
                  [{
                    connect=[(numer_bin, SMBIneq(i,op,numer_expr))];
                    disable_eq=[(node1,node2)];
                    disable=[];
                    cstr=[];
                    tag=tag
                  }]
                else
                  []
              end
            else
              begin
                []
              end
              (*
                let new_expr = numer_expr in
                let new_ineq = SMapCstr.op_map op (fun n -> NUMBER.div n number) in
                [{
                  connect=[(SMBMapExpr(i,new_expr), SMBIneq(i,new_ineq,new_expr))];
                  disable_eq=[(node1,node2)];
                  disable=[];
                  cstr=[];
                  tag=tag i new_expr (SMapCstr.string_of_op new_ineq)
                }]
              *)


          | SMBIneq(_), SMBMapExpr(_) ->
            xform node2 node1

          | SMBNumber(_), SMBMapExpr(_) ->
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
          let tag = Printf.sprintf "a**n=b**n" in
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
                    tag=tag
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
          let tag = Printf.sprintf "a**n=a**m" in
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
                    tag=tag
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
      let rec do_ee_rewrite e1 e2 =
        match get_rational e1, get_rational e2 with
        | (Some(n1),Some(d1)),(Some(n2),Some(d2)) ->
          Some(SEMult(n1,d2),SEMult(n2,d1))

        | (None,Some(d1)),(Some(n2),Some(d2)) ->
          Some(d2,SEMult(n2,d1))

        | (Some(n1),None),(Some(n2),Some(d2)) ->
          Some(SEMult(n1,d2),n2)

        | (Some(n1),Some(d1)),(None,Some(d2)) ->
          Some(SEMult(n1,d2),d1)

        | (None,Some(d1)),(None,Some(d2)) ->
          Some(d2,d1)

        | (Some(n1),None),(None,Some(d2)) ->
          Some(SEMult(n1,d2),SENumber(Integer 1))

        | (Some(n1),Some(d1)),(Some(n2),None) ->
          Some(n1,SEMult(n2,d1))

        | (None,Some(d1)),(Some(n2),None) ->
          Some(SENumber(Integer 1),SEMult(n2,d1))

        | (Some(n1),None),(Some(n2),None) ->
          None
        | _ -> None
      in

      let rec xform : cfggen_bin -> cfggen_bin -> cfggen_xform list =
        fun node1 node2 ->
          let tag = Printf.sprintf "a/b=c/d"
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
                tag=tag
              }]
              
            | None, Some(denom) ->
              let num_bin = SMBNumber(Integer 1) in
              let expr_bin = SMapCfggenCtx.expr_to_bin i (SEMult(eq_term,denom)) in 
              [{
                connect=[(num_bin,expr_bin)];
                disable=[];
                cstr=[];
                disable_eq=[(node1,node2)];
                tag=tag
              }]
            | _ -> []
          in
          match node1,node2 with
          | SMBMapExpr(i,e1),SMBNumber(n) ->
            do_rewrite i e1 (SENumber n)

          | SMBNumber(_), SMBMapExpr(_) ->
            xform node2 node1

          | SMBMapExpr(i,e1), SMBMapVar(j,v) ->
            if i <> j then [] else
              do_rewrite i e1 (SEVar v)

          | SMBMapVar(_), SMBMapExpr(_) ->
            xform node2 node1

          | SMBMapExpr(i,e1), SMBMapExpr(j,e2) ->
            if i <> j then [] else
              begin
                let result= do_ee_rewrite e1 e2 in
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
                    tag=tag
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

  let collect_const_rewrite: cfggen_ctx -> (string,cfggen_bin*number) map ->
    (cfggen_bin -> cfggen_bin -> cfggen_xform list)=
    fun ctx subs ->
      
      let put_sub : hwcompinst -> map_var -> number -> bool =
        fun i v num ->
          let bin = SMBMapVar(i,v) in
          let key = SMapCfggenCtx.string_of_bin (SMBMapVar(i,v)) in
          if MAP.has subs key then false else
            begin
              MAP.put subs key (bin,num);
              true
            end
      in
      let xform : cfggen_bin -> cfggen_bin -> cfggen_xform list =
        fun node1 node2 -> match node1,node2 with
          | SMBMapVar(i,v),SMBNumber(n) ->
            if put_sub i v n then
              [{connect=[];disable=[];disable_eq=[];
                cstr=[];
                tag=Printf.sprintf "collect_const"
               }]
            else
              []

          | SMBNumber(n), SMBMapVar(i,v) ->
            if put_sub i v n then 
              [{connect=[];disable=[];disable_eq=[];
                cstr=[];
                tag=Printf.sprintf "collect_const"
               }]
            else
              []
          | _ -> []
      in
      xform

  let sub_const_rewrite: cfggen_ctx -> (string,cfggen_bin*number) map ->
    (cfggen_bin -> cfggen_bin ->cfggen_xform list) =
    fun ctx subs ->
      let get_sub : hwcompinst -> map_var -> number option =
        fun i v ->
          let key = SMapCfggenCtx.string_of_bin (SMBMapVar(i,v)) in
          OPTION.map
            (MAP.ifget subs key)
            (fun (bin,n) -> n)
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
                disable_eq=[(orig_bin,simpl_bin)];
                cstr=[];
                tag=Printf.sprintf "simplify => %s"
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

  let propagate_ineq_rewrite : cfggen_ctx ->
    (cfggen_bin -> cfggen_bin -> cfggen_xform list) =
    fun ctx ->
      let rec xform node1 node2 =
        let tag =
          Printf.sprintf "propagate_ineq"
        in
        match node1, node2 with
        | SMBIneq(i,op,e),SMBMapExpr(j,new_expr) ->
          if e = new_expr || SMapCfggenCtx.is_node_exported node2 = false then [] else
            [{
              connect=[(node2,SMBIneq(j,op,new_expr))];
              disable=[];
              disable_eq=[];
              cstr=[];
              tag=tag
            }]

        | SMBIneq(i,op,e),SMBMapVar(j,v) ->
          let new_expr = SEVar(v) in
          if e = new_expr || SMapCfggenCtx.is_node_exported node2 = false then [] else
            [{
              connect=[(node2,SMBIneq(j,op,new_expr))];
              disable=[];
              disable_eq=[];
              cstr=[];
              tag=tag
            }]

        | SMBIneq(i,op,e),SMBNumber(v) ->
          if SMapCstr.compute_op op v then
              [{
                connect=[];
                disable=[];
                disable_eq=[(node1,node2)];
                cstr=[];
                tag=tag
              }]
          else
            begin
              Printf.printf "trivially false\n";
              ctx.success <- false;
              [{
                connect=[];
                disable=[];
                disable_eq=[(node1,node2)];
                cstr=[];
                tag=tag 
              }]

            end
        | SMBNumber(_),SMBIneq(_) ->
          xform node2 node1

        | SMBMapVar(_),SMBIneq(_) ->
          xform node2 node1

        | SMBMapExpr(_),SMBIneq(_) ->
          xform node2 node1

        | SMBNumber(n),SMBNumber(n2) ->
          begin
            if NUMBER.eq n n2 = false then
              ctx.success <- false;
            [{
              connect=[];
              disable=[];
              disable_eq=[(node1,node2)];
              cstr=[];
              tag=tag;
            }]
          end

        | SMBMapVar(i1, v1),SMBMapVar(i2,v2) ->
          begin
            if i1 = i2 && v1 = v2 then
              [{
                connect=[];
                disable=[];
                disable_eq=[(node1,node2)];
                cstr=[];
                tag=tag;
              }]
            else
              []
          end

        | SMBMapExpr(i1, e1),SMBMapExpr(i2,e2) ->
          begin
            if i1 = i2 && e1 = e2 then
              [{
              connect=[];
              disable=[];
              disable_eq=[(node1,node2)];
              cstr=[];
              tag=tag;
              }]
            else
              []
          end

        | _ -> []
      in
      xform

  let time_constant_rewrite : cfggen_ctx ->
    (cfggen_bin -> cfggen_bin -> cfggen_xform list) =
    fun ctx ->
      let between inst expr m_mini m_maxi =
        match m_mini, m_maxi with
        | Some(mini),Some(maxi) ->
          [
            SMBIneq(inst,SCGTE(mini),expr);
            SMBIneq(inst,SCLTE(maxi),expr)
          ]
        | None,Some(maxi) ->
          [ 
            SMBIneq(inst,SCLTE(maxi),expr)
          ]
        | Some(mini),None ->
          [
            SMBIneq(inst,SCGTE(mini),expr);
          ]
        | _ -> []
      in
      let rec xform node1 node2 =
        let tag =
          Printf.sprintf "timecover_to_cstr"
        in
        match node1, node2 with
        | SMBCoverTime(n1,n2),SMBMapVar(i,v) ->
          let new_ineqs = between i (SEVar v) n1 n2 in
          [{
            connect=List.map (fun ineq -> (node2,ineq)) new_ineqs;
            disable=[node1];
            disable_eq=[];
            cstr=[];
            tag=tag 
          }]

        | SMBCoverTime(n1,n2),SMBMapExpr(i,e) ->
          let new_ineqs = between i (e) n1 n2 in
          [{
            connect=List.map (fun ineq -> (node2,ineq)) new_ineqs;
            disable=[node1];
            disable_eq=[];
            cstr=[];
            tag=tag 
          }]

        | SMBMapVar(_), SMBCoverTime(_) -> xform node2 node1
        | SMBMapExpr(_), SMBCoverTime(_) -> xform node2 node1
        | _ -> []
      in
      xform

  let neq_and_pos_rewrite : cfggen_ctx ->
    (cfggen_bin -> cfggen_bin -> cfggen_xform list) =
    fun ctx ->
      let rec xform node1 node2 =
        let tag  =
          Printf.sprintf "neq_and_pos"
        in
        match node1,node2 with
        | SMBIneq(i,SCGTE(n),e),SMBIneq(j,SCNEQ(n2),e2) ->
          if NUMBER.eq n n2 then
            [{
              connect=[
                (node1,SMBIneq(i,SCGT(n),e));
                (node2,SMBIneq(j,SCGT(n),e2))
              ];
              disable=[node1;node2];
              disable_eq=[];
              cstr=[];
              tag=tag 
            }]
          else
            []
        | SMBIneq(i,SCLTE(n),e),SMBIneq(j,SCNEQ(n2),e2) ->
          if NUMBER.eq n n2 then
            [{
              connect=[
                (node1,SMBIneq(i,SCLT(n),e));
                (node2,SMBIneq(j,SCLT(n),e2))
              ];
              disable=[node1;node2];
              disable_eq=[];
              cstr=[];
              tag=tag
            }]
          else
            []
        | SMBIneq(i,SCNEQ(n),e),SMBIneq(j,SCGTE(n2),e2) ->
          xform node2 node1
        | SMBIneq(i,SCNEQ(n),e),SMBIneq(j,SCLTE(n2),e2) ->
          xform node2 node1

        | _ -> []
      in
      xform

  let write_in_numerical : cfggen_ctx -> (string,cfggen_bin*number) map -> unit =
    fun ctx nmap ->
      MAP.iter nmap (fun _ (bin,num) ->
          let xform = {
            connect=[(bin,SMBNumber(num))];
            disable=[];
            disable_eq=[];
            cstr=[];
            tag="win"
          }
          in
          apply_xform ctx None xform 
        )

    
  

  let simplify : cfggen_ctx -> unit =
    fun ctx ->
      (*
      numerical_rewrite(ctx);
      simplify_expressions(ctx);
      *)
      Printf.printf("==== REWRITE =====\n");
      let numer_assign : (string,cfggen_bin*number) map = MAP.make () in
      let phase1= [
        collect_const_rewrite ctx numer_assign;
      ] in
      let phase2= [
        sub_const_rewrite ctx numer_assign;
      ] @ phase1
      in
      let phase3 = [
        (*algebra rewrite rules*)
        a_eq_ab_rewrite ctx;
        pow_base_eq_rewrite ctx;
        pow_exp_eq_rewrite ctx;
        a_over_b_eq_1_rewrite ctx;
        (*constant rewrite rules*)
        frac_pow_const ctx;
        time_constant_rewrite ctx;
        (*frac_op_const ctx;*)
        neq_and_pos_rewrite ctx;
      ] @ phase2
      in
      (*after the expressions have been generate, propagate, rewrite and solve*)
      let phase4 = [
        propagate_ineq_rewrite ctx;
      ]  
      in
      generic_rewrite ctx (merge_rewrites phase1) (merge_cstr_rewrites []);
      generic_rewrite ctx (merge_rewrites phase2) (merge_cstr_rewrites []);
      generic_rewrite ctx (merge_rewrites phase3) (merge_cstr_rewrites []);
      generic_rewrite ctx (merge_rewrites phase4) (merge_cstr_rewrites []);
      (*write back in any learned assignments after*)
      write_in_numerical ctx numer_assign;
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
      Printf.printf "=== BUILDING MAP CONFIGURATION ===\n";
      flush_all();
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
            (fun is_succ -> is_succ && ((LIST.has result.cstrs SCFalse)=false));
          let curr_cstrs = if MAP.has ctx.cstrs inst then MAP.get ctx.cstrs inst else [] in
          MAP.put ctx.cstrs inst (remaining_cstrs@curr_cstrs);
          ()
      in
      
      (*evaluate components to get results*)
      MAP.iter ctx.insts (fun (inst:hwcompinst) (inst_data:map_comp_ctx) ->
          let spec : map_comp = MAP.get tblspec.comps inst.name in
          Printf.printf "=== Component %s.%d ===\n"
            (HwLib.hwcompname2str inst.name) inst.inst;
          flush_all();
          MAP.iter spec.inputs (fun (port:string) _ ->
              Printf.printf "-> evaluate input <%s>\n" port;
              flush_all();
              evaluate_port inst inst_data port 
            );
          MAP.iter spec.outputs (fun (port:string) _ ->
              Printf.printf "-> evaluate output <%s>\n" port;
              flush_all();
              evaluate_port inst inst_data port 
          )
        );
      Printf.printf "== Simplify Graph ==\n";
      flush_all();
      (*Derive simpler rules from graph*)
      SMapGraphSimplifier.simplify ctx;
      (*found a trivially false clause*)
      if REF.dr config_success = false || ctx.success = false then
        None
      (*otherwise, flatten graph into buckets*)
      else
        (*TODO: perform rewriting*)
        Some ctx 

      
      

end
