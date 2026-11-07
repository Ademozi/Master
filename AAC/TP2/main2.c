#include <stdio.h>
#include <string.h>

int fin, debut, gauche;
char mot[20];

int main() {
    char tmp;

    printf(" Donner un mot (19 caract max)");
    scanf("%s", mot);

    debut = 0;
    fin = strlen(mot);

    for (gauche = debut; gauche < fin / 2; gauche++) {
        tmp = mot[fin - gauche];
        mot[fin - gauche] = mot[gauche];
        mot[gauche] = tmp;
    }

    printf(" le mot miroir est %s \n", mot);

    return 0;
}