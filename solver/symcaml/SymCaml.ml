open PyCamlWrapper
open Pycaml
open Sys
open Printf
open SymCamlData
open SymCamlParser
open SymCamlLexer

module SymCaml : 
sig
   type symcaml = {
      w : PyCamlWrapper.wrapper ref;
   }
   val init : unit -> symcaml
   val define_symbol : symcaml ->  string -> symexpr
   val define_expr : symcaml -> string -> symexpr -> symexpr
   val define_wildcard: symcaml -> string -> symexpr list -> symexpr
   val define_function: symcaml -> string -> symexpr
   val clear : symcaml -> unit
   val expr2py : symcaml -> symexpr -> string

   val expand : symcaml -> symexpr -> symexpr
   val eval : symcaml -> symexpr -> symexpr
   val simpl : symcaml -> symexpr -> symexpr
   val pattern: symcaml -> symexpr -> symexpr -> (string*symexpr) list
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

   
   let expr2py (s:symcaml) (e:symexpr) : string= 
      let rec _expr2py (e:symexpr) : string = 
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

   let define_symbol (s:symcaml) (x:string) : symexpr =
      let _ = PyCamlWrapper.define (_wr s) x ("Symbol(\""^x^"\")") in 
      (Symbol x)

   let define_function (s:symcaml) (x:string) : symexpr =
      let _ = PyCamlWrapper.define (_wr s) x ("Function(\""^x^"\")") in 
      (Symbol x)

   let define_expr (s:symcaml) (x:string) (e:symexpr) = 
      let _ = PyCamlWrapper.define (_wr s) x (expr2py s e) in 
      Symbol(x)

   let define_wildcard (s:symcaml) (x:string) (exns:symexpr list) : symexpr = 
      let opt_arg = match exns with
         | h::t -> "["^(List.fold_right (fun x r -> r^","^(expr2py s x)) t (expr2py s h))^"]"
         | [] -> "[]"
      in 
      let _ = PyCamlWrapper.define (_wr s) x (" Wild(\""^x^"\",exclude="^opt_arg^")") in 
      Symbol(x)

   let _pyobj2expr (s:symcaml) (p:pyobject) : symexpr = 
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

   let expand (s:symcaml) (e:symexpr) =
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

   let eval (s:symcaml) (e:symexpr) =
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

   let simpl (s:symcaml) (e:symexpr) =
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
      
   let pattern (s:symcaml) (e:symexpr) (pat: symexpr) : (string*symexpr) list =
      let transform (key,v) : (string*symexpr) = 
         let nk = _rprint key in 
         let expr = _pyobj2expr s v in 
         let realname = PyCamlWrapper.find_var (_wr s) key in
         (realname,expr)
      in
      let ecmd = (expr2py s (Paren e)) in 
      let patcmd = (expr2py s (Paren pat)) in
      let eobj = PyCamlWrapper.eval  (_wr s) ecmd in 
      let patobj = PyCamlWrapper.eval  (_wr s) patcmd in 
         match (eobj,patobj) with
         | (Some(texpr),Some(tpat)) -> 
            begin
            match PyCamlWrapper.invoke_from (_wr s)  texpr "match" [tpat] [] with
            | Some(res) -> 
               let assigns = PyCamlWrapper.pydict2ml res transform in Printf.printf "-------\n"; assigns
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
