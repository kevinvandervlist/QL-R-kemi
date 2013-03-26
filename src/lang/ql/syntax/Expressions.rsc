module lang::ql::\syntax::Expressions

//extend lang::ql::\syntax::Ident;
//extend lang::ql::\syntax::Boolean;
//extend lang::ql::\syntax::Int;
//extend lang::ql::\syntax::Money;
//extend lang::ql::\syntax::Date;
//extend lang::ql::\syntax::String;

syntax Expr
  = ident: Ident name
  |  \int: Int number
  | money: Money monetaryValue
  | boolean: Boolean truthValue
  | date: Date date
  | string: String text
  | bracket "(" Expr expression ")"
  | pos: "+" Expr pos
  | neg: "-" Expr neg
  | not: "!" Expr not
  > left (
      mul: Expr multiplicand "*" Expr multiplier
    | div: Expr numerator "/" Expr denominator
  )
  > left (
      add: Expr leftAddend "+" Expr rightAddend
    | sub: Expr minuend "-" Expr subtrahend
  )
  > non-assoc (
      lt: Expr left "\<" Expr right
    | leq: Expr left "\<=" Expr right
    | gt: Expr left "\>" Expr right
    | geq: Expr left "\>=" Expr right
    | equ: Expr left "==" Expr right
    | neq: Expr left "!=" Expr right
  )
  > left and: Expr left "&&" Expr right
  > left or: Expr left "||" Expr right
  ;
