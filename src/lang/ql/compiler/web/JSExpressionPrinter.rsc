@license{
  Copyright (c) 2013 
  All rights reserved. This program and the accompanying materials
  are made available under the terms of the Eclipse Public License v1.0
  which accompanies this distribution, and is available at
  http://www.eclipse.org/legal/epl-v10.html
}
@contributor{Kevin van der Vlist - kevin@kevinvandervlist.nl}
@contributor{Jimi van der Woning - Jimi.vanderWoning@student.uva.nl}

module lang::ql::compiler::web::JSExpressionPrinter

import String;
import lang::ql::\ast::AST;

// Note: Because this is generated code, we add parentheses anyway. 
// It is not worthwile to minimize those as we do in the normal prettyprinter.
str jsPrint(pos(Expr posValue)) = "(+<jsPrint(posValue)>)";

str jsPrint(neg(Expr negValue)) = "(-<jsPrint(negValue)>)";

str jsPrint(not(Expr notValue)) = "(!<jsPrint(notValue)>)";

str jsPrint(mul(multiplicand, multiplier)) =
  "(<jsPrint(multiplicand)> * <jsPrint(multiplier)>)";

str jsPrint(div(numerator, denominator)) =
  "(<jsPrint(numerator)> / <jsPrint(denominator)>)";

str jsPrint(add(leftAddend, rightAddend)) =
  "(<jsPrint(leftAddend)> + <jsPrint(rightAddend)>)";

str jsPrint(sub(minuend, subtrahend)) =
  "(<jsPrint(minuend)> - <jsPrint(subtrahend)>)";

str jsPrint(lt(left, right)) = "(<jsPrint(left)> \< <jsPrint(right)>)";

str jsPrint(leq(left, right)) = "(<jsPrint(left)> \<= <jsPrint(right)>)";

str jsPrint(gt(left, right)) = "(<jsPrint(left)> \> <jsPrint(right)>)";

str jsPrint(geq(left, right)) = "(<jsPrint(left)> \>= <jsPrint(right)>)";

str jsPrint(equ(left, right)) = "(<jsPrint(left)> == <jsPrint(right)>)";

str jsPrint(neq(left, right)) = "(<jsPrint(left)> != <jsPrint(right)>)";

str jsPrint(and(left, right)) = "(<jsPrint(left)> && <jsPrint(right)>)";

str jsPrint(or(left, right)) = "(<jsPrint(left)> || <jsPrint(right)>)";

str jsPrint(ident(name)) = "<name>";

str jsPrint(\int(intValue)) = "<intValue>";

str jsPrint(money(moneyValue)) = "<moneyValue>";

str jsPrint(boolean(booleanValue)) = "<booleanValue>";

str jsPrint(date(dateValue)) = "\"<substring(dateValue, 1)>\"";

str jsPrint(string(text)) = "<text>";
