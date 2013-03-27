@license{
  Copyright (c) 2013 
  All rights reserved. This program and the accompanying materials
  are made available under the terms of the Eclipse Public License v1.0
  which accompanies this distribution, and is available at
  http://www.eclipse.org/legal/epl-v10.html
}
@contributor{Tijs van der Storm - storm@cwi.nl}
module lang::ql::ide::CrossRef

import lang::ql::\syntax::QL;
import ParseTree;

Tree xref(Tree t) = xref(t, definitions(t));

Tree xref(Tree f, map[str,loc] defs) {
  return visit (f) {
    case Expr e => e[@link=defs["<e>"]]
      when e is ident, "<e>" in defs 
  }
}

map[str,loc] definitions(Tree f) {
  defs = ();
  visit (f) {
    case Question q: 
      defs["<q.answerIdentifier>"] = q@\loc;
  }
  return defs;
}
