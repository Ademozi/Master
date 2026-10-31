#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(){
      //Generer une matrice aleatoirement
      int mat[10][10],n,m,i,j;
      srand(time(NULL));
      // srand(1); 
      // will generate the same random numbers each time
      n=3+rand()%7;m=3+rand()%7;
     for(i=0;i<n;i++)for(j=0;j<m;j++)mat[i][j]=1+rand()%100;
     //Afficher
     for(i=0;i<n;i++){
         for(j=0;j<m;j++)printf("%5d",mat[i][j]);
         printf("\n");
     }
     return 0;
}