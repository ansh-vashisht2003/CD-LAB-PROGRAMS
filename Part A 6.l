/* Dont give output as single a or single digit do include some operator */
%{
#include <stdio.h>
#include <string.h>

int noprt = 0, noprnd = 0, valid = 1, i = 0, j = 0, top = -1;
char oprand[10][10], oprt[10][10], a[100];
%}

%%

"(" {
    top++;
    a[top] = '(';
}

")" {
    if (a[top] != '(') {
        valid = 0;
    } else {
        top--;
    }
}

"[" {
    top++;
    a[top] = '[';
}

"]" {
    if (a[top] != '[') {
        valid = 0;
    } else {
        top--;
    }
}

"{" {
    top++;
    a[top] = '{';
}

"}" {
    if (a[top] != '{') {
        valid = 0;
    } else {
        top--;
    }
}

[A-Za-z][a-zA-Z0-9]*|[0-9]+ {
    noprnd++;
    strcpy(oprand[j], yytext);
    j++;
}

"+"|"-"|"*"|"/" {
    noprt++;
    strcpy(oprt[i], yytext);
    i++;
}

%%

int yywrap() {
    return 1;
}

int main() {
    int k = 0;
    printf("Enter expression and press CTRL+D: ");

    yylex();
   
    if (valid == 1 && (noprnd - noprt == 1 && top == -1)) {
        printf("Expression is valid.\n");
        for(k=0;k<j;k++){
            printf("%s\t",oprt[k]);
        }
        for(k=0;k<j;k++){
            printf("%s\t",oprand[k]);
        }
    }
    else {
        printf("Expression is not valid.\n");
    }
   
    return 0;
}
