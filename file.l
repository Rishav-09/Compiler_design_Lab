%{
    #include <stdio.h>
    int chars = 0;
    int words = 0;
    int spaces = 0;
%}

%%
[a-zA-Z]+      { words++; chars += yyleng; }
[ ]            { spaces++; chars++; }
\n             { chars++; }
.              { chars++; }
%%

int yywrap()
{
    return 1;
}

int main()
{
    yyin = fopen("input.txt", "r");
    if (yyin==NULL)
    {
        printf("Cannot open input file\n");
        return 1;
    }
    yylex();

    printf("The number of total characters in the given input file is: %d\n", chars);
    printf("The number of total words in the given input file is: %d\n", words);
    printf("The number of total white spaces in the given input file is: %d\n", spaces);

    fclose(yyin);
    return 0;
}
