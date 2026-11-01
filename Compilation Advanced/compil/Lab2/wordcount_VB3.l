%{
#include <stdio.h>
/* Define token codes manually, we assign a code to each defined token to be processed in the step
of syntax analysis */
#define WORD 256
#define NUMBER 257
%}

%%
[a-zA-Z]+   { return WORD; }
[0-9]+      { return NUMBER; }                   /* Fixed line break */
[ \t\n]+    { /* ignore whitespace */ }
.           { /* ignore other characters */ }     /* Fixed line break */
%%

int main() {
    int token;
    while ((token = yylex())) {
        switch(token) {
            case WORD:
                printf("WORD\n");
                break;
            case NUMBER:
                printf("NUMBER\n");
                break;
        }
    }
    return 0;
}

/* Added yywrap to prevent compiler linking errors */
int yywrap() {
    return 1;
}

