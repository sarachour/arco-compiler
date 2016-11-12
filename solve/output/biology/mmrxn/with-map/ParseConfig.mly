
%token <string> TOKEN
%token <string> STRING
%token <float> FLOAT
%token <int> INTEGER
%token <bool> BOOL
%token TBOOL TSTRING TFLOAT TINT EOF


%{
  open Globals
  open Util

  exception ParseConfigException of string

  let tbl : (string,glblprop) map = MAP.make()

  let error n m =
    raise (ParseConfigException (n^": "^m) )

  let add_glbl key v =
    let _ = MAP.put tbl key v in
    ()

%}

%type <string*glblprop> prop
%type <unit> props
%type <(string,Globals.glblprop) Util.map> toplvl

%start toplvl

%%

prop:
  | TBOOL TOKEN BOOL {
    let name = $2 and vl = $3 in
    (name, GlblPropBool vl)
  }
  | TINT TOKEN INTEGER {
    let name = $2 and vl = $3 in
    (name, GlblPropInt vl)
  }
  | TFLOAT TOKEN FLOAT {
    let name = $2 and vl = $3 in
    (name, GlblPropFloat vl)
  }
  | TSTRING TOKEN STRING {
    let name = $2 and vl = $3 in
    (name, GlblPropString vl)
  }

props:
  | prop {let k,v = $1 in add_glbl k v}
  | props prop {let k,v = $2 in add_glbl k v}

toplvl:
  | props EOF {let _ = $1 in tbl}
