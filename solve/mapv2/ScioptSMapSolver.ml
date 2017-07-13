open SMapData;;
open SMapSolverData;;

open ScipyOptimizeData;;

open HWData;;
open HWLib;;
open MathData;;

open Util;;

exception ScioptSMapSolver_error of string
module ScioptSMapSolver =
struct

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
          | SENumber(a) -> Printf.sprintf "%s" (string_of_number a)
      in
      _proc expr
  
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
      let hmin =  string_of_number hwival.min
      and hmax = string_of_number hwival.max in
      let mmin =  string_of_number mival.min
      and mmax = string_of_number mival.max in
      if not (NUMBER.eq mival.min mival.max)  then
        begin
          SCIComment("-> var cover constraints")::
          SCILTE(Printf.sprintf "%s*%s+%s" scvar mmax ofvar,hmax)::
          SCIGTE(Printf.sprintf "%s*%s+%s" scvar mmax ofvar,hmin)::
          SCILTE(Printf.sprintf "%s*%s+%s" scvar mmin ofvar,hmax)::
          SCIGTE(Printf.sprintf "%s*%s+%s" scvar mmin ofvar,hmin)::
          []

        end
        
      else
        begin
          SCIComment("-> number cover constraints")::
          SCILTE(Printf.sprintf "%s*%s+%s" scvar mmax ofvar,hmax)::
          SCIGTE(Printf.sprintf "%s*%s+%s" scvar mmin ofvar,hmin)::
          []
        end


  let get_nvars ctx =
    let _,maxval= LIST.max  float_of_int (MAP.keys ctx.xidmap)  in
    maxval + 1

  let to_scipy : mapslvr_ctx -> sciopt_st list =
    fun ctx ->
      let sts : sciopt_st queue = QUEUE.make () in
      let q x = noop (QUEUE.enqueue sts x ) in
      let qall x = noop (QUEUE.enqueue_all sts x ) in
      let disjoint = GRAPH.disjoint ctx.bins in
      let nvars = get_nvars ctx in
      let tol = 1e-15 and iters = 100 in
      q (SCIInitialize(tol,iters,nvars));
      q (SCIBound(SMapSlvrOpts.vmin, SMapSlvrOpts.vmax));
      MAP.iter ctx.xidmap (fun idx mapvars ->
          let init_guess = compute_guess mapvars in
          q (SCIInitGuess(idx,init_guess))
        );
      List.iter (fun (bins:mapslvr_bin set) ->
          let is_tc = REF.mk false in
          let cls : string list = SET.fold bins (fun bin rest -> match bin with
              | SMVMapVar(id) -> (xid_to_sciopt_expr id)::rest
              | SMVMapExpr(mapexpr) -> (xid_expr_to_sciopt_expr mapexpr)::rest
              | SMVTimeConstant -> ret (REF.upd is_tc (fun _ -> true)) rest
              | _ -> rest
            ) []
          in
          LIST.diag_iter cls (fun e1 e2  ->
              q (SCIEq(e1,e2))
            );
          SET.iter bins (fun (bin:mapslvr_bin) ->
              match bin with
              | SMVNeq(_,n) ->
                let nstr = string_of_number n in
                List.iter (fun expr ->
                    q (SCINeq(expr,nstr))
                  ) cls
              | SMVCoverTime(min,max) ->
                List.iter (fun expr ->
                    qall (time_cstr_to_sciopt expr min max)
                  ) cls
              | _ -> ()
              
            ); 
          (*maximize speed*)
          if REF.dr is_tc then
            q (SCIObjective(List.nth cls 0))
          else
            ()
        ) disjoint;
      SET.iter ctx.sts (fun st -> match st with
          | SMVCover(sc,off,hwival,mival) ->
            qall (cover_cstr_to_sciopt sc off hwival mival)
        );
      QUEUE.to_list sts 

  let parse_sln : (string,mid) sln -> map_hw_spec -> (int,cfggen_mapvar list) map
    -> float list -> (wireid, linear_transform) map =
    fun sln mapspec mapper asgns ->
      raise (ScioptSMapSolver_error "unimpl: parse_sln")
end
