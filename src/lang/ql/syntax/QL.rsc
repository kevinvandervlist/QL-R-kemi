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

module lang::ql::\syntax::QL

extend lang::ql::\syntax::Boolean;
extend lang::ql::\syntax::Comment;
extend lang::ql::\syntax::\Date;
extend lang::ql::\syntax::Int;
extend lang::ql::\syntax::Keyword;
extend lang::ql::\syntax::Layout;
extend lang::ql::\syntax::Money;
extend lang::ql::\syntax::String;
extend lang::ql::\syntax::Type;
extend lang::ql::\syntax::Ident;
extend lang::ql::\syntax::Expressions;

start syntax Form = 
  @Foldable form: "form" IdentDefinition formName "{" Statement+ formElements "}";

syntax Statement 
  = question: Question question
  | ifCondition: IfPart ifPart ElsIfPart* elseIfs ElsePart? elsePart
  ;

syntax Conditional = conditional: Expr condition "{" Statement+ body "}" ;

syntax IfPart =  @Foldable "if" Conditional ifPart;

syntax ElsIfPart = @Foldable "else" "if" Conditional elsePart;

syntax ElsePart = @Foldable elsePart: "else" "{" Statement+ body "}";

// What the ...?! Colons don't work, but equals signs do...
start syntax Question 
  = question: QuestionText questionText Type answerDataType IdentDefinition answerIdentifier
  | question: QuestionText questionText Type answerDataType IdentDefinition answerIdentifier "=" Expr calculatedField
  ;

lexical IdentDefinition = identDefinition: Ident ident;

lexical QuestionText = @category="Identifier" questionText: String questionText ;
