%{
#include<stdio.h>
int c=0,w=0,s=0,l=0;
%}
WORD [^ \t\n,\.:]+
EOL [\n]
BLANK [ ]
%%
{WORD} {w++;c=c+yyleng;}
{EOL} {l++;}
{BLANK} {s++;}
%%
int yywrap(){
return 1;}

int main(int argc,char *argv[]){
if(argc!=2)
{
printf("usage :./a.out file.txt");
exit (0);
}
yyin=fopen(argv[1],"r");
yylex();

printf("number of words is %d\n number of lines %d\n number of spaces %d\n number of characters is %d\n ",w,l,s,c);
return 0;
}

/* 
File 2.txt:
I am studying CSE
I am in 6th sem
./a.out 2.txt
number of words is 9
Number of lines 2
Number of spaces 7
Number of characters is 25
*/
