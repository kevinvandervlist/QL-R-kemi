@license{
  Copyright (c) 2013 
  All rights reserved. This program and the accompanying materials
  are made available under the terms of the Eclipse Public License v1.0
  which accompanies this distribution, and is available at
  http://www.eclipse.org/legal/epl-v10.html
}
@contributor{Kevin van der Vlist - kevin@kevinvandervlist.nl}
@contributor{Jimi van der Woning - Jimi.vanderWoning@student.uva.nl}
@contributor{Tijs van der Storm - storm@cwi.nl}

module lang::ql::\util::\ParseHelper

import IO;
import \ParseTree;
import lang::ql::\ast::AST;

import lang::ql::\syntax::QL;

Form implode(Tree t) = implode(#Form, t);

Expr implodeExpr(Tree t) = implode(#Expr, t);

Question implodeQuestion(Tree t) = implode(#Question, t);


start[Form] parse(str src, loc l) = parse(#start[Form], src, l);

Expr parseExpr(str src) = 
  implode(#lang::ql::\ast::AST::Expr, parse(#lang::ql::\syntax::QL::Expr, src, 
    |file:///-|));

Tree justParseExpr(str src) = 
  parse(#lang::ql::\syntax::QL::Expr, src, |file:///-|);


Question parseQuestion(str src) = 
  implode(#lang::ql::\ast::AST::Question, parse(#lang::ql::\syntax::QL::Question, 
    src, |file:///-|));
  
Form parseForm(str src) = 
  implode(#lang::ql::\ast::AST::Form, parse(#start[Form], src, |file:///-|));
  
Form parseForm(loc f) = 
  implode(#lang::ql::\ast::AST::Form, parse(#start[Form], f));

  
start[Form] justParseForm(loc f) = parse(#start[Form], f);
  