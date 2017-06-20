open HWData;;
open HWLib;;
open SMapData;;
open Util;;
open SolverData;;

open IntervalLib;;

open Z3Data;;
open Z3Lib;;

open SMapHwConfigGen;;
open SMapData;;

exception SMapSolver_error of string

module SMapSolver =
struct

  type map_problem = SMapHwConfigGen.cfggen_prob

  let rec map_expr_to_z3_expr : map_expr -> z3expr =
    fun expr -> match expr with
      | SEVar(SMFreeVar(idx)) -> Z3Var("x"^(string_of_int idx))
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
      let decls : z3st list = List.map (fun idx ->
          Z3ConstDecl("x"^(string_of_int idx), Z3Real)
        ) (LIST.mkrange 0 prob.n)
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
              Printf.printf "%s | %s \n"
                (IntervalLib.interval2str hwival)
                (IntervalLib.interval2str mival);
              let hmin, hmax = IntervalLib.interval2numbounds hwival in
              let mmin, mmax = IntervalLib.interval2numbounds mival in
              let max_cover = Z3LTE(Z3Plus(Z3Mult(scvar,Z3Real mmax),ofvar),Z3Real hmax) in
              let min_cover = Z3GTE(Z3Plus(Z3Mult(scvar,Z3Real mmin),ofvar),Z3Real hmin) in
              Z3Assert(min_cover)::Z3Assert(max_cover)::cstrs
            ) cover_cstrs
        ) []
      in
      (*TODO: speed statement, sampling statement, diffeq synchro statement, coverage*)
      decls @ eq_stmts @ neq_stmts @ cover_stmts 

  let compute_transform : gltbl -> map_problem -> int ->
    (wireid, linear_transform) map option=
    fun tbl config compute_time ->
      let z3prob :z3st list = map_problem_to_z3 config in
      let sln : z3sln = Z3Lib.exec "map" z3prob compute_time true in
      None

  let compute_transform_exists : gltbl -> map_problem -> int -> bool =
    fun tbl config compute_time ->
      match compute_transform tbl config compute_time with
      | Some(_) -> true
      | _ -> false

end
