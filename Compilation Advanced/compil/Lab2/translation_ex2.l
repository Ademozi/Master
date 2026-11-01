%{
#include <stdio.h>
%}

%%
[Oo][Mm][Gg]   { printf("Oh My God"); }
2  		{ printf("To"); }
[Hh][Vv]    { printf("have"); }
[Bb]4   { printf("before"); }
[A-Za-z0-9]+  	{ printf("%s", yytext); }
[ \t\n]+ 	{ printf("%s", yytext); }
.		{ printf("%s", yytext); }


%%

int main() {
    printf("Enter the sms : \n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}

