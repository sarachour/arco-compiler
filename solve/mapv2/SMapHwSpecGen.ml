open HWData;;
open HWLib;;
open SMapData;;
open Util;;
open SolverData;;
open AST;;

exception SMapHwSpecGen_error of string
module SMapHwSpecGen =
struct

  let mkresult : map_expr -> map_expr -> map_loc_val -> map_cstr list -> map_result =
    fun scale offset value cstrs ->
    {cstrs=cstrs;scale=scale;offset=offset;value}

  let rec late_bind_mult2 (res1:map_result) (res2:map_result) : map_result =
    match res1.value, res2.value with
    | SVZero,SVZero ->
      let scale = SEVar (SMFreeVar(0)) in 
      let offset = SEMult(res1.offset, res2.offset) in
      let value = SVZero in
      mkresult scale offset value []
    | SVZero, SVNumber(n) ->
      let scale = SEVar (SMFreeVar(0)) in
      let offset =
        SEAdd(SEMult(SEMult(res1.scale,SENumber(n)),res2.offset),
              SEMult(res1.offset,res2.offset))
      in
      let value = SVZero in
      mkresult scale offset value []

    | SVNumber(n),SVZero ->
      late_bind_mult2 res2 res1

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

  let late_bind_div (res1:map_result) (res2:map_result) : map_result =
    raise (SMapHwSpecGen_error "unimpl:process_ast div")

  let late_bind_pow (res1:map_result) (res2:map_result) : map_result =
    raise (SMapHwSpecGen_error "unimpl:process_ast div")

  let late_bind_add2 (res1:map_result) (res2:map_result) : map_result =
    raise (SMapHwSpecGen_error "unimpl:process_ast add2")

  let late_bind_sub2 (res1:map_result) (res2:map_result) : map_result =
    raise (SMapHwSpecGen_error "unimpl:process_ast sub2")

  let late_bind_neg1 (res1:map_result) : map_result = 
    raise (SMapHwSpecGen_error "unimpl:process_ast neg")

  let late_bind_exp (res1:map_result) : map_result =
    raise (SMapHwSpecGen_error "unimpl:process_ast neg")

  let interp_arg2 : (map_result -> map_result -> map_result) -> (map_late_bind)=
    fun fxn ->
      (
        fun (res:map_result list) (pars:map_params) -> match res with
          | [h;h2] -> fxn h h2
          | _ -> raise (SMapHwSpecGen_error "expected two arguments")
      )

  let rec process_ast : (hwvid ast) -> map_cstr_gen =
    fun expr ->
      match expr with
      | Term(HNPort(knd,HCMLocal(cmp),port,prop)) ->
        raise (SMapHwSpecGen_error "unimpl:process_ast term")

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
        raise (SMapHwSpecGen_error "unimpl:process_ast term")

      | _ ->
        raise (SMapHwSpecGen_error "unimpl")


  let build_comp : hwvid hwenv -> hwvid hwcomp -> map_comp =
    fun henv comp ->
      (*declare scales and offsets for variable*)
      MAP.iter comp.ins (fun name (data:hwvid hwportvar) ->
          ()
        );
      MAP.iter comp.outs (fun name (data:hwvid hwportvar) ->
          ()
        );
      (*create constraints for each component*)
      MAP.iter comp.outs (fun name (data:hwvid hwportvar) ->
          match data.bhvr,data.defs with
          | HWBDigital(bhvr),HWDAnalog(defs) ->
            raise (SMapHwSpecGen_error "unimpl:d-eqn")
          | HWBAnalog(bhvr), HWDAnalog(defs) ->
            raise (SMapHwSpecGen_error "unimpl:a-eqn")
          | HWBAnalogState(bhvr),HWDAnalogState(defs) ->
            raise (SMapHwSpecGen_error "unimpl:stvar")

        );
      raise (SMapHwSpecGen_error "unimpl")

end
