open Z3Data
open Compile
open Util
open Interactive
open AST

exception Z3Error of string

let error n m = raise (Z3Error (n^":"^m))


type z3doc = z3st list

let z3_print_debug = print_debug 1

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
    | Z3Var(v) -> os v
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
      os ("(declare-const "^s^" ");
      z3vartyp2buf fb u;
      os ")"
      end
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
      | h::h2::t -> List.fold_right fxn (h2::t) h
      | [h] -> h
      | [] -> error "and_all" "failure"

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
      | Integer(i) -> Z3Int(i)
      | Decimal(d) -> Z3Real(d)
      | _ -> error "ast2z3" "unsupported"
    in
    _ast2z3 x

  let sln2str (x:z3sln) =
    let assign2str a = match a with
    | Z3SetBool(n,v) -> "bool "^n^"="^(string_of_bool v)
    | Z3SetInt(n,v) -> "int "^n^"="^(string_of_int v)
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

  let exec (root:string) (x:z3st list) : z3sln=
    let rankst (x:z3st) = match x with
      | Z3ConstDecl(_) -> 1
      | Z3Assert(_) -> 2
      | Z3Minimize(_) -> 3
      | Z3Maximize(_) -> 3
      | Z3SAT -> 4
      | Z3DispModel -> 5
      | Z3Comment(_) -> 6
    in
    let sortsts (x:z3st) (y:z3st) : int = (rankst x) - (rankst y)  in
    let fname =  "z3-tmp."^root^".z3" in
    let oc = open_out fname in
    (*let x = List.sort sortsts (LIST.uniq x) in*)
    let _ = z3stmts2buf oc x in
    let _ = close_out oc in
    let _ = z3_print_debug "---> Executing SMT Solver\n" in
    let _ = flush_all () in
    let res = "z3-res."^root^".z3" in
    let _ = Sys.command ("z3 -smt2 "^fname^" > "^res) in
    let _ = z3_print_debug "---> Finished Search\n" in
    let _ = flush_all () in
    let z = ParserGenerator.file_to_z3sln res in
    z

end
