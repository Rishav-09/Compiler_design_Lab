%{
    #include<stdio.h>
%}
%S A B C DEAD
%%
<INITIAL>[ab] BEGIN A;
<INITIAL>[^ab\n] BEGIN DEAD;
<INITIAL>\n BEGIN INITIAL;  {printf("Empty String..\n");}

<A>[ab] BEGIN B;
<A>[^ab\n] BEGIN DEAD;
<A>\n BEGIN INITIAL;  {printf("Rejected\n");}

<B>[ab] BEGIN C;
<B>[^ab\n] BEGIN DEAD;
<B>\n BEGIN INITIAL;  {printf("Rejected\n");}

<C>[ab] BEGIN C;
<C>[^ab\n] BEGIN DEAD;
<C>\n BEGIN INITIAL;  {printf("Accepted\n");}

<DEAD>[ab] BEGIN DEAD;
<DEAD>[^ab\n] BEGIN DEAD;
<DEAD>\n BEGIN INITIAL;  {printf("invalid\n");}
%%
int main()
{
    printf("enter the string:");
    yylex();
    return 0;
}
int yywrap()
{
    return 1;
}