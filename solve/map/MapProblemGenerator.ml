open Util

open ASTUnifyData
open ASTXUnify

open AST
open Interactive
open Globals

open HWData
open HWLib

open MathData
open MathLib

open Search
open SearchData

open SolverData
open SolverUtil

open SlnLib

open GoalLib
open SolverCompLib

open IntervalData
open IntervalLib

open StochData
open StochLib

open MapData
open MapUtil


exception MapSpecError of string

let error n m = raise (MapSpecError (n^":"^m))

let debug = print_debug 4 "prob-gen"
let dumb_cstrs_DBG = false 
  

module MapCompSpecCompressor =
struct

  let create_abs_var prob : map_abs_var =
    let id = MAP.size prob.vars in
    let obj = {
      exprs = [];
      value = None;
      members = [];
      priority = 0;
      id = id;
    } in
    noop (MAP.put prob.vars id obj);
    obj

  let create_var () : map_var_info =
    {priority=0; abs_var=(-1)}

  let create_port name port : map_port_info =
    {
      port=port;
      comp=name;
      priority=0;
      range={min=0.;max=1.};
      offset=create_var ();
      scale=create_var ();
    }

  let create_input (prob:map_comp) (name) (port) =
    noop (MAP.put prob.inps (name,port) (create_port name port));
    ()

  let create_output (prob:map_comp) (name) (port) =
    noop (MAP.put prob.outs (name,port) (create_port name port));
    ()

  type compress_partition =
    | PRTVar of map_port map_var
    | PRTExpr of map_port map_var map_expr
    | PRTConst of number

  let create_param prob parname parval =
      error "create_param" "unimpl"

  let set_var_priority prob varname prio =
    error "set_var_priority" "unimpl"

  let set_port_cover prob portname cover =
    error "set_port_cover" "unimpl"

  let set_abs_var (comp:map_comp)
      (id:int) (varname:map_port map_var) : unit =
    error "set_abs_var" "variable"

  let set_abs_expr (comp:map_comp) (id:int) (expr) =
    error "set_abs_expr" "unimpl"

  let set_abs_const (comp:map_comp) (id:int) (c:number) =
    error "set_abs_const" "unimpl"

  let compress (stmts : map_stmt list) : map_comp option =
    let prob =
      {
        vars=MAP.make();
        inps=MAP.make();
        outs=MAP.make();
        params=MAP.make()
      }
    in
    let valid = REF.mk true in
    let parts : compress_partition set queue = QUEUE.make () in
    let add_partition x1 x2 =
      let matches = QUEUE.filter parts (fun q ->
          SET.has q x1 || SET.has q x2
        ) in
      match matches with
      | [s] ->
        begin
          noop (SET.add s x1);
          noop (SET.add s x2);
          ()
        end
      | [] ->
        begin
          let s = SET.make () in
          noop (SET.add s x1);
          noop (SET.add s x2);
          noop (QUEUE.enqueue parts s);
          ()
        end
      | _ -> error "add_partition" "doesn't exist"
    in
    
    List.iter (fun (stmt:map_stmt) -> match stmt with
        | MSDeclInput(hwn,hwp) -> create_input prob hwn hwp
        | MSDeclOutput(hwn,hwp) -> create_output prob hwn hwp
        | MSDeclParam(par,s) -> create_param prob par s
        | MSSetVarPriority(v1,p) ->
          set_var_priority prob v1 p 
        | MSSetPortCover(v1,c) ->
          set_port_cover prob v1 c
        | MSVarEqualsVar(v1,v2) ->
          add_partition (PRTVar v1) (PRTVar v2)
        | MSVarEqualsConst(v1,e) ->
          add_partition (PRTVar v1) (PRTConst e)
        | MSVarEqualsExpr(v1,e) ->
          add_partition (PRTVar v1) (PRTExpr e)
        | MSExprEqualsExpr(e1,e2) ->
          add_partition (PRTExpr e1) (PRTExpr e2)
        | MSExprEqualsConst(e1,c) ->
          add_partition (PRTExpr e1) (PRTConst c)
        | MSInvalid -> REF.upd valid (fun _ -> false)
        | MSValid -> ()
      ) stmts;
    let expr_buf = MAP.make () in 
    QUEUE.iter parts (fun (equiv_set) ->
        let abs = create_abs_var prob in
        let exprs =
          SET.fold equiv_set (fun (q:compress_partition) exprs ->
            match q with
            | PRTExpr(e) ->
              e::exprs
            | PRTVar(v) ->
              ret (set_abs_var prob abs.id v) exprs 
            | PRTConst(c) ->
              begin
                let succ = set_abs_const prob abs.id c in
                REF.upd valid (fun q -> succ && q);
                exprs
              end
            ) []
        in
        noop (MAP.put expr_buf abs.id exprs);
        ()
      );
    MAP.iter expr_buf (fun id exprs ->
        List.iter (fun e ->
            set_abs_expr prob id e
          ) exprs
    );
    if REF.dr valid = false then None else
    Some prob

