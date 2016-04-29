%{
/* arquivo produzido pelo bison */
#include "calculadora.tab.h"
%}
%option noyywrap
%%
[0-9]+  yylval = atoi(yytext);  return INTEIRO;
"ls"     {system("ls");}
"ps"     {system("ps -A");}
"+"      return '+';
"-"      return '-';
"*"      return '*';
"/"      return '/';
[ \t]    ;  /* ignora espaços e tabs (\t) */
"\n"     return FIM_LINHA;
"quit"   {return(0);}
%%
