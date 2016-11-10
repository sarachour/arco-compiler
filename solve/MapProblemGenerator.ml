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






  (*propagate wire rules for scaling factors *)
  let derive_scaling_factor (node:hwvid ast) (feedback:wireid list) (cfg:hwcompcfg)
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
          match LIST.has feedback wire with
          | true ->
            {
              scale=Integer(1);
              offset=Integer(0);
              term=node;
            }
          | false ->
            let new_node = match ConcCompLib.get_var_config cfg port with
              | Some(Integer(i)) -> Integer(i)
              | Some(Decimal(i)) -> Decimal(i)
              | Some(_) -> node
              | None -> node
            in
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
            {scale=Integer(1); offset=Integer(0);term=Decimal(value);}
          | Some(Integer value) ->
            {scale=Integer(1); offset=Integer(0);term=Integer(value);}
          | None ->
            {scale=Integer(1); offset=Integer(0);term=node;}
        end

      | Term(HNTime) ->
        {scale=Integer(1); offset=Integer(0);term=node;}
      (*no offset unless the value is resolvable as a number*)

      | OpN(Mult,args) ->
        let (scales,offsets,terms) = decompose_list args _derive_scaling_factor in
        (*if this aggregate term is zero, then*)
        if LIST.count terms (fun term -> term = Integer(0) || term = Decimal(0.)) > 0 then
          {scale=OpN(Mult,scales);offset=Integer(0);term=Integer(0);}
        else
          begin
          (*all offsets must equal zero*)
          List.iter (fun offset -> add_cstr (SVNoOffset(offset)))offsets;
          {scale=OpN(Mult,scales);offset=Integer(0);term=node;}
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
        {scale=Op2(Div,ln.scale,ld.scale);offset=Integer(0);term=node;}

      | Op1(Exp,expr) ->
        let expr = _derive_scaling_factor expr in
        add_cstr (SVNoScale(expr.scale));
        {scale=Op1(Exp,expr.offset); offset=Integer(0); term=node; }

      | Op1(Neg,expr) ->
        let expr = _derive_scaling_factor expr in
        {scale=Op1(Neg,expr.scale);offset=Op1(Neg,expr.offset);term=node;}

      | Op2(Power,base,exp) ->
        let exp = _derive_scaling_factor exp in
        let base = _derive_scaling_factor base in
        add_cstrs ([SVNoScale(base.scale);SVNoScale(exp.scale)]);
        add_cstrs ([SVNoOffset(base.offset);SVNoOffset(exp.offset)]);
        {scale=Integer(1); offset=Integer(0);term=node;}

      | Integer(0) ->
        {scale=Integer(0); offset=Integer(0);term=node;}

      | Decimal(0.) ->
        {scale=Integer(0); offset=Integer(0);term=node;}

      | Integer(i) -> 
        {scale=Integer(1); offset=Integer(0);term=node;}

      | Decimal(d) ->
        {scale=Integer(1); offset=Integer(0);term=node;}
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
                enqs [
                  SVNoScale(Term (SVScaleVar wire));
                  SVNoOffset(Term (SVOffsetVar wire));
                ]
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
                enqs [
                  SVNoScale(Term (SVScaleVar wire));
                  SVNoOffset(Term (SVOffsetVar wire));
                ]
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
      enq [SVDeclMapVar(SVSlackVar(SVMin,1.0,wire));
           SVDeclMapVar(SVSlackVar(SVMax,1.0,wire))]
    in
    let add_slack dir id expr =
      OpN(Add,[expr;Term(SVSlackVar(dir,1.0,id))])
    in
    let bound_to_number bnd = match bnd with
      | BNDNum(x) -> x
      | _ -> error "bound_to_number" "expected a finite numerical bound"
    in
    (*iterate for each math variable*)
    ConcCompLib.iter_var_cfg cfg
      (fun (port:string) (x:hwvarcfg) ->
        let wire = SlnLib.mkwire comp.name inst port in
        let mival : interval = IntervalCompute.compute_mexpr_interval tbl (uast2mast x.expr) in
        let hival : interval = IntervalCompute.compute_hwport_interval tbl comp inst cfg port in
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
        match vr_maybe with
        | Some(wire,vr) ->
          begin
            match vr.defs with
            | MDefStVar(stvar) ->
              begin
                qstvar(wire);
                let math_sample = ASTLib.number2ast stvar.sample in 
                begin
                  match wire.comp.name with
                  | HWCmOutput(_) ->
                    let ovar = HwLib.wire2hwvar tbl.env.hw wire in
                    (*get the sampling rate.*)
                    begin
                      match ovar.defs with
                      | HWDDigital(dig) ->
                        let hw_sample,_ = dig.sample in
                        let hw_sample_expr = OpN(Mult,[
                            Term(SVScaleVar(wire));
                            ASTLib.number2ast hw_sample
                          ]) in
                        q (SVLTE(hw_sample_expr,math_sample))
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
        (*iter used comps to generate coverage constraints.*)
        SolverCompLib.iter_used_comps tbl (fun inst ccomp ->
            let steps =
              try
                hwcomp_derive_scaling_factors tbl ccomp.d ccomp.inst ccomp.cfg
              with
              | IntervalLibError(e) -> REF.upd valid (fun x -> false); []
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

  
end

