%{


%}


%token EOF EOL

%type <string option> cfg

%start cfg

%%

cfg:
  | EOF     {None}
