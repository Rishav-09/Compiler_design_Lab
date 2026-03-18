%{
#include<stdio.h>
%}

%%
(a|b)*ab {printf("string accepted! \n");}
.|\n {printf("string rejected! \n");}
%%

int main(){
    printf("enter the string: ");
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}