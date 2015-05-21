

type actiondef = 
  {
    name : string;
  };;

type typedef = 
  {
    name : string;
  };;


module BSEnv:
sig
  type env = {
    mutable types : typedef list;
    mutable actions : actiondef list;
  }
  val create: unit -> env
  val add: env->typedef -> bool
  val add: env->actiondef -> bool
  val has : env->typedef -> bool
  val has : env->actiondef -> bool
  val print: env->unit
end =
struct
  type env = {
    mutable types : typedef list;
    mutable actions : actiondef list;
  }
  let create() =
    {types=[]; actions=[];}

  let add env t = 
    env.types = t::env.types

  let add env u = 
    env.actions = u::env.actions


  let has env (t:typedef) = 
    List.fold_right 
      (fun (a:typedef) (b:bool) -> a.name == t.name || b) 
      env.types false

  let has env (u:actiondef) = 
    List.fold_right 
      (fun (a:actiondef) (b:bool) -> a.name == u.name || b) 
      env.actions false
  let print env = 
    List.iter (fun (a:typedef) -> print_string "type: ";print_string a.name) env.types;
    List.iter (fun (a:actiondef) -> print_string "action: ";print_string a.name) env.actions
end