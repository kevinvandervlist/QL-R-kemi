@license{
  Copyright (c) 2013 
  All rights reserved. This program and the accompanying materials
  are made available under the terms of the Eclipse Public License v1.0
  which accompanies this distribution, and is available at
  http://www.eclipse.org/legal/epl-v10.html
}
@contributor{Tijs van der Storm - storm@cwi.nl}
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
    case TailSingle c:
      msgs += analyzeExpression(sas, implodeExpr(c.expr));
  }
  return msgs;
}

