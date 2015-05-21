

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
  val merge: env -> env -> env
  val add_type: env->typedef -> env
  val add_action: env->actiondef -> env
  val has_type : env->typedef -> bool
  val has_action : env->actiondef -> bool
  val make_type : string -> typedef
  val make_action : string -> actiondef
  val print: env->unit
end =
struct
  type env = {
    mutable types : typedef list;
    mutable actions : actiondef list;
  }
  let create() =
    {types=[]; actions=[];}

  let make_type name = ({name=name}:typedef)
  let make_action name = ({name=name}:actiondef)
  let merge e1 e2 =
    let n = create() in
      n.types <- e1.types @ e2.types;
      n.actions <- e1.actions @ e2.actions;
      n
  let add_type env t = 
    env.types <- t::env.types;
    env

  let add_action env u = 
    env.actions <- u::env.actions;
    env


  let has_type env (t:typedef) = 
    List.fold_right 
      (fun (a:typedef) (b:bool) -> a.name = t.name || b) 
      env.types false

  let has_action env (u:actiondef) = 
    List.fold_right 
      (fun (a:actiondef) (b:bool) -> a.name = u.name || b) 
      env.actions false

  let print env = 
    List.iter (fun (a:typedef) -> print_string "type: ";print_string a.name; print_string "\n") env.types;
    List.iter (fun (a:actiondef) -> print_string "action: ";print_string a.name; print_string "\n") env.actions
end