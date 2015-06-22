open MetaLanguageAST
open Util
open Visitor
open Relation
open Rule
open AnalogAST
 

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
   val to_string: tbl -> string
   val to_json: tbl -> string
end =
struct
   let create () = {s=(System.create (0,Some("system"))); params=[]; idx=(ref 1)}
   let get_circuit e n = None
   let add_circuit e n=e 
   let update_circuit e n=e 
   let add_parameter t n f =
      t.params <- (n,f)::t.params; t
   let add_wire e w=e 
   let fId e = 
      let i = ! (e.idx) in 
      e.idx := i + 1;
      i
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
         | {name=n; t=Signal(v)} -> st
         | {name=n; t=State(v)} -> st

      
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

