D			[0-9]
L			[a-zA-Z_]
H			[a-fA-F0-9]
E			[Ee][+-]?{D}+
FS			(f|F|l|L)
IS			(u|U|l|L)*


%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <vector>
#include <iostream>
#include <iomanip>

using namespace std;

#include "scanner.h"
#include "y.tab.h"
#include "ast.h"
// #include "parser.hpp"

void count();
int check_type();
void comment();
void single_line_comment();
int error_handler();
extern "C" int yywrap();
extern "C" int yylex();


int column_num = 1;
int line_num = 1;
extern TOKEN_DATA token_data;

%}



%%


"//"					{ single_line_comment(); }
"/*"					{ comment(); }


<<EOF>> 				{ count();  return (-1); }

"auto"                  { count(); return(AUTO); }
"break"                 { count(); return(BREAK); }	
"case"                  { count(); return(CASE); }	
"char"                  { count(); return(CHAR); }
"const"                 { count(); return(CONST); }
"continue"              { count(); return(CONTINUE); }
"default"               { count(); return(DEFAULT); }
"do"                    { count(); return(DO); }
"double"                { count(); return(DOUBLE); }	
"else"                  { count(); return(ELSE); }	
"enum"                  { count(); return(ENUM); }	
"extern"                { count(); return(EXTERN); }	
"float"                 { count(); return(FLOAT); }	
"for"                   { count(); return(FOR); }	
"goto"                  { count(); return(GOTO); }	
"if"                    { count(); return(IF); }
"int"                   { count(); return(INT); }	
"long"                  { count(); return(LONG); }	
"register"              { count(); return(REGISTER); }	
"return"                { count(); return(RETURN); }	
"short"                 { count(); return(SHORT); }	
"signed"                { count(); return(SIGNED); }	
"sizeof"                { count(); return(SIZEOF); }	
"static"                { count(); return(STATIC); }
"struct"                { count(); return(STRUCT); }	
"switch"                { count(); return(SWITCH); }	
"typedef"               { count(); return(TYPEDEF); }	
"union"                 { count(); return(UNION); }	
"unsigned"              { count(); return(UNSIGNED); }	
"void"                  { count(); return(VOID); }	
"while"                 { count(); return(WHILE); }
"namespace"             { count(); return(NAMESPACE); }
"bool"                  { count(); return(BOOL); }	
"false"                 { count(); return(FALSE); } 	
"catch"                 { count(); return(CATCH); }
"operator"              { count(); return(OPERATOR); }	
"private"               { count(); return(PRIVATE); }	
"class"                 { count(); return(CLASS); }
"this"                  { count(); return(THIS); }	
"public"                { count(); return(PUBLIC); }	
"throw"                 { count(); return(THROW); }	
"delete"                { count(); return(DELETE); }	
"protected"             { count(); return(PROTECTED); }	
"true"                  { count(); return(TRUE); }	
"try"                   { count(); return(TRY); }
"typeid"                { count(); return(TYPEID); }	
"typename"              { count(); return(TYPENAME); }	
"using"                 { count(); return(USING); } 	
 
"vector"                { count(); return(VECTOR); }
"string"                { count(); return(STRING); }





"/*"([^*]|(\*+[^*/]))*\*+\/		{ count(); }

"//"[^\n]*      				{ /* consume //-comment */ }




{L}({L}|{D})*			{ count(); return(check_type()); }

0[xX]{H}+{IS}?			{ count(); return(CONSTANT); }
0{D}+{IS}?				{ count(); return(CONSTANT); }
{D}+{IS}?				{ count(); return(CONSTANT); }
L?'(\\.|[^\\'])+'		{ count(); return(CONSTANT); }

{D}+{E}{FS}?		 	{ count(); return(CONSTANT); }
{D}*"."{D}+({E})?{FS}?	{ count(); return(CONSTANT); }
{D}+"."{D}*({E})?{FS}?	{ count(); return(CONSTANT); }

