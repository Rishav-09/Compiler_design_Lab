{
    #include<stdio.h>
}
%S q1 q2 q3 q4 q5 q6 dead
%%
<INITIAL> a BEGIN q1;
<INITIAL> b BEGIN q2;
<INITIAL> c BEGIN q3;
<INITIAL> \n BEGIN INITIAL; { printf("empty string\n");}
<INITIAL> [^abc\n] dead;

<q1> a BEGIN q1;
<q1> bc BEGIN q4;{ printf("accepted\n");}
<q1> \n BEGIN INITIAL;{ printf("rejected\n");}
<q1> [^\nabc] BEGIN dead;

<q2> b BEGIN q2;
<q2> ac BEGIN q5;{ printf("accepted\n");}
<q2> \n BEGIN INITIAL;{ printf("rejected\n");}
<q2> [^\nabc] BEGIN dead;

<q3> c BEGIN q3;
<q3> ab BEGIN q6;{ printf("accepted\n");}
<q3> \n BEGIN INITIAL;{ printf("rejected\n");}
<q3> [^\nabc] BEGIN dead;

<q4> bc BEGIN q4;
<q4> \n BEGIN INITIAL;{ printf("accepted\n");}
<q4> [^\nabc] BEGIN dead;

<q5> ac BEGIN q5;
<q5> \n BEGIN INITIAL;{ printf("accepted\n");}
<q5> [^\nabc] BEGIN dead;

<q6> ab BEGIN q6;
<q6> \n BEGIN INITIAL;{ printf("accepted\n");}
<q6> [^\nabc] BEGIN dead;

<dead> acb BEGIN dead;
<dead> \n BEGIN INITIAL;{ printf("invalid string\n");}
<dead> [^\nabc] BEGIN dead;
%%
int main()
{
    printf("enter the string:\n");
    yylex();
    return 0;
}
int yywrap()
{
    return 1;
}