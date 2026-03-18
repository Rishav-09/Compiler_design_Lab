%{
    #include<stdio.h>
    int tc=0;
%}

%%
(auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while) { tc++; p   rintf("%s is a keyword\n", yytext); }
[+\-\=<>] {tc++; printf("%s is a operator\n ",yytext);}
[a-zA-Z][a-zA-Z0-9_]* {tc++; printf("%s is a identifier \n",yytext);}
[0-9]+ {tc++; printf("%s is an constant \n ",yytext);}
[,;(){}] {tc++; printf("%s is a special character \n ",yytext);}
[ ] printf("space occured \n");
%%
int main()
{
    printf("Enter input: ");
    yylex();
    printf("Number of token are %d",tc);
    return 0;
}
int yywrap()
{
    return 1;
}