open MetaLanguageAST
open Util
open Visitor
open Relation
open Rule
open AnalogAST
open Yojson
 

exception CircuitCompilationException of string;;

type tbl = {
   mutable s : system;
   mutable params: (string*float) list;
   mutable idx: int ref;
}

module CircuitTable :
sig
   val create : unit -> tbl
   val get_circuit: tbl -> id -> circuit maybe
   val add_circuit: tbl -> circuit -> tbl
   val update_circuit: tbl -> circuit -> tbl
   val add_wire: tbl -> wire -> tbl
   val add_parameter: tbl -> string -> float -> tbl
   val fId : tbl -> int
   val make: tbl -> id
   val to_string: tbl -> string
   val to_json: tbl -> json
end =
struct
   let create () = {s=(System.create (0,Some("system"))); params=[]; idx=(ref 1)}
   let get_circuit e n = None
   let add_circuit tbl circ=tbl.s <- System.add_circuit tbl.s circ; tbl
   let update_circuit e n=e 
   let add_parameter t n f = t.params <- (n,f)::t.params; t
   let add_wire tbl wire= tbl.s <- System.add_wire tbl.s wire; tbl
   let fId e = 
      let i = ! (e.idx) in 
      e.idx := i + 1;
      i
   let make e =
      let i = fId e in
      (i, None)

   let to_json t = System.to_json t.s
   let to_string t = 
      let rec print_params lst = match lst with
         |(n,v)::t ->n^":"^(string_of_float v)^"\n"^(print_params t)
         |[] ->"\n"
      in
      (print_params t.params) ^
      (System.to_string t.s)
end


