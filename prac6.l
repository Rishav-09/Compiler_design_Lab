%{
    #include <stdio.h>
    int chars = 0;
    int words = 0;
    int spaces = 0;
%}
%%
[a-zA-Z0-9]* {chars+=yyleng; words++;}
[ \t\n] {spaces++; chars++;}
%%

int main()
{
    printf("Enter string:");
    yylex();
    printf("\nNumber of char: %d\n", chars);
    printf("Number of words: %d\n", words);
    printf("Number of spaces: %d\n", spaces);
    return 0;
}

int yywrap()
{
    return 1;
}