open Util
open SolverData

open HWData
open HWLib
open MathLib
open Unit
open SolverUtil
open MathData

open AST
open Interactive

exception SolverSlnError of string

let error n m = raise (SolverSlnError (n^":"^m))
let _print_debug = print_debug 3 "sln"
let debug = print_debug 3 "sln"

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
    {comps=SET.make_dflt();
     conns=mkconns();
     route=mklabels();
     produce=mklabels();
     consume=mklabels();
     generate=mklabels()
    }

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
    | false,false ->
      (*TODO: this used to be an error.*)
      warn "rm_conn"
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

  let expr_eq (type a): (a->string) -> a ast -> a ast -> bool =
    fun fn x y ->
      (ASTLib.ast2str x fn) = (ASTLib.ast2str y fn)

  let _add_wire_to_label (type c) test_eq (m:(c,wire_coll) map) (key:c) (wire:wireid) =
    let matches = MAP.filter m (fun other_key other_coll -> test_eq other_key key) in
    LIST.iter (fun (key,coll) ->
          let ncoll = match coll with
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
          noop (MAP.put m key ncoll) 
      ) matches;
    if List.length matches = 0 then
      noop (MAP.put m key (WCollOne(wire)));
    wire

  let _get_label_wires (type a) (type b) : (a,b) labels -> (a,b) label -> (a->string) -> (b->string) -> wireid list =
    fun labels lbl a_str b_str->
      let a_cmp x y = (a_str x) = (a_str y) in 
      let b_cmp x y = expr_eq b_str x y in 
      let matches m key test_eq =
        MAP.filter_values m (fun other_key other_coll -> test_eq other_key key)
      in
      let wcolls : wire_coll list = match lbl with
        | MInLabel(lbl) ->
          matches labels.ins lbl.var a_cmp
        | MOutLabel(lbl) -> 
          matches labels.outs lbl.var a_cmp
        | MLocalLabel(lbl) ->
          matches labels.locals lbl.var a_cmp
        | ValueLabel(lbl) ->
          matches labels.vals lbl.value NUMBER.eq
        | MExprLabel(lbl) ->
          matches labels.exprs lbl.expr b_cmp
      in
      LIST.fold wcolls (fun w rest -> rest @ (wirecoll2list w)) []


  let _rm_wire_from_label (type c) test_eq (m:(c,wire_coll) map) (key:c)  (wire:wireid) =
    let matches = MAP.filter m (fun other_key other_coll -> test_eq other_key key) in
    LIST.iter (fun (key,coll) ->
      let ncoll = match coll with
        | WCollEmpty -> WCollEmpty
        | WCollOne(cwire) ->
          if cwire = wire
          then  WCollEmpty
          else
            begin
              warn "rm_wire_from_label"
              ("[LAX-WARN] this wire is not assigned to the variable:"^(wireid2str wire)^"!=@"^(wireid2str cwire));
              WCollOne(cwire)
            end

        | WCollMany(h::t) ->
          let other_labels = List.filter (fun x -> x <> wire) (h::t) in
          begin
            match other_labels  with
            | [] -> WCollEmpty
            | [x] -> WCollOne(x)
            | x::y -> WCollMany(x::y)
          end

        | WCollMany([]) -> error "rm_wire_from_label" "cannot have no elements in many cllection"
      in
      noop (MAP.rm m key);
      if WCollEmpty <> ncoll then
        noop (MAP.put m key ncoll) 
      ) matches;
    wire

  let std_eq : 'a -> 'a -> bool =
    fun x y -> (x = y)

  
                   
  let add_route (type a) (type b) : (a,b) sln -> (a,b) label -> (a->string) -> (b->string) -> unit =
    fun sln albl f g ->
      let wire =
        match albl with
        | MInLabel(lbl) ->
          _add_wire_to_label std_eq sln.route.ins lbl.var lbl.wire; 
        | MOutLabel(lbl) ->
          _add_wire_to_label std_eq sln.route.outs lbl.var lbl.wire
        | MLocalLabel(lbl) ->
          _add_wire_to_label std_eq sln.route.locals lbl.var lbl.wire
        | ValueLabel(lbl) ->      
          _add_wire_to_label std_eq sln.route.vals lbl.value lbl.wire
        | MExprLabel(lbl) ->
          _add_wire_to_label (expr_eq g) sln.route.exprs lbl.expr lbl.wire
      in
      ()

  let add_generate (type a) (type b) : (a,b) sln -> (a,b) label -> (a->string) -> (b->string) -> unit =
      fun sln albl f g ->
        let wire =
          match albl with
          | MInLabel(lbl) ->
            _add_wire_to_label std_eq sln.generate.ins lbl.var lbl.wire
          | MOutLabel(lbl) ->
            _add_wire_to_label std_eq sln.generate.outs lbl.var lbl.wire
          | MLocalLabel(lbl) ->
            _add_wire_to_label std_eq sln.generate.locals lbl.var lbl.wire
          | ValueLabel(lbl) ->      
            _add_wire_to_label std_eq sln.generate.vals lbl.value lbl.wire
          | MExprLabel(lbl) ->
            _add_wire_to_label (expr_eq g) sln.generate.exprs lbl.expr lbl.wire
        in
        ()

  let add_consumer (type a) (type b) : (a,b) sln -> (a,b) label -> (a->string) -> (b->string) -> unit =
    fun sln label f g ->
      let wire =
        match label with
        | MInLabel(lbl) ->
            _add_wire_to_label std_eq sln.consume.ins lbl.var lbl.wire
        | MOutLabel(lbl) ->
            _add_wire_to_label std_eq sln.consume.outs lbl.var lbl.wire
        | MLocalLabel(lbl) ->
            _add_wire_to_label std_eq sln.consume.locals lbl.var lbl.wire
        | ValueLabel(lbl) ->
          _add_wire_to_label std_eq sln.consume.vals lbl.value lbl.wire
        | _ ->
          error "add_consumer" "cannot consume an expression."
      in
      ()

  let add_producer (type a) (type b) : (a,b) sln -> (a,b) label -> (a->string) -> (b->string) -> unit =
    fun sln label f g ->
      let wire =
        match label with
        | MOutLabel(lbl) ->
            _add_wire_to_label std_eq sln.produce.outs lbl.var lbl.wire
        | MLocalLabel(lbl) ->
            _add_wire_to_label std_eq sln.produce.locals lbl.var lbl.wire
        | ValueLabel(lbl) ->
          error "add_consumer" "cannot produce an value."
        | _ ->
          error "add_consumer" "cannot produce an expression."
      in
      ()

  let rm_generate (type a) (type b) : (a,b) sln -> (a,b) label -> (a->string) -> (b->string) -> unit =
    fun sln albl f g ->
      let wire =
        match albl with
        | MInLabel(lbl) ->
          _rm_wire_from_label (std_eq) sln.generate.ins lbl.var lbl.wire
        | MOutLabel(lbl) ->
          _rm_wire_from_label (std_eq) sln.generate.outs lbl.var lbl.wire
        | MLocalLabel(lbl) ->
          _rm_wire_from_label (std_eq) sln.generate.locals lbl.var lbl.wire
        | ValueLabel(lbl) ->      
          _rm_wire_from_label (std_eq) sln.generate.vals lbl.value lbl.wire
        | MExprLabel(lbl) ->
          _rm_wire_from_label (expr_eq g) sln.generate.exprs lbl.expr lbl.wire
      in
      ()

  let rm_route (type a) (type b): (a,b) sln -> (a,b) label -> (a->string) -> (b->string) -> unit =
    fun sln albl f g ->
      let wire = match albl with
        | MInLabel(lbl) ->
          _rm_wire_from_label (std_eq) sln.route.ins lbl.var lbl.wire
        | MOutLabel(lbl) ->
          _rm_wire_from_label (std_eq) sln.route.outs lbl.var lbl.wire
        | MLocalLabel(lbl) ->
          _rm_wire_from_label (std_eq) sln.route.locals lbl.var lbl.wire
        | ValueLabel(lbl) ->      
          _rm_wire_from_label (std_eq) sln.route.vals lbl.value lbl.wire
        | MExprLabel(lbl) ->
          _rm_wire_from_label (expr_eq g) sln.route.exprs lbl.expr lbl.wire
      in
      ()

  let rm_consumer (type a) (type b) : (a,b) sln -> (a,b) label -> (a->string) -> (b->string) -> unit =
    fun sln label f g ->
      let wire =
        match label with
        | MInLabel(lbl) ->
            _rm_wire_from_label std_eq sln.consume.ins lbl.var lbl.wire
        | MOutLabel(lbl) ->
            _rm_wire_from_label std_eq sln.consume.outs lbl.var lbl.wire
        | MLocalLabel(lbl) ->
            _rm_wire_from_label std_eq sln.consume.locals lbl.var lbl.wire
        | ValueLabel(lbl) ->
          _rm_wire_from_label std_eq sln.consume.vals lbl.value lbl.wire
        | _ ->
          error "rm_consumer" "cannot consume an expression."
      in
      ()

  let rm_producer (type a) (type b) : (a,b) sln -> (a,b) label -> (a->string) -> (b->string) -> unit =
    fun sln label f g ->
      let wire =
        match label with
        | MOutLabel(lbl) ->
            _rm_wire_from_label std_eq sln.produce.outs lbl.var lbl.wire
        | MLocalLabel(lbl) ->
            _rm_wire_from_label std_eq sln.produce.locals lbl.var lbl.wire
        | ValueLabel(lbl) ->
          error "rm_consumer" "cannot produce an value."
        | _ ->
          error "rm_consumer" "cannot produce an expression."
      in
      ()

  (*determine if the wire, when connected *)
  let creates_cycle (type a) (type b) : hwvid hwenv -> (a,b) sln -> wireid -> wireid -> bool =
    fun henv sln out inp ->
      let is_cyc = REF.mk false in
      let visited_outs = SET.make () in
      let rec _proc (outp:wireid) =
        if REF.dr is_cyc then () else
          begin
            SET.add visited_outs outp;
            if HwLib.is_stvar_port henv outp.comp.name outp.port then () else
              begin
                let inports : string list = HwLib.get_dependent_input_ports henv outp.comp.name outp.port in
                List.iter (fun (inport:string) ->
                    let inwire = mkwire outp.comp.name outp.comp.inst inport in
                    if inwire = inp then REF.upd is_cyc (fun _ -> true);
                    if REF.dr is_cyc then () else
                    if MAP.has sln.conns.dest2src inwire then
                      begin
                        let new_outs = MAP.get sln.conns.dest2src inwire in
                        SET.iter new_outs (fun new_out -> _proc new_out) 
                      end
                  ) inports
              end
          end
      in
      _proc out;
      REF.dr is_cyc


  let iter_insts (sln:usln) fn : unit =
    SET.iter sln.comps (fun inst -> fn inst)
  
  let iter_conns (sln:usln) (fn:wireid->wireid->unit) : unit =
    MAP.iter sln.conns.src2dest (fun src dests ->
        MAP.iter dests (fun dest () ->
            fn src dest 
          ) 
      )

  let _iter_labels (type a) (type b) : (a,b) labels -> ((a,b) label -> unit) -> unit =
    fun trg fn ->
      let traverse tmap flbl =
        MAP.iter tmap (fun vr (this_coll:wire_coll) ->
            List.iter (fun (wire:wireid) ->
                let lbl = flbl wire vr in
                fn lbl 
              ) (wirecoll2list this_coll)
          )
      in
      traverse trg.ins (fun wire v -> MInLabel({wire=wire;var=v}));
      traverse trg.outs (fun wire v -> MOutLabel({wire=wire;var=v}));
      traverse trg.locals (fun wire v -> MLocalLabel({wire=wire;var=v}));
      traverse trg.vals (fun wire v -> ValueLabel({wire=wire;value=v}));
      traverse trg.exprs (fun wire v -> MExprLabel({wire=wire;expr=v}));
      ()

  let iter_routes (type a) (type b): (a,b) sln -> ((a,b) label -> unit) -> unit =
    fun sln fn  ->
      _iter_labels sln.route fn

  let iter_generates (type a) (type b): (a,b) sln -> ((a,b) label -> unit) -> unit =
    fun sln fn ->
      _iter_labels sln.generate fn 

  let iter_consumers (type a) (type b) : (a,b) sln -> ((a,b) label-> unit) -> unit =
    fun sln fn ->
      _iter_labels sln.consume fn 

  let iter_producers (type a) (type b) : (a,b) sln -> ((a,b) label -> unit) -> unit =
    fun sln fn ->
      _iter_labels sln.produce fn 

  let get_producer_wires (type a) (type b): (a,b) sln -> (a,b) label ->
    (a->string) -> (b->string) -> wireid list =
    fun sln lbl a_str b_str ->
      _get_label_wires sln.produce lbl a_str b_str

  let ulabel_get_producer_wires : usln -> ulabel -> wireid list =
    fun sln lbl ->
      get_producer_wires sln lbl ident mid2str

  let iter_labels (type a) (type b): (a,b) sln -> ((a,b) label -> unit) -> unit =
    fun sln fn ->
      iter_routes sln fn;
      iter_generates sln fn

  let wire2producer (type a) (type b) : (a,b) sln -> wireid -> (a,b) label option =
    fun sln wire ->
      error "wire2producer" "unimplemented";
      None

  let wire2consumer (type a) (type b) : (a,b) sln -> wireid -> (a,b) label option =
    fun sln wire ->
      error "wire2producer" "unimplemented";
      None

  let wire2ulabel : wireid -> mid ast -> ulabel =
    fun wire mexpr ->
       match mexpr with
          |Term(MNVar(MOutput,s)) -> MOutLabel({var=s;wire=wire})
          |Term(MNVar(MInput,s)) -> MInLabel({var=s;wire=wire})
          |Term(MNVar(MLocal,s)) -> MLocalLabel({var=s;wire=wire})
          |Integer(i) -> ValueLabel({wire=wire;value=Integer i})
          |Decimal(i) -> ValueLabel({wire=wire;value=Decimal i})
          |expr -> MExprLabel({wire=wire;expr=expr})

  let wire2labels (type a) (type b) : (a,b) sln -> wireid -> (a,b) label list =
    fun sln wire ->
      let matches : (a,b) label set = SET.make () in
      iter_routes sln (fun (x:(a,b) label) ->
          if (label2wire x) = wire
          then noop (SET.add matches x) else ()
        );
      iter_generates sln (fun (x:(a,b) label)  ->
          if (label2wire x) =  wire
        then noop (SET.add matches x) else ()
        );
      let result =  SET.to_list matches in
      SET.destroy(matches);
      result

  let wire2label (type a) (type b) : (a,b) sln -> wireid -> (a,b) label =
    fun sln wire ->
      match wire2labels sln wire with
      | [h] -> h
      | _ ->
        error "wire2label" "single wire"

  let connected_to_outblock (type a) (type b) : (a,b) sln -> wireid -> bool =
    fun sln wire ->
      if MAP.has sln.conns.src2dest wire = false then false else
        let dests = MAP.get sln.conns.src2dest wire in
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
    let str =
      "\n--- Consume ---\n"^
      (labels2str s.consume f g)^
      "\n--- Produce ---\n"^
      (labels2str s.produce f g)^
      "\n"^
      "\n=== Route ===\n"^
      (labels2str s.route f g)^
      "\n=== Generate ===\n"^
      (labels2str s.generate f g)^
      "\n=== Connect ===\n"^
      (conns2str s)
    in
    str


  let usln2str x = sln2str x ident MathLib.mid2str

  let slns_equiv (a:usln) (b:usln) : bool =
    let wcoll_equiv x y = match x,y with
      | WCollEmpty,WCollEmpty -> true
      | WCollOne(x),WCollOne(y) -> y = x
      | WCollMany(x),WCollMany(y) -> LIST.equiv x y
      | _ -> false
    in
    let label_equiv (lbls1:ulabels) (lbls2:ulabels) : bool =
      let outsv = MAP.equiv lbls1.outs lbls2.outs wcoll_equiv in
      let ins = MAP.equiv lbls1.ins lbls2.ins wcoll_equiv in
      let locals = MAP.equiv lbls1.locals lbls2.locals wcoll_equiv in
      let vals = MAP.equiv lbls1.vals lbls2.vals wcoll_equiv in
      let exprs = MAP.equiv lbls1.exprs lbls2.exprs wcoll_equiv in
      outsv && ins && locals && vals && exprs
    in
    let conn_equiv (a:conn_env) (b:conn_env) =
      MAP.equiv a.src2dest b.src2dest (fun x y -> SET.equiv x y) 
    in
    let insts = MAP.equiv a.comps b.comps (fun x y -> x = y) in
    let lbls = (label_equiv a.generate b.generate) && (label_equiv a.route b.route) in
    let conns = conn_equiv a.conns b.conns in
    debug ("DIFF\n");
    debug (">>>>>>>>>>>>>\n"^(usln2str a));
    debug ("<<<<<<<<<<<<<\n"^(usln2str b));
    conns && lbls && insts

end
