#include <stdio.h>
#define N 5

float average(const int g[], int n);
int maximum(const int g[], int n);
int minimum(const int g[], int n);
int count_passed(const int g[], int n);
void print_report(const int g[], int n); // TODO: calls the four functions above
void curve(int g[], int n, int bonus);// TODO: modifies the array, cap at 20


int main(void) {
    int grades[N] = {12, 15, 9, 18, 14};
    print_report(grades, N);
    curve(grades, N, 2);
    print_report(grades, N);
    return 0;
}