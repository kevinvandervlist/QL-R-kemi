module lang::ql::analysis::CFlow

import lang::ql::ast::AST;
import List;

data CF
 = entry()
 | exit()
 | split(int id)
 | stat(int id, Question question)
 | dummy(int id)
 ;


alias DecisionGraph
 = rel[CF from, Label label, CF to];

data Label
 = none()
 | \else()
 | cond(Expr expr)
 ;

alias CFGraph
 = tuple[set[CF] entry, DecisionGraph graph,
         set[CF] exit];

DecisionGraph product(set[CF] xs, set[CF] ys)
  = { <x, none(), y> | x <- xs, y <- ys };


CFGraph cflow(form(_, ss)) {
  cf = cflow(ss);
  en = {entry()};
  ex = {exit()};
  return <en, product(en, cf.entry) + product(cf.exit, ex) + cf.graph, ex>;
}

CFGraph cflow(Statement::question(Question q)) {
  s = stat(q@location.offset, q);
  return <{s}, {}, {s}>;
}

CFGraph cflow(list[Statement] stats) {
  if (size(stats) == 1) {
    return cflow(stats[0]);
  }
  cf1 = cflow(stats[0]);
  cf2 = cflow(tail(stats));
  return < cf1.entry, cf1.graph + cf2.graph
       + product(cf1.exit, cf2.entry), cf2.exit >;
}

CFGraph cflow(i:ifCondition(conditional(c1, b1), eifs, [])) 
  = cflow(ifCondition(conditional(c1, b1), eifs, [elsePart([])])[@location=i@location])
  ;

CFGraph cflow(i:ifCondition(conditional(c1, b1), eifs, [elsePart(b2)])) {
  cfs = {<c1, cflow(b1)>}; 
  cfs += {<c, cflow(b)> | conditional(c, b) <- eifs };
  e = split(i@location.offset);
  g = {<e, cond(c), cfe> | <c, CFGraph cf> <- cfs, cfe <- cf.entry };
  g += ( {} | it + cf.graph | <_, CFGraph cf> <- cfs );
  exs =  ( {} | it + cf.exit | <_, CFGraph cf> <- cfs );
  if (b2 != []) {
    cfElse = cflow(b2);
    g += { <e, none(), cfe> | cfe <- cfElse.entry };
    g += cfElse.graph;
    exs += cfElse.exit;
  }
  else {
    //d = dummy(i@location.offset);
    //g += {<e, \else(), e>};
    exs += {e};
  }
  return <{e}, g, exs>;  
}
