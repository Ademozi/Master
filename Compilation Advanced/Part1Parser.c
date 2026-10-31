#include <stdio.h>
#include <stdlib.h>

// The program checks whether a mathematical expression follows a specific grammar.

char input[100];
int i = 0;
int error = 0;

void E();
void Eprime();
void T();
void Tprime();
void F();

void E() {
    T();
    Eprime();
}

void Eprime() {
    if (input[i] == '+') {
        i++;
        T();
        Eprime();
    }
}

void T() {
    F();
    Tprime();
}

void Tprime() {
    if (input[i] == '*') {
        i++;
        F();
        Tprime();
    }
}

void F() {
    if (input[i] == '(') {
        i++;
        E();

        if (input[i] == ')') {
            i++;
        } else {
            error = 1;
        }
    } else if ((input[i] >= 'a' && input[i] <= 'z') ||
               (input[i] >= 'A' && input[i] <= 'Z')) {
        i++;
    } else {
        error = 1;
    }
}

int main() {
    printf("Entrez une expression : ");
    scanf("%99s", input);

    E();

    if (input[i] == '\0' && error == 0) {
        printf("Accepter Expression! (String valid)\n");
    } else {
        printf("Rejected Expression! (Syntax error)\n");
    }

    return 0;
}