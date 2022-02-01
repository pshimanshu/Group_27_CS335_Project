
%{

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <vector>
#include <iostream>
#include <fstream>
#include <iomanip>

using namespace std;


void yyerror(char *s);
void count();
void comment();
void single_line_comment();

extern FILE *yyin;
extern char *yytext;
extern int yylex(void);


enum TokenType {
	KEYWORD, IDENTIFIER, NUM_LITERAL, CHAR_LITERAL, STRING_LITERAL, PTR_LITERAL, OPERATOR, PUNCTUATOR
};
vector<string> token_names = {"KEYWORD", "IDENTIFIER", "NUM_LITERAL", "CHAR_LITERAL", "STRING_LITERAL", "PTR_LITERAL", "OPERATOR", "PUNCTUATOR"};


%}


D			[0-9]
L			[a-zA-Z_]
H			[a-fA-F0-9]
E			[Ee][+-]?{D}+
FS			(f|F|l|L)
IS			(u|U|l|L)*





%%
"/*"			{ comment(); }
"//"			{single_line_comment(); }


"exit" 			{ count(); // yylval.str=strdup(yytext);
					return(-1);}
<<EOF>> 		{count(); // yylval.str=strdup(yytext);
					return (-1);}

"auto" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}
"break" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"case" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"char" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"const" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"continue" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"default" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"do" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}
"double" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"else" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"enum" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"extern" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"float" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"for" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"goto" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"if" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}
"int" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"long" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"register" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"return" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"short" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"signed" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"sizeof" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"static" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}
"struct" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"switch" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"typedef" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"union" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"unsigned" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"void" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"while" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}
"namespace" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}
"bool" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"false" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"catch" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}
"operator" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"private" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"class" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}
"this" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"public" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"throw" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"delete" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"protected" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"true" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"try" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}
"typeid" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"typename" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"using" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	

"vector" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}
"string" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}



{L}({L}|{D})*	{ count();// yylval.str=strdup(yytext);
					return(IDENTIFIER); }


0[xX]{H}+{IS}?	{ count(); // yylval.str=strdup(yytext);  
					return(NUM_LITERAL); }
0{D}+{IS}?		{ count(); // yylval.str=strdup(yytext);  
					return(NUM_LITERAL); }
{D}+{IS}?		{ count(); // yylval.str=strdup(yytext);
                    return(NUM_LITERAL); }
L?'(\\.|[^\\'])+'	{ count(); // yylval.str=strdup(yytext); 
					   return(NUM_LITERAL); }

{D}+{E}{FS}?			{ count(); // yylval.str=strdup(yytext); 
							return(NUM_LITERAL); }
{D}*"."{D}+({E})?{FS}?	{ count();// yylval.str=strdup(yytext); 
                    		return(NUM_LITERAL); }
{D}+"."{D}*({E})?{FS}?	{ count();// yylval.str=strdup(yytext); 
                     		return(NUM_LITERAL); }
							 


L?\"(\\.|[^\\"])*\"	{ count(); // yylval.str=strdup(yytext); 
                    return(STRING_LITERAL); }

[ \t\v\n\f\0\b]		{ count(); }



"..."			{ count(); // yylval.str=strdup(yytext); 
                    return(OPERATOR);}
">>="			{ count(); // yylval.str=strdup(yytext);   
                    return(OPERATOR);}
"<<="			{ count(); // yylval.str=strdup(yytext); 
                    return(OPERATOR);}
"+="			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"-="			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"*="			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"/="			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"%="			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"&="			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"^="			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"|="			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
">>"			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"<<"			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"++"			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"--"			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"->"			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"&&"			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"||"			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"<="			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR); }
">="			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"=="			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"!="			{ count(); // yylval.str=strdup(yytext); 
					return(OPERATOR); }


"!"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"%"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"^"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"&"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"*"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"("         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);}    
")"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"-"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"+"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"="         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"{"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);}    
"}"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"|"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"~"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"["         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"]"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"\\"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
";"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"'"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
":"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"\""         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"<"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
">"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);}
"?"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
","         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);}
"."         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);}
"/"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);}
"#"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);}



.			{ count(); return yytext[0]; }

%%


int yywrap()
{
	return(1);
}

int column = 0;
int line=1;


void comment(){
	char c, c1;
	column+=2;
	int i=0;
loop:
	while ((c = yytext[i]) != '*' && c!=0){
        if (c == '\n')
			column = 0,line++;
		else if (c == '\t')
			column += 8 - (column % 8);
		else
			column++;
		i++;
	}
	if ((c = yytext[i])!= '/' && c != 0){
		goto loop;
	}
	column+=2;

	/* if (c != 0)
		putchar(c1);  */
}


void single_line_comment(){
	char c;
	int i= 0;
	while ((c = yytext[i]) != '\n' && c != 0) {i++;} 
	column=0;
	line++;
}	



int col_start = 0;
void count(){
	int i;
	col_start = column+1;
	for (i = 0; yytext[i] != '\0'; i++){	
		if (yytext[i] == '\n')
			column = 0,line++;
		else if (yytext[i] == '\t')
			column += 8 - (column % 8);
		else
			column++;
	}
}


void yyerror(char *s) {
	cout << "ERROR " << s << "\n";
}



int main(int argc, char **argv){

	cout << "Using C++\n";
	if(argc>1){
		FILE *file;
		file=fopen(argv[1],"r");
		if(!file){
			cout << "\n Couldn't open file: " << argv[1];
			exit(0);
		}
		yyin=file;
	}
    cout << setw(15) << "TOKEN" << setw(12) << "LEXEME" <<  setw(8) << "LINE#" << setw(8) << "COLUMN#" << endl;
	int val;
   	while ( (val = yylex()) != -1 ) {
		cout << setw(15) <<  token_names[val] << setw(12)  << yytext << setw(8) <<  line <<  setw(8) <<  column-yyleng+1 << "\n";
		
   	}
}



%{

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <vector>
#include <iostream>
#include <fstream>
#include <iomanip>

using namespace std;


void yyerror(char *s);
void count();
void comment();
void single_line_comment();

extern FILE *yyin;
extern char *yytext;
extern int yylex(void);


enum TokenType {
	KEYWORD, IDENTIFIER, NUM_LITERAL, CHAR_LITERAL, STRING_LITERAL, PTR_LITERAL, OPERATOR, PUNCTUATOR
};
vector<string> token_names = {"KEYWORD", "IDENTIFIER", "NUM_LITERAL", "CHAR_LITERAL", "STRING_LITERAL", "PTR_LITERAL", "OPERATOR", "PUNCTUATOR"};


%}


D			[0-9]
L			[a-zA-Z_]
H			[a-fA-F0-9]
E			[Ee][+-]?{D}+
FS			(f|F|l|L)
IS			(u|U|l|L)*





%%
"/*"			{ comment(); }
"//"			{single_line_comment(); }


"exit" 			{ count(); // yylval.str=strdup(yytext);
					return(-1);}
<<EOF>> 		{count(); // yylval.str=strdup(yytext);
					return (-1);}

"auto" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}
"break" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"case" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"char" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"const" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"continue" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"default" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"do" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}
"double" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"else" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"enum" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"extern" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"float" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"for" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"goto" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"if" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}
"int" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"long" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"register" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"return" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"short" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"signed" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"sizeof" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"static" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}
"struct" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"switch" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"typedef" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"union" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"unsigned" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"void" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"while" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}
"namespace" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}
"bool" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"false" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"catch" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}
"operator" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"private" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"class" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}
"this" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"public" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"throw" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"delete" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"protected" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"true" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"try" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}
"typeid" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"typename" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"using" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	

"vector" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}
"string" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}



{L}({L}|{D})*	{ count();// yylval.str=strdup(yytext);
					return(IDENTIFIER); }


0[xX]{H}+{IS}?	{ count(); // yylval.str=strdup(yytext);  
					return(NUM_LITERAL); }
0{D}+{IS}?		{ count(); // yylval.str=strdup(yytext);  
					return(NUM_LITERAL); }
{D}+{IS}?		{ count(); // yylval.str=strdup(yytext);
                    return(NUM_LITERAL); }
L?'(\\.|[^\\'])+'	{ count(); // yylval.str=strdup(yytext); 
					   return(NUM_LITERAL); }

{D}+{E}{FS}?			{ count(); // yylval.str=strdup(yytext); 
							return(NUM_LITERAL); }
{D}*"."{D}+({E})?{FS}?	{ count();// yylval.str=strdup(yytext); 
                    		return(NUM_LITERAL); }
{D}+"."{D}*({E})?{FS}?	{ count();// yylval.str=strdup(yytext); 
                     		return(NUM_LITERAL); }
							 


L?\"(\\.|[^\\"])*\"	{ count(); // yylval.str=strdup(yytext); 
                    return(STRING_LITERAL); }

[ \t\v\n\f\0\b]		{ count(); }



"..."			{ count(); // yylval.str=strdup(yytext); 
                    return(OPERATOR);}
">>="			{ count(); // yylval.str=strdup(yytext);   
                    return(OPERATOR);}
"<<="			{ count(); // yylval.str=strdup(yytext); 
                    return(OPERATOR);}
"+="			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"-="			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"*="			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"/="			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"%="			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"&="			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"^="			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"|="			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
">>"			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"<<"			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"++"			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"--"			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"->"			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"&&"			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"||"			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"<="			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR); }
">="			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"=="			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"!="			{ count(); // yylval.str=strdup(yytext); 
					return(OPERATOR); }


"!"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"%"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"^"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"&"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"*"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"("         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);}    
")"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"-"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"+"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"="         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"{"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);}    
"}"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"|"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"~"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"["         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"]"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"\\"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
";"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"'"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
":"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"\""         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"<"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
">"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);}
"?"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
","         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);}
"."         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);}
"/"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);}
"#"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);}



.			{ count(); return yytext[0]; }

%%


int yywrap()
{
	return(1);
}

int column = 0;
int line=1;


void comment(){
	char c, c1;
	column+=2;
	int i=0;
loop:
	while ((c = yytext[i]) != '*' && c!=0){
        if (c == '\n')
			column = 0,line++;
		else if (c == '\t')
			column += 8 - (column % 8);
		else
			column++;
		i++;
	}
	if ((c = yytext[i])!= '/' && c != 0){
		goto loop;
	}
	column+=2;

	/* if (c != 0)
		putchar(c1);  */
}


void single_line_comment(){
	char c;
	int i= 0;
	while ((c = yytext[i]) != '\n' && c != 0) {i++;} 
	column=0;
	line++;
}	



int col_start = 0;
void count(){
	int i;
	col_start = column+1;
	for (i = 0; yytext[i] != '\0'; i++){	
		if (yytext[i] == '\n')
			column = 0,line++;
		else if (yytext[i] == '\t')
			column += 8 - (column % 8);
		else
			column++;
	}
}


void yyerror(char *s) {
	cout << "ERROR " << s << "\n";
}



int main(int argc, char **argv){

	cout << "Using C++\n";
	if(argc>1){
		FILE *file;
		file=fopen(argv[1],"r");
		if(!file){
			cout << "\n Couldn't open file: " << argv[1];
			exit(0);
		}
		yyin=file;
	}
    cout << setw(15) << "TOKEN" << setw(12) << "LEXEME" <<  setw(8) << "LINE#" << setw(8) << "COLUMN#" << endl;
	int val;
   	while ( (val = yylex()) != -1 ) {
		cout << setw(15) <<  token_names[val] << setw(12)  << yytext << setw(8) <<  line <<  setw(8) <<  column-yyleng+1 << "\n";
		
   	}
}



%{

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <vector>
#include <iostream>
#include <fstream>
#include <iomanip>

using namespace std;


void yyerror(char *s);
void count();
void comment();
void single_line_comment();

extern FILE *yyin;
extern char *yytext;
extern int yylex(void);


enum TokenType {
	KEYWORD, IDENTIFIER, NUM_LITERAL, CHAR_LITERAL, STRING_LITERAL, PTR_LITERAL, OPERATOR, PUNCTUATOR
};
vector<string> token_names = {"KEYWORD", "IDENTIFIER", "NUM_LITERAL", "CHAR_LITERAL", "STRING_LITERAL", "PTR_LITERAL", "OPERATOR", "PUNCTUATOR"};


%}


D			[0-9]
L			[a-zA-Z_]
H			[a-fA-F0-9]
E			[Ee][+-]?{D}+
FS			(f|F|l|L)
IS			(u|U|l|L)*





%%
"/*"			{ comment(); }
"//"			{single_line_comment(); }


"exit" 			{ count(); // yylval.str=strdup(yytext);
					return(-1);}
<<EOF>> 		{count(); // yylval.str=strdup(yytext);
					return (-1);}

"auto" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}
"break" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"case" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"char" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"const" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"continue" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"default" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"do" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}
"double" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"else" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"enum" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"extern" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"float" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"for" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"goto" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"if" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}
"int" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"long" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"register" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"return" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"short" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"signed" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"sizeof" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"static" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}
"struct" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"switch" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"typedef" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"union" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"unsigned" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"void" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"while" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}
"namespace" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}
"bool" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"false" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"catch" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}
"operator" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"private" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"class" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}
"this" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"public" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"throw" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"delete" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"protected" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"true" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"try" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}
"typeid" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"typename" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	
"using" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}	

