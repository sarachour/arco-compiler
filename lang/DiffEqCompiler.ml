open DiffEqAST
open MetaLanguageAST
open Util
open Visitor
open Relation
open Rule

exception DiffCompileException of string;;

type tbl = {
   mutable states : (string*expr*int) list;
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
   let rec _rule2expr (r:rule) : expr = 
      match r with
         | Hole -> Term(Hole)
         | Plus(lst) -> Add(List.map (fun x -> _rule2expr x) lst)
         | Minus(lst) -> Sub(List.map (fun x -> _rule2expr x) lst)
         | Times(lst) -> Mult(List.map (fun x -> _rule2expr x) lst)
         | Relation -> rel
   in
      let nexpr = _rule2expr r in
      fillhole4expr par nexpr

module DiffEqTable :
sig
   val create : unit -> tbl
   val get_state : tbl -> string -> expr
   val add_state : tbl -> string -> int -> tbl
   val update_state : tbl -> string -> expr -> tbl
   val add_parameter : tbl -> string -> expr -> tbl
   val to_string : tbl -> string
   val to_tex : tbl -> string
end = 
struct
   let create () : tbl = {params=[]; states=[]}
   let get_state (t:tbl) (name:string) : expr =
      match List.filter (fun (n,_,_) -> n = name) t.states with
         |[(_,e,_)] -> e
         |[] -> raise (DiffCompileException ("state with name "^name^" does not exist."))
         | _ -> raise (DiffCompileException ("multiple states with name "^name))

   let add_state (t:tbl) (name:string) (order:int) : tbl =
      match List.filter (fun (n,_,_) -> n = name) t.states with
         | [] -> t.states <- (name, Term(Hole), order)::t.states; t
         | _ -> raise (DiffCompileException ("state with name "^name^" already exists."))

   let add_parameter (t:tbl) (name:string) (e:expr) : tbl = 
      match List.filter (fun (n,_) -> n = name) t.params with
         | [] -> t.params <- (name, e)::t.params; t
         | _ -> raise (DiffCompileException ("parameter with name "^name^" already exists."))

   let update_state (t:tbl) (name:string) (e:expr) : tbl = 
      match List.filter (fun (n,_,_) -> n = name) t.states with
         | [(n,_,o)] -> t.states <- (n,e,o)::(List.filter (fun (n,_,_) -> n <> name) t.states); t
         | [] -> raise (DiffCompileException ("state with name "^name^" does not exist."))
         | _ -> raise (DiffCompileException ("multiple declarations of state with name "^name^"."))

   let to_string (t:tbl) = 
      (List.fold_right (fun (n,e) r-> r^"\n"^(stmt2str (Decl("param",n,e)) ) ) t.params "")^"\n\n"^
      (List.fold_right (fun (n,e,o) r-> r^"\n"^(stmt2str (Decl("state["^(string_of_int o)^"]",n,Term Hole)) ) ) t.states "")^"\n\n"^
      (List.fold_right (
         fun (n,e,o) r-> 
            match o with
               | 0 -> r^"\n"^(stmt2str (Eq(Term(Symbol(n)),e)) ) 
               | 1 -> r^"\n"^(stmt2str (Eq(Deriv(Hole,n,"t"),e)) ) 
         ) t.states "")

   let to_tex (t:tbl) = 
      (List.fold_right (fun (n,e) r-> r^"\n"^(stmt2tex (Decl("param",n,e)) ) ) t.params "")^"\n\n"^
      (List.fold_right (fun (n,e,o) r-> r^"\n"^(stmt2tex (Decl("state["^(string_of_int o)^"]",n,Term Hole)) ) ) t.states "")^"\n\n"^
      (List.fold_right (
         fun (n,e,o) r-> 
            match o with
               | 0 -> r^"\n"^(stmt2tex (Eq(Term(Symbol(n)),expr2conc e)) ) 
               | 1 -> r^"\n"^(stmt2tex (Eq(Deriv(Hole,n,"t"),expr2conc e)) ) 
         ) t.states "")

end

module DiffEqCompiler : MetaLanguageVisitor with type s = tbl  = 
struct
   type s=tbl
   let visit_action (st:s) (env: env) (act:action) : s  = 
      let sublist = 
         (List.map (fun ((n1,t1),(n2,t2)) -> (n1,n2)) act.inputs) @
         (List.map (fun ((n1,t1),(n2,t2)) -> (n1,n2)) act.output) 
      in
      let rec find_state name lst : string = match lst with
         | (sname,rname)::t -> if name = rname then sname else find_state name t
         | [] -> name
      in  
      let apply_rule (nst:s) (name:string) (e:expr) (r:rule) : s = 
         let oexpr = (DiffEqTable.get_state st name) in
         let nexpr = rule2expr oexpr e r in
         DiffEqTable.update_state nst name nexpr
      in
      let rec apply_rules (nst:s) (e:expr) (lst: (string*rule) list) = 
         match lst with
            | (name,rul)::t -> let x = apply_rule nst (find_state name sublist) e rul in apply_rules x e t
            | [] -> nst
      in
      match act.t with
         | Action(tname, tinputs, trel, rules, toutput) -> 
            let expr = rel2expr (subst4rel trel sublist) in
            apply_rules st expr rules
         | _ -> raise (DiffCompileException ("action somehow doesn't have action type.."))

   let visit_state (st: s) (env: env) (state:state) : s  = 
      match state.t with
         |Signal(_) -> DiffEqTable.add_state st state.name 0
         |State(_) -> DiffEqTable.add_state st state.name 1
         | _ -> raise (DiffCompileException ("state somehow doesn't have state/signal type.."))
   
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

