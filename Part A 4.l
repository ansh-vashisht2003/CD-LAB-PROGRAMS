/*  \n has been added in line 8 and line 10 so that in place of comments no lines comes in its place */
%{
#include<stdio.h>
int com=0;
%}
%s COMMENT
%%
"//".*\n {com++;}
"/*" {BEGIN COMMENT ;}
<COMMENT>"*/"\n {BEGIN 0;com++ ;}
<COMMENT>\n { com++;}
<COMMENT>. {;}
%%
int yywrap()
{
return 1;
}
int main(int argc, char *argv[])
{
if(argc!=3)
{
printf("Usage: ./a.out p4in.txt p4out.txt\n");
exit(0);
}
yyin=fopen(argv[1],"r");
yyout=fopen(argv[2],"w");
yylex();
printf("No. of comment lines=%d\n",com);
}
