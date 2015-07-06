open Pycaml
open Sys
open Printf
open SymCamlData
open SymCamlParser
open SymCamlLexer

(* Check out sympy *)
module PyCamlWrapper : 
sig 
   type wrapper = {
      mutable main: pyobject;
      mutable venv: pyobject;
      mutable tmp: pyobject;
   }
   val print_info : unit -> unit
   val init: string list -> wrapper 
   val define: wrapper ref -> string -> string -> pyobject
   val define_tmp_var: wrapper ref -> string -> string -> pyobject
   val invoke: wrapper ref -> string -> pyobject list -> (string*pyobject) list -> pyobject spy_maybe
   val invoke_from: wrapper ref -> pyobject -> string -> pyobject list -> (string*pyobject) list -> pyobject spy_maybe
   val clear: wrapper ref -> unit 
   val eval: wrapper ref -> string -> pyobject spy_maybe
   val get_var : wrapper ref -> string -> (string*pyobject)
   val get_tmp_var : wrapper ref -> string -> (string*pyobject)
   val list2tuple: pyobject list -> pyobject
   val pyobj2str: pyobject -> string 
   val pyobj2repr: pyobject -> pyobject
   val report: wrapper ref -> unit
   val is_null : pyobject -> bool

end =
struct 
   type wrapper = {
      mutable main: pyobject;
      mutable venv: pyobject;
      mutable tmp: pyobject;
   }
   let null = pynull()

   let run x = 
      let _ = pyrun_simplestring(x) in 
      ()

   let handle_err () : unit = 
         let typ = null in 
         let value = null in 
         let trace = null in 
         let typ,value,trace = pyerr_fetch(typ,value,trace) in 
         if value <> null then
            let err_desc = (pystring_asstring (pyobject_str value)) in
            raise (PyCamlWrapperException ("error occured:"^err_desc^"\n"))
         else
            ()

   let _env x = "env[\""^x^"\"]"
   let _tmp x = "tmp[\""^x^"\"]"
   let _uw w = !w
   let _get_dict_val (d:pyobject) (k:string) : pyobject spy_maybe = let x = pydict_getitemstring(d,k) in
      handle_err();
      if x = null then None else Some(x)

   let _get_obj_val (o:pyobject) (attr:string) : pyobject spy_maybe = let x = pyobject_getattrstring(o,attr) in 
      handle_err();
      if x = null then None else Some(x)

   let _throw_if_null (tag:string) (s:'a spy_maybe) : 'a = match s with
      | Some(x) -> x
      | None -> raise (PyCamlWrapperException (tag^": unexpected null value."))

   let _upd (w:wrapper ref) = 
      let mdl = pyimport_addmodule("__main__") in 
      let venv = _throw_if_null "update env" (_get_obj_val mdl "env") in 
      let tmp = _throw_if_null "update tmp"(_get_obj_val mdl "tmp") in
      let nw = {venv=venv; tmp=tmp; main=mdl} in 
      w := nw

   let _clrtmp w = run("tmp = {}"); _upd w

   
   let is_null e = e = null

   let print_info () = 
      Printf.printf "At least python 3.1 required.";
      Printf.printf "home: %s\n" (py_getpythonhome());
      Printf.printf "prefix:  %s\n" (py_getprefix());
      Printf.printf "eprefix: %s\n" (py_getexecprefix());
      Printf.printf "init: %d\n" (py_isinitialized());
      Printf.printf "mpath: %s\n" (py_getpath());
      Printf.printf "version: %s\n" (py_getversion());
      Printf.printf "----------"


   let pyobj2str (o:pyobject):string = 
      pystring_asstring o

   let pyobj2repr (o:pyobject):pyobject = 
      pyobject_repr o

   let list2tuple (lst:pyobject list): pyobject =
      if List.length lst  = 0 then pytuple_empty
      else
         let arr = Array.of_list lst in 
         let tup = pytuple_fromarray arr in 
         tup

   let report w : unit =
      run("print repr(env);"); 
      run("print repr(tmp);")

   let init (imports :string list) : wrapper = 
      let modulename = "sympy" in 
      py_setprogramname("_interp");
      py_initialize();
      let _ = List.map 
         (fun x -> run("from "^x^" import *"))
         imports 
      in
      run("env = {}");
      run("tmp = {}");
      let mdl = pyimport_addmodule("__main__") in 
      let venv = _throw_if_null "init env" (_get_obj_val mdl "env") in 
      let tmp = _throw_if_null "init tmp" (_get_obj_val mdl "tmp") in
      {main=mdl;venv=venv; tmp=tmp} 

   let eval (w:wrapper ref) (cmd) : pyobject spy_maybe = 
      let _ = _clrtmp w in
      let tvar = "__tmp__" in 
      let cmd = (_tmp tvar)^"="^cmd in 
      run(cmd); 
      _upd w;
      let res = pydict_getitemstring((_uw w).tmp, tvar) in
      if res = null then None else Some(res)

   let get_var (w:wrapper ref) (name:string) = 
      let n = _env name in 
      let obj = match _get_dict_val (_uw w).venv name  with
         | Some(x) -> x
         | None -> raise (PyCamlWrapperException ("variable "^name^" not found in environment."))
      in
      (n,obj)

   let get_tmp_var (w:wrapper ref) (name:string) = 
      let n = _tmp name in 
      let obj = match _get_dict_val (_uw w).tmp name  with
         | Some(x) -> x
         | None -> raise (PyCamlWrapperException ("variable "^name^" not found in environment."))
      in
      (n,obj)

   let clear (w:wrapper ref) = 
      run("env = {}");
      run("tmp = {}"); 
      _upd w;
      ()


   let define (w:wrapper ref) (vname:string) (cmd:string) : (pyobject) =
      let evname = (_env vname) in
      let _ = eval w (evname^"="^cmd) in
      let obj = match _get_dict_val (_uw w).venv vname with
         | Some(x) -> x
         | None -> raise (PyCamlWrapperException ("variable "^vname^" could not be defined. not found."))
      in 
      obj

   let define_tmp_var (w:wrapper ref) (vname:string) (cmd:string) : (pyobject) =
      let evname = (_tmp vname) in
      let _ = eval w (evname^"="^cmd) in
      let obj = match _get_dict_val (_uw w).tmp vname with
         | Some(x) -> x
         | None -> raise (PyCamlWrapperException ("variable "^vname^" could not be defined. not found."))
      in 
      obj

   let _invoke (w:wrapper ref) (callee:pyobject) (fxnname:string) (args:pyobject list) (kwargs:(string*pyobject) list) : pyobject spy_maybe =
      let fargs =  list2tuple args in
      if is_null callee then
         raise (PyCamlWrapperException ("callee is null on invocation of "^fxnname))
      else if is_null fargs then
         raise (PyCamlWrapperException ("null object passed in as args for "^fxnname))
      else
         let pyfxn = _get_obj_val callee fxnname in
         begin
         handle_err();
         match pyfxn with
            | None -> raise (PyCamlWrapperException ("could not find function '"^fxnname^"'." ))
            | Some(fn) -> 
               begin
               let result = pyeval_callobjectwithkeywords(fn,fargs,null) in
                  handle_err();
                  if result = null then None else Some(result)
               end
            
         end
   let invoke (w:wrapper ref) n args kwargs : pyobject spy_maybe =  _invoke w (_uw w).main n args kwargs
   let invoke_from (w:wrapper ref) o n args kwargs : pyobject spy_maybe =  _invoke w o n (args) kwargs

end

module SymCaml : 
sig
   type symcaml = {
      w : PyCamlWrapper.wrapper ref;
   }
   val init : unit -> symcaml
   val define_symbol : symcaml ->  string -> spy_expr
   val define_expr : symcaml -> string -> spy_expr -> spy_expr
   val define_wildcard: symcaml -> string -> spy_expr list -> spy_expr
   val clear : symcaml -> unit
   val expr2py : symcaml -> spy_expr -> string

   val expand : symcaml -> spy_expr -> spy_expr
   val eval : symcaml -> spy_expr -> spy_expr
   val simpl : symcaml -> spy_expr -> spy_expr
   val pattern: symcaml -> spy_expr -> spy_expr -> (string*spy_expr) list
(*
   val simpl : symcaml -> spy_expr -> spy_expr
   val eval : symcaml -> spy_expr -> spy_expr
   val pattern: symcaml -> spy_expr -> spy_expr -> (string*spy_expr) list
*)
end = 
struct 
   type symcaml = {
      w : PyCamlWrapper.wrapper ref;
   }
   let _wr (s:symcaml) : PyCamlWrapper.wrapper ref = (s.w)
   let _wrc (s:symcaml) : PyCamlWrapper.wrapper = (!(_wr s))
   let _print (o:pyobject) : string = (PyCamlWrapper.pyobj2str o)
   let _rprint (o:pyobject) : string = (PyCamlWrapper.pyobj2str (PyCamlWrapper.pyobj2repr o))
   let init () =
      let w = PyCamlWrapper.init ["sympy"] in
      let wr : PyCamlWrapper.wrapper ref = ref w in 
      {w=wr}

   let clear s =
      PyCamlWrapper.clear (_wr s)

   
   let expr2py (s:symcaml) (e:spy_expr) : string= 
      let rec _expr2py (e:spy_expr) : string = 
         let exprlst2py (fn:'a -> string -> string) (lst:'a list) : string =
            match lst with
            | h::t -> List.fold_right fn  t (_expr2py h)
            | [] -> ""
         in
         match e with
         | Symbol(name) -> let (n,obj) = PyCamlWrapper.get_var (_wr s) name in n
         | Integral(e,s) -> "Integral("^(_expr2py e)^","^(s)^")"
         | Cos(e) -> "cos("^(_expr2py e)^")"
         | Sin(e) -> "sin("^(_expr2py e)^")"
         | Tan(e) -> "tan("^(_expr2py e)^")"
         | Mult(es) -> exprlst2py (fun x r ->r^"*"^(_expr2py x)) es 
         | Add(es) -> exprlst2py (fun x r ->r^"+"^(_expr2py x)) es 
         | Exp(a,b) -> (_expr2py (Paren a))^"**"^(_expr2py (Paren b))
         | NatExp(a) -> "exp("^(_expr2py (Paren a))^")"
         | Sub(es)  -> exprlst2py (fun x r ->r^"-"^(_expr2py x)) es
         | Paren(e) -> "("^(_expr2py e)^")" 
         | Decimal(x) -> string_of_float x
         | Integer(x) -> string_of_int x
      in 
         _expr2py e

   let define_symbol (s:symcaml) (x:string) : spy_expr =
      let _ = PyCamlWrapper.define (_wr s) x ("Symbol(\""^x^"\")") in 
      (Symbol x)


   let define_expr (s:symcaml) (x:string) (e:spy_expr) = 
      let _ = PyCamlWrapper.define (_wr s) x (expr2py s e) in 
      Symbol(x)

   let define_wildcard (s:symcaml) (x:string) (exns:spy_expr list) : spy_expr = 
      let opt_arg = match exns with
         | h::t -> "["^(List.fold_right (fun x r -> r^","^(expr2py s x)) t (expr2py s h))^"]"
         | [] -> "[]"
      in 
      let _ = PyCamlWrapper.define (_wr s) x (" Wild(\""^x^"\",exclude="^opt_arg^")") in 
      Symbol(x)

   let _pyobj2expr (s:symcaml) (p:pyobject) : spy_expr = 
      match PyCamlWrapper.invoke (_wr s) "srepr" [p] [] with 
         | Some(res) -> 
            let strrep = PyCamlWrapper.pyobj2str res in 
            begin
            try
               let lexbuf = Lexing.from_string strrep in
               let result = SymCamlParser.main SymCamlLexer.main lexbuf in
               result
            with  
               |SymCamlData.SymCamlParserError(msg) -> raise (SymCamlException ("parse error:"^msg))
               |e -> Printf.printf "%s\n----\n" strrep; raise e
            end
         | None -> raise (SymCamlFunctionException("pyobj2expr/srepr","unexpected: null result."))

   let get (s:symcaml) (e:string) =
      let (eval_expr,obj) = PyCamlWrapper.get_var (_wr s) e in 
      let repr = _pyobj2expr s obj in
      repr

   let expand (s:symcaml) (e:spy_expr) =
      let cmd = (expr2py s (Paren e)) in 
      let callee = PyCamlWrapper.eval  (_wr s) cmd in
      match callee with
         | Some(x) ->
            begin  
            match PyCamlWrapper.invoke (_wr s)  "expand" [x] [] with
               | Some(res) -> let repr = _pyobj2expr s res in repr
               | None ->  raise (SymCamlFunctionException("eval","unexpected: null result."))
            end
         | None -> raise (SymCamlFunctionException("expand","unexpected: null callee."))

   let eval (s:symcaml) (e:spy_expr) =
      let cmd = (expr2py s (Paren e)) in 
      match PyCamlWrapper.eval (_wr s) cmd with 
         | Some(callee) ->
         begin
            match PyCamlWrapper.invoke_from (_wr s) callee  "doit" [] [] with
            | Some(res) -> let repr = _pyobj2expr s res in repr
            | None -> raise (SymCamlFunctionException("eval","unexpected: null result."))
         end
         | None -> raise (SymCamlFunctionException("eval","unexpected: null callee."))
      (*
      let repr = _pyobj2expr s res in 
      repr
      *)

   let simpl (s:symcaml) (e:spy_expr) =
      let cmd = (expr2py s (Paren e)) in 
      let callee = PyCamlWrapper.eval  (_wr s) cmd in 
         match callee with
         | Some(x) ->
            begin
            match PyCamlWrapper.invoke (_wr s)  "simplify" [x] [] with
               | Some(res) ->  let repr = _pyobj2expr s res in repr
               | None -> raise (SymCamlFunctionException("simpl","unexpected: null result."))
            end
         | None-> raise (SymCamlFunctionException("simpl","unexpected: null callee."))
      
   let pattern (s:symcaml) (e:spy_expr) (pat: spy_expr) : (string*spy_expr) list =
      let ecmd = (expr2py s (Paren e)) in 
      let patcmd = (expr2py s (Paren pat)) in
      let eobj = PyCamlWrapper.eval  (_wr s) ecmd in 
      let patobj = PyCamlWrapper.eval  (_wr s) patcmd in 
         match (eobj,patobj) with
         | (Some(texpr),Some(tpat)) -> 
            begin
            Printf.printf ("%s : %s  = %s : %s \n") ecmd patcmd (_rprint texpr) (_rprint tpat);
            match PyCamlWrapper.invoke_from (_wr s)  texpr "match" [tpat] [] with
            | Some(res) -> 
               Printf.printf "REPR:%s\n" (_rprint res);
               []
            | None -> raise (SymCamlFunctionException("pattern","unexpected: null result."))
            end
         | _ -> raise (SymCamlFunctionException("pattern","unexpected: null callee or argument."))
      
      (*
      let ntmp = "__tmp__" in
      let tmp = _env ntmp in 
      let arg = _rslv_expr (fun x -> "("^x^")") targ in 
      let cmd = _rslv_expr (fun x -> tmp^"="^x^".match"^arg) e in
      Printf.printf "CMD: %s\n" cmd;
      let _ = pyrun_simplestring(cmd) in
      _toexprstruct s ntmp;
      []
      *)

end

let main () = 
   let s = SymCaml.init() in
   let a = SymCaml.define_symbol s "a" in 
   let b = SymCaml.define_symbol s "b" in 
   let c = SymCaml.define_symbol s "c" in 
   let x = SymCaml.define_wildcard s "x" [] in
   let y = SymCaml.define_wildcard s "y" [] in
   let e = SymCaml.define_expr s "e" (Exp(Add([a;a;c]), Integer(3))) in
   let ex = SymCaml.define_expr s "ex" (Exp(Add([x;x;y]), Integer(3))) in
   PyCamlWrapper.report ((s.w));
   Printf.printf "-------\n";
   let res = SymCaml.simpl s e in
   Printf.printf "simpl: %s\n" (SymCaml.expr2py s res);
   let res = SymCaml.expand s e in
   Printf.printf "expand: %s\n" (SymCaml.expr2py s res);
   let res = SymCaml.pattern s (Exp(c,Integer(3))) ex in 
   Printf.printf "pattern: %s\n" (List.fold_right 
      (fun ((n,e):string*spy_expr) (r:string) -> r^"\n"^n^":"^(SymCaml.expr2py s e))
      res "assignments:");
   let res = SymCaml.eval s e in
   Printf.printf "doit: %s\n" (SymCaml.expr2py s res);
   ()
;;

if !Sys.interactive then () else main ();;

