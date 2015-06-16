open MetaLanguageAST
open Util
open Visitor
open Relation
open Rule
open AnalogAST
 

exception CircuitCompilationException of string;;

type tbl = {
   mutable c : circuit;
   mutable idx: int;
}

module CircuitTable :
sig
   val create : unit -> tbl
   val get_circuit: tbl -> circuit
   val fresh_name : tbl -> string*tbl
end =
struct
   let create () = {c=Circuit.create(); idx=0}
   let get_circuit e = e.c
   let fresh_name e = 
      let i = e.idx in 
      e.idx <- e.idx + 1;
      ("var"^(string_of_int i), e)

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
            st.c <- Circuit.add_component st.c (GenericComponent(Term(Decimal(v)))); st
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
      let st = CircuitCompiler.create() in
      let st = visit_parameters st env env.g.params in
      let st = visit_states st env env.g.states in
      let st = visit_actions st env env.g.actions in
      st

end;;

