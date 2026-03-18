%{
    #include<stdio.h>
%}

%%
(auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while) { printf("%s is a keyword\n", yytext); }
[+\-\=<>] {printf("%s is a operator\n ",yytext);}
[a-zA-Z ][a-zA-Z0-9_]* {printf("%s is a identifier \n",yytext);}
[0-9]+ {printf("%s is an constant \n ",yytext);}
[,;(){}[]] {printf("%s is a special character \n ",yytext);}
%%
int main()
{
    printf("Enter input: ");
    yylex();
    return 0;
}
int yywrap()
{
    return 1;
}