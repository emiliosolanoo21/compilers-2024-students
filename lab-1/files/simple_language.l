%{
#include <cstdlib>
#include <string>
#include <iostream>
#include "y.tab.h"
%}

%%

[a-zA-Z][a-zA-Z0-9]*    { yylval.str = new std::string(yytext);  return ID; }
[0-9]+                  { yylval.num = strtol(yytext, NULL, 10); return NUMBER; }
"+"                     { return '+'; }
"-"                     { return '-'; }
"*"                     { return '*'; }
"/"                     { return '/'; }
"="                     { return '='; }
":"                     { return ':'; }
[ \t]                   ;  // skip whitespace
\n                      ; /* ignore all the rest */
.                       { std::cout << "Token invalido." << yytext << std::endl; exit(1); }

%%

int yywrap() {
    return 1;
}