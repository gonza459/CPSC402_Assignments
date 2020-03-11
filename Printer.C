/*** BNFC-Generated Pretty Printer and Abstract Syntax Viewer ***/

#include <string>
#include "Printer.H"
#define INDENT_WIDTH 2


//You may wish to change render
void PrintAbsyn::render(Char c)
{
  if (c == '{')
  {
     bufAppend('\n');
     indent();
     bufAppend(c);
     _n_ = _n_ + INDENT_WIDTH;
     bufAppend('\n');
     indent();
  }
  else if (c == '(' || c == '[')
     bufAppend(c);
  else if (c == ')' || c == ']')
  {
     backup();
     bufAppend(c);
  }
  else if (c == '}')
  {
     int t;
     _n_ = _n_ - INDENT_WIDTH;
     for (t=0; t<INDENT_WIDTH; t++) {
       backup();
     }
     bufAppend(c);
     bufAppend('\n');
     indent();
  }
  else if (c == ',')
  {
     backup();
     bufAppend(c);
     bufAppend(' ');
  }
  else if (c == ';')
  {
     backup();
     bufAppend(c);
     bufAppend('\n');
     indent();
  }
  else if (c == 0) return;
  else
  {
     bufAppend(' ');
     bufAppend(c);
     bufAppend(' ');
  }
}

void PrintAbsyn::render(String s_)
{
  const char *s = s_.c_str() ;
  if(strlen(s) > 0)
  {
    bufAppend(s);
    bufAppend(' ');
  }
}
void PrintAbsyn::render(const char *s)
{
  if(strlen(s) > 0)
  {
    bufAppend(s);
    bufAppend(' ');
  }
}

void PrintAbsyn::indent()
{
  int n = _n_;
  while (n > 0)
  {
    bufAppend(' ');
    n--;
  }
}

void PrintAbsyn::backup()
{
  if (buf_[cur_ - 1] == ' ')
  {
    buf_[cur_ - 1] = 0;
    cur_--;
  }
}

PrintAbsyn::PrintAbsyn(void)
{
  _i_ = 0; _n_ = 0;
  buf_ = 0;
  bufReset();
}

PrintAbsyn::~PrintAbsyn(void)
{
}

char *PrintAbsyn::print(Visitable *v)
{
  _i_ = 0; _n_ = 0;
  bufReset();
  v->accept(this);
  return buf_;
}

void PrintAbsyn::visitProgram(Program *p) {} //abstract class

void PrintAbsyn::visitPDefs(PDefs *p)
{
  int oldi = _i_;
  if (oldi > 0) render(_L_PAREN);

  if(p->listdef_) {_i_ = 0; p->listdef_->accept(this);}

  if (oldi > 0) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitDef(Def *p) {} //abstract class

void PrintAbsyn::visitDFun(DFun *p)
{
  int oldi = _i_;
  if (oldi > 0) render(_L_PAREN);

  _i_ = 0; p->type_->accept(this);
  visitIdent(p->id_);
  render('(');
  if(p->listarg_) {_i_ = 0; p->listarg_->accept(this);}
  render(')');
  render('{');
  if(p->liststm_) {_i_ = 0; p->liststm_->accept(this);}
  render('}');

  if (oldi > 0) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitListDef(ListDef *listdef)
{
  for (ListDef::const_iterator i = listdef->begin() ; i != listdef->end() ; ++i)
  {
    (*i)->accept(this);
    render("");
  }
}void PrintAbsyn::visitArg(Arg *p) {} //abstract class

void PrintAbsyn::visitADecl(ADecl *p)
{
  int oldi = _i_;
  if (oldi > 0) render(_L_PAREN);

  _i_ = 0; p->type_->accept(this);
  visitIdent(p->id_);

  if (oldi > 0) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitListArg(ListArg *listarg)
{
  for (ListArg::const_iterator i = listarg->begin() ; i != listarg->end() ; ++i)
  {
    (*i)->accept(this);
    if (i != listarg->end() - 1) render(',');
  }
}void PrintAbsyn::visitStm(Stm *p) {} //abstract class

void PrintAbsyn::visitSExp(SExp *p)
{
  int oldi = _i_;
  if (oldi > 0) render(_L_PAREN);

  _i_ = 0; p->exp_->accept(this);
  render(';');

  if (oldi > 0) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitSDecls(SDecls *p)
{
  int oldi = _i_;
  if (oldi > 0) render(_L_PAREN);

  _i_ = 0; p->type_->accept(this);
  if(p->listid_) {_i_ = 0; p->listid_->accept(this);}
  render(';');

  if (oldi > 0) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitSInit(SInit *p)
{
  int oldi = _i_;
  if (oldi > 0) render(_L_PAREN);

  _i_ = 0; p->type_->accept(this);
  visitIdent(p->id_);
  render('=');
  _i_ = 0; p->exp_->accept(this);
  render(';');

  if (oldi > 0) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitSReturn(SReturn *p)
{
  int oldi = _i_;
  if (oldi > 0) render(_L_PAREN);

  render("return");
  _i_ = 0; p->exp_->accept(this);
  render(';');

  if (oldi > 0) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitSReturnVoid(SReturnVoid *p)
{
  int oldi = _i_;
  if (oldi > 0) render(_L_PAREN);

  render("return");
  render(';');

  if (oldi > 0) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitSWhile(SWhile *p)
{
  int oldi = _i_;
  if (oldi > 0) render(_L_PAREN);

  render("while");
  render('(');
  _i_ = 0; p->exp_->accept(this);
  render(')');
  _i_ = 0; p->stm_->accept(this);

  if (oldi > 0) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitSBlock(SBlock *p)
{
  int oldi = _i_;
  if (oldi > 0) render(_L_PAREN);

  render('{');
  if(p->liststm_) {_i_ = 0; p->liststm_->accept(this);}
  render('}');

  if (oldi > 0) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitSIfElse(SIfElse *p)
{
  int oldi = _i_;
  if (oldi > 0) render(_L_PAREN);

  render("if");
  render('(');
  _i_ = 0; p->exp_->accept(this);
  render(')');
  _i_ = 0; p->stm_1->accept(this);
  render("else");
  _i_ = 0; p->stm_2->accept(this);

  if (oldi > 0) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitListStm(ListStm *liststm)
{
  for (ListStm::const_iterator i = liststm->begin() ; i != liststm->end() ; ++i)
  {
    (*i)->accept(this);
    render("");
  }
}void PrintAbsyn::visitExp(Exp *p) {} //abstract class

void PrintAbsyn::visitETrue(ETrue *p)
{
  int oldi = _i_;
  if (oldi > 15) render(_L_PAREN);

  render("true");

  if (oldi > 15) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitEFalse(EFalse *p)
{
  int oldi = _i_;
  if (oldi > 15) render(_L_PAREN);

  render("false");

  if (oldi > 15) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitEInt(EInt *p)
{
  int oldi = _i_;
  if (oldi > 15) render(_L_PAREN);

  visitInteger(p->integer_);

  if (oldi > 15) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitEDouble(EDouble *p)
{
  int oldi = _i_;
  if (oldi > 15) render(_L_PAREN);

  visitDouble(p->double_);

  if (oldi > 15) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitEString(EString *p)
{
  int oldi = _i_;
  if (oldi > 15) render(_L_PAREN);

  visitString(p->string_);

  if (oldi > 15) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitEId(EId *p)
{
  int oldi = _i_;
  if (oldi > 15) render(_L_PAREN);

  visitIdent(p->id_);

  if (oldi > 15) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitEApp(EApp *p)
{
  int oldi = _i_;
  if (oldi > 15) render(_L_PAREN);

  visitIdent(p->id_);
  render('(');
  if(p->listexp_) {_i_ = 0; p->listexp_->accept(this);}
  render(')');

  if (oldi > 15) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitETyped(ETyped *p)
{
  int oldi = _i_;
  if (oldi > 15) render(_L_PAREN);

  /* Internal Category */

  render('(');
  _i_ = 0; p->exp_->accept(this);
  render("::");
  _i_ = 0; p->type_->accept(this);
  render(')');

  if (oldi > 15) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitEPIncr(EPIncr *p)
{
  int oldi = _i_;
  if (oldi > 14) render(_L_PAREN);

  _i_ = 15; p->exp_->accept(this);
  render("++");

  if (oldi > 14) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitEPDecr(EPDecr *p)
{
  int oldi = _i_;
  if (oldi > 14) render(_L_PAREN);

  _i_ = 15; p->exp_->accept(this);
  render("--");

  if (oldi > 14) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitEIncr(EIncr *p)
{
  int oldi = _i_;
  if (oldi > 13) render(_L_PAREN);

  render("++");
  _i_ = 14; p->exp_->accept(this);

  if (oldi > 13) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitEDecr(EDecr *p)
{
  int oldi = _i_;
  if (oldi > 13) render(_L_PAREN);

  render("--");
  _i_ = 14; p->exp_->accept(this);

  if (oldi > 13) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitETimes(ETimes *p)
{
  int oldi = _i_;
  if (oldi > 12) render(_L_PAREN);

  _i_ = 12; p->exp_1->accept(this);
  render('*');
  _i_ = 13; p->exp_2->accept(this);

  if (oldi > 12) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitEDiv(EDiv *p)
{
  int oldi = _i_;
  if (oldi > 12) render(_L_PAREN);

  _i_ = 12; p->exp_1->accept(this);
  render('/');
  _i_ = 13; p->exp_2->accept(this);

  if (oldi > 12) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitEPlus(EPlus *p)
{
  int oldi = _i_;
  if (oldi > 11) render(_L_PAREN);

  _i_ = 11; p->exp_1->accept(this);
  render('+');
  _i_ = 12; p->exp_2->accept(this);

  if (oldi > 11) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitEMinus(EMinus *p)
{
  int oldi = _i_;
  if (oldi > 11) render(_L_PAREN);

  _i_ = 11; p->exp_1->accept(this);
  render('-');
  _i_ = 12; p->exp_2->accept(this);

  if (oldi > 11) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitELt(ELt *p)
{
  int oldi = _i_;
  if (oldi > 9) render(_L_PAREN);

  _i_ = 9; p->exp_1->accept(this);
  render('<');
  _i_ = 10; p->exp_2->accept(this);

  if (oldi > 9) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitEGt(EGt *p)
{
  int oldi = _i_;
  if (oldi > 9) render(_L_PAREN);

  _i_ = 9; p->exp_1->accept(this);
  render('>');
  _i_ = 10; p->exp_2->accept(this);

  if (oldi > 9) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitELtEq(ELtEq *p)
{
  int oldi = _i_;
  if (oldi > 9) render(_L_PAREN);

  _i_ = 9; p->exp_1->accept(this);
  render("<=");
  _i_ = 10; p->exp_2->accept(this);

  if (oldi > 9) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitEGtEq(EGtEq *p)
{
  int oldi = _i_;
  if (oldi > 9) render(_L_PAREN);

  _i_ = 9; p->exp_1->accept(this);
  render(">=");
  _i_ = 10; p->exp_2->accept(this);

  if (oldi > 9) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitEEq(EEq *p)
{
  int oldi = _i_;
  if (oldi > 8) render(_L_PAREN);

  _i_ = 8; p->exp_1->accept(this);
  render("==");
  _i_ = 9; p->exp_2->accept(this);

  if (oldi > 8) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitENEq(ENEq *p)
{
  int oldi = _i_;
  if (oldi > 8) render(_L_PAREN);

  _i_ = 8; p->exp_1->accept(this);
  render("!=");
  _i_ = 9; p->exp_2->accept(this);

  if (oldi > 8) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitEAnd(EAnd *p)
{
  int oldi = _i_;
  if (oldi > 4) render(_L_PAREN);

  _i_ = 4; p->exp_1->accept(this);
  render("&&");
  _i_ = 5; p->exp_2->accept(this);

  if (oldi > 4) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitEOr(EOr *p)
{
  int oldi = _i_;
  if (oldi > 3) render(_L_PAREN);

  _i_ = 3; p->exp_1->accept(this);
  render("||");
  _i_ = 4; p->exp_2->accept(this);

  if (oldi > 3) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitEAss(EAss *p)
{
  int oldi = _i_;
  if (oldi > 2) render(_L_PAREN);

  _i_ = 3; p->exp_1->accept(this);
  render('=');
  _i_ = 2; p->exp_2->accept(this);

  if (oldi > 2) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitListExp(ListExp *listexp)
{
  for (ListExp::const_iterator i = listexp->begin() ; i != listexp->end() ; ++i)
  {
    (*i)->accept(this);
    if (i != listexp->end() - 1) render(',');
  }
}void PrintAbsyn::visitType(Type *p) {} //abstract class

void PrintAbsyn::visitType_bool(Type_bool *p)
{
  int oldi = _i_;
  if (oldi > 0) render(_L_PAREN);

  render("bool");

  if (oldi > 0) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitType_int(Type_int *p)
{
  int oldi = _i_;
  if (oldi > 0) render(_L_PAREN);

  render("int");

  if (oldi > 0) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitType_double(Type_double *p)
{
  int oldi = _i_;
  if (oldi > 0) render(_L_PAREN);

  render("double");

  if (oldi > 0) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitType_void(Type_void *p)
{
  int oldi = _i_;
  if (oldi > 0) render(_L_PAREN);

  render("void");

  if (oldi > 0) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitType_string(Type_string *p)
{
  int oldi = _i_;
  if (oldi > 0) render(_L_PAREN);

  render("string");

  if (oldi > 0) render(_R_PAREN);

  _i_ = oldi;
}

void PrintAbsyn::visitListId(ListId *listid)
{
  for (ListId::const_iterator i = listid->begin() ; i != listid->end() ; ++i)
  {
    visitId(*i) ;
    if (i != listid->end() - 1) render(',');
  }
}void PrintAbsyn::visitInteger(Integer i)
{
  char tmp[16];
  sprintf(tmp, "%d", i);
  bufAppend(tmp);
}

void PrintAbsyn::visitDouble(Double d)
{
  char tmp[16];
  sprintf(tmp, "%g", d);
  bufAppend(tmp);
}

void PrintAbsyn::visitChar(Char c)
{
  bufAppend('\'');
  bufAppend(c);
  bufAppend('\'');
}

void PrintAbsyn::visitString(String s)
{
  bufAppend('\"');
  bufAppend(s);
  bufAppend('\"');
}

void PrintAbsyn::visitIdent(String s)
{
  render(s);
}

void PrintAbsyn::visitId(String s)
{
  render(s);
}


ShowAbsyn::ShowAbsyn(void)
{
  buf_ = 0;
  bufReset();
}

ShowAbsyn::~ShowAbsyn(void)
{
}

char *ShowAbsyn::show(Visitable *v)
{
  bufReset();
  v->accept(this);
  return buf_;
}

void ShowAbsyn::visitProgram(Program *p) {} //abstract class

void ShowAbsyn::visitPDefs(PDefs *p)
{
  bufAppend('(');
  bufAppend("PDefs");
  bufAppend(' ');
  bufAppend('[');
  if (p->listdef_)  p->listdef_->accept(this);
  bufAppend(']');
  bufAppend(')');
}
void ShowAbsyn::visitDef(Def *p) {} //abstract class

void ShowAbsyn::visitDFun(DFun *p)
{
  bufAppend('(');
  bufAppend("DFun");
  bufAppend(' ');
  bufAppend('[');
  if (p->type_)  p->type_->accept(this);
  bufAppend(']');
  bufAppend(' ');
  visitIdent(p->id_);
  bufAppend(' ');
  bufAppend('[');
  if (p->listarg_)  p->listarg_->accept(this);
  bufAppend(']');
  bufAppend(' ');
  bufAppend('[');
  if (p->liststm_)  p->liststm_->accept(this);
  bufAppend(']');
  bufAppend(' ');
  bufAppend(')');
}
void ShowAbsyn::visitListDef(ListDef *listdef)
{
  for (ListDef::const_iterator i = listdef->begin() ; i != listdef->end() ; ++i)
  {
    (*i)->accept(this);
    if (i != listdef->end() - 1) bufAppend(", ");
  }
}

void ShowAbsyn::visitArg(Arg *p) {} //abstract class

void ShowAbsyn::visitADecl(ADecl *p)
{
  bufAppend('(');
  bufAppend("ADecl");
  bufAppend(' ');
  bufAppend('[');
  if (p->type_)  p->type_->accept(this);
  bufAppend(']');
  bufAppend(' ');
  visitIdent(p->id_);
  bufAppend(')');
}
void ShowAbsyn::visitListArg(ListArg *listarg)
{
  for (ListArg::const_iterator i = listarg->begin() ; i != listarg->end() ; ++i)
  {
    (*i)->accept(this);
    if (i != listarg->end() - 1) bufAppend(", ");
  }
}

void ShowAbsyn::visitStm(Stm *p) {} //abstract class

void ShowAbsyn::visitSExp(SExp *p)
{
  bufAppend('(');
  bufAppend("SExp");
  bufAppend(' ');
  bufAppend('[');
  if (p->exp_)  p->exp_->accept(this);
  bufAppend(']');
  bufAppend(' ');
  bufAppend(')');
}
void ShowAbsyn::visitSDecls(SDecls *p)
{
  bufAppend('(');
  bufAppend("SDecls");
  bufAppend(' ');
  bufAppend('[');
  if (p->type_)  p->type_->accept(this);
  bufAppend(']');
  bufAppend(' ');
  bufAppend('[');
  if (p->listid_)  p->listid_->accept(this);
  bufAppend(']');
  bufAppend(' ');
  bufAppend(')');
}
void ShowAbsyn::visitSInit(SInit *p)
{
  bufAppend('(');
  bufAppend("SInit");
  bufAppend(' ');
  bufAppend('[');
  if (p->type_)  p->type_->accept(this);
  bufAppend(']');
  bufAppend(' ');
  visitIdent(p->id_);
  bufAppend(' ');
  bufAppend('[');
  if (p->exp_)  p->exp_->accept(this);
  bufAppend(']');
  bufAppend(' ');
  bufAppend(')');
}
void ShowAbsyn::visitSReturn(SReturn *p)
{
  bufAppend('(');
  bufAppend("SReturn");
  bufAppend(' ');
  bufAppend('[');
  if (p->exp_)  p->exp_->accept(this);
  bufAppend(']');
  bufAppend(' ');
  bufAppend(')');
}
void ShowAbsyn::visitSReturnVoid(SReturnVoid *p)
{
  bufAppend("SReturnVoid");
}
void ShowAbsyn::visitSWhile(SWhile *p)
{
  bufAppend('(');
  bufAppend("SWhile");
  bufAppend(' ');
  bufAppend('[');
  if (p->exp_)  p->exp_->accept(this);
  bufAppend(']');
  bufAppend(' ');
  bufAppend('[');
  if (p->stm_)  p->stm_->accept(this);
  bufAppend(']');
  bufAppend(')');
}
void ShowAbsyn::visitSBlock(SBlock *p)
{
  bufAppend('(');
  bufAppend("SBlock");
  bufAppend(' ');
  bufAppend('[');
  if (p->liststm_)  p->liststm_->accept(this);
  bufAppend(']');
  bufAppend(' ');
  bufAppend(')');
}
void ShowAbsyn::visitSIfElse(SIfElse *p)
{
  bufAppend('(');
  bufAppend("SIfElse");
  bufAppend(' ');
  bufAppend('[');
  if (p->exp_)  p->exp_->accept(this);
  bufAppend(']');
  bufAppend(' ');
  p->stm_1->accept(this);
  bufAppend(' ');
  p->stm_2->accept(this);
  bufAppend(')');
}
void ShowAbsyn::visitListStm(ListStm *liststm)
{
  for (ListStm::const_iterator i = liststm->begin() ; i != liststm->end() ; ++i)
  {
    (*i)->accept(this);
    if (i != liststm->end() - 1) bufAppend(", ");
  }
}

void ShowAbsyn::visitExp(Exp *p) {} //abstract class

void ShowAbsyn::visitETrue(ETrue *p)
{
  bufAppend("ETrue");
}
void ShowAbsyn::visitEFalse(EFalse *p)
{
  bufAppend("EFalse");
}
void ShowAbsyn::visitEInt(EInt *p)
{
  bufAppend('(');
  bufAppend("EInt");
  bufAppend(' ');
  visitInteger(p->integer_);
  bufAppend(')');
}
void ShowAbsyn::visitEDouble(EDouble *p)
{
  bufAppend('(');
  bufAppend("EDouble");
  bufAppend(' ');
  visitDouble(p->double_);
  bufAppend(')');
}
void ShowAbsyn::visitEString(EString *p)
{
  bufAppend('(');
  bufAppend("EString");
  bufAppend(' ');
  visitString(p->string_);
  bufAppend(')');
}
void ShowAbsyn::visitEId(EId *p)
{
  bufAppend('(');
  bufAppend("EId");
  bufAppend(' ');
  visitIdent(p->id_);
  bufAppend(')');
}
void ShowAbsyn::visitEApp(EApp *p)
{
  bufAppend('(');
  bufAppend("EApp");
  bufAppend(' ');
  visitIdent(p->id_);
  bufAppend(' ');
  bufAppend('[');
  if (p->listexp_)  p->listexp_->accept(this);
  bufAppend(']');
  bufAppend(' ');
  bufAppend(')');
}
void ShowAbsyn::visitETyped(ETyped *p)
{
  bufAppend('(');
  bufAppend("ETyped");
  bufAppend(' ');
/* Internal Category */
  bufAppend(' ');
  bufAppend('[');
  if (p->exp_)  p->exp_->accept(this);
  bufAppend(']');
  bufAppend(' ');
  bufAppend('[');
  if (p->type_)  p->type_->accept(this);
  bufAppend(']');
  bufAppend(' ');
  bufAppend(')');
}
void ShowAbsyn::visitEPIncr(EPIncr *p)
{
  bufAppend('(');
  bufAppend("EPIncr");
  bufAppend(' ');
  bufAppend('[');
  if (p->exp_)  p->exp_->accept(this);
  bufAppend(']');
  bufAppend(' ');
  bufAppend(')');
}
void ShowAbsyn::visitEPDecr(EPDecr *p)
{
  bufAppend('(');
  bufAppend("EPDecr");
  bufAppend(' ');
  bufAppend('[');
  if (p->exp_)  p->exp_->accept(this);
  bufAppend(']');
  bufAppend(' ');
  bufAppend(')');
}
void ShowAbsyn::visitEIncr(EIncr *p)
{
  bufAppend('(');
  bufAppend("EIncr");
  bufAppend(' ');
  bufAppend('[');
  if (p->exp_)  p->exp_->accept(this);
  bufAppend(']');
  bufAppend(')');
}
void ShowAbsyn::visitEDecr(EDecr *p)
{
  bufAppend('(');
  bufAppend("EDecr");
  bufAppend(' ');
  bufAppend('[');
  if (p->exp_)  p->exp_->accept(this);
  bufAppend(']');
  bufAppend(')');
}
void ShowAbsyn::visitETimes(ETimes *p)
{
  bufAppend('(');
  bufAppend("ETimes");
  bufAppend(' ');
  p->exp_1->accept(this);
  bufAppend(' ');
  p->exp_2->accept(this);
  bufAppend(')');
}
void ShowAbsyn::visitEDiv(EDiv *p)
{
  bufAppend('(');
  bufAppend("EDiv");
  bufAppend(' ');
  p->exp_1->accept(this);
  bufAppend(' ');
  p->exp_2->accept(this);
  bufAppend(')');
}
void ShowAbsyn::visitEPlus(EPlus *p)
{
  bufAppend('(');
  bufAppend("EPlus");
  bufAppend(' ');
  p->exp_1->accept(this);
  bufAppend(' ');
  p->exp_2->accept(this);
  bufAppend(')');
}
void ShowAbsyn::visitEMinus(EMinus *p)
{
  bufAppend('(');
  bufAppend("EMinus");
  bufAppend(' ');
  p->exp_1->accept(this);
  bufAppend(' ');
  p->exp_2->accept(this);
  bufAppend(')');
}
void ShowAbsyn::visitELt(ELt *p)
{
  bufAppend('(');
  bufAppend("ELt");
  bufAppend(' ');
  p->exp_1->accept(this);
  bufAppend(' ');
  p->exp_2->accept(this);
  bufAppend(')');
}
void ShowAbsyn::visitEGt(EGt *p)
{
  bufAppend('(');
  bufAppend("EGt");
  bufAppend(' ');
  p->exp_1->accept(this);
  bufAppend(' ');
  p->exp_2->accept(this);
  bufAppend(')');
}
void ShowAbsyn::visitELtEq(ELtEq *p)
{
  bufAppend('(');
  bufAppend("ELtEq");
  bufAppend(' ');
  p->exp_1->accept(this);
  bufAppend(' ');
  p->exp_2->accept(this);
  bufAppend(')');
}
void ShowAbsyn::visitEGtEq(EGtEq *p)
{
  bufAppend('(');
  bufAppend("EGtEq");
  bufAppend(' ');
  p->exp_1->accept(this);
  bufAppend(' ');
  p->exp_2->accept(this);
  bufAppend(')');
}
void ShowAbsyn::visitEEq(EEq *p)
{
  bufAppend('(');
  bufAppend("EEq");
  bufAppend(' ');
  p->exp_1->accept(this);
  bufAppend(' ');
  p->exp_2->accept(this);
  bufAppend(')');
}
void ShowAbsyn::visitENEq(ENEq *p)
{
  bufAppend('(');
  bufAppend("ENEq");
  bufAppend(' ');
  p->exp_1->accept(this);
  bufAppend(' ');
  p->exp_2->accept(this);
  bufAppend(')');
}
void ShowAbsyn::visitEAnd(EAnd *p)
{
  bufAppend('(');
  bufAppend("EAnd");
  bufAppend(' ');
  p->exp_1->accept(this);
  bufAppend(' ');
  p->exp_2->accept(this);
  bufAppend(')');
}
void ShowAbsyn::visitEOr(EOr *p)
{
  bufAppend('(');
  bufAppend("EOr");
  bufAppend(' ');
  p->exp_1->accept(this);
  bufAppend(' ');
  p->exp_2->accept(this);
  bufAppend(')');
}
void ShowAbsyn::visitEAss(EAss *p)
{
  bufAppend('(');
  bufAppend("EAss");
  bufAppend(' ');
  p->exp_1->accept(this);
  bufAppend(' ');
  p->exp_2->accept(this);
  bufAppend(')');
}
void ShowAbsyn::visitListExp(ListExp *listexp)
{
  for (ListExp::const_iterator i = listexp->begin() ; i != listexp->end() ; ++i)
  {
    (*i)->accept(this);
    if (i != listexp->end() - 1) bufAppend(", ");
  }
}

void ShowAbsyn::visitType(Type *p) {} //abstract class

void ShowAbsyn::visitType_bool(Type_bool *p)
{
  bufAppend("Type_bool");
}
void ShowAbsyn::visitType_int(Type_int *p)
{
  bufAppend("Type_int");
}
void ShowAbsyn::visitType_double(Type_double *p)
{
  bufAppend("Type_double");
}
void ShowAbsyn::visitType_void(Type_void *p)
{
  bufAppend("Type_void");
}
void ShowAbsyn::visitType_string(Type_string *p)
{
  bufAppend("Type_string");
}
void ShowAbsyn::visitListId(ListId *listid)
{
  for (ListId::const_iterator i = listid->begin() ; i != listid->end() ; ++i)
  {
    visitId(*i) ;
    if (i != listid->end() - 1) bufAppend(", ");
  }
}

void ShowAbsyn::visitInteger(Integer i)
{
  char tmp[16];
  sprintf(tmp, "%d", i);
  bufAppend(tmp);
}
void ShowAbsyn::visitDouble(Double d)
{
  char tmp[16];
  sprintf(tmp, "%g", d);
  bufAppend(tmp);
}
void ShowAbsyn::visitChar(Char c)
{
  bufAppend('\'');
  bufAppend(c);
  bufAppend('\'');
}
void ShowAbsyn::visitString(String s)
{
  bufAppend('\"');
  bufAppend(s);
  bufAppend('\"');
}
void ShowAbsyn::visitIdent(String s)
{
  bufAppend('\"');
  bufAppend(s);
  bufAppend('\"');
}

void ShowAbsyn::visitId(String s)
{
  bufAppend('\"');
  bufAppend(s);
  bufAppend('\"');
}



