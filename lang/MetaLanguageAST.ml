open TypeSystem
open Relation
open Util

(*Implementation*)

type parameter = {
   name: string;
   value: float;
   t: typ;
}

type state = {
   name: string;
   t: typ;
}


type connection = identifier*identifier

type action = {
   t:typ;
   name: string;
   inputs:connection list;
   output:connection list;
}

type bipartite = {
   mutable states: state list;
   mutable actions: action list;
   mutable params: parameter list;
}

type env = {
   mutable ts: TypeSystem.ts;
   mutable g: bipartite;
}

module type MetaLanguageASTSig  = 
sig
   val create : unit -> env
   val define : env->typ->env
   val extend : env -> typ -> typ -> env
   
   val get_action: env->string->action maybe
   val get_state: env->string->state maybe 
   val get_parameter: env->string->parameter maybe

   val add_state: env->string->string->env
   val add_action: env->string->string->(string*string) list->(string*string) list->env
   val add_parameter: env->string->float->env

   val to_string : env->string
end 

module MetaLanguageAST : MetaLanguageASTSig = 
struct
   let create () = 
      {
         ts=TypeSystem.create();
         g={params=[];actions=[];states=[]}
      }

   let define env t = 
      if TypeSystem.has env.ts t then env
      else (env.ts <- (TypeSystem.add env.ts t); env)

   let extend env child parent = 
      env.ts <- (TypeSystem.extends env.ts child parent); env

   let add_parameter env nm v =
      env.g.params <- {name=nm; value=v;t=Parameter}::env.g.params; env
   
   let get_action env nm : action maybe = 
      let rec _get_action (l: action list) = match l with
         | h::t -> 
            begin
               match h with {name=n; inputs=_; output=_; t=_} -> 
                     if n = nm then Some(h) else _get_action t
            end
         | [] -> None
      in
         _get_action env.g.actions

   let get_parameter env nm : parameter maybe = 
      let rec _get_parameter l = match l with
         | h::t -> 
            begin
               match h with  {name=n; value=_; t=_} -> 
                     if n = nm then Some(h) else _get_parameter t
            end
         | [] -> None
      in
         _get_parameter env.g.params
    
    
   let get_state (env:env) (nm:string) : state maybe= 
      let rec _get_state (l: state list) = match l with
         | h::t -> 
            begin
               match h with {name=n; t=_} -> 
                     if n = nm then Some(h) else _get_state t
            end
         | [] -> None
      in
         _get_state env.g.states
    

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


   let add_action (env:env) (name:string) (kind:string) (ins:(string*string) list) (outs:(string*string) list) : env =
      match TypeSystem.get env.ts kind with
         | Some(Action(name,inputs,rel,rules,outputs)) -> 
            let rec find_rel_typ (s:string) (lst:(string*typ) list) : typ maybe = 
               match lst with
               | (nm,ty)::t -> if s = nm then Some(ty) else find_rel_typ s t 
               | [] -> None
            in
            let rec find_env_type (s:string) : typ maybe = 
               match (get_state env s, get_parameter env s, get_action env s) with
                  |(Some(s),_,_) -> Some(s.t)
                  |(_,Some(s),_) -> Some(s.t)
                  |(_,_,Some(s)) -> Some(s.t)
                  | _ -> None
            in
            let rec check_types (names:connection list) : unit = 
               match names with
                  | ((en,et), (rn,rt))::t -> 
                     if TypeSystem.is env.ts et rt then check_types t else
                        raise (TypeException ("input type "^(TypeSystem.type2str et)^" does not match argument type of "^(TypeSystem.type2str rt)))
                     
                  | [] -> ()
            in
            let rec make_mapping (names:(string*string) list) (types: (string*typ) list) : connection list = 
               match names with
                  | (inp_name, rel_name)::t ->
                     begin
                     match ((find_rel_typ rel_name types), (find_env_type inp_name)) with
                     | (Some(rx), Some(nx)) -> ((inp_name,nx),(rel_name,rx))::(make_mapping t types)
                     | (_,None) -> raise (TypeException ("argument "^inp_name^" has not been declared in the environment."))
                     | (None,_) -> raise (TypeException ("no argument for action type "^kind^" exists with name "^rel_name))
                     end
                  | [] -> []
            in
            begin
               try
                  let inp_map = make_mapping ins inputs in 
                  let outp_map = make_mapping outs [outputs] in
                  check_types inp_map;
                  check_types outp_map;
                  env.g.actions <- {inputs=inp_map; output=outp_map; t=Action(name,inputs,rel,rules,outputs); name=name}::env.g.actions;
                  env
               with
                  TypeException(msg) -> raise (GraphException ("Adding action "^name^":"^kind^" failed. "^msg))
            end

         | Some(_) -> raise (TypeException ("the type with name "^kind^" is not an action."))
         | None -> raise (TypeException ("no type exists with name "^kind))
      

   let to_string (env:env) = 
      let rec print_params (p:parameter list) : string = 
         match p with
            | {name=n;value=v;t=ty}::t -> "param "^n^"="^string_of_float(v)^"\n"^(print_params t)
            | [] -> ""
      in
      let rec print_states (p:state list) : string = 
         match p with
            | {name=n;t=State(ty)}::t -> "state "^ty^" "^n^";"^"\n"^(print_states t)
            | {name=n;t=Signal(ty)}::t -> "sig "^ty^" "^n^";"^"\n"^(print_states t)
            | [] -> ""
            | _::t -> raise (PrintException "Failed to parse..")
      in
      let rec print_identifier_list (a:connection list): string = 
         match a with
            |((n1,t1),(n2,t2))::t -> n1^":"^n2^" | "^(print_identifier_list t)
            |[] -> ""
      in
      let rec print_actions (a:action list) : string = 
         match a with
            | {name=n; t=typ; inputs=in_map; output=out_map}::t ->
               "action "^n^"("^
                  (print_identifier_list in_map)^") -> "^
                  (print_identifier_list out_map)^"\n"^
               (print_actions t)
            | [] -> ""
      in
         (TypeSystem.to_string env.ts)^"\n\n"^
         (print_params env.g.params)^"\n\n"^
         (print_states env.g.states)^"\n\n"^
         (print_actions env.g.actions)
end



