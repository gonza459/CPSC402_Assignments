/*** BNFC-Generated Visitor Design Pattern Skeleton. ***/
/* This implements the common visitor design pattern.
   Note that this method uses Visitor-traversal of lists, so
   List->accept() does NOT traverse the list. This allows different
   algorithms to use context information differently. */

#include "Skeleton.H"



void Skeleton::visitProgram(Program *t) {} //abstract class
void Skeleton::visitDef(Def *t) {} //abstract class
void Skeleton::visitArg(Arg *t) {} //abstract class
void Skeleton::visitStm(Stm *t) {} //abstract class
void Skeleton::visitExp(Exp *t) {} //abstract class
void Skeleton::visitType(Type *t) {} //abstract class

void Skeleton::visitPDefs(PDefs *p_defs)
{
  /* Code For PDefs Goes Here */

  p_defs->listdef_->accept(this);

}

void Skeleton::visitDFun(DFun *d_fun)
{
  /* Code For DFun Goes Here */

  d_fun->type_->accept(this);
  visitId(d_fun->id_);
  d_fun->listarg_->accept(this);
  d_fun->liststm_->accept(this);

}

void Skeleton::visitADecl(ADecl *a_decl)
{
  /* Code For ADecl Goes Here */

  a_decl->type_->accept(this);
  visitId(a_decl->id_);

}

void Skeleton::visitSExp(SExp *s_exp)
{
  /* Code For SExp Goes Here */

  s_exp->exp_->accept(this);

}

void Skeleton::visitSDecls(SDecls *s_decls)
{
  /* Code For SDecls Goes Here */

  s_decls->type_->accept(this);
  s_decls->listid_->accept(this);

}

void Skeleton::visitSInit(SInit *s_init)
{
  /* Code For SInit Goes Here */

  s_init->type_->accept(this);
  visitId(s_init->id_);
  s_init->exp_->accept(this);

}

void Skeleton::visitSReturn(SReturn *s_return)
{
  /* Code For SReturn Goes Here */

  s_return->exp_->accept(this);

}

void Skeleton::visitSReturnVoid(SReturnVoid *s_return_void)
{
  /* Code For SReturnVoid Goes Here */


}

void Skeleton::visitSWhile(SWhile *s_while)
{
  /* Code For SWhile Goes Here */

  s_while->exp_->accept(this);
  s_while->stm_->accept(this);

}

void Skeleton::visitSBlock(SBlock *s_block)
{
  /* Code For SBlock Goes Here */

  s_block->liststm_->accept(this);

}

void Skeleton::visitSIfElse(SIfElse *s_if_else)
{
  /* Code For SIfElse Goes Here */

  s_if_else->exp_->accept(this);
  s_if_else->stm_1->accept(this);
  s_if_else->stm_2->accept(this);

}

void Skeleton::visitETrue(ETrue *e_true)
{
  /* Code For ETrue Goes Here */


}

void Skeleton::visitEFalse(EFalse *e_false)
{
  /* Code For EFalse Goes Here */


}

void Skeleton::visitEInt(EInt *e_int)
{
  /* Code For EInt Goes Here */

  visitInteger(e_int->integer_);

}

void Skeleton::visitEDouble(EDouble *e_double)
{
  /* Code For EDouble Goes Here */

  visitDouble(e_double->double_);

}

void Skeleton::visitEString(EString *e_string)
{
  /* Code For EString Goes Here */

  visitString(e_string->string_);

}

void Skeleton::visitEId(EId *e_id)
{
  /* Code For EId Goes Here */

  visitId(e_id->id_);

}

void Skeleton::visitEApp(EApp *e_app)
{
  /* Code For EApp Goes Here */

  visitId(e_app->id_);
  e_app->listexp_->accept(this);

}

void Skeleton::visitEPIncr(EPIncr *ep_incr)
{
  /* Code For EPIncr Goes Here */

  ep_incr->exp_->accept(this);

}

void Skeleton::visitEPDecr(EPDecr *ep_decr)
{
  /* Code For EPDecr Goes Here */

  ep_decr->exp_->accept(this);

}

void Skeleton::visitEIncr(EIncr *e_incr)
{
  /* Code For EIncr Goes Here */

  e_incr->exp_->accept(this);

}

void Skeleton::visitEDecr(EDecr *e_decr)
{
  /* Code For EDecr Goes Here */

  e_decr->exp_->accept(this);

}

void Skeleton::visitETimes(ETimes *e_times)
{
  /* Code For ETimes Goes Here */

  e_times->exp_1->accept(this);
  e_times->exp_2->accept(this);

}

void Skeleton::visitEDiv(EDiv *e_div)
{
  /* Code For EDiv Goes Here */

  e_div->exp_1->accept(this);
  e_div->exp_2->accept(this);

}

void Skeleton::visitEPlus(EPlus *e_plus)
{
  /* Code For EPlus Goes Here */

  e_plus->exp_1->accept(this);
  e_plus->exp_2->accept(this);

}

void Skeleton::visitEMinus(EMinus *e_minus)
{
  /* Code For EMinus Goes Here */

  e_minus->exp_1->accept(this);
  e_minus->exp_2->accept(this);

}

void Skeleton::visitELt(ELt *e_lt)
{
  /* Code For ELt Goes Here */

  e_lt->exp_1->accept(this);
  e_lt->exp_2->accept(this);

}

void Skeleton::visitEGt(EGt *e_gt)
{
  /* Code For EGt Goes Here */

  e_gt->exp_1->accept(this);
  e_gt->exp_2->accept(this);

}

void Skeleton::visitELtEq(ELtEq *e_lt_eq)
{
  /* Code For ELtEq Goes Here */

  e_lt_eq->exp_1->accept(this);
  e_lt_eq->exp_2->accept(this);

}

void Skeleton::visitEGtEq(EGtEq *e_gt_eq)
{
  /* Code For EGtEq Goes Here */

  e_gt_eq->exp_1->accept(this);
  e_gt_eq->exp_2->accept(this);

}

void Skeleton::visitEEq(EEq *e_eq)
{
  /* Code For EEq Goes Here */

  e_eq->exp_1->accept(this);
  e_eq->exp_2->accept(this);

}

void Skeleton::visitENEq(ENEq *en_eq)
{
  /* Code For ENEq Goes Here */

  en_eq->exp_1->accept(this);
  en_eq->exp_2->accept(this);

}

void Skeleton::visitEAnd(EAnd *e_and)
{
  /* Code For EAnd Goes Here */

  e_and->exp_1->accept(this);
  e_and->exp_2->accept(this);

}

void Skeleton::visitEOr(EOr *e_or)
{
  /* Code For EOr Goes Here */

  e_or->exp_1->accept(this);
  e_or->exp_2->accept(this);

}

void Skeleton::visitEAss(EAss *e_ass)
{
  /* Code For EAss Goes Here */

  e_ass->exp_1->accept(this);
  e_ass->exp_2->accept(this);

}

void Skeleton::visitETyped(ETyped *e_typed)
{
  /* Code For ETyped Goes Here */

  e_typed->exp_->accept(this);
  e_typed->type_->accept(this);

}

void Skeleton::visitType_bool(Type_bool *type_bool)
{
  /* Code For Type_bool Goes Here */


}

void Skeleton::visitType_int(Type_int *type_int)
{
  /* Code For Type_int Goes Here */


}

void Skeleton::visitType_double(Type_double *type_double)
{
  /* Code For Type_double Goes Here */


}

void Skeleton::visitType_void(Type_void *type_void)
{
  /* Code For Type_void Goes Here */


}

void Skeleton::visitType_string(Type_string *type_string)
{
  /* Code For Type_string Goes Here */


}


void Skeleton::visitListDef(ListDef *list_def)
{
  for (ListDef::iterator i = list_def->begin() ; i != list_def->end() ; ++i)
  {
    (*i)->accept(this);
  }
}

void Skeleton::visitListArg(ListArg *list_arg)
{
  for (ListArg::iterator i = list_arg->begin() ; i != list_arg->end() ; ++i)
  {
    (*i)->accept(this);
  }
}

void Skeleton::visitListStm(ListStm *list_stm)
{
  for (ListStm::iterator i = list_stm->begin() ; i != list_stm->end() ; ++i)
  {
    (*i)->accept(this);
  }
}

void Skeleton::visitListExp(ListExp *list_exp)
{
  for (ListExp::iterator i = list_exp->begin() ; i != list_exp->end() ; ++i)
  {
    (*i)->accept(this);
  }
}

void Skeleton::visitListId(ListId *list_id)
{
  for (ListId::iterator i = list_id->begin() ; i != list_id->end() ; ++i)
  {
    visitId(*i) ;
  }
}


void Skeleton::visitId(Id x)
{
  /* Code for Id Goes Here */
}

void Skeleton::visitInteger(Integer x)
{
  /* Code for Integer Goes Here */
}

void Skeleton::visitChar(Char x)
{
  /* Code for Char Goes Here */
}

void Skeleton::visitDouble(Double x)
{
  /* Code for Double Goes Here */
}

void Skeleton::visitString(String x)
{
  /* Code for String Goes Here */
}

void Skeleton::visitIdent(Ident x)
{
  /* Code for Ident Goes Here */
}



