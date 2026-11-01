%{
#include <stdio.h>
%}

%%
[a-z]   { printf("%c", yytext[0] - 'a' + 'A'); } /* Convert to uppercase */
.       { printf("%c", yytext[0]); }             /* Print other characters as they are */
%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}

