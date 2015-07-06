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
      mutable def: (string*pyobject) list;
   }
   val print_info : unit -> unit
   val init: string list -> wrapper 
   val define: wrapper ref -> string -> string -> pyobject
   val invoke: wrapper ref -> string -> pyobject list -> (string*pyobject) list -> pyobject spy_maybe
   val invoke_from: wrapper ref -> pyobject -> string -> pyobject list -> (string*pyobject) list -> pyobject spy_maybe
   val clear: wrapper ref -> unit 
   val eval: wrapper ref -> string -> pyobject 
   val get_var : wrapper ref -> string -> (string*pyobject)
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
      mutable def: (string*pyobject) list;
   }
   let null = pynull()

   let run x = 
      let _ = pyrun_simplestring(x) in 
      ()

   let _env x = "env[\""^x^"\"]"
   let _tmp x = "tmp[\""^x^"\"]"
   let _uw w = !w
   
   let _typ x = pytype x

   let _upd (w:wrapper ref) = 
      let mdl = pyimport_addmodule("__main__") in 
      let menv = pymodule_getdict(mdl) in
      let venv = pydict_getitemstring(menv,"env") in 
      let tmp = pydict_getitemstring(menv,"tmp") in
      let nw = {venv=venv; tmp=tmp; main=mdl; def=(!w).def} in 
      w := nw

   let _clrtmp w = pyrun_simplestring("tmp = {}"); _upd w

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
      let arr = Array.of_list lst in 
      pytuple_fromarray arr

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
      let menv = pymodule_getdict(mdl) in
      let venv = pydict_getitemstring(menv,"env") in 
      let tmp = pydict_getitemstring(menv,"tmp") in
      {main=mdl;venv=venv; tmp=tmp; def=[]} 

   let eval (w:wrapper ref) (cmd) : pyobject = 
      let _ = _clrtmp w in
      let tvar = "__tmp__" in 
      let cmd = (_tmp tvar)^"="^cmd in 
      run(cmd); 
      _upd w;
      pydict_getitemstring((_uw w).tmp, tvar)

   let get_var (w:wrapper ref) (name:string) = 
      let n = _env name in 
      let (_,obj) = match (List.filter (fun (x,v) -> x = name) (_uw w).def) with 
         | [h] -> h 
         | [] -> raise (PyCamlWrapperException ("no variable with the name "^name))
         | _ -> raise (PyCamlWrapperException ("more than one variable with the name "^name))
      in
      (n,obj)
   let clear (w:wrapper ref) = 
      run("env = {}");
      run("tmp = {}"); 
      _upd w;
      (_uw w).def <- [];
      ()


   let define (w:wrapper ref) (vname:string) (cmd:string) : (pyobject) =
      let evname = (_env vname) in
      let _ = eval w (evname^"="^cmd) in
      let obj = pydict_getitemstring((_uw w).venv,vname) in 
      (_uw w).def <- (vname,obj)::(_uw w).def;
      obj

   let _invoke (w:wrapper ref) (callee:pyobject) (fxnname:string) (args:pyobject list) (kwargs:(string*pyobject) list) : pyobject spy_maybe =
      let fargs =  list2tuple args in 
      if is_null callee then
         raise (PyCamlWrapperException ("callee is null on invocation of "^fxnname))
      else if is_null fargs then
         raise (PyCamlWrapperException ("null object passed in as args for "^fxnname))
      else
         let pyfxn = pyobject_getattrstring(callee, fxnname) in
         if is_null pyfxn then
            raise (PyCamlWrapperException ("could not find function '"^fxnname^"'." ))
         else
               let result = pyeval_callobjectwithkeywords(pyfxn,fargs,null) in
               if result = null then None else Some(result)

   let invoke (w:wrapper ref) n args kwargs : pyobject spy_maybe =  _invoke w (_uw w).main n args kwargs
   let invoke_from (w:wrapper ref) o n args kwargs : pyobject spy_maybe =  _invoke w o n (o::args) kwargs

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
   (*
   let _invoke (s:symcaml) (fxnname:string) (args:pyobject) : pyobject =
      let pyfxn = pydict_getitemstring(s.env, fxnname) in
      let cstr = pystring_asstring (pyobject_repr args) in 
      Printf.printf "[%s]\n" cstr; 
      let result = pyeval_callobject(pyfxn,(args)) in
      result

   let _pyobj2expr (s:symcaml)  (obj:pyobject) : spy_expr = 
      let result = _invoke s "srepr" obj in
      let cstr = pystring_asstring (pyobject_repr result) in 
      Printf.printf "[%s]\n" cstr; 
      try
         let lexbuf = Lexing.from_string cstr in
         let result = SymCamlParser.main SymCamlLexer.main lexbuf in
         result
      with  
         |SymCamlData.SymCamlParserError(msg) -> raise (SymCamlException ("parse error:"^msg))
         |_ -> raise (SymCamlException "failed.")

   let _pyvar2pyobj (s:symcaml) (varname :string): pyobject  = 
      pydict_getitemstring(s.env, varname)

   let _pylist2ml (s:symcaml) (lst:pyobject) (fxn:pyobject -> 'a) : 'a list = 
      let n = pytuple_size lst in 
      let rec fn i = match i with 
         |i -> let el = pytuple_getitem(lst,i) in
            (fxn el)::(fn (i+1))
         |n -> [] 
      in
      fn 0

   

   let _pydict2ml (s:symcaml) (d:pyobject) (fxn:pyobject*pyobject -> 'a*'b): ('a*'b) list =  
      let keys = pydict_keys d in
      let fn (key:pyobject) = 
         let value = pydict_getitem(d,key) in
         fxn (key,value)
      in
      Printf.printf "KEYS: %s\n" (_pyobjrepr2mlstr s keys);
      []

   
   let _toexpr (s:symcaml) (n:string) : spy_expr = 
      let obj = _pyvar2pyobj s n in 
      let expr = _pyobj2expr s obj in 
      expr  
   *)
   let _wr (s:symcaml) : PyCamlWrapper.wrapper ref = (s.w)
   let _wrc (s:symcaml) : PyCamlWrapper.wrapper = (!(_wr s))
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

   let expand (s:symcaml) (e:spy_expr) =
      let cmd = (expr2py s (Paren e)) in 
      let callee = PyCamlWrapper.eval  (_wr s) cmd in 
      match PyCamlWrapper.invoke (_wr s)  "expand" [callee] [] with
         | Some(res) -> let repr = _pyobj2expr s res in repr
         | None ->  raise (SymCamlFunctionException("eval","unexpected: null result."))
      
         

   let eval (s:symcaml) (e:spy_expr) =
      let cmd = (expr2py s (Paren e)) in 
      let callee = PyCamlWrapper.eval (_wr s) cmd in 
      match PyCamlWrapper.invoke_from (_wr s) callee  "doit" [] [] with
      | Some(res) -> 
         Printf.printf "%s\n" (PyCamlWrapper.pyobj2str (PyCamlWrapper.pyobj2repr res));
         Symbol("null")
      | None -> raise (SymCamlFunctionException("eval","unexpected: null result."))
         
      (*
      let repr = _pyobj2expr s res in 
      repr
      *)

   let simpl (s:symcaml) (e:spy_expr) =
      let cmd = (expr2py s (Paren e)) in 
      let callee = PyCamlWrapper.eval  (_wr s) cmd in 
      match PyCamlWrapper.invoke (_wr s)  "simplify" [callee] [] with
         | Some(res) ->  let repr = _pyobj2expr s res in repr
         | None -> raise (SymCamlFunctionException("simpl","unexpected: null result."))

   let pattern (s:symcaml) (e:spy_expr) (targ: spy_expr) : (string*spy_expr) list =
      let ecmd = (expr2py s (Paren e)) in 
      let tcmd = (expr2py s (Paren targ)) in
      let eobj = PyCamlWrapper.eval  (_wr s) ecmd in 
      let tobj = PyCamlWrapper.eval  (_wr s) tcmd in 
      match PyCamlWrapper.invoke_from (_wr s)  eobj "match" [tobj] [] with
         | Some(res) -> []
         | None -> raise (SymCamlFunctionException("pattern","unexpected: null result."))
      
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
(*
   let get_var (s:symcaml) (x:string) : spy_expr = 
     _toexpr s x

   let print_var (s:symcaml) (x:string) = 
      let _ = pyrun_simplestring("print srepr("^(_env x)^")") in 
      ()


   let pattern (s:symcaml) (e:spy_expr) (targ: spy_expr) : (string*spy_expr) list =
      let _toexprstruct s name = 
         let obj = _pyvar2pyobj s name in 
         let trans (n,e) = 
            let name = _pyobj2mlstr s n in 
            let expr = _pyobj2expr s e in 
            (name,expr)
         in 
         _pydict2ml s obj trans
      in
      let ntmp = "__tmp__" in
      let tmp = _env ntmp in 
      let arg = _rslv_expr (fun x -> "("^x^")") targ in 
      let cmd = _rslv_expr (fun x -> tmp^"="^x^".match"^arg) e in
      Printf.printf "CMD: %s\n" cmd;
      let _ = pyrun_simplestring(cmd) in
      _toexprstruct s ntmp;
      []

   let expand (s:symcaml) (e:spy_expr) =
      let ntmp = "__tmp__" in
      let tmp = _env ntmp in
      let cmd = _rslv_expr (fun x -> tmp^"="^x^".expand()") e in
      let _ = pyrun_simplestring(cmd) in
      _toexpr s ntmp

   let eval (s:symcaml) (e:spy_expr) = 
      let ntmp = "__tmp__" in
      let tmp = _env ntmp in
      let cmd = _rslv_expr (fun x -> tmp^"="^x^".doit()") e in
      let _ = pyrun_simplestring(cmd) in
      _toexpr s ntmp
   
   let simpl (s:symcaml) (e:spy_expr) = 
      let ntmp = "__tmp__" in
      let tmp = _env ntmp in
      let cmd = _rslv_expr (fun x -> tmp^"=simplify("^x^")") e in
      let _ = pyrun_simplestring(cmd) in
      _toexpr s ntmp
   *)
end

let main () = 
   let s = SymCaml.init() in
   let a = SymCaml.define_symbol s "a" in 
   let b = SymCaml.define_symbol s "b" in 
   let c = SymCaml.define_symbol s "c" in 
   let x = SymCaml.define_wildcard s "x" [a] in
   let y = SymCaml.define_wildcard s "y" [a] in
   let e = SymCaml.define_expr s "e" (Exp(Add([a;a;c]), Integer(3))) in
   let ex = SymCaml.define_expr s "ex" (Exp(Add([x;x;y]), Integer(3))) in
   PyCamlWrapper.report ((s.w));
   Printf.printf "-------\n";
   let res = SymCaml.simpl s e in
   Printf.printf "simpl: %s\n" (SymCaml.expr2py s res);
   let res = SymCaml.expand s e in
   Printf.printf "expand: %s\n" (SymCaml.expr2py s res);
   let res = SymCaml.eval s e in
   Printf.printf "doit: %s\n" (SymCaml.expr2py s res);
   let res = SymCaml.pattern s (Exp(c,Integer(3))) ex in 
   Printf.printf "pattern: %s\n" (List.fold_right 
      (fun ((n,e):string*spy_expr) (r:string) -> r^"\n"^n^":"^(SymCaml.expr2py s e))
      res "assignments:");
   ()
   (*
   let res = SymCaml.expand s e in
   Printf.printf "expand: %s\n" (SymCaml.expr2py s res);
   

   let res = SymCaml.doit s e in
   Printf.printf "doit: %s\n" (SymCaml.expr2py s res);

   SymCaml.expand s e;
   let res = SymCaml.get_var s "e" in
   Printf.printf "%s\n" (SymCaml.expr2py res);
   let res = SymCaml.expand s e in
   Printf.printf "%s\n" (SymCaml.expr2py res);
   let res = SymCaml.pattern s (Exp(c,Integer(3))) ex in 
   Printf.printf "%s\n" (List.fold_right 
      (fun ((n,e):string*spy_expr) (r:string) -> r^"\n"^n^":"^(SymCaml.expr2py e))
      res "assignments:")
   *)
;;

if !Sys.interactive then () else main ();;

