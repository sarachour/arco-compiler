open MetaLanguageAST
open Util

module type MetaLanguageVisitor =
      sig
         type s
         val visit_action : s -> action -> s
         val visit_state : s -> state -> s
         val visit_parameter : s -> parameter -> s
         val visit_actions : s -> action list -> s
         val visit_states : s -> state list -> s
         val visit_parameters : s -> parameter list -> s
         val visit_env :  env -> s
      end;;
