open SymCamlData
open SymCaml
open HWData
open Util
open GenericData

type symrel =
   | Eq of symexpr*symexpr
   | Set of symexpr*symexpr

exception SymLibException of string;;

module SymLib:
sig
   type symenv = {
      mutable vars: string list; 
      mutable wildcards: string list;
      mutable rels: symrel list;
   }
   val hwcomp2symenv : hwcomp -> bool -> symenv
end = 
struct
   type symenv = {
      mutable vars: string list; 
      mutable wildcards: string list;
      mutable rels: symrel list;
   }


   let rec hwcomp2symenv (h:hwcomp) is_virt =
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
         | Literal(Current(x)) -> Function("I",[Symbol(x)])
         | Literal(Voltage(x)) -> Function("V",[Symbol(x)])
         | Literal(Parameter(x)) -> 
            match List.filter (fun (n,v) -> n = x) h.params with
            | [(n,Some(v))] -> Decimal(v)
            | [(n,None)] -> Symbol(n)
            | [] -> raise (SymLibException ("no parameter with name "^x))
            | _ -> raise (SymLibException ("too many parameters with name "^x))
         | _ -> raise (SymLibException "unhandled symlib expr")
      in 
      let hwrel2symrel (r:hwrel) : symrel = match r with 
         |Eq(a,b) -> Eq((hwexpr2symexpr a),(hwexpr2symexpr b))
         |Set(a,b) -> Set((hwexpr2symexpr (Literal a)),(hwexpr2symexpr b))
      in
      let rec hwparam2symlst (r:(string*hwdecimal maybe) list) : string list = match r with 
         |(n,Some(vl))::t -> (hwparam2symlst t)
         |(n,None)::t -> n::(hwparam2symlst t)
         |[] -> []
      in
      let rec hwidstrlst2symlst (r:(string*hwid) list) : string list = match r with
         |(n,id)::t -> n::(hwidstrlst2symlst t)
         | [] -> []
      in
      let s : symenv = {vars=[];wildcards=[];rels=[]} in
      if is_virt then 
         s.wildcards <- (hwidstrlst2symlst h.outputs) @ (hwidstrlst2symlst h.inputs)
      else
         s.vars <- (hwidstrlst2symlst h.outputs) @ (hwidstrlst2symlst h.inputs)
      ;
      s.vars <- s.vars @ (hwparam2symlst h.params);
      s.rels <- List.map hwrel2symrel h.constraints;
      s

   

end