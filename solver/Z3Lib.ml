open Z3Data
open Compile
open Util
exception Z3Error of string

let error n m = raise (Z3Error (n^":"^m))


type z3doc = z3st list

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

  let z3stmts2str x =
    let res = List.fold_left (fun r x -> r^"\n"^(z3st2str x)) "" x in
    res

  let fn_all (x:z3expr list) (fxn)=
      match x with
      | h::h2::t -> List.fold_right fxn (h2::t) h
      | [h] -> h
      | [] -> error "and_all" "failure"

  let add_all (x) =
    fn_all x (fun x r -> Z3And(x,r))

  let or_all (x:z3expr list) =
    fn_all x (fun x r -> Z3Or(x,r))

  let plus_all (x:z3expr list) =
    fn_all x (fun x r -> Z3Plus(x,r))

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

  let exec (x:z3st list) : z3sln=
    let sortsts (x:z3st) (y:z3st) : int = match (x,y) with
    | (Z3ConstDecl(_),Z3Assert(_)) -> -1
    | (Z3Assert(_),Z3ConstDecl(_)) -> 1
    | (Z3DispModel,_) -> 1
    | (_,Z3DispModel) -> -1
    | (Z3SAT,_) -> 1
    | (_,Z3SAT) -> -1
    | _ -> if x = y then 0 else 1
    in
    let x = List.sort sortsts (LIST.uniq x) in
    let prob = z3stmts2str x in
    let fname =  "__tmp__.z3" in
    let res = "__res__.out" in
    let _ = IO.save fname prob in
    let _ = Printf.printf "---> Executing SMT Solver\n" in
    let _ = flush_all () in
    let _ = Sys.command ("z3 -smt2 "^fname^" > "^res) in
    let _ = Printf.printf "---> Finished Search\n" in
    let _ = flush_all () in
    let z = ParserGenerator.file_to_z3sln res in
    z

end