"vector" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}
"string" { count(); // yylval.str=strdup(yytext);
    return(KEYWORD);}



{L}({L}|{D})*	{ count();// yylval.str=strdup(yytext);
					return(IDENTIFIER); }


0[xX]{H}+{IS}?	{ count(); // yylval.str=strdup(yytext);  
					return(NUM_LITERAL); }
0{D}+{IS}?		{ count(); // yylval.str=strdup(yytext);  
					return(NUM_LITERAL); }
{D}+{IS}?		{ count(); // yylval.str=strdup(yytext);
                    return(NUM_LITERAL); }
L?'(\\.|[^\\'])+'	{ count(); // yylval.str=strdup(yytext); 
					   return(NUM_LITERAL); }

{D}+{E}{FS}?			{ count(); // yylval.str=strdup(yytext); 
							return(NUM_LITERAL); }
{D}*"."{D}+({E})?{FS}?	{ count();// yylval.str=strdup(yytext); 
                    		return(NUM_LITERAL); }
{D}+"."{D}*({E})?{FS}?	{ count();// yylval.str=strdup(yytext); 
                     		return(NUM_LITERAL); }
							 


L?\"(\\.|[^\\"])*\"	{ count(); // yylval.str=strdup(yytext); 
                    return(STRING_LITERAL); }

[ \t\v\n\f\0\b]		{ count(); }



"..."			{ count(); // yylval.str=strdup(yytext); 
                    return(OPERATOR);}
">>="			{ count(); // yylval.str=strdup(yytext);   
                    return(OPERATOR);}
"<<="			{ count(); // yylval.str=strdup(yytext); 
                    return(OPERATOR);}
"+="			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"-="			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"*="			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"/="			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"%="			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"&="			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"^="			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"|="			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
">>"			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"<<"			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"++"			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"--"			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"->"			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"&&"			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"||"			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"<="			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR); }
">="			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"=="			{ count(); // yylval.str=strdup(yytext);  
					return(OPERATOR);}
"!="			{ count(); // yylval.str=strdup(yytext); 
					return(OPERATOR); }


"!"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"%"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"^"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"&"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"*"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"("         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);}    
")"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"-"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"+"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"="         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"{"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);}    
"}"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"|"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"~"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"["         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"]"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"\\"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
";"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"'"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
":"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"\""         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
"<"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
">"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);}
"?"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);} 
","         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);}
"."         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);}
"/"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);}
"#"         { count(); // yylval.str=strdup(yytext); 
                    return(PUNCTUATOR);}



.			{ count(); return yytext[0]; }

%%


int yywrap()
{
	return(1);
}

int column = 0;
int line=1;


void comment(){
	char c, c1;
	column+=2;
	int i=0;
loop:
	while ((c = yytext[i]) != '*' && c!=0){
        if (c == '\n')
			column = 0,line++;
		else if (c == '\t')
			column += 8 - (column % 8);
		else
			column++;
		i++;
	}
	if ((c = yytext[i])!= '/' && c != 0){
		goto loop;
	}
	column+=2;

	/* if (c != 0)
		putchar(c1);  */
}


void single_line_comment(){
	char c;
	int i= 0;
	while ((c = yytext[i]) != '\n' && c != 0) {i++;} 
	column=0;
	line++;
}	



int col_start = 0;
void count(){
	int i;
	col_start = column+1;
	for (i = 0; yytext[i] != '\0'; i++){	
		if (yytext[i] == '\n')
			column = 0,line++;
		else if (yytext[i] == '\t')
			column += 8 - (column % 8);
		else
			column++;
	}
}


void yyerror(char *s) {
	cout << "ERROR " << s << "\n";
}



int main(int argc, char **argv){

	cout << "Using C++\n";
	if(argc>1){
		FILE *file;
		file=fopen(argv[1],"r");
		if(!file){
			cout << "\n Couldn't open file: " << argv[1];
			exit(0);
		}
		yyin=file;
	}
    cout << setw(15) << "TOKEN" << setw(12) << "LEXEME" <<  setw(8) << "LINE#" << setw(8) << "COLUMN#" << endl;
	int val;
   	while ( (val = yylex()) != -1 ) {
		cout << setw(15) <<  token_names[val] << setw(12)  << yytext << setw(8) <<  line <<  setw(8) <<  column-yyleng+1 << "\n";
		
   	}
}


