%{
  open HW
  open Util
  open Unit

  open AST
  open ParseGenUtil

  type parser_meta = {
    mutable comp : string option;
  }

  let dat = HwLib.mkenv()
  let meta = {comp=None}
  exception ParseHwError of string*string

  let error s n =
    let _ = Printf.printf "==== %s ====\n%s\n========\n" s n in
    let _ = flush_all () in
    raise (ParseHwError(s,n))

  let set_cmpname n =
    meta.comp <- Some(n)

  let get_cmpname () =
    match meta.comp with
    | Some(v) -> v
    | None -> error "get_cmpname" "no component name defined"

  let print_expr e =
    ASTLib.ast2str e (fun x -> HwLib.hwvid2str x)
%}


%token EOF EOL
%token EQ COLON QMARK COMMA
%token TYPE LET NONE INITIALLY IN WHERE

%token PROP TIME
%token COMP INPUT OUTPUT PARAM REL END
%token <string> STRING TOKEN OPERATOR
%token <float> DECIMAL
%token <int> INTEGER

%type<string list> strlist
%type <string> sexpr
%type <hwvid ast> expr
%type <unt> typ
%type <(propid*untid) list> proptyplst
%type <float> number

%type <string*hwrel> rel
%type <unit> comp
%type <unit> block
%type <unit> st
%type <unit> seq
%type <HW.hwenv option> env

%start env

%%

strlist:
  | TOKEN                    {let e = $1 in [e]}
  | TOKEN COMMA strlist      {let lst = $3 and e = $1 in e::lst }

sexpr:
  | OPERATOR          {let e = $1 in e}
  | TOKEN             {let e = $1 in e}
  | INTEGER           {let e = $1 in string_of_int e}
  | DECIMAL           {let e = $1 in string_of_float e}
  | sexpr INTEGER      {let rest = $1 and e = string_of_int $2 in rest^e}
  | sexpr DECIMAL      {let rest = $1 and e = string_of_float $2 in rest^e}
  | sexpr TOKEN        {let rest = $1 and e = $2 in rest^e}
  | sexpr OPERATOR     {let rest = $1 and e = $2 in rest^e}
  | sexpr COMMA        {let rest = $1 in rest^"," }


number:
  | DECIMAL   {let e = $1 in e}
  | INTEGER   {let e = $1 in float(e)}


expr:
  | sexpr {
    let exprstr = $1 in
    let strast : string ast = string_to_ast exprstr in
    let cname = get_cmpname() in
    let tname,ttypes = HwLib.gettime dat in
    let str2hwid x =
      if x = tname then HNTime else
      let x = HwLib.getvar dat cname x in
      let xn = x.name in
      match x.typ with
      | HPortType(HKInput, _) -> HNInput(LocalCompId(cname),xn,"?","?")
      | HPortType(HKOutput,_) -> HNOutput(LocalCompId(cname),xn,"?","?")
      | HParamType(vl, un) -> HNParam(xn,vl,un)
    in
    let getcmpid c =
      match c with
      | LocalCompId(v) -> v
      | GlobalCompId(v,i) -> v
    in
    let hwid2propid x =
      match x with
      | OpN(Func(prop), [Term(id)]) ->
        begin
        match id with
        | HNInput(c,v,pr,unt) ->
          let nunt = HwLib.getunit dat (getcmpid c) v prop in
          Some(Term(HNInput(c,v,prop,nunt)))
        | HNOutput(c,v,pr,unt) ->
          let nunt = HwLib.getunit dat (getcmpid c) v prop in
          Some(Term(HNOutput(c,v,prop,nunt)))
        | HNParam(c,v,u) -> error "expr" "param doesn't have physical properties"
        | HNTime -> error "expr" "time doesn't have physical properties"
        end
      | OpN(Func(_),_) -> error "expr" "cannot have functions"
      | Acc(_,_) -> error "expr" "cannot have accesses"
      | _ -> None
    in
    let hwast = ASTLib.map strast str2hwid in
    let hwpropast = ASTLib.trans hwast hwid2propid  in
    hwpropast
  }

rel:
    | expr EQ expr {
      let lhs = $1 and rhs = $3 in
      match lhs with
      | Term(HNOutput(x,oname,z,w)) -> (oname,HRFunction(rhs))
      | Deriv(_,_) -> error "fnrel" "must provide an initial condition for derivative."
      | _ -> error "fnrel" "left hand side is too complex."
    }
    | expr EQ expr INITIALLY expr {
      let lhs = $1 and rhs = $3 and icn = $5 in
      match lhs with
      | Deriv(Term(HNOutput(x,oname,z,w)), Term(r)) ->
        if r <> HNTime then
          error "strel" "derivative must be with respect to time."
        else
          begin
          match icn with
          | Term(HNInput(a,icname,c,d)) -> (oname,HRState(rhs,HNInput(a,icname,c,d)))
          | _ -> error "strel" ""
          end
      | Term(v) -> error "strel" "left hand side must by deriv if initial condition is specified."
      | _ -> error "strel" ("left hand side must be simple derivative or term of output: "^(print_expr lhs))
    }


typ:
  | sexpr {UExpr(string_to_ast $1)}
  | NONE {UNone}
  | QMARK {UVariant}

proptyplst:
  | TOKEN COLON TOKEN                      {let prop = $1 and unt = $3 in [(prop,unt)]}
  | TOKEN COLON TOKEN COMMA proptyplst     {let rest = $5 and prop = $1 and unt = $3 in (prop,unt)::rest}

comp:
  | COMP TOKEN EOL {
    let name = $2 in
    let _ = set_cmpname name in
    let _ = HwLib.mkcomp dat name in
    ()
  }
  | comp INPUT TOKEN WHERE proptyplst EOL  {
    let iname = $3 in
    let typlst = $5 in
    let cname = get_cmpname() in
    let _ = HwLib.mkport dat cname HKInput iname typlst in
    ()
  }
  | comp OUTPUT TOKEN WHERE proptyplst EOL  {
    let iname = $3 in
    let typlst = $5 in
    let cname = get_cmpname() in
    let _ = HwLib.mkport dat cname HKOutput iname typlst in
    ()
  }
  | comp PARAM TOKEN COLON typ EQ number EOL {
    let iname = $3 in
    let typ = $5 in
    let vl = $7 in
    let cname = get_cmpname() in
    let _ = HwLib.mkparam dat cname iname vl typ in
    ()
  }
  | comp REL rel EOL {
    let pname,r = $3 and cname = get_cmpname() in
    let _ = HwLib.mkrel dat cname pname r in
    ()
  }
  | comp EOL   {}

block:
  | comp END EOL       {()}

st:
  | TYPE TOKEN EOL  {
    let t = $2 in
    dat.units <- UnitLib.define dat.units t
  }
  | LET number TOKEN EQ number TOKEN EOL  {
    let u1 = $3 and n1 = $2 in
    let u2 = $6 and n2 = $5 in
    dat.units <- UnitLib.mkrule (dat.units) u1 n1 u2 n2
  }
  | PROP TOKEN COLON strlist EOL {
    let units = $4 and name = $2 in
    let _ = HwLib.mkprop dat name units in
    ()
  }
  | TIME TOKEN COLON strlist EOL {
    let units = $4 and name = $2 in
    let _ = HwLib.mktime dat name units in
    ()
  }
  | block {

  }
  | EOL             {}

seq:
  | st              {}
  | seq st          {}

env:
  | seq EOF {Some (dat)}
  | EOF     {None}
