open GenericData
open HWData
exception GenericLibException of string;;

module GenericUtils :
sig 
   val gliteral2str : gliteral -> string 
   val gexpr2str : gexpr -> string 
   val grel2str : grel -> string
end = 
struct 
   let gliteral2str (e:gliteral) = match e with 
      | Parameter(x) -> x 
      | Symbol(x) -> x

   let rec gexpr2str (e:gexpr) = 
      let gexprlst2str fx lst = 
         match lst with 
            | h::t -> List.fold_right (fun x r -> r^(fx (gexpr2str x))) t (gexpr2str h) 
            | [] -> ""
      in
      match e with
      | Literal(x) -> gliteral2str(x)
      | Add(lst) -> gexprlst2str (fun x -> "+"^x) lst
      | Sub(lst) -> gexprlst2str (fun x -> "-"^x) lst
      | Mult(lst) -> gexprlst2str (fun x -> "*"^x) lst
      | Decimal(a) -> (string_of_float a)
      | Integer(a) -> (string_of_int a)
      | Deriv(a) -> "deriv"^(gexpr2str (Paren a))
      | Paren(a) -> "("^(gexpr2str a)^")"
      | _ -> raise (GenericLibException "gexpr2str: unknown op")

   let grel2str (e:grel) = match e with 
      | Eq(a,b) -> (gexpr2str a)^"=="^(gexpr2str b)



end

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