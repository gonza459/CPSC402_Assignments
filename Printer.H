#ifndef PRINTER_HEADER
#define PRINTER_HEADER

#include "Absyn.H"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>


/* Certain applications may improve performance by changing the buffer size */
#define BUFFER_INITIAL 2000
/* You may wish to change _L_PAREN or _R_PAREN */
#define _L_PAREN '('
#define _R_PAREN ')'

class PrintAbsyn : public Visitor
{
 protected:
  int _n_, _i_;
  /* The following are simple heuristics for rendering terminals */
  /* You may wish to change them */
  void render(Char c);
  void render(String s);
  void render(const char *s);
  void indent(void);
  void backup(void);
 public:
  PrintAbsyn(void);
  ~PrintAbsyn(void);
  char *print(Visitable *v);

  void visitProgram(Program *p); /* abstract class */
  void visitPDefs(PDefs *p);
  void visitDef(Def *p); /* abstract class */
  void visitDFun(DFun *p);
  void visitListDef(ListDef *p);
  void visitArg(Arg *p); /* abstract class */
  void visitADecl(ADecl *p);
  void visitListArg(ListArg *p);
  void visitStm(Stm *p); /* abstract class */
  void visitSExp(SExp *p);
  void visitSDecls(SDecls *p);
  void visitSInit(SInit *p);
  void visitSReturn(SReturn *p);
  void visitSReturnVoid(SReturnVoid *p);
  void visitSWhile(SWhile *p);
  void visitSBlock(SBlock *p);
  void visitSIfElse(SIfElse *p);
  void visitListStm(ListStm *p);
  void visitExp(Exp *p); /* abstract class */
  void visitETrue(ETrue *p);
  void visitEFalse(EFalse *p);
  void visitEInt(EInt *p);
  void visitEDouble(EDouble *p);
  void visitEString(EString *p);
  void visitEId(EId *p);
  void visitEApp(EApp *p);
  void visitETyped(ETyped *p);
  void visitEPIncr(EPIncr *p);
  void visitEPDecr(EPDecr *p);
  void visitEIncr(EIncr *p);
  void visitEDecr(EDecr *p);
  void visitETimes(ETimes *p);
  void visitEDiv(EDiv *p);
  void visitEPlus(EPlus *p);
  void visitEMinus(EMinus *p);
  void visitELt(ELt *p);
  void visitEGt(EGt *p);
  void visitELtEq(ELtEq *p);
  void visitEGtEq(EGtEq *p);
  void visitEEq(EEq *p);
  void visitENEq(ENEq *p);
  void visitEAnd(EAnd *p);
  void visitEOr(EOr *p);
  void visitEAss(EAss *p);
  void visitListExp(ListExp *p);
  void visitType(Type *p); /* abstract class */
  void visitType_bool(Type_bool *p);
  void visitType_int(Type_int *p);
  void visitType_double(Type_double *p);
  void visitType_void(Type_void *p);
  void visitType_string(Type_string *p);
  void visitListId(ListId *p);

  void visitInteger(Integer i);
  void visitDouble(Double d);
  void visitChar(Char c);
  void visitString(String s);
  void visitIdent(String s);
  void visitId(String s);
 protected:
  char *buf_;
  int cur_, buf_size;

  void inline bufAppend(const char *s)
  {
    int len = strlen(s);
    while (cur_ + len >= buf_size)
    {
      buf_size *= 2; /* Double the buffer size */
    }
    resizeBuffer();
    for(int n = 0; n < len; n++)
    {
      buf_[cur_ + n] = s[n];
    }
    cur_ += len;
    buf_[cur_] = 0;
  }

  void inline bufAppend(const char c)
  {
    if (cur_ >= buf_size)
    {
      buf_size *= 2; /* Double the buffer size */
      resizeBuffer();
    }
    buf_[cur_] = c;
    cur_++;
    buf_[cur_] = 0;
  }

  void inline bufAppend(String str)
  {
    const char *s = str.c_str();
    bufAppend(s);
  }
  void inline bufReset(void)
  {
    if (buf_) free(buf_);
    buf_size = BUFFER_INITIAL;
    buf_ = (char *) malloc(buf_size);
    if (!buf_) {
      fprintf(stderr, "Error: Out of memory while allocating buffer!\n");
      exit(1);
    }
    memset(buf_, 0, buf_size);
    cur_ = 0;
  }

  void inline resizeBuffer(void)
  {
    char *temp = (char *) malloc(buf_size);
    if (!temp)
    {
      fprintf(stderr, "Error: Out of memory while attempting to grow buffer!\n");
      exit(1);
    }
    if (buf_)
    {
      strcpy(temp, buf_);
      free(buf_);
    }
    buf_ = temp;
  }
};



class ShowAbsyn : public Visitor
{
 public:
  ShowAbsyn(void);
  ~ShowAbsyn(void);
  char *show(Visitable *v);

  void visitProgram(Program *p); /* abstract class */
  void visitPDefs(PDefs *p);
  void visitDef(Def *p); /* abstract class */
  void visitDFun(DFun *p);
  void visitListDef(ListDef *p);
  void visitArg(Arg *p); /* abstract class */
  void visitADecl(ADecl *p);
  void visitListArg(ListArg *p);
  void visitStm(Stm *p); /* abstract class */
  void visitSExp(SExp *p);
  void visitSDecls(SDecls *p);
  void visitSInit(SInit *p);
  void visitSReturn(SReturn *p);
  void visitSReturnVoid(SReturnVoid *p);
  void visitSWhile(SWhile *p);
  void visitSBlock(SBlock *p);
  void visitSIfElse(SIfElse *p);
  void visitListStm(ListStm *p);
  void visitExp(Exp *p); /* abstract class */
  void visitETrue(ETrue *p);
  void visitEFalse(EFalse *p);
  void visitEInt(EInt *p);
  void visitEDouble(EDouble *p);
  void visitEString(EString *p);
  void visitEId(EId *p);
  void visitEApp(EApp *p);
  void visitETyped(ETyped *p);
  void visitEPIncr(EPIncr *p);
  void visitEPDecr(EPDecr *p);
  void visitEIncr(EIncr *p);
  void visitEDecr(EDecr *p);
  void visitETimes(ETimes *p);
  void visitEDiv(EDiv *p);
  void visitEPlus(EPlus *p);
  void visitEMinus(EMinus *p);
  void visitELt(ELt *p);
  void visitEGt(EGt *p);
  void visitELtEq(ELtEq *p);
  void visitEGtEq(EGtEq *p);
  void visitEEq(EEq *p);
  void visitENEq(ENEq *p);
  void visitEAnd(EAnd *p);
  void visitEOr(EOr *p);
  void visitEAss(EAss *p);
  void visitListExp(ListExp *p);
  void visitType(Type *p); /* abstract class */
  void visitType_bool(Type_bool *p);
  void visitType_int(Type_int *p);
  void visitType_double(Type_double *p);
  void visitType_void(Type_void *p);
  void visitType_string(Type_string *p);
  void visitListId(ListId *p);

  void visitInteger(Integer i);
  void visitDouble(Double d);
  void visitChar(Char c);
  void visitString(String s);
  void visitIdent(String s);
  void visitId(String s);
 protected:
  char *buf_;
  int cur_, buf_size;

  void inline bufAppend(const char *s)
  {
    int len = strlen(s);
    while (cur_ + len >= buf_size)
    {
      buf_size *= 2; /* Double the buffer size */
    }
    resizeBuffer();
    for(int n = 0; n < len; n++)
    {
      buf_[cur_ + n] = s[n];
    }
    cur_ += len;
    buf_[cur_] = 0;
  }

  void inline bufAppend(const char c)
  {
    if (cur_ >= buf_size)
    {
      buf_size *= 2; /* Double the buffer size */
      resizeBuffer();
    }
    buf_[cur_] = c;
    cur_++;
    buf_[cur_] = 0;
  }

  void inline bufAppend(String str)
  {
    const char *s = str.c_str();
    bufAppend(s);
  }
  void inline bufReset(void)
  {
    if (buf_) free(buf_);
    buf_size = BUFFER_INITIAL;
    buf_ = (char *) malloc(buf_size);
    if (!buf_) {
      fprintf(stderr, "Error: Out of memory while allocating buffer!\n");
      exit(1);
    }
    memset(buf_, 0, buf_size);
    cur_ = 0;
  }

  void inline resizeBuffer(void)
  {
    char *temp = (char *) malloc(buf_size);
    if (!temp)
    {
      fprintf(stderr, "Error: Out of memory while attempting to grow buffer!\n");
      exit(1);
    }
    if (buf_)
    {
      strcpy(temp, buf_);
      free(buf_);
    }
    buf_ = temp;
  }
};




#endif

