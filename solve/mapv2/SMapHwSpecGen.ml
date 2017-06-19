open HWData;;
open HWLib;;
open SMapData;;
open Util;;
open SolverData;;
open AST;;
open IntervalData;;
open IntervalLib;;

exception SMapCompCtx_error of string

module SMapCompCtx =
struct

  let get_port : map_comp_ctx -> string -> map_loc_val =
    fun ctx port ->
      if MAP.has ctx.ports port then
        MAP.get ctx.ports port
      else
        (*if configuration doesn't have a port mapped,
        give it the most flexible value since it's a don't care.
        The value can be scaled by anything and offset by anything
        *)
        SVZero


  let get_param : map_comp_ctx -> string -> number =
    fun ctx param ->
      if MAP.has ctx.params param then
        MAP.get ctx.params param
      else
        raise (SMapCompCtx_error "does not have param")

end


exception SMapHwSpec_error of string
module SMapHwSpec =
struct
  let get_comp : map_hw_spec -> hwcompname -> map_comp =
    fun spec compname ->
      let comp = MAP.get spec.comps compname in
      comp

  let get_port : map_hw_spec -> hwcompname -> string -> map_cstr_gen =
    fun spec compname port->
      let comp : map_comp = get_comp spec compname in
      if MAP.has comp.inputs port then
        MAP.get comp.inputs port
      else if MAP.has comp.outputs port then
        MAP.get comp.outputs port
      else
        raise (SMapHwSpec_error "port DNE")

  let rec evaluate : map_ctx -> map_params -> map_cstr_gen -> map_result = 
    fun ctx pars gen -> match gen with
      | SCLateBind(fxn,args) ->
        let r_args =
          List.map (fun x -> evaluate ctx pars x) args
        in
        fxn ctx r_args pars
      | SCStaticBind(res) -> res
end

exception SMapHwSpecLateBind_error of string;;

