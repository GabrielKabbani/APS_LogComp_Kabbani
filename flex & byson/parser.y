%{
  #include<stdio.h>
  int yylex();
  void yyerror(const char *s) { printf("ERROR: %sn", s); }
%}

%token IDENTIFIER STRING INTEGER
%token WHILE IF ELSE PRINT READ
%token EQUAL EQUAL_TO NOT PLUS MINUS MULT DIV AND OR BIGGER_THAN SMALLER_THAN
%token CONCAT COLON SEMI_COLON COMMA
%token VAR_TYPE FUNC_TYPE OPEN_PAR CLOSE_PAR OPEN_KEY CLOSE_KEY RETURN

%start program

%%

program : block 
        ;

block : OPEN_KEY statement CLOSE_KEY
      | OPEN_KEY CLOSE_KEY
      ;
        
statement : assigment
          | block
          | print
          | if
          | while
          | var_type
          SEMI_COLON
          ;
        
relexpression: expression EQUAL_TO expression
             | expression BIGGER_THAN expression
             | expression SMALLER_THAN expression
             | expression CONCAT expression
             | expression
             ;

expression: term PLUS term
          | term MINUS term
          | term OR term
          | term
          ;

term: factor
    | factor MULT factor
    | factor DIV factor
    | factor AND factor
    ;

factor: INTEGER
    | STRING
    | IDENTIFIER
    | PLUS factor
    | MINUS factor
    | NOT factor
    | READ OPEN_PAR CLOSE_PAR
    | OPEN_PAR relexpression CLOSE_PAR
    ;

while: WHILE OPEN_PAR relexpression CLOSE_PAR statement;
if: IF OPEN_PAR relexpression CLOSE_PAR statement else;
assigment: var_type IDENTIFIER EQUAL relexpression;
print: PRINT OPEN_PAR relexpression CLOSE_PAR;
else: ELSE statement;
var_type: VAR_TYPE IDENTIFIER
        | COMMA IDENTIFIER
        ;

%%

int main(){
  yyparse();
  return 0;
}