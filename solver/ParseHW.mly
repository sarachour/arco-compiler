%{
  open HW
  open HWCstr
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

%token ENSURE ASSUME MAG ERR

%token COPY

%token SCHEMATIC INST CONN PORT

%token <string> STRING TOKEN OP
%token <float> DECIMAL
%token <int> INTEGER

%type<string list> strlist
%type <string> sexpr
%type <hwvid ast> expr
%type <hcvid ast> errexpr
%type <unt> typ
%type <(propid*untid) list> proptyplst
%type <float> number

%type <string> compname
%type <string*hwrel> rel
%type <unit> schem
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
  | OP          {let e = $1 in e}
  | TOKEN             {let e = $1 in e}
  | INTEGER           {let e = $1 in string_of_int e}
  | DECIMAL           {let e = $1 in string_of_float e}
  | sexpr INTEGER      {let rest = $1 and e = string_of_int $2 in rest^e}
  | sexpr DECIMAL      {let rest = $1 and e = string_of_float $2 in rest^e}
  | sexpr TOKEN        {let rest = $1 and e = $2 in rest^e}
  | sexpr OP     {let rest = $1 and e = $2 in rest^e}
  | sexpr COMMA        {let rest = $1 in rest^"," }


number:
  | DECIMAL   {let e = $1 in e}
  | INTEGER   {let e = $1 in float(e)}

errexpr:
  | sexpr {
    let exprstr = $1 in
    let strast : string ast = string_to_ast exprstr in
    let cname = get_cmpname() in
    let tname,ttypes = HwLib.gettime dat in
    let str2hwid x : hcvid=
      if x = tname then HCNTime else
      let x = HwLib.getvar dat cname x in
      let xn = x.name in
      match x.typ with
      | HPortType(k, _) ->
        let knd = if k = HKInput then HCNInput else HCNOutput in
        HCNPort(knd,HCCMLocal(cname),xn,"?","?")
      | HParamType(vl, un) -> HCNParam(xn,vl,un)
    in
    let getcmpid c =
      match c with
      | HCCMLocal(v) -> v
    in
    let hwid2propid x =
      match x with
      | OpN(Func("E"), [Term(HCNPort(k,c,v,pr,unt))]) ->
        begin
        match k with
          | HCNOutput -> Some(Term(HCNPort(HCNOutputErr,c,v,pr,unt)))
          | HCNInput -> Some(Term(HCNPort(HCNInputErr,c,v,pr,unt)))
        end
      | OpN(Func(nprop), [Term(HCNPort(k,c,v,pr,unt))]) ->
        let nunt = HwLib.getunit dat (getcmpid c) v nprop in
        Some(Term(HCNPort(k,c,v,nprop,nunt)))
      | OpN(Func(_),_) -> error "expr" "cannot have functions"
      | Acc(_,_) -> error "expr" "cannot have accesses"
      | _ -> None
    in
    let hwast = ASTLib.map strast str2hwid in
    let hwpropast = ASTLib.trans hwast hwid2propid  in
    hwpropast
  }

expr:
  | sexpr {
    let exprstr = $1 in
    let strast : string ast = string_to_ast exprstr in
    let cname = get_cmpname() in
    let tname,ttypes = HwLib.gettime dat in
    let str2hwid x =
      if x = tname then HNTime else
      let x = if HwLib.hasvar dat cname x
        then HwLib.getvar dat cname x
        else error "expr" ("variable "^x^" not found in "^cname)
      in
      let xn = x.name in
      match x.typ with
      | HPortType(HKInput, _) -> HNPort(HNInput,HCMLocal(cname),xn,"?","?")
      | HPortType(HKOutput,_) -> HNPort(HNOutput,HCMLocal(cname),xn,"?","?")
      | HParamType(vl, un) -> HNParam(xn,vl,un)
    in
    let getcmpid c =
      match c with
      | HCMLocal(v) -> v
      | HCMGlobal(v,i) -> v
    in
    let hwid2propid x =
      match x with
      | OpN(Func(nprop), [Term(HNPort(k,cmp,vname,prop,unt))]) ->
        begin
        let nunt = HwLib.getunit dat (getcmpid cmp) vname nprop in
        Some(Term(HNPort(k,cmp,vname,nprop,nunt)))
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
      | Term(HNPort(HNOutput,x,oname,z,w)) -> (oname,HRFunction(rhs))
      | Deriv(_,_) -> error "fnrel" "must provide an initial condition for derivative."
      | _ -> error "fnrel" "left hand side is too complex."
    }
    | expr EQ expr INITIALLY expr {
      let lhs = $1 and rhs = $3 and icn = $5 in
      match lhs with
      | Deriv(Term(HNPort(HNOutput,x,oname,z,w)), Term(r)) ->
        if r <> HNTime then
          error "strel" "derivative must be with respect to time."
        else
          begin
          match icn with
          | Term(HNPort(HNInput,a,icname,c,d)) -> (oname,HRState(rhs,HNPort(HNInput,a,icname,c,d)))
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

compname:
  | TOKEN         {let name = $1 in name }
  | COPY TOKEN    {let prop = $2 in HwLib.copy_cid prop}
  | INPUT TOKEN   {let prop = $2 in HwLib.input_cid prop}
  | OUTPUT TOKEN  {let prop = $2 in HwLib.output_cid prop}

comp:
  | COMP compname EOL {
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
  | comp ASSUME TIME number TOKEN EQ number TOKEN EOL {

  }
  | comp ENSURE MAG expr IN OP number COMMA number OP COLON typ EOL {
    if $6 <> "(" || $10 <> ")" then
      error "ensure" "range must have the form (...,..)"
    else
      let p = $4 and min = $7 and max = $8 and typ = $13 in
      ()
  }
  | comp ASSUME ERR errexpr EQ errexpr COLON typ EOL {
      let p = $4 and exp = $6 and typ = $8 in
      ()
  }
  | comp EOL   {}


schem:
  | SCHEMATIC EOL {()}
  | schem INST compname EOL {()}
  | schem INST compname COLON INTEGER EOL {()}

block:
  | comp END EOL       {()}
  | schem END EOL      {()}

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
