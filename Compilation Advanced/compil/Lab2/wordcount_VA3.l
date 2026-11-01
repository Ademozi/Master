%{
#include <stdio.h>
%}

%%
[a-zA-Z]+   { printf("WORD(%s)\n", yytext); }
[0-9]+      { printf("NUMBER(%s)\n", yytext); }   /* Moved to a single line */
[ \t\n]+    { /* Ignore whitespace */ }
.           { printf("OTHER(%s)\n", yytext); }    /* Moved to a single line */
%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}

