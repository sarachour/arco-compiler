open Util

open ASTUnifyData
open ASTXUnify

open AST
open Interactive
open Globals

open HWData
open HWLib

open MathData
open MathLib


open SolverData
open SolverUtil
open SlnLib
open SolverCompLib

open IntervalData
open IntervalLib

open StochData
open StochLib

open Z3Data
open Z3Lib

open MapData
open MapUtil

open MapIntervalCompute
open MapNoiseCompute

exception MapSMTResolverError of string

let error n m = raise (MapSMTResolverError (n^":"^m))

let debug = print_debug 2 "map-rslv"

module MapSMTResolver =
struct

  type symtbl = {
    id2w: (int,wireid) map;
    w2id: (wireid,int) map;
  }
  let wire2id symtbl w : int=
    if MAP.has symtbl.w2id w then
      begin
        MAP.get symtbl.w2id w
      end
    else
      let id = MAP.size symtbl.w2id in 
      begin
        MAP.put symtbl.w2id w id;
        MAP.put symtbl.id2w id w;
        id
      end

  let id2wire symtbl id : wireid =
    MAP.get symtbl.id2w id

  let linearid2name symtbl x = match x with
    | (SVScaleVar(w)) ->
      let id = wire2id symtbl w in
      "sc_"^(string_of_int id)
    | (SVOffsetVar(w)) ->
      let id = wire2id symtbl w in
      "of_"^(string_of_int id)

  let linearsmtid2name symtbl x = match x with
    | SVLinVar(x) ->
      linearid2name symtbl x
    | SVSlackVar(SVMin,_,w,i) ->
      let id = wire2id symtbl w in
      "slbot_"^(string_of_int id)^"_"^(string_of_int i)
    | SVSlackVar(SVMax,_,w,i) ->
      let id = wire2id symtbl w in
      "sltop_"^(string_of_int id)^"_"^(string_of_int i)

  let name2linearsmtid symtbl x : linear_smt_id option=
    match STRING.split x "_" with
    | ["sc";id] ->
      let id = int_of_string id in
      let w = id2wire symtbl id in 
      Some (SVLinVar(SVScaleVar(w)))
    | ["of";id] ->
      let id = int_of_string id in
      let w = id2wire symtbl id in 
      Some (SVLinVar(SVOffsetVar(w)))
    | ["slbot";id;i] ->
      let id = int_of_string id in
      let w = id2wire symtbl id in 
      Some (SVSlackVar(SVMin,-1.0,w,int_of_string i))
    | ["sltop";id;i] ->
      let id = int_of_string id in
      let w = id2wire symtbl id in 
      Some (SVSlackVar(SVMax,-1.0,w,int_of_string i))
    | h::t -> None 
    | [] -> error "name2linearsmtid" ("empty string ")

  let z3result2mapping gltbl symtbl (asgns:z3assign list): (wireid,hw_mapping) map =
    let data = MAP.make () in
    let upd_map_result id fxn =
      if MAP.has data id = false then
        noop (MAP.put data id (MapUtil.mkhwmapping()));
        fxn (MAP.get data id)
    in
    let upd_map_result_of_id s f =
      let wire = match s with
      | Some(SVLinVar(SVOffsetVar(w))) ->
        upd_map_result w (fun x -> x.offset <- f); Some w

      | Some(SVLinVar(SVScaleVar(w))) ->
        upd_map_result w (fun x -> x.scale <- f); Some w

      | _ -> None
      in
      match wire with
      | Some(wire) ->
        let math_ival = IntervalCompute.compute_wire_label_interval gltbl wire in
        let math_expr = IntervalCompute.get_wire_label_expr gltbl wire in
        let hw_ival = IntervalCompute.compute_wire_interval gltbl wire in
        upd_map_result wire (fun x -> x.wire<- wire);
        begin
          match math_expr with
          | Some(expr) -> upd_map_result wire (fun x -> x.expr <- mast2uast expr)
          | _ -> ()
        end;
        upd_map_result wire (fun x -> x.mrng <- math_ival);
        upd_map_result wire (fun x -> x.hrng <- hw_ival);
        ()
      | None -> ()
    in
    (*create result map*)
    List.iter (fun asgn -> match asgn with
        | Z3Set(s,Z3QFloat(f)) ->
          let id = name2linearsmtid symtbl s in
          upd_map_result_of_id id f 
          
        | Z3Set(s,Z3QInt(f)) ->
          let id = name2linearsmtid symtbl s in
          upd_map_result_of_id id (float_of_int f)

        | Z3Set(s,Z3QInterval(Z3QRange(min,max))) ->
          let id = name2linearsmtid symtbl s in
          if MATH.cmp min max 1e-6  then
            upd_map_result_of_id id (max)
          else
            begin
            warn "z3result2mapsln" ("interval is not equal: "^
                  (string_of_float min)^" "^(string_of_float max));
            upd_map_result_of_id id (max)
            end
        | Z3Set(s,Z3QInterval(Z3QInfinite(dir))) -> 
                warn "z3result2mapsln" "interval is infinite"

        | Z3Set(s,Z3QInterval(_)) ->
          error "z3result2mapresult" "unhandled quantity:interval"
        | _ ->
          error "z3result2mapresult" "unhandled"
    ) asgns;
    MAP.iter data (fun wire data ->
        debug ("[MAP]>> "^MapUtil.hwmapping2str data);
        ()
      );
    data

  let to_z3prob stmts : (symtbl*z3st list*z3expr) =
    let tbl = {id2w=MAP.make();w2id=MAP.make()} in
    let slackvars : (string,float) map= MAP.make() in
    let stmtq = QUEUE.make () in
    let enq x = begin QUEUE.enqueue stmtq x; () end in
    let smtexpr_to_z3prob (s:linear_smt_id ast) :z3expr =
      match ASTLib.compute s with 
      | Some(f) -> Z3Real(f)
      | None -> Z3Lib.ast2z3 s (fun x -> Z3Var(linearsmtid2name tbl x))
    in
    let expr_to_z3prob (s:linear_id ast) :z3expr =
      match ASTLib.compute s with
      | Some(f) ->Z3Real(f)
      | None -> Z3Lib.ast2z3 s (fun x -> Z3Var(linearid2name tbl x))
    in
    let mkeq lst = match lst with
      | h::h2::t ->
        Z3Assert(Z3Lib.fn_all
                   (List.map (fun x -> Z3Eq(h,x))(h2::t))
                   (fun x y -> Z3And(x,y))
                )
      | [h] -> Z3Comment("removed single elem eq")
      | [] -> Z3Comment("removed zero elem eq")
    in
    let stmt_to_z3prob s = match s with
      | SVDeclMapVar(SVLinVar(SVScaleVar(x))) ->
        enq (Z3ConstDecl(linearid2name tbl (SVScaleVar x),Z3Real));
        enq (Z3Assert(Z3GT(Z3Var(linearid2name tbl (SVScaleVar x)),Z3Real(0.00000001))))

      | SVDeclMapVar(SVLinVar(SVOffsetVar(x))) ->
        enq (Z3ConstDecl(linearid2name tbl (SVOffsetVar x),Z3Real))

      | SVDeclMapVar(SVSlackVar(dir,weight,x,i)) ->
        let svar_name = linearsmtid2name tbl (SVSlackVar(dir,weight,x,i)) in
        MAP.put slackvars svar_name weight;
        enq (Z3ConstDecl(svar_name,Z3Real));
        begin
          begin
            match dir with
            | SVMin -> enq (Z3Assert(Z3LTE(Z3Var(svar_name),Z3Real(0.00000001))))
            | SVMax -> enq (Z3Assert(Z3GTE(Z3Var(svar_name),Z3Real(0.00000001))))
          end
        end

      | SVEquals(lst) ->
        let z3lst : z3expr list= List.map expr_to_z3prob lst in
        enq (Z3Comment "");
        enq (Z3Comment(MapUtil.linearstmt2str s));
        enq (mkeq (z3lst))

      | SVCoverGTE(lst) ->
        let z3lst : z3expr list= List.map smtexpr_to_z3prob lst in
        enq (Z3Comment "");
        enq (Z3Comment(MapUtil.linearstmt2str s));
        enq (Z3Assert(Z3Lib.fn_all z3lst (fun x y -> Z3GTE(x,y))))

      | SVCoverLTE(lst) ->
        let z3lst : z3expr list= List.map smtexpr_to_z3prob lst in
        enq (Z3Comment "");
        enq (Z3Comment(MapUtil.linearstmt2str s));
        enq (Z3Assert(Z3Lib.fn_all z3lst (fun x y -> Z3LTE(x,y))))

      | SVCoverEq(lst) ->
        let z3lst : z3expr list= List.map smtexpr_to_z3prob lst in
        enq (Z3Comment "");
        enq (Z3Comment(MapUtil.linearstmt2str s));
        enq (mkeq (z3lst))

      | SVLTE(a,b) ->
        let asmt = expr_to_z3prob a in
        let bsmt = expr_to_z3prob b in
        enq (Z3Assert(Z3LTE(asmt,bsmt)))

      | SVNoOffset(expr) ->
        let z3expr = expr_to_z3prob expr in 
        enq (Z3Comment "no offset");
        enq (Z3Assert(Z3Eq(z3expr,Z3Real(0.))))

      | SVNoScale(expr) ->
        let z3expr = expr_to_z3prob expr in 
        enq (Z3Comment "no scale");
        enq (Z3Assert(Z3Eq(z3expr,Z3Real(1.))))

    in
    (*traverse statements*)
    List.iter stmt_to_z3prob stmts;
    let z3stmts = QUEUE.to_list stmtq in 
    QUEUE.destroy stmtq;
    let absval (expr) =
      Z3IfThenElse(Z3GTE(expr,Z3Real(0.)),expr, Z3Neg(expr))
    in
    let z3minterms : z3expr list = MAP.map slackvars
        (fun svar weight ->
           absval(Z3Var(svar))
        )
    in
    match z3minterms with
    | h::h2::t ->
      tbl,z3stmts,(Z3Lib.fn_all z3minterms (fun x y -> Z3Plus(x,y)))
    | [stmt] ->
      tbl,z3stmts,stmt
    | [] ->
     tbl,z3stmts,Z3Int(0)

  let solvable (stmts:linear_stmt list) : bool =
      let tbl,stmts,minexpr = to_z3prob stmts in
      let sat= Z3Lib.sat "mapper" (stmts)  true in
      sat

  let solve gltbl (stmts:linear_stmt list) : (wireid,hw_mapping) map option =
    (*helper function*)
    let tbl,stmts,minexpr = to_z3prob stmts in
    let maxval = 999999999999999999999999999999. in 
    let result : z3sln =
      Z3Lib.minimize "mapper" (stmts) minexpr 0. maxval true in
    if result.sat then
      begin
      match result.model with
      | Some(model) ->
        begin
        let mappings = z3result2mapping gltbl tbl model in
        Some(mappings)
        end
      | None ->
        warn "solve" "no model";
        None
      end
    else
      begin
        warn "solve" "!!>> NO MODEL <!!";
        None
      end

  let save_z3_problem gltbl (stmts:linear_stmt list) name inst  =
    let tbl,stmts,minexpr = to_z3prob stmts in
    Z3Lib.save_z3_prob (name^"_"^(string_of_int inst)^"_map") stmts minexpr true 
end

