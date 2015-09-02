%{

open Printf
open SymCamlData
 

%}



%token <string> TOKEN
%token <string> QTOKEN
%token <float> DECIMAL
%token <int> INTEGER
%token COMMA OPARAN CPARAN EOF QUOTE EQ




%type <SymCamlData.symexpr> main
%type <string*string> kwarg
%type <(SymCamlData.symexpr list)*((string*string) list)> arglist
%type <SymCamlData.symexpr> symexp


%start main

%%

main:
  | QUOTE symexp QUOTE {let c = $2 in c}
  | symexp {let c = $1 in c}
;

kwarg:
   | TOKEN EQ TOKEN {let key = $1 and vl = $3 in (key,vl)}
   | TOKEN EQ INTEGER {let key = $1 and vl = string_of_int $3 in (key,vl)}
   | TOKEN EQ DECIMAL {let key = $1 and vl = string_of_float $3 in (key,vl)}
   
arglist:
   | symexp {let a = $1 in ([a],[])}
   | symexp COMMA arglist {
		let t = $1 and (args, kwargs) = $3 in 
		(t::args, kwargs)
	}
   | kwarg {
		let (key,vl) = $1 in 
		([],[(key,vl)])
	}
   | kwarg COMMA arglist {
		let (key,vl) = $1 and (args,kwargs) = $3 in 
		(args, (key,vl)::kwargs)
	}
;



symexp:
  | TOKEN OPARAN QTOKEN CPARAN {
    let name = $1 and varname = $3 in
    if name = "Symbol" then
      Symbol(varname)
    else if name = "Wild" then
      Symbol(varname)
    else 
      raise (SymCamlParserError ("only symbols can have token arguments: "^name^":"^varname))
  }
  | TOKEN OPARAN INTEGER CPARAN {
    let name = $1 and value = $3 in
    if name = "Integer" then
      Integer(value)
    else 
      raise (SymCamlParserError "only integers can have int arguments")
  }
  | TOKEN OPARAN INTEGER COMMA INTEGER CPARAN {
    let name = $1 and numer = $3 and denom = $5 in
    if name = "Rational" then
      let fnumer : float = float(numer) and fdenom : float = float(denom) in
      let res : float = fnumer /. fdenom in
      Decimal(res)
    else 
      raise (SymCamlParserError "only numerators can have two int arguments")
  }
  | TOKEN OPARAN QTOKEN COMMA arglist CPARAN {
    let name = $1 and value = float_of_string $3 in
    if name = "Float" then
      Decimal(value)
    else 
      raise (SymCamlParserError "only XXX can have decimal arguments")
  }
  | TOKEN OPARAN arglist CPARAN {
    let name = $1 and (lst,kwlst) = $3 in
    match (name,List.length lst) with
    | ("Pow",2) -> Exp(List.nth lst 0,List.nth lst 1)
    | ("Add",_) -> Add(lst)
    | ("Mul",_) -> Mult(lst)
    | ("Equality",2) -> Eq(List.nth lst 0,List.nth lst 1)
    | ("Derivative",_) -> 
      begin
      match lst with 
      | vexpr::arglist -> 
        let rec proc_lst l :(symvar*int) list = match l with
          | Symbol(x)::Integer(i)::t -> (x,i)::(proc_lst t)
          | Symbol(x)::[]-> [(x,1)]
          | _ -> raise (SymCamlParserError "derivative requires symbol-int pattern.")
        in
        let derivs = proc_lst arglist in 
          Deriv(vexpr, derivs)
      | [] -> raise (SymCamlParserError "derivative requires expression.")
      end
    | (n,l) -> raise (SymCamlParserError 
      ("unexpected function "^n^" or number of arguments "^(string_of_int l)))
  }
;

%%
