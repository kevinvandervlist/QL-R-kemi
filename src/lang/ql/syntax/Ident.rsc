module lang::ql::\syntax::Ident

//extend lang::ql::\syntax::Keyword;

syntax Ident
  = @category="Variable" IdentLexical \ Keywords
  | @category="Variable" ("\\" IdentLexical)
  ;
  
lexical IdentLexical
  = [a-z A-Z 0-9 _] !<< [a-z A-Z][a-z A-Z 0-9 _]* !>> [a-z A-Z 0-9 _]
  ;
  