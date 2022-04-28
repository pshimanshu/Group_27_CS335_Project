# TOOLS
CC = gcc
CXX = g++
LEX = flex
YACC = bison

# TARGET = scanner
TARGET = parser

SRCDIR = src
BUILDDIR = build
INCDIR = inc
TARGETDIR = bin

PATTERNS=$(SRCDIR)/patterns.l
GRAMMAR=$(SRCDIR)/grammar.y

# flags
CFLAGS = -g -Wall -D_CC
CXXFLAGS = -g -Wall -D_CXX
CXXSTOPFLAGS = -c
CXXEXTRAFLAGS = -x c++
# linking flags
YFLAGS = -yvdt
LDFLAGS = -lfl
INCFLAGS = $(addprefix -I, $(INCDIR))

# all: $(TARGET)



parser: grammar patterns
	
	$(CXX) $(CXXSTOPFLAGS) $(CXXEXTRAFLAGS) $(LDFLAGS) $(INCFLAGS) $(BUILDDIR)/lex.yy.c -o lex.yy.o
	$(CXX) $(CXXSTOPFLAGS) $(CXXEXTRAFLAGS) $(LDFLAGS) $(INCFLAGS) $(BUILDDIR)/y.tab.c -o y.tab.o
	$(CXX) $(CXXSTOPFLAGS) $(CXXFLAGS) $(INCFLAGS) $(SRCDIR)/parser.cpp -o parser.o
	$(CXX) -o parser lex.yy.o y.tab.o parser.o
	@mkdir -p $(TARGETDIR)
	@mv parser $(TARGETDIR)/.
	
	@mv y.output $(BUILDDIR)/.
	rm lex.yy.o y.tab.o parser.o

grammar:
	$(YACC) $(YFLAGS) --graph $(GRAMMAR)
	@mkdir -p $(BUILDDIR)
	@mv y.tab.c $(BUILDDIR)/.
	@mv y.tab.h $(INCDIR)/.	
	sfdp -x -Tpdf y.dot -o LRA.pdf
	@mv y.dot $(BUILDDIR)/.
	@mkdir -p $(TARGETDIR)
	@mv LRA.pdf $(TARGETDIR)/.
	
	




lexer: patterns
	$(CXX) $(CXXSTOPFLAGS) $(CXXFLAGS) $(INCFLAGS) $(SRCDIR)/lexer.cpp -o lexer.o
	$(CXX) $(CXXSTOPFLAGS) $(CXXEXTRAFLAGS) $(LDFLAGS) $(INCFLAGS) $(BUILDDIR)/lex.yy.c -o lex.yy.o
	$(CXX) -o lexer lexer.o lex.yy.o
	@mkdir -p $(TARGETDIR)
	@mv lexer $(TARGETDIR)/.
	rm lex.yy.o lexer.o


patterns:
	$(LEX) $(PATTERNS)
	@mkdir -p $(BUILDDIR)
	@mv lex.yy.c $(BUILDDIR)/.

.PHONY: clean

clean:
	rm -rf $(BUILDDIR) $(TARGETDIR) 
	