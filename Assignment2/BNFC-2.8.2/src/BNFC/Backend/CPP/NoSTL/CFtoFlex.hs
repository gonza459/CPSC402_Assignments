{-
    BNF Converter: Flex generator
    Copyright (C) 2004  Author:  Michael Pellauer

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, 51 Franklin Street, Fifth Floor, Boston, MA 02110-1335, USA
-}

{-
   **************************************************************
    BNF Converter Module

    Description   : This module generates the Flex file. It is
                    similar to JLex but with a few peculiarities.

    Author        : Michael Pellauer (pellauer@cs.chalmers.se)

    License       : GPL (GNU General Public License)

    Created       : 5 August, 2003

    Modified      : 22 August, 2006 by Aarne Ranta


   **************************************************************
-}
module BNFC.Backend.CPP.NoSTL.CFtoFlex (cf2flex) where

import BNFC.CF
import BNFC.Backend.C.CFtoFlexC (lexComments, cMacros)
import BNFC.Backend.CPP.NoSTL.RegToFlex
import BNFC.Backend.Common.NamedVariables
import BNFC.Backend.CPP.STL.STLUtils
import BNFC.PrettyPrint

--The environment must be returned for the parser to use.
cf2flex :: Maybe String -> String -> CF -> (String, SymEnv)
cf2flex inPackage name cf = (unlines
 [
  prelude inPackage name,
  cMacros,
  lexSymbols env,
  restOfFlex inPackage cf env'
 ], env')
  where
   env = makeSymEnv (cfgSymbols cf ++ reservedWords cf) (0 :: Int)
   env' = env ++ (makeSymEnv (tokenNames cf) (length env))
   makeSymEnv [] _ = []
   makeSymEnv (s:symbs) n = (s, nsDefine inPackage "_SYMB_" ++ (show n)) : (makeSymEnv symbs (n+1))

prelude :: Maybe String -> String -> String
prelude inPackage _ = unlines
  [
   maybe "" (\ns -> "%option prefix=\"" ++ ns ++ "yy\"") inPackage,
   "/* This FLex file was machine-generated by the BNF converter */",
   "%{",
   "#include <string.h>",
   "#include \"Parser.H\"",
   "#define YY_BUFFER_LENGTH 4096",
   "extern int " ++ nsString inPackage ++ "yy_mylinenumber ;", --- hack to get line number. AR 2006
   "static char YY_PARSED_STRING[YY_BUFFER_LENGTH];",
   "static void YY_BUFFER_APPEND(char *s)",
   "{",
   "  strcat(YY_PARSED_STRING, s); //Do something better here!",
   "}",
   "static void YY_BUFFER_RESET(void)",
   "{",
   "  for(int x = 0; x < YY_BUFFER_LENGTH; x++)",
   "    YY_PARSED_STRING[x] = 0;",
   "}",
   "",
   "%}"
  ]

lexSymbols :: SymEnv -> String
lexSymbols ss = concatMap transSym ss
  where
    transSym (s,r) =
      "<YYINITIAL>\"" ++ s' ++ "\"      \t return " ++ r ++ ";\n"
        where
         s' = escapeChars s

restOfFlex :: Maybe String -> CF -> SymEnv -> String
restOfFlex inPackage cf env = concat
  [
   render $ lexComments inPackage (comments cf),
   "\n\n",
   userDefTokens,
   ifC catString strStates,
   ifC catChar chStates,
   ifC catDouble ("<YYINITIAL>{DIGIT}+\".\"{DIGIT}+(\"e\"(\\-)?{DIGIT}+)?      \t " ++ ns ++ "yylval.double_ = atof(yytext); return " ++ nsDefine inPackage "_DOUBLE_" ++ ";\n"),
   ifC catInteger ("<YYINITIAL>{DIGIT}+      \t " ++ ns ++ "yylval.int_ = atoi(yytext); return " ++ nsDefine inPackage "_INTEGER_" ++ ";\n"),
   ifC catIdent ("<YYINITIAL>{LETTER}{IDENT}*      \t " ++ ns ++ "yylval.string_ = strdup(yytext); return " ++ nsDefine inPackage "_IDENT_" ++ ";\n"),
   "\\n  ++" ++ ns ++ "yy_mylinenumber ;\n",
   "<YYINITIAL>[ \\t\\r\\n\\f]      \t /* ignore white space. */;\n",
   "<YYINITIAL>.      \t return " ++ nsDefine inPackage "_ERROR_" ++ ";\n",
   "%%\n",
   footer
  ]
  where
   ifC cat s = if isUsedCat cf cat then s else ""
   ns = nsString inPackage
   userDefTokens = unlines $
     ["<YYINITIAL>" ++ printRegFlex exp ++
      "     \t " ++ ns ++ "yylval.string_ = strdup(yytext); return " ++ sName name ++ ";"
       | (name, exp) <- tokenPragmas cf]
      where
          sName n = case lookup (show n) env of
              Just x -> x
              Nothing -> (show n)
   strStates = unlines --These handle escaped characters in Strings.
    [
     "<YYINITIAL>\"\\\"\"      \t BEGIN STRING;",
     "<STRING>\\\\      \t BEGIN ESCAPED;",
     "<STRING>\\\"      \t " ++ ns ++ "yylval.string_ = strdup(YY_PARSED_STRING); YY_BUFFER_RESET(); BEGIN YYINITIAL; return " ++ nsDefine inPackage "_STRING_" ++ ";",
     "<STRING>.      \t YY_BUFFER_APPEND(yytext);",
     "<ESCAPED>n      \t YY_BUFFER_APPEND(\"\\n\"); BEGIN STRING;",
     "<ESCAPED>\\\"      \t YY_BUFFER_APPEND(\"\\\"\"); BEGIN STRING ;",
     "<ESCAPED>\\\\      \t YY_BUFFER_APPEND(\"\\\\\"); BEGIN STRING;",
     "<ESCAPED>t       \t YY_BUFFER_APPEND(\"\\t\"); BEGIN STRING;",
     "<ESCAPED>.       \t YY_BUFFER_APPEND(yytext); BEGIN STRING;"
    ]
   chStates = unlines --These handle escaped characters in Chars.
    [
     "<YYINITIAL>\"'\" \tBEGIN CHAR;",
     "<CHAR>\\\\      \t BEGIN CHARESC;",
     "<CHAR>[^']      \t BEGIN CHAREND; " ++ ns ++ "yylval.char_ = yytext[0]; return " ++ nsDefine inPackage "_CHAR_" ++ ";",
     "<CHARESC>n      \t BEGIN CHAREND; " ++ ns ++ "yylval.char_ = '\\n'; return " ++ nsDefine inPackage "_CHAR_" ++ ";",
     "<CHARESC>t      \t BEGIN CHAREND; " ++ ns ++ "yylval.char_ = '\\t'; return " ++ nsDefine inPackage "_CHAR_" ++ ";",
     "<CHARESC>.      \t BEGIN CHAREND; " ++ ns ++ "yylval.char_ = yytext[0]; return " ++ nsDefine inPackage "_CHAR_" ++ ";",
     "<CHAREND>\"'\"      \t BEGIN YYINITIAL;"
    ]
   footer = unlines
    [
     "void " ++ ns ++ "initialize_lexer(FILE *inp) { yyrestart(inp); BEGIN YYINITIAL; }",
     "int yywrap(void) { return 1; }"
    ]


--Helper function that escapes characters in strings
escapeChars :: String -> String
escapeChars [] = []
escapeChars ('\\':xs) = '\\' : ('\\' : (escapeChars xs))
escapeChars ('\"':xs) = '\\' : ('\"' : (escapeChars xs))
escapeChars (x:xs) = x : (escapeChars xs)
