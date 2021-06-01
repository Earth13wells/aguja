<span style="white-space: pre;">  
  
# AGUJA  
  
2D Esolang (Be gentle, this was made in only a few hours)  
  
| Instruction |   Action                                                        |  
| ----------- | --------------------------------------------------------------- |
|    (        |   Start an infinite non-nestable loop                           |
|    )        |   End the infinite non-nestable loop                            |
|  ^>v<       |   Change direction of IP                                        |
|    !        |   Trampoline (skip next instruction)                            |
|    ?        |   Conditional Trampoline; pop item off stack if not 0; skip     |
|    :        |   Duplicate the top value on the stack                          |
|    ~        |   Remove the top value from the stack                           |
|    $        |   Swap the top two values on the stack                          |
|    @        |   Push user input to top of stack                               |
|    l        |   Push the length of the stack onto stack                       |
|    \+       |    Pop x,y, push x+y                                            |
|    \-       |    Pop x,y, push x-y                                            |
|    \*       |    Pop x,y, push x*y                                            |
|    \,       |    Pop x,y, push x/y                                            |
|    %        |   Pop x,y, push x%y                                             | 
|    =        |   Pop x,y push 1 if true, otherwise push 0                      |
|    \"       |    Pushes every character found to the stack until closed       |   
|    /\\      |   90° mirrors change IP direction based on input                |
|    \#       |    180° mirror (Direction agnostic)                             |
|    |_       |   180° mirrors change IP direction based on input               |
|    .        |   Pop y and x move the IP to (x,y)                              |
|    &        |   Pop as number and print to stdout                             |
|    \`       |   Pop as character and print to stdout                          |
|    ;        |   End the program                                               |
                                            
# warning these wont work due to github nor using monospace font.                            
## Hello, Wold                               
    "!dlrow ,olleH"> `v                                
                  ;^!?<                                    
## Truth machine                                    
    @:?v(99-&)                              
       &                                      
       ;                                  
## While program                                   
                                                   
## 99 bottles                                     
    92+9*:& >0"llaw eht no reeb fo selttob ">:?vv                  
    |                                       ^` <v                      
    |      ;^?                     :  &: -1`+91~<                      
                                                                
## Cat                              
    (@`?91+`?!);                                   
                      