L?\"(\\.|[^\\"])*\"		{ count(); return(STRING_LITERAL); }

"..."					{ count(); return(ELLIPSIS); }
">>="					{ count(); return(RIGHT_ASSIGN); }
"<<="					{ count(); return(LEFT_ASSIGN); }
"+="					{ count(); return(ADD_ASSIGN); }
"-="					{ count(); return(SUB_ASSIGN); }
"*="					{ count(); return(MUL_ASSIGN); }
"/="					{ count(); return(DIV_ASSIGN); }
"%="					{ count(); return(MOD_ASSIGN); }
"&="					{ count(); return(AND_ASSIGN); }
"^="					{ count(); return(XOR_ASSIGN); }
"|="					{ count(); return(OR_ASSIGN); }
">>"					{ count(); return(RIGHT_OP); }
"<<"					{ count(); return(LEFT_OP); }
"++"					{ count(); return(INC_OP); }
"--"					{ count(); return(DEC_OP); }
"->"					{ count(); return(PTR_OP); }
"&&"					{ count(); return(AND_OP); }
"||"					{ count(); return(OR_OP); }
"<="					{ count(); return(LE_OP); }
">="					{ count(); return(GE_OP); }
"=="					{ count(); return(EQ_OP); }
"!="					{ count(); return(NE_OP); }
";"						{ count(); return(';'); }
("{"|"<%")				{ count(); return('{'); }
("}"|"%>")				{ count(); return('}'); }
","						{ count(); return(','); }
":"						{ count(); return(':'); }
"="						{ count(); return('='); }
"("						{ count(); return('('); }
")"						{ count(); return(')'); }
("["|"<:")				{ count(); return('['); }
("]"|":>")				{ count(); return(']'); }
"."						{ count(); return('.'); }
"&"						{ count(); return('&'); }
"!"						{ count(); return('!'); }
"~"						{ count(); return('~'); }
"-"						{ count(); return('-'); }
"+"						{ count(); return('+'); }
"*"						{ count(); return('*'); }
"/"						{ count(); return('/'); }
"%"						{ count(); return('%'); }
"<"						{ count(); return('<'); }
">"						{ count(); return('>'); }
"^"						{ count(); return('^'); }
"|"						{ count(); return('|'); }
"?"						{ count(); return('?'); }

[ \t\v\n\f]				{ count(); }
.						{ return error_handler(); }

%%

int yywrap()
{	exit(0);
	return(1);
}


void single_line_comment(){
	char ch;
	while ((ch = yyinput()) != '\n' && ch != 0);
	column_num = 1;
	line_num++;
}	



void comment(){
	char c, c1;
	column_num+=2;
loop:
	while ((c = yyinput()) != '*' && c!=0){
        if (c == '\n'){
			column_num = 0;
			line_num++;
		}
		else if (c == '\t')
			column_num += 8 - (column_num % 8);
		else
			column_num++;
	}
	if ((c1 = yyinput())!= '/' && c != 0){
        unput(c1);
		goto loop;
	}
	column_num+=2;
	/* if (c != 0)	
		putchar(c1); */
}


int check_type()
{
/*
	pseudo code --- this is what it should check
	if (yytext == type_name)
		return(TYPE_NAME);
	return(IDENTIFIER);
	it actually will only return IDENTIFIER
*/
	return(IDENTIFIER);
}



void count()
{
	token_data.column_num = column_num;
	token_data.line_num = line_num;
	token_data.lexeme = strdup(yytext);

	

	for (int i = 0; yytext[i] != '\0'; i++) {
		if (yytext[i] == '\n'){
			column_num = 1;
			line_num++;
		}
		else if (yytext[i] == '\t')
			column_num += 8 - (column_num % 8);
		else
			column_num++;
	}
}


void yyerror(char *s) {
	cout << "ERROR " << s << "\n";
}

int error_handler(){
	cout << "INVALID TOKEN";
	return -5;
}