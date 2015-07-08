open Pycaml
open Sys
open Printf
open SymCamlData
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
   val invoke: wrapper ref -> string -> pyobject list -> (string*pyobject) list -> pyobject option
   val invoke_from: wrapper ref -> pyobject -> string -> pyobject list -> (string*pyobject) list -> pyobject option
   val clear: wrapper ref -> unit 
   val eval: wrapper ref -> string -> pyobject option
   val get_var : wrapper ref -> string -> (string*pyobject)
   val get_tmp_var : wrapper ref -> string -> (string*pyobject)
   val list2tuple: pyobject list -> pyobject
   val pyobj2str: pyobject -> string 
   val pyobj2repr: pyobject -> pyobject
   val pydict2ml: pyobject -> (pyobject*pyobject -> 'a*'b) -> (('a*'b) list)
   val find_var : wrapper ref -> pyobject -> string
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
   let none = pynone()
   
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
   let _get_dict_val (d:pyobject) (k:string) : pyobject option = 
      let x = pydict_getitemstring(d,k) in
      handle_err();
      if x = null then None else Some(x)

   let _get_obj_val (o:pyobject) (attr:string) : pyobject option = 
      let x = pyobject_getattrstring(o,attr) in 
      handle_err();
      if x = null then None else Some(x)

   let _throw_if_null (tag:string) (s:'a option) : 'a = match s with
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
      let x = pystring_asstring o in 
      handle_err();
      x

   let pyobj2repr (o:pyobject):pyobject = 
      let x = pyobject_repr o in 
      handle_err();
      x

   let list2tuple (lst:pyobject list): pyobject =
      if List.length lst  = 0 then pytuple_empty
      else
         let arr = Array.of_list lst in 
         let tup = pytuple_fromarray arr in 
         handle_err();
         tup

   let pydict2ml (obj:pyobject) (fxn:(pyobject*pyobject)->('a*'b)) : ('a*'b) list = 
         let keys = Array.to_list (pylist_toarray (pydict_keys obj)) in 
         let elems = List.map (fun k -> let v = pydict_getitem(obj,k) in handle_err(); (k,v)) keys in 
         List.map fxn elems
      
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

   let eval (w:wrapper ref) (cmd) : pyobject option = 
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

   let find_var (w:wrapper ref) (obj: pyobject) =
      let compose ((k,v):pyobject*pyobject) : string*pyobject = 
         let key = pyobj2str k in 
         let vl = v in 
         (key,vl)
      in
      let cmpobjs (name,inst) = 
         let r = pyobject_richcomparebool(inst,obj,(opid2int Py_EQ)) in
         r <> 0
      in 
      let evl = pydict2ml (_uw w).venv compose in
      match List.filter cmpobjs evl with
         |[(name,_)] -> name 
         | [] -> raise (PyCamlWrapperException ("variable resembling argument not found in environment."))
         | _ -> raise (PyCamlWrapperException ("argument has multiple variable names."))

   let clear (w:wrapper ref) = 
      run("env = {}");
      run("tmp = {}"); 
      _upd w;
      ()


   let define (w:wrapper ref) (vname:string) (cmd:string) : (pyobject) =
      let evname = (_env vname) in
      let _ = eval w (evname^"="^cmd) in 
      _upd w;
      let obj = match _get_dict_val (_uw w).venv vname with
         | Some(x) -> x
         | None -> raise (PyCamlWrapperException ("variable "^vname^" could not be defined. not found."))
      in 
      obj

   let define_tmp_var (w:wrapper ref) (vname:string) (cmd:string) : (pyobject) =
      let evname = (_tmp vname) in
      let _ = eval w (evname^"="^cmd) in 
      _upd w;
      let obj = match _get_dict_val (_uw w).tmp vname with
         | Some(x) -> x
         | None -> raise (PyCamlWrapperException ("variable "^vname^" could not be defined. not found."))
      in 
      obj

   let _invoke (w:wrapper ref) (callee:pyobject) (fxnname:string) (args:pyobject list) (kwargs:(string*pyobject) list) : pyobject option =
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
                  if result = null || result = none then None else Some(result)
               end
            
         end
   let invoke (w:wrapper ref) n args kwargs : pyobject option =  _invoke w (_uw w).main n args kwargs
   let invoke_from (w:wrapper ref) o n args kwargs : pyobject option =  _invoke w o n (args) kwargs

end
