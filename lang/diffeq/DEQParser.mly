%{

open Printf
open Data

let env = Data.DEQEnv.create();
exception ParserError of string*string;;
%}


%token <string> TOKEN
%token COLON EOF SEMICOLON
%token ACTION KIND



%type <Data.DEQEnv.env> toplevel
%type <Data.DEQEnv.env> equation
%type <Data.DEQEnv.env> main

%start main

%%


main:
   toplevel {$1}
;

equation:
   SEMICOLON {env}

toplevel:
   equation toplevel {env}
   | EOF {env}
;