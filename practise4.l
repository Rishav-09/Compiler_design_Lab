%{
#include <stdio.h>
char first, last;
%}

%S A B C DEAD

%%

<INITIAL>a { first='a'; last='a'; BEGIN A; }
<INITIAL>b { first='b'; last='b'; BEGIN B; }
<INITIAL>c { first='c'; last='c'; BEGIN C; }

<INITIAL>[^abc\n] { BEGIN DEAD; printf("Invalid string\n"); }

<INITIAL>\n { BEGIN INITIAL; printf("Empty String..\n"); }

<A>a { last='a'; BEGIN A; }
<A>b { last='b'; BEGIN A; }
<A>c { last='c'; BEGIN A; }

<A>\n { 
    BEGIN INITIAL;
    if(first!=last) printf("Accepted\n");
    else printf("Rejected\n");
}

<A>[^abc\n] { BEGIN DEAD; printf("Invalid string\n"); }

<B>a { last='a'; BEGIN B; }
<B>b { last='b'; BEGIN B; }
<B>c { last='c'; BEGIN B; }

<B>\n { 
    BEGIN INITIAL;
    if(first!=last) printf("Accepted\n");
    else printf("Rejected\n");
}

<B>[^abc\n] { BEGIN DEAD; printf("Invalid string\n"); }

<C>a { last='a'; BEGIN C; }
<C>b { last='b'; BEGIN C; }
<C>c { last='c'; BEGIN C; }

<C>\n { 
    BEGIN INITIAL;
    if(first!=last) printf("Accepted\n");
    else printf("Rejected\n");
}

<C>[^abc\n] { BEGIN DEAD; printf("Invalid string\n"); }

<DEAD>[^\n] { BEGIN DEAD; }
<DEAD>\n { BEGIN INITIAL; printf("Invalid string\n"); }

%%

int main()
{
    printf("Enter the string: ");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}