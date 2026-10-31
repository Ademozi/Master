%{
#include <stdio.h>
int word_count = 0, number_count = 0;
%}

%%
[a-zA-Z]+  { word_count++; }
[0-9]+     { number_count++; }
[ \t\n]    { /* Ignore spaces, tabs, and new lines */ }
.          { /* Ignore other characters */ }
%%

int main() {
    printf("--- Enter text (Press Ctrl+D to finish) ---\n");
    yylex();
    printf("Words: %d\nNumbers: %d\n", word_count, number_count);
    return 0;
}

int yywrap() {
    return 1;
}

