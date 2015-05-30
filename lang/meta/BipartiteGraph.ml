open TypeSystem
open Relation
open Util

(*Implementation*)

type metric = {
   name: string
}
type parameter = {
   name: string;
   value: float;
}

type state = {
   name: string;
   t: typ;
}

type identifier = 
   Parameter of string
   | State of string*typ


type action = {
   t:typ;
   input:identifier list;
   rel:relation;
   out:identifier;
}


module type BipartiteGraphEnvironmentSig = 
sig
   type connection = 
      | ToRight of state*action
      | ToLeft of action*state
   ;;
   type bipartite = {
      mutable states: state list;
      mutable actions: action list;
      mutable params: parameter list;
      mutable conns: connection list;
   }
   type env = {
      mutable types: TypeSystem.ts;
      mutable graph: bipartite;
      metrics: metric list;
   }

   val create : unit -> env
   val define : env->typ->env
   val add_state: env->typ->string->env
   val add_action: env->string list->relation maybe->string->env
   val add_parameter: env->string->float->env
end 

module BipartiteGraphEnvironment : BipartiteGraphEnvironmentSig = 
struct
   type connection = 
      | ToRight of state*action
      | ToLeft of action*state
   ;;
   type bipartite = {
      mutable states: state list;
      mutable actions: action list;
      mutable params: parameter list;
      mutable conns: connection list;
   }
   type env = {
      mutable types: TypeSystem.ts;
      mutable graph: bipartite;
      metrics: metric list;
   }


end



