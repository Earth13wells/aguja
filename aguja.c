/*------------------------------|
|   This code was written by:   |
|         Earth13Wells          |
| github.com/Earth13Wells/Aguja |
|------------------------------*/

#include<stdio.h>
#include<string.h>
#include <unistd.h>
#include <stdlib.h>
//TODO REMOVE UNUSED LIBS.
#define LSIZ 128
#define RSIZ 10

int stack[99];   //used to store data during runtime
int null[1];     //used to unset stack elements
int current = 0; //Current element in the stack

int c = 0;   //stores the current IP column
int r = 0;   //stores the current IP row
int dir = 2; //used to conroll the current direction of IP

int move(int dir);
int pop();

int main(int argc, char *argv[]){

//GETTING THE FILE
    char code[RSIZ][LSIZ];
    FILE *fptr = NULL;
    int tot = 0;
    int hold;
    int lines = 0;
    int num;
    int mirror[5][4]=
    {
        {2,1,4,3}, // "/"
        {4,3,2,1}, // "\"
        {3,4,1,2}, // "#"
        {1,4,2,2}, // "|"
        {3,2,1,4}  // "_"
    };


    fptr = fopen(argv[1], "r");
    while(fgets(code[lines], LSIZ, fptr)){
        lines++;
    }
    //printf("%s\n", code[0]);
    int a = 1;
    int b;
    int p = 0;
    int reverse[99];
    while(a != 0){
        if(argv[2]){
            sleep(1);
            printf("\n%d:%s",r,code[r]);
            for(p = 0; p < c+2; p++){
                printf(" ");
            }
            printf("^\n");
            printf("dir: %d \n", dir);
            printf("r: %d, c: %d\n", r,c);
            printf("instruction: %d\n", code[r][c]);
            printf("stack: %d, current %d\n",stack[current], current);
            //printf("\033[2J\033[1;1H");\

        }
        if(c == -1){
            while(code[r][c] != '\n'){
                c++;
            }
        }
        if(r == lines){
            r = 0;
        }
        switch(code[r][c]){
//╔═╗┬  >─v┬ ┬  ╔═╗/─\┌┐┌┌┬┐┬─┐v─\┬
//╠╣ │  │ ││││  ║  │ ││││ │ ├┬┘│ ││
//╚  ┴─┘^─<└┴┘  ╚═╝\─/┘└┘ ┴ ┴└─\─^┴─┘
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
                if(dir == 2){
                    c = -1;
                }
                break;
            case ')': //Loop
                if(dir == 2){
                    while(code[r][c] != '('){
                        c--;
                    }
                }
                break;
            case '/': //90° mirror
                dir = mirror[0][dir-1];
                break;
            case '\\': //90° mirror
                dir = mirror[1][dir-1];
                break;
            case '#': //180° mirror (Direction agnostic)
                dir = mirror[2][dir-1];
                break;
            case '|': //180° mirror
                dir = mirror[3][dir-1];
                break;
            case '_': //180° mirror
                dir = mirror[4][dir-1];
                break;
            case ';': //End
                a = 0;
                break;
            //the next 4 lines are to stop "" and "(" from being pushed to stack
            case ' ':
                break;
            case '(':
                break;
//╦  ┌─┐┌─┐┬┌─┐
//║  │?││ ┬!│
//╩═╝└─┘└─┘┴└─┘
            case '!': //Trampoline
                move(1);
                break;
            case '?': //Conditional trampoline
                if(stack[current] == 0){
                    move(1);
                }
                pop();
                break;
//╔═╗┌┬┐┌─┐┌─┐┬┌─  ╔╦╗┌─┐ ┌┐┌ ┬ ┌─┐┬ ┬┬  ┌─┐┌┬┐┬┌─┐┌┐┌
//╚═╗ : ├~┤|  ├┴┐  ║$║├@┤ │[│ l +─┘| ││  ├%┤ │ ││.││││
//╚═╝ ┴ ┴ ┴└─┘┴ ┴  ╩ ╩┴ ┴ ┘└┘ ┴ ┴  └─┘┴─┘┴ ┴ ┴ ┴└─┘┘└┘
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
            case '@': //USER INPUT AS CHAR
                /*
                    Fun Fact: if the user inputs
                        multiple charecters, running
                        '@' again will grab the next
                        character
                */
                // if(num-'0' <= 10){
                //     stack[current+1] = num-48;
                // }
                // else if(num-'A' <= 26){
                //     stack[current+1] = num-55;
                // }
                // else{
                //     stack[current+1] = num-61;
                // }
                /*
                    Since I'm writing a book here anyway;
                    the commented code (above) is to take
                    the user input as its number
                    0-9(0-9)A-Z(10-35)a-z(36-61)
                    I have yet to decide how I want to do user input.
                */
                scanf(" %c", &num);
                stack[current+1] = num;
                current++;
                break;
            case '[':
                for(b = 0; b <= current; b++ ){
                    reverse[b] = stack[current-b];
                    printf("%d\n",reverse[b]);
                }
                for(b = 0; b <= current; b++ ){
                    stack[b] = reverse[b];
                }
                break;
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
                stack[current-1] = stack[current] == stack[current-1] ? 1 : 0;
                pop();
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
            default: //push the charecters value to the stack
                if(code[r][c]-48 <= 10){ //0-9(0-9)
                    stack[current+1] = code[r][c]-48;
                }
                else if(code[r][c]-64 <= 26){ //A-Z(10-35)
                    stack[current+1] = code[r][c]-55;
                }
                else{ //a-z(36-61)
                    stack[current+1] = code[r][c]-61;
                }
                current++;
                break;
        }
        move(1);
        if(dir == 1 && r == -1){
            r = lines-1;
            //pop();
        }
    }
}
int move(int d){
    switch (dir) {
        case 1:
            r--;
            break;
        case 2:
            c++;
            break;
        case 3:
            r++;
            break;
        case 4:
            c--;
            break;
        default:
            ;
    }
}
int pop(){
    stack[current] = null[1];
    if(current!=0){current--;}
}
