open Pycaml
open Sys
open Printf
open SymCamlData
(* Check out sympy *)

type spy_expr_or_var = 
   | Var of string 
   | Expr of spy_expr

module SymCaml : 
sig
   val init : unit -> unit
   val print_info : unit -> unit
   val define_symbol : string -> spy_expr
   val define_expr : string -> spy_expr -> unit
   val expand : spy_expr_or_var -> unit
   val print_var : string -> unit
   val get_var : string -> spy_expr
   val clear : unit -> unit
end = 
struct 
   let print_info () = 
      Printf.printf "At least python 3.1 required.";
      Printf.printf "home: %s\n" (py_getpythonhome());
      Printf.printf "prefix:  %s\n" (py_getprefix());
      Printf.printf "eprefix: %s\n" (py_getexecprefix());
      Printf.printf "init: %d\n" (py_isinitialized());
      Printf.printf "mpath: %s\n" (py_getpath());
      Printf.printf "version: %s\n" (py_getversion());
      Printf.printf "----------"

   let _env (n:string) : string = "env[\""^n^"\"]"

   let init () =
      let modulename = "sympy" in 
      py_setprogramname("sympy.interp");
      py_initialize();
      pyrun_simplestring("from sympy import *"); 
       pyrun_simplestring("env = {}"); 
      ()

   let clear () = 
       pyrun_simplestring("env = {}"); ()

   
   let rec expr2py (e:spy_expr) : string= 
      let exprlst2py (fn:'a -> string -> string) (lst:'a list) : string =
         match lst with
         | h::t -> List.fold_right fn  t (expr2py h)
         | [] -> ""
      in
      match e with
      | Symbol(s) -> (_env s)
      | Integral(e,s) -> "Integral("^(expr2py e)^","^(s)^")"
      | Cos(e) -> "cos("^(expr2py e)^")"
      | Sin(e) -> "sin("^(expr2py e)^")"
      | Tan(e) -> "tan("^(expr2py e)^")"
      | Mult(es) -> exprlst2py (fun x r ->r^"*"^(expr2py x)) es 
      | Add(es) -> exprlst2py (fun x r ->r^"+"^(expr2py x)) es 
      | Exp(a,b) -> (expr2py (Paren a))^"**"^(expr2py (Paren b))
      | NatExp(a) -> "exp("^(expr2py (Paren a))^")"
      | Sub(es)  -> exprlst2py (fun x r ->r^"-"^(expr2py x)) es
      | Paren(e) -> "("^(expr2py e)^")" 
      | Number(x) -> string_of_float x
      | Integer(x) -> string_of_int x

   let define_symbol (x:string) : spy_expr =
       pyrun_simplestring((_env x)^"= Symbol(\""^x^"\");"); (Symbol x)


   let define_expr (x:string) (e:spy_expr) = 
      let expr  =(expr2py e) in 
      Printf.printf "printed:%s\n" expr;
      pyrun_simplestring((_env x)^"="^expr); ()
   
   let expand (e:spy_expr_or_var) = match e with
      | Var(v) -> pyrun_simplestring((_env v)^"="^(_env v)^".expand()"); ()
      | Expr(e) -> pyrun_simplestring((expr2py (Paren e))^".expand()"); ()

   let get_var (x:string) : spy_expr = 
      Symbol(x)

   let print_var (x:string) = 
      pyrun_simplestring("print "^(_env x)); ()
   
end

let main () = 
   SymCaml.init();
   SymCaml.define_symbol "a";
   SymCaml.define_symbol "b";
   SymCaml.define_symbol "c";
   SymCaml.define_expr "e" (Exp(Add([Symbol("a");Symbol("b");Symbol("c")]), Integer(3)));
   Printf.printf "-------\n";
   SymCaml.expand (Var "e");
   SymCaml.print_var "a";
   SymCaml.print_var "b";
   SymCaml.print_var "c";
   SymCaml.print_var "e"
;;

if !Sys.interactive then () else main ();;

