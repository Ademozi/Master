# TP --- Débogage en C avec VS Code

## Préparation

Installer GCC et GDB :

``` bash
sudo apt update
sudo apt install build-essential gdb
```

Installer l'extension **C/C++** de Microsoft dans VS Code.

Compiler en mode débogage :

``` bash
gcc -g -O0 -Wall main.c -o main
```

Dans VS Code, ouvrir **Run and Debug** (`Ctrl+Shift+D`). Ajouter les
variables à surveiller dans **WATCH**.

  Action                       Raccourci
  ---------------------------- ------------
  Démarrer / continuer         `F5`
  Exécuter la ligne suivante   `F10`
  Entrer dans une fonction     `F11`
  Arrêter                      `Shift+F5`

Placer un point d'arrêt en cliquant dans la marge à gauche d'une ligne,
puis lancer avec `F5`.

## Étape 1 --- Préparation

### Q1. Que signifie « débogueur » et quelle est son origine ?

Un débogueur (*debugger*) est un outil qui permet de suivre l'exécution
d'un programme, consulter les variables et localiser les erreurs. Le mot
vient de *debugging*, dérivé de *bug* (défaut). Le terme *bug* existait
déjà avant l'anecdote de 1947 où un insecte fut trouvé dans un
ordinateur.

## Étape 2 --- Exécution jusqu'à un point donné

### Q2. Que se passe-t-il dans WATCH ?

WATCH affiche les valeurs des variables et expressions sélectionnées.
Elles sont actualisées à chaque arrêt du programme.

### Q3. Valeurs de `fin` et `debut` ? Pourquoi ?

Après les initialisations `debut = 0` et `fin = strlen(mot)`, pour
`bonjour` : `debut = 0` et `fin = 7`. `debut` est le premier indice ;
`fin` représente la longueur du mot, pas l'indice du dernier caractère.

### Q4. Les valeurs des camarades sont-elles identiques ?

Elles sont identiques si le mot saisi et le point d'arrêt sont les mêmes
et si les variables ont été initialisées. Sinon, elles peuvent différer.

### Q5. Quels changements après l'exécution de la ligne 12 ?

Les valeurs changent uniquement si cette ligne modifie les variables. Il
faut comparer WATCH avant et après son exécution. La valeur exacte
dépend du code de la première version.

### Q6. Que contient `mot` ?

`mot` contient le mot saisi sous forme d'un tableau de caractères,
terminé par `'\0'` (caractère nul).

## Étape 3 --- Exécution pas à pas

### Q7. Que remarque-t-on ?

La flèche jaune indique la prochaine ligne exécutée. Les valeurs dans
WATCH changent lorsque les instructions modifient les variables.

### Q8. Commenter l'exécution jusqu'à la fin.

Avec `F10`, on suit les instructions une par une, les itérations des
boucles et les changements des variables jusqu'à l'affichage du résultat
et la fin du programme.

## Étape 4 --- Détection d'erreurs logiques

### Q9. Différence entre erreur syntaxique et erreur logique ?

-   **Syntaxique :** le code ne respecte pas les règles du langage C ;
    la compilation échoue généralement.
-   **Logique :** le programme compile et s'exécute, mais donne un
    résultat incorrect.

### Code de la deuxième version

``` c
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

    printf(" le mot miroir est %s \\n", mot);
    return 0;
}
```

### Q10. Le résultat est-il celui attendu ?

Non. Pour `bonjinob`, `fin = 8`. À la première itération,
`mot[fin - gauche]` désigne `mot[8]`, qui contient `'\0'`, au lieu du
dernier caractère `mot[7]`. Le programme place donc le caractère nul au
début du mot et affiche une chaîne vide.

### Q11. Où commencer l'exécution pas à pas ?

Juste avant la boucle `for`, après la saisie et l'initialisation de
`debut` et `fin`.

### Q12. Que remarque-t-on dans WATCH ?

Pour `bonjinob`, au début de la boucle :

-   `mot = "bonjinob"`
-   `debut = 0`
-   `fin = 8`
-   `gauche = 0`

### Q13. Quelle est la valeur de `fin - gauche` ?

Au début, `fin - gauche = 8 - 0 = 8`. Cette valeur montre que le
programme accède à l'indice 8, alors que le dernier caractère est à
l'indice 7.

### Q14. Quelle est l'erreur ?

L'indice est incorrect : il manque `-1`. La correction est :

``` c
tmp = mot[fin - 1 - gauche];
mot[fin - 1 - gauche] = mot[gauche];
mot[gauche] = tmp;
```

La boucle corrigée inverse correctement le mot. Pour `bonjinob`, le
résultat est `bonijnob`.

## Conclusion

Le débogueur permet d'observer l'exécution et les valeurs des variables
pas à pas. Le problème de la deuxième version vient d'une erreur
d'indice : le dernier caractère est à `fin - 1`, et non à `fin`.

> **Remarque :** le code de la première version n'a pas été fourni. Les
> réponses Q3 et Q5 ainsi que les observations exactes de Q2 à Q8
> doivent être vérifiées avec ce code. Pour éviter un dépassement du
> tableau, on peut aussi remplacer `scanf("%s", mot)` par
> `scanf("%19s", mot)`.
