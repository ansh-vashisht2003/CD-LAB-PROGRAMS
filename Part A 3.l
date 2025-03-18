%{
#include<stdio.h>
int posint=0,negint=0,posfrac=0,negfrac=0;
%}
%%
[+]?[0-9]+ {posint++;}
[-][0-9]+ {negint++;}
[+]?[0-9]*\.[0-9]+ {posfrac++;}
[-][0-9]*\.[0-9]+ {negfrac++;}
. {;}
%%
int yywrap(){
return 1;
}
int main(int argc , char* argv[]){
if(argc!=2)
{
printf("Usage: ./a.out file.txt \n");
}
yyin=fopen(argv[1],"r");
yylex();
printf("No. of Positive Integers: %d \nNo. of negative integers: %d\nNo. of Positive Fractions: %d\nNo. of Negative Fractions: %d\n",posint,negint,posfrac,negfrac);
return 0;
}

/* 3.txt
5
6.0 -78
No. of Positive Integers: 1 
No. of negative integers: 1
No. of Positive Fractions: 1
No. of Negative Fractions: 0
*/
