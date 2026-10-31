#include <stdio.h>
#include <stdlib.h>

char input[100];
int i = 0;
int error = 0;
void S();
void T();
void R();

void S(){
    if(input[i] == 'd'){
        i++;
        if(input[i] == 'a'){
        i++;
        T();
        } else 
        {
            error = 1 ;
        }
        
        
    } else if (1)
    
    { R();
        if(input[i] == 'f'){
            i++;
        }
    } else{
        error = 1;
    }
    
}

void T() {
    if(input[i] == 'a'){
            i++;
            S();
    } else if(input[i] == 'b'){
        i++;
        if(input[i] == 'a'){
        i++;
        T();
        } 
      
    }

    
}
void R(){
    if(input[i] == 'c'){
        i++;
        if(input[i] == 'a'){
        i++;
        T(); R();
        }
    }
}

int main() {
        ntf("Entrez une expression : ");
    scanf("%s", input);
    E();
    if (input[i] == '\0' && error == 0) {
    printf("Accepter Expression! (String valid)\n");
    } else {
    printf("Rejected Expression! (Syntax error)\n"); }
    return 0;}
