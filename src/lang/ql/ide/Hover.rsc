module lang::ql::ide::Hover

import lang::ql::compiler::PrettyPrinter;
import lang::ql::util::ParseHelper;
import lang::ql::\syntax::QL;
import ParseTree;
import IO;

Tree addDocLinks(Tree t) = addDocLinks(t, questions(t));

Tree addDocLinks(Tree f, map[str,Question] qs) {
  return visit (f) {
    case Expr e => e[name=e.name[@doc=prettyPrint(implodeQuestion(qs["<e>"]))]]
      when e is ident, "<e>" in qs 
  }
}


map[str,Question] questions(Tree f) {
  qs = ();
  visit (f) {
    case Question q: 
      qs["<q.answerIdentifier>"] = q;
  }
  return qs;
}