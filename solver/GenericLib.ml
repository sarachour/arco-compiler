open GenericData
open HWData
exception GenericLibException of string;;



module GenericHWLib : 
sig 
   type analogy = Current | Voltage
   val genv2hwcomp : analogy -> genv -> hwcomp

end = 
struct 
   type analogy = Current | Voltage

   let rec genv2hwcomp (ana:analogy) (ge:genv) : hwcomp = 
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
         | _ -> raise (GenericLibException "unimplemented gexpr2hwexpr")
      in 
      let grel2hwrel (rel:grel) : hwrel = 
         match rel with 
         | Eq(a,b) -> Eq(gexpr2hwexpr a, gexpr2hwexpr b)
         | _ -> raise (GenericLibException "unimplemented grel2hwrel")
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


end 