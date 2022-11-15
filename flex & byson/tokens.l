%{
#include <stdio.h>
#include <string.h>
#include "parser.tab.h"
%}

%%

[ \t\n]                 ;
[a-zA-Z_][_a-zA-Z0-9]   return IDENTIFIER;
[a-zA-Z0-9]             return STRING;
[0-9]+                  return INTEGER;

"enquanto"              return WHILE;
"caso"                  return IF;
"senao"                 return ELSE;
"imprima"               return PRINT;
"leia"                  return READ;

"="                     return EQUAL;
"=="                    return EQUAL_TO;
"!"                     return NOT;
"+"                     return PLUS;
"-"                     return MINUS;
"*"                     return MULT;
"/"                     return DIV;
"&&"                    return AND;
"||"                    return OR;
">"                     return BIGGER_THAN;
"<"                     return SMALLER_THAN;

"."                     return CONCAT;
":"                     return COLON;
";"                     return SEMI_COLON;
","                     return COMMA;

"var"                   return VAR_TYPE;
"int"                   return FUNC_TYPE;
"str"                   return FUNC_TYPE;
"void"                  return FUNC_TYPE;
"--<"                   return OPEN_PAR;
">--"                   return CLOSE_PAR;
"defina--<"             return OPEN_KEY;
">--acaba"              return CLOSE_KEY;
"retorna"               return RETURN;

.                       printf("Unknown token!n"); yyterminate();

%%