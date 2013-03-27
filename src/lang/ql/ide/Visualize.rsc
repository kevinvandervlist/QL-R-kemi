@license{
  Copyright (c) 2013 
  All rights reserved. This program and the accompanying materials
  are made available under the terms of the Eclipse Public License v1.0
  which accompanies this distribution, and is available at
  http://www.eclipse.org/legal/epl-v10.html
}
@contributor{Tijs van der Storm - storm@cwi.nl}
module lang::ql::ide::Visualize

import vis::Figure;

import lang::ql::ast::AST;
import lang::ql::analysis::CFlow;
import lang::ql::compiler::PrettyPrinter;
import ParseTree;
import List;
import util::Editors;
import vis::KeySym;
import IO;

str idOf(CF::split(i)) = "<i>";
str idOf(stat(i, _)) = "<i>";
str idOf(entry()) = "entry";
str idOf(exit()) = "exit";
str idOf(dummy(i)) = "dummy_<id>";

private FProperty FONT = font("Monospaced");
private FProperty FONT_SIZE = fontSize(10);
private FProperty TO_ARROW = toArrow(triangle(5));

FProperty onClick(Question q, QuestionText txt) =
    onMouseDown(bool (int butnr, map[KeyModifier,bool] modifiers) {
          edit(q@location, [highlight(q@location.begin.line, unquote(txt.text))]);
          return true;
        });


list[Figure] getNodes(DecisionGraph g) {
  ns = g<0> + g<2>;
  fns = [ ellipse(id(idOf(s)), resizable(false), width(4), height(4)) | s:split(int i) <- ns ];
  fns += [ box(text("<x.ident>: <at.name>", FONT, FONT_SIZE), id(idOf(s)), resizable(false), gap(5), onClick(q, txt)) 
           | s:stat(int i, q:question(txt, Type at, x)) <- ns ];
  fns += [ ellipse(text("<x.ident> =\n<prettyPrint(e)>", FONT, FONT_SIZE), id(idOf(s)), resizable(false), onClick(q, txt)) 
           | s:stat(int i, q:question(txt, _, x, e)) <- ns ];
  fns += [ ellipse(id(idOf(s)), resizable(false), width(10), height(10), fillColor("red")) | s <- ns, (s is entry || s is exit)];
  fns += [ ellipse(id(idOf(s))) | s:dummy(_) <- ns ];
  return fns;
}

Edges getEdges(DecisionGraph g) {
  es = [];
  es += [ edge(idOf(a), idOf(b), TO_ARROW) | <a, none(), b> <- g ];
  es += [ edge(idOf(a), idOf(b), label(text(prettyPrint(e), FONT, FONT_SIZE)), TO_ARROW)
          | <a, cond(e), b> <- g, bprintln("label = <prettyPrint(e)>") ];
  es += [ edge(idOf(a), idOf(b), label(text("otherwise", FONT, FONT_SIZE)), TO_ARROW)
          | <a, \else(), b> <- g ];
  return es;
}

Figure form2figure(Form f) {
  cfg = cflow(f);
  ns = getNodes(cfg.graph);
  es = getEdges(cfg.graph);
  return graph(ns, es, gap(50.0,50.0), hint("layered"), orientation(topDown()));
}


str unquote(str s) = s[1..-1];