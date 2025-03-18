%{
#include<stdio.h>
int vowelc=0;
int consonantc=0;
%}
%%
[aeiouAEIOU] {vowelc++;}
[a-zA-Z] {consonantc++;}
. {;}
%%
  int main(){
  printf("Enter the statement");
  yylex();
  printf("No. of vowels: %d \nNo. of consonants: %d \n",vowelc,consonantc);
  }
  int yywrap(){
  return 1;
  }


  /* Output: (Press Ctrl+D after riting statement)
  Enter the statement Compiler Design

No. of vowels: 5 
No. of consonants: 9 
*/
