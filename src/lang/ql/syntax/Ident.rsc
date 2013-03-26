module lang::ql::\syntax::Ident

syntax Ident
  = @category="Variable" IdentLexical \ Keywords
  | @category="Variable" ("\\" IdentLexical)
  ;