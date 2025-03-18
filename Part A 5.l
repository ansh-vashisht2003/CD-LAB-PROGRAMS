%{
#include <stdio.h>
int pc=0,sc=0;
%}
%%
"scanf" {fprintf(yyout,"readf");
sc++;}
"printf" {fprintf(yyout,"writef");
pc++;}
%%
int yywrap() {
return 1; }
int  main(int argc,char* argv[])
{
if(argc!=3)
{
printf("Usage:./a.out in.txt out.txt");
exit(0);
}
yyin=fopen(argv[1],"r");
yyout=fopen(argv[2],"w");
yylex();
printf("No. of printf statements are: %d\nNo. of scanf statements are: %d\n",pc,sc);
}

