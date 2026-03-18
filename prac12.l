%{
    #include <stdio.h>
    int vowels = 0;
    int consonants = 0;
%}

%%
[aeiouAEIOU]      { vowels++; }
[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z]  { consonants++; }
.|\n              { /* ignore other characters */ }
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter a string: ");
    yylex();

    printf("Number of vowels: %d\n", vowels);
    printf("Number of consonants: %d\n", consonants);

    return 0;
}
