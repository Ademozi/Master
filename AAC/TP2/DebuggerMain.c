#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {

    int fin, debut, droite, gauche;
    char mot[100], tmp;
    printf("Entrez un mot : ");
    scanf("%s", mot);
    debut = 0;
    fin = strlen(mot) - 1;

    for(droite=fin, gauche=debut; droite>gauche; droite--, gauche++) {
        tmp = mot[droite];
        mot[droite] = mot[gauche];
        mot[gauche] = tmp;
    }
    printf("Le mot mirroir est : %s\n", mot);
    return 0;
}