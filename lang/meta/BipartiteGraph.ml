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

type identifier = string*typ

type action = {
   t:typ;
   name: string;
   inputs:identifier list;
   output:identifier;
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
   val add_action: env->string->string->string list->string->env
   val add_parameter: env->string->float->env
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
      env.ts <- (TypeSystem.extends env.ts parent child); env

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
      else
         raise (TypeException ("no type exists with name "^ty))


   let add_action env kind nm ins out =
      let get_ident env typ nm : identifier maybe = 
         begin
         match typ with
            | Parameter -> 
               begin
               match(get_parameter env nm) with 
                  |Some(_) -> Some(nm,typ) 
                  | None -> None
               end
            | State(_) -> 
               begin
               match get_state env nm with 
                  |None -> None
                  |Some(v) -> 
                     if (TypeSystem.is env.ts v.t typ) 
                        then Some(nm,typ) 
                        else None
               end
            | _ -> None
         end
      in
      let rec get_ident_list env typlst lst = 
         begin
         match (typlst,lst) with
            | (t::t1::tr, n::n1::lr) -> 
               begin
               match (get_ident env t n, get_ident_list env (t1::tr) (n1::lr)) with
                  (Some(a), Some(q))-> Some(a::q)
                  | _ -> None
               end
            | ([t], [n]) ->  
               begin 
               match (get_ident env t n) with
                  | Some(a) -> Some([a]) 
                  | None -> None
               end
            | _ -> None
         end 
      in
      begin
         match TypeSystem.get env.ts kind with
            |Some(Action(tnm,tins,rel,tout)) ->
               let inputs = get_ident_list env tins ins in 
               let output = get_ident env tout out in
                  begin 
                     match(inputs, output) with
                        | (Some(in_e), Some(out_e)) -> 
                           let telem = Action(tnm,tins,rel,tout) in
                           let elem = {name=nm;inputs=in_e;output=out_e;t=telem} in 
                           let into = List.map (fun inp -> (inp,(nm,telem))) in_e in 
                           let out = List.map (fun outp -> ((nm,telem),outp)) [out_e] in
                              env.g.actions <- elem::env.g.actions; 
                              env.g.conns <- out@into@env.g.conns;
                              env
                        | _ ->
                           raise (TypeException ("Action type signature doesn't match identifiers."))
                  end
            | _ -> raise (TypeException ("no action type with name "^nm^"."))
      end
end



