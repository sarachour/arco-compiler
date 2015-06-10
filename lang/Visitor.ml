open MetaLanguageAST
open Util

module type MetaLanguageVisitor =
      sig
         type t 
         type s
         val visit_action : s -> env -> action -> s*(t maybe)
         val visit_state : s -> env -> state -> s*(t maybe)
         val visit_parameter : s -> env -> parameter -> s*(t maybe)
         val visit_actions : s-> env -> action list -> s*(t maybe)
         val visit_states : s-> env -> state list -> s*(t maybe)
         val visit_parameters : s-> env -> parameter list -> s*(t maybe)
         val visit_env : s -> env -> s*t
      end;;
