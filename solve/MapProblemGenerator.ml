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
open MapIntervalCompute
open MapNoiseCompute


exception MapProblemGeneratorError of string

let error n m = raise (MapProblemGeneratorError (n^":"^m))

let debug = print_debug 4 "prob-gen"
let dumb_cstrs_DBG = false 
  

(*disable this if you aren't getting anything*)
let no_number_cstrs_DBG = false 



module MapProblemGenerator =
struct





  let feedback_in_terms (fdbk:wireid list) (lst:hwvid ast list)  =
    let rec is_term_feedback el = match el with
      | OpN(Mult,exprs) ->
        List.fold_left (fun isfdbk t -> isfdbk || is_term_feedback t) false exprs
      | Op2(Div,expr1,expr2) ->
        List.fold_left (fun isfdbk t -> isfdbk || is_term_feedback t) false [expr1;expr2]
      | Term(HNPort(HWKOutput,HCMGlobal(cmpinst),port,prop)) ->
        let w = HwLib.port2wire cmpinst.name cmpinst.inst port in
        LIST.has fdbk w
      | _ -> false
    in
    let feedback_exprs = List.filter is_term_feedback lst in
    List.length feedback_exprs > 0

  let get_nonfeedback_terms fdbk (lst:hwvid ast list) (scales:linear_id ast list) =
    let rec get_nonfeedback_term (expr:hwvid ast) (sc:linear_id ast) =
      if feedback_in_terms fdbk [expr] then
        None
      else
        Some(sc)
    in
    let nonfeedback = List.map (fun (x,y) -> get_nonfeedback_term x y) (LIST.zip lst scales) in
    OPTION.conc_list nonfeedback


  (*propagate wire rules for scaling factors *)
  let derive_scaling_factor (node:hwvid ast) (fdbk:wireid list) (cfg:hwcompcfg)
    : (linear_stmt list)*linear_mapping =
    let decompose_list (args:hwvid ast list) (fn:hwvid ast -> linear_mapping)  =
      List.fold_right (fun farg (scales,offsets,terms) ->
          let arg = fn farg in 
          (arg.scale::scales,arg.offset::offsets,arg.term::terms)
        ) args ([],[],[])
    in
    let cstrs : linear_stmt queue = QUEUE.make () in 
    let add_cstr x =
      noop (QUEUE.enqueue cstrs x)
    in
    let add_cstrs x = noop (QUEUE.enqueue_all cstrs x) in
    let rec _derive_scaling_factor (node) : (linear_mapping) =
      match node with
      | Term(HNPort(knd,HCMGlobal(cmp),port,prop)) ->
        let wire = SlnLib.mkwire cmp.name cmp.inst port in
        begin
            {
              scale=Term(SVScaleVar(wire));
              offset=Term(SVOffsetVar(wire));
              term=node;
            }
        end
         
      | Term(HNParam(cmp,name)) ->
        begin
          match ConcCompLib.get_param_config cfg name with
          | Some(Decimal value) ->
            {scale=Decimal(1.); offset=Decimal(0.);term=Decimal(value);}
          | Some(Integer value) ->
            {scale=Decimal(1.); offset=Decimal(0.);term=Decimal(float_of_int value);}
          | None ->
            {scale=Decimal(1.); offset=Decimal(0.);term=node;}
        end

      | Term(HNTime) ->
        {scale=Decimal(1.); offset=Decimal(0.);term=node;}
      (*no offset unless the value is resolvable as a number*)

      | OpN(Mult,args) ->
        let (scales,offsets,terms) = decompose_list args _derive_scaling_factor in
        (*if this aggregate term is zero, then*)
        if LIST.count terms (fun term -> term = Integer(0) || term = Decimal(0.)) > 0 then
          {scale=OpN(Mult,scales);offset=Decimal(0.);term=Decimal(0.);}
        else
          begin
            (*if this term contains feedback, the feedback term is the only thing scaled*)
            if feedback_in_terms fdbk terms then
              begin
                let terms = get_nonfeedback_terms fdbk terms scales in
                List.iter (fun term -> add_cstr (SVNoScale(term))) terms
              end;
            (*all offsets must equal zero*)
            List.iter (fun offset -> add_cstr (SVNoOffset(offset))) offsets;
            {scale=OpN(Mult,scales);offset=Decimal(0.);term=node;}
          end

      | OpN(Add,args) ->
        let (scales,offsets,terms) = decompose_list args _derive_scaling_factor in
        add_cstr (SVEquals(scales));
        {scale=List.nth scales 0; offset=OpN(Add,offsets); term=node;
        }
        
      | OpN(Sub,args) ->
        let (scales,offsets,terms) = decompose_list args _derive_scaling_factor in
        add_cstr (SVEquals(scales));
        {scale=List.nth scales 0;offset=OpN(Sub,offsets);term=node;}
        
      | Op2(Div,num,denom) ->
        let ln = _derive_scaling_factor num in
        let ld = _derive_scaling_factor denom in
        (*all offsets must equal zero*)
        add_cstrs ([SVNoOffset(ln.offset);SVNoOffset(ld.offset)]);
        {scale=Op2(Div,ln.scale,ld.scale);offset=Decimal(0.);term=node;}

      | Op1(Exp,expr) ->
        let expr = _derive_scaling_factor expr in
        add_cstr (SVNoScale(expr.scale));
        {scale=Op1(Exp,expr.offset); offset=Decimal(0.); term=node; }

      | Op1(Neg,expr) ->
        let expr = _derive_scaling_factor expr in
        {scale=Op1(Neg,expr.scale);offset=Op1(Neg,expr.offset);term=node;}

      | Op2(Power,Term(x),Integer(i)) ->
        let exp = Integer(i) and base = Term(x) in
        let exp = _derive_scaling_factor exp in
        let base = _derive_scaling_factor base in
        add_cstrs ([SVNoOffset(base.offset);SVNoOffset(exp.offset)]);
        add_cstrs ([SVNoScale(exp.scale)]);
        {scale=Op2(Power,exp.scale,Integer(i));
        offset=Decimal(0.);term=node;}

      | Op2(Power,Term(x),Decimal(d)) ->
        let exp = Decimal(d) and base = Term(x) in
        let exp = _derive_scaling_factor exp in
        let base = _derive_scaling_factor base in
        add_cstrs ([SVNoOffset(base.offset);SVNoOffset(exp.offset)]);
        add_cstrs ([SVNoScale(exp.scale)]);
        {scale=Op2(Power,exp.scale,Decimal(d));
        offset=Decimal(0.);term=node;}

      | Op2(Power,Term(x),Term(expn)) ->
        let value = match expn with
          | HNPort(HWKInput,_,name,_) ->
              begin
                match ConcCompLib.get_var_config cfg name with
                    | Some(Integer(i)) -> Some(float_of_int i)
                    | Some(Decimal(i)) -> Some(i)
                    | _ -> None
              end
          | HNParam(_,name) ->
              begin
                match (ConcCompLib.get_param_config cfg name) with
                | Some(i) -> Some(float_of_number i)
                | _ -> None
              end
          | _ -> None
        in
          begin
            match value with
            |Some(v) ->
                let exp = _derive_scaling_factor (Term x) in
                let base = _derive_scaling_factor (Term expn) in
                add_cstrs ([SVNoOffset(base.offset);SVNoOffset(exp.offset)]);
                {scale=Op2(Power,base.scale,Decimal(v)); offset=Decimal(0.);term=node;}

            |None ->
              begin
                let exp = _derive_scaling_factor (Term x) in
                let base = _derive_scaling_factor (Term expn) in
                add_cstrs ([SVNoScale(base.scale);SVNoScale(exp.scale)]);
                add_cstrs ([SVNoOffset(base.offset);SVNoOffset(exp.offset)]);
                {scale=Decimal(1.); offset=Decimal(0.);term=node;}
              end
          end


      | Op2(Power,base,exp) ->
        let exp = _derive_scaling_factor exp in
        let base = _derive_scaling_factor base in
        add_cstrs ([SVNoScale(base.scale);SVNoScale(exp.scale)]);
        add_cstrs ([SVNoOffset(base.offset);SVNoOffset(exp.offset)]);
        {scale=Decimal(1.); offset=Decimal(0.);term=node;}

      | Integer(0) ->
        {scale=Decimal(0.); offset=Decimal(0.);term=node;}

      | Decimal(0.) ->
        {scale=Decimal(0.); offset=Decimal(0.);term=node;}

      | Integer(i) -> 
        {scale=Decimal(1.); offset=Decimal(0.);term=node;}

      | Decimal(d) ->
        {scale=Decimal(1.); offset=Decimal(0.);term=node;}
      | _ -> error "derive_scaling_factor" "unhandled"
    in
    let scaling = _derive_scaling_factor node in
    let stmts = QUEUE.to_list cstrs in 
    QUEUE.destroy cstrs;
    stmts,scaling

  let hwvar_derive_scaling_factors (comp:hwcompinst) cfg (v:hwvid hwportvar) : linear_stmt list =
      let wire = SlnLib.mkwire comp.name comp.inst v.port in
      let stmtq = QUEUE.make() in
      let enq x =
        debug ("+ hwvar "^(MapUtil.linearstmt2str x));
        noop (QUEUE.enqueue stmtq x)
      in
      let enqs x = List.iter enq x in
      (*stupidly enforce linear*)
      begin
        match v.bhvr with
          | HWBAnalog(bhvr) ->
            let cstrs,linear = derive_scaling_factor bhvr.rhs [] cfg in
            begin
              if dumb_cstrs_DBG then
               () 
              else
                enqs cstrs;
            end;
            enq (SVEquals([Term(SVScaleVar(wire));linear.scale]));
            enq (SVEquals([Term(SVOffsetVar(wire));linear.offset]));
            ()
          | HWBAnalogState(bhvr) ->
            let icport,_ = bhvr.ic in 
            let cstrs,linear = derive_scaling_factor bhvr.rhs [wire] cfg in
            let icwire = SlnLib.mkwire comp.name comp.inst icport in
            begin
              if dumb_cstrs_DBG then
                ()
              else
                enqs cstrs;
            end;
            enq (SVEquals([Term(SVScaleVar(wire));linear.scale]));
            enq (SVNoOffset(Term (SVOffsetVar(wire))));
            enq (SVNoOffset(linear.offset));
            (*initial condition constraints*)
            enq (SVEquals([Term(SVScaleVar(icwire));linear.scale]));
            enq (SVEquals([Term(SVOffsetVar(icwire));linear.offset])); 
            ()

          | _ -> error "hw_derive_scaling_factor" "unhandled"
      end;
      let lst = QUEUE.to_list stmtq in
      QUEUE.destroy stmtq;
      lst

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
         let mival : interval = IntervalCompute.compute_mexpr_interval tbl (uast2mast x.expr) in
         let hival : interval = IntervalCompute.compute_hwport_interval tbl comp inst cfg port in
         queue_interval_cover stmts wire hival mival 1 x.expr
           
         (*
           begin
           match hwport.bhvr with
           | HWBAnalog(bhvr) ->
             let mival : interval = IntervalCompute.compute_mexpr_interval tbl (uast2mast x.expr) in
             let hival : interval = IntervalCompute.compute_hwport_interval tbl comp inst cfg port in
             queue_interval_cover stmts wire hival mival 1

           | HWBAnalogState(bhvr) ->
             let mival : interval = IntervalCompute.compute_mexpr_interval tbl (uast2mast x.expr) in
             let hival : interval = IntervalCompute.compute_hwport_interval tbl comp inst cfg port in
             let hivalderiv : interval = IntervalCompute.compute_deriv_hwport_interval tbl comp inst cfg port in
             queue_interval_cover stmts wire hival mival 1;
             queue_interval_cover stmts wire hivalderiv mival 2

           | HWBDigital(_) ->
             let mival : interval = IntervalCompute.compute_mexpr_interval tbl (uast2mast x.expr) in
             let hival : interval = IntervalCompute.compute_hwport_interval tbl comp inst cfg port in
             queue_interval_cover stmts wire hival mival 1

           | HWBInput ->
             let mival : interval = IntervalCompute.compute_mexpr_interval tbl (uast2mast x.expr) in
             let hival : interval = IntervalCompute.compute_hwport_interval tbl comp inst cfg port in
             queue_interval_cover stmts wire hival mival 1
           | _ -> error "hwcomp_derive_scaling_factors" "?"
         end
        *)
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
          OpN(Mult,[Op2(Div,Decimal(1.),Term(SVScaleVar(wire)));
                            ASTLib.number2ast time
                    ])
        in
        match vr_maybe with
        | Some(wire,vr) ->
          begin
            match vr.defs with
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
                        let hw_sample_expr = hwtime2simtime wire hw_sample in
                        let hw_wallclock_time = hwtime2simtime wire (Integer 1)  in
                        q (SVLTE(hw_sample_expr,math_sample));
                        q (SVLTE(hw_wallclock_time,hw_speed))
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