end

module MapCompSpecInitialSln =
struct

end

module MapCompSpecGenerator =
struct

  type map_proj = {
    scale: map_port map_var map_expr; 
    offset : map_port map_var map_expr; 
  }

  let wrap_const (x:'a map_expr) (f:number) = match x with
    | MEConst(q) -> if q <> f then MSInvalid else MSValid
    | MEVar(q) -> MSVarEqualsConst(q,f)
    | q -> MSExprEqualsConst(q,f)

  let feedback_in_terms (fdbk:string list) (lst:hwvid ast list)  =
    let rec is_term_feedback el = match el with
      | OpN(Mult,exprs) ->
        List.fold_left (fun isfdbk t -> isfdbk || is_term_feedback t) false exprs
      | Op2(Div,expr1,expr2) ->
        List.fold_left (fun isfdbk t -> isfdbk || is_term_feedback t) false [expr1;expr2]
      | Term(HNPort(HWKOutput,HCMGlobal(cmpinst),port,prop)) ->
        LIST.has fdbk port
      | _ -> false
    in
    let feedback_exprs = List.filter is_term_feedback lst in
    List.length feedback_exprs > 0

  let get_nonfeedback_terms enq (fdbk:string list) (lst:hwvid ast list) (projs:map_proj list) =
    let rec get_nonfeedback_term (expr:hwvid ast) (sc:map_proj) =
      if feedback_in_terms fdbk [expr] then
        None
      else
        Some(sc)
    in
    let nonfeedback = List.map
        (fun (x,y) -> get_nonfeedback_term x y)
        (LIST.zip lst projs )
    in
    OPTION.conc_list nonfeedback

  let derive_mapping_add enq arg_projs =
      (*create scaling constraints*)
        List.iter (fun (proj2:map_proj) ->
            List.iter (fun (proj1:map_proj) ->
                match proj1.scale,proj2.scale with
                | MEVar(a),MEVar(b) -> enq (MSVarEqualsVar(a,b))
                | MEVar(a),MEConst(b) -> enq (MSVarEqualsConst(a,b))
                | MEConst(a),MEVar(b) -> enq (MSVarEqualsConst(b,a))
                | expr,MEVar(a) -> enq (MSVarEqualsExpr(a,expr))
                | MEVar(a),expr -> enq (MSVarEqualsExpr(a,expr))
                | expr1,expr2 -> enq (MSExprEqualsExpr(expr1,expr2))
              ) arg_projs
          )  arg_projs;
        let res_offset = match arg_projs with
          | p1::rest -> List.fold_right (fun (proj:map_proj) expr ->
              MEAdd(expr,proj.offset)
          ) rest p1.offset
          | [] -> error "res_scale" "cannot offset args"
        in
        let res_scale : map_port map_var map_expr= match arg_projs with
          | p1::rest -> List.fold_right (fun curr h ->
              match h,curr.scale with
              | MEConst(_),MEVar(a) -> h
              | MEVar(_),expr -> h
              | _ -> curr.scale 
            ) rest p1.scale
          | [] -> error "res_scale" "cannot scale no args"
        in
        {scale=res_scale;offset=res_offset}
         

  let derive_mapping_sub =
    let proj = derive_mapping_add in
    proj

  let derive_mapping_problem_neg enq (arg:map_proj) : map_proj =
    {scale=arg.scale; offset=arg.offset}



  let derive_mapping_mult enq ( fdbk:string list) arg_projs arg_terms res_expr : map_proj = 
    (*if this aggregate term is zero, then*)
    (*this term goes to zero*)
    match res_expr with
      | Integer(0) ->
        begin
          let res_scale = match arg_projs with
            | h::t -> List.fold_right (fun curr rest ->
                MEMult(rest,curr.scale)
              ) t h.scale
            | [] -> error "derive_mapping_mult" "unknown"
          in
          {scale=res_scale;offset=MEConst(Integer 0)}
        end
      | _ -> 
        (*if this term contains feedback, the feedback term is the only thing scaled*)
        begin
          if feedback_in_terms fdbk arg_terms then
            begin
              let coeff_projs =
                get_nonfeedback_terms enq fdbk arg_terms arg_projs
              in
              (*ensure the scaling terms are one *)
              List.iter (fun (term:map_proj) ->
                  enq (wrap_const term.scale (Integer 1))
                ) coeff_projs
            end;
          (*all offsets must equal zero*)
          List.iter (fun (term:map_proj)->
              enq (wrap_const term.offset (Integer 0))
            ) arg_projs;
          (*scale is product.*)
          let res_scale = match arg_projs with
            | h::t ->
              List.fold_right (fun x rest -> MEMult(x.scale,rest)) t h.scale
            | [] ->
              error "res_scale" "added"
          in
          {scale=res_scale;offset=MEConst((Integer 0))}
        end





  let derive_mapping_div (enq) (numer) (denom) =
    enq (wrap_const numer.scale (Integer 1) );
    enq (wrap_const denom.offset (Integer 0) );
    let res = {
      scale=MEDiv(numer.scale,denom.scale);
      offset=MEConst((Integer 0))
    }
    in
    res

  let derive_mapping_pow_val(enq) (base) exp (expval:number) =
    enq (wrap_const base.offset (Integer 0) );
    enq (wrap_const exp.offset (Integer 0) );
    enq (wrap_const exp.scale (Integer 1) );
         {
           scale=MEPower(base.scale,expval);
           offset=MEConst((Integer 0))
         }

  let derive_mapping_pow_var (enq) (base) exp  =
    enq (wrap_const base.offset (Integer 0));
    enq (wrap_const exp.offset (Integer 0));
    enq (wrap_const exp.scale (Integer 1));
    enq (wrap_const base.scale (Integer 1));
    {scale=MEConst(Integer 1);offset=MEConst(Integer 0)}

  let derive_mapping_pow_expr (enq) (base) exp =
    enq (wrap_const base.offset (Integer 0) );
    enq (wrap_const exp.offset (Integer 0) );
    enq (wrap_const exp.scale (Integer 1) );
    enq (wrap_const base.scale (Integer 1) );
    {scale=MEConst(Integer 1); offset=MEConst(Integer 0);}


  let derive_mapping_neg (enq) arg =
    enq (wrap_const arg.scale (Integer 1) );
    error "derive_mapping_exp" "unimpl"

  let derive_mapping_exp (enq) arg =
    enq (wrap_const arg.scale (Integer 1) );
    error "derive_mapping_exp" "unimpl"
    (*
    {scale=MEConst((Integer 1));offset=MEExp(arg.offset)}
    *)

  (*propagate wire rules for scaling factors *)
  let derive_mapping_expr (node:hwvid ast) (fdbk:string list)
      (params:(string,number) map)
    : (map_stmt list)*map_proj =
    let decompose_list (args:hwvid ast list)
        (fn:hwvid ast -> map_proj*hwvid ast)
      : (map_proj list*hwvid ast list) =
      List.fold_right (fun (farg:hwvid ast)
                        ((args,terms):(map_proj list)*(hwvid ast list)) ->
          let ((arg,expr):(map_proj*hwvid ast)) = fn farg in 
          (arg::args,expr::terms)
        ) args ([],[])
    in
    let cstrs : map_stmt queue = QUEUE.make () in 
    let add_cstr x =
      noop (QUEUE.enqueue cstrs x)
    in
    let rec _derive_mapping_problem (expr:hwvid ast) : (map_proj)*hwvid ast =
      let proj,res = match node with
        | Term(HNPort(knd,HCMLocal(cmp),port,prop)) ->
          {
            scale=MEVar(MPVScale(cmp,port));
            offset=MEVar(MPVOffset(cmp,port))
          },node


        | Term(HNParam(cmp,name)) ->
          let pval = MAP.get params name in
          let constv : 'a ast= match pval with
            | Integer(i) -> Integer(i)
            | Decimal(d) -> Decimal(d)
          in
          {
            scale=MEConst((Integer 1));
            offset=MEConst((Integer 0))
          }, constv

        | Term(HNTime) ->
          error "hntime" "should not exist in prog."
          (*no offset unless the value is resolvable as a number*)

        | OpN(Mult,args) ->
          let ((arg_projs,arg_terms):(map_proj list*hwvid ast list)) =
            decompose_list args _derive_mapping_problem in
          let res_term : hwvid ast= HwLib.simplify (OpN(Mult,arg_terms)) in
          let res_proj =
            derive_mapping_mult add_cstr fdbk arg_projs arg_terms res_term
          in
          res_proj,res_term


        | OpN(Add,args) ->
          let (arg_projs,arg_terms) = decompose_list args _derive_mapping_problem in
          let res_projs =
            derive_mapping_add add_cstr arg_projs
          in
          res_projs,OpN(Add,arg_terms)


        | OpN(Sub,args) ->
          let (arg_projs,arg_terms) = decompose_list args _derive_mapping_problem in
          let res_projs =
            derive_mapping_sub add_cstr arg_projs
          in
          res_projs,OpN(Sub,arg_terms)

        | Op2(Div,num,denom) -> 
          let lnumer,numer_term = _derive_mapping_problem num in
          let ldenom,denom_term = _derive_mapping_problem denom in
          let res_projs =
            derive_mapping_div add_cstr lnumer ldenom
          in
          res_projs,Op2(Div,numer_term,denom_term)

        | Op1(Exp,expr) ->
          let arg_proj,arg_expr = _derive_mapping_problem expr in
          let res_proj = derive_mapping_exp add_cstr arg_proj in
          res_proj,(Op1(Exp,arg_expr)) 

        | Op1(Neg,expr) ->
          let arg_proj,arg_expr = _derive_mapping_problem expr in
          let res_proj = derive_mapping_neg add_cstr arg_proj in
          res_proj,Op1(Neg,arg_expr)

        | Op2(Power,Term(base),Integer(exp)) ->
          let base_proj,base_expr = _derive_mapping_problem (Term base) in
          let exp_proj,exp_expr = _derive_mapping_problem (Integer exp) in
          let res_proj :map_proj =
            derive_mapping_pow_val add_cstr
              base_proj exp_proj (Integer (exp))
          in
          res_proj,Op2(Power,exp_expr,base_expr)


        | Op2(Power,Term(base),Decimal(exp)) ->
          let base_proj,base_expr = _derive_mapping_problem (Term base) in
          let exp_proj,exp_expr = _derive_mapping_problem (Decimal exp) in
          let res_proj = derive_mapping_pow_val add_cstr
              exp_proj base_proj (Decimal (exp)) in
          res_proj,Op2(Power,exp_expr,base_expr)


        | Op2(Power,Term(base),Term(exp)) ->
          let base_proj,base_expr = _derive_mapping_problem (Term base) in
          let exp_proj,exp_expr = _derive_mapping_problem (Term exp) in
          let res_proj = derive_mapping_pow_var add_cstr exp_proj base_proj in 
          res_proj,Op2(Power,exp_expr,base_expr)



        | Op2(Power,base,exp) ->
          let base_proj,base_expr = _derive_mapping_problem base in
          let exp_proj,exp_expr = _derive_mapping_problem exp in
          let res_proj =
            {scale=MEConst(Integer 1); offset=MEConst(Integer 0)}
          in
          res_proj,Op2(Power,base_expr,exp_expr)

        | Integer(0) ->
          {scale=MEAny; offset=MEConst(Integer 0)},Integer(0)

        | Decimal(0.) ->
          {scale=MEAny; offset=MEConst(Integer 0)},Decimal(0.)

        | Integer(i) -> 
          {scale=MEConst((Integer 1)); offset=MEConst(Integer 0);},Integer(i)

        | Decimal(d) ->
          {scale=MEConst((Integer 1)); offset=MEConst(Integer 0);},Decimal(d)
        | _ -> error "derive_scaling_factor" "unhandled"
      in
      let simpl_res = HwLib.simplify res in 
      proj,simpl_res
    in
    let proj,_= _derive_mapping_problem node in
    let stmts = QUEUE.to_list cstrs in 
    QUEUE.destroy cstrs;
    stmts,proj


  let derive_mapping_variable comp params (v:hwvid hwportvar) : map_stmt list =
      let stmtq = QUEUE.make() in
      let enq x =
        noop (QUEUE.enqueue stmtq x)
      in
      let enq_all x =
        noop (QUEUE.enqueue_all stmtq x)
      in
      (*stupidly enforce linear*)
      begin
        match v.bhvr with
        | HWBAnalog(bhvr) ->
            let cstrs,linear = derive_mapping_expr bhvr.rhs [] params in
            begin
              enq_all cstrs;
              enq (MSVarEqualsExpr(MPVScale(comp,v.port),linear.scale));
              enq (MSVarEqualsExpr(MPVOffset(comp,v.port),linear.offset));
              ()
            end

          | HWBAnalogState(bhvr) ->
            let cstrs,linear = derive_mapping_expr bhvr.rhs [v.port] params in
            begin
              let icvar,_ =bhvr.ic in
              enq_all cstrs;
              enq (MSDeclInput(comp,icvar));
              enq (MSVarEqualsExpr(MPVScale(comp,v.port),linear.scale));
              enq (MSVarEqualsConst(MPVOffset(comp,v.port),Integer 0));
              enq (MSVarEqualsExpr(MPVOffset(comp,v.port),linear.offset));
              enq (MSVarEqualsVar(MPVScale(comp,v.port),
                                  MPVScale(comp,icvar)));
              enq (MSVarEqualsVar(MPVOffset(comp,v.port),
                                  MPVOffset(comp,icvar)));
              ()
            end

          | _ -> error "hw_derive_scaling_factor" "unhandled"
      end;
      let lst = QUEUE.to_list stmtq in
      QUEUE.destroy stmtq;
      lst

  let derive_mapping_comp_with_params comp params =
    let stmts = QUEUE.make () in
    let enq xs = List.iter (fun x -> noop(QUEUE.enqueue stmts x)) xs in
      (*add decls*)
    HwLib.comp_iter_ins comp (fun var ->
        enq ([  MSDeclInput(comp.name,var.port)]);
        enq ([
              MSSetPortCover((comp.name,var.port),var.defs)
            ])
    );
    (*add behavior cstrs*)
    HwLib.comp_iter_outs comp (fun outvar ->
        enq ([
            MSDeclOutput(comp.name,outvar.port);
            MSSetPortCover((comp.name,outvar.port),outvar.defs)
          ])
      );
    HwLib.comp_iter_outs comp (fun outvar ->
        let cstrlst : map_stmt list =
          derive_mapping_variable comp.name params outvar 
        in
        enq cstrlst;
      );
    let cstrs = QUEUE.to_list stmts in
    QUEUE.destroy stmts;
    (params,cstrs)

  (*derive scaling factors from the component*)
  let derive_mapping_comp tbl (comp:hwvid hwcomp)= 
    let param_combos : ((string,number) map) list =
      HwLib.all_param_combos comp
    in
    List.map
      (fun params ->
         derive_mapping_comp_with_params comp params 
      )
      param_combos
end


(*
module MapProblemGenerator =
struct



    let queue_interval_cover q wire hival mival idx (expr:unid ast) =
    let enq xs = List.iter (fun x -> noop(QUEUE.enqueue q x)) xs in
    let scale wire mval : linear_smt_id ast =
      OpN(Add,[
          OpN(Mult,[
              Term(SVLinVar(SVScaleVar(wire)));
                   Decimal(mval)
            ]);
          Term(SVLinVar(SVOffsetVar(wire)))
        ])
    in
    let decl_slack wire =
      enq [SVDeclMapVar(SVSlackVar(SVMin,1.0,wire,idx));
           SVDeclMapVar(SVSlackVar(SVMax,1.0,wire,idx))]
    in
    let add_slack dir id expr =
      OpN(Add,[expr;Term(SVSlackVar(dir,1.0,id,idx))])
    in
    let bound_to_number bnd = match bnd with
      | BNDNum(x) -> x
      | _ -> error "bound_to_number" ("expected a finite numerical bound:"^
                                      (HwLib.wireid2str wire)^"/"^(uast2str expr))
    in
    let queue_quant v (h:interval_data) =  
    if no_number_cstrs_DBG then
            ()
          else
            enq [
              SVCoverLTE([(scale wire v);Decimal(bound_to_number h.max)]);
              SVCoverGTE([(scale wire v);Decimal(bound_to_number h.min)])
            ]
    in
    match mival,hival with
      | (Quantize([v]),Interval(h)) ->
        queue_quant v h
      | (Interval(m),Interval(h)) ->
        begin
          let mmin = bound_to_number m.min and mmax = bound_to_number m.max in
          if mmin =mmax then
            queue_quant mmin h
          else
            begin
              decl_slack wire;
              enq [
                SVCoverEq([add_slack SVMin wire (scale wire (mmin));
                      Decimal(bound_to_number h.min)]);
                SVCoverEq([add_slack SVMax wire (scale wire (mmax));
                      Decimal(bound_to_number h.max)])
              ]
            end
        end
      | (Quantize([v]),MixedInterval(_)) ->
        error "compute_cover" "quantize-mixed-interval"
      | (Interval(ival),MixedInterval(_)) ->
        error "compute_cover" "interval-mixed-interval"
      | (Quantize(_),Quantize(_)) ->
        error "compute_cover" "quantize-quantize"
      | (IntervalUnknown(_),_) ->
        error "compute_cover" "unknown interval"
      | (_,IntervalUnknown(_)) ->
        error "compute_cover" "unknown interval"

      | _ -> error "compute cover" "unsupported"

  (*derive scaling factors from the component*)
  let hwcomp_derive_scaling_factors tbl (comp:hwvid hwcomp) inst (cfg:hwcompcfg) = 
    let stmts = QUEUE.make () in
    let enq xs = List.iter (fun x -> noop(QUEUE.enqueue stmts x)) xs in
    let decl_mapvar (n:wireid) =
      enq [
        SVDeclMapVar(SVLinVar(SVScaleVar(n)));
        SVDeclMapVar(SVLinVar(SVOffsetVar(n)))
      ]
    in
    (*add decls*)
    HwLib.comp_iter_vars comp (fun var ->
        let wire = SlnLib.mkwire comp.name inst var.port in 
        noop (decl_mapvar wire)
    );
    (*add behavior cstrs*)
    HwLib.comp_iter_outs comp (fun outvar ->
        let cstrlst : linear_stmt list =
          hwvar_derive_scaling_factors {name=comp.name;inst=inst} cfg outvar 
        in
        enq cstrlst;
        ()
      );
    
    (*iterate for each math variable*)
    ConcCompLib.iter_var_cfg cfg
      (fun (port:string) (x:hwvarcfg) ->
         let hwport = HwLib.getvar tbl.env.hw comp.name port in 
         let wire = SlnLib.mkwire comp.name inst port in
         (*
         let mival : interval = IntervalCompute.compute_mexpr_interval tbl (uast2mast x.expr) in
         let hival : interval = IntervalCompute.compute_hwport_interval tbl comp inst cfg port in
         queue_interval_cover stmts wire hival mival 1 x.expr
           *)
           begin
           match hwport.bhvr with
           | HWBAnalog(bhvr) ->
             let mival : interval = IntervalCompute.compute_mexpr_interval tbl (uast2mast x.expr) in
             let hival : interval = IntervalCompute.compute_hwport_interval tbl comp inst cfg port in
             queue_interval_cover stmts wire hival mival 1 x.expr

           | HWBAnalogState(bhvr) ->
             let mival : interval = IntervalCompute.compute_mexpr_interval_stvar tbl (uast2mast x.expr) in
             let mivalderiv : interval = IntervalCompute.compute_mexpr_interval_deriv tbl (uast2mast x.expr) in
             let hival : interval = IntervalCompute.compute_stvar_hwport_interval tbl comp inst cfg port in
             let hivalderiv : interval = IntervalCompute.compute_deriv_hwport_interval tbl comp inst cfg port in
             let icport,_ = bhvr.ic in
             let icwire = SlnLib.mkwire comp.name inst icport  in
             queue_interval_cover stmts wire hival mival 1 x.expr;
             queue_interval_cover stmts wire hivalderiv mivalderiv 2 x.expr 

           | HWBDigital(_) ->
             let mival : interval = IntervalCompute.compute_mexpr_interval tbl (uast2mast x.expr) in
             let hival : interval = IntervalCompute.compute_hwport_interval tbl comp inst cfg port in
             queue_interval_cover stmts wire hival mival 1 x.expr

           | HWBInput ->
             let mival : interval = IntervalCompute.compute_mexpr_interval tbl (uast2mast x.expr) in
             let hival : interval = IntervalCompute.compute_hwport_interval tbl comp inst cfg port in
             queue_interval_cover stmts wire hival mival 1 x.expr
           | _ -> error "hwcomp_derive_scaling_factors" "?"
         end
      )
      (fun (param:string) (x:number) -> ());
    let cstrs = QUEUE.to_list stmts in
    QUEUE.destroy stmts;
    cstrs

  let hwconn_derive_scaling_cstrs (tbl:gltbl) =
    let cstrq = QUEUE.make () in
    let q x = noop (QUEUE.enqueue cstrq x) in
    SlnLib.iter_conns tbl.sln_ctx (fun src dst ->
        q (SVEquals([(Term(SVScaleVar(src)));(Term(SVScaleVar(dst)))]));
        q (SVEquals([Term(SVOffsetVar(src));Term(SVOffsetVar(dst))]));
        ()
      );
    let cstrs = QUEUE.to_list cstrq in
    QUEUE.destroy(cstrq);
    cstrs

  (*
    for each generated statevar def, ensure that the state variable we mapped to
     has the same speed. Also ensure the speed combined with any sort of output measurement
     for that property has a period less than or equal to the sampling rate
  *)
  let hwgen_derive_speed_cstrs (tbl:gltbl) =
    let cstrq = QUEUE.make () in
    let stvars = QUEUE.make () in
    let q x = noop (QUEUE.enqueue cstrq x) in
    let qstvar x = noop (QUEUE.enqueue stvars x) in
    (*derive the speed equivalence relation*)
    SlnLib.iter_generates tbl.sln_ctx (fun (x:ulabel) (routes) ->
        let vr_maybe = match x with
          | MOutLabel(v)-> Some (v.wire,MathLib.getvar tbl.env.math v.var)
          | MLocalLabel(v)->Some (v.wire,MathLib.getvar tbl.env.math v.var)
          | _ -> None
        in
        let hwtime2simtime wire time =
          OpN(Mult,[Term(SVScaleVar(wire));
                            ASTLib.number2ast time
                    ])
        in
        let sampletime2simtime wire time =
          Op2(Div, ASTLib.number2ast time, Term(SVScaleVar(wire)))
        in
        match vr_maybe with
        | Some(wire,vr) ->
          begin
            match vr.defs with
            | MDefVar(vr) ->
              begin
                q (SVNeq(
                      Decimal(1.),Term(SVScaleVar(wire))
                ))

              end
            | MDefStVar(stvar) ->
              begin
                qstvar(wire);
                (*sampling rate in simulation time*)
                let math_sample = ASTLib.number2ast stvar.sample in
                (*speed in hardware time*)
                let hw_speed = ASTLib.number2ast stvar.speed in 
                begin
                  match wire.comp.name with
                  | HWCmOutput(_) ->
                    let ovar = HwLib.wire2hwvar tbl.env.hw wire in
                    (*get the sampling rate.*)
                    begin
                      match ovar.defs with
                      | HWDDigital(dig) ->
                        let hw_sample,_ = dig.sample in
                        (*the scaled realtime variable cannot exceed math sampling*)
                        let hw_sample_expr = sampletime2simtime wire hw_sample in
                        let hw_wallclock_time = hwtime2simtime wire (Integer 1)  in
                        q (SVLTE(hw_sample_expr,math_sample));
                        q (SVLTE(hw_wallclock_time,hw_speed));
                        q (SVNeq(
                            Decimal(1.),Term(SVScaleVar(wire))
                          ))
                      | _ ->
                        error "hwconn_derive_speed_constraints" "cannot derive speed of analog port"
                    end
                  | _ -> ()
                end
              
              end
            | _ -> ()
          end
        | None -> ()
   );
  let args = QUEUE.map stvars (fun stvar -> Term(SVScaleVar(stvar))) in
  q (SVEquals(args));
  let cstrs = QUEUE.to_list cstrq in
  QUEUE.destroy(cstrq);
  cstrs

  (*given the scaling factor, scale up the noise + noise propagation*)
  let hwgen_derive_noise_cstrs (tbl:gltbl) =
    []
                                            
  

  let generate_problem (tbl:gltbl) =
    let stmtq = QUEUE.make () in
    let valid = REF.mk true in 
    let enq stmts = List.iter (fun st -> noop (QUEUE.enqueue stmtq st)) stmts in
    try 
      (*iter used comps to generate coverage constraints.*)
      SolverCompLib.iter_used_comps tbl (fun inst ccomp ->
          let steps =
            try
              hwcomp_derive_scaling_factors tbl ccomp.d ccomp.inst ccomp.cfg
            with
            | IntervalLibError(e) ->
              begin
                warn "map_problem_generator.interval_lib" e;
                REF.upd valid (fun x -> false); []
              end
          in
          enq (steps)
        );
      (*derive constraints from connections made by the solution*)
      enq (hwconn_derive_scaling_cstrs tbl);
      (*derive constraints on the uniformity of the speed*)
      enq (hwgen_derive_speed_cstrs tbl);
      (*derive constraints that ensure the noise is minimized*)
      enq (hwgen_derive_noise_cstrs tbl);
      if REF.dr valid then
        let stmts = QUEUE.to_list stmtq in
        QUEUE.destroy stmtq;
        Some(stmts)
      else
        None
    with
    | MapProblemGeneratorError(e) ->
      warn "map_problem_generator" e;
      None
  
end

*)
