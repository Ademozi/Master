%{
#include <stdio.h>
int characters;
int consonants;
int vowels;
%}

%%

"----- "  {printf("0"); characters++;}
"----* "  {printf("9"); characters++;}
"--- "  {printf("8"); characters++;}
"--*** "  {printf("7"); characters++;}
"-**** "  {printf("6"); characters++;}
"***** "  {printf("5"); characters++;}
"****- "  {printf("4"); characters++;}
"***-- "  {printf("3"); characters++;}
"--- "  {printf("2"); characters++;}
"*---- "  {printf("1"); characters++;}

"*- "     {printf("A");vowels++; }
"-*** "   {printf("B");consonants++; }
"-*-* "   {printf("C");consonants++; }
"- "    {printf("D");consonants++; }
"* "      {printf("E");vowels++; }
"-* "   {printf("F");consonants++; }
"--* "    {printf("G");consonants++; }
"**** "   {printf("H");consonants++; }
" "     {printf("I");vowels++; }
"*--- "   {printf("J");consonants++; }
"-*- "    {printf("K");consonants++; }
"*- "   {printf("L");consonants++; }
"-- "     {printf("M");consonants++; }
"-* "     {printf("N");consonants++; }
"--- "    {printf("O");vowels++; }
"*--* "   {printf("P");consonants++; }
"--*- "   {printf("Q");consonants++; }
"*-* "    {printf("R");consonants++; }
"*** "    {printf("S");consonants++; }
"- "      {printf("T");consonants++; }
"- "    {printf("U");vowels++; }
"***- "   {printf("V");consonants++; }
"*-- "    {printf("W");consonants++; }
"-- "   {printf("X");consonants++; }
"-*-- "   {printf("Y");consonants++; }
"--** "   {printf("Z");consonants++; }

"--- -- --* "   {printf("Oh my god"); }
"-*** ****- "   {printf("Before"); }
"**** ***- "    {printf("Have"); }

"/"    { printf(" "); }
[ \t\n]+
.      { /* Ignore other characters */ }

%%

int main() {
    printf("TEST: main updated\n");
    yylex();
    printf("\nnumber of characters : %d\n", characters);
    printf("number of consonants : %d\n", consonants);
    printf("number of vowels : %d\n", vowels);
    return 0;
}

int yywrap() {
    return 1;
}