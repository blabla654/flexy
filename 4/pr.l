%{
#include<stdio.h>
#include "y.tab.h"
%}
L [a-zA-Z]
D [0-9]
id {L}({L}|{D})*
str \"(.)*\"|\'(.)*\'
bool "True"|"False"
float {D}+"."{D}+
%%
{D}+ {return Inum;}
{str}+ {return Istring;}
{bool} {return Ibool;}
{float} {return Ifloat;}
{id} {return ID;}
[:,=\[\]\(\)\{\}] {return yytext[0];}
[ \t\n] {}
%%
int yywrap(){
    return 1;
}
int yyerror(char *msg){
    printf("%s", msg);
}