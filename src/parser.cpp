#include <assert.h>
#include <string>
#include <sstream>
#include <iostream>

#include <ast.h>
#include <scanner.h>
#include <y.tab.h>


extern FILE *yyin;
extern FILE *yyout;
extern int yyparse();

GraphNode* root = NULL;
TOKEN_DATA token_data;

static std::ofstream dot_file;

int main(int argc, char *argv[]) {
  FILE *fh;
//   FILE *fo;

  if (argc != 4){
	  std::cout << "Incorrect usage. Usage : ./bin/parser <file>.c -o <file>.dot";
  }
  if ((fh = fopen(argv[1], "r"))){
  	yyin = fh;
  }
  else{
	  std::cout << "Input file does not exist!";
	  exit(0);
  }

  	// std::ofstream outfile(argv[3]);
  	dot_file.open(argv[3]); // = outfile;
	std::cout << "opening dot file\n";
	std::stringstream ss;
	ss << "digraph G {\n";
	ss << "\tordering=out\n";
	dot_file << ss.str();

	root = create_non_terminal("translation_unit");
	int abc = yyparse();
	root->dotify();
	
	
	std::cout << "abc: " <<  abc << std::endl;
	assert(abc == 0);
	
	ss.str("");
	ss << "}\n";
	dot_file << ss.str();

	dot_file.close();
	std::cout << "dot-file closed\n";

  return 0;
}

void file_writer(std::string s){
	dot_file << s;
}