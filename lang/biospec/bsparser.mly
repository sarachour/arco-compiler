%{

open Printf
open Data

let env = Data.BSEnv.create()

%}


%token <string> TOKEN
%token COLON EOL TAB
%token ACTION KIND


%type <Data.BSEnv.env> main
%type <int> indent

%start main

%%


main:
   toplevel {env}
;

indent:
   EOL {0}
   | indent TAB {$1+1}
;

toplevel:
   indent ACTION TOKEN {} 
;