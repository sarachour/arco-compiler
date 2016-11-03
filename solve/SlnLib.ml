open Util
open SolverData

open HWData
open HWLib
open MathLib
open Unit

open MathData

open AST

exception SolverSlnError of string

let error n m = raise (SolverSlnError (n^":"^m))

module SlnLib =
struct

  let mklabels () :('a,'b) labels = {
    ins=MAP.make();
    outs=MAP.make();
    locals=MAP.make();
    vals=MAP.make();
    exprs=MAP.make();
  }
  let mkconns () : conn_env =
    {src2dest=MAP.make(); dest2src=MAP.make()}

  let mksln () : ('a,'b) sln =
    {comps=SET.make_dflt();conns=mkconns(); route=mklabels(); generate=mklabels()}

  let mkdflt_wire () : wireid =
    {comp={name=HWCmComp("?");inst=0};port="?"}


  let mkwire (c:hwcompname) (i:int) (p:string) : wireid =
    {comp={name=c;inst=i};port=p}

  let mkwireconn (src:wireid) (snk:wireid) : wireconn =
    {src=src;dst=snk}

  let wireid2str = HwLib.wireid2str

  let wireconn2str (x:wireconn) : string =
    (wireid2str x.src)^"->"^(wireid2str x.dst)

  let inst2inst_wire = HwLib.inst2inst_wire

  let inst2inst_conn (c:wireconn) (fn:hwcompinst->hwcompinst) : wireconn=
    {
      src=inst2inst_wire c.src fn;
      dst=inst2inst_wire c.dst fn
    }

  let inst2inst_label (c:('a,'b) label) (fn:hwcompinst->hwcompinst) : ('a,'b) label=
    let i2i_w x = inst2inst_wire x fn in
    match c with
    | MInLabel(lbl) -> MInLabel({wire=i2i_w lbl.wire;var=lbl.var})
    | MOutLabel(lbl) -> MOutLabel({wire=i2i_w lbl.wire;var=lbl.var})
    | MLocalLabel(lbl) -> MLocalLabel({wire=i2i_w lbl.wire;var=lbl.var})
    | MExprLabel(lbl) -> MExprLabel({wire=i2i_w lbl.wire;expr=lbl.expr})
    | ValueLabel(lbl) -> ValueLabel({wire=i2i_w lbl.wire;value=lbl.value})

  let xchg_wire (c:('a,'b) label) (new_wire:wireid) : ('a,'b) label =
    let i2i_w x = new_wire in
    match c with
    | MInLabel(lbl) -> MInLabel({wire=i2i_w lbl.wire;var=lbl.var})
    | MOutLabel(lbl) -> MOutLabel({wire=i2i_w lbl.wire;var=lbl.var})
    | MLocalLabel(lbl) -> MLocalLabel({wire=i2i_w lbl.wire;var=lbl.var})
    | MExprLabel(lbl) -> MExprLabel({wire=i2i_w lbl.wire;expr=lbl.expr})
    | ValueLabel(lbl) -> ValueLabel({wire=i2i_w lbl.wire;value=lbl.value})


  let label2str (type a) (type b) (x:(a,b) label)
      (f:a->string) (g:b->string) : string =
    match x with
    | MInLabel(lbl) -> (wireid2str lbl.wire)^" = "^(f lbl.var)
    | MOutLabel(lbl) -> (wireid2str lbl.wire)^" = "^(f lbl.var)
    | MLocalLabel(lbl) -> (wireid2str lbl.wire)^" = "^(f lbl.var)
    | MExprLabel(lbl) -> (wireid2str lbl.wire)^" = "^(ASTLib.ast2str lbl.expr g)
    | ValueLabel(lbl) -> (wireid2str lbl.wire)^" = "^(string_of_number lbl.value)


  let label2wire (type a) (type b) (x:(a,b) label) : wireid=
    match x with
    | MInLabel(lbl) -> lbl.wire
    | MOutLabel(lbl) -> lbl.wire
    | MLocalLabel(lbl) -> lbl.wire
    | MExprLabel(lbl) -> lbl.wire
    | ValueLabel(lbl) -> lbl.wire


  let ulabel2mexpr (x:(string,mid) label) = match x with
    | MInLabel(lbl) -> Term(MNVar(MInput,lbl.var))
    | MOutLabel(lbl) -> Term(MNVar(MOutput,lbl.var))
    | MLocalLabel(lbl) -> Term(MNVar(MOutput,lbl.var))
    | MExprLabel(lbl) -> lbl.expr
    | ValueLabel(lbl) -> ASTLib.number2ast lbl.value
      
  let ulabel2str (x:(string,mid) label) =
    label2str x (ident) MathLib.mid2str

  let add_conn (sln:usln) (conn:wireconn) =
    let get_set (map:(wireid,wireid set) map) (key:wireid) : wireid set =
      if MAP.has map key then
        MAP.get map key
      else
        begin
          let s = SET.make_dflt () in
          MAP.put map key s; 
          s
        end
    in
    SET.add (get_set sln.conns.src2dest conn.src) conn.dst;
    SET.add (get_set sln.conns.dest2src conn.dst) conn.src;
    ()

  let rm_conn (sln:usln) (conn:wireconn) =
    match MAP.has sln.conns.src2dest conn.src, MAP.has sln.conns.dest2src conn.dst with
    | true,true ->
      begin
        SET.rm (MAP.get sln.conns.src2dest conn.src) conn.dst;
        SET.rm (MAP.get sln.conns.dest2src conn.dst) conn.src;
        ()
      end
    | false,false -> error "rm_conn"
                       ("cannot remove connection that doesn't exist "^(wireconn2str conn))
    | _ -> error "rm_conn" "only part of conn exists"

  let add_comp (sln:usln) compinst =
    SET.add sln.comps compinst;
    ()

  let rm_comp (sln:usln) compinst =
    SET.rm sln.comps compinst;
    ()

  let _get_mapped_wires (type a) (type b) (lbls:(a,b) labels) (name:a) =
    if MAP.has lbls.ins name then
      Some (MAP.get lbls.ins name)
    else if MAP.has lbls.outs name then
      Some (MAP.get lbls.outs name)
    else if MAP.has lbls.locals name then
      Some (MAP.get lbls.locals name)
    else
      None

  let get_generating_wires (type a) (type b) (sln:(a,b) sln) (name:a) =
    _get_mapped_wires sln.generate name

  let getsrcs (type a) (type b) (sln:(a,b) sln) (dest:wireid) =
    WCollEmpty 

  let getdests (type a) (type b) (sln:(a,b) sln) (dest:wireid) =
    WCollEmpty





  let wirecoll2list (x:wire_coll) = match x with
    | WCollEmpty -> []
    | WCollOne(wire) -> [wire]
    | WCollMany(wires) -> wires

  let _add_wire_to_label (type c) (m:(c,wire_coll) map) (key:c) (wire:wireid) =
    if MAP.has m key then
      let ncoll = match MAP.get m key with
      | WCollEmpty -> WCollOne(wire)
      | WCollOne(wire2) ->
        if wire2 != wire
        then WCollMany([wire2;wire]) else WCollOne(wire2)
      | WCollMany(wires) ->
        if LIST.has wires wire = false then
          WCollMany(wire::wires)
        else
          WCollMany(wires)
      in
      return (MAP.put m key ncoll) wire
    else
      return (MAP.put m key (WCollOne(wire))) wire


  let _rm_wire_from_label (type c) (m:(c,wire_coll) map) (key:c) (wire:wireid) =
    if MAP.has m key then
      let ncoll = match MAP.get m key with
      | WCollEmpty -> WCollEmpty
      | WCollOne(cwire) ->
        if cwire = wire
          then  WCollEmpty
          else error "rm_wire_from_label"
              ("this wire is not assigned to the variable:"^(wireid2str wire)^"!=@"^(wireid2str cwire))
      | WCollMany(h::t) ->
        if LIST.has (h::t) wire
        then
          match List.filter (fun x -> x != wire) (h::t) with
          | [] -> WCollEmpty
          | [h] -> WCollOne(h)
          | h::t -> WCollMany(h::t)
        else error
            "rm_wire_From_label" "this wire does not belong to this set"
      | WCollMany([]) -> error "rm_wire_from_label" "cannot have no elements in many cllection"
      in
      if WCollEmpty = ncoll then
        return (MAP.rm m key) wire
      else
        return (MAP.put m key ncoll) wire
    else
      wire


  let add_route (type a) (type b) (sln:(a,b)sln) (albl:(a,b)label) =
    let wire =
      match albl with
      | MInLabel(lbl) ->
        _add_wire_to_label sln.route.ins lbl.var lbl.wire; 
      | MOutLabel(lbl) ->
        _add_wire_to_label sln.route.outs lbl.var lbl.wire
      | MLocalLabel(lbl) ->
        _add_wire_to_label sln.route.locals lbl.var lbl.wire
      | ValueLabel(lbl) ->      
        _add_wire_to_label sln.route.vals lbl.value lbl.wire
      | MExprLabel(lbl) ->
        _add_wire_to_label sln.route.exprs lbl.expr lbl.wire
    in
    ()

  let add_generate (type a) (type b) (sln:(a,b) sln) (albl: (a,b) label) =
    let wire =
      match albl with
      | MInLabel(lbl) ->
        _add_wire_to_label sln.generate.ins lbl.var lbl.wire
      | MOutLabel(lbl) ->
        _add_wire_to_label sln.generate.outs lbl.var lbl.wire
      | MLocalLabel(lbl) ->
        _add_wire_to_label sln.generate.locals lbl.var lbl.wire
      | ValueLabel(lbl) ->      
        _add_wire_to_label sln.generate.vals lbl.value lbl.wire
      | MExprLabel(lbl) ->
        _add_wire_to_label sln.generate.exprs lbl.expr lbl.wire
    in
    ()

  let rm_generate (type a) (type b) (sln:(a,b) sln) (albl: (a,b) label)  = 
    let wire =
      match albl with
      | MInLabel(lbl) ->
        _rm_wire_from_label sln.generate.ins lbl.var lbl.wire
      | MOutLabel(lbl) ->
        _rm_wire_from_label sln.generate.outs lbl.var lbl.wire
      | MLocalLabel(lbl) ->
        _rm_wire_from_label sln.generate.locals lbl.var lbl.wire
      | ValueLabel(lbl) ->      
        _rm_wire_from_label sln.generate.vals lbl.value lbl.wire
      | MExprLabel(lbl) ->
        _rm_wire_from_label sln.generate.exprs lbl.expr lbl.wire
    in
    ()

  let rm_route (type a) (type b) (sln:(a,b) sln) (albl: (a,b) label)  = 
    let wire = match albl with
      | MInLabel(lbl) ->
        _rm_wire_from_label sln.route.ins lbl.var lbl.wire
      | MOutLabel(lbl) ->
        _rm_wire_from_label sln.route.outs lbl.var lbl.wire
      | MLocalLabel(lbl) ->
        _rm_wire_from_label sln.route.locals lbl.var lbl.wire
      | ValueLabel(lbl) ->      
        _rm_wire_from_label sln.route.vals lbl.value lbl.wire
      | MExprLabel(lbl) ->
        _rm_wire_from_label sln.route.exprs lbl.expr lbl.wire
    in
    ()
 

  let iter_insts (sln:usln) fn : unit =
    SET.iter sln.comps (fun inst -> fn inst)
  
  let iter_conns (sln:usln) fn : unit =
    MAP.iter sln.conns.src2dest (fun src dests ->
        MAP.iter dests (fun dest  ->
            fn src dest
          )
      )

  let _iter_labels (type a) (type b) (trg:(a,b) labels) (othr:(a,b) labels)
      (fn:(a,b) label -> wireid list -> unit) : unit =
    let traverse tmap omap flbl =
      MAP.iter tmap (fun vr (this_coll:wire_coll) ->
          let other_coll : wireid list =
            wirecoll2list (MAP.get_dflt omap vr WCollEmpty)
          in
          List.iter (fun (wire:wireid) ->
            let lbl = flbl wire vr in
            fn lbl other_coll
            ) (wirecoll2list this_coll)
        )
    in
    traverse trg.ins othr.ins (fun wire v -> MInLabel({wire=wire;var=v}));
    traverse trg.outs othr.outs (fun wire v -> MOutLabel({wire=wire;var=v}));
    traverse trg.locals othr.locals (fun wire v -> MLocalLabel({wire=wire;var=v}));
    traverse trg.vals othr.vals (fun wire v -> ValueLabel({wire=wire;value=v}));
    traverse trg.exprs othr.exprs (fun wire v -> MExprLabel({wire=wire;expr=v}));
    ()

  let iter_routes (sln:usln) fn : unit =
    _iter_labels sln.route sln.generate fn

  let iter_generates (sln:usln) fn: unit =
    _iter_labels sln.generate sln.route fn


  let wire2labels (sln:usln) (wire:wireid) =
    let matches : ulabel set = SET.make () in
    iter_routes sln (fun (x:ulabel) wires ->
        if (label2wire x) = wire
        then noop (SET.add matches x) else ()
      );
    iter_generates sln (fun (x:ulabel) (wires:wireid list) ->
        if (label2wire x) =  wire
        then noop (SET.add matches x) else ()
      );
    let result =  SET.to_list matches in
    SET.destroy(matches);
    result

  let connected_to_outblock (sln:usln) (w:wireid) =
    if MAP.has sln.conns.src2dest w = false then false else
      let dests = MAP.get sln.conns.src2dest w in
      let outs = SET.filter dests (fun (x:wireid) -> match x.comp.name with
          | HWCmOutput(_) -> true
          | _ -> false
        ) in
      List.length outs > 0

  let wirecoll2str (a:wire_coll) = match a with
    | WCollEmpty -> "{}"
    | WCollOne(wire) -> wireid2str wire
    | WCollMany(h::t) -> "["^
                         (List.fold_right (fun wire str->
                              str^","^(wireid2str wire)) t (wireid2str h))^"]"
    | WCollMany([]) -> "[]"

  let labels2str (type a) (type b) (labels:(a,b) labels) (f:a->string) (g:b->string)= 
    let str = "" in
    let str = MAP.fold labels.ins
        (fun v coll str -> str^"in "^(f v)^" -> "^(wirecoll2str coll)^"\n") str in
    let str = MAP.fold labels.locals
        (fun v coll str -> str^"lc "^(f v)^" -> "^(wirecoll2str coll)^"\n") str in
    let str = MAP.fold labels.outs
        (fun v coll str -> str^"out "^(f v) ^" -> "^(wirecoll2str coll)^"\n") str in
    let str = MAP.fold labels.vals
        (fun v coll str -> str^"val "^(string_of_number v)^" -> "^(wirecoll2str coll)^"\n") (str^"\n") in
    let str = MAP.fold labels.exprs
        (fun v coll str -> str^"ast "^(ASTLib.ast2str v g) ^" -> "^(wirecoll2str coll)^"\n") (str^"\n") in
    str

  let conns2str (s: ('a,'b) sln) =
    MAP.fold s.conns.src2dest (fun src dests str ->
        let srcstr = (wireid2str src)^" -> " in
        let deststr = SET.fold dests (fun dest dstr->
            dstr^" "^(wireid2str dest)) "" 
        in
        if SET.size dests > 0 then
          str^srcstr^deststr^"\n"
        else
          str
      ) ""

  let sln2str (s:('a,'b) sln) (f:'a -> string) (g:'b->string) : string=
    let str = "\n=== Route ===\n"^
              (labels2str s.route f g)^
              "\n=== Generate ===\n"^
              (labels2str s.generate f g)^
              "\n=== Connect ===\n"^
              (conns2str s)
    in
    str
end
