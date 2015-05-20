%token <string> TOKEN
%token COLON ASSIGNMENT TAB EOL

%token INPUTS OUTPUTS PARAMETERS PROPERTIES RELATION

%type <int> main
%start main

%%

main:
   toplevel {5}
;

toplevel:
   EOL {0}
;