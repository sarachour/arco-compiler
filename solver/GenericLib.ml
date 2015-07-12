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
   let gliteral2str (e:gliteral) = 
      let gsym2str (s:gsymbol) = match s with 
      | Input(v) -> "in:"^v
      | Output(v) -> "out:"^v
      | Param(v) -> "param:"^v
      | FixedParam(v,n) -> "param:"^v^"="^(string_of_float n)
      in
      match e with 
      | Symbol(x) -> gsym2str x

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
      let gsym2hwsym (s:gsymbol) : hwsymbol = 
            match s with
            |Input(x) -> Namespace(ge.ns, Input(x))
            |Output(x) -> Namespace(ge.ns, Output(x))
            |Param(x) -> Namespace(ge.ns, Param(x))
            |FixedParam(x,v) -> Namespace(ge.ns, FixedParam(x,v))
      in
      let rec gexpr2hwexpr (expr:gexpr) : hwexpr = 
         let gexprlst2hwexprlst lst = List.map (fun x -> gexpr2hwexpr x) lst in
         match expr with
         | Literal(Symbol(x)) -> 
            if ana = Current 
            then Literal(Current(gsym2hwsym x)) 
            else Literal(Voltage(gsym2hwsym x))
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
      let rec gsymlst2hsymlst (l:gsymbol list) : hwsymbol list =
         match l with 
         | n::t ->  (gsym2hwsym n)::(gsymlst2hsymlst t)
         | [] -> []
      in
         let hr = grel2hwrel ge.rel in 
         let ports = gsymlst2hsymlst ge.ports in 
         {
            ports=ports;
            constraints=[hr];
            ns=ge.ns
         }


end 