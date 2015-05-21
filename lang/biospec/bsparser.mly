%{

open Printf
open Data

let env = Data.BSEnv.create();
exception ParserError of string*string;;
%}


%token <string> TOKEN
%token COLON EOF SEMICOLON
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
   ACTION TOKEN SEMICOLON {
      Data.BSEnv.add_action env (Data.BSEnv.make_action $2)
   }
   | KIND TOKEN SEMICOLON {
      Data.BSEnv.add_type env (Data.BSEnv.make_type $2)
   }
   | TOKEN TOKEN SEMICOLON {
      let typ = $1 in
      let handle = $2 in
      if Data.BSEnv.has_type env (Data.BSEnv.make_type typ)
      then
         print_string("Type "^typ^" exists. Defining "^handle^"\n")
      else
         raise (ParserError ("Type Error:","no type named "^typ));
      env
   }
   | TOKEN TOKEN TOKEN SEMICOLON {
      let source = $1 in
      let action = $2 in 
      let sink = $3 in 
      if Data.BSEnv.has_action env (Data.BSEnv.make_action action)
      then
         print_string("Action "^action^" exists. Defining "^source^"->"^sink^"\n")
      else
         raise (ParserError ("Action Error:","no action named "^action));
      env
   }
   | TOKEN COLON TOKEN TOKEN TOKEN SEMICOLON {
      let handle = $1 in
      let source = $3 in
      let action = $4 in 
      let sink = $5 in 
      if Data.BSEnv.has_action env (Data.BSEnv.make_action action)
      then
         print_string("Action "^action^" exists. Defining "^handle^":"^source^"->"^sink^"\n")
      else
         raise (ParserError ("Action Error:","no action named "^action));
      env
   }


toplevel:
   statement toplevel {env}
   | EOF {env}
;