open DiffEqAST
open MetaLanguageAST
open Util
open Visitor
open Relation

exception DiffCompileException of string;;

type tbl = {
   mutable states : (string*expr) list;
   mutable params : (string*expr) list;
}

let rec rel2expr (r:relation) : expr = 
   match r with
      | Plus(x) -> Add(List.map (fun y -> rel2expr y) x)
      | Minus(x) -> Sub(List.map (fun y -> rel2expr y) x)
      | Mult(x) -> Mult(List.map (fun y -> rel2expr y) x)
      | Divide(x,y) -> Div( (rel2expr x) , (rel2expr y) )
      | Decimal(x) -> Term(Decimal(x))
      | Integer(x) -> Term(Integer(x))
      | Symbol(x) -> Term(Symbol(x))
      | Exp(x,y) -> Exp((rel2expr x), (rel2expr y))

let rule2expr (par:expr) (rel:expr) (r:rule) : expr = 
   let rec _rule2expr (r:rule) = 
      match r with
         | Hole -> par
         | NewHole -> Hole
         | Plus(lst) -> Add(List.map (fun x -> _rule2expr x) lst)
         | Minus(lst) -> Sub(List.map (fun x -> _rule2expr x) lst)
         | Mult(lst) -> Mult(List.map (fun x -> _rule2expr x) lst)
         | Relation -> rel
      in
         _rule2expr r

module DiffEqTable :
sig
   val create : unit -> tbl
   val get_state : tbl -> string -> expr
   val add_state : tbl -> string -> tbl
   val update_state : tbl -> string -> expr -> tbl
   val add_parameter : tbl -> string -> expr -> tbl
   val to_string : tbl -> string
end = 
struct
   let create () : tbl = {params=[]; states=[]}
   let get_state (t:tbl) (name:string) : expr =
      match List.filter (fun (n,e) -> n = name) t.states with
         |[(n,e)] -> e
         |[] -> raise (DiffCompileException ("state with name "^name^" does not exist."))
         | _ -> raise (DiffCompileException ("multiple states with name "^name))

   let add_state (t:tbl) (name:string) : tbl =
      match List.filter (fun (n,e) -> n = name) t.states with
         | [] -> t.states <- (name, Term(Hole))::t.states; t
         | _ -> raise (DiffCompileException ("state with name "^name^" already exists."))

   let add_parameter (t:tbl) (name:string) (e:expr) : tbl = 
      match List.filter (fun (n,e) -> n = name) t.params with
         | [] -> t.params <- (name, e)::t.params; t
         | _ -> raise (DiffCompileException ("parameter with name "^name^" already exists."))

   let update_state (t:tbl) (name:string) (e:expr) : tbl = 
      match List.filter (fun (n,e) -> n = name) t.states with
         | [h] -> t.states <- (name, Term(Hole))::(List.filter (fun (n,e) -> n <> name) t.states); t
         | [] -> raise (DiffCompileException ("state with name "^name^" does not exist."))
         | _ -> raise (DiffCompileException ("multiple declarations of state with name "^name^"."))

   let to_string (t:tbl) = 
      (List.fold_right (fun (n,e) r-> r^"\n"^(stmt2tex (Decl("param",n,e)) ) ) t.params "")^"\n\n"^
      (List.fold_right (fun (n,e) r-> r^"\n"^(stmt2tex (Decl("state",n,e)) ) ) t.states "")
end

module DiffEqCompiler : MetaLanguageVisitor with type s = tbl  = 
struct
   type s=tbl
   let visit_action (st:s) (env: env) (act:action) : s  = 
      let sublist = List.map (fun ((n1,t1),(n2,t2)) -> (n1,n2)) act.inputs in
      let apply_rule (name:string) (r:rule) = 
         apply_rule2rel r 
      match act.t with
         | Action(tname, tinputs, trel, rules, toutput) -> 
            let nrel = subst4rel trel sublist in
            st
         | _ -> raise (DiffCompileException ("action somehow doesn't have action type.."))

   let visit_state (st: s) (env: env) (state:state) : s   = 
      DiffEqTable.add_state st state.name
   
   let visit_parameter (st: s) (env: env) (p:parameter) : s  = 
      DiffEqTable.add_parameter st p.name (Term(Decimal(p.value)))

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
      let st = DiffEqTable.create() in
      let st = visit_parameters st env env.g.params in
      let st = visit_states st env env.g.states in
      let st = visit_actions st env env.g.actions in
      st

end;;

