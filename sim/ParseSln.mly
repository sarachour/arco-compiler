%{


%}


%token EOF EOL
%token COMPONENT CONN BIND VALUE VAR OF CCOLON

%token <string> TOKEN
%token <int> INTEGER
%token <float> DECIMAL

%type <float> number
%type <unit> cmd
%type <unit> cmdlst
%type <string option> sln

%start sln

%%

number:
  | DECIMAL {$1}
  | INTEGER {float_of_int $1}

cmd:
  | COMPONENT TOKEN INTEGER {}
  | CONN TOKEN INTEGER TOKEN CCOLON TOKEN INTEGER TOKEN {}
  | BIND VALUE TOKEN OF TOKEN INTEGER TOKEN CCOLON number {}
  | BIND VAR TOKEN OF TOKEN INTEGER TOKEN CCOLON TOKEN TOKEN {}

cmdlst:
  | cmd {()}
  | cmdlst EOL cmd {()}

sln:
  | cmdlst EOF {Some("")}
  | cmdlst EOL EOF {Some("")}
  | EOF     {None}
