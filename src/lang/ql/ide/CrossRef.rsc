module lang::ql::ide::CrossRef

import lang::ql::\syntax::QL;
import ParseTree;
import IO;


Tree xref(Tree t) = xref(t, definitions(t));

Tree xref(Tree f, map[str,loc] defs) {
  return visit (f) {
    case Expr e => e[@link=defs["<e>"]]
      when e is ident, "<e>" in defs, bprintln("e = <e>") 
    //case a:appl(prod(layouts(_), _, _), kids) =>
    //  a[args=[ xref(x, defs) | x <- kids ]]
  }
}

map[str,loc] definitions(Tree f) {
  println("Collecting defs");
  defs = ();
  visit (f) {
    case Question q: {
      println("Updating loc of <q.answerIdentifier>");
      defs["<q.answerIdentifier>"] = q@\loc;
    }
  }
  return defs;
}
