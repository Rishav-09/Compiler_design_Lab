%{
    #include <stdio.h>
%}

%%
^[a-zA-Z_][a-zA-Z0-9_]*$   {
                                printf("This is a Valid Identifier\n");
                           }

.*                         {
                                printf("This is not a Valid Identifier\n");
                           }
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter any identifier you want to check: ");
    yylex();
    return 0;
}
