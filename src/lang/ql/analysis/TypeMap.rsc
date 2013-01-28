module lang::ql::analysis::TypeMap

import lang::ql::ast::AST;
import util::IDE;

public alias typeMap = map[str ident, str \type];
public alias typeMapMessages = tuple[typeMap \map, set[Message] messages];

public typeMapMessages createTypeMap(Form form) {
  typeMap typeMap = ();
  messages = {};
  for(e <- form.formElements) {
    <tm, ms> = createTypeMap(typeMap, e);
    messages += ms;
    typeMap += tm;
  }
  return <typeMap, messages>;
}

private typeMapMessages createTypeMap(typeMap tm, Statement item: question(Question question)) = 
  createTypeMap(tm, question);

private typeMapMessages createTypeMap(typeMap tm, Question q: 
  question(questionText, answerDataType, answerIdentifier)) =
    processIdentifier(answerIdentifier, answerDataType, q@location, tm);

private typeMapMessages createTypeMap(typeMap tm, Question q: 
  question(questionText, answerDataType, answerIdentifier, calculatedField)) =
    processIdentifier(answerIdentifier, answerDataType, q@location, tm);


private typeMapMessages createTypeMap(typeMap tm, Statement item: 
  ifCondition(Conditional ifPart, list[Conditional] elseIfs, list[ElsePart] elsePart)) {
  
  messages = {};
  
  list[Statement] stmts = ifPart.body + 
    [e | ei <- elseIfs, e <- ei.body] +
    [e | ep <- elsePart, e <- ep.body];
   
  for(e <- stmts) {
    <t, ms> = createTypeMap(tm, e);
    messages += ms;
    tm += t;
  }
   
  return <tm, messages>;
}

private Message typeError(name, \loc) 
  = error("Identifier <name> is already declared", \loc);

private typeMapMessages processIdentifier(str ident, str \type, loc \loc, typeMap tm) {
  if(ident notin tm) {
    t = tm[ident] = \type;
    return <t, {}>;
  }    

  if(tm[ident] != \type) {
    return <tm, {typeError(ident, \loc)}>;
  }
  
  return <tm, {}>;
} 