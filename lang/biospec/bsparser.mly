%{

open Printf
open Data

%}


%token <string> TOKEN
%token COLON EOF
%token ACTION KIND



%type <Data.BSEnv.env> toplevel
%type <Data.BSEnv.env> statement
%type <Data.BSEnv.env> main

%start main

%%


main:
   toplevel {$1}
;

statement:
   ACTION TOKEN {
      let e = Data.BSEnv.create() in 
      Data.BSEnv.add_action e (Data.BSEnv.make_action $2); e
   }
   | KIND TOKEN {
      let e = Data.BSEnv.create() in 
      Data.BSEnv.add_type e (Data.BSEnv.make_type $2); e
   }


toplevel:
   statement toplevel {Data.BSEnv.merge $1 $2}
   | EOF {Data.BSEnv.create()}
;