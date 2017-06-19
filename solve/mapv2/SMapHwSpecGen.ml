open HWData;;
open HWLib;;
open SMapData;;
open Util;;
open SolverData;;
open AST;;
open IntervalData;;


exception SMapHwSpecGen_error of string

module SMapHwSpec =
struct
  let get_comp : map_hw_spec -> string -> map_comp =
    fun ctx compname ->
      raise (SMapHwSpecGen_error "unimpl: get comp")

  let get_port : map_hw_spec -> string -> string -> map_cstr_gen =
    fun ctx compname portname ->
      raise (SMapHwSpecGen_error "unimpl: get port")


end

module SMapHwSpecGen =
struct

  let freevar_idx = REF.mk 0;;

  let get_freevar () =
    let v = SMFreeVar(REF.dr freevar_idx) in
    REF.upd freevar_idx (fun x -> x + 1);
    v

  let mkresult : map_expr -> map_expr -> map_loc_val -> map_cstr list -> map_result =
    fun scale offset value cstrs ->
    {cstrs=cstrs;scale=scale;offset=offset;value}

  let rec late_bind_mult2 (ctx:map_ctx) (res1:map_result) (res2:map_result) : map_result =
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

    | SVNumber(n),SVNumber(m)->
      let scale = SEMult(res1.scale,res2.scale) in
      let offset =
        SEAdd(SEMult(SEMult(res1.scale,SENumber(n)),res2.offset),
        SEAdd(SEMult(SEMult(res2.scale,SENumber(m)),res1.offset),
              SEMult(res1.offset,res2.offset)))
      in
      let value = SVNumber(NUMBER.mult n m) in
      mkresult scale offset value []

    | _ ->
      raise (SMapHwSpecGen_error "unimpl case")

  let late_bind_div (ctx:map_ctx) (res1:map_result) (res2:map_result) : map_result =
    raise (SMapHwSpecGen_error "unimpl:process_ast div")

  let late_bind_pow (ctx:map_ctx)(res1:map_result) (res2:map_result) : map_result =
    raise (SMapHwSpecGen_error "unimpl:process_ast div")

  let late_bind_add2 (ctx:map_ctx)(res1:map_result) (res2:map_result) : map_result =
    raise (SMapHwSpecGen_error "unimpl:process_ast add2")

  let late_bind_sub2 (ctx:map_ctx)(res1:map_result) (res2:map_result) : map_result =
    raise (SMapHwSpecGen_error "unimpl:process_ast sub2")

  let late_bind_neg1 (ctx:map_ctx) (res1:map_result) : map_result = 
    raise (SMapHwSpecGen_error "unimpl:process_ast neg")

  let late_bind_exp (ctx:map_ctx) (res1:map_result) : map_result =
    raise (SMapHwSpecGen_error "unimpl:process_ast neg")

  let interp_arg2 : (map_ctx -> map_result -> map_result -> map_result) -> (map_late_bind)=
    fun fxn ->
      (
        fun (ctx:map_ctx) (res:map_result list) (pars:map_params) -> match res with
          | [h;h2] -> fxn ctx h h2
          | _ -> raise (SMapHwSpecGen_error "expected two arguments")
      )

  let interp_arg1 : (map_ctx -> map_result -> map_result) -> (map_late_bind)=
    fun fxn ->
      (
        fun (ctx:map_ctx) (res:map_result list) (pars:map_params) -> match res with
          | [h] -> fxn ctx h 
          | _ -> raise (SMapHwSpecGen_error "expected one arguments")
      )

  let interp_arg0: (map_ctx -> map_result) -> (map_late_bind)=
    fun fxn ->
      (
        fun (ctx:map_ctx) (res:map_result list) (pars:map_params) -> match res with
          | [] -> fxn ctx 
          | _ -> raise (SMapHwSpecGen_error "expected one arguments")
      )

  let late_bind_deriv (ctx:map_ctx) (res1:map_result) (res2:map_result) : map_result =
    raise (SMapHwSpecGen_error "unimpl:late bind deriv.")

  let late_bind_within_interval : interval -> string -> bool -> map_ctx -> map_result -> map_result =
    fun port_interval port_name is_deriv ctx res  ->
      raise (SMapHwSpecGen_error "unimpl:late bind within interval.")

  let late_bind_input: string -> map_ctx -> map_result=
    fun port_name ctx ->
      raise (SMapHwSpecGen_error "unimpl:late bind input.")

  let late_bind_output: string -> map_ctx -> map_result=
      fun port_name ctx ->
        raise (SMapHwSpecGen_error "unimpl:late bind output.")

  let late_bind_param: string -> map_ctx -> map_result=
      fun port_name ctx ->
        raise (SMapHwSpecGen_error "unimpl:late bind param.")

  let late_bind_exp : map_ctx -> map_result -> map_result =
    fun port_name ctx ->
        raise (SMapHwSpecGen_error "unimpl:late bind exp.")

  let late_bind_neg : map_ctx -> map_result -> map_result =
    fun port_name ctx ->
        raise (SMapHwSpecGen_error "unimpl:late bind neg.")

  let rec process_ast : (hwvid ast) -> map_cstr_gen =
    fun expr ->
      match expr with
      | Term(HNPort(HWKOutput,HCMLocal(cmp),port,prop)) ->
        let fxn = late_bind_output port in
        SCLateBind(interp_arg0 fxn,[])

      | Term(HNPort(HWKInput,HCMLocal(cmp),port,prop)) ->
        let fxn = late_bind_input port in
        SCLateBind(interp_arg0 fxn,[])

      | OpN(opn,args) ->
        let proc_n : hwvid ast list -> (map_late_bind) -> map_cstr_gen=
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
            proc_n args (interp_arg2 late_bind_mult2) 
          | Add ->
            proc_n args (interp_arg2 late_bind_add2) 
          | Sub ->
            proc_n args (interp_arg2 late_bind_sub2) 
        end
      | Term(HNParam(cmp,name)) ->
        let fxn = late_bind_param name in
        SCLateBind(interp_arg0 fxn,[])

      | Op2(Div,numer,denom) ->
        let map_numer = process_ast numer in
        let map_denom = process_ast denom in
        let fxn = interp_arg2 (late_bind_div) in
        SCLateBind(fxn,[map_numer;map_denom])

      | Op2(Power,base,exp) ->
        let map_base = process_ast base in
        let map_exp = process_ast exp in
        let fxn = interp_arg2 (late_bind_pow) in
        SCLateBind(fxn,[map_exp;map_base])

      | Op1(Exp,exp) ->
        let map_exp = process_ast exp in
        let fxn = interp_arg1 (late_bind_exp) in
        SCLateBind(fxn,[map_exp])

      | Op1(Neg,expr) ->
        let map_expr = process_ast expr in
        let fxn = interp_arg1 (late_bind_neg) in
        SCLateBind(fxn,[map_expr])

      | Integer(i) ->
        let data =
          mkresult (SENumber(Integer 1)) (SENumber(Integer 0)) (SVNumber(Integer i)) []
        in
        SCStaticBind(data)

      | Decimal(i) ->
        let data =
          mkresult (SENumber(Integer 1)) (SENumber(Integer 0)) (SVNumber(Decimal i)) []
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
            SCLateBind(interp_arg1 (late_bind_within_interval defs.ival name false),[gen])

          
          (*DAC*)
          | HWBAnalog(bhvr), HWDDigital(defs) ->
            let gen : map_cstr_gen = process_ast bhvr.rhs in
            SCLateBind(interp_arg1 (late_bind_within_interval defs.ival name false),[gen])

          | HWBAnalog(bhvr), HWDAnalog(defs) ->
            let gen : map_cstr_gen = process_ast bhvr.rhs in
            SCLateBind(interp_arg1 (late_bind_within_interval defs.ival name false),[gen])

          | HWBAnalogState(bhvr),HWDAnalogState(defs) ->
            let icport, icprop = bhvr.ic in
            let icvar =
              HwLib.port2hwid HWKInput comp.name icport icprop data.typ
            in
            let rhsgen : map_cstr_gen = process_ast bhvr.rhs in
            let icgen : map_cstr_gen = process_ast (Term icvar) in 
            let total_gen : map_cstr_gen =
              SCLateBind(interp_arg2 late_bind_deriv, [rhsgen;icgen])
            in
            let total_gen_1 =
              SCLateBind(interp_arg1 (late_bind_within_interval defs.deriv.ival name false),[total_gen])
            in
            let total_gen_2 =
              SCLateBind(interp_arg1 (late_bind_within_interval defs.stvar.ival name true),[total_gen_1])
            in
            total_gen_2
          in
          MAP.put mapcomp.outputs name (gen);
          ()
        );
      mapcomp
end
