%{
    #include <stdio.h>
    #include <stdlib.h>
%}
%%
[0-9]*[02468] {printf("Even no");}
[0-9]*[13579] {printf("odd no");}
.* {printf("invalid no");}
%%
int main() {
    printf("Enter a no: ");
    yylex();
    return 0;
}
int yywrap() {
    return 1;
}