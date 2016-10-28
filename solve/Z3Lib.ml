open Z3Data
open Compile
open Util
open Interactive
open AST

exception Z3Error of string

let error n m = raise (Z3Error (n^":"^m))


type z3doc = z3st list

let z3_print_debug = print_debug 1
let debug = print_debug 1

module Z3Lib =
struct


  let z3expr2str x =
    let rec _s x = match x with
    | Z3And(a,b) -> "(and "^(_s a)^" "^(_s b)^")"
    | Z3Or(a,b) -> "(or "^(_s a)^" "^(_s b)^")"
    | Z3Eq(a,b) -> "(= "^(_s a)^" "^(_s b)^")"
    | Z3Not(a) -> "(not "^(_s a)^")"
    | Z3Plus(a,b) -> "(+ "^(_s a)^" "^(_s b)^")"
    | Z3IfThenElse(a,b,c) -> "(ite "^(_s a)^" "^(_s b)^" "^(_s c)^")"
    | Z3Var(v) -> v
    | Z3LT(a,b) -> "(< "^(_s a)^" "^(_s b)^")"
    | Z3GT(a,b) -> "(> "^(_s a)^" "^(_s b)^")"
    | Z3LTE(a,b) -> "(<= "^(_s a)^" "^(_s b)^")"
    | Z3GTE(a,b) -> "(>= "^(_s a)^" "^(_s b)^")"
    | Z3Int(i) -> string_of_int i
    | Z3Bool(true) -> "true"
    | Z3Bool(false) -> "false"
    | _ -> error "z3" "unexpected"
    in
    _s x

  let z3vartyp2str x = match x with
  | Z3Bool -> "Bool"
  | Z3Int -> "Int"

  let z3st2str x =
    match x with
    | Z3ConstDecl(s,u) -> "(declare-const "^s^" "^(z3vartyp2str u)^")"
    | Z3Assert(q) -> "(assert "^(z3expr2str q)^")"
    | Z3SAT -> "(check-sat)"
    | Z3DispModel -> "(get-model)"


  let z3expr2buf fb x =
    let os x = output_string fb x in
    let rec _s x = match x with
    | Z3And(a,b) ->
      begin
      os "(and ";
      _s a;
      os " ";
      _s b;
      os ")"
      end
    | Z3Or(a,b) ->
      begin
      os "(or ";
      _s a;
      os " ";
      _s b;
      os ")"
      end
    | Z3Eq(a,b) ->
      begin
      os "(= ";
      _s a;
      os " ";
      _s b;
      os ")"
      end
    | Z3Not(a) ->
      begin
      os "(not ";
      _s a;
      os ")"
      end
    | Z3Plus(a,b) ->
      begin
      os "(+ ";
      _s a;
      os " ";
      _s b;
      os ")"
      end
    | Z3Sub(a,b) ->
      begin
      os "(- ";
      _s a;
      os " ";
      _s b;
      os ")"
      end
    | Z3Mult(a,b) ->
      begin
      os "(* ";
      _s a;
      os " ";
      _s b;
      os ")"
      end
    | Z3IfThenElse(a,b,c) ->
      begin
      os "(ite ";
      _s a;
      os " ";
      _s b;
      os " ";
      _s c;
      os ")"
      end
    | Z3LT(a,b) ->
      begin
      os "(< ";
      _s a;
      os " ";
      _s b;
      os ")"
      end
    | Z3LTE(a,b) ->
      begin
      os "(<= ";
      _s a;
      os " ";
      _s b;
      os ")"
      end
    | Z3GT(a,b) ->
      begin
      os "(> ";
      _s a;
      os " ";
      _s b;
      os ")"
      end
    | Z3GTE(a,b) ->
      begin
      os "(>= ";
      _s a;
      os " ";
      _s b;
      os ")"
      end
    | Z3Fun(name,args) ->
      begin
        os ("(");
        os name;
        List.iter (fun arg ->
            os " "; _s arg) args;
        os ")"
        end
    | Z3Var(v) -> os v
    | Z3Neg(v) ->
      begin
        os "(- ";
        _s v;
        os ")"
      end
    | Z3Int(i) -> os (string_of_int i)
    | Z3Real(i) -> os (string_of_float i)
    | Z3Bool(true) -> os "true"
    | Z3Bool(false) -> os "false"
    | _ -> error "z3" "unexpected term when writing to buf"
    in
    _s x

  let z3vartyp2buf fb x =
    let os x = output_string fb x in
    match x with
    | Z3Bool -> os "Bool"
    | Z3Int -> os "Int"
    | Z3Real -> os "Real"

  let z3st2buf fb x =
    let os x = output_string fb x in
    match x with
    | Z3ConstDecl(s,u) ->
      begin
        (*os ("(declare-const "^s^" ");*)
      os ("(declare-fun "^s^" () ");
      z3vartyp2buf fb u;
      os ")"
      end
    | Z3Stmt(s) ->
      os s
    | Z3Assert(q) ->
      begin
      os "(assert ";
      z3expr2buf fb q;
      os ")"
      end
    | Z3Comment(str) -> os ("; "^str)
    | Z3SAT -> os "(check-sat)"
    | Z3DispModel -> os "(get-model)"
    | Z3Minimize(q) ->
      begin
      os "(minimize ";
      z3expr2buf fb q;
      os ")"
      end
    | Z3Maximize(q) ->
      begin
      os "(maximize ";
      z3expr2buf fb q;
      os ")"
      end

  let z3stmts2buf fb x =
    let os x = output_string fb x in
    let _ = List.iter (fun x -> let _ = z3st2buf fb x in os "\n") x in
    ()

  let fn_all (x:z3expr list) (fxn)=
      match x with
      | h::h2::t -> List.fold_left fxn h (h2::t) 
      | [h] -> h
      | [] -> error "fn_all" "failure"


  let eq_all (x) =
    fn_all x (fun x r -> Z3Eq(x,r))


  let sum_all (x) =
    fn_all x (fun x r -> Z3Plus(x,r))

  let or_all (x:z3expr list) =
    fn_all x (fun x r -> Z3Or(x,r))

  let plus_all (x:z3expr list) =
    fn_all x (fun x r -> Z3Plus(x,r))

  let ast2z3 (x:'a ast)(f:'a -> z3expr) =
    let rec _ast2z3 el = 
      match el with
      | Term(name) -> f name 
      | OpN(Add,lst) ->
        fn_all (List.map (fun e -> _ast2z3 e) lst) (fun a b-> Z3Plus(a,b))
      | OpN(Mult,lst) ->
        fn_all (List.map (fun e -> _ast2z3 e) lst) (fun a b-> Z3Mult(a,b))
      | OpN(Sub,h::h2::t) ->
        Z3Sub(_ast2z3 h, _ast2z3 (OpN(Add,h2::t)) )
      | Op1(Neg,arg) -> Z3Neg(_ast2z3 arg)
      | Integer(i) -> Z3Int(i)
      | Decimal(d) -> Z3Real(d)
      | OpN(_) -> error "ast2z3" "opn unsupported"
      | Op2(_) -> error "ast2z3" "op2 unsupported"
      | Op1(_) -> error "ast2z3" "op1 unsupported"
      | _ -> error "ast2z3" "acc/en unsupported"
    in
    _ast2z3 x

  let sln2str (x:z3sln) =
    let qty2str a = match a with
      |Z3QInt(i) -> string_of_int i
      | _ -> "UNIMPL"
    in
    let assign2str a = match a with
    | Z3Set(n,v) -> "set "^n^"="^(qty2str v)
    in
    let assigns2str a =
      List.fold_right (fun x r -> r^"\n"^(assign2str x)) a ""
    in
    let sat = if x.sat then  "SAT" else "UNSAT" in
    let mdl = match x.model with
    | Some(m) -> "MODEL\n"^(assigns2str m)
    | None -> "(no model)"
    in
    sat^"\n\n"^mdl

  let use_dreal = true 
    

  let exec (root:string) (stmts:z3st list) : z3sln=
    let stmts =
      if use_dreal then
        (Z3Stmt("(set-logic QF_NRA)")::stmts) @ [Z3SAT]
      else
        stmts @ [Z3SAT; Z3DispModel]
    in
    let smtfile =  "z3-tmp."^root^".smt2" in
    let resfile = "z3-res."^root^".res" in
    let oc = open_out smtfile in
    (*let x = List.sort sortsts (LIST.uniq x) in*)
    z3stmts2buf oc stmts;
    close_out oc;
    z3_print_debug "---> Executing SMT Solver\n";
    flush_all ();
    begin
      if use_dreal then
        Sys.command ("dReal --model "^smtfile^" > "^resfile)
      else
        Sys.command ("z3 -smt2 "^smtfile^" > "^resfile)
    end;
    z3_print_debug "---> Finished Search\n";
    flush_all ();
    begin
      let z =
        if use_dreal then ParserGenerator.file_to_drealsln resfile
        else ParserGenerator.file_to_z3sln resfile
      in
      z
    end

  let get_min_val (v:z3qty) repl =
    let possible_v = match v with
    | Z3QInt(i) -> (float_of_int i)
    | Z3QFloat(i) -> (i)
    | Z3QInterval(Z3QRange(vmin,vmax)) -> (vmin)
    | Z3QInterval(Z3QLowerBound(vmin)) -> (vmin)
    | Z3QInterval(Z3QUpperBound(vmax)) -> (vmax)
    | Z3QInterval(_) -> repl
    | _ -> error "compute_bounds" "unhandled"
    in
    if possible_v < repl then possible_v else repl

  let minimize (root:string) (stmts:z3st list) (expr:z3expr) (minbnd:float) (maxbnd:float) : z3sln=
    if use_dreal then
      begin
        let minvar = "__minima__" in
        let has_solution sln =
          if sln.sat = false || sln.model = None then None else sln.model
        in
        let get_min_qty model = List.fold_right (fun q minval ->
                  match q with
                  |Z3Set(name,vr) -> if name = minvar
                    then vr else minval
                ) model (Z3QInterval Z3QAny) 
        in
        let min_decl = Z3ConstDecl(minvar,Z3Real) in 
        let min_stmt = Z3Assert(Z3Eq(Z3Var(minvar),expr)) in 
        (*
           the minimize subroutine
        *)
        let rec _minimize min max (depth:int): z3sln option=
          if depth >= 3 then None else
            let midpoint = (min+.max)/. 2. in
            (*compute using the midpoint as a bound*)
            debug "_minimize" (">>> DReal running with max minval = "^(string_of_float midpoint));
            let result: z3sln =
                let min_expr = Z3Assert(Z3LTE(Z3Var(minvar),Z3Real(midpoint))) in
                exec root ((min_decl::stmts)@[min_stmt;min_expr]) 
            in
            match has_solution result with
            | Some(model) ->
              let new_midpoint = get_min_val (get_min_qty model) midpoint in 
              if midpoint = new_midpoint then Some result else
                let better_result = _minimize min new_midpoint (depth+1) in
                begin
                  match better_result with
                  | Some(better_result) -> Some better_result
                  | _ -> Some result
                end
            | None ->
              _minimize midpoint max (depth+1) 
        in
        debug "_minimize" (">>> DReal running feasibility with no minimizer ceiling");
        let initial_result = exec root ((min_decl::stmts)@[min_stmt]) in
        match has_solution initial_result with
        | Some(init_sln) ->
          let min = get_min_val (get_min_qty init_sln) maxbnd in
          begin
            match _minimize minbnd min 0 with
            | Some(result) -> result
            | None -> initial_result
          end
        | None -> initial_result
        
      end
    else
      begin
        exec root (stmts @ [Z3Minimize expr])
      end
end
