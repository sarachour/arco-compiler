open Pycaml
open Sys
open Printf
open SymCamlData
open SymCamlParser
open SymCamlLexer

(* Check out sympy *)

type spy_expr_or_var = 
   | Var of string 
   | Expr of spy_expr

module SymCaml : 
sig
   type symcaml = {
      mdl :pyobject;
      env :pyobject;
   }
   val init : unit -> symcaml
   val print_info : unit -> unit
   val define_symbol : symcaml ->  string -> spy_expr
   val define_expr : symcaml -> string -> spy_expr -> unit
   val expand : symcaml -> spy_expr_or_var -> spy_expr
   val print_var : symcaml ->  string -> unit
   val get_var : symcaml ->  string -> spy_expr
   val clear : symcaml -> unit
   val expr2py : spy_expr -> string
end = 
struct 
   type symcaml = {
      mdl :pyobject;
      env :pyobject;
   }
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

   let _toexpr (s:symcaml) (n:string) : spy_expr = 
      pyrun_simplestring("__token__=srepr("^(_env n)^")");
      let canonical = pydict_getitemstring(s.env, "__token__") in
      let cstr = pystring_asstring (pyobject_repr canonical) in 
      Printf.printf "[%s]\n" cstr; 
      try
         let lexbuf = Lexing.from_string cstr in
         let result = SymCamlParser.main SymCamlLexer.main lexbuf in
         result
      with  
         |SymCamlData.SymCamlParserError(msg) -> raise (SymCamlException ("parse error:"^msg))
         |_ -> raise (SymCamlException "failed.")

   let init () =
      let modulename = "sympy" in 
      py_setprogramname("sympy.interp");
      py_initialize();
      pyrun_simplestring("from sympy import *"); 
      pyrun_simplestring("env = {}"); 
      let mdl = pyimport_addmodule("__main__") in 
      let env = pymodule_getdict(mdl) in
      {mdl=mdl; env=env} 

   let clear s = 
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
      | Decimal(x) -> string_of_float x
      | Integer(x) -> string_of_int x

   let define_symbol (s:symcaml) (x:string) : spy_expr =
       pyrun_simplestring((_env x)^"= Symbol(\""^x^"\");"); (Symbol x)


   let define_expr (s:symcaml) (x:string) (e:spy_expr) = 
      let expr  =(expr2py e) in 
      pyrun_simplestring((_env x)^"="^expr); ()
   
   let expand (s:symcaml) (e:spy_expr_or_var) = 
      let tmp = _env "__tmp__" in
      let _ =
         match e with
         | Var(v) -> pyrun_simplestring(tmp^" ="^(_env v)^".expand()")
         | Expr(e) -> pyrun_simplestring(tmp^" ="^(expr2py (Paren e))^".expand()")
      in
      _toexpr s "__tmp__"

   let get_var (s:symcaml) (x:string) : spy_expr = 
     _toexpr s x

   let print_var (s:symcaml) (x:string) = 
      pyrun_simplestring("print srepr("^(_env x)^")"); ()


   
end

let main () = 
   let s = SymCaml.init() in
   SymCaml.define_symbol s "a";
   SymCaml.define_symbol s "b";
   SymCaml.define_symbol s "c";
   SymCaml.define_expr s "e" (Exp(Add([Symbol("a");Symbol("b");Symbol("c")]), Integer(3)));
   Printf.printf "-------\n";
   let res = SymCaml.get_var s "e" in
   Printf.printf "%s\n" (SymCaml.expr2py res);
   let res = SymCaml.expand s (Var "e") in
   Printf.printf "%s\n" (SymCaml.expr2py res)
;;

if !Sys.interactive then () else main ();;

