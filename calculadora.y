%{
#include <stdio.h>
void yyerror(char *);
%}
%token FIM_LINHA
%token INTEIRO
%left '+' '-' '*' '/'
%start linha
%%
linha: expressao FIM_LINHA { printf("Valor :%d\n", $1);}
								;

expressao: expressao '+' termo { $$ = $1 + $3 ; }
					| expressao '-' termo { $$ = $1 - $3 ; }
					| expressao '*' termo { $$ = $1 * $3 ; }
					| expressao '/' termo { if ($3 != 0) $$ = $1 / $3 ;
																	 else
																	     {
																	   $$ = 0 ;
																		 fprintf(stderr, "divisao por 0\n");
																		 return(0);
																	     }
																	 }
					| '-' expressao { $$ = -$2 ;}
					| termo { $$ = $1; }
					;

termo: INTEIRO { $$ = $1; }
		;
%%

int main(int argc, char **argv)
{
    return yyparse();
}

/* função usada pelo bison para dar mensagens de erro */
void yyerror(char *msg)
{
    fprintf(stderr, "erro: %s\n", msg);
}
