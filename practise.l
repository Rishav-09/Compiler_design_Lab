%{
#include<stdio.h>
%}

OCTET (25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])

%%

([0-1][0-9]|12[0-6])\.{OCTET}\.{OCTET}\.{OCTET}    {printf("Class A\n");}

(12[8-9]|1[3-8][0-9]|19[0-1])\.{OCTET}\.{OCTET}\.{OCTET} {printf("Class B\n");}

(19[2-9]|2[0-1][0-9]|22[0-3])\.{OCTET}\.{OCTET}\.{OCTET} {printf("Class C\n");}

(22[4-9]|23[0-9])\.{OCTET}\.{OCTET}\.{OCTET} {printf("Class D\n");}

(24[0-9]|25[0-5])\.{OCTET}\.{OCTET}\.{OCTET} {printf("Class E\n");}

.* {printf("Invalid IP\n");}

%%

int main()
{
    printf("Enter IP: ");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}


