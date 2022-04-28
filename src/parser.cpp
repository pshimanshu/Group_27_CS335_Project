#include <assert.h>
#include <string>
#include <sstream>
#include <iostream>

#include <scanner.h>
#include <y.tab.h>


extern FILE *yyin;
extern FILE *yyout;
extern int yyparse();

GraphNode* root = NULL;
TOKEN_DATA token_data;


int main(int argc, char *argv[]) {
	FILE *fh;
	if (argc != 2){
		std::cout << "Incorrect usage. Usage : ./bin/parser <file>.c\n";
	}
	if ((fh = fopen(argv[1], "r"))){
		yyin = fh;
	}
	else{
		std::cout << "Input file does not exist!\n";
		exit(0);
	}
	int abc = yyparse();
	if (abc==0)	std::cout << "No syntax errors detected.\n";
	return 0;
}
