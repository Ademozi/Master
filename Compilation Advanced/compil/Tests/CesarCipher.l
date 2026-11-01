%{
#include <stdio.h>
%}

%%

[a-w]       { printf("%c", yytext[0] + 3); }
[x-z]       { printf("%c", yytext[0] - 23); }

[A-W]       { printf("%c", yytext[0] + 3); }
[X-Z]       { printf("%c", yytext[0] - 23); }

.           { printf("%s", yytext); }

%%

int main()
{
    printf("-----Enter the message: \n");
    yylex();
    return 0;
}