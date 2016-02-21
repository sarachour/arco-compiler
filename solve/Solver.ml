open Common
open Globals

open HW
open HWData
open HWCstr

open Math
open MathCstr

open AST
open ASTUnifyData
open ASTUnify

open Util
open Unit

open SymCamlData

open Interactive

open SearchData
open Search

open SolverData
open SolverUtil
open SolverSln
open SolverSearch
open SolverRslv
open SolverGoalTable
open SolverMulti

open SpiceLib

(*
A solution is a set of connections  and components. A solution
may additionally contain any pertinent error and magnitude mappings
*)
exception SolverError of string

let error n m = raise (SolverError (n^":"^m))
let slvr_print_debug = print_debug 1
let slvr_menu = menu 1
let slvr_print_inter = print_inter 1

module SolveLib =
struct


  let mkslv h p : slvr = {hw=h; prob=p; cnt=0;}




    (*
    match ifover_mkcopier s t sw pr with
    | Some(steps,nsw) ->
      SSolAddConn(nsw,dw)::steps
    | None ->
      [SSolAddConn(sw,dw)]
    *)

  (*
    determine if a label is mapping
  *)

  let hwkind2wire (slvr:slvr) (sln:sln) (id:unodeid) (inst:int) (knd:hwvkind) =
    let identname = UnivLib.unodeid2name id in
    let ivar = HwLib.get_port_by_kind slvr.hw knd identname in
    let wire : wireid = (id,inst,ivar.name) in
    let prop,_ = MAP.singleton (HwLib.getprops slvr.hw identname ivar.name) in
    let wid = SlnLib.wire2uid slvr.hw wire prop in
    wid, wire, prop

  let mkinp  (slvr:slvr) (sln:sln) wire prop (lbl:label) =
    let ident = UNoInput(prop) in
    if (SlnLib.usecomp_valid slvr sln ident) = false then
      error "mkinp" "cannot make input port."
    else
      (*let comp = HwLib.getcomp s.hw node.name in*)
      let inst = SlnLib.usecomp sln ident in
      let usenode = SSolUseNode(ident,inst) in
      let wid = SlnLib.wire2uid slvr.hw wire prop in
      let iid,iwire,iprop = hwkind2wire slvr sln ident inst HNInput in
      let oid,owire,oprop = hwkind2wire slvr sln ident inst HNOutput in
      let connport = SAddGoal(TrivialGoal(UFunction(oid,Term(wid)))) in
      let bindlbl = SSolAddLabel(iwire, iprop, lbl) in
      let bindlbl2 = SSolAddLabel(owire, oprop, lbl) in
      [usenode; connport;bindlbl;bindlbl2]

  let mkout (slvr:slvr) (sln:sln) wire prop (lbl:label) =
    let ident = UNoOutput(prop) in
    if (SlnLib.usecomp_valid slvr sln ident) = false then
      error "mkinp" "cannot make input port."
    else
      (*let comp = HwLib.getcomp s.hw node.name in*)
      let inst = SlnLib.usecomp sln ident in
      let usenode = SSolUseNode(ident,inst) in
      let wid = SlnLib.wire2uid slvr.hw wire prop in
      let iid,iwire,iprop = hwkind2wire slvr sln ident inst HNInput in
      let oid,owire,oprop = hwkind2wire slvr sln ident inst HNOutput in
      let connport = SAddGoal(TrivialGoal(UFunction(iid,Term(wid)))) in
      let bindlbl = SSolAddLabel(owire, oprop, lbl) in
      let bindlbl2 = SSolAddLabel(iwire, iprop, lbl) in
      [usenode;connport;bindlbl;bindlbl2]

  let rslv_label (slvr:slvr) (sln:sln) (wire:wireid) (prop:propid) (name:mid) (knd:hwvkind) : sstep list =
    (*find all pending input connections with same label*)
    let conn_inputs nwire nprop (nm:mid) =
      let conv w p l =
        let snk : unid = SlnLib.wire2uid slvr.hw wire prop in
        let src : unid = SlnLib.wire2uid slvr.hw nwire nprop in
        let add_goal = SAddGoal(TrivialGoal(UFunction(src,Term(snk)))) in
        let rm_lbl = SSolRemoveLabel(w,p,l) in
        [add_goal; rm_lbl]
      in
      let lbls : (wireid*propid*label) list = SlnLib.get_labels sln
        (fun w p x -> match x with LBindVar(_,v) -> v = nm | _ -> false)
      in
      let steps : sstep list = List.fold_right (fun (w,p,l) r -> r @ (conv w p l)) lbls [] in
      steps
    in
    (*find all existing inputs with same label*)
    let find_input nwire nprop nm =
      let lbls : (wireid*propid*label) list = SlnLib.get_labels sln
        (fun w p x -> match x with LBindVar(_,v) -> v = nm && p = nprop | _ -> false)
      in
      match lbls with
      | [] ->
        let stps = mkinp slvr sln nwire nprop (LBindVar(HNInput,name)) in
        stps
      | [(w,p,l)] ->
        let snk : unid = SlnLib.wire2uid slvr.hw w p in
        let src : unid = SlnLib.wire2uid slvr.hw nwire nprop in
        let add_goal = SAddGoal(TrivialGoal(UFunction(src,Term(snk)))) in
        let rm_lbl = SSolRemoveLabel(w,p,l) in
        [add_goal; rm_lbl]
      | _ ->
        error "rslv_label.find_input" "too many labels."
    in
    let conn_if_exists wire prop name =
      (*Find any output labels*)
      let lbls : (wireid*propid*label) list = SlnLib.get_labels sln
        (fun w p x -> match x with LBindVar(k,v) -> v = name && p = prop && k = HNOutput | _ -> false)
      in
      match lbls with
      | [(ow,op,ol)] ->
        let snk : unid = SlnLib.wire2uid slvr.hw ow op in
        let src : unid = SlnLib.wire2uid slvr.hw wire prop in
        let add_goal = SAddGoal(TrivialGoal(UFunction(src,Term(snk)))) in
        [add_goal]
      | [] ->
        let stp = SSolAddLabel(wire,prop,LBindVar(HNInput, name)) in
        [stp]
    in
    (*all the wires that needed to be assigned labels*)
    match (knd, (MathLib.getkind slvr.prob (MathLib.mid2name name)) ) with
    (*output value, resolve labels that are buffering on this by making connections back.
    if this variable is marked as an output by the menv, connect to an output port*)
    | (HNOutput, Some MOutput) ->
      let conn_outs = conn_inputs wire prop name in
      let outport = mkout slvr sln wire prop (LBindVar (HNOutput,name)) in
      conn_outs @ outport
      (*create an output port and map all inputs*)
    | (HNOutput, Some MLocal) ->
      let conn_outs = conn_inputs wire prop name in conn_outs
    (*input value, add to buffer if variable is also local. Otherwise, map to a port.*)
    | (HNInput, Some MInput) ->
      let conn_ins = find_input wire prop name in conn_ins
      (*determine if the input is already mapped.*)
    | (HNInput, Some MLocal) ->
      let stps = conn_if_exists wire prop name in stps
      (*add label to this wire, do not create input*)
    | (HNInput, Some MOutput) ->
      let stps = conn_if_exists wire prop name in stps
    | (HNInput, None) ->
      let conn_ins = find_input wire prop name in
      conn_ins
      (* add label to this wire, don't create an input *)
    | (_,None) -> error "rslv_label" ("bound label is not a variable: "^
          "wire <-> "^(MathLib.mid2name name))

    | (_,Some MLocal) -> error "rslv_label" ("bound label is a local variable: "^
          "wire <-> "^(MathLib.mid2name name))

    | (_,Some MOutput) -> error "rslv_label" ("bound label is a output variable: "^
          "wire <-> "^(MathLib.mid2name name))

    | (_,Some MInput) -> error "rslv_label" ("bound label is an input variable: "^
          "wire <-> "^(MathLib.mid2name name))







  let canon_hw_assign lhs rhs : (unid*(unid ast)) option =
    match rhs with
    | Term(rhs_term) ->
      begin
        match lhs,rhs_term with
        | (HwId(HNPort(k1,c1,v1,p1,u1)),HwId(HNPort(k2,c2,v2,p2,u2))) ->
          (*hw ports must have an input = output pattern*)
          if k1 = HNOutput && k2 = HNInput then
            Some (HwId(HNPort(k2,c2,v2,p2,u2)),Term(HwId(HNPort(k1,c1,v1,p1,u1))))
          else if k1 = HNInput && k2 = HNOutput then
              Some(lhs,rhs)
          else if k1 = HNOutput && k2 = HNOutput && lhs <> rhs_term then
            None
          else if k1 = HNInput && k2 = HNInput  && lhs <> rhs_term then
            None
          else
            Some (lhs,rhs)
        | _ ->
            Some (lhs,rhs)
      end
    | _ -> Some(lhs,rhs)



end


let canonicalize_sln (hw:hwenv) (s:sln) =
  let newlabels = MAP.make () in
  let mklbl wire propmap =
    MAP.put newlabels wire propmap
  in
  let proc_wire wire propmap =
    let c,i,p = wire in
    let cname : string = UnivLib.unodeid2name c in
    match c with
    | UNoInput(prop) -> if HwLib.getkind hw cname p = HNInput then ()
      else let _ = mklbl wire propmap in ()
    | UNoOutput(prop) -> if HwLib.getkind hw cname p = HNOutput then ()
      else let _ = mklbl wire propmap in ()
    | _ -> let _ = mklbl wire propmap in ()
  in
  (*only keep assignments on one end of the input or output port*)
  let _ = MAP.iter s.labels (fun wire props -> proc_wire wire props) in
  let _ = MAP.set s.labels newlabels in
  ()


let solve (hw:hwenv) (prob:menv) (out:string) =
  let _ = init_utils() in
  let sl = SolveLib.mkslv hw prob in
  let msearch = MultiSearch.mkmulti sl in
  let _ = slvr_print_inter "===== Beginning Interactive Solver ======\n" in
  let nslns = Globals.get_glbl_int "slvr-solutions" in
  let slns : (sln list) option = MultiSearch.msolve (REF.mk sl) msearch nslns in
  match slns with
    | Some(slns) ->
      let outp_sln sln i =
        (*canonicalize the solution*)
        let _ = canonicalize_sln hw sln in
        let _ = Printf.printf "===== Concretizing to Spice File ======\n" in
        let _ = try
          let sp = SpiceLib.to_spice sl sln in
          IO.save (out^"."^(string_of_int i)) (SpiceLib.to_str sp)
        with
          | SpiceLibException(m) -> Printf.printf "ERROR: SPICE Generation Failed. %s" m
        in
        let _ = Printf.printf "===== Concretizing to summary file =====\n" in
        let _ = IO.save (out^".summary."^(string_of_int i)) (SlnLib.tostr sln) in
        let _ = SlnLib.repr2file (out^".caml."^(string_of_int i)) sln in
        let _ = Printf.printf "===== Solution Found ======\n" in
        ()
      in
      let _ = List.iteri (fun i x -> outp_sln x i) slns in
      ()
    | None ->
      let _ = flush_all () in
      error "solve" " no solution Found."
  ()
