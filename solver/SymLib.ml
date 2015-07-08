open SymCamlData
open SymCaml
open HWData
open Util
open GenericData

exception SymLibException of string;;

module SymLib:
sig
   type symenv = {
      mutable vars: string list; 
      mutable wildcards: string list;
      mutable exprs: symexpr list;
      ns: string
   }
   val hwcomp2symenv : hwcomp -> string -> bool -> symenv
   val load_env : (SymCaml.symcaml maybe) -> symenv -> SymCaml.symcaml 
   val find_matches : symenv -> symenv -> unit
end = 
struct
   type symenv = {
      mutable vars: string list; 
      mutable wildcards: string list;
      mutable exprs: symexpr list;
      ns: string
   }

   let mangle ns (l:hwliteral) = 
      let delim1 = "|" in 
      let delim2 = "|" in
      match l with 
         | Current(x) -> ns^delim1^x^delim2^"I"
         | Voltage(x) -> ns^delim1^x^delim2^"V"
         | Parameter(x) -> ns^delim1^x^delim2^"P"

   let mangle_expr ns idx =
      let delim1 = "|" in 
      let delim2 = "|" in
      ns^delim1^"expr"^delim2^(string_of_int idx)

   let load_env (w:SymCaml.symcaml maybe) (s:symenv) : SymCaml.symcaml =
      let env = match w with
         | None -> 
            let e = SymCaml.init() in
            let _ = SymCaml.clear e in
            SymCaml.define_symbol e "t";
            e
         | Some(x) -> x
      in
      List.iter (fun x -> SymCaml.define_wildcard env x []; ()) s.wildcards;
      List.iter (fun x -> SymCaml.define_symbol env x; ()) s.vars;
      List.iteri (
         fun idx x -> 
            let nm = mangle_expr s.ns idx in 
            SymCaml.define_expr env nm x; ()
         ) s.exprs;
      env

   let find_matches (tmpl:symenv) (qry:symenv) : unit = 
      let w = load_env None tmpl in
      let env = load_env (Some w) qry in
      SymCaml.set_debug w true;
      SymCaml.report env;
      let proc i x j y = 
         let ni = mangle_expr qry.ns i in 
         let nj = mangle_expr tmpl.ns j in
         let res = SymCaml.pattern env (Symbol ni) (Symbol nj) in 
         Printf.printf ("%s : %s\n") ni nj  
      in
      List.iteri (
         fun i x ->
            List.iteri (
               fun j y ->
                  proc i x j y; ()
            ) tmpl.exprs 
      ) qry.exprs

   let rec hwcomp2symenv (h:hwcomp) ns is_virt =
      let rec hwexpr2symexpr (e:hwexpr) : symexpr = 
         let exprlst2symexprlst lst = 
            List.map (fun x -> hwexpr2symexpr x) lst 
         in
         match e with 
         | Add(lst) -> Add(exprlst2symexprlst lst)
         | Sub(lst) -> Sub(exprlst2symexprlst lst)
         | Mult(lst) -> Mult(exprlst2symexprlst lst)
         | Div(n,d) -> Div(hwexpr2symexpr n, hwexpr2symexpr d)
         | Exp(b,e) -> Exp(hwexpr2symexpr b, hwexpr2symexpr e)
         | NatExp(e) -> NatExp(hwexpr2symexpr e) 
         | Deriv(e) -> Deriv(hwexpr2symexpr e, [("t",1)])
         | Literal(Parameter(x)) -> 
            begin
            match List.filter (fun (n,v) -> n = x) h.params with
            | [(n,Some(v))] -> Decimal(v)
            | [(n,None)] -> Symbol(mangle ns (Parameter x))
            | [] -> raise (SymLibException ("no parameter with name "^x))
            | _ -> raise (SymLibException ("too many parameters with name "^x))
            end
         | Literal(x) -> (Symbol(mangle ns x))
         | _ -> raise (SymLibException "unhandled symlib expr")
      in 
      let hwrel2symrel (r:hwrel) : symexpr = match r with 
         |Eq(a,b) -> Eq((hwexpr2symexpr a),(hwexpr2symexpr b))
         |Set(a,b) -> Eq((hwexpr2symexpr (Literal a)),(hwexpr2symexpr b))
      in
      let rec hwparam2symlst (r:(string*hwdecimal maybe) list) : string list = match r with 
         |(n,Some(vl))::t -> (hwparam2symlst t)
         |(n,None)::t -> (mangle ns (Parameter n))::(hwparam2symlst t)
         |[] -> []
      in
      let rec hwidstrlst2symlst (r:(string*hwid) list) : string list = match r with
         |(n,id)::t -> (mangle ns (Voltage n))::(mangle ns (Current n))::(hwidstrlst2symlst t)
         | [] -> []
      in
      let s : symenv = {vars=[];wildcards=[];exprs=[];ns=ns} in
      if is_virt then 
         s.wildcards <- 
            (hwidstrlst2symlst h.outputs) @ 
            (hwidstrlst2symlst h.inputs) @ 
            (hwparam2symlst h.params)
      else
         s.vars <- (hwidstrlst2symlst h.outputs) @ (hwidstrlst2symlst h.inputs) @ (hwparam2symlst h.params)
      ;
      s.exprs <- List.map hwrel2symrel h.constraints;
      s

   

end