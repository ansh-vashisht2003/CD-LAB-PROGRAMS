%{
#include<stdio.h>
#include<string.h>
int is_simple=1;
%}
%%
[ \t\n]+[aA][nN][dD][ \t\n]+|[ \t\n]+[oO][rR][ \t\n]+|[ \t\n]+[bB][uU][tT][ \t\n]+ {is_simple=0;}
. {;}
%%
int yywrap(){
return 1;
}
int main(){
printf("Enter the expression: \n");
yylex();
if(is_simple==1)
printf("SEntence is simple");
else
printf("Statement is complecx");
return 0;
}  

