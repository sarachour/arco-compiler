%{
  open Util
  open Unit
  open HWData
  open HWLib
  open HWConnLib
  open IntervalLib

  
  open AST
  open CompileUtil
  open IntervalData
  open StochData

  type parser_meta = {
    mutable comp : hwcompname option;
  }

  let dat = HwLib.mkenv()
  let meta = {comp=None}



  type conn =
    | AllConn
    | CompConn of hwcompname 
    | CompPortConn of hwcompname*string
    | InstConn of hwcompname*(index list)
    | InstPortConn of hwcompname*(index list)*string


  type conntype = Input | Output

  type pid =  (string*string*int)

  let conn_iter (c:conn) (conntype:conntype) (fxn:(hwcompname*string)->index->unit)  =
    let conntype = if conntype = Input then HWKInput else HWKOutput in
    (*determine if this is what we're filtering against*)
    let isconntype v = v.knd = conntype in
    let itercmp cmp (idx:index option) =
      let gidx : index = match idx with
          | Some(i) -> i
          | None -> IToEnd 0
      in
      let hwcnv name = HwLib.hwcompname2str name in 
      match conntype with
      | HWKInput -> MAP.iter cmp.ins (fun vname vr -> fxn (cmp.name,vname) gidx)
      | HWKOutput -> MAP.iter cmp.outs (fun vname vr -> fxn (cmp.name,vname) gidx)
      ;
      ()
    in
    match c with
    | AllConn ->
      let cmps :hwvid hwcomp list = HwLib.getcomps dat in
      let itercmp cmp = List.iter (fun cmp -> itercmp cmp None) cmps in
      ()
    | CompConn(c) ->
      let cmp = HwLib.getcomp dat (c) in
      itercmp cmp None
    | CompPortConn(c,p) ->
      let ident  = (c,p) in
      fxn ident (IToEnd 0)
    | InstConn(c,i) ->
      let cmp = HwLib.getcomp dat c in
      let _ = List.iter (fun idx ->
        itercmp cmp (Some idx)) i
      in
      ()
    | InstPortConn(c,i,p) ->
      let _ = List.iter (fun idx ->
        fxn (c,p) idx
        ) i
      in
      ()

  let idx2hcconn (c:hwcompname) (idx:index) : hwinst_coll=
    let comp : hwvid hwcomp = HwLib.getcomp dat c in
    let res = match idx with
    | IIndex(i) -> HCCIndiv(i)
    | IRange(r) -> HCCRange(r)
    | IToStart(i) -> HCCRange(0,i)
    | IToEnd(i) -> HCCRange(i,comp.insts)
    in
    res

  let add_conns (src:conn) (snk:conn)=
    let handle_conns sc sp sidx dc dp didx =
      let sconn = idx2hcconn sc sidx in
      let dconn = idx2hcconn dc didx in
      let _ = HwConnLib.mkconn dat sc sp dc dp sconn dconn in
      ()
    in
    let _ = conn_iter src Output (fun (sc,sp) sconn ->
      conn_iter snk Input (fun (dc,dp) dconn ->
        handle_conns sc sp sconn dc dp dconn
    ))
    in
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

  let get_comp () =
    HwLib.getcomp dat (get_cmpname())

  let print_expr e =
    ASTLib.ast2str e (fun x -> HwLib.hwvid2str x)

  let mkdfl cname iname =
    let mk p = HwConnLib.mk dat (cname) iname p in
    MAP.iter (dat.props) (fun k v -> mk k); 
    ()
%}


%token EOF EOL
%token EQ COLON QMARK COMMA STAR ARROW OBRACE CBRACE OPARAN CPARAN OBRAC CBRAC DOT
%token TYPE NONE

%token DEF
%token REPR MANTISSA EXPO SIGN
%token MAG SAMPLE
%token MAP IMAP WITH DIRECT LINEAR SCALE OFFSET MAPVAR 

%token PROP TIME  
%token COMP INPUT OUTPUT PARAM END SIM
%token VAR REL INIT DDT

%token SHAPE GAUSS UNIFORM POISS

%token COPY

%token SCHEMATIC INST CONN

%token DIGITAL 

%token <string> STRING TOKEN OP
%token <float> DECIMAL
%token <int> INTEGER

%type<number list> numlist
%type<string list> strlist
%type <string> sexpr
%type <string ast> map_expr
%type <hwvid ast> expr

%type <range> rng

%type <unt> typ
%type <(string*untid) list> proptyplst
%type <Util.number> number
%type <float list> mag

%type <index> ind
%type <index list> inds
%type <conn> connterm
%type <HWData.hwcompname> compname
%type <'a IntervalData.mapper> map_strategy
%type <IntervalData.std_mapper> mapvar_map_strategy
%type <hwvid IntervalData.mapper> hwexpr_map_strategy
%type <unit> schem
%type <unit> comp
%type <unit> block
%type <unit> st
%type <unit> seq
%type <HWData.hwvid HWData.hwenv option> env

%start env

%%
strlist:
  | TOKEN                    {let e = $1 in [e]}
  | TOKEN COMMA strlist      {let lst = $3 and e = $1 in e::lst }

tokenlist:
  | TOKEN           {[$1]}
  | TOKEN tokenlist {$1::$2}

number:
  | DECIMAL   {let e = $1 in Decimal(e)}
  | INTEGER   {let e = $1 in Integer(e)}

numlist:
  | number                    {let e = $1 in [e]}
  | number COMMA numlist      {let lst = $3 and e = $1 in e::lst}

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


rng:
  | OPARAN number COMMA number CPARAN {(float_of_number $2,float_of_number $4)}


expr:
  | sexpr {
    let exprstr = $1 in
    let strast : string ast = string_to_ast exprstr in
    let cname = get_cmpname() in
    let tname,ttypes = HwLib.gettime dat in
    let str2hwid x =
      if x = tname then HNTime else
      if HwLib.hasvar dat cname x
        then
          let v = HwLib.getvar dat cname x in
          HNPort(v.knd,HCMLocal(cname),v.port,"?")
        else if HwLib.hasparam dat cname x
        then
          let v = HwLib.getparam dat cname x in
          HNParam(HCMLocal(cname),v.name)
        else
          error "expr" ("variable "^x^" not found in "^(HwLib.hwcompname2str cname))
    in
    let getcmpid c =
      match c with
      | HCMLocal(v) -> v
      | HCMGlobal(v) -> v.name
    in
    let hwid2propid x =
      match x with
      | OpN(Func(nprop), [Term(HNPort(k,cmp,vname,prop))]) ->
        begin
        Some(Term(HNPort(k,cmp,vname,nprop)))
        end
      | OpN(Func(x),_) -> error "expr" ("cannot have function with name "^x)
      | Acc(_,_) -> error "expr" "cannot have accesses"
      | _ -> None
    in
    let hwast = ASTLib.map strast str2hwid in
    let hwpropast = ASTLib.trans hwast hwid2propid  in
    hwpropast
  }

map_expr:
  | sexpr {
    let exprstr = $1 in
    let strast : string ast = string_to_ast exprstr in
    strast
  }

typ:
  | sexpr {UExpr(string_to_ast $1)}
  | NONE {UNone}
  | QMARK {UVariant}

map_strategy(EXPR):
  | SCALE EQ EXPR OFFSET EQ EXPR {
    let scale_expr : 'a ast = $3 in
    let offset_expr : 'a ast = $6 in
    let data  : 'a linear_mapper = {scale=scale_expr; offset=offset_expr} in 
    MAPLinear(data)
  }

  | SCALE EQ EXPR {
      let scale_expr : 'a ast = $3 in
      let data : 'a scale_mapper = {scale=scale_expr} in
      MAPScale(data)
  }

  | OFFSET EQ EXPR {
      let offset_expr : 'a ast = $3 in
      let data : 'a offset_mapper = {offset=offset_expr} in
      let mapper :'a mapper = MAPOffset(data) in
      mapper 
  }
  | DIRECT {
      MAPDirect
  }

mapvar_map_strategy:
  | SCALE EQ map_expr OFFSET EQ map_expr {
    let scale_expr : 'a ast = $3 in
    let offset_expr : 'a ast = $6 in
    let data  : 'a linear_mapper = {scale=scale_expr; offset=offset_expr} in 
    MAPLinear(data)
  }

  | SCALE EQ map_expr {
      let scale_expr : 'a ast = $3 in
      let data : 'a scale_mapper = {scale=scale_expr} in
      MAPScale(data)
  }

  | OFFSET EQ map_expr {
      let offset_expr : 'a ast = $3 in
      let data : 'a offset_mapper = {offset=offset_expr} in
      let mapper :'a mapper = MAPOffset(data) in
      mapper 
  }
  | DIRECT {
      MAPDirect
  }



hwexpr_map_strategy:
 | SCALE EQ expr OFFSET EQ expr {
    let scale_expr : hwvid ast = $3 in
    let offset_expr : hwvid ast = $6 in
    let data  : hwvid linear_mapper = {scale=scale_expr; offset=offset_expr} in 
    MAPLinear(data)
  }

  | SCALE EQ expr {
      let scale_expr : hwvid ast = $3 in
      let data : hwvid scale_mapper = {scale=scale_expr} in
      MAPScale(data)
  }

  | OFFSET EQ expr {
      let offset_expr : hwvid ast = $3 in
      let data : hwvid offset_mapper = {offset=offset_expr} in
      let mapper :hwvid mapper = MAPOffset(data) in
      mapper 
  }
  | DIRECT {
      MAPDirect
  }



mag:
| OBRAC numlist CBRAC TOKEN {List.map (fun x -> NUMBER.float_of_number x) $2}

shape:
  | GAUSS                                   {STCHGAUSS}
  | POISS                                   {STCHPOISS}
  | UNIFORM                                 {STCHUNIFORM}

proptyplst:
  | TOKEN COLON TOKEN                      {let prop = $1 and unt = $3 in [(prop,unt)]}
  | TOKEN COLON TOKEN COMMA proptyplst     {let rest = $5 and prop = $1 and unt = $3 in (prop,unt)::rest}

portprop:
  | TOKEN OPARAN TOKEN CPARAN              {($3,$1)}
  
digital:
  | DIGITAL INPUT TOKEN EOL {
    let name = HWCmInput $3 in
    set_cmpname name;
    HwLib.mkcomp dat name;
    ()
  }
  | DIGITAL OUTPUT TOKEN EOL {
    let name = HWCmOutput $3 in
    set_cmpname name;
    HwLib.mkcomp dat name;
    ()
  }
  | digital INPUT TOKEN OBRACE proptyplst CBRACE EOL  {
    let iname = $3 in
    let typlst = $5 in
    let cname = get_cmpname() in
    let _ = HwLib.mkport dat cname HWKInput iname typlst in
    let _ = mkdfl cname iname in
    ()
  }
  | digital OUTPUT TOKEN OBRACE proptyplst CBRACE EOL  {
    let iname = $3 in
    let typlst = $5 in
    let cname = get_cmpname() in
    let _ = HwLib.mkport dat cname HWKOutput iname typlst in
    let _ = mkdfl cname iname in
    ()
  }
  | digital INPUT TOKEN EOL {
    let iname = $3 in
    let cname = get_cmpname() in
    let _ = HwLib.mkport dat cname HWKInput iname [] in
    let _ = mkdfl cname iname in
    ()
  }
  | digital OUTPUT TOKEN EOL {
    let iname = $3 in
    let cname = get_cmpname() in
    let _ = HwLib.mkport dat cname HWKOutput iname [] in
    let _ = mkdfl cname iname in
    ()
  }
  | digital REL portprop EQ expr EOL {
    let port,prop = $3 and expr = $5 and cname = get_cmpname() in
    let bhv =
      if prop == "D" then
        HWBDigital ({
            rhs=$5;
          })
      else
        HWBAnalog ({
            rhs=$5;
            stoch=HwLib.mkstoch()
          })
    in
    HwLib.mkrel dat cname port bhv;
    ()
  }
  | digital VAR portprop EQ expr SHAPE shape EOL {
    let port,prop = $3 and cname = get_cmpname() and expr=$6 in
    if prop != "D" then
      let stoch : hwvid stoch= {shape=$7;std=$5} in 
      HwLib.upd_bhv dat (fun b -> match b with
          | HWBAnalog(b) -> b.stoch <- stoch) cname port;
      ()
  }
  | digital DEF portprop MAG EQ mag EOL {
      let port,prop = $3 and cname = get_cmpname() in
      let bound : float list = $6 and typ = "" in
      if List.length bound = 2 then
         let min : float = (List.nth bound 0) in
         let max : float = (List.nth bound 1) in 
         HwLib.upd_defs dat (fun b -> match b with
            | HWDAnalog(d) ->
              d.ival <- IntervalLib.mk_ival_from_floats min max; b
            | HWDDigital(d) ->             
              d.ival <- IntervalLib.mk_ival_from_floats min max; b
         ) cname port
      else error "def digital mag" "not exactly two numbers to define bounds."
  }

  | digital DEF portprop SAMPLE EQ number TOKEN EOL {
      let port,prop = $3 and comp = get_cmpname() and rate = $6 and typ = $7 in
      HwLib.upd_defs dat (fun d -> match d with
         | HWDDigital(x) -> x.freq <- (rate,typ); d 
      ) comp port
  }
  | digital DEF portprop REPR EQ TOKEN EOL {
      let repr = $6 and port,prop = $3 in
      let sign = STRING.count repr "S" in
      let exp = STRING.count repr "E" in
      let mant = STRING.count repr "M" in
      let cname = get_cmpname() in 
      HwLib.upd_defs dat (fun b -> match b with
          | HWDDigital(defs) -> defs.repr <- (sign,exp,mant); b
          ) cname port;
         ()
  }
  | digital DEF MAPVAR tokenlist EOL {
      let vars : string list = $4 in
      let cname = get_cmpname() in 
      HwLib.upd_mapvars dat vars cname;
      ()
  }

  | digital DEF portprop MAP mapvar_map_strategy EOL {
      let comp = get_cmpname() in
      let port,prop = $3 and strat = $5 in
      HwLib.upd_defs dat (fun b -> match b with
          | HWDAnalog(defs) -> defs.conv <- strat; b 
        ) comp port;
      ()
  }


  | digital SIM TOKEN tokenlist EOL {
      let cname = get_cmpname() in
      let spname = $3 in
      let args = $4 in
      let _ = HwLib.mksim dat cname spname args in
      ()
  }

  | digital EOL {()}


comp:
  | COMP TOKEN EOL {
    let name = HWCmComp $2 in
    set_cmpname name;
    HwLib.mkcomp dat name;
    ()
  }
  | COMP COPY TOKEN EOL {
    let name = HWCmCopy  $3 in
    set_cmpname name;
    HwLib.mkcomp dat name;
    ()
  }
  | comp INPUT TOKEN OBRACE proptyplst CBRACE EOL  {
    let iname = $3 in
    let typlst = $5 in
    let cname = get_cmpname() in
    let _ = HwLib.mkport dat cname HWKInput iname typlst in
    let _ = mkdfl cname iname in
    ()
  }
  | comp OUTPUT TOKEN OBRACE proptyplst CBRACE EOL  {
    let iname = $3 in
    let typlst = $5 in
    let cname = get_cmpname() in
    let _ = HwLib.mkport dat cname HWKOutput iname typlst in
    let _ = mkdfl cname iname in
    ()
  }
  | comp PARAM TOKEN COLON typ EQ OBRACE numlist CBRACE EOL {
    let iname = $3 in
    let typ = $5 in
    let vls = $8 in
    let cname = get_cmpname() in
    let _ = HwLib.mkparam dat cname iname vls typ in
    ()
  }
  | comp VAR DDT portprop EQ expr SHAPE shape EOL {
    let port,prop = $4 and comp = get_cmpname() in
    let expr = $6 and shape = $8 in
    let stoch = {shape = $8; std = $6} in
    HwLib.upd_bhv dat (fun b -> match b with
        | HWBAnalogState(b) -> b.stoch <- stoch
        | _ -> error "var ddt" "expected analog state"
    ) comp port;
    ()
  }
  | comp VAR portprop EQ expr SHAPE shape EOL {
    let port,prop = $3 and cname = get_cmpname() in
    let stoch = {shape = $7; std = $5} in
    HwLib.upd_bhv dat (fun b -> match b with
        | HWBAnalog(b) -> b.stoch <- stoch
        | _ -> error "var" "expected analog state"
        ) cname port;
    ()
  }
  | comp REL DDT portprop EQ expr INIT portprop EOL {
    let port,prop = $4 and comp = get_cmpname() in
    let bhv : hwvid hwaderiv= {
      rhs=$6;
      ic=$8;
      stoch=HwLib.mkstoch();
    } in
    HwLib.mkrel dat comp port (HWBAnalogState bhv);
    ()
  }
  | comp REL portprop EQ expr EOL {
    let port,prop = $3 and comp = get_cmpname() in
    let bhv = {
      rhs=$5;
      stoch=HwLib.mkstoch()
    } in
    HwLib.mkrel dat comp port (HWBAnalog bhv);
    ()
  }
  | comp MAPVAR tokenlist {
      let comp = get_comp() and vars = $3 in
      comp.vars <- comp.vars @ vars ;
      ()
  }
  | comp DEF portprop MAP mapvar_map_strategy EOL {
      let port,prop = $3 and comp = get_cmpname() and
      strat : std_mapper = $5 in
      HwLib.upd_defs dat (fun b -> match b with
          | HWDAnalog(defs) -> defs.conv <- strat; b
          | HWDAnalogState(defs) ->
            begin
            defs.stvar.conv <- strat; b
            end
          ) comp port;
        ()
  }
  | comp DEF portprop MAP mapvar_map_strategy WITH hwexpr_map_strategy EOL {
      let port,prop = $3 and comp = get_cmpname()
      and strat : std_mapper= $5 and proxy : hwvid mapper = $7 in
      HwLib.upd_defs dat (fun b -> match b with
          | HWDAnalog(defs) ->
            error "def map with" "cannot use a proxy for an input variable"
          | HWDAnalogState(defs) ->
          begin
            defs.stvar.conv <- strat;
            defs.stvar.proxy <- proxy;
            b

          end
          ) comp port;
        ()
  }

  | comp DEF DDT portprop MAP mapvar_map_strategy EOL {
      let port,prop = $4 and comp = get_cmpname() and strat = $6 in
      HwLib.upd_defs dat (fun b -> match b with
          | HWDAnalogState(defs) -> defs.deriv.conv <- strat; b
          | _ -> error "def ddt map" "must be a state variable"
          ) comp port;
        ()
  }
  

  | comp DEF portprop MAG EQ mag EOL {
      let port,prop = $3 and comp = get_cmpname() in
      let bound : float list = $6 and typ = "" in
      if List.length bound =  2 then
         let min :float =  (List.nth bound 0) in
         let max :float =  (List.nth bound 1) in
         HwLib.upd_defs dat (fun b -> match b with
            | HWDAnalog(d) ->
              d.ival <- IntervalLib.mk_ival_from_floats min max; HWDAnalog(d) 
            | HWDAnalogState(d) ->
              d.stvar.ival <- IntervalLib.mk_ival_from_floats min max; HWDAnalogState(d)
            ) comp port;
         ()
      else error "def mag" "there are >/< two numbers defining the bounds"

  }
  | comp DEF DDT portprop MAG EQ mag EOL {
      let port,prop = $4 and comp = get_cmpname() in
      let bound : float list = $7 and typ = "" in
      if List.length bound =  2 then
         let min =  (List.nth bound 0) in
         let max =  (List.nth bound 1) in
        HwLib.upd_defs dat (fun b -> match b with
            | HWDAnalogState(d) ->
            d.deriv.ival <- IntervalLib.mk_ival_from_floats min max; b) comp port;
         ()
      else error "def ddt mag" "there are >/< two numbers defining the bounds"
  }
  | comp SIM TOKEN tokenlist EOL {
      let cname = get_cmpname() in
      let spname = $3 in
      let args = $4 in
      let _ = HwLib.mksim dat cname spname args in
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
  | TOKEN                     {let name = HWCmComp $1 in CompConn name}
  | COPY OPARAN TOKEN CPARAN { let name = HWCmCopy $3 in CompConn name }
  | INPUT OPARAN TOKEN CPARAN { let name = HWCmInput $3 in CompConn name}
  | OUTPUT OPARAN TOKEN CPARAN { let name = HWCmOutput $3 in CompConn name}
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
compname:
  | COPY TOKEN    {HWCmCopy $2}
  | INPUT TOKEN   {HWCmInput $2}
  | OUTPUT TOKEN  {HWCmOutput $2}
  | TOKEN         {HWCmComp  $1}

schem:
  | SCHEMATIC EOL {
    ()
  }
  | schem INST compname COLON INTEGER EOL {
    let cname : hwcompname= $3 and amt = ($5) in
    HwLib.upd_inst dat cname amt;
    ()
  }
  | schem CONN connterm ARROW connterm EOL {
    let src = $3 and snk = $5 in
    add_conns src snk;
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
