open MetaLanguageAST
open Util

module type MetaLanguageVisitor =
      sig
         type s
         val visit_action : s-> env -> action -> s
         val visit_state : s-> env -> state -> s
         val visit_parameter : s-> env -> parameter -> s
         val visit_actions : s-> env -> action list -> s
         val visit_states : s-> env -> state list -> s
         val visit_parameters : s-> env -> parameter list -> s
         val visit_env :  env -> s
      end;;
