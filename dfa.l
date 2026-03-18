%{
    #include<stdio.h>
%}
%S A B DEAD
%%
<INITIAL>[a] BEGIN A;
<INITIAL>[B] BEGIN INITIAL;
<INITIAL>[^ab\n] BEGIN DEAD;
<INITIAL>[\n] BEGIN INITIAL; {printf("Empty string");}

<A>[a] BEGIN A;
<A>[b] BEGIN B;
<A>[^ab\n] BEGIN DEAD;
<A>[\n] BEGIN INITIAL; {printf("Rejected\n");}

<B>[a] BEGIN A;
<B>[b] BEGIN INITIAL;
<B>[^ab\n] BEGIN DEAD;
<B>[\n] BEGIN INITIAL; {printf("Accepted\n");}

<DEAD>[ab] BEGIN DEAD;
<DEAD>[^ab\n] BEGIN DEAD;
<DEAD>[\n] BEGIN INITIAL; { printf("Invalid\n");}

%%

int main()
{
    printf("Enter string:");
    yylex();
    return 0;
}
int yywrap()
{
    return 1;
}