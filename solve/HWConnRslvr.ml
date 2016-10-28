open HWData
open Util


open Z3Lib
open Z3Data
open Interactive
open HWData
open SlnLib
open SolverData
open HWConnLib

exception HwConnRslvrLibError of string

let error n m = raise (HwConnRslvrLibError (n^":"^m))

let _print_debug = print_debug 2 "rslvr"
let debug = print_debug 2 "rslvr"
let _menu = menu 2
let _print_inter = print_inter 2

module HwConnRslvrLib =
struct
  (*concrete *)
  type symtbl = {
    wire2id: (wireid,int) map;
    id2wire: (int,wireid) map;
    comp2wire:(hwcompinst,wireid list) map;
  }

  let mk_symtbl () =
    {wire2id = MAP.make(); id2wire=MAP.make(); comp2wire=MAP.make()}

  let has_wire stbl (w:wireid) =
    MAP.has stbl.wire2id w

  let add_wire stbl (w:wireid) =
    if MAP.has stbl.wire2id w then
      ()
    else
      let id = (MAP.size stbl.wire2id) in
      MAP.put stbl.wire2id w id;
      MAP.put stbl.id2wire id w;
      let wires =
        if (MAP.has stbl.comp2wire w.comp) then
          MAP.get stbl.comp2wire w.comp
        else
          []
      in
      MAP.put stbl.comp2wire w.comp (w::wires);
      ()

  let wire2id stbl w =
    "w_"^(string_of_int (MAP.get stbl.wire2id w))

  let decl_wire stbl (w:wireid) :z3st =
    add_wire stbl w;
    let name = wire2id stbl w in
    Z3ConstDecl(name,Z3Int)
  
     
  (*assign an instance to each variable*)
  let inst2smt (e:hwinst_coll) (v:string) : z3expr = match e with
  | HCCAll -> (Z3Bool(true))
  | HCCRange(low,hi) -> Z3And(Z3LT(Z3Var(v),Z3Int(hi)), Z3GTE(Z3Var(v),Z3Int(low)))
  | HCCIndiv(i) -> Z3Eq(Z3Int(i),Z3Var(v))


  let to_smt_prob (gltbl:gltbl) =
    let hwenv : 'a hwenv= gltbl.env.hw in
    let sln : usln = gltbl.sln_ctx in
    (*create symbol table*)
    let tbl = mk_symtbl () in
    let stmtq = QUEUE.make() in
    let enq x = noop (QUEUE.enqueue stmtq x) in
    let comp2wire = MAP.make() in 
    (*all port connections from same component have same value*)
    SlnLib.iter_conns sln (fun (src:wireid) (dest:wireid) conn ->
        if has_wire tbl src = false then enq (decl_wire tbl src);
        if has_wire tbl dest = false then enq (decl_wire tbl dest);
        let src_id = wire2id tbl src in
        let dst_id = wire2id tbl dest in
        let instconns =
          HwConnLib.get_inst_conns hwenv src.comp.name src.port dest.comp.name dest.port
        in
        let clauses : z3expr list = List.map (fun conn ->
            Z3And(inst2smt conn.src src_id,inst2smt conn.dst dst_id)
        ) instconns in
        let expr = Z3Lib.fn_all clauses (fun x y -> Z3Or(x,y)) in
        enq (Z3Assert(expr));
        ()
      );
    MAP.iter tbl.comp2wire (fun cmp wires ->
        let vars = List.map (fun wire -> Z3Var(wire2id tbl wire)) wires in
        match vars with
        | h::h2::t ->
          let eq_clauses = List.map (fun vr -> Z3Eq(h,vr)) (h2::t) in
          enq (Z3Assert(Z3Lib.fn_all (eq_clauses) (fun x y -> Z3Or(x,y))))
        | [h] -> ()
        | [] -> ()
      );
    let stmts = QUEUE.to_list stmtq in
    QUEUE.destroy stmtq;
    tbl,stmts
    (*the assigned instances must be in the range to make a connection*)


    let consistent gltbl =
        let tbl,stmts = to_smt_prob gltbl in
        let _ = _print_debug "== Generated Constraints\n" in
        let _ = _print_debug "== Created Z3 Instance\n" in
        let _  = flush_all() in
        let z = Z3Lib.exec "wiring" stmts false in
        z.sat


    let z32cstr tbl z3 =
      let sln = MAP.make() in
      let proc_const v = match v with
        | Z3Set(vid,Z3QInt(inst)) ->
          error "z32cstr" "unimplemented" 
      | _ -> ()
      in
      let _ = List.iter (fun x -> let _ = proc_const x in ()) z3 in
      sln

    let get_sln gltbl =
      let tbl,decls = to_smt_prob gltbl in
      let z = Z3Lib.exec "wiring" decls false in
      if z.sat = false then
        error "get_sln" "no solution exists. ie UNSAT."
      else
        match z.model with
        | Some(m) ->
          let z3mdl = m in
          let mapping = z32cstr tbl z3mdl in
          mapping
        | None -> error "get_sln" "no solution"
end

