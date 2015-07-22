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
      debug: bool ref;
   }
   val init : unit -> symcaml
   val set_debug : symcaml -> bool -> unit
   val define_symbol : symcaml ->  string -> symexpr
   val define_expr : symcaml -> string -> symexpr -> symexpr
   val define_wildcard: symcaml -> string -> symexpr list -> symexpr
   val define_function: symcaml -> string -> symexpr
   val clear : symcaml -> unit
   val expr2py : symcaml -> symexpr -> string

   val expand : symcaml -> symexpr -> symexpr
   val eval : symcaml -> symexpr -> symexpr
   val simpl : symcaml -> symexpr -> symexpr
   val pattern: symcaml -> symexpr -> symexpr -> ((string*symexpr) list) option
   val report : symcaml -> unit
end = 
struct 
   type symcaml = {
      w : PyCamlWrapper.wrapper ref;
      debug: bool ref;
   }
   let _wr (s:symcaml) : PyCamlWrapper.wrapper ref = (s.w)
   let _wrc (s:symcaml) : PyCamlWrapper.wrapper = (!(_wr s))
   let _print (o:pyobject) : string = (PyCamlWrapper.pyobj2str o)
   let _rprint (o:pyobject) : string = (PyCamlWrapper.pyobj2str (PyCamlWrapper.pyobj2repr o))
   let dbg (s:symcaml) (fx: unit->unit) : unit = 
      if !(s.debug) = true then fx()
      else ()

   let init () =
      let w = PyCamlWrapper.init ["sympy"] in
      let wr : PyCamlWrapper.wrapper ref = ref w in 
      let dr : bool ref = ref (false) in
      {w=wr; debug=dr}

   let clear s =
      PyCamlWrapper.clear (_wr s)

   let set_debug s b = 
      s.debug := b; ()

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
         | Div(n,d) -> (_expr2py (Paren n))^"/"^(_expr2py (Paren d))
         | Function(x,lst) -> x^"("^(exprlst2py (fun x r -> r^","^(_expr2py x)) lst)^")"
         | Deriv(e,lst) -> "Derivative("^(_expr2py e)^
            (List.fold_right (
               fun (v,n) r -> 
                  let (sv,_) = PyCamlWrapper.get_var (_wr s) v in
                  let sn = string_of_int n in
                  r^","^sv^","^sn
            ) lst "")^")"
         | Eq(lhs,rhs) -> "Eq("^(_expr2py lhs)^","^(_expr2py rhs)^")"
      in 
         _expr2py e

   let define_symbol (s:symcaml) (x:string) : symexpr =
      let cmd = "Symbol(\""^x^"\")" in
      let _ = PyCamlWrapper.define (_wr s) x cmd in 
      (Symbol x)

   let define_function (s:symcaml) (x:string) : symexpr =
      let cmd = "Function(\""^x^"\")" in
      dbg s (fun () -> Printf.printf "define_function: %s\n" cmd);
      let _ = PyCamlWrapper.define (_wr s) x cmd in 
      (Symbol x)

   let define_expr (s:symcaml) (x:string) (e:symexpr) = 
      let stre = expr2py s e in
      let _ = PyCamlWrapper.define (_wr s) x stre in 
      dbg s (fun () -> Printf.printf "define_expr: %s\n" stre);
      Symbol(x)

   let define_wildcard (s:symcaml) (x:string) (exns:symexpr list) : symexpr = 
      let opt_arg = match exns with
         | h::t -> 
            let get_arg (x:symexpr) = expr2py s x in
            let hn = get_arg h in 
            let fn x r = let n = get_arg x in  r^","^n in 
            "["^(List.fold_right fn t hn)^"]"
         | [] -> "[]"
      in 
      let cmd ="Wild(\""^x^"\",exclude="^opt_arg^")" in 
      dbg s (fun () -> Printf.printf "define_wildcard: %s\n" cmd);
      let _ = PyCamlWrapper.define (_wr s) x cmd in 
      Symbol(x)

   let _pyobj2expr (s:symcaml) (p:pyobject) : symexpr = 
      match PyCamlWrapper.invoke (_wr s) "srepr" [p] [] with 
         | Some(res) -> 
            let strrep = PyCamlWrapper.pyobj2str res in 
            dbg s (fun () -> Printf.printf "pyobj2expr: %s\n" strrep);
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
      
   let pattern (s:symcaml) (e:symexpr) (pat: symexpr) : ((string*symexpr) list) option =
      let transform (key,v) : (string*symexpr) = 
         let nk = _rprint key in 
         let expr = _pyobj2expr s v in 
         let realname = PyCamlWrapper.find_var (_wr s) key in
         (realname,expr)
      in
      let ecmd = (expr2py s (Paren e)) in 
      let patcmd = (expr2py s (Paren pat)) in
      dbg s (fun () -> Printf.printf "match: %s -> %s\n" ecmd patcmd);
      let eobj = PyCamlWrapper.eval  (_wr s) ecmd in 
      let patobj = PyCamlWrapper.eval  (_wr s) patcmd in 
         match (eobj,patobj) with
         | (Some(texpr),Some(tpat)) -> 
            begin
            match PyCamlWrapper.invoke_from (_wr s)  texpr "match" [tpat] [] with
            | Some(res) -> 
               let assigns = PyCamlWrapper.pydict2ml res transform in Some assigns
            | None -> None
            end
         | _ -> raise (SymCamlFunctionException("pattern","unexpected: null callee or argument."))
      
   let report (s:symcaml) : unit =
      PyCamlWrapper.report (_wr s)

end
