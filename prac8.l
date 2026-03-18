%{
#include <stdio.h>

%}

%%

\/\/.*      { }                         // ignore single-line comment
\/\*.*\*\/    { }                         // ignore multi-line comment
.|\n        { fprintf(yyout, "%s", yytext); }   // print everything else
  
%%

int main()
{
    yyin = fopen("input.txt", "r");
    yyout = fopen("output.txt", "w");

    if(yyin==NULL || yyout==NULL)
    {
        printf("File error\n");
        return 1;
    }

    yylex();

    fclose(yyin);
    fclose(yyout);
    return 0;
}

int yywrap()
{
    return 1;
}