module CircuitCompiler : MetaLanguageVisitor with type s = tbl  = 
struct
   type s=tbl
   let mangle_action_name (a:action) : string =
         match (a.t, a.name,a.inputs, a.output) with
         | (Action(tn,tins,rel,rules,tout),actName,actIns,actOuts) ->
            let action_name = sanitize actName and action_kind = sanitize tn in
            "act_"^action_kind^"_"^action_name
         | _ -> raise (CircuitCompilationException ("failed to mangle action"))

   let mangle_param_name (p:parameter) : string = 
      match (p.name, p.value) with
      | (name,value) -> let san_name = sanitize name in
         "param_"^san_name
      | _ -> raise (CircuitCompilationException ("failed to mangle action"))

   let mangle_state_name (s:state) : string = 
      match (s.t, s.name) with
      | (State(kind), name) -> 
         let san_kind = sanitize kind and san_name = sanitize name in
         "st_"^san_kind^"_"^san_name
      | (Signal(kind), name) ->
         let san_kind = sanitize kind and san_name = sanitize name in
         "sig_"^san_kind^"_"^san_name
      | _ -> raise (CircuitCompilationException ("failed to mangle action"))


   let visit_rule (st:s) (rname:string) (r:rule) (rel:id) (inps:(string*id) list) (out:(string*id)) : s = 
      st

   let rec visit_rules (st:s) (rlst:(string*rule) list) (rel:id) (inps:(string*id) list) (out:(string*id)) : s =
      match rlst with
      | (name,rul)::t -> let e = visit_rule st name rul rel inps out in visit_rules e t rel inps out 
      | [] -> st

   let rec visit_relation (st:s) (i:id) (rel:relation) (inps:(string*id) list) (out:(string*id)) : s =
      let (oname,oid) = out in
      let elem = SMTHole(i,[],Integer(0),[],None) in
      match System.get_circuit st.s oid with
      | Some(circ) ->
         let circ = Circuit.add_block circ elem in
         CircuitTable.update_circuit st circ
      | None -> raise (CircuitCompilationException ("expected to find circuit with name '"^oname^"'."))

   let visit_action (st:s)  (act:action) : s  = 
      match (act.t, act.name,act.inputs, act.output) with
      | (Action(tn,tins,rel,rules,tout),actName,actIns,actOuts) ->
         let smtid = (CircuitTable.fId st, Some (mangle_action_name act)) in
         let st = visit_relation st smtid rel [] ("",smtid) in
         visit_rules st rules smtid [] ("",smtid) 
      | _ -> raise (CircuitCompilationException "unexpected parameter")

   let visit_state (st: s) (state:state) : s  =
      let name = mangle_state_name state in 
      match state with
         | {name=name; t=Signal(v)} -> 
            let 
               join_ins_id = (CircuitTable.fId st, Some (name^"_JOUT"))
               and join_outs_id = (CircuitTable.fId st, Some (name^"_JIN"))
            in
            let
               w_ins_outs = Wire(CircuitTable.make st,join_ins_id,join_outs_id)
            in
            let
               j_ins = Joint(join_ins_id, [w_ins_outs])
               and j_outs = Joint(join_outs_id, [w_ins_outs])
            in
            let circ = Circuit.create (CircuitTable.fId st, Some name) in
            let circ = Circuit.add_blocks circ [j_ins;j_outs] in
            let circ = Circuit.add_wires circ [w_ins_outs] in
            let circ = Circuit.add_inputs circ [("in",join_ins_id)] in
            let circ = Circuit.add_outputs circ [("sv",join_outs_id)] in
               CircuitTable.add_circuit st circ

         | {name=name; t=State(v)} -> 
            let 
               capac_id = (CircuitTable.fId st, Some (name^"_CAP"))
               and join_hub_id = (CircuitTable.fId st, Some (name^"_JHUB"))
               and join_use_id = (CircuitTable.fId st, Some (name^"_JUSE"))
               and join_add_id = (CircuitTable.fId st, Some (name^"_JADD"))
               and gnd_id = (CircuitTable.fId st, Some (name^"_GND")) in
            let 
               gnd = Ground(gnd_id);
               and capac = Capacitor(capac_id,1.)
               and w_capac_gnd = Wire(CircuitTable.make st,capac_id,gnd_id)
               and w_capac_hub = Wire(CircuitTable.make st,join_hub_id,                         capac_id)
               and w_hub_use = Wire(CircuitTable.make st, join_hub_id, join_use_id)
               and w_hub_add = Wire(CircuitTable.make st, join_add_id, join_hub_id)
            in
            let
               j_hub = Joint(join_hub_id, [w_hub_use;w_hub_add;w_capac_hub])
               and j_add = Joint(join_add_id, [w_hub_add])
               and j_use = Joint(join_use_id, [w_hub_use])
            in
            let circ = Circuit.create (CircuitTable.fId st, Some name) in
            let circ = Circuit.add_blocks circ [j_hub;j_use;j_add;capac;gnd] in
            let circ = Circuit.add_wires circ [w_capac_gnd;w_capac_hub;w_hub_use;w_hub_add] in
            let circ = Circuit.add_inputs circ [("use",join_use_id); ("gen",join_add_id)] in
            let circ = Circuit.add_outputs circ [("sv",join_use_id)] in
               CircuitTable.add_circuit st circ

      
   let visit_parameter (st: s) (p:parameter) : s  =
      match p with
         | {name=n; value=v; t=ty} ->
            CircuitTable.add_parameter st (mangle_param_name p) v 
         | _ -> raise (CircuitCompilationException "unexpected parameter")
      
      
   let rec visit_actions (st: s) (act:action list) : s = 
      match act with
      |h::t -> let nst = visit_action st h in visit_actions nst t
      | [] -> st
   
   let rec visit_states (st: s) (states:state list) : s  = 
      match states with
      |h::t -> let nst = visit_state st h in visit_states nst t
      | [] -> st
   
   let rec visit_parameters (st: s) (p:parameter list) : s  = 
      match p with
      |h::t -> let nst = visit_parameter st h in visit_parameters nst t
      | [] -> st

   let rec visit_env (env: env) : s  =
      let st = CircuitTable.create() in
      let st = visit_parameters st env.g.params in
      let st = visit_states st env.g.states in
      let st = visit_actions st env.g.actions in
      st

end;;

