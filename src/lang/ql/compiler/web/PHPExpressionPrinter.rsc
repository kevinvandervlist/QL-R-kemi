@license{
  Copyright (c) 2013 
  All rights reserved. This program and the accompanying materials
  are made available under the terms of the Eclipse Public License v1.0
  which accompanies this distribution, and is available at
  http://www.eclipse.org/legal/epl-v10.html
}
@contributor{Kevin van der Vlist - kevin@kevinvandervlist.nl}
@contributor{Jimi van der Woning - Jimi.vanderWoning@student.uva.nl}

module lang::ql::compiler::web::PHPExpressionPrinter

import String;
import lang::ql::\ast::AST;

// Note: Because this is generated code, we add parentheses anyway. 
// It is not worthwile to minimize those as we do in the normal prettyprinter.
str phpPrint(pos(Expr posValue)) = "(+<phpPrint(posValue)>)";

str phpPrint(neg(Expr negValue)) = "(-<phpPrint(negValue)>)";

str phpPrint(not(Expr notValue)) = "(!<phpPrint(notValue)>)";

str phpPrint(mul(multiplicand, multiplier)) =
  "(<phpPrint(multiplicand)> * <phpPrint(multiplier)>)";

str phpPrint(div(numerator, denominator)) =
  "(<phpPrint(numerator)> / <phpPrint(denominator)>)";

str phpPrint(add(leftAddend, rightAddend)) =
  "(<phpPrint(leftAddend)> + <phpPrint(rightAddend)>)";

str phpPrint(sub(minuend, subtrahend)) =
  "(<phpPrint(minuend)> - <phpPrint(subtrahend)>)";

str phpPrint(lt(left, right)) = "(<phpPrint(left)> \< <phpPrint(right)>)";

str phpPrint(leq(left, right)) = "(<phpPrint(left)> \<= <phpPrint(right)>)";

str phpPrint(gt(left, right)) = "(<phpPrint(left)> \> <phpPrint(right)>)";

str phpPrint(geq(left, right)) = "(<phpPrint(left)> \>= <phpPrint(right)>)";

str phpPrint(equ(left, right)) = "(<phpPrint(left)> == <phpPrint(right)>)";

str phpPrint(neq(left, right)) = "(<phpPrint(left)> != <phpPrint(right)>)";

str phpPrint(and(left, right)) = "(<phpPrint(left)> && <phpPrint(right)>)";

str phpPrint(or(left, right)) = "(<phpPrint(left)> || <phpPrint(right)>)";

str phpPrint(ident(name)) = "<name>";

str phpPrint(\int(intValue)) = "<intValue>";

str phpPrint(money(moneyValue)) = "<moneyValue>";

str phpPrint(boolean(booleanValue)) = "<booleanValue>";

str phpPrint(date(dateValue)) = "\"<substring(dateValue, 1)>\"";

str phpPrint(string(text)) = "<text>";
