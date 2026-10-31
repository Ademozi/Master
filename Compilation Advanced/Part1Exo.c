#include <stdio.h>
#include <stdlib.h>


char input[100];
int i = 0;
int error = 0;

void S();
void T();
void R();

void match (char expected) {
    if (input[i] == expected) {
        i++;
    } else {
        error = 1;
    }
}

void S() {
    if (input[i] == 'd') {
        match('d');
        match('a');
        T();
    } else {
        R();
        match('f');
    }
}

void T() {
    if (input[i] == 'a') {
        match('a');
        S();
    } else if (input[i] == 'b') {
        match('b');
        match('a');
        T();
    }
}

void R() {
    if (input[i] == 'c') {
        match('c');
        match('a');
        T();
        R();
    }
}


int main() {
    printf("Enter a string: ");
    scanf("%s", input);

    S();

    if (error == 0 && input[i] == '\0') {
        printf("The string is accepted.\n");
    } else {
        printf("The string is rejected.\n");
    }

    return 0;
}