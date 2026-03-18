%{
    #include <stdio.h>
%}

%%
^[a-zA-Z0-9]+[\.[a-zA-Z0-9]+]*@gmail\.com$ {printf("This is a valid email: %s\n", yytext); }

.* { printf("This is NOT a valid email: %s\n", yytext); }
%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
