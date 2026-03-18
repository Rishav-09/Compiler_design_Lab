%{
    #include<stdio.h>
%}

%%
[0-9]+ {printf("This is an integer number: \n");}
[0-9]*.[0-9]+ {printf("This is an float number: \n");}
.* {printf("This is an not a valid number : \n");}
%%
int main()
{
    printf("Enter Number: ");
    yylex();
    return 0;
}
int yywrap()
{
    return 1;
}