module SMapHwSpecLateBind =
struct
let freevar_idx = REF.mk 0;;

  let get_freevar () =
    let v = SMFreeVar(REF.dr freevar_idx) in
    REF.upd freevar_idx (fun x -> x + 1);
    v

  let mkresult : map_expr -> map_expr -> map_loc_val -> map_cstr list -> map_result =
    fun scale offset value cstrs ->
    {cstrs=cstrs;scale=scale;offset=offset;value}


  let rec mk_not_equal : map_expr -> number -> map_cstr =
    fun a n ->
      match a with
      | SENumber(m) -> if n = m then SCFalse else SCTrue
      | SEVar(a) -> SCVarNeqConst(a,n)
      | expr -> SCExprNeqConst(expr,n)

  let rec mk_equal : map_expr -> map_expr -> map_cstr =
    fun mapexpr1 mapexpr2 ->
      match mapexpr1,mapexpr2 with
      | SENumber(a), SENumber(b) ->
        if a = b then SCTrue else SCFalse
      | SEVar(a), SEVar(b) ->
        if a = b then SCTrue else SCVarEqVar(a,b)
      | SEVar(a), SENumber(n) ->
        SCVarEqConst(a,n)
      | SENumber(n), SEVar(a) ->
        mk_equal mapexpr2 mapexpr1
      | SEVar(a), expr ->
        SCVarEqExpr(a,expr)
      | expr, SEVar(a) ->
        mk_equal mapexpr2 mapexpr1
      | expr1, SENumber(n) ->
        SCExprEqConst(expr1,n)
      | SENumber(n), expr1 ->
        mk_equal mapexpr2 mapexpr1
      | expr1, expr2 -> 
        SCExprEqExpr(expr1,expr2)

  let mk_equal0 : map_expr -> map_cstr =
    fun x -> mk_equal x (SENumber (Integer 0))

  let mk_not_equal0 : map_expr -> map_cstr =
    fun x -> mk_not_equal x ((Integer 0))

  let mk_equal1 : map_expr -> map_cstr =
    fun x -> mk_equal x (SENumber (Integer 0))

  let mk_not_equal1 : map_expr -> map_cstr =
    fun x -> mk_not_equal x ((Integer 0))

  (*process the bounds over the variable.*)
  let port_val_to_port_cstrs: string -> map_loc_val -> map_loc_val*(map_cstr list) =
    fun port_name port_val ->
      match port_val with
      | SVSymbol(interval) ->
        if IntervalLib.is_value interval then
          begin
            if IntervalLib.is_zero interval then
              SVZero,[]
            else
              (SVNumber (Decimal(IntervalLib.get_value interval))),
                [mk_not_equal0 (SEVar(SMScale(port_name)))]
          end
        else
          SVSymbol(interval),
                [mk_not_equal0 (SEVar(SMScale(port_name)))]
      | SVNumber(n) ->
        if NUMBER.is_zero n then
          SVZero,[]
        else
          (SVNumber(n)),
                [mk_not_equal0 (SEVar(SMScale(port_name)))]
      | SVZero ->
        SVZero, []

  let late_bind_input: string -> map_ctx -> map_result=
    fun port_name ctx ->
      let port_val = SMapCompCtx.get_port ctx port_name in
      let new_port_val, port_cstrs =
        port_val_to_port_cstrs port_name port_val
      in
      mkresult
        (SEVar(SMScale(port_name)))
        (SEVar(SMOffset(port_name)))
        new_port_val
        port_cstrs



  let late_bind_output: string -> map_ctx -> map_result=
      fun port_name ctx ->
        let port_val = SMapCompCtx.get_port ctx port_name in
        let new_port_val, port_cstrs =
          port_val_to_port_cstrs port_name port_val
        in
        mkresult
        (SEVar(SMScale(port_name)))
        (SEVar(SMOffset(port_name)))
        new_port_val
        port_cstrs


  let late_bind_param: string -> map_ctx -> map_result=
    fun param_name ctx ->
      let param_val : number = SMapCompCtx.get_param ctx param_name in
      let new_port_val, scale_var  =
        if NUMBER.is_zero param_val then
          SVZero, (SEVar (get_freevar()))
        else
          SVNumber(param_val), (SENumber(Integer 1))
      in
      mkresult
        scale_var 
        (SENumber(Integer 0))
        new_port_val
        []

  let rec late_bind_mult2 : map_ctx -> map_result -> map_result -> map_result =
    fun ctx res1 res2 ->
      match res1.value, res2.value with
      | SVZero,SVZero ->
        let scale = SEVar (get_freevar()) in 
        let offset = SEMult(res1.offset, res2.offset) in
        let value = SVZero in
        mkresult scale offset value []
      | SVZero, SVNumber(n) ->
        let scale = SEVar (get_freevar()) in
        let offset =
          SEAdd(SEMult(SEMult(res1.scale,SENumber(n)),res2.offset),
                SEMult(res1.offset,res2.offset))
        in
        let value = SVZero in
        mkresult scale offset value []

      | SVNumber(n),SVZero ->
        late_bind_mult2 ctx res2 res1

      | SVZero,SVSymbol(ival) ->
        let scale = SEVar (SMFreeVar(0)) in
        let offset = SEMult(res1.offset,res2.offset) in
        let value = SVZero in
        mkresult scale offset value []

      | SVSymbol(ival), SVZero ->
        late_bind_mult2 ctx res2 res1

      | SVNumber(n),SVNumber(m)->
        let scale = SEMult(res1.scale,res2.scale) in
        let offset =
          SEAdd(SEMult(SEMult(res1.scale,SENumber(n)),res2.offset),
          SEAdd(SEMult(SEMult(res2.scale,SENumber(m)),res1.offset),
                SEMult(res1.offset,res2.offset)))
        in
        let value = SVNumber(NUMBER.mult n m) in
        mkresult scale offset value []

      | SVSymbol(a), SVNumber(m) ->
        let scale =
          SEAdd(
            SEMult(res1.scale,res2.scale),
            SEDiv(SEMult(res1.scale,res2.offset),SENumber(m))
          )
        in
        let offset =
          SEAdd(
            SEMult(SEMult(res2.scale,res1.offset),SENumber(m)),
            SEMult(res1.offset,res2.offset)
          )
        in
        let value = SVSymbol(IntervalLib.mult a (IntervalLib.num m)) in
        let cstrs = [] in
        mkresult scale offset value cstrs

      | SVNumber(m), SVSymbol(a) ->
        late_bind_mult2 ctx res2 res1

      | SVSymbol(s1), SVSymbol(s2) ->
        let scale = SEMult(res1.scale,res2.scale) in
        let offset = SENumber(Integer 0) in
        let value = SVSymbol (IntervalLib.mult s1 s2) in
        let cstrs = [
          mk_equal0 (res1.offset) ;
          mk_equal0 (res2.offset) ;
        ]
        in
        mkresult scale offset value cstrs 
      | _ ->
        raise (SMapHwSpecLateBind_error "mult.unimpl case")

  let late_bind_div (ctx:map_ctx) (res1:map_result) (res2:map_result) : map_result =
    raise (SMapHwSpecLateBind_error "unimpl:process_ast div")

  let late_bind_pow (ctx:map_ctx)(res1:map_result) (res2:map_result) : map_result =
    raise (SMapHwSpecLateBind_error "unimpl:process_ast div")

  let rec late_bind_add2 (ctx:map_ctx)(res1:map_result) (res2:map_result) : map_result =
    match res1.value, res2.value with
    | SVZero,SVZero ->
      let scale = SEVar(get_freevar()) in
      let offset = SEAdd(res1.offset, res2.offset) in
      let value = SVZero in
      let cstrs = [] in
      mkresult scale offset value cstrs
    | SVZero, SVNumber(n) ->
      let scale = res2.scale in
      let offset = SEAdd(res1.offset, res2.offset) in
      let value = SVNumber(n) in
      let cstrs = [] in
      mkresult scale offset value cstrs
    | SVNumber(_), SVZero ->
      late_bind_add2 ctx res2 res1
    | SVNumber(n), SVNumber(m) ->
      let scale = res1.scale in
      let offset = SEAdd(res1.offset, res2.offset) in
      let value = SVNumber(NUMBER.add n m) in
      let cstrs = [mk_equal res1.scale res2.scale] in
      mkresult scale offset value cstrs
    | SVSymbol(a), SVZero ->
      let scale = res1.scale in
      let offset = SEAdd(res1.offset, res2.offset) in
      let value = SVSymbol(a) in
      mkresult scale offset value []
    | SVZero, SVSymbol(_) ->
       late_bind_add2 ctx res2 res1 
    | SVSymbol(a), SVNumber(m) ->
      let scale = res1.scale in
      let offset = SEAdd(res1.offset, res2.offset) in
      let value = SVSymbol(IntervalLib.add a (IntervalLib.num m)) in
      let cstrs = [mk_equal res1.scale res2.scale] in
      mkresult scale offset value []
    | SVNumber(_), SVSymbol(_) ->
      late_bind_add2 ctx res2 res1
    | SVSymbol(a), SVSymbol(b) ->
      let scale = res1.scale in
      let offset = SEAdd(res1.offset, res2.offset) in
      let value = SVSymbol(IntervalLib.add a b) in
      let cstrs = [mk_equal res1.scale res2.scale] in
      mkresult scale offset value []


  let late_bind_sub2 (ctx:map_ctx)(res1:map_result) (res2:map_result) : map_result =
    raise (SMapHwSpecLateBind_error "unimpl:process_ast sub2")

  let late_bind_neg1 (ctx:map_ctx) (res1:map_result) : map_result = 
    raise (SMapHwSpecLateBind_error "unimpl:process_ast neg")

  let late_bind_exp (ctx:map_ctx) (res1:map_result) : map_result =
    raise (SMapHwSpecLateBind_error "unimpl:process_ast neg")

  
  let late_bind_deriv (ctx:map_ctx) (res1:map_result) (res2:map_result) : map_result =
    raise (SMapHwSpecLateBind_error "unimpl:late bind deriv.")

  let late_bind_within_interval : interval -> string -> bool -> map_ctx -> map_result -> map_result =
    fun port_interval port_name is_deriv ctx res  ->
      raise (SMapHwSpecLateBind_error "unimpl:late bind within interval.")

  
  let late_bind_exp : map_ctx -> map_result -> map_result =
    fun port_name ctx ->
        raise (SMapHwSpecLateBind_error "unimpl:late bind exp.")

  let late_bind_neg : map_ctx -> map_result -> map_result =
    fun port_name ctx ->
        raise (SMapHwSpecLateBind_error "unimpl:late bind neg.")


