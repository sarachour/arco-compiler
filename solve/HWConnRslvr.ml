open HWData
open Util


open Z3Lib
open Z3Data
open Interactive
open HWData
open HWLib
open SlnLib
open SolverData
open HWConnLib

exception HwConnRslvrLibError of string

let error n m = raise (HwConnRslvrLibError (n^":"^m))

let _print_debug = print_debug 1 "rslvr"
let debug = print_debug 1 "rslvr"
let _menu = menu 1
let _print_inter = print_inter 1

module HwConnRslvrLib =
struct
  (*concrete *)
  type symtbl = {
    wire2id: (wireid,int) map;
    id2wire: (int,wireid) map;
    inst2wire:(hwcompinst,wireid list) map;
    inst2id: (hwcompinst,int) map;
    id2inst: (int,hwcompinst) map;
    comp2inst : (hwcompname,hwcompinst list) map;
  }

  let mk_symtbl () =
    {
      wire2id = MAP.make();id2wire=MAP.make();
      inst2id = MAP.make();id2inst=MAP.make();
      inst2wire=MAP.make();comp2inst=MAP.make();
    }

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
        if (MAP.has stbl.inst2wire w.comp) then
          MAP.get stbl.inst2wire w.comp
        else
          error "add_wire" "cannot add wire beloning to uninstantiated inst"
      in
      MAP.put stbl.inst2wire w.comp (w::wires);
      ()

  let add_comp_inst stbl (h:hwcompinst) =
    if MAP.has stbl.inst2id h then
      ()
    else
      let id = MAP.size stbl.inst2id in
      MAP.put stbl.inst2id h id;
      MAP.put stbl.id2inst id h;
      MAP.put stbl.inst2wire h [];
      let insts =
        if MAP.has stbl.comp2inst h.name then
          MAP.get stbl.comp2inst h.name else []
      in
        MAP.put stbl.comp2inst h.name (h::insts);
      ()

  let wire2id stbl w =
    "w_"^(string_of_int (MAP.get stbl.wire2id w))

  let inst2id stbl c =
    "c_"^(string_of_int (MAP.get stbl.inst2id c))


  let id2entity tbl id  : (wireid,hwcompinst) either= match STRING.split id "_" with
    | ["c";ident] ->
      Right(MAP.get tbl.id2inst (int_of_string ident))
    | ["w";ident] ->
      Left(MAP.get tbl.id2wire (int_of_string ident))
    | _ ->
      error "id2entity" "no idea"

  let decl_wire stbl (w:wireid) :z3st =
    add_wire stbl w;
    let name = wire2id stbl w in
    Z3ConstDecl(name,Z3Int)
  
 
  let decl_compinst stbl (w:hwcompinst) :z3st =
    add_comp_inst stbl w;
    let name = inst2id stbl w in
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
    SlnLib.iter_insts sln (fun (inst:hwcompinst) ->
        let comp : 'a hwcomp = HwLib.getcomp gltbl.env.hw inst.name in
        let rng = HCCRange(0,comp.insts) in
        (*declare variable and assert that the instance is within the instance range*)
        enq (decl_compinst tbl inst);
        enq (Z3Assert(inst2smt rng (inst2id tbl inst)));
        
        ()
      );
    MAP.iter tbl.comp2inst (fun comp (insts:hwcompinst list) ->
        let clauses = List.fold_left (fun terms1 (inst1:hwcompinst) ->
            let inst1_id = inst2id tbl inst1 in 
            List.fold_left (fun terms2 (inst2:hwcompinst) ->
                if inst1 != inst2
                then (Z3Eq(Z3Var(inst1_id),Z3Var(inst2id tbl inst2)))::terms2
                else terms2
              ) terms1 insts 
          ) [] insts 
        in
        match clauses with
        | h::h2::t ->
          let expr_to_negate = Z3Lib.fn_all clauses (fun x y -> Z3Or(x,y)) in
          enq (Z3Assert (Z3Not(expr_to_negate)))
        | _ -> ()
      );
    (*all port connections from same component have same value*)
    SlnLib.iter_conns sln (fun (src:wireid) (dest:wireid)  ->
        if has_wire tbl src = false then enq (decl_wire tbl src);
        if has_wire tbl dest = false then enq (decl_wire tbl dest);
        let src_id = wire2id tbl src in
        let dst_id = wire2id tbl dest in
        (*debug (HwConnLib.env2str hwenv.conns);*)
        (*debug ((HwLib.wireid2str src)^"->"^(HwLib.wireid2str dest)^"\n");*)
        let instconns =
          HwConnLib.get_inst_conns hwenv src.comp.name src.port dest.comp.name dest.port
        in
        let clauses : z3expr list = List.map (fun (conn:hwinst_conn) ->
            Z3And(inst2smt conn.src src_id,inst2smt conn.dst dst_id)
        ) instconns in
        let expr = Z3Lib.fn_all clauses (fun x y -> Z3Or(x,y)) in
        enq (Z3Assert(expr));
        ()
      );
    MAP.iter tbl.inst2wire (fun cmp wires ->
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
        debug "== Generated Constraints\n";
        debug "== Created Z3 Instance\n";
        flush_all(); 
        let z = Z3Lib.exec "wiring" stmts false in
        z.sat


    let z32cstr tbl z3 =
      let sln = MAP.make() in
      let proc_const v = match v with
        | Z3Set(vid,Z3QInt(inst)) ->
          begin
            match id2entity tbl vid with
            | Right(hwcomp) ->
              noop (MAP.put sln hwcomp ({name=hwcomp.name;inst=inst}))
            | Left(hwwire) ->
              debug ("z32cstr.wire: "^(HwLib.wireid2str hwwire))
          end
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

