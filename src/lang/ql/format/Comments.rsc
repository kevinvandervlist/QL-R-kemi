module lang::ql::format::Comments

import lang::ql::\syntax::QL;
import ParseTree;
import IO;
import List;

// TODO: this should all be generic and based on IUPTR


list[str] getComments(Tree t) 
  = [ unparse(c) | /Comment c := t ];

list[list[str]] commentsForTree(Tree t) {
  i = 1;
  return while (i < size(t.args) - 1) {
    append getComments(t.args[i]);
    i += 2;
  }
}

list[list[str]] commentsForStartTree(Tree t) 
  = [getComments(t.args[0]), getComments(t.args[2])];

void printAllComments(Tree t) {
  visit(t) {
    case Conditional x: println("<unparse(x.condition)>: <commentsForTree(x)>");
  }
}