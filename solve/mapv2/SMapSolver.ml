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

exception SMapSolver_error of string

module SMapSolver =
struct

  type map_problem = SMapHwConfigGen.cfggen_prob

  
  let rec xid_to_z3_var : int -> string =
    fun idx ->
      "x"^(string_of_int idx)

  let z3_var_to_xid : string -> int =
        fun name ->
          int_of_string (STRING.removeprefix name "x")

  let rec map_expr_to_z3_expr : map_expr -> z3expr =
    fun expr -> match expr with
      | SEVar(SMFreeVar(idx)) -> Z3Var(xid_to_z3_var idx)
      | SENumber(Integer i) -> Z3Int(i)
      | SENumber(Decimal i) -> Z3Real(i)
      | SEAdd(a,b) -> Z3Plus(map_expr_to_z3_expr a, map_expr_to_z3_expr b)
      | SESub(a,b) -> Z3Sub(map_expr_to_z3_expr a, map_expr_to_z3_expr b)
      | SEMult(a,b) -> Z3Mult(map_expr_to_z3_expr a, map_expr_to_z3_expr b)
      | SEDiv(a,b) -> Z3Div(map_expr_to_z3_expr a, map_expr_to_z3_expr b)
      | SEPow(a,b) -> Z3Power(map_expr_to_z3_expr a, map_expr_to_z3_expr b)

  let number_to_z3_expr : number -> z3expr =
    fun num -> match num with
      | Integer(i) -> Z3Int(i)
      | Decimal(i) -> Z3Real(i)

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
          let xidz3expr : z3expr = map_expr_to_z3_expr xidexpr in
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
          decl::stmts 
        ) (LIST.mkrange 0 prob.n) []
      in
      (*TODO: perform ordering and simplifications here*)
      let eq_stmts : z3st list = MAP.map equiv_stmts (fun idx exprs ->
          let varb = map_expr_to_z3_expr (SEVar(SMFreeVar(idx))) in
          let exprlst = SET.map exprs (fun expr -> Z3Eq(varb,expr))  in
          Z3Assert(Z3Lib.and_all (exprlst))
        )
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
              let max_cover = Z3LTE(Z3Plus(Z3Mult(scvar,mmax),ofvar),hmax) in
              let min_cover = Z3GTE(Z3Plus(Z3Mult(scvar,mmin),ofvar),hmin) in
              Z3Assert(min_cover)::Z3Assert(max_cover)::cstrs
            ) cover_cstrs
        ) []
      in
      (*TODO: speed statement, sampling statement, diffeq synchro statement, coverage*)
      decls @ eq_stmts @ neq_stmts @ cover_stmts 
        

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
              | Z3QInterval(Z3QInfinite(_)) ->
                MAP.put xid_to_val xid (Integer 0)
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
          let wire : wireid = {comp=inst;port=port} in
          let scid:int = MAP.get prob.mapvar_to_xid (inst,SMScale port) in
          let ofid:int = MAP.get prob.mapvar_to_xid (inst,SMOffset port) in
          let scval = MAP.get xid_to_val scid in
          let ofval = MAP.get xid_to_val ofid in
          let linear_trans : linear_transform = 
            {scale=float_of_number scval; offset=float_of_number ofval}
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
