open HWData;;
open HWLib;;
open SMapData;;
open Util;;
open SolverData;;
open AST;;
open IntervalData;;
open IntervalLib;;

open Globals;;

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
        begin
          Printf.printf "[WARN] does not have value for port %s\n" port;
          SVDC
        end


  let get_param : map_comp_ctx -> string -> number =
    fun ctx param ->
      if MAP.has ctx.params param then
        MAP.get ctx.params param
      else
        raise (SMapCompCtx_error ("does not have param:"^param))

  let get_max_sample_period : map_comp_ctx-> string -> number option =
    fun ctx name ->
      if MAP.has ctx.sample name then
        Some (MAP.get ctx.sample name)
      else
        None

  let get_min_speed : map_comp_ctx -> string -> number option =
    fun ctx name ->
      if MAP.has ctx.speed name then
        Some (MAP.get ctx.speed name)
      else
        None

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

end

exception SMapHwSpecLateBind_error of string;;

module SMapHwSpecLateBind =
struct
  let freevar_idx = REF.mk 0;;

  let clear_freevar () =
    REF.upd freevar_idx (fun x -> 0)

  let get_freevar () =
    let v = SMFreeVar(REF.dr freevar_idx) in
    REF.upd freevar_idx (fun x -> x + 1);
    v


  let mkfailure : unit -> map_result =
    fun () ->
      {cstrs=[SCFalse];scale=SEVar(SMFreeVar 0); offset=SEVar(SMFreeVar 0); value=SVZero;}


  let rec eval_ineq : map_op -> number -> map_cstr =
    fun op n ->
      match op with
      | SCLTE(x) -> if NUMBER.lte n x then SCTrue else SCFalse
      | SCGTE(x) -> if NUMBER.gte n x then SCTrue else SCFalse
      | SCNEQ(x) -> if NUMBER.neq n x then SCTrue else SCFalse
      | SCOr(a,b) -> begin match eval_ineq a n, eval_ineq b n with
          | SCTrue,_ -> SCTrue
          | _, SCTrue -> SCTrue
          | _ -> SCFalse
        end

  let rec mk_ineq : map_expr -> map_op -> map_cstr =
    fun a op ->
      match a with
      | SENumber(m) -> eval_ineq op m 
      | SEVar(a) -> SCVarIneq(op,a)
      | expr -> SCExprIneq(op,expr)



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


  
  let mkresult : map_result list -> map_expr -> map_expr -> map_loc_val -> map_cstr list ->  map_result =
    fun args scale offset value cstrs ->
      let process_affine expr range cstrs =
        match range with
        | "+" -> (mk_ineq expr (SCGTE(Integer 0)) )::cstrs
        | "-" -> (mk_ineq expr (SCLTE(Integer 0)) )::cstrs
        | "0" -> (mk_equal0 expr)::cstrs
        | "1" -> (mk_equal expr (SENumber (Integer 1)))::cstrs
        | "*" -> cstrs
      in
      let all_cstrs : map_cstr list = List.fold_left
          (fun (r:map_cstr list) (x:map_result) -> x.cstrs @ r) cstrs (args)
      in
      let scale_range =  get_glbl_string "jaunt-scale-range" in
      let offset_range = get_glbl_string "jaunt-offset-range" in
      let all_cstrs = (
          process_affine scale scale_range
           (process_affine offset offset_range all_cstrs)
        )
      in
      {cstrs=all_cstrs;scale=scale;offset=offset;value=value}



  
  (*
  let rec mk_not_equal : map_expr -> number -> map_cstr =
    fun a n ->
      match a with
      | SENumber(m) -> if n = m then SCFalse else SCTrue
      | SEVar(a) -> SCVarOPConst(SCNEQ,a,n)
      | expr -> SCExprOPConst(SCNEQ,expr,n)
  *)

   
  let mk_not_equal0 : map_expr -> map_cstr =
    fun expr ->
      mk_ineq expr (SCNEQ (Integer 0))
  

  let mk_gte : map_expr -> number -> map_cstr =
    fun expr n ->
      mk_ineq expr (SCGTE n)

  
  let mk_equal1 : map_expr -> map_cstr =
    fun x -> mk_equal x (SENumber (Integer 1))

  (*
  let mk_not_equal1 : map_expr -> map_cstr =
    fun x -> mk_not_equal x ((Integer 0))
  *)

  let mk_loc_val_of_number : number -> map_loc_val =
    fun x -> if NUMBER.eq_int x 0 then
        SVZero
      else
        SVNumber x

  let mk_loc_val_of_interval : interval -> map_loc_val =
    fun ival ->
      match IntervalLib.number_of_interval ival with
      | Some(n) -> mk_loc_val_of_number n
      | None -> SVSymbol(ival)

  let mk_cstr_from_loc_val : map_loc_val -> map_expr -> map_expr -> map_cstr list -> map_cstr list =
    fun v sc off lst ->
      let nonzero_pos : number = Decimal 1e-20 in
      match v with
      | SVZero -> lst

      | SVNumber(n) ->
        if NUMBER.is_nan n || NUMBER.is_inf n then
          SCFalse::lst
        else
          let expr = (SEAdd(SEMult(sc,SENumber n),off)) in
          (mk_not_equal0 expr)::lst

      | SVDC ->
        (mk_equal1 sc)::(mk_equal0 off)::lst

      | SVSymbol(n) ->
        (mk_not_equal0 sc)::lst

  (*process the bounds over the variable.*)
  let port_val_to_port_cstrs: string -> map_loc_val -> map_loc_val*(map_cstr list) =
    fun port_name port_val ->
      (*Printf.printf "value[%s] : %s\n" port_name (SMapLocVal.to_string port_val);*)

      match port_val with
      | SVSymbol(interval) ->
        let new_loc_val = mk_loc_val_of_interval interval in
        let new_cstr = mk_cstr_from_loc_val
            new_loc_val (SEVar(SMScale(port_name))) (SEVar(SMOffset(port_name))) []
        in
        new_loc_val,new_cstr

     | SVNumber(n) ->
       let new_loc_val = mk_loc_val_of_number n in
       let new_cstr = mk_cstr_from_loc_val
           new_loc_val (SEVar(SMScale(port_name))) (SEVar(SMOffset(port_name))) []
       in
       new_loc_val,new_cstr

     | SVZero ->
        SVZero, []

     | SVDC ->
         let new_cstr = mk_cstr_from_loc_val
             port_val (SEVar(SMScale(port_name))) (SEVar(SMOffset(port_name))) []
         in
         SVDC,new_cstr

  let late_bind_input: string -> map_ctx -> map_result=
    fun port_name ctx ->
      let port_val = SMapCompCtx.get_port ctx port_name in
      let new_port_val, port_cstrs =
        port_val_to_port_cstrs port_name port_val
      in
      mkresult
        []
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
        []
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
        []
        scale_var 
        (SENumber(Integer 0))
        new_port_val
        []

  let mk_affine : map_expr -> map_expr -> map_expr -> map_expr =
    fun scale offset v ->
      SEAdd (SEMult(scale,v),offset)
  
  let rec late_bind_mult2 : map_ctx -> map_result -> map_result -> map_result =
    fun ctx res1 res2 ->
      let args = [res1;res2] in
      match res1.value, res2.value with
      | SVDC,SVZero ->
        let scale = SEVar(get_freevar()) in
        let offset = SENumber(Integer 0) in
        let value = SVZero in
        mkresult args scale offset value []

      | SVDC,_ ->
        res1

      | _,SVDC ->
        late_bind_mult2 ctx res2 res1

      | SVZero,SVZero ->
        let scale = SEVar (get_freevar()) in 
        let offset = SEMult(res1.offset, res2.offset) in
        let value = SVZero in
        mkresult args scale offset value []

      | SVZero, SVNumber(n) ->
        let scale = SEVar (get_freevar()) in
        let n_expr = mk_affine res2.scale res2.offset (SENumber (n)) in
        let offset = SEMult(res1.offset,n_expr) in
        let value = SVZero in
        mkresult args scale offset value [] 

      | SVNumber(n),SVZero ->
        late_bind_mult2 ctx res2 res1

      | SVZero,SVSymbol(ival) ->
        let scale = SEVar (get_freevar()) in
        let offset = SEMult(res1.offset,res2.offset) in
        let value = SVZero in
        mkresult args scale offset value [] 

      | SVSymbol(ival), SVZero ->
        late_bind_mult2 ctx res2 res1

      | SVNumber(n),SVNumber(m)->
        let scale = SEVar (get_freevar()) in
        let offset = SEVar (get_freevar()) in
        let n_expr = mk_affine res1.scale res1.offset (SENumber n) in
        let m_expr = mk_affine res2.scale res2.offset (SENumber m) in
        let res_val  = NUMBER.mult n m in
        let res_expr = mk_affine scale offset (SENumber (res_val)) in
        let value = mk_loc_val_of_number (res_val) in
        let base_cstrs = [
          mk_equal (SEMult(n_expr,m_expr)) res_expr
        ] in
        let cstrs = mk_cstr_from_loc_val value scale offset base_cstrs in
        mkresult args scale offset (value) cstrs 

      | SVSymbol(a), SVNumber(m) ->
        (*
           the issue, given n * X
           the offset term is b_x*(a_n*eps+b_n)
           if distributed
           b_x*a_n*n + b_x*b_n
           the solver does the following (assume n is one here):
           -b_x*a_n = b_x*b_n
           b_x \neq 0
           a_n is large pos value
           b_n is large neg value
           a_n neq b_n
           

        *)
        let m_expr = mk_affine res2.scale res2.offset (SENumber m) in
        let scale = SEVar (get_freevar()) in
        let offset = SEMult(m_expr,res1.offset) in
        let value = mk_loc_val_of_interval (IntervalLib.mult a (IntervalLib.num m)) in
        (*is irreversible if transformed value is zero*)
        let base_cstrs =  [
          mk_not_equal0 m_expr;
          mk_equal (SEMult(scale,SENumber m)) (SEMult(res1.scale,m_expr));
        ] in
        let cstrs = mk_cstr_from_loc_val value scale offset base_cstrs in
        mkresult args scale offset (value) cstrs



      | SVNumber(m), SVSymbol(a) ->
        late_bind_mult2 ctx res2 res1



      | SVSymbol(s1), SVSymbol(s2) ->
        let scale = SEMult(res1.scale,res2.scale) in
        let offset = SENumber(Integer 0) in
        let value = mk_loc_val_of_interval (IntervalLib.mult s1 s2) in
        let base_cstrs = [
          mk_equal0 (res1.offset);
          mk_equal0 (res2.offset);
        ]
        in
        let cstrs = mk_cstr_from_loc_val value scale offset base_cstrs in
        mkresult args scale offset (value) cstrs

      | _ ->
        raise (SMapHwSpecLateBind_error "mult.unimpl case")


  let late_bind_inv (ctx:map_ctx) (res:map_result) : map_result =
    match res.value with
    | SVZero ->
      mkfailure()

    | SVDC ->
      res

    | SVNumber(n) ->
      let n_inv = NUMBER.div (Integer 1) n in
      let scale = SEVar (get_freevar()) in
      let offset = SEVar (get_freevar()) in
      let res_expr = mk_affine scale offset (SENumber n_inv) in
      let n_expr = mk_affine res.scale res.offset (SENumber n) in
      let value = mk_loc_val_of_number n_inv in
      let base_cstrs = [
        mk_not_equal0 n_expr;
        mk_equal (res_expr) (SEDiv(SENumber (Integer 1),n_expr)); 
      ] in
      let cstrs = mk_cstr_from_loc_val value scale offset base_cstrs in
      mkresult [res] scale offset (mk_loc_val_of_number n_inv) cstrs

    | SVSymbol(x) ->
      let scale = SEDiv(
          SENumber(Integer 1),
          res.scale
        )
      in
      let offset = SENumber(Integer 0) in
      let value =  mk_loc_val_of_interval (IntervalLib.div (IntervalLib.num (Integer 1)) x) in
      let base_cstrs = [
        mk_equal0 res.offset;
        mk_not_equal0 (res.scale)
      ] in
      let cstrs = mk_cstr_from_loc_val value scale offset base_cstrs in
      if IntervalLib.contains x (Integer 0) then mkfailure() else
      mkresult [res] scale offset (value) cstrs
        

  
  let late_bind_pow (ctx:map_ctx)(res1:map_result) (res2:map_result) : map_result =
    let args = [res1;res2] in
    match res1.value, res2.value with
    | SVZero, SVZero ->
      mkfailure ()

    (*special don't care*)
    | SVDC, SVZero ->
      let scale = SENumber(Integer 1) in 
      let offset = SENumber(Integer 0) in
      let value = SVNumber (Integer 1) in
      mkresult args scale offset value []

    | SVZero, SVDC->
      let scale = SEVar (get_freevar()) in
      let offset = SENumber(Integer 0) in
      let value = SVZero  in
      mkresult args scale offset value []

    
    | SVNumber(n), SVDC ->
        res2

    | SVDC, _ ->
      res1

    | _,SVDC ->
      res2

    (* n^0 *)
    | SVNumber(n),SVZero ->
      let m_exp_aff = mk_affine res1.scale res1.offset (SENumber n)  in
      let scale = SEVar (get_freevar()) in
      let offset = SEVar (get_freevar()) in
      let value = SVNumber(Integer 1) in
      let base_cstrs = [
        mk_equal (SEAdd(scale,offset)) (SEPow(m_exp_aff,res2.offset))
      ] in
      let cstrs = mk_cstr_from_loc_val value scale offset base_cstrs in
      mkresult args scale offset value cstrs

    (* 0^n *)
    | SVZero,SVNumber(m) ->
      let m_exp_aff = mk_affine res2.scale res2.offset (SENumber m) in
      let scale = SEVar (get_freevar()) in
      let offset = SEPow(res1.offset,m_exp_aff) in
      let value = SVZero in
      let base_cstrs = 
          []
      in
      let cstrs = mk_cstr_from_loc_val value scale offset base_cstrs in
      if NUMBER.lte m (Integer 0) then
        mkfailure()
      else
        mkresult args scale offset (value) cstrs

    (*n^m*)
    | SVNumber(n),SVNumber(m) ->
      (* allow exponential scaling 
      let scale = SEVar (get_freevar()) in
      let offset = SEVar (get_freevar()) in
      *)
      let offset = SENumber(Integer 0) in
      let scale = SEPow(res1.scale,SENumber m) in
      let m_exp_aff = mk_affine res2.scale res2.offset (SENumber m) in
      let m_base_aff =mk_affine res1.scale res1.offset (SENumber n) in
      let res_value = NUMBER.pow n m in
      let value = mk_loc_val_of_number (res_value) in
      let base_cstrs = if NUMBER.gt m (Integer 0) then
          [
            mk_equal0 res1.offset;
            mk_equal (SENumber m) m_exp_aff;
          ]
        else
          [
            mk_equal0 res1.offset;
            mk_equal (SENumber m) m_exp_aff;
            mk_gte res1.scale (Integer 0);
            mk_not_equal0 res1.scale;
          ]
      in
      let cstrs = mk_cstr_from_loc_val value scale offset base_cstrs in
      if NUMBER.eq n (Integer 0) then
        mkfailure()
      else
        mkresult args scale offset (value) cstrs


      (*allow exponential scaling*)
      (*
      let res_aff = mk_affine scale offset (SENumber res_value) in
      let base_cstrs = [
        mk_equal res_aff (SEPow(m_base_aff,m_exp_aff));
        mk_gte m_base_aff (Integer 0)
      ] in
      let cstrs = mk_cstr_from_loc_val value scale offset base_cstrs in
      if NUMBER.gt m (Integer 0) || NUMBER.neq n (Integer 0) then
        mkresult args scale offset (value) cstrs
      else
        mkfailure()
      *)

    | SVSymbol(x), SVNumber(m) ->
      let offset = SENumber(Integer 0) in
      let m_expr = mk_affine res2.scale res2.offset (SENumber m) in
      let scale = SEPow(res1.scale,SENumber m) in
      let value = mk_loc_val_of_interval (IntervalLib.pow x (IntervalLib.num m)) in
      let base_cstrs = if NUMBER.gt m (Integer 0) then
          [
            mk_equal0 res1.offset;
            mk_equal (SENumber m) m_expr
          ]
        else
          [
            mk_equal0 res1.offset;
            mk_gte res1.scale (Integer 0);
            mk_equal (SENumber m) m_expr;
            mk_not_equal0 res1.scale;
          ]
      in
      let cstrs = mk_cstr_from_loc_val value scale offset base_cstrs in
      if IntervalLib.contains x (Integer 0) then
        mkfailure()
      else
        mkresult args scale offset (value) cstrs

    | SVNumber(n), SVSymbol(x) ->
      let offset = SENumber(Integer 0) in
      let scale = SENumber(Integer 1) in
      let result =  (IntervalLib.pow (IntervalLib.num n) x) in
      let value = mk_loc_val_of_interval result in
      let base_cstrs= [
        mk_equal0 res2.offset;
        mk_equal res2.scale (SENumber (Integer 1));
        mk_equal (SENumber n) (mk_affine res1.scale res1.offset (SENumber n));
      ]
      in
      let cstrs = mk_cstr_from_loc_val value scale offset base_cstrs in
      mkresult args scale offset (value) cstrs

    | SVSymbol(x), SVSymbol(y) ->
      let offset = SENumber(Integer 0) in
      let scale = SENumber(Integer 1) in
      let value = mk_loc_val_of_interval  (IntervalLib.pow x y) in
      let base_cstrs = [
        mk_equal0 res1.offset; mk_equal0 res2.offset;
        mk_equal1 res1.scale; mk_equal1 res2.scale
      ] in
      let cstrs = mk_cstr_from_loc_val value scale offset base_cstrs in
      mkresult args scale offset (value) cstrs

    | SVZero, SVSymbol(y) ->
      let scale = SEVar (get_freevar()) in
      let offset = SENumber (Integer 0) in
      let value = SVZero in
      mkresult args scale offset value []

    | SVSymbol(y), SVZero ->
      let scale = SENumber (Integer 1) in
      let offset = SENumber (Integer 0) in
      let value = SVNumber (Integer 1) in
      mkresult args scale offset value []

    | _ ->
    raise (SMapHwSpecLateBind_error "unimpl:process_ast pow")






  let rec late_bind_add2 (ctx:map_ctx)(res1:map_result) (res2:map_result) : map_result =
    let args = [res1;res2] in
    match res1.value, res2.value with

    | SVDC,_->
      res1

    | _,SVDC ->
      late_bind_add2 ctx res2 res1

    | SVZero,SVZero ->
      let scale = SEVar(get_freevar()) in
      let offset = SEAdd(res1.offset, res2.offset) in
      let value = SVZero in
      let cstrs = [] in
      mkresult args scale offset value cstrs

    | SVZero, SVNumber(n) ->
      let scale = res2.scale in
      let offset = SEAdd(res1.offset, res2.offset) in
      let value = mk_loc_val_of_number (n) in
      let base_cstrs = [] in
      let cstrs = mk_cstr_from_loc_val value scale offset base_cstrs in
      mkresult args scale offset (value) cstrs

    | SVNumber(_), SVZero ->
      late_bind_add2 ctx res2 res1

    | SVNumber(n), SVNumber(m) ->
      let scale = res1.scale in
      let offset = SEAdd(res1.offset, res2.offset) in
      let value = mk_loc_val_of_number (NUMBER.add n m) in
      let base_cstrs = [mk_equal res1.scale res2.scale] in
      let cstrs = mk_cstr_from_loc_val value scale offset base_cstrs in
      mkresult args scale offset (value) cstrs

    | SVSymbol(a), SVZero ->
      let scale = res1.scale in
      let offset = SEAdd(res1.offset, res2.offset) in
      let value = mk_loc_val_of_interval (a) in
      let base_cstrs = [] in
      let cstrs = mk_cstr_from_loc_val value scale offset base_cstrs in
      mkresult args scale offset (value) cstrs

    | SVZero, SVSymbol(_) ->
       late_bind_add2 ctx res2 res1 

    | SVSymbol(a), SVNumber(m) ->
      let scale = res1.scale in
      let offset = SEAdd(res1.offset, res2.offset) in
      let value = mk_loc_val_of_interval (IntervalLib.add a (IntervalLib.num m)) in
      let base_cstrs = [mk_equal res1.scale res2.scale] in
      let cstrs = mk_cstr_from_loc_val value scale offset base_cstrs in
      mkresult args scale offset (value) cstrs

    | SVNumber(_), SVSymbol(_) ->
      late_bind_add2 ctx res2 res1

    | SVSymbol(a), SVSymbol(b) ->
      let scale = res1.scale in
      let offset = SEAdd(res1.offset, res2.offset) in
      let value = mk_loc_val_of_interval (IntervalLib.add a b) in
      let base_cstrs = [mk_equal res1.scale res2.scale] in
      let cstrs = mk_cstr_from_loc_val value scale offset base_cstrs in
      mkresult args scale offset (value) cstrs



  
  let late_bind_exp (ctx:map_ctx) (res1:map_result) : map_result =
    let e = SVNumber(Decimal 2.718281828459045235360287471352) in
    let base = mkresult [] (SENumber(Integer 1)) (SENumber(Integer 0)) e [] in
    late_bind_pow ctx base res1 


  let late_bind_eqn (ctx:map_ctx) (lhs:map_result) (rhs:map_result) : map_result =
    let scale = lhs.scale in
    let offset = lhs.offset in
    let value = lhs.value in
    let cstr = [
      mk_equal lhs.scale rhs.scale;
      mk_equal lhs.offset rhs.offset;
    ] in
    mkresult [lhs;rhs] scale offset value cstr

  let late_bind_deriv (ctx:map_ctx) (lhs:map_result) (rhs:map_result) (ic:map_result): map_result =
    let scale = lhs.scale in
    let offset = SENumber (Integer 0) in
    let value = lhs.value in
    let base_cstrs = [
      mk_equal lhs.scale rhs.scale;
      mk_equal lhs.scale ic.scale;
      mk_equal0 lhs.offset;
      mk_equal0 rhs.offset;
      mk_equal0 ic.offset;
      mk_equal lhs.scale (SEVar SMTimeConstant);
    ]
    in
    let cstrs = mk_cstr_from_loc_val value scale offset base_cstrs in
    mkresult [lhs;rhs;ic] scale offset value cstrs

  let map_range_of_interval : interval -> map_range option =
    let vmax = 1e32 in
    let vmin = 0. -. vmax in
    fun i -> match i with
        | Interval(a) ->
          begin
            match a.min, a.max with
            | BNDNum(min),BNDNum(max) -> Some {min = Decimal min; max = Decimal max}
            | BNDNum(min),BNDInf(QDPositive) -> Some {min = Decimal min; max = Decimal vmax}
            | BNDInf(QDNegative),BNDNum(max) -> Some {min = Decimal vmin; max = Decimal max}
            | _ -> None 
          end

        | _ -> None 

  let map_range_of_map_loc_val : map_loc_val -> map_range =
    fun v -> match v with
      | SVSymbol(i) ->
        begin
          match map_range_of_interval i with
          | Some(mrng) -> mrng
          | None -> raise (SMapHwSpecLateBind_error "the math expr bounds must be resolvable.")
        end
      | SVNumber(n) -> {min=n; max = n}
      | SVZero -> {min=Integer 0; max=Integer 0}
     
  let late_bind_cover :  map_range -> map_ctx -> map_result -> map_result =
    fun port_range ctx res  ->
      match res.value with
      |SVDC ->
        mkresult [res] res.scale res.offset res.value []

      | _ ->
        begin
          let expr_range = map_range_of_map_loc_val res.value in
          let cstrs = [
            SCCoverInterval(port_range, expr_range , res.scale, res.offset);
          ] in
          mkresult [res] res.scale res.offset res.value cstrs 
        end

  let late_bind_noop  : map_ctx -> map_result -> map_result =
    fun ctx res ->
      res

  let create_late_bind_cover : string -> interval -> (map_ctx -> map_result -> map_result) =
    fun name port_interval ->
      Printf.printf "BIND COVER: %s\n" name;
      match map_range_of_interval port_interval with
      | Some(port_range) -> late_bind_cover port_range
      | None -> late_bind_noop 

  let late_bind_sample: string -> number -> map_ctx -> map_result -> map_result =
    fun port hw_sample_period ctx result ->
      let cstrs = 
        match SMapCompCtx.get_max_sample_period ctx port, SMapCompCtx.get_min_speed ctx port with
        | Some(min_sample_period),Some(min_speed) ->
          let max_speed = NUMBER.div min_sample_period (hw_sample_period) in
          [SCCoverTime(Some min_speed,Some max_speed)]
        | None,Some(min_speed) -> 
          [SCCoverTime(Some min_speed,None)]
        | Some(min_sample_period),None -> 
          let max_speed = NUMBER.div min_sample_period (hw_sample_period) in
          [SCCoverTime(None,Some max_speed)]
        | None,None ->[] 
      in
      mkresult [result] result.scale result.offset result.value cstrs
      

  let create_late_bind_sample : string -> number -> (map_ctx -> map_result -> map_result) =
    fun name hw_sample_rate ->
      late_bind_sample name hw_sample_rate

  let late_bind_exp : map_ctx -> map_result -> map_result =
    fun port_name ctx ->
        raise (SMapHwSpecLateBind_error "unimpl:late bind exp.")

  let late_bind_neg : map_ctx -> map_result -> map_result =
    fun ctx arg0 ->
      let scale = arg0.scale in
      let offset = SESub(SENumber(Integer 0), arg0.offset) in
      let value = match arg0.value with
        | SVZero -> SVZero
        | SVNumber(x) -> SVNumber(NUMBER.neg x)
        | SVDC -> SVDC
        | SVSymbol(ival) -> SVSymbol(IntervalLib.neg ival)
      in
      let cstrs = [] in
      mkresult [arg0] scale offset value cstrs

  let late_bind_assoc : map_ctx -> map_assoc -> map_result list -> map_result =
    fun ctx assoc args ->
      (*TODO: actually implement sorting*)
      let rank_arg arg = match arg.value with
        | SVZero -> 1 | SVNumber(_) -> 2 | SVSymbol(_) -> 3 | SVDC(_) -> 0
      in
      let order_args x y = (rank_arg y) - (rank_arg x) in
      let args_sorted = List.sort order_args args in
      let late_bind = match assoc with
        | MAssocAdd -> late_bind_add2
        | MAssocMult -> late_bind_mult2
      in
      match args_sorted with
      | h::t ->
        List.fold_right (fun result arg_i ->
            late_bind ctx result arg_i
          ) t h
      | [h] ->
        h

  let rec evaluate : map_ctx -> map_params -> map_cstr_gen -> map_result = 
    fun ctx pars gen -> match gen with
      | SCLateBind(fxn,args) ->
        let r_args =
          List.map (fun x -> evaluate ctx pars x) args
        in
        fxn ctx r_args pars
      | SCAssoc(assoc,args) ->
        let r_args =
          List.map (fun x -> evaluate ctx pars x) args
        in
        late_bind_assoc ctx assoc r_args

      | SCStaticBind(res) -> res

end

exception SMapHwSpecGen_error of string;;

module SMapHwSpecGen =
struct

  let interp_arg3 :
    string -> (map_ctx -> map_result -> map_result -> map_result -> map_result) -> (map_late_bind)=
    fun tag fxn ->
      (
        fun (ctx:map_ctx) (res:map_result list) (pars:map_params) ->
          match res with
          | [h;h2;h3] -> fxn ctx h h2 h3
          | _ -> raise (SMapHwSpecGen_error "expected three arguments")
      )

  let interp_arg2 :
    string -> (map_ctx -> map_result -> map_result -> map_result) -> (map_late_bind)=
    fun tag fxn ->
      (

        fun (ctx:map_ctx) (res:map_result list) (pars:map_params) ->
          match res with
          | [h;h2] -> fxn ctx h h2
          | _ -> raise (SMapHwSpecGen_error "expected two arguments")
      )

  let interp_arg1 :
    string -> (map_ctx -> map_result -> map_result) -> (map_late_bind)=
    fun tag fxn ->
      ( 
        fun (ctx:map_ctx) (res:map_result list) (pars:map_params) ->
          match res with
          | [h] -> fxn ctx h 
          | _ -> raise (SMapHwSpecGen_error "expected one arguments")
      )

  let interp_arg0:
    string -> (map_ctx -> map_result) -> (map_late_bind)=
    fun tag fxn ->
      (
        fun (ctx:map_ctx) (res:map_result list) (pars:map_params) ->
          match res with
          | [] -> fxn ctx 
          | _ -> raise (SMapHwSpecGen_error "expected zero arguments")
      )

  let rec pull_down_assoc : map_assoc -> map_cstr_gen list -> map_cstr_gen list =
    fun assoc args ->
      List.fold_left (fun (new_args:map_cstr_gen list) (gen:map_cstr_gen)  ->
          match gen with
          | SCAssoc(knd,sub_args) -> if knd = assoc then
              (pull_down_assoc assoc sub_args) @ new_args
            else
              SCAssoc(knd,sub_args)::new_args
          | other -> other::new_args 

      ) args [] 

  let rec process_ast : (hwvid ast) -> map_cstr_gen =
    fun expr -> 
      match expr with
      | Term(HNPort(HWKOutput,HCMLocal(cmp),port,prop)) ->
        let fxn = SMapHwSpecLateBind.late_bind_output port in
        SCLateBind(interp_arg0 "term.out" fxn,[])

      | Term(HNPort(HWKInput,HCMLocal(cmp),port,prop)) ->
        let fxn = SMapHwSpecLateBind.late_bind_input port in
        SCLateBind(interp_arg0 "term.in" fxn,[])

      | OpN(opn,h::t) ->
        begin
          
          (*TODO: order the terms for associative expressions to maximize usage.*)
          match opn with
          | Mult ->
            let args = List.map (fun x -> process_ast x) (h::t) in
            SCAssoc(MAssocMult,pull_down_assoc MAssocMult (args))

          | Add ->
            let args = List.map (fun x -> process_ast x) (h::t) in
            SCAssoc(MAssocAdd,pull_down_assoc MAssocAdd (args))

          | Sub ->
            let pos_arg = process_ast h in
            let neg_args = List.map (fun x -> process_ast (Op1(Neg,x))) t in
            SCAssoc(MAssocAdd,pull_down_assoc MAssocAdd (pos_arg::neg_args))
        end
      | OpN(opn,[h]) ->
        let map_expr = process_ast h in
        map_expr

      | Term(HNParam(cmp,name)) ->
        let fxn = SMapHwSpecLateBind.late_bind_param name in
        SCLateBind(interp_arg0 "term.par" fxn,[])

      
      | Op2(Div,numer,denom) ->
        let map_numer = process_ast numer in
        let map_denom = SCLateBind(
            interp_arg1 "div" SMapHwSpecLateBind.late_bind_inv, [process_ast denom]
          ) in
        SCAssoc(MAssocMult,pull_down_assoc MAssocMult [map_numer;map_denom])
        
      | Op2(Power,base,exp) ->
        let map_base = process_ast base in
        let map_exp = process_ast exp in
        let fxn = interp_arg2 "pow" (SMapHwSpecLateBind.late_bind_pow) in
        SCLateBind(fxn,[map_base;map_exp])

      | Op1(Exp,exp) ->
        let map_exp = process_ast exp in
        let fxn = interp_arg1 "exp" (SMapHwSpecLateBind.late_bind_exp) in
        SCLateBind(fxn,[map_exp])

      | Op1(Neg,expr) ->
        let map_expr = process_ast expr in
        let fxn = interp_arg1 "neg" (SMapHwSpecLateBind.late_bind_neg) in
        SCLateBind(fxn,[map_expr])

      | Integer(i) ->
        let data =
          SMapHwSpecLateBind.mkresult
            [] (SENumber(Integer 1)) (SENumber(Integer 0)) (SVNumber(Integer i)) []
        in
        SCStaticBind(data)

      | Decimal(i) ->
        let data =
          SMapHwSpecLateBind.mkresult
            [] (SENumber(Integer 1)) (SENumber(Integer 0)) (SVNumber(Decimal i)) []
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
          let gen = match data.defs with
            | HWDAnalog(defs) ->
              SCLateBind (interp_arg1 "in.alog" (SMapHwSpecLateBind.create_late_bind_cover name defs.ival),
                          [process_ast (Term hwid)])

            | HWDDigital(defs) ->
              let sample_period, _ = defs.sample in
              SCLateBind(
                interp_arg1 "in.dig" (SMapHwSpecLateBind.create_late_bind_sample name sample_period),
                [
                  SCLateBind (interp_arg1 "in.dig.cover"
                                (SMapHwSpecLateBind.create_late_bind_cover name defs.ival),
                              [process_ast (Term hwid)])
                ]
              )
          in
          MAP.put mapcomp.inputs name gen;
          ()
        );
      (*create constraints for each component*)
      MAP.iter comp.outs (fun name (data:hwvid hwportvar) ->
          let lhs_id =
            HwLib.port2hwid data.knd comp.name data.port data.prop data.typ
          in
          let gen =
            match data.bhvr,data.defs with
            (*ADC*)
            | HWBDigital(bhvr),HWDAnalog(defs) ->
              begin
                let rhs : map_cstr_gen =
                  SCLateBind(interp_arg1 "out.dig.alog.r"
                               (SMapHwSpecLateBind.create_late_bind_cover name defs.ival),
                               [process_ast bhvr.rhs])
                in
                let lhs : map_cstr_gen =
                  SCLateBind(interp_arg1 "out.dig.alog.l"
                               (SMapHwSpecLateBind.create_late_bind_cover name defs.ival),
                               [process_ast (Term(lhs_id))])
                in
                let eqn : map_cstr_gen =
                  SCLateBind(interp_arg2 "out.dig.=" (SMapHwSpecLateBind.late_bind_eqn), [lhs;rhs])
                in
                eqn
              end

          
          (*DAC*)
          | HWBAnalog(bhvr), HWDDigital(defs) ->
            begin
              let rhs : map_cstr_gen =
                SCLateBind(interp_arg1 "out.alog.dig.r"
                             (SMapHwSpecLateBind.create_late_bind_cover name defs.ival),
                             [process_ast bhvr.rhs])
              in
              let sample_period,_ = defs.sample in
              let lhs : map_cstr_gen =
                SCLateBind(
                  interp_arg1 "out.alog.dig.per" (SMapHwSpecLateBind.create_late_bind_sample name sample_period),
                  [
                    SCLateBind(interp_arg1 "out.alog.dig.l"
                                 (SMapHwSpecLateBind.create_late_bind_cover name defs.ival),
                               [process_ast (Term(lhs_id))])
                  ]
                )
              in
              let eqn : map_cstr_gen =
                SCLateBind(interp_arg2 "out.alog.dig.=" (SMapHwSpecLateBind.late_bind_eqn), [lhs;rhs])
              in
              eqn
            end

          | HWBAnalog(bhvr), HWDAnalog(defs) ->
            begin
              let rhs : map_cstr_gen =
                SCLateBind(interp_arg1 "out.alog.alog.r" (SMapHwSpecLateBind.create_late_bind_cover name defs.ival),
                             [process_ast bhvr.rhs])
              in
              let lhs : map_cstr_gen =
                SCLateBind(interp_arg1 "out.alog.alog.l" (SMapHwSpecLateBind.create_late_bind_cover name defs.ival),
                             [process_ast (Term(lhs_id))])
              in
              let eqn : map_cstr_gen =
                SCLateBind(interp_arg2 "out.alog.alog.=" (SMapHwSpecLateBind.late_bind_eqn), [lhs;rhs])
              in
              eqn
            end
            
          | HWBAnalogState(bhvr),HWDAnalogState(defs) ->
            begin
              let icport, icprop = bhvr.ic in
              let ic_id =
                HwLib.port2hwid HWKInput comp.name icport icprop data.typ
              in
              let ic : map_cstr_gen =
                SCLateBind(interp_arg1 "deriv.ic" (SMapHwSpecLateBind.create_late_bind_cover name defs.stvar.ival),
                             [process_ast (Term(ic_id))])
              in
              let rhs : map_cstr_gen =
                SCLateBind(interp_arg1 "deriv.rhs" (SMapHwSpecLateBind.create_late_bind_cover name defs.deriv.ival),
                             [process_ast bhvr.rhs])
              in
              let rhs : map_cstr_gen = process_ast bhvr.rhs in
              let lhs : map_cstr_gen =
                SCLateBind(interp_arg1 "deriv.lhs" (SMapHwSpecLateBind.create_late_bind_cover name defs.stvar.ival),
                             [process_ast (Term(lhs_id))])
              in
              let steqn : map_cstr_gen =
                SCLateBind(interp_arg3 "deriv.=" (SMapHwSpecLateBind.late_bind_deriv), [lhs;rhs;ic])
              in
              steqn
            end
          in
          MAP.put mapcomp.outputs name (gen);
          ()
        );
      mapcomp
end
