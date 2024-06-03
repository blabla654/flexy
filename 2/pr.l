%{
#include<stdio.h> 
#include<string.h> 
struct symtab{
    char *name;
};
struct symtab sym[10],*k;
struct symtab *input_id(char *s);
void disp();
%}
letter [a-zA-z] 
digit [0-9]
identifier {letter}({letter}|{digit})*
number {digit}+(\.{digit}+)?([eE][-+]?{digit}+)? 
keyword "print"|"input"|"if"|"else"|"for"|"while"|"not"|"in"|"int"|"string"|"bool"|"break"|"class"|"continue"|" def"|"pass"|"elif"|"try"|"except"|"raise"|"True"|"False"|"finally"|"import"|"from"|"is"|"return"|"with  "
aop "+"|"-"|"*"|"/"|"%"|"**"|"//"
comop "<"|">"|">="|"<="|"=="|"!=" logop "and"|"or"|"not"
assignop "="|"+="|"-="|"/="|"*="|"%="|"**="|"//="
punc [,;:'"\[\]\(\)\{\}] comment "#"(.)* whitespace [ \t\n] string \"(.)*\"|\'(.)*\'
%%
{keyword} {printf("keyword: %s\n",yytext);}
{logop} {printf("logical operator: %s\n",yytext);} 
{identifier} {k=input_id(yytext);printf("identifier: %s\n",yytext);}
{number} {printf("Number: %s",yytext);}
{aop} {printf("Arithmetic operator: %s\n",yytext);}
{comop} {printf("Relational operator: %s\n",yytext);}
{assignop} {printf("Assignment operator: %s\n",yytext);}
{punc} {printf("punctuation: %s\n",yytext);}
{comment} {printf("comment: %s\n",yytext);}
{string} {printf("string: %s\n",yytext);}
%%

void main(){
    yyin = fopen("as2.py","r"); 
    yylex();
    disp();
}

struct symtab *input_id(char *s){
    struct symtab *p;
    for(p=&sym[0];p<&sym[10];p++){
        if(p->name && !strcmp(s,p->name)) 
            return p;
        if(!p->name){
            p->name = strdup(s);
            return p;
        }
    }
}

void disp(){
    printf("\n\t\tSymbol table\n");
    printf("");
    struct symtab *p;
    for(p=&sym[0];p<&sym[10];p++){
        if(p->name){
            printf("%s\n",p->name);
        }
    }
}

int yywrap(){
    return 1;
}
