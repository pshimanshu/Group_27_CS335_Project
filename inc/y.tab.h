/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    IDENTIFIER = 258,
    CONSTANT = 259,
    STRING_LITERAL = 260,
    SIZEOF = 261,
    PTR_OP = 262,
    INC_OP = 263,
    DEC_OP = 264,
    LEFT_OP = 265,
    RIGHT_OP = 266,
    LE_OP = 267,
    GE_OP = 268,
    EQ_OP = 269,
    NE_OP = 270,
    AND_OP = 271,
    OR_OP = 272,
    MUL_ASSIGN = 273,
    DIV_ASSIGN = 274,
    MOD_ASSIGN = 275,
    ADD_ASSIGN = 276,
    SUB_ASSIGN = 277,
    LEFT_ASSIGN = 278,
    RIGHT_ASSIGN = 279,
    AND_ASSIGN = 280,
    XOR_ASSIGN = 281,
    OR_ASSIGN = 282,
    TYPE_NAME = 283,
    PROTECTED = 284,
    TRY = 285,
    TYPENAME = 286,
    USING = 287,
    DELETE = 288,
    THROW = 289,
    PUBLIC = 290,
    THIS = 291,
    CLASS = 292,
    PRIVATE = 293,
    OPERATOR = 294,
    CATCH = 295,
    BOOL = 296,
    NAMESPACE = 297,
    FALSE = 298,
    TRUE = 299,
    TYPEID = 300,
    VECTOR = 301,
    STRING = 302,
    TYPEDEF = 303,
    EXTERN = 304,
    STATIC = 305,
    AUTO = 306,
    REGISTER = 307,
    CHAR = 308,
    SHORT = 309,
    INT = 310,
    LONG = 311,
    SIGNED = 312,
    UNSIGNED = 313,
    FLOAT = 314,
    DOUBLE = 315,
    CONST = 316,
    VOLATILE = 317,
    VOID = 318,
    STRUCT = 319,
    UNION = 320,
    ENUM = 321,
    ELLIPSIS = 322,
    CASE = 323,
    DEFAULT = 324,
    IF = 325,
    ELSE = 326,
    SWITCH = 327,
    WHILE = 328,
    DO = 329,
    FOR = 330,
    GOTO = 331,
    CONTINUE = 332,
    BREAK = 333,
    RETURN = 334
  };
#endif
/* Tokens.  */
#define IDENTIFIER 258
#define CONSTANT 259
#define STRING_LITERAL 260
#define SIZEOF 261
#define PTR_OP 262
#define INC_OP 263
#define DEC_OP 264
#define LEFT_OP 265
#define RIGHT_OP 266
#define LE_OP 267
#define GE_OP 268
#define EQ_OP 269
#define NE_OP 270
#define AND_OP 271
#define OR_OP 272
#define MUL_ASSIGN 273
#define DIV_ASSIGN 274
#define MOD_ASSIGN 275
#define ADD_ASSIGN 276
#define SUB_ASSIGN 277
#define LEFT_ASSIGN 278
#define RIGHT_ASSIGN 279
#define AND_ASSIGN 280
#define XOR_ASSIGN 281
#define OR_ASSIGN 282
#define TYPE_NAME 283
#define PROTECTED 284
#define TRY 285
#define TYPENAME 286
#define USING 287
#define DELETE 288
#define THROW 289
#define PUBLIC 290
#define THIS 291
#define CLASS 292
#define PRIVATE 293
#define OPERATOR 294
#define CATCH 295
#define BOOL 296
#define NAMESPACE 297
#define FALSE 298
#define TRUE 299
#define TYPEID 300
#define VECTOR 301
#define STRING 302
#define TYPEDEF 303
#define EXTERN 304
#define STATIC 305
#define AUTO 306
#define REGISTER 307
#define CHAR 308
#define SHORT 309
#define INT 310
#define LONG 311
#define SIGNED 312
#define UNSIGNED 313
#define FLOAT 314
#define DOUBLE 315
#define CONST 316
#define VOLATILE 317
#define VOID 318
#define STRUCT 319
#define UNION 320
#define ENUM 321
#define ELLIPSIS 322
#define CASE 323
#define DEFAULT 324
#define IF 325
#define ELSE 326
#define SWITCH 327
#define WHILE 328
#define DO 329
#define FOR 330
#define GOTO 331
#define CONTINUE 332
#define BREAK 333
#define RETURN 334

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 11 "src/grammar.y"

	class GraphNode* node;

#line 219 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
