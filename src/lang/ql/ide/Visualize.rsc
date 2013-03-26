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
import lang::ql::compiler::PrettyPrinter;
import ParseTree;
import List;
import util::Editors;
import vis::KeySym;

Figure form2figure(Form f) {
  ns = [];
  es = [];

  str idOf(Conditional c) = "id_<(c.body[0]@location).offset>";
  str idOf(Statement s) = "id_<(s@location).offset>";

  top-down visit (f) {
    case form(_, ss): {
      if (ss != []) {
        cur = idOf(ss[0]);
        for (s <- ss[1..]) {
          es += [edge(cur, idOf(s))];
          cur = idOf(s);
        }
      }
    }
    case q:question(question(txt, at, n)): 
       ns += [box(text("<unquote(txt.text)>\n<n.ident>: <at.name>"),
        onMouseDown(bool (int butnr, map[KeyModifier,bool] modifiers) {
          edit(q@location, [highlight(q@location.begin.line, unquote(txt.text))]);
		  return true;
	    }),
        id(idOf(q)), resizable(false))];

    case q:question(question(txt, at, n, e)):
       ns += [box(text("<unquote(txt.text)>\n<n.ident> = <prettyPrint(e)>"),
               onMouseDown(bool (int butnr, map[KeyModifier,bool] modifiers) {
          edit(q@location, [highlight(q@location.begin.line, unquote(txt.text))]);
		  return true;
	    }),
       id(idOf(q)), resizable(false))];

    case q:ifCondition(c, eifs, ep): {
       x = idOf(q);
       ns += [ellipse(id(x))];
       for (b <- [c, *eifs]) {
         es += [edge(x, idOf(b), label(text(prettyPrint(b.condition))))];
         cur = idOf(b);
         for (size(b.body) > 1, s <- b.body[1..]) {
           es += [edge(cur, idOf(s))];
           cur = idOf(s);
         }
       }
       if (ep != [] && ep[0].body != []) {
         ess = ep[0].body;
         es += [edge(x, idOf(ess[0]), label(text("otherwise")))];
         cur = idOf(ess[0]);
         for (size(ess) > 1, s <- ess[1..]) {
           es += [edge(cur, idOf(s))];
           cur = idOf(s);
         }
       }
     }
  } 
  return graph(ns, es, gap(50.0,50.0), hint("layered"), orientation(topDown()));
}


str unquote(str s) = s[1..-1];