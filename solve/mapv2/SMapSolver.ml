open HWData;;
open HWLib;;
open SMapData;;
open Util;;
open SolverData;;
open MathData;;

open IntervalLib;;

open Z3Data;;
open Z3Lib;;

open SMapHwConfigGen;;
open SMapData;;

exception SMapSimplifier_error of string
exception SMapSolver_error of string

module SMapSimplifier =
struct

  (*given a predicate, remove the following expressions, and replace with an expression*)
  

  
  
  type simpl_z3expr =
    | SZ3Equiv of z3expr list
    | SZ3And of simpl_z3expr*simpl_z3expr
    | SZ3Predicate of z3expr*simpl_z3expr*simpl_z3expr


  type simpl_route =
    | SRMatched
    | SRKeep
    | SRPattern

  type simpl_part = (simpl_route,z3expr list) map


  let xform_route : simpl_part -> simpl_route -> z3expr -> unit =
    fun part route term ->
      begin
        if MAP.has part route  = false then
          noop (MAP.put part route []);
        let args = MAP.get part route in
        MAP.put part route (term::args);
        ()
      end

  let xform_mk_partition : unit -> simpl_part =
    fun () ->
      MAP.make ()

  let xform_get_partition : simpl_part -> simpl_route -> z3expr list =
    fun part route ->
      if MAP.has part route then
        MAP.get part route
      else
        []

  let xform_get_min_term : z3expr list -> z3expr =
    fun terms ->
      let sorted = LIST.sort2 (fun (x:z3expr) -> match x with
          | Z3Number(_) -> 0  
          | Z3Var(_) -> 1 | _ -> 2) terms SortAscending
      in
      match sorted with
      | h::t -> h
      | [] ->
        raise (SMapSimplifier_error "unexpected: no min terms.")


  let xform_is_basic : z3expr -> bool =
    fun term ->
      match term with
      | Z3Number(_) -> true 
      | Z3Var(_) -> true
      | _ -> false

  let xform_rewrite_is_applicable : simpl_part -> int -> bool =
    fun router min ->
      List.length (xform_get_partition router SRPattern) < min

  (*determine which equivalence *)
  let xform_power_with_matching_base : z3expr list -> z3expr -> z3expr -> simpl_z3expr option=
    fun equivs this_base this_exp ->
      (*determine the corresponding exponent*)
      let repl_exp : z3expr ref = REF.mk this_exp in
      let router = xform_mk_partition () in
      LIST.iter (
          fun (x:z3expr) ->
            let exp = match x with
              | Z3Power(b,e) -> if b = this_base then Some e else None
              | expr -> if this_base = expr
                then Some (Z3Number (Integer 1)) else None
            in
            match exp with
            | Some(expr) ->
              begin
                if xform_is_basic x  then
                  xform_route router SRKeep x
                else
                  xform_route router SRMatched x;
                xform_route router SRPattern expr
              end
            | None ->
              begin
                  xform_route router SRKeep x
              end
      ) equivs;
      (*you need two to tango. *)
      if xform_rewrite_is_applicable router 2 then None
      else
        begin
          let terms : z3expr list =  List.map (fun (exp:z3expr)  ->
              let expr : z3expr = 
                match exp with
                | Z3Number(n) ->
                  if NUMBER.eq_int n 0 then
                    Z3Number(Integer 1)
                  else if NUMBER.eq_int n 1 then
                    this_base
                  else
                    Z3Power(this_base,exp)
                | _ ->
                  Z3Power(this_base,exp)
              in
              expr
            ) (xform_get_partition router SRPattern)
          in
          let min_term = xform_get_min_term terms in
          let pred = (Z3Eq(this_base,Z3Number (Integer 0))) in
          Some(
              SZ3Predicate(
                pred,
                SZ3Equiv(Z3Number(Integer 0)::
                         (xform_get_partition router SRKeep)),
                SZ3And(
                  SZ3Equiv(min_term::(xform_get_partition router SRKeep)),
                  SZ3Equiv(xform_get_partition router SRPattern)
                )
                
              )
            )
        end

      

     
  let rewrite_equiv : z3expr list -> z3expr -> simpl_z3expr option =
    fun equivs expr ->
      match expr with
      | Z3Power(base,exp) ->
        (*b^1 -> b *)
        xform_power_with_matching_base equivs base exp  
      | _ -> None


  let rewrite_equivs: z3expr list -> simpl_z3expr option =
    fun equivs -> 
      LIST.fold equivs (fun expr rewrite -> match rewrite with
          | Some(_) -> rewrite
          | None -> rewrite_equiv equivs expr
        ) None

  let rec rewrite_simpl_z3expr : simpl_z3expr -> simpl_z3expr =
    fun simpl_expr ->
      let rewritten = REF.mk false in
      let rec _work sz3 = match sz3 with
        | SZ3Equiv(cls) ->
          begin
            match rewrite_equivs cls with
            | Some(new_expr) ->
              begin
                REF.upd rewritten (fun _ -> true);
                new_expr
              end
            | None -> sz3
          end

        | SZ3Predicate(p,is_true,is_false) ->
          let new_is_true = _work is_true
          and new_is_false = _work is_false
          in
          SZ3Predicate(p,
                       new_is_true,
                       new_is_false
                      )

        | SZ3And(clause1,clause2) ->
          let new_clause1 = _work clause1
          and new_clause2 = _work clause2
          in
          SZ3And(
            new_clause1, new_clause2
          )
      in
      let new_simpl_expr = _work simpl_expr in
      if REF.dr rewritten = false then simpl_expr
      else
        begin
          Printf.printf "> rewrite expressions\n";
          rewrite_simpl_z3expr new_simpl_expr
        end


  let simplify : (int, z3expr set) map ->  (simpl_z3expr) list =
    fun eq ->
      MAP.map eq (fun xid (equiv:z3expr set) ->
          let varexpr = Z3Var("x"^(string_of_int xid)) in 
          let equivs =
            SET.fold equiv (fun x rest -> x::rest)
              [varexpr]
          in
          rewrite_simpl_z3expr (SZ3Equiv(equivs))
          (*SZ3Equiv(equivs)*)
        )


  let expand : simpl_z3expr -> z3st list =
    fun simpl_expr ->
      let rec _work : z3expr list -> simpl_z3expr -> z3st list =
        fun preds sexpr ->
          let pred_expr_maybe = match preds with
            | h::t -> Some (Z3Lib.and_all preds)
            | [] -> None
          in
          match sexpr with
          | SZ3Equiv(h::h2::t) ->
            let lst = h::h2::t in
            LIST.diag_fold lst (fun expr1 expr2 rest ->
                if expr1 != expr2 then
                  begin
                    match pred_expr_maybe with
                    | Some(pred_expr) ->
                      Z3Assert(Z3IfThenElse(
                          pred_expr,
                          Z3Eq(expr1,expr2),
                          Z3Bool(true)
                        ))::rest

                    | None ->
                      Z3Assert(Z3Eq(expr1,expr2))::rest
                  end
                else
                  rest
              ) []

          | SZ3Equiv([h]) ->
            []

          | SZ3And(e1,e2) ->
            (_work preds e1) @ (_work preds e2)

          | SZ3Predicate(p,e1,e2) ->
            (_work (p::preds) e1) @ (_work (Z3Not(p)::preds) e2)
        
    in
    _work [] simpl_expr 

end

module SMapSolver =
struct

  type map_problem = SMapHwConfigGen.cfggen_prob

  let vmax = 1e6;;
  let vmin = 0. -. vmax;;

  let rec xid_to_z3_var : int -> string =
    fun idx ->
      "x"^(string_of_int idx)

  let z3_var_to_xid : string -> int =
        fun name ->
          int_of_string (STRING.removeprefix name "x")

  let rec map_expr_to_z3_expr : map_expr -> z3expr =
    fun expr -> match expr with
      | SEVar(SMFreeVar(idx)) -> Z3Var(xid_to_z3_var idx)
      | SENumber(i) -> Z3Number(i)
      | SEAdd(a,b) -> Z3Plus(map_expr_to_z3_expr a, map_expr_to_z3_expr b)
      | SESub(a,b) -> Z3Sub(map_expr_to_z3_expr a, map_expr_to_z3_expr b)
      | SEMult(a,b) -> Z3Mult(map_expr_to_z3_expr a, map_expr_to_z3_expr b)
      | SEDiv(a,b) -> Z3Div(map_expr_to_z3_expr a, map_expr_to_z3_expr b)
      | SEPow(a,b) -> Z3Power(map_expr_to_z3_expr a, map_expr_to_z3_expr b)

  let number_to_z3_expr : number -> z3expr =
    fun num -> match num with
      | Integer(i) -> Z3Number(Integer i)
      | Decimal(i) -> Z3Number(Decimal i)

  let map_problem_to_z3 : (map_problem) -> z3st list =
    fun prob ->
      let equiv_stmts : (int, z3expr set) map = MAP.make() in
      let get_equiv_class : int -> z3expr set =
        fun xid  -> if MAP.has equiv_stmts xid then
            MAP.get equiv_stmts xid
          else
            let s = SET.make_dflt () in
            MAP.put equiv_stmts xid s;
            s
      in
      (*Add expression equivalence*)
      MAP.iter prob.mapexpr_to_xid (fun (mapinst,mapexpr) xid ->
          let xidexpr = SMapHwConfigGen.map_expr_to_xid_expr prob mapinst mapexpr in
          let xidz3expr : z3expr =
            Z3Lib.simplify (map_expr_to_z3_expr xidexpr)
          in
          let xidequiv = get_equiv_class xid in
          SET.add xidequiv xidz3expr;
          ()
        );
      (*Add numerical equivalence*)
      MAP.iter prob.xid_to_number (fun xid number ->
          let xidequiv = get_equiv_class xid in
          SET.add xidequiv (number_to_z3_expr number);
          ()
        );

      
      (*force finite declarations*)
      let decls : z3st list = List.fold_right (fun (idx:int) (stmts:z3st list) ->
          let varname = xid_to_z3_var idx in
          let decl = Z3ConstDecl(varname , Z3Real) in
          let sane =
            Z3Assert(Z3And(
                Z3LTE(Z3Var varname,Z3Number (Decimal vmax)),
                Z3GTE(Z3Var varname,Z3Number (Decimal vmin))
              ))
          in
          decl::sane::stmts
        ) (LIST.mkrange 0 prob.n) []
      in
      let simpl_equiv : SMapSimplifier.simpl_z3expr list=
        SMapSimplifier.simplify equiv_stmts 
      in
      let eq_stmts : z3st list = LIST.fold simpl_equiv
          (fun simpl_expr rest ->
             (SMapSimplifier.expand simpl_expr) @ rest
          ) []
      in
      let neq_stmts : z3st list = MAP.map prob.xid_neq_number (fun idx nums ->
          let varb = map_expr_to_z3_expr (SEVar(SMFreeVar(idx))) in
          let exprlst = SET.map nums (fun n ->
              Z3Not(Z3Eq(varb,number_to_z3_expr n))
            )
          in
          Z3Assert(Z3Lib.and_all (exprlst))
        )
      in
      (*TODO: put back coverage statements*)
      let cover_stmts = MAP.fold prob.xid_cover (fun (scid,ofid) (ivals) cover_cstrs ->
          let scvar = map_expr_to_z3_expr (SEVar(SMFreeVar(scid))) in
          let ofvar = map_expr_to_z3_expr (SEVar(SMFreeVar(ofid))) in
          SET.fold ivals (fun (hwival, mival) cstrs ->
              let hmin =  number_to_z3_expr hwival.min
              and hmax = number_to_z3_expr hwival.max in
              let mmin =  number_to_z3_expr mival.min
              and mmax = number_to_z3_expr mival.max in
              let max_cover =
                Z3And(
                  Z3LTE(Z3Plus(Z3Mult(scvar,mmax),ofvar),hmax),
                  Z3GTE(Z3Plus(Z3Mult(scvar,mmax),ofvar),hmin)
                )
              in
              let min_cover =
                Z3And(
                  Z3GTE(Z3Plus(Z3Mult(scvar,mmin),ofvar),hmin),
                  Z3LTE(Z3Plus(Z3Mult(scvar,mmin),ofvar),hmax)
                ) 
              in
              Z3Assert(min_cover)::Z3Assert(max_cover)::cstrs
            ) cover_cstrs
        ) []
      in
      let time_const_stmts :z3st list = match prob.tc_to_xid with
        | Some(tc_xid) ->
          let tc_var = Z3Var (xid_to_z3_var tc_xid) in
          SET.fold prob.xid_time (fun (tmin_maybe,tmax_maybe) asserts ->
              match tmin_maybe, tmax_maybe with
              | Some(tmin),Some(tmax) ->
                  Z3Assert(Z3LTE(tc_var,number_to_z3_expr tmax))::
                  Z3Assert(Z3LTE(number_to_z3_expr tmin,tc_var))::
                  asserts

              | Some(tmin),None ->
                  Z3Assert(Z3LTE(number_to_z3_expr tmin,tc_var))::
                  asserts

              | None,Some(tmax) ->
                  Z3Assert(Z3LTE(tc_var,number_to_z3_expr tmax))::
                  asserts

              | _ -> asserts
            ) []
        | None -> []
      in
      (*TODO: speed statement, sampling statement, diffeq synchro statement, coverage*)
      decls @ eq_stmts @ neq_stmts @ cover_stmts @ time_const_stmts 
        

  let parse_sln : (string,mid) sln -> map_hw_spec -> map_problem -> z3assign list -> (wireid, linear_transform) map =
    fun sln mapspec prob asgns ->
      let xid_to_val : (int,number) map= MAP.make () in 
      List.iter (fun asgn -> match asgn with
          | Z3Set(varname,qty) ->
            let xid = z3_var_to_xid varname in
            begin
              match qty with
              | Z3QInt(i) ->
                MAP.put xid_to_val xid (Integer i)
              | Z3QFloat(f) ->
                MAP.put xid_to_val xid (Decimal f)
              | Z3QInterval(Z3QRange(min,max)) ->
                MAP.put xid_to_val xid (Decimal (MATH.mean [min;max]))
              (*anything with infinity is basically a don't care.*)
              | Z3QInterval(Z3QAny) ->
                MAP.put xid_to_val xid (Integer 0)
              | Z3QInterval(Z3QInfinite(QDNegative)) ->
                MAP.put xid_to_val xid (Decimal vmin)
              | Z3QInterval(Z3QInfinite(QDPositive)) ->
                MAP.put xid_to_val xid (Decimal vmax)
              (*if the interval has a lower or upper bound, set value to lower or upper bound*)
              | Z3QInterval(Z3QLowerBound(b)) ->
                MAP.put xid_to_val xid (Decimal b)
              | Z3QInterval(Z3QUpperBound(b)) ->
                MAP.put xid_to_val xid (Decimal b)
              | Z3QBool(_) ->
                raise (SMapSolver_error "unexpected: boolean datatype")

            end;
            ()
        ) asgns;
      let wire_to_mapping : (wireid,linear_transform) map = MAP.make () in
      let add_mapping : hwcompinst -> string -> unit =
        fun inst port ->
          let get_val inst map_var =
            if MAP.has prob.mapvar_to_xid (inst,map_var) then
              let xid = MAP.get prob.mapvar_to_xid (inst,map_var) in
              if MAP.has xid_to_val xid then
                MAP.get xid_to_val xid
              (* if unset, it doesn't matter and is given a value of zero.*)
              else
                Integer 0 
            else
              raise (SMapSolver_error ("cannot find xid for "^(SMapVar.to_string map_var)))
          in
          let wire : wireid = {comp=inst;port=port} in
          let scval:number= get_val inst (SMScale port) in
          let ofval:number = get_val inst (SMOffset port) in
          let linear_trans : linear_transform = 
            {
              scale=float_of_number scval;
              offset=float_of_number ofval
            }
          in
          noop (MAP.put wire_to_mapping wire linear_trans)
      in
      SET.iter sln.comps (fun (inst:hwcompinst) ->
          let spec : map_comp = MAP.get mapspec.comps inst.name in
          MAP.iter spec.inputs (fun port _ ->
              add_mapping inst port 
            );
          MAP.iter spec.outputs (fun port _ ->
              add_mapping inst port
            )
        );
      Printf.printf "=== Mappings ===\n%s\n=======\n"
        (SLinearTransform.map_to_string wire_to_mapping);
      wire_to_mapping

  let compute_transform : gltbl ->  map_problem -> int ->
    (wireid, linear_transform) map option=
    fun tbl prob compute_time ->
      let z3prob :z3st list = map_problem_to_z3 prob in
      let mapsln : z3sln = Z3Lib.exec "map" z3prob compute_time true in
      match mapsln.model with
      | Some(model) ->
        Some (parse_sln tbl.sln_ctx tbl.map_ctx prob model)
      | None -> None

  let compute_transform_exists : gltbl -> map_problem -> int -> bool =
    fun tbl prob compute_time ->
      match compute_transform tbl prob compute_time with
      | Some(_) -> true
      | _ -> false

end
