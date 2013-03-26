module lang::ql::analysis::CommentCheck

import lang::ql::\syntax::QL;
import Message;

import lang::ql::analysis::Expression;
import lang::ql::analysis::State;
import ParseTree;
import lang::ql::util::ParseHelper;


set[Message] checkComments(SAS sas, Tree t) {
  msgs = {};
  visit (t) {
    case TailComment c:
      msgs += analyzeExpression(sas, implodeExpr(c.expr));
  }
  return msgs;
}

