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
module lang::ql::\syntax::Comment

//extend lang::ql::\syntax::Expressions;

syntax Comment 
  = MultLine
  | SingleLine 
  ;

syntax SingleLine
  = only: OnlySingle
  | embed: StartSingle TailSingle
  ;
  
  
lexical OnlySingle = @category="Comment" "//" SingleChar* $ ;

lexical StartSingle = @category="Comment" "//" SingleChar* [\<] ;
  
syntax TailSingle
  = Expr expr MidSingle TailSingle
  | Expr expr EndSingle
  ;
  
lexical MidSingle = @category="Comment" [\>] SingleChar* [\<] ;
  
lexical EndSingle = @category="Comment" [\>] SingleChar* $ ;

lexical SingleChar
 = ![\n\<\>]
 | [\\][\<\>]
 ;

syntax MultLine
  = only: OnlyComment
  | embed: StartComment TailComment
  ;
  
  
syntax TailComment
  = Expr expr MidComment TailComment
  | Expr expr EndComment
  ;

lexical OnlyComment = @category="Comment" "/*" CommentChar* "*/" ;

lexical StartComment = @category="Comment" "/*" CommentChar* [\<] ;

lexical EndComment = @category="Comment" [\>] CommentChar* "*/" ;

lexical MidComment = @category="Comment" [\>] CommentChar* [\<] ;

lexical CommentChar
  = ![\<\>*]
  | [*] !>> [/]
  | [\\][\<\>]
  ;
  
  

