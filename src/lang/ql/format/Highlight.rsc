module lang::ql::format::Highlight

import lang::ql::\syntax::QL;
import lang::ql::format::Comments;

import lang::box::util::Box;
import String;

start syntax Form = 
  @Foldable form: "form" IdentDefinition formName "{" Statement+ formElements "}";

syntax Statement 
  = question: Question question
  | ifCondition: IfPart ifPart ElsIfPart* elseIfs ElsePart? elsePart
  ;

syntax Conditional 
  = conditional: Expr condition "{" Statement+ body "}"
  ;

syntax IfPart = 
  @Foldable "if" Conditional ifPart;

syntax ElsIfPart = 
  @Foldable "else" "if" Conditional elsePart;

syntax ElsePart = 
  @Foldable elsePart: "else" "{" Statement+ body "}";

public list[Box] highlight(Form t) {
  visit (t) {
    case Form f: [KW("form"), VAR(L(f.formName)), L("{")];
    case String t: bs += [STRING(unparse(t))];
    case Tree t:
      ; // generate unparsed text and comments 
  }
}

list[Box] highlightLayout(Tree t) {
    switch (t) {
        case a:appl(prod(_, _, {_*, \tag("category"("Comment"))}), _):
            return [COMM(L(unparse(a)))];
            
        case appl(_, as):
            return [ *highlightLayout(a) | a <- as ];
            
        case char(n):
            return [L(stringChar(n))];
            
        default:
            throw "Unhandled tree: <t>";
    }
}
