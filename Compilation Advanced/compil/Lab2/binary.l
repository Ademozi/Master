%{
#include <stdio.h>
%}

%%
01   { printf("b"); }
11   { printf("c"); }
0    { printf("a"); }
1   { /*printf("error");*/ }
.   { /*printf("error");*/ }

%%

int main() {
    printf("Enter a binary sequence : \n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}

