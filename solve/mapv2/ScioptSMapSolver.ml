open SMapData;;
open SMapSolverData;;

open ScipyOptimizeData;;

open HWData;;
open HWLib;;
open MathData;;

open Util;;
open Globals;;

exception ScioptSMapSolver_error of string
module ScioptSMapSolver =
struct


  let options = MAP.make ();;
  MAP.put options "use-cover" true;;

  let set_option : string -> bool -> unit =
    fun key v ->
      noop (MAP.put options key v)

  let get_option : string -> bool =
    fun key ->
      MAP.get options key

  (*if only scale variables, guess 1. otherwise guess zero.*)
  let compute_guess : cfggen_mapvar list -> float =
    fun maps ->
      List.fold_right (fun el curr_guess -> match el.mapvar with
          | SMOffset(_) -> 0.0
          | SMScale(_) -> if curr_guess <> 0.0 then 1.0 else 0.0
          | _ -> curr_guess
        ) maps 1.0

  let xid_to_sciopt_expr : int -> string =
    fun idx ->
      Printf.sprintf "x[%d]" idx

  let xid_to_linear_sciopt_expr : int -> sciopt_linear_expr =
    fun idx ->
      SCILinTerm(1.0, idx)

  let xid_expr_to_sciopt_expr : map_expr -> string =
    fun expr ->
      let rec _proc : map_expr -> string =
        fun e -> match e with
          | SEAdd(a,b) -> Printf.sprintf "(%s)+(%s)" (_proc a) (_proc b)
          | SEMult(a,b) -> Printf.sprintf "(%s)*(%s)" (_proc a) (_proc b)
          | SEDiv(a,b) -> Printf.sprintf "(%s)/(%s)" (_proc a) (_proc b)
          | SEPow(a,b) -> Printf.sprintf "(%s)**(%s)" (_proc a) (_proc b)
          | SESub(a,b) -> Printf.sprintf "(%s)-(%s)" (_proc a) (_proc b)
          | SEVar(SMFreeVar a) -> Printf.sprintf "%s" (xid_to_sciopt_expr a)
          | SEVar(_) -> raise (ScioptSMapSolver_error "the expression should be processed.")
          | SENumber(a) -> Printf.sprintf "%s" (string_of_float (float_of_number a))
      in
      _proc expr


  let xid_expr_to_linear_sciopt_expr : map_expr -> sciopt_linear_expr option =
    fun expr ->
      let lin_expr_m = SMapExpr.linearize expr in
      match lin_expr_m with
      | Some(lin_expr) ->
        begin
          let rec _work (e:linear_map_expr) = match e with
            | SELinTerm(coeff,SMFreeVar(idx)) ->
              SCILinTerm(float_of_number coeff,idx)

            | SELinOffset(off) ->
              SCILinOffset(float_of_number off)

            | SELinAdd(lst) ->
              SCILinAdd(List.map _work lst)
          in
          Some (_work lin_expr)
        end

      | None -> None

  let time_cstr_to_sciopt : string -> number option -> number option -> sciopt_st list =
    fun expr tmin_maybe tmax_maybe ->
        begin
          match tmin_maybe, tmax_maybe with
          | Some(tmin),Some(tmax) ->
            SCIComment("time cstr")::
            SCIGTE(expr,string_of_number tmax)::
            SCILTE(string_of_number tmin,expr)::
            []


          | Some(tmin),None ->
            SCIComment("time cstr")::
            SCILTE(string_of_number tmin,expr)::
            []

          | None,Some(tmax) ->
            SCIComment("time cstr")::
            SCILTE(expr,string_of_number tmax)::
            []

          | None,None -> [] 
        end

  let cover_cstr_to_sciopt : int->int-> map_range -> map_range -> sciopt_st list =
    fun scale_xid offset_xid hwival mival ->
      let scvar = (xid_to_sciopt_expr scale_xid) in
      let ofvar = (xid_to_sciopt_expr offset_xid) in
      let hmin =  float_of_number hwival.min
      and hmax = float_of_number hwival.max in
      let mmin =  float_of_number mival.min
      and mmax = float_of_number mival.max in
      if not (NUMBER.eq mival.min mival.max)  then
        begin
          SCIComment("-> var cover constraints")::
          SCILinInterval(scale_xid,offset_xid,mmax,hmin,hmax)::
          SCILinInterval(scale_xid,offset_xid,mmin,hmin,hmax)::
          []

        end
        
      else
        begin
          SCIComment("-> number cover constraints")::
          SCILinInterval(scale_xid,offset_xid,mmax,hmin,hmax)::
          []
        end


  let get_nvars ctx =
    let _,maxval= LIST.max  float_of_int (MAP.keys ctx.xidmap)  in
    maxval + 1

  let slvr_bin_to_sciopt_expr : mapslvr_bin -> string option=
    fun bin ->
      match bin with
      | SMVMapVar(id) -> Some (xid_to_sciopt_expr id)
      | SMVMapExpr(mapexpr) -> Some (xid_expr_to_sciopt_expr mapexpr)
      | SMVTimeConstant -> None 
      | _ -> None

  let slvr_bin_to_linear_sciopt_expr : mapslvr_bin -> sciopt_linear_expr option=
    fun bin ->
      match bin with
      | SMVMapVar(id) -> Some (xid_to_linear_sciopt_expr id)
      | SMVMapExpr(mapexpr) -> (xid_expr_to_linear_sciopt_expr mapexpr)
      | SMVTimeConstant -> None 
      | _ -> None


  let slvr_bin_is_time_const : (mapslvr_bin) -> bool = 
    fun bin -> match bin with
      | SMVTimeConstant -> true
      | _ -> false


  let init_scipy : (sciopt_st -> unit) -> int -> unit =
    fun q nvars ->
      let tries = get_glbl_int "jaunt-scipy-tries" in
      let ctol = get_glbl_float "jaunt-scipy-ctol" in
      let xtol = get_glbl_float "jaunt-scipy-xtol" in
      let results = get_glbl_int "jaunt-scipy-results" in
      q (SCIInitialize(nvars));
      q (SCISetMethod(SCICOBYLA));
      q (SCISetIters(1000));
      q (SCISetTries(tries));
      q (SCISetResults(results));
      q (SCISetCstrTol(ctol));
      q (SCISetMinTol(xtol));
      q (SCIBound(SMapSlvrOpts.vmin, SMapSlvrOpts.vmax));
      ()
      
  let init_linear_scipy : (sciopt_st -> unit) -> int -> unit =
    fun q nvars ->
      let tries = get_glbl_int "jaunt-scipy-tries" in
      let ctol = get_glbl_float "jaunt-scipy-ctol" in
      let xtol = get_glbl_float "jaunt-scipy-xtol" in
      let results = get_glbl_int "jaunt-scipy-results" in
      q (SCIInitialize(nvars));
      q (SCISetMethod(SCILinOpt));
      q (SCISetIters(1000));
      q (SCISetTries(tries));
      q (SCISetResults(results));
      q (SCISetCstrTol(ctol));
      q (SCISetMinTol(xtol));
      q (SCIBound(SMapSlvrOpts.vmin, SMapSlvrOpts.vmax));
      ()

  let gen_obj_time_constant : mapslvr_ctx -> sciopt_st =
    fun ctx ->
      raise (ScioptSMapSolver_error "unimpl")

  (*try and find the middle solution*)
  let gen_obj_cover_slack : mapslvr_ctx -> mapslvr_st list  -> sciopt_st =
    fun ctx ->
      raise (ScioptSMapSolver_error "unimpl")

  let gen_obj_none : mapslvr_ctx -> sciopt_st =
    fun ctx ->
      SCILinObjective(SCILinOffset(0.0))

  let to_linear_scipy :mapslvr_ctx -> sciopt_st list =
    fun ctx ->
      let opt_use_cover = get_option "use-cover" in
      let sts : sciopt_st queue = QUEUE.make () in
      let q x = noop (QUEUE.enqueue sts x ) in
      let qall x = noop (QUEUE.enqueue_all sts x ) in
      let disjoint = GRAPH.disjoint ctx.bins in
      let nvars = get_nvars ctx in
      init_linear_scipy q nvars;
      MAP.iter ctx.xidmap (fun idx mapvars ->
          let init_guess = compute_guess mapvars in
          q (SCIInitGuess(idx,init_guess))
        );
      List.iter (fun (bins:mapslvr_bin set) ->
          let is_tc = REF.mk false in
          let exported_expr =
            SET.fold bins (fun bin exported ->
                (*update tc variable*)
                REF.upd is_tc (fun v -> v || slvr_bin_is_time_const bin);
                (*determine if exportable*)
                if SMapSlvrCtx.is_node_exported ctx bin then
                  match slvr_bin_to_linear_sciopt_expr bin with
                  | Some(expr) -> expr::exported
                  | None -> exported
                else
                  exported
              ) []
          in
          SET.iter ctx.sts (fun st -> match st with
              | SMVCover(sc,off,hwival,mival) ->
                if opt_use_cover then
                  qall (cover_cstr_to_sciopt sc off hwival mival)
            );
          LIST.diag_iter (SET.to_list bins) (fun bin1 bin2 ->
              if SMapSlvrCtx.is_edge_exported ctx bin1 bin2 &&
                 SMapSlvrCtx.is_node_exported ctx bin1 &&
                 SMapSlvrCtx.is_node_exported ctx bin2
              then
                let expr1_maybe = slvr_bin_to_linear_sciopt_expr bin1 in
                let expr2_maybe = slvr_bin_to_linear_sciopt_expr bin2 in
                match expr1_maybe, expr2_maybe with
                | Some(expr1),Some(expr2) ->
                  noop (q (SCILinEq(expr1,expr2)))
                | _ -> ()
            );
          SET.iter bins (fun (bin:mapslvr_bin) ->
              match bin with
              | SMVOp(op,_) ->
                List.iter (fun expr ->
                    match op with
                    | SCNEQ(n) -> () 
                    | SCGTE(n) -> q (SCILinGTE(expr,SCILinOffset (float_of_number n)))
                    | SCLTE(n) -> q (SCILinLTE(expr,SCILinOffset (float_of_number n)))
                    | SCOr(a,b) -> raise (ScioptSMapSolver_error "unsupported:or")
                  ) exported_expr
              | SMVCoverTime(min,max) ->
                List.iter (fun expr ->
                    raise (ScioptSMapSolver_error "unsupported")
                  ) exported_expr
              | _ -> ()
                     
            );
          ()
        ) disjoint;
      QUEUE.to_list sts

  let to_scipy : mapslvr_ctx ->  sciopt_st list =
    fun ctx ->
      let opt_use_cover = get_option "use-cover" in
      let sts : sciopt_st queue = QUEUE.make () in
      let q x = noop (QUEUE.enqueue sts x ) in
      let qall x = noop (QUEUE.enqueue_all sts x ) in
      let disjoint = GRAPH.disjoint ctx.bins in
      let nvars = get_nvars ctx in
      init_scipy q nvars;
      MAP.iter ctx.xidmap (fun idx mapvars ->
          let init_guess = compute_guess mapvars in
          q (SCIInitGuess(idx,init_guess))
        );
      List.iter (fun (bins:mapslvr_bin set) ->
          let is_tc = REF.mk false in
          let exported_expr =
            SET.fold bins (fun bin exported ->
                (*update tc variable*)
                REF.upd is_tc (fun v -> v || slvr_bin_is_time_const bin);
                (*determine if exportable*)
                if SMapSlvrCtx.is_node_exported ctx bin then
                  match slvr_bin_to_sciopt_expr bin with
                  | Some(expr) -> expr::exported
                  | None -> exported
                else
                  exported
              ) []
          in
          let best_expr = LIST.min exported_expr
              (fun sciopt_expr -> String.length (sciopt_expr))
          in
          (*equivalence constraints*)
          LIST.diag_iter (SET.to_list bins) (fun bin1 bin2 ->
              if SMapSlvrCtx.is_edge_exported ctx bin1 bin2 &&
                 SMapSlvrCtx.is_node_exported ctx bin1 &&
                 SMapSlvrCtx.is_node_exported ctx bin2
              then
                let expr1_maybe = slvr_bin_to_sciopt_expr bin1 in
                let expr2_maybe = slvr_bin_to_sciopt_expr bin2 in
                match expr1_maybe, expr2_maybe with
                | Some(expr1),Some(expr2) ->
                  noop (q (SCIEq(expr1,expr2)))
                | _ -> ()
            );
          SET.iter bins (fun (bin:mapslvr_bin) ->
              match bin with
              | SMVOp(op,_) ->
                List.iter (fun expr ->
                    match op with
                    | SCNEQ(n) -> q (SCINeq(expr,string_of_number n))
                    | SCGTE(n) -> q (SCIGTE(expr,string_of_number n))
                    | SCLTE(n) -> q (SCILTE(expr,string_of_number n))
                    | SCOr(a,b) -> raise (ScioptSMapSolver_error "unsupported:or")
                  ) exported_expr
              | SMVCoverTime(min,max) ->
                List.iter (fun expr ->
                    if opt_use_cover then
                      qall (time_cstr_to_sciopt expr min max)
                  ) [best_expr]
              | _ -> ()
              
            ); 
          (*maximize speed*)
          ()
        ) disjoint;
      SET.iter ctx.sts (fun st -> match st with
          | SMVCover(sc,off,hwival,mival) ->
            if opt_use_cover then
            qall (cover_cstr_to_sciopt sc off hwival mival)
        );
      QUEUE.to_list sts 



  let get_standard_model : (int,float) map -> (int,float) map =
    fun mp -> mp

end
