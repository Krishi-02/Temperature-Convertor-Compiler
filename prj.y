%{
	#include<stdio.h>
%}

%token NUM
%token REALNUM
%token FARN
%token KEL
%token CEL
%token RE
%token OP


%% 
ADI: A{
printf("Answer is: %f \n",(float)$$/9);
return 0; };
|B{
printf("Answer is: %f \n",(float)$$);
return 0; };
|C{
printf("Answer is: %f \n",(float)$$/5);
return 0; };


A: NUM' 'FARN' 'OP' 'CEL{$$=(float)($1-32)*5;}
  |NUM' 'FARN' 'OP' 'KEL{$$=(float)($1+459.67)*5;}
  |NUM' 'RE' 'OP' 'CEL{$$=(float)($1-491.67)*5;}
  |NUM' 'RE' 'OP' 'KEL{$$=(float)$1*5;}
  ;
B: NUM' 'FARN' 'OP' 'RE{$$=(float)($1+459.67);}
  |NUM' 'CEL' 'OP' 'KEL{$$=(float)($1+273.15);}
  |NUM' 'CEL' 'OP' 'FARN{$$=(float)($1*1.8 + 32);}
  |NUM' 'KEL' 'OP' 'CEL{$$=(float)($1-273.15);}
  |NUM' 'RE' 'OP' 'FARN{$$=(float)($1-459.67);}
  |NUM' 'KEL' 'OP' 'FARN{$$=(float)($1-273.15)*1.8 + 32;}
  ;
C: NUM' 'CEL' 'OP' 'RE{$$=(float)($1+273.15)*9;}
  |NUM' 'KEL' 'OP' 'RE{$$=(float)($1*9);}
  ;
%%
void main(){
	printf("valid string\n");
	yyparse();
}
void yyerror(){printf("Please enter valid value. \n");}