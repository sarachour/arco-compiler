open DiffEqAST
open MetaLanguageAST
open Util
open Visitor

type denv = expr list


module DiffEqCompiler : MetaLanguageVisitor with type t = expr and type s = denv   = 
struct
   type t=expr
   type s=denv
   let visit_action (st: s) (env: env) (act:action) : s*(t maybe)  = 
      ([],None)
   
   let visit_state (st: s) (env: env) (st:state) : s*(t maybe)   = 
      ([],None)
   
   let visit_parameter (st: s) (env: env) (p:parameter) : s*(t maybe)   = 
      ([],None)

   let rec visit_actions (st: s) (env: env) (act:action list) : s*(t maybe)  = 
      ([],None)
   
   let rec visit_states (st: s) (env: env) (st:state list) : s*(t maybe)   = 
      ([],None)
   
   let rec visit_parameters (st: s) (env: env) (p:parameter list) : s*(t maybe)   = 
      ([],None)

   let rec visit_env (st: s) (env: env) : s*(t)   = 
      ([],Term(Integer(0)))

end;;


(*
module type DiffEqCompilerSig = Visitor.MetaLanguageVisitor (DiffEqType);;

module DiffEqCompiler : DiffEqCompileSig = 
struct
   type t = DiffEqType.t
   let visit (e:env) (a:action) : t =
      Term(Integer(0))
end
*)