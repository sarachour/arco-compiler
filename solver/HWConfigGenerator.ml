open HWLib
open HWData
open GenericData
open HWSpecMatcher

exception HWGenException of string;;

type cvanalogy = Current | Voltage


module HWConfigGenerator : 
sig
   type gencfg = {
      analogy: cvanalogy;
      arch: hwarch; 
      matcher: HWSpecMatcher.hsmatcher; 
      mutable config: hwconfig; 
   }
   val init : cvanalogy -> hwarch -> gencfg
   val convert : gencfg -> genv -> hwconfig
end =
struct
   type gencfg = {
      analogy: cvanalogy;
      arch: hwarch; 
      matcher: HWSpecMatcher.hsmatcher; 
      mutable config: hwconfig; 
   }
   let init anlgy arch : gencfg = 
      let c = HWArch.create_config() in
      let m = HWSpecMatcher.init() in
      let rm = ref m in 
      let rec proc_comps (e:hwelem) : unit = match e with
         | Component(c) -> HWSpecMatcher.add_comp rm c
         | Schematic(s) -> 
            List.iter (fun (n,x) -> (proc_comps x)) s.elems
         | _ -> raise (HWGenException "unimplemented proc_comps")
      in
      proc_comps (Schematic arch.schem);
      {analogy=anlgy; arch=arch; config=c; matcher=m}

   let rec genv2hwcomp ana (ge:genv) : hwcomp = 
      let rec gexpr2hwexpr (expr:gexpr) : hwexpr = 
         let gexprlst2hwexprlst lst = List.map (fun x -> gexpr2hwexpr x) lst in
         match expr with
         | Literal(Symbol(x)) -> 
            if ana = Current 
            then Literal(Current(x)) 
            else Literal(Voltage(x))
         | Literal(Parameter(x)) -> Literal(Parameter(x))
         | Decimal(n) -> Decimal(n)
         | Integer(n) -> Integer(n)
         | Div(a,b) -> Div(gexpr2hwexpr a, gexpr2hwexpr b)
         | Exp(a,b) -> Exp(gexpr2hwexpr a, gexpr2hwexpr b)
         | Add(lst) -> Add(gexprlst2hwexprlst lst)
         | Sub(lst) -> Sub(gexprlst2hwexprlst lst)
         | Mult(lst) -> Sub(gexprlst2hwexprlst lst)
         | Deriv(expr) -> Deriv(gexpr2hwexpr expr)
         | _ -> raise (HWGenException "unimplemented gexpr2hwexpr")
      in 
      let grel2hwrel (rel:grel) : hwrel = 
         match rel with 
         | Eq(a,b) -> Eq(gexpr2hwexpr a, gexpr2hwexpr b)
         | _ -> raise (HWGenException "unimplemented grel2hwrel")
      in
      let rec strlst2hwidlst (l:string list) : (string*hwid) list =
         match l with 
         | n::t -> (n,nullid)::(strlst2hwidlst t)
         | [] -> []
      in
         let hr = grel2hwrel ge.rel in 
         let inp = strlst2hwidlst ge.inputs in 
         let outp = strlst2hwidlst ge.outputs in 
         let params = ge.params in 
         {inputs=inp;outputs=outp;params=params;id=("query",nullid); constraints=[hr]}

   let convert (c:gencfg) (rel:genv)= 
      let hrel = genv2hwcomp (c.analogy) rel in
      let _ = HWSpecMatcher.find (ref (c.matcher)) hrel in 
      c.config



end