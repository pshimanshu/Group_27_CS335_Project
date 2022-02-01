all: 
	flex src/lexer.l
	g++ -x c++ lex.yy.c -lfl -o lexer
	mv lexer bin/lexer
	rm lex.yy.c

clean:
	rm bin/lexer