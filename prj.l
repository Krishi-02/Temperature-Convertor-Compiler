%{
	#include<stdio.h>
	#include "prj.tab.h"
	extern int yylval;
%}

%%
[0-9]+ {yylval=atoi(yytext);  printf("%s : number\n",yytext); return NUM; } 
[0-9]+(.[0-9]+) {yylval=atof(yytext); printf("%s : realnumber\n",yytext); return REALNUM;}
"F"   return FARN;
"K"   return KEL;
"C"   return CEL;
"R"   return RE;
"->"  return OP;


[\t] ; 
[\n] return 0;
. return yytext[0];
%%
int yywrap() 
{
return 1;
}