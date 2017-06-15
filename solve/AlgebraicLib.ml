open AST
open Util
open Sys
open Core.Std
open SymCaml
open Interactive

exception AlgebraicLib_error of string


module AlgebraicLib =
struct

 module UnifyEnv =
  struct
    type 'a unify_t =
      | DefinePat of 'a
      | DefineSym of 'a
      | DefinePatExpr of 'a*'a ast
      | DefinePatDerivExpr of 'a*'a ast*'a ast
      | DefineSymExpr of 'a*'a ast
      | DefineSymDerivExpr of 'a*'a ast*'a ast
      | InitPat of 'a*'a ast
      | DefineSymParam of 'a*number list
      | DefinePatParam of 'a*number list
      | PatPrioritize of 'a
      | SymPrioritize of 'a

    type 'a t = {
      mutable steps: 'a unify_t list;
      mutable syms: 'a list;
      mutable pats: 'a list;
      mutable sym_pars: 'a list;
      mutable pat_pars: 'a list;
      to_string: 'a -> string;
      label: string;
      
    }

    let init (type a) : string -> (a->string) -> a t =
      fun label tostr -> {steps=[]; syms=[]; pats=[];
                 sym_pars=[]; pat_pars=[];
                 to_string=tostr;label=label}

    let enq  e s = e.steps <- s::e.steps

    let define_sym (type a) : a t -> a -> unit =
      fun env var ->
        enq env (DefineSym(var));
        if LIST.has env.syms var = false then
          env.syms <- var::env.syms;
        ()

    let define_pat (type a) : a t -> a -> unit =
      fun env var ->
        enq env (DefinePat(var));
        if LIST.has env.pats var = false then
          env.pats <- var::env.pats;
        ()

    let init_pat (type a) : a t -> a -> a ast -> unit =
      fun env var expr ->
        enq env (InitPat(var,expr));
        ()

    let define_pat_expr (type a) : a t -> a -> a ast -> unit =
      fun env var expr ->
        enq env (DefinePatExpr(var,expr));
        ()

    let define_pat_deriv_expr (type a) : a t -> a -> a ast -> a ast -> unit =
      fun env var expr ic ->
        enq env (DefinePatDerivExpr(var,expr,ic));
        ()

    let define_sym_expr (type a) : a t -> a -> a ast -> unit =
      fun env var expr ->
        enq env (DefineSymExpr(var,expr));
        ()

    let define_sym_deriv_expr (type a) : a t -> a -> a ast -> a ast -> unit =
      fun env var expr ic ->
        enq env (DefineSymDerivExpr(var,expr,ic));
        ()

    let define_sym_param (type a) : a t -> a -> number list -> unit =
      fun env par values ->
        enq env (DefineSymParam(par,values));
        if LIST.has env.sym_pars par = false then
          env.sym_pars <- par::env.sym_pars;
        ()

    let define_pat_param (type a) : a t -> a -> number list -> unit =
      fun env par values ->
        enq env (DefinePatParam(par,values));
        if LIST.has env.pat_pars par = false then
          env.pat_pars <- par::env.pat_pars;
        ()

    let pat_prioritize (type a) : a t -> a -> unit =
      fun env var ->
        enq env (PatPrioritize(var));
        ()

    let sym_prioritize (type a) : a t -> a -> unit =
      fun env var ->
        enq env (SymPrioritize(var));
        ()

    let iter_steps (type a) : a t -> (a unify_t -> unit) -> unit =
      fun env fx ->
        List.iter ~f:fx (List.rev env.steps) 
  end


  module VarMapper =
  struct
    exception Varmapper_error of string

    type 'a t = {conv:('a,string) map;inv:(string,'a) map;to_string:'a->string}

    let init (type a) : (a -> string) -> a t=
      fun tostr ->
        {conv=MAP.make();inv=MAP.make();to_string = tostr}

    let clear (type a): a t -> unit =
      fun env ->
        MAP.clear env.conv;
        MAP.clear env.inv;
        ()

    let destroy : 'a t -> unit =
      fun el ->
        ()

    let map : 'a t -> 'a -> string -> unit =
      fun mp (v:'a) (s:string) ->
        if MAP.has mp.conv v then
          raise (Varmapper_error "variable ident already exists")
        else if MAP.has mp.inv s  then
          raise (Varmapper_error ("variable str already exists:"^s))
        else
          begin
            noop (MAP.put mp.conv v s);
            noop (MAP.put mp.inv s v)
          end

    let conv_v : 'a t -> 'a -> string =
      fun mp x ->
        if MAP.has mp.conv x then
          MAP.get mp.conv x
        else
          raise (AlgebraicLib_error ("[a->v] variable isn't in varmapper: "^(mp.to_string x)))

    let inv_v : 'a t -> string -> 'a =
      fun mp x ->
        if MAP.has mp.inv x then
          MAP.get mp.inv x
        else
          raise (AlgebraicLib_error ("[v->a] variable isn't in varmapper: "^x))

    let conv_e : 'a t -> 'a ast -> string ast =
      fun mp expr ->
        ASTLib.map expr (fun x ->  conv_v mp x)

    let inv_e : 'a t -> string ast -> 'a ast =
      fun mp expr ->
        ASTLib.map expr (fun x -> inv_v mp x) 
  end


  type 'a t = {
    varmap: 'a VarMapper.t;
  }

  let id = REF.mk 0

  let init (type a):  (a -> string)-> a t =
    fun tostr ->
      {varmap=VarMapper.init(tostr)}

  let simplify (type a) (env:a t) (expr: a ast) =

      ()

  let write_var (type a) : out_channel -> string -> a t -> a -> a ast -> a ast option  -> unit=
    fun fh soeq env v e ic_maybe -> 
      let varb :string = VarMapper.conv_v env.varmap v in
      let defn =
        Printf.fprintf fh
          "engine.%s.define_variable(\"%s\")\n" soeq varb 
      in
      match ic_maybe with
      | Some(ic) ->
        begin
          Printf.fprintf fh
            "engine.%s.add_diff_eqn(%s,%s)\n"
            soeq varb (ASTLib.ast2str (VarMapper.conv_e env.varmap e) ident);
          Printf.fprintf fh
            "engine.%s.add_ic(%s,%s\n)\n"
            soeq varb (ASTLib.ast2str (VarMapper.conv_e env.varmap ic) ident);
          ()
        end

        | None ->
          Printf.fprintf fh
              "engine.%s.add_eqn(%s,%s)\n"
              soeq varb (ASTLib.ast2str (VarMapper.conv_e env.varmap e) ident)

  
   let unify (type a) (env:a t) (prob:a UnifyEnv.t) (n) (size) =
     VarMapper.clear env.varmap;
     print_string "=== SYMS ====\n";
     List.iteri ~f:(fun i (v:a) ->
         VarMapper.map env.varmap v ("v"^(string_of_int i))
       ) prob.syms;
     List.iteri ~f:(fun i (v:a) ->
         VarMapper.map env.varmap v ("pv"^(string_of_int i))
       ) prob.sym_pars;
     print_string "=== PATS ====\n";
     List.iteri ~f:(fun i (v:a) ->
         VarMapper.map env.varmap v ("x"^(string_of_int i))
       ) prob.pats;
     List.iteri ~f:(fun i (v:a) ->
         VarMapper.map env.varmap v ("px"^(string_of_int i))
       ) prob.pat_pars;
     let file = "unify_"^(string_of_int (REF.dr id))^".py" in
     let outfile = "unify_"^(string_of_int (REF.dr id))^".out" in
     let logfile= "unify_"^(string_of_int (REF.dr id))^".log" in
     print_string ("==== Evaluating <"^file^"> ====\n");
     REF.upd id (fun x -> x+1);
     let fh = open_out file in
     Printf.fprintf fh
       "import sys\n";
     Printf.fprintf fh
       "sys.path.insert(0,'engines')\n";
     Printf.fprintf fh
       "from engines.sympy_engine import engine\n";
     Printf.fprintf fh
       "engine.label(\"%s\")\n"
       prob.label;
     UnifyEnv.iter_steps prob (fun (step: a UnifyEnv.unify_t) ->
         match step with
         | DefinePat(v) ->
           begin
             Printf.fprintf fh
               "engine.templ.define_variable(\"%s\")\n"
               (VarMapper.conv_v env.varmap v);
             Printf.fprintf fh
               "engine.templ.label_variable(\"%s\",\"%s\")\n"
               (VarMapper.conv_v env.varmap v) (prob.to_string v)
           end

         | DefineSym(v) ->
             begin
               Printf.fprintf fh
                 "engine.targ.define_variable(\"%s\")\n"
                 (VarMapper.conv_v env.varmap v);
               Printf.fprintf fh
                 "engine.targ.label_variable(\"%s\",\"%s\")\n"
                 (VarMapper.conv_v env.varmap v) (prob.to_string v)
             end

         | DefinePatExpr(v,e) ->
           Printf.fprintf fh
             "engine.templ.add_eqn(\"%s\",\"%s\")\n"
             (VarMapper.conv_v env.varmap v)
             (ASTLib.ast2str (VarMapper.conv_e env.varmap e) ident)

         | DefineSymExpr(v,e) ->
           Printf.fprintf fh
             "engine.targ.add_eqn(\"%s\",\"%s\")\n"
             (VarMapper.conv_v env.varmap v)
             (ASTLib.ast2str (VarMapper.conv_e env.varmap e) ident)

         | DefinePatDerivExpr(v,e,ic) ->
           begin
             Printf.fprintf fh
               ("engine.templ.add_diff_eqn(\"%s\",\"%s\")\n")
               (VarMapper.conv_v env.varmap v)
               (ASTLib.ast2str (VarMapper.conv_e env.varmap e) ident);
             Printf.fprintf fh
               ("engine.templ.add_ic(\"%s\",\"%s\")\n")
               (VarMapper.conv_v env.varmap v)
               (ASTLib.ast2str (VarMapper.conv_e env.varmap ic) ident)
           end

         | DefineSymDerivExpr(v,e,ic) ->
           begin
             Printf.fprintf fh
               ("engine.targ.add_diff_eqn(\"%s\",\"%s\")\n")
               (VarMapper.conv_v env.varmap v)
               (ASTLib.ast2str (VarMapper.conv_e env.varmap e) ident);
             Printf.fprintf fh
               ("engine.targ.add_ic(\"%s\",\"%s\")\n")
               (VarMapper.conv_v env.varmap v)
               (ASTLib.ast2str (VarMapper.conv_e env.varmap ic) ident)
           end
         | DefinePatParam(par,vals) ->
           begin
             Printf.fprintf fh
              "engine.templ.define_param(\"%s\",[%s])\n"
              (VarMapper.conv_v env.varmap par)
              (LIST.tostr  string_of_number "," vals);
             Printf.fprintf fh
               "engine.templ.label_param(\"%s\",\"%s\")\n"
               (VarMapper.conv_v env.varmap par) (prob.to_string par)
           end

         | DefineSymParam(par,vals) ->
           begin
             Printf.fprintf fh
               "engine.targ.define_param(\"%s\",[%s])\n"
               (VarMapper.conv_v env.varmap par)
               (LIST.tostr  string_of_number "," vals);
             Printf.fprintf fh
               "engine.targ.label_param(\"%s\",\"%s\")\n"
               (VarMapper.conv_v env.varmap par) (prob.to_string par)
           end

         | InitPat(v,e) ->
           Printf.fprintf fh
             "engine.templ.init_var(\"%s\",\"%s\")\n"
             (VarMapper.conv_v env.varmap v)
             (ASTLib.ast2str (VarMapper.conv_e env.varmap e) ident)
             
         | SymPrioritize(v) ->
           Printf.fprintf fh
             "engine.targ.prioritize(\"%s\")\n"
             (VarMapper.conv_v env.varmap v)
         | PatPrioritize(v) ->
           Printf.fprintf fh
             "engine.templ.prioritize(\"%s\")\n"
             (VarMapper.conv_v env.varmap v)

       );
     Printf.fprintf fh
       "engine.set_restrict_branches(%d)\n" n;
     Printf.fprintf fh
       "engine.set_restrict_size(%d)\n" size;
     Printf.fprintf fh
       "engine.solve()\n";
     Printf.fprintf fh
       "engine.write(\"%s\")\n" outfile;
     close_out fh;
     Sys.command ("python "^file^" > "^logfile);
     let oh = open_in outfile in
     let result : (a*a ast) list list =
       In_channel.fold_lines oh ~init:[]
        ~f:(fun (slns: (a*a ast) list list) (line:string)->
          let terms = STRING.split line "|" in
          let sln : (a*a ast) list = List.map ~f:(
              fun (term:string) ->
                let args = String.split term '$' in
                match args with
                | [lhs;rhs] ->
                  begin
                    print "[ALG]" (lhs^"="^rhs);
                    let vr : a = VarMapper.inv_v env.varmap lhs in
                    let expr : a ast =
                      ASTLib.from_symcaml (SymCaml.string_of_repr rhs)
                        (VarMapper.inv_v env.varmap)
                    in
                    (vr,expr)
                  end
                | _ -> raise (AlgebraicLib_error "unexpected")
            ) terms
          in
          sln::slns
        )
     in
     result
    


end
