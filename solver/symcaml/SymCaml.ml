open Pycaml
open Sys
open Printf
open SymCamlData
(* Check out sympy *)

module SymCaml : 
sig
   val init : unit -> unit
   val print_info : unit -> unit
   val define_symbol : string -> unit
   val define_expr : string -> spy_expr -> unit
   val print_var : string -> unit
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

   let init () =
      let modulename = "sympy" in 
      py_setprogramname("sympy.interp");
      py_initialize();
      pyrun_simplestring("from sympy import *"); 
      ()

   let define_symbol (x:string) =
       pyrun_simplestring(x^"= Symbol(\"x\");"); ()


   let rec expr2py (e:spy_expr) : string= 
      let exprlst2py (fn:'a -> string -> string) (lst:'a list) : string =
         match lst with
         | h::t -> List.fold_right fn  t (expr2py h)
         | [] -> ""
      in
      match e with
      | Symbol(s) -> s
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

   let define_expr (x:string) (e:spy_expr) = 
      let expr  =(expr2py e) in 
      Printf.printf "%s\n" expr;
      pyrun_simplestring(x^"="^expr); ()
   
   let print_var (x:string) = 
      pyrun_simplestring("print "^x); ()
   
end

let main () = 
   SymCaml.init();
   SymCaml.define_symbol "a";
   SymCaml.define_symbol "b";
   SymCaml.define_symbol "c";
   SymCaml.define_expr "e" (Exp(Add([Symbol("a");Symbol("b");Symbol("c")]), Integer(3)));
   SymCaml.print_var "e"
;;

if !Sys.interactive then () else main ();;

