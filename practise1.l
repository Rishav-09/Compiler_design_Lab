%{
    #include<stdio.h>
    int lp=0,ft=0,num=0,rp=0,lcp=0,rcp=0,pu=0;
%}

%%
["("] {lp++;}
[")"] {rp++;}
["{"] {lcp++;}
["}"] {rcp++;}
[0-9]*[.][0-9]+ {ft++;}
[0-9]+ {num++;}
[";."] {pu++;}
%%
int main()
{
    printf("Enter Number: ");
    yylex();
    printf("Number of left paranthesis are: %d \n",lp);
    printf("Number of Right paranthesis are: %d \n",rp);
    printf("Number of Left curly bracket  are: %d \n",lcp);
    printf("Number of Right curly bracket are: %d \n",rcp);
    printf("Number of integer are: %d \n",num);
    printf("Number of float  are: %d \n",ft);
    printf("Number of punctuation are: %d \n",pu);
    return 0;
}
int yywrap()
{
    return 1;
}