%{
  open HW
  open HWCstr
  open Util
  open Unit
  open Common
  open HWData

  open AST
  open CompileUtil

  type parser_meta = {
    mutable comp : string option;
  }

  let dat = HwLib.mkenv()
  let meta = {comp=None}


  type conn =
    | AllConn
    | CompConn of string
    | CompPortConn of string*string
    | InstConn of string*(index list)
    | InstPortConn of string*(index list)*string

  type conntype = Input | Output

  type pid =  (string*string*int)

  let indices2intarr ilst n : int list =
    let indice2intarr i : int list =
      match i with
      | IRange(s,e) -> LIST.mkrange s e
      | IIndex(i) -> [i]
      | IToStart(e) -> LIST.mkrange 0 e
      | IToEnd(s) -> LIST.mkrange s (n-1)
    in
    List.fold_right (fun x r -> (indice2intarr x) @ r) ilst []

  let rec expandconn v conntype : pid list =
    let skind = if conntype = Input then HNInput else HNOutput in
    let all_comps = [] in
    let all_ports p = [] in
    let n_insts c =
      let cstr = HwLib.getcstr dat in
      HwCstrLib.getinsts cstr c
    in
    let getvars c flt = let vars = HwLib.getvars dat c in
      List.filter (fun x -> flt x) vars
    in
    match v with
    | AllConn ->
      let cmps = List.map (fun x -> x.name) (HwLib.getcomps dat) in
      let cstr = HwLib.getcstr dat in
      let handle x r = (expandconn (CompConn x) conntype) @ r
      in
      List.fold_right (fun x r -> handle x r) cmps []
    | CompConn(c) ->
      let fltvar v = match v.typ with HPortType(k,_) -> skind = k | _ -> false in
      let n = n_insts c in
      let vrs : string list = List.map (fun (x:hwvar) -> x.name) (getvars c fltvar) in
      let inds = LIST.mkrange 0 n in
      let vp = LIST.prod vrs inds in
      List.map (fun ((v,i):string*int) -> (c,v,i)) vp
    | CompPortConn(c,p) ->
      let n = n_insts c in
      let nrng = LIST.mkrange 0 n in
      List.map (fun i -> (c,p,i)) nrng
    | InstConn(c,i) ->
      let fltvar v = match v.typ with HPortType(k,_) -> skind = k | _ -> false in
      let n = n_insts c in
      let vrs : string list = List.map (fun (x:hwvar) -> x.name) (getvars c fltvar) in
      let inds : int list= indices2intarr i n in
      let vp = LIST.prod vrs inds in
      List.map (fun ((v,i):string*int) -> (c,v,i)) vp
    | InstPortConn(c,i,p) ->
      let n =  n_insts c in
      let inds : int list = indices2intarr i n in
      List.map (fun i -> (c,p,i)) inds

  let addallconns src snk =
    let e1 = expandconn src Output in
    let e2 = expandconn snk Input in
    let eprod : (pid*pid) list = LIST.prod e1 e2 in
    let c = HwLib.getcstr dat in
    let add (sc,sp,si) (dc,dp,di) =
      let _ = HwCstrLib.mkconn c sc sp si dc dp di in
      ()
    in
    let _ = List.iter (fun (src,snk) -> add src snk) eprod in
    ()


  let mkdfl cname iname =
    let defl p = HwCstrLib.dflport (HwLib.getcstr dat) cname iname p in
    let _ = MAP.iter (dat.props) (fun k v -> defl k) in
    ()

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
%token EQ COLON QMARK COMMA STAR ARROW OPARAN CPARAN OBRAC CBRAC DOT
%token TYPE LET NONE INITIALLY IN WHERE

%token PROP TIME
%token COMP INPUT OUTPUT PARAM REL END SPICE

%token ENSURE ASSUME MAG ERR

%token COPY

%token SCHEMATIC INST CONN

%token DIGITAL SAMPLE EVERY

%token <string> STRING TOKEN OP
%token <float> DECIMAL
%token <int> INTEGER

%type<string list> strlist
%type <string> sexpr
%type <range> rng
%type <hwvid ast> expr
%type <hevid ast> errexpr
%type <unt> typ
%type <(propid*untid) list> proptyplst
%type <Util.number> number

%type <index> ind
%type <index list> inds
%type <conn> connterm
%type <string> compname
%type <string*hwrel> rel
%type <unit> schem
%type <unit> comp
%type <unit> block
%type <unit> st
%type <unit> seq
%type <HWData.hwenv option> env

%start env

%%

strlist:
  | TOKEN                    {let e = $1 in [e]}
  | TOKEN COMMA strlist      {let lst = $3 and e = $1 in e::lst }

tokenlist:
  | TOKEN           {[$1]}
  | TOKEN tokenlist {$1::$2}

sexpr:
  | OP          {let e = $1 in e}
  | TOKEN             {let e = $1 in e}
  | INTEGER           {let e = $1 in string_of_int e}
  | DECIMAL           {let e = $1 in str_of_float e}
  | OPARAN            {"("}
  | OBRAC             {"["}
  | sexpr INTEGER      {let rest = $1 and e = string_of_int $2 in rest^e}
  | sexpr DECIMAL      {let rest = $1 and e = str_of_float $2 in rest^e}
  | sexpr TOKEN        {let rest = $1 and e = $2 in rest^e}
  | sexpr OP     {let rest = $1 and e = $2 in rest^e}
  | sexpr COMMA        {let rest = $1 in rest^"," }
  | sexpr STAR         {let rest = $1 in rest^"*"}
  | sexpr OBRAC        {let rest = $1 in rest^"["}
  | sexpr CBRAC        {let rest = $1 in rest^"]"}
  | sexpr OPARAN       {let rest = $1 in rest^"("}
  | sexpr CPARAN       {let rest = $1 in rest^")"}

number:
  | DECIMAL   {let e = $1 in Decimal(e)}
  | INTEGER   {let e = $1 in Integer(e)}

rng:
  | OPARAN number COMMA number CPARAN {(float_of_number $2,float_of_number $4)}

errexpr:
  | sexpr {
    let exprstr = $1 in
    let strast : string ast = string_to_ast exprstr in
    let cname = get_cmpname() in
    let tname,ttypes = HwLib.gettime dat in
    let str2hwid x : hevid=
      if x = tname then HENTime("?") else
      let x = HwLib.getvar dat cname x in
      let xn = x.name in
      match x.typ with
      | HPortType(k, _) ->
        HENPort(k,HCMLocal(cname),xn,"?","?")
      | HParamType(vl, un) -> HENParam(xn,vl,un)
    in
    let getcmpid c =
      match c with
      | HCMLocal(v) -> v
      | HCMGlobal(v,i) -> v
    in
    let hwid2propid x =
      match x with
      | OpN(Func("E"), [Term(HENPort(k,c,v,pr,unt))]) ->
          Some(Term(HENPortErr(k,c,v,pr,unt)))
      | OpN(Func(nprop), [Term(HENPort(k,c,v,pr,unt))]) ->
        let nunt = HwLib.getunit dat (getcmpid c) v nprop in
        Some(Term(HENPort(k,c,v,nprop,nunt)))
        | OpN(Func(nprop), [Term(HENPortErr(k,c,v,pr,unt))]) ->
          let nunt = HwLib.getunit dat (getcmpid c) v nprop in
          Some(Term(HENPortErr(k,c,v,nprop,nunt)))
      | OpN(Func(s),_) -> error "errexpr" ("cannot have function with name "^s)
      | Acc(_,_) -> error "errexpr" "cannot have accesses"
      | _ -> None
    in
    let hwast = ASTLib.map strast str2hwid in
    let hwpropast = ASTLib.trans hwast hwid2propid  in
    hwpropast
  }

erel:
| errexpr EQ errexpr {
  let lhs = $1 and rhs = $3 in
  match lhs with
  | Term(HENPortErr(HNOutput,x,oname,z,w)) -> ((x,oname,z),HERFunction(rhs))
  | Deriv(Term(HENPortErr(HNOutput,x,oname,z,w)),Term(HENTime(_))) -> ((x,oname,z), HERState(rhs))
  | _ ->  error "erel" "must provide a term or derivative for lhs."
  | _ -> error "erel" "left hand side is too complex."
}
expr:
  | sexpr {
    let exprstr = $1 in
    let strast : string ast = string_to_ast exprstr in
    let cname = get_cmpname() in
    let tname,ttypes = HwLib.gettime dat in
    let str2hwid x =
      if x = tname then HNTime(HCMLocal(cname),UNone) else
      let x = if HwLib.hasvar dat cname x
        then HwLib.getvar dat cname x
        else error "expr" ("variable "^x^" not found in "^cname)
      in
      let xn = x.name in
      match x.typ with
      | HPortType(k, _) -> HNPort(k,HCMLocal(cname),xn,"?","?")
      | HParamType(vl, un) -> HNParam(HCMLocal(cname),xn,vl,un)
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
      | OpN(Func(x),_) -> error "expr" ("cannot have function with name "^x)
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
      | Term(HNPort(HNOutput,x,oname,z,w)) ->
        let lhs = HNPort(HNOutput,x,oname,z,w) in
        (oname,HRFunction(lhs,rhs))
      | Deriv(_,_) -> error "fnrel" "must provide an initial condition for derivative."
      | _ -> error "fnrel" "left hand side is too complex."
    }
    | expr EQ expr INITIALLY expr {
      let lhs = $1 and rhs = $3 and icn = $5 in
      let istime x = match x with HNTime(_) -> true | _ -> false in
      match lhs with
      | Deriv(Term(HNPort(HNOutput,x,oname,z,w)), Term(r)) ->
        let lhs = HNPort(HNOutput,x,oname,z,w) in
        if istime r = false then
          error "strel" "derivative must be with respect to time."
        else
          begin
          match icn with
          | Term(HNPort(HNInput,a,icname,c,d)) -> (oname,HRState(lhs,rhs,HNPort(HNInput,a,icname,c,d)))
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
  | COPY TOKEN    {let prop = $2 in HwLib.copy_cid prop}
  | INPUT TOKEN   {let prop = $2 in HwLib.input_cid prop}
  | OUTPUT TOKEN  {let prop = $2 in HwLib.output_cid prop}
  | TOKEN         {let name = $1 in name }

digital:
  | DIGITAL INPUT TOKEN EOL {
    let name = HwLib.input_cid $3 in
    let _ = set_cmpname name in
    let _ = HwLib.mkcomp dat name in
    ()
  }
  | DIGITAL OUTPUT TOKEN EOL {
    let name = HwLib.output_cid $3 in
    let _ = set_cmpname name in
    let _ = HwLib.mkcomp dat name in
    ()
  }
  | digital INPUT TOKEN WHERE proptyplst EOL  {
    let iname = $3 in
    let typlst = $5 in
    let cname = get_cmpname() in
    let _ = HwLib.mkport dat cname HNInput iname typlst in
    let _ = mkdfl cname iname in
    ()
  }
  | digital OUTPUT TOKEN WHERE proptyplst EOL  {
    let iname = $3 in
    let typlst = $5 in
    let cname = get_cmpname() in
    let _ = HwLib.mkport dat cname HNOutput iname typlst in
    let _ = mkdfl cname iname in
    ()
  }
  | digital INPUT TOKEN EOL {
    let iname = $3 in
    let cname = get_cmpname() in
    let _ = HwLib.mkport dat cname HNInput iname [] in
    let _ = mkdfl cname iname in
    ()
  }
  | digital OUTPUT TOKEN EOL {
    let iname = $3 in
    let cname = get_cmpname() in
    let _ = HwLib.mkport dat cname HNOutput iname [] in
    let _ = mkdfl cname iname in
    ()
  }
  | digital EOL {()}
  | digital ASSUME SAMPLE expr EVERY number TOKEN EOL {
    let e = $4 in
    let n = float_of_number $6 in
    let u = $7 in
    match e with
    |Term(HNPort(_,c,v,p,_)) -> let cn = HwLib.compid2str c in
      let cstr = HwLib.getcstr dat in
      let _ = HwCstrLib.mkdigital cstr cn (HCDigSample (v,p,n,u)) in
      ()
  }
  | digital ENSURE MAG expr IN rng COLON typ EOL {
      let lhs = $4 and r = $6 and typ = $8 and c = HwLib.getcstr dat in
      let cmpname,portname,prop = match lhs with
      | Term(HNPort(_,HCMLocal(cmpname),portname,prop,_)) -> (cmpname,portname,prop)
      | Term(HNPort(_,HCMGlobal(cmpname,_),portname,prop,_)) -> (cmpname,portname,prop)
      | _ -> error "magparse" "unknown term to constrain."
      in
      HwCstrLib.mkmag c cmpname portname prop r
  }

  | digital SPICE TOKEN tokenlist EOL {
      let cname = get_cmpname() in
      let spname = $3 in
      let args = $4 in
      let _ = HwLib.mkspice dat cname spname args in
      ()
  }


comp:
  | COMP TOKEN EOL {
    let name = $2 in
    let _ = set_cmpname name in
    let _ = HwLib.mkcomp dat name in
    ()
  }
  | COMP COPY TOKEN EOL {
    let name = HwLib.copy_cid  $3 in
    let _ = set_cmpname name in
    let _ = HwLib.mkcomp dat name in
    ()
  }
  | comp INPUT TOKEN WHERE proptyplst EOL  {
    let iname = $3 in
    let typlst = $5 in
    let cname = get_cmpname() in
    let _ = HwLib.mkport dat cname HNInput iname typlst in
    let _ = mkdfl cname iname in
    ()
  }
  | comp OUTPUT TOKEN WHERE proptyplst EOL  {
    let iname = $3 in
    let typlst = $5 in
    let cname = get_cmpname() in
    let _ = HwLib.mkport dat cname HNOutput iname typlst in
    let _ = mkdfl cname iname in
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
      let lv :float = float_of_number $4 and ln :string = $5 in
      let rv :float = float_of_number $7 and rn : string = $8 and cname = get_cmpname() in
      let ratio = rv /. lv in
      let tname,_ =  HwLib.gettime dat in
      if ln = tname then
        let _ = HwLib.mkcompspd dat cname (OpN(Mult,[Decimal(ratio);Term(rn)])) in
        ()
      else
        error "parseasmtime" "must define a speed assumption on time only."
  }
  | comp ENSURE MAG expr IN rng COLON typ EOL {
      let lhs = $4 and r = $6 and typ = $8 and c = HwLib.getcstr dat in
      let cmpname,portname,prop = match lhs with
      | Term(HNPort(_,HCMLocal(cmpname),portname,prop,_)) -> (cmpname,portname,prop)
      | Term(HNPort(_,HCMGlobal(cmpname,_),portname,prop,_)) -> (cmpname,portname,prop)
      | _ -> error "magparse" "unknown term to constrain."
      in
      HwCstrLib.mkmag c cmpname portname prop r
  }
  | comp ASSUME ERR erel COLON typ EOL {
      let (cmpid,portname,propname),rhs = $4 and typ = $6 and c = HwLib.getcstr dat in
      let cmpname : string = match cmpid with
      | HCMLocal(cmpname) -> cmpname
      | HCMGlobal(cmpname,_) -> cmpname
      in
      let _ = HwCstrLib.mkerr c cmpname portname propname rhs in
      ()
  }
  | comp ENSURE TIME IN rng COLON TOKEN EOL {
      let r = $5 and cname = get_cmpname() and c = HwLib.getcstr dat in
      let _ = HwCstrLib.mktc c cname r in
      ()
  }
  | comp SPICE TOKEN tokenlist EOL {
      let cname = get_cmpname() in
      let spname = $3 in
      let args = $4 in
      let _ = HwLib.mkspice dat cname spname args in
      ()
  }
  | comp EOL   {}

ind:
  | INTEGER COLON {let s = $1 in IToEnd(s)}
  | COLON INTEGER {let s = $2 in IToStart(s)}
  | INTEGER COLON INTEGER {let s = $1 and e = $3 in IRange(s,e)}
  | INTEGER           {let i = $1 in IIndex(i)}

inds:
  | ind {let a = $1 in [a]}
  | ind COMMA inds {let a = $1 and lst = $3 in a::lst}

connterm:
  | STAR                      {AllConn}
  | TOKEN                     {let name = $1 in CompConn name}
  | COPY OPARAN TOKEN CPARAN { let name = HwLib.copy_cid $3 in CompConn name }
  | INPUT OPARAN TOKEN CPARAN { let name = HwLib.input_cid $3 in CompConn name}
  | OUTPUT OPARAN TOKEN CPARAN { let name = HwLib.output_cid $3 in CompConn name}
  | connterm OBRAC inds CBRAC {
    let basic = $1 and inds = $3 in
    match basic with
    | CompConn(name) -> InstConn(name,inds)
    | _ -> error "connterm" "unsupported term as instance"
  }
  | connterm DOT TOKEN {
    let basic = $1 and port = $3 in
    match basic with
    | CompConn(name) -> CompPortConn(name,port)
    | InstConn(name,inds) -> InstPortConn(name,inds,port)
    | _ -> error "connterm" "unsupported port of term."
  }

schem:
  | SCHEMATIC EOL {
    ()
  }
  | schem INST compname COLON INTEGER EOL {
    let cname = $3 and amt = ($5) and c = HwLib.getcstr dat in
    let _ = HwCstrLib.mkinst c cname amt in
    ()
  }
  | schem CONN connterm ARROW connterm EOL {
    let src = $3 and snk = $5 in
    let _ = addallconns src snk in
    ()
  }
  | schem ENSURE MAG TOKEN IN rng COLON TOKEN {
    let pname = $4 and r = $6 and c = HwLib.getcstr dat in
    let _ = HwCstrLib.mkglblmag c pname r in
    ()
  }
  | schem ENSURE TIME IN rng COLON TOKEN {
    let r = $5 and c = HwLib.getcstr dat in
    let _ = HwCstrLib.mkglbltc c r in
    ()
  }
  | schem EOL {
    ()
  }

block:
  | comp END EOL       {()}
  | digital END EOL    {()}
  | schem END EOL      {()}

st:
  | TYPE TOKEN EOL  {
    let t = $2 in
    dat.units <- UnitLib.define dat.units t
  }
  | LET number TOKEN EQ number TOKEN EOL  {
    let u1 = $3 and n1 = float_of_number $2 in
    let u2 = $6 and n2 = float_of_number $5 in
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
