%{
  open SolverData
  open SolverSln
  open SolverUtil

  let data : sln = SlnLib.mksln()

%}


%token EOF EOL
%token COMPONENT CONN BIND VALUE VAR OF CCOLON

%token <string> TOKEN
%token <int> INTEGER
%token <float> DECIMAL

%type <float> number
%type <unit> cmd
%type <unit> cmdlst
%type <SolverData.sln option> sln

%start sln

%%

number:
  | DECIMAL {$1}
  | INTEGER {float_of_int $1}

cmd:
  | COMPONENT TOKEN INTEGER {
    let cname = UnivLib.name2unodeid $2 in
    let id = $3 in
    let _ = SlnLib.usecomp_mark data cname id in
    ()
  }
  | CONN TOKEN INTEGER TOKEN CCOLON TOKEN INTEGER TOKEN {
    let sname = UnivLib.name2unodeid $2 in
    let sid = $3 in
    let sport = $4 in
    let dname = UnivLib.name2unodeid $6 in
    let did = $7 in
    let dport = $8 in
    let _ = SlnLib.mkconn data (sname,sid,sport) (dname,did,dport) in
    ()
  }
  | BIND VALUE TOKEN OF TOKEN INTEGER TOKEN CCOLON number {
    let prop = $3 in
    let name = UnivLib.name2unodeid $5 in
    let inst = $6 in
    let port = $7 in
    let wire : wireid = (name,inst,port) in
    let value = $9 in
    let _ = SlnLib.mklabel data wire prop (LBindValue value) in
    ()
  }
  | BIND VAR TOKEN OF TOKEN INTEGER TOKEN CCOLON TOKEN TOKEN {
    let prop : string = $3 in
    let name : unodeid = UnivLib.name2unodeid $5 in
    let inst : int = $6 in
    let port : string = $7 in
    let wire : wireid = (name,inst,port) in
    let kind = $9 in
    let name = $10 in
    let lbl =
      if kind == "input" then
        (LBindVar (HNInput,MNVar(MInput, name, UNone)))
      else
        (LBindVar (HNOutput, MNVar(MOutput, name, UNone)))
    in
    let _ = SlnLib.mklabel data wire prop lbl in
    ()
  }

cmdlst:
  | cmd {()}
  | cmdlst EOL cmd {()}

sln:
  | cmdlst EOF {Some data}
  | cmdlst EOL EOF {Some data}
  | EOF     {None}
