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
   let visit_action (st:s) (env: env) (act:action) : s  = 
      st

   let visit_state (st: s) (env: env) (state:state) : s  = 
      match state with
         | {name=name; t=Signal(v)} -> 
            let n = sanitize name in
            let 
               join_ins_id = (CircuitTable.fId st, Some ("join_ins_"^n))
               and join_outs_id = (CircuitTable.fId st, Some ("join_outs_"^n))
            in
            let
               w_ins_outs = Wire(CircuitTable.make st,join_ins_id,join_outs_id)
            in
            let
               j_ins = Joint(join_ins_id, [w_ins_outs])
               and j_outs = Joint(join_outs_id, [w_ins_outs])
            in
            let circ = Circuit.create (CircuitTable.fId st, Some n) in
            let circ = Circuit.add_blocks circ [j_ins;j_outs] in
            let circ = Circuit.add_wires circ [w_ins_outs] in
            let circ = Circuit.add_inputs circ [("in",join_ins_id)] in
            let circ = Circuit.add_outputs circ [("sv",join_outs_id)] in
               CircuitTable.add_circuit st circ

         | {name=name; t=State(v)} -> 
            let n = sanitize name in
            let 
               capac_id = (CircuitTable.fId st, Some ("cap_"^n))
               and join_hub_id = (CircuitTable.fId st, Some ("join_hub_"^n))
               and join_use_id = (CircuitTable.fId st, Some ("join_use_"^n))
               and join_add_id = (CircuitTable.fId st, Some ("join_add_"^n))
               and gnd_id = (CircuitTable.fId st, Some ("gnd_"^n)) in
            let 
               gnd = Ground(gnd_id);
               and capac = Capacitor(capac_id,1.)
               and w_capac_gnd = Wire(CircuitTable.make st,capac_id,gnd_id)
               and w_capac_hub = Wire(CircuitTable.make st,join_hub_id,capac_id)
               and w_hub_use = Wire(CircuitTable.make st, join_hub_id, join_use_id)
               and w_hub_add = Wire(CircuitTable.make st, join_add_id, join_hub_id)
            in
            let
               j_hub = Joint(join_hub_id, [w_hub_use;w_hub_add;w_capac_hub])
               and j_add = Joint(join_add_id, [w_hub_add])
               and j_use = Joint(join_use_id, [w_hub_use])
            in
            let circ = Circuit.create (CircuitTable.fId st, Some n) in
            let circ = Circuit.add_blocks circ [j_hub;j_use;j_add;capac;gnd] in
            let circ = Circuit.add_wires circ [w_capac_gnd;w_capac_hub;w_hub_use;w_hub_add] in
            let circ = Circuit.add_inputs circ [("use",join_use_id); ("gen",join_add_id)] in
            let circ = Circuit.add_outputs circ [("sv",join_use_id)] in
               CircuitTable.add_circuit st circ

      
   let visit_parameter (st: s) (env: env) (p:parameter) : s  =
      match p with
         | {name=n; value=v; t=ty} ->
            CircuitTable.add_parameter st n v 
         | _ -> raise (CircuitCompilationException "unexpected parameter")
      
      
   let rec visit_actions (st: s) (env: env) (act:action list) : s = 
      match act with
      |h::t -> let nst = visit_action st env h in visit_actions nst env t
      | [] -> st
   
   let rec visit_states (st: s) (env: env) (states:state list) : s  = 
      match states with
      |h::t -> let nst = visit_state st env h in visit_states nst env t
      | [] -> st
   
   let rec visit_parameters (st: s) (env: env) (p:parameter list) : s  = 
      match p with
      |h::t -> let nst = visit_parameter st env h in visit_parameters nst env t
      | [] -> st

   let rec visit_env (env: env) : s  =
      let st = CircuitTable.create() in
      let st = visit_parameters st env env.g.params in
      let st = visit_states st env env.g.states in
      let st = visit_actions st env env.g.actions in
      st

end;;