end

exception SMapHwSpecGen_error of string;;

module SMapHwSpecGen =
struct

  let interp_arg2 :
    (map_ctx -> map_result -> map_result -> map_result) -> (map_late_bind)=
    fun fxn ->
      (
        fun (ctx:map_ctx) (res:map_result list) (pars:map_params) -> match res with
          | [h;h2] -> fxn ctx h h2
          | _ -> raise (SMapHwSpecGen_error "expected two arguments")
      )

  let interp_arg1 :
    (map_ctx -> map_result -> map_result) -> (map_late_bind)=
    fun fxn ->
      (
        fun (ctx:map_ctx) (res:map_result list) (pars:map_params) -> match res with
          | [h] -> fxn ctx h 
          | _ -> raise (SMapHwSpecGen_error "expected one arguments")
      )

  let interp_arg0:
    (map_ctx -> map_result) -> (map_late_bind)=
    fun fxn ->
      (
        fun (ctx:map_ctx) (res:map_result list) (pars:map_params) -> match res with
          | [] -> fxn ctx 
          | _ -> raise (SMapHwSpecGen_error "expected one arguments")
      )

  let rec process_ast : (hwvid ast) -> map_cstr_gen =
    fun expr ->
      match expr with
      | Term(HNPort(HWKOutput,HCMLocal(cmp),port,prop)) ->
        let fxn = SMapHwSpecLateBind.late_bind_output port in
        SCLateBind(interp_arg0 fxn,[])

      | Term(HNPort(HWKInput,HCMLocal(cmp),port,prop)) ->
        let fxn = SMapHwSpecLateBind.late_bind_input port in
        SCLateBind(interp_arg0 fxn,[])

      | OpN(opn,args) ->
        let proc_n :
          hwvid ast list -> (map_late_bind) -> map_cstr_gen=
          fun args fxn ->
            match args with
            | h::t -> List.fold_left (fun (rest:map_cstr_gen) (arg:hwvid ast) ->
                let newv = process_ast arg in
                SCLateBind(fxn,[newv;rest])  
              ) (process_ast h) t
        in
        begin
          match opn with
          | Mult ->
            proc_n args (interp_arg2 SMapHwSpecLateBind.late_bind_mult2) 
          | Add ->
            proc_n args (interp_arg2 SMapHwSpecLateBind.late_bind_add2) 
          | Sub ->
            proc_n args (interp_arg2 SMapHwSpecLateBind.late_bind_sub2) 
        end
      | Term(HNParam(cmp,name)) ->
        let fxn = SMapHwSpecLateBind.late_bind_param name in
        SCLateBind(interp_arg0 fxn,[])

      | Op2(Div,numer,denom) ->
        let map_numer = process_ast numer in
        let map_denom = process_ast denom in
        let fxn = interp_arg2 (SMapHwSpecLateBind.late_bind_div) in
        SCLateBind(fxn,[map_numer;map_denom])

      | Op2(Power,base,exp) ->
        let map_base = process_ast base in
        let map_exp = process_ast exp in
        let fxn = interp_arg2 (SMapHwSpecLateBind.late_bind_pow) in
        SCLateBind(fxn,[map_exp;map_base])

      | Op1(Exp,exp) ->
        let map_exp = process_ast exp in
        let fxn = interp_arg1 (SMapHwSpecLateBind.late_bind_exp) in
        SCLateBind(fxn,[map_exp])

      | Op1(Neg,expr) ->
        let map_expr = process_ast expr in
        let fxn = interp_arg1 (SMapHwSpecLateBind.late_bind_neg) in
        SCLateBind(fxn,[map_expr])

      | Integer(i) ->
        let data =
          SMapHwSpecLateBind.mkresult
            (SENumber(Integer 1)) (SENumber(Integer 0)) (SVNumber(Integer i)) []
        in
        SCStaticBind(data)

      | Decimal(i) ->
        let data =
          SMapHwSpecLateBind.mkresult
            (SENumber(Integer 1)) (SENumber(Integer 0)) (SVNumber(Decimal i)) []
        in
        SCStaticBind(data);

      | _ ->
        raise (SMapHwSpecGen_error "unimpl: unknown term")


  
  let build_comp : hwvid hwenv -> hwvid hwcomp -> map_comp =
    fun henv comp ->
      let mapcomp : map_comp =
        {inputs = MAP.make(); outputs = MAP.make()}
      in
      (*declare scales and offsets for variable*)
      MAP.iter comp.ins (fun name (data:hwvid hwportvar) ->
          let hwid =
            HwLib.port2hwid data.knd comp.name data.port data.prop data.typ
          in
          let gen = process_ast (Term hwid) in
          MAP.put mapcomp.inputs name gen;
          ()
        );
      (*create constraints for each component*)
      MAP.iter comp.outs (fun name (data:hwvid hwportvar) ->
          let gen = match data.bhvr,data.defs with
          (*ADC*)
          | HWBDigital(bhvr),HWDAnalog(defs) ->
            let gen : map_cstr_gen = process_ast bhvr.rhs in
            SCLateBind(interp_arg1 (SMapHwSpecLateBind.late_bind_within_interval defs.ival name false),[gen])

          
          (*DAC*)
          | HWBAnalog(bhvr), HWDDigital(defs) ->
            let gen : map_cstr_gen = process_ast bhvr.rhs in
            SCLateBind(interp_arg1 (SMapHwSpecLateBind.late_bind_within_interval defs.ival name false),[gen])

          | HWBAnalog(bhvr), HWDAnalog(defs) ->
            let gen : map_cstr_gen = process_ast bhvr.rhs in
            SCLateBind(interp_arg1 (SMapHwSpecLateBind.late_bind_within_interval defs.ival name false),[gen])

          | HWBAnalogState(bhvr),HWDAnalogState(defs) ->
            let icport, icprop = bhvr.ic in
            let icvar =
              HwLib.port2hwid HWKInput comp.name icport icprop data.typ
            in
            let rhsgen : map_cstr_gen = process_ast bhvr.rhs in
            let icgen : map_cstr_gen = process_ast (Term icvar) in 
            let total_gen : map_cstr_gen =
              SCLateBind(interp_arg2 SMapHwSpecLateBind.late_bind_deriv, [rhsgen;icgen])
            in
            let total_gen_1 =
              SCLateBind(interp_arg1 (SMapHwSpecLateBind.late_bind_within_interval defs.deriv.ival name false),[total_gen])
            in
            let total_gen_2 =
              SCLateBind(interp_arg1 (SMapHwSpecLateBind.late_bind_within_interval defs.stvar.ival name true),[total_gen_1])
            in
            total_gen_2
          in
          MAP.put mapcomp.outputs name (gen);
          ()
        );
      mapcomp
end
