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
   t: typ;
}

type state = {
   name: string;
   t: typ;
}


type action = {
   t:typ;
   name: string;
   inputs:identifier*identifier list;
   output:identifier*identifier list;
}


module type BipartiteGraphEnvironmentSig = 
sig
   type connection = identifier*identifier
   type bipartite = {
      mutable states: state list;
      mutable actions: action list;
      mutable params: parameter list;
      mutable conns: connection list;
   }
   type env = {
      mutable ts: TypeSystem.ts;
      mutable g: bipartite;
      metrics: metric list;
   }

   val create : unit -> env
   val define : env->typ->env
   val extend : env -> typ -> typ -> env
   
   val get_action: env->string->action maybe
   val get_state: env->string->state maybe 
   val get_parameter: env->string->parameter maybe

   val add_state: env->string->string->env
   val add_action: env->string->string->string*string list->string*string list->env
   val add_parameter: env->string->float->env

   val to_string : env->string
end 

module BipartiteGraphEnvironment : BipartiteGraphEnvironmentSig = 
struct
   type connection = identifier*identifier
   ;;
   type bipartite = {
      mutable states: state list;
      mutable actions: action list;
      mutable params: parameter list;
      mutable conns: connection list;
   }
   type env = {
      mutable ts: TypeSystem.ts;
      mutable g: bipartite;
      metrics: metric list;
   }
   let create () = 
      {
         ts=TypeSystem.create(); 
         metrics=[];
         g={params=[];conns=[];actions=[];states=[]}
      }

   let define env t = 
      if TypeSystem.has env.ts t then env
      else (env.ts <- (TypeSystem.add env.ts t); env)

   let extend env child parent = 
      env.ts <- (TypeSystem.extends env.ts child parent); env

   let add_parameter env nm v =
      env.g.params <- {name=nm; value=v;t=Parameter}::env.g.params; env
   
   let get_action env nm = 
      None
    
   let get_parameter env nm = 
      None
    
   let get_state env nm = 
      None

   let add_state env ty nm= 
      if TypeSystem.has env.ts (State ty) then
         if get_state env nm = None then
            begin
               env.g.states <- {name=nm; t=(State ty)}::env.g.states;
               env
            end
         else
            raise (GraphException ("state "^nm^" already defined."))
      else if TypeSystem.has env.ts (Signal ty) then
         if get_state env nm = None then
            begin
               env.g.states <- {name=nm; t=(Signal ty)}::env.g.states;
               env
            end
         else
            raise (GraphException ("state "^nm^" already defined."))
      else
         raise (TypeException ("no type exists with name "^ty))


   let add_action (env:env) (kind:string) (name:string) (ins:string*string list) (outs:string*string list) : env =
      env

   let to_string (env:env) = 
      let rec print_params (p:parameter list) = 
         match p with
            | {name=n;value=v;t=ty}::t -> "param "^n^"="^string_of_float(v)^"\n"^(print_params t)
            | [] -> ""
      in
      let rec print_states (p:state list) = 
         match p with
            | {name=n;t=State(ty)}::t -> "state "^ty^" "^n^";"^"\n"^(print_states t)
            | {name=n;t=Signal(ty)}::t -> "sig "^ty^" "^n^";"^"\n"^(print_states t)
            | [] -> ""
            | _::t -> "<failed to parse>\n"^(print_states t)
      in
         (print_params env.g.params)^"\n\n"^
         (print_states env.g.states)
end



