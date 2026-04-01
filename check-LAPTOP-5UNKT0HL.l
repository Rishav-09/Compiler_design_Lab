%{
    #include<stdio.h>
    int t_line=0,t_space=0,t_metachar=0,t_char=0;
%}

%%
[\n] {t_line++;}
[" "] {t_space++;}
["\t"] {t_metachar++;}
[^\n" "\t] {t_char++;}
%%

int main()
{
    printf("Enter the string:\n ");
    yylex();
    printf("The total no of lines used : %d \n",t_line);
    printf("The total no of space used : %d \n",t_space);
    printf("The total no of metachar used : %d \n",t_metachar);
    printf("The total no of word used : %d \n",t_char);
    return 0;
}
int yywrap()
{
    return 1;
}