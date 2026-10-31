#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define maxVal 1000

int n, iSize, iExec, *vect, vSize[]={100, 1000, 10000, 100000};
clock_t start, end;
double cpuTime, moyCpuTime;

int mySort(int vect[], int n);

int main(){
    
    srand(time(NULL));
    for(iSize=0; iSize < 4; iSize++){
        n = vSize[iSize];
        moyCpuTime = 0;
        for(iExec=1; iExec <= 30; iExec++){
            vect = malloc(n * sizeof(int));
            if(!vect) {
                printf("Memory allocation failed\n");
                return 1;
            }
            // Generation
            for(int i=0; i < n; i++){
                vect[i] = rand() % maxVal + 1;
            }
            // Runtime evaluation
            start = clock();
            mySort(vect, n);
            end = clock();
            cpuTime = ((double)(end - start)) / CLOCKS_PER_SEC;
            
            moyCpuTime += cpuTime;
            printf("\n Taille=%d \t Exec num:%d \t cpu time= %.4lf", n, iExec, cpuTime);
            free(vect);
        }
        printf("\n ***** Taille=%d Moy cpu time= %.4lf", n, moyCpuTime / 30);
    }
    return 0;
}

// Added your sorting logic here
int mySort(int vect[], int n){
    int i, j, tmp;
    for(i = 0; i < n - 1; i++){
        for(j = i + 1; j < n; j++){
            if(vect[j] > vect[i]){
                tmp = vect[j];
                vect[j] = vect[i];
                vect[i] = tmp;
            }
        }
    }
    return 0;
}