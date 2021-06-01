#include<stdio.h>
#include<string.h>
#include <unistd.h>
#include <stdlib.h>

#define LSIZ 128
#define RSIZ 10

int stack[100];  //used to store data during runtime
int null[1];     //used to unset stack elements
int current = 0; //Current element in the stack

int c = 0;   //stores the current IP column
int r = 0;   //stores the current IP row
int d = 1;   //used to modify the dir var +/-
int dir = 2; //used to conroll the current direction of IP

int move(int dir);
int pop();

int main(int argc, char *argv[]){

//GETTING THE FILE
    char code[RSIZ][LSIZ];
    char fname[20] = "text.one";
    FILE *fptr = NULL;
    int tot = 0;
    int hold;
    int i = 0;
    int num;

    fptr = fopen(argv[1], "r");
    while(fgets(code[i], LSIZ, fptr)){
        i++;
    }
    //printf("%s\n", code[0]);
    int a = 1;
    //int p = 0;
    while(a != 0){
        if(argv[2]){
            sleep(1);
            printf("--------------------------\n");
            printf("dir: %d, d: %d \n", dir,d);
            printf("r: %d, c: %d\n", r,c);
            printf("instruction: %c\n", code[r][c]);
            printf("stack: %d, current %d\n",stack[current], current);
        }
        switch(code[r][c]){
            //
            //Flow Controll
            //
            case '^':
                dir = 1;
                break;
            case '>':
                dir = 2;
                break;
            case 'v':
                dir = 3;
                break;
            case '<':
                dir = 4;
                break;
            case '\n':
                c--;
                break;
            case ')': //Loop
                if(dir = 2){
                    while(code[r][c] != '('){
                        c--;
                    }
                }
                break;
            case '/': //90° mirror
                switch(dir){
                    case 1:
                        dir = 2;
                    case 2:
                        dir = 1;
                    case 3:
                        dir = 4;
                    case 4:
                        dir = 3;
                    default:
                        ;
                }
                break;
            case '\\': //90° mirror
                switch(dir){
                    case 1:
                        dir = 4;
                    case 2:
                        dir = 1;
                    case 3:
                        dir = 4;
                    case 4:
                        dir = 3;
                    default:
                        ;
                }
                break;
            case '#': //180° mirror (Direction agnostic)
                switch(dir){
                    case 1:
                        dir = 3;
                    case 2:
                        dir = 4;
                    case 3:
                        dir = 1;
                    case 4:
                        dir = 2;
                    default:
                        ;
                }
                break;
            case '|': //180° mirror
            switch(dir){
                    case 2:
                        dir = 1;
                    case 4:
                        dir = 3;
                    default:
                        ;
                }
                break;
            case '_': //180° mirror
                switch(dir){
                    case 1:
                        dir = 3;
                    case 3:
                        dir = 1;
                    default:
                        ;
                }
                break;
            case ';': //End
                a = 0;
                break;
            case ' ':
                break;
            //
            //Logic
            //
            case '!': //Trampoline
                move(1);
                break;
            case '?': //Conditional trampoline
                if(stack[current] == 0){
                    move(1);
                }
                pop();
                break;
            //
            //Stack Manipulation
            //
            case ':': //Duplicate the top value on the stack.
                stack[current+1] = stack[current];
                current++;
                break;
            case '~': //Remove the top value from the stack.
                pop();
                break;
            case '$': //Swap the top two values on the stack
                hold = stack[current];
                stack[current] = stack[current-1];
                stack[current-1] = hold;
                current --;
                break;
            case '@': //USER INPUT
                scanf(" %c", &num);
                stack[current+1] = num;
                current++;
                break;
            //case 'TODO': //Reverse the stack
            case 'l': //Push the length of the stack onto stack
                stack[current+1] = current;
                current++;
                break;
            case '+': //Pop x,y, push x+y
                stack[current-1] = stack[current]+stack[current-1];
                pop();
                break;
            case '-': //Pop x,y, push x-y
                stack[current-1] = stack[current-1]- stack[current];
                pop();
                break;
            case '*': //Pop x,y, push x*y
                stack[current-1] = stack[current]*stack[current-1];
                pop();
                break;
            case ',': //Pop x,y, push x/y
                stack[current-1] = stack[current-1]/stack[current];
                pop();
                break;
            case '%': //Modulo
                stack[current-1] = stack[current]%stack[current-1];
                pop();
                break;
            case '=': //Pop x,y push 1 if true, else 0
                if(stack[current] == stack[current-1]){
                    stack[current-1] = 1;
                    pop();
                }
                else if(stack[current] != stack[current-1]){
                    stack[current-1] = 0;
                    pop();
                }
                break;
            case '"': //Pushes every character found to the stack until closed
            //    c++;
                move(1);
                while(code[r][c] != '"'){
                    //printf("%c",code[r][c]);
                    stack[current+1] = code[r][c];
                    current++;
                    move(1);

                }
                break;
            case '.': //Pop y and x move the IP to (x,y)
                if(current > 1){
                    r = stack[current];
                    c = stack[current-1];
                    pop();
                    pop();
                    break;
                }
            case '&': //Pop as number and print to stdout
                printf("%d",stack[current]);
                pop();
                break;
            case '`': //Pop as character and print to stdout
                printf("%c",stack[current]);
                pop();
                break;
            default:
                stack[current+1] = code[r][c]-'0';
                current++;
                break;
        }
        move(1);

    }
}
int move(int d){
    switch (dir) {
        case 1:
            r--*d;
            break;
        case 2:
            c++*d;
            break;
        case 3:
            r++*d;
            break;
        case 4:
            c--*d;
            break;
        default:
            ;
    }
}
int pop(){
    stack[current] = null[1];
    if(current!=0){current--;}
}
