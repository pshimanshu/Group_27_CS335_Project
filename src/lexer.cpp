#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <cassert>
#include <vector>
#include <iostream>
#include <iomanip>


using namespace std;

#include "scanner.h"
#include "y.tab.h"
// #include "AST.h"
// #include "parser.hpp"


extern "C" int yylex();

extern FILE *yyin;
extern char *yytext;


using namespace std;

TOKEN_DATA token_data;

void token_to_string(int token_type, char *str) {
  switch (token_type) {
  case AUTO:
    sprintf(str, "AUTO");
    break;
  case BREAK:
    sprintf(str, "BREAK");
    break;
  case CASE:
    sprintf(str, "CASE");
    break;
  case CHAR:
    sprintf(str, "CHAR");
    break;
  case CONST:
    sprintf(str, "CONST");
    break;
  case CONTINUE:
    sprintf(str, "CONTINUE");
    break;
  case DEFAULT:
    sprintf(str, "DEFAULT");
    break;
  case DO:
    sprintf(str, "DO");
    break;
  case DOUBLE:
    sprintf(str, "DOUBLE");
    break;
  case ELSE:
    sprintf(str, "ELSE");
    break;
  case ENUM:
    sprintf(str, "ENUM");
    break;
  case EXTERN:
    sprintf(str, "EXTERN");
    break;
  case FLOAT:
    sprintf(str, "FLOAT");
    break;
  case FOR:
    sprintf(str, "FOR");
    break;
  case GOTO:
    sprintf(str, "GOTO");
    break;
  case IF:
    sprintf(str, "IF");
    break;
  case INT:
    sprintf(str, "INT");
    break;
  case LONG:
    sprintf(str, "LONG");
    break;
  case REGISTER:
    sprintf(str, "REGISTER");
    break;
  case RETURN:
    sprintf(str, "RETURN");
    break;
  case SHORT:
    sprintf(str, "SHORT");
    break;
  case SIGNED:
    sprintf(str, "SIGNED");
    break;
  case SIZEOF:
    sprintf(str, "SIZEOF");
    break;
  case STATIC:
    sprintf(str, "STATIC");
    break;
  case STRUCT:
    sprintf(str, "STRUCT");
    break;
  case SWITCH:
    sprintf(str, "SWITCH");
    break;
  case TYPEDEF:
    sprintf(str, "TYPEDEF");
    break;
  case UNION:
    sprintf(str, "UNION");
    break;
  case UNSIGNED:
    sprintf(str, "UNSIGNED");
    break;
  case VOID:
    sprintf(str, "VOID");
    break;
  case WHILE:
    sprintf(str, "WHILE");
    break;
  case NAMESPACE:
    sprintf(str, "NAMESPACE");
    break;
  case BOOL:
    sprintf(str, "BOOL");
    break;
  case CATCH:
    sprintf(str, "CATCH");
    break;
  case OPERATOR:
    sprintf(str, "OPERATOR");
    break;
  case PRIVATE:
    sprintf(str, "PRIVATE");
    break;
  case CLASS:
    sprintf(str, "CLASS");
    break;
  case THIS:
    sprintf(str, "THIS");
    break;
  case PUBLIC:
    sprintf(str, "PUBLIC");
    break;
  case THROW:
    sprintf(str, "THROW");
    break;
  case DELETE:
    sprintf(str, "DELETE");
    break;
  case PROTECTED:
    sprintf(str, "PROTECTED");
    break;
  case TRY:
    sprintf(str, "TRY");
    break;
  case TYPENAME:
    sprintf(str, "TYPENAME");
    break;
  case USING:
    sprintf(str, "USING");
    break;
  case IDENTIFIER:
    sprintf(str, "IDENTIFIER");
    break;
  case CONSTANT:
    sprintf(str, "CONSTANT");
    break;
  case STRING_LITERAL:
    sprintf(str, "STRING_LITERAL");
    break;
  case ELLIPSIS:
    sprintf(str, "ELLIPSIS");
    break;
  case RIGHT_ASSIGN:
    sprintf(str, "RIGHT_ASSIGN");
    break;
  case LEFT_ASSIGN:
    sprintf(str, "LEFT_ASSIGN");
    break;
  case ADD_ASSIGN:
    sprintf(str, "ADD_ASSIGN");
    break;
  case SUB_ASSIGN:
    sprintf(str, "SUB_ASSIGN");
    break;
  case MUL_ASSIGN:
    sprintf(str, "MUL_ASSIGN");
    break;
  case DIV_ASSIGN:
    sprintf(str, "DIV_ASSIGN");
    break;
  case MOD_ASSIGN:
    sprintf(str, "MOD_ASSIGN");
    break;
  case AND_ASSIGN:
    sprintf(str, "AND_ASSIGN");
    break;
  case XOR_ASSIGN:
    sprintf(str, "XOR_ASSIGN");
    break;
  case OR_ASSIGN:
    sprintf(str, "OR_ASSIGN");
    break;
  case RIGHT_OP:
    sprintf(str, "RIGHT_OP");
    break;
  case LEFT_OP:
    sprintf(str, "LEFT_OP");
    break;
  case INC_OP:
    sprintf(str, "INC_OP");
    break;
  case DEC_OP:
    sprintf(str, "DEC_OP");
    break;
  case PTR_OP:
    sprintf(str, "PTR_OP");
    break;
  case AND_OP:
    sprintf(str, "AND_OP");
    break;
  case OR_OP:
    sprintf(str, "OR_OP");
    break;
  case LE_OP:
    sprintf(str, "LE_OP");
    break;
  case GE_OP:
    sprintf(str, "GE_OP");
    break;
  case EQ_OP:
    sprintf(str, "EQ_OP");
    break;
  case NE_OP:
    sprintf(str, "NE_OP");
    break;
  case ';':
    sprintf(str, ";");
    break;
  case '{':
    sprintf(str, "{");
    break;
  case '}':
    sprintf(str, "}");
    break;
  case ',':
    sprintf(str, ",");
    break;
  case ':':
    sprintf(str, ":");
    break;
  case '=':
    sprintf(str, "=");
    break;
  case '(':
    sprintf(str, "(");
    break;
  case ')':
    sprintf(str, ")");
    break;
  case '[':
    sprintf(str, "[");
    break;
  case ']':
    sprintf(str, "]");
    break;
  case '.':
    sprintf(str, ".");
    break;
  case '&':
    sprintf(str, "&");
    break;
  case '!':
    sprintf(str, "!");
    break;
  case '~':
    sprintf(str, "~");
    break;
  case '-':
    sprintf(str, "-");
    break;
  case '+':
    sprintf(str, "+");
    break;
  case '*':
    sprintf(str, "*");
    break;
  case '/':
    sprintf(str, "/");
    break;
  case '%':
    sprintf(str, "%%");
    break;
  case '<':
    sprintf(str, "<");
    break;
  case '>':
    sprintf(str, ">");
    break;
  case '^':
    sprintf(str, "^");
    break;
  case '|':
    sprintf(str, "|");
    break;
  case '?':
    sprintf(str, "?");
    break;
  default:
    printf("NO TOKEN %d\n", token_type);
    assert(0);
    break;
  }
  return;
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
	// int token_type;
    // while(1){
    //     int token_type = yylex();
        
    //     char token_str[64];
    //     token_to_string(token_type, token_str);
    //     printf("%-9d %-9d %-19s %s\n", token_data.line_num, token_data.column_num,
    //         token_str, token_data.lexeme);
    //     free(token_data.lexeme)
    // }
    int val;
   	while ( (val = yylex()) != -1 ) {
        char token_str[64];
        token_to_string(val, token_str);
		cout << setw(15) <<  token_str << setw(12)  << token_data.lexeme << setw(8) <<  token_data.line_num <<  setw(8) <<  token_data.column_num << "\n";
		
   	}
}
