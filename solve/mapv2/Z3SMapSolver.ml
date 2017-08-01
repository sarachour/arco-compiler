open Util;;

open SMapHwConfigGen;;
open SMapData;;
open SMapSolverData;;

open Z3Data;;
open Z3Lib;;

open HWData;;
open HWLib;;
open MathData;;


exception Z3SMapSolver_error of string
module Z3SMapSolver =
struct

  let options = MAP.make ();;
  MAP.put options "use-cover" true;;

  
  let set_option : string -> bool -> unit =
    fun key v ->
      noop (MAP.put options key v)

  let get_option : string -> bool =
    fun key ->
      MAP.get options key

  let rec xid_to_z3_var : int -> string =
    fun idx ->
      "x"^(string_of_int idx)

  let z3_var_to_xid : string -> int =
        fun name ->
          int_of_string (STRING.removeprefix name "x")

  let rec xid_expr_to_z3_expr : map_expr -> z3expr =
    fun expr -> match expr with
      | SEVar(SMFreeVar(idx)) -> Z3Var(xid_to_z3_var idx)
      | SENumber(i) -> Z3Number(i)
      | SEAdd(a,b) -> Z3Plus(xid_expr_to_z3_expr a, xid_expr_to_z3_expr b)
      | SESub(a,b) -> Z3Sub(xid_expr_to_z3_expr a, xid_expr_to_z3_expr b)
      | SEMult(a,b) -> Z3Mult(xid_expr_to_z3_expr a, xid_expr_to_z3_expr b)
      | SEDiv(a,b) -> Z3Div(xid_expr_to_z3_expr a, xid_expr_to_z3_expr b)
      | SEPow(a,b) -> Z3Power(xid_expr_to_z3_expr a, xid_expr_to_z3_expr b)

  let number_to_z3_expr : number -> z3expr =
    fun num -> match num with
      | Integer(i) -> Z3Number(Integer i)
      | Decimal(i) -> Z3Number(Decimal i)

  let z3st_decl_xid : int -> cfggen_mapvar list -> z3st list =
    fun idx mappings ->
      let varname = xid_to_z3_var idx in
      let decl = Z3ConstDecl(varname , Z3Real) in
      let s_max_float = 1e10 in
      let s_min_float = 1e-100 in
      let not_too_large =
        Z3Assert(Z3And(
            Z3LTE(Z3Var varname,Z3Number(Decimal s_max_float)),
            Z3GTE(Z3Var varname,Z3Number(Decimal (0.-.s_max_float)))
          ))
      in
      let comment =
        Z3Comment(LIST.tostr SMapCfggenCtx.string_of_mapvar ", " mappings)
      in
      (*not part of constraint problem.*)
      Z3Comment("")::comment::decl::not_too_large::[]

  let cover_cstr_to_z3 : int->int-> map_range -> map_range -> z3st list =
    fun scale_xid offset_xid hwival mival ->
      let scvar = Z3Var (xid_to_z3_var scale_xid) in
      let ofvar = Z3Var (xid_to_z3_var offset_xid) in
      let hmin =  number_to_z3_expr hwival.min
      and hmax = number_to_z3_expr hwival.max in
      let mmin =  number_to_z3_expr mival.min
      and mmax = number_to_z3_expr mival.max in
      if not (NUMBER.eq mival.min mival.max)  then
        begin
          let max_cover =
            Z3And(
              Z3LTE(Z3Plus(Z3Mult(scvar,mmax),ofvar),hmax),
              Z3GTE(Z3Plus(Z3Mult(scvar,mmax),ofvar),hmin)
            )
          in
          let min_cover =
            Z3And(
              Z3LTE(Z3Plus(Z3Mult(scvar,mmin),ofvar),hmax),
              Z3GTE(Z3Plus(Z3Mult(scvar,mmin),ofvar),hmin)
            ) 
          in
          Z3Comment("cover cstr")::Z3Assert(min_cover)::Z3Assert(max_cover)::[]
        end
        
      else
        begin
          let num_cover =
            Z3And(
              Z3GTE(Z3Plus(Z3Mult(scvar,mmin),ofvar),hmin),
              Z3LTE(Z3Plus(Z3Mult(scvar,mmax),ofvar),hmax)
            ) 
          in
          Z3Comment("cover cstr")::Z3Assert(num_cover)::[]
        end
                

  
  let time_cstr_to_z3 : z3expr -> number option -> number option -> z3st list =
    fun expr tmin_maybe tmax_maybe ->
        begin
          match tmin_maybe, tmax_maybe with
          | Some(tmin),Some(tmax) ->
            Z3Comment("time cstr")::
            Z3Assert(Z3LTE(expr,number_to_z3_expr tmax))::
            Z3Assert(Z3LTE(number_to_z3_expr tmin,expr))::
            []


          | Some(tmin),None ->
            Z3Comment("time cstr")::
            Z3Assert(Z3LTE(number_to_z3_expr tmin,expr))::
            []

          | None,Some(tmax) ->
            Z3Comment("time cstr")::
            Z3Assert(Z3LTE(expr,number_to_z3_expr tmax))::
            []

          | None,None -> [] 
        end



  let slvr_bin_to_z3expr : (mapslvr_bin) -> z3expr option =
    fun bin ->
      match bin with
      | SMVMapVar(id) ->
        Some (Z3Var(xid_to_z3_var id))
                
      | SMVMapExpr(mapexpr) ->
        Some (xid_expr_to_z3_expr mapexpr)

      | _ ->
        None


  let slvr_bin_is_time_const : (mapslvr_bin) -> bool = 
    fun bin -> match bin with
      | SMVTimeConstant -> true
      | _ -> false

  let slvr_ctx_to_z3 : (mapslvr_ctx) -> (z3st list) =
    fun slvr_ctx ->
      let eps = Decimal 1e-20 in
      let neg_eps = Decimal (-1e-20) in
      let decls = QUEUE.make() in
      let cover = QUEUE.make() in
      let time_cover = QUEUE.make() in
      let equals = SET.make_dflt() in
      let not_equals = SET.make_dflt() in
      let bin_set = GRAPH.disjoint slvr_ctx.bins in
      let opt_use_cover = get_option "use-cover" in
      MAP.iter slvr_ctx.xidmap (fun id mappings ->
          noop (QUEUE.enqueue_all decls (z3st_decl_xid id mappings));
        );
      List.iter (fun (bins:mapslvr_bin set) ->
          let is_tc = REF.mk false in
          let exported_expr =
            SET.fold bins (fun bin exported ->
                (*update tc variable*)
                REF.upd is_tc (fun v -> v || slvr_bin_is_time_const bin);
                (*determine if exportable*)
                if SMapSlvrCtx.is_node_exported slvr_ctx bin then
                  match slvr_bin_to_z3expr bin with
                  | Some(expr) -> expr::exported
                  | None -> exported
                else
                  exported
              ) []
          in
          let best_expr = LIST.min exported_expr
              (fun z3expr -> String.length (Z3Lib.z3expr2str z3expr))
          in
          (*equivalence constraints*)
          LIST.diag_iter (SET.to_list bins) (fun bin1 bin2 ->
              if SMapSlvrCtx.is_edge_exported slvr_ctx bin1 bin2 &&
                 SMapSlvrCtx.is_node_exported slvr_ctx bin1 &&
                 SMapSlvrCtx.is_node_exported slvr_ctx bin2
              then
                let expr1_maybe = slvr_bin_to_z3expr bin1 in
                let expr2_maybe = slvr_bin_to_z3expr bin2 in
                match expr1_maybe, expr2_maybe with
                | Some(expr1),Some(expr2) ->
                  noop (SET.add equals (Z3Assert(Z3Eq(expr1,expr2))))
                | _ -> ()
            );
          SET.iter bins (fun (bin:mapslvr_bin) ->
              match bin with
              | SMVOp(op,_) ->
                let ineqs = List.map (
                    fun expr ->
                      match op with
                      | SCNEQ(n) ->
                        Z3Assert(
                          Z3Or(
                            Z3LTE(expr,number_to_z3_expr (NUMBER.add n neg_eps)),
                            Z3GTE(expr,number_to_z3_expr (NUMBER.add n eps))
                          )
                        )
                      | SCGTE(n) ->
                        Z3Assert(Z3GTE(expr,number_to_z3_expr n ))

                      | SCLTE(n) ->
                        Z3Assert(Z3LTE(expr,number_to_z3_expr n))

                      | SCGT(n) ->
                        Z3Assert(Z3GTE(expr,number_to_z3_expr
                                         (NUMBER.add n eps)
                                      ))

                      | SCLT(n) ->
                        Z3Assert(Z3LTE(expr,number_to_z3_expr
                                         (NUMBER.add n neg_eps)
                                      ))

                  ) [best_expr] 
                in
                  noop (SET.add_all not_equals ineqs)
                    
              | SMVCoverTime(min,max) ->
                List.iter (
                  fun expr ->
                    if opt_use_cover then
                      noop (QUEUE.enqueue_all time_cover (time_cstr_to_z3 expr min max))
                ) [best_expr]
              | _ -> ()
            );
        ) bin_set;
      SET.iter slvr_ctx.sts (fun st -> match st with
          | SMVCover(sc,off,hwival,mival) ->
            let sts = cover_cstr_to_z3 sc off hwival mival in
            if opt_use_cover then
              noop (QUEUE.enqueue_all cover sts)
        );
      let problem =
        (QUEUE.to_list decls) @
        [Z3Comment("");Z3Comment("== Equivalences==")] @
        (SET.to_list equals) @
        [Z3Comment("");Z3Comment("== Not Equals==")] @
        (SET.to_list not_equals) @
        [Z3Comment("");Z3Comment("== Covers ==")] @
        (QUEUE.to_list cover) @
        [Z3Comment("");Z3Comment("== Time ==")] @
        (QUEUE.to_list time_cover)
      in
      (problem)


  let slvr_ctx_to_z3_validate : mapslvr_ctx -> (int,float) map -> float -> z3st list =
    fun ctx sln prec ->
      let base_prob = slvr_ctx_to_z3 ctx in
      let delta = prec /. 2.0 in
      let neg_delta = 0.0 -. delta in
      let sts = MAP.fold sln (fun idx value rest ->
          if MAP.has ctx.xidmap idx then
            let value =
              if value >= neg_delta && value <= delta then
                0.0 else value
            in
            Z3Assert(Z3LTE(
                  Z3Var (xid_to_z3_var idx),
                  Z3Number
                    (NUMBER.from_float  (value +. delta))
                ))::
              Z3Assert(Z3GTE(
                  Z3Var (xid_to_z3_var idx),
                  Z3Number
                    (NUMBER.from_float  (value -. delta))
                ))
              ::rest
          else
            rest
        ) []
      in
      let prob =  base_prob @ Z3Comment("==== Validate ===")::sts in
      prob


  type z3map_partial =
    | Z3MPNoScale 
    | Z3MPNoOffset
    | Z3MPPositiveOffset
    | Z3MPPositiveScale


  (*partially constrain*)
  let mkpartial_constrain_unsat_cover : mapslvr_ctx -> z3st list -> (int,float) map -> float -> z3st list =
    fun ctx base_prob assigns ctol ->
      let violates_cover hwival mival =
        mival.min < hwival.min || mival.max > hwival.max
      in
      let opt_use_cover = get_option "use-cover" in
      let sts = QUEUE.make () in
      let q x = noop (QUEUE.enqueue sts x) in
      q (Z3Comment("=== Partial UNSAT Cstr ===="));
      (*constrain any cover assignments that are obviously violated*)
      SET.iter ctx.sts (fun st -> match st with
          | SMVCover(sc,off,hwival,mival) ->
            if opt_use_cover && violates_cover hwival mival then
              begin
                let sc_val = MAP.get assigns sc and off_val = MAP.get assigns off in
                q (Z3Comment(Printf.sprintf "@tune %s" (xid_to_z3_var sc)));
                q (Z3Assert(Z3GTE(
                    Z3Var (xid_to_z3_var sc),
                    Z3Number (Decimal (sc_val -. ctol) )
                  )));
                q (Z3Comment(Printf.sprintf "@tune %s" (xid_to_z3_var sc)));
                q (Z3Assert(Z3LTE(
                    Z3Var (xid_to_z3_var sc),
                    Z3Number (Decimal (sc_val +. ctol) )
                  )));
                q (Z3Comment(Printf.sprintf "@tune %s" (xid_to_z3_var off)));
                q (Z3Assert(Z3GTE(
                    Z3Var (xid_to_z3_var off),
                    Z3Number (Decimal (off_val -. ctol))
                  )));
                q (Z3Comment(Printf.sprintf "@tune %s" (xid_to_z3_var off)));
                q (Z3Assert(Z3LTE(
                    Z3Var (xid_to_z3_var off),
                    Z3Number (Decimal (off_val +. ctol))
                  )));
              end
        );
      base_prob @ (QUEUE.to_list sts)

  let mkpartial_constrain_domain : mapslvr_ctx -> z3st list ->  z3map_partial list -> z3st list =
    fun ctx base_prob partial_cfg ->
      let covers_to_sts: (int->int->map_range ->map_range -> 'a option) -> 'a list =
        fun fn ->
          SET.fold ctx.sts (fun cstr rest -> match cstr with
              | SMVCover(scid,ofid,mival,hival) ->
                begin
                  match fn scid ofid mival hival with
                  | Some(res) -> res::rest
                  | None -> rest
                end
            ) []
      in
      let partial_to_sts cfg =
        match cfg with
        | Z3MPNoScale ->
          let sts = covers_to_sts
              (fun sc_id off_id math_range hw_range ->
                 Some(Z3Assert(
                     Z3Eq(Z3Var (xid_to_z3_var sc_id), Z3Number (Integer 1))
                   ))
                 
              )
          in
          sts

        | Z3MPNoOffset ->
          let sts = covers_to_sts
              (fun sc_id off_id math_range hw_range ->
                 Some(Z3Assert(
                     Z3Eq(Z3Var (xid_to_z3_var off_id), Z3Number (Integer 0))
                   ))
                 
              )
          in
          sts

        | Z3MPPositiveOffset ->
          let sts = covers_to_sts
              (fun sc_id off_id math_range hw_range ->
                 Some(Z3Assert(
                     Z3GTE(Z3Var (xid_to_z3_var off_id), Z3Number (Integer 0))
                   ))
              )
          in
          sts

        | Z3MPPositiveScale ->
          let sts = covers_to_sts
              (fun sc_id off_id math_range hw_range ->
                 Some(Z3Assert(
                     Z3GTE(Z3Var (xid_to_z3_var sc_id), Z3Number (Integer 0))
                   ))
              )
          in
          sts

      in
      List.fold_right (fun cfg rest -> rest @ (partial_to_sts cfg)) partial_cfg base_prob 


  let get_standard_model : z3assign list -> (int,float) map =
    fun asgns ->
      let  xid_to_val : (int,float) map= MAP.make () in
      List.iter (fun asgn -> match asgn with
          | Z3Set(varname,qty) ->
            let xid = z3_var_to_xid varname in
            begin
              match qty with
              | Z3QInt(i) ->
                MAP.put xid_to_val xid (float_of_int i)
              | Z3QFloat(f) ->
                MAP.put xid_to_val xid (f)
              | Z3QInterval(Z3QRange(min,max)) ->
                MAP.put xid_to_val xid ((MATH.max[min;max]))
              (*anything with infinity is basically a don't care.*)
              | Z3QInterval(Z3QAny) ->
                MAP.put xid_to_val xid (0.0)
              | Z3QInterval(Z3QInfinite(QDNegative)) ->
                MAP.put xid_to_val xid (SMapSlvrOpts.vmin)
              | Z3QInterval(Z3QInfinite(QDPositive)) ->
                MAP.put xid_to_val xid (SMapSlvrOpts.vmax)
              (*if the interval has a lower or upper bound, set value to lower or upper bound*)
              | Z3QInterval(Z3QLowerBound(b)) ->
                MAP.put xid_to_val xid (b)
              | Z3QInterval(Z3QUpperBound(b)) ->
                MAP.put xid_to_val xid (b)
              | Z3QBool(_) ->
                raise (Z3SMapSolver_error "unexpected: boolean datatype")

            end;
            ()
        ) asgns;
      xid_to_val
  

end

