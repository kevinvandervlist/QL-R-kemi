//a
//b
/* abcd <23 /* b */ + hasSoldHouse> abc */
form taxOfficeExample { 

  "Did you sell a house in 2010?"
    boolean hasSoldHouse
  "Did you buy a house in 2010?"
    boolean hasBoughtHouse
  "Did you enter a loan for maintenance/reconstruction?"
    boolean hasMaintLoan
    // A comment <hasMaintLoan && 2323 > 23>
  if(hasSodHouse) { 
    /* depends on  <privateDebt < sellingPrice> */
    "What was the selling price of the house?"
      money sellingPrice
    "Private debts for the sold house:"
      money privateDebt
    "Value residue:"
      money valueResidue = (sellingPrice - privateDebt)
  }
  else if (!hasSoldHouse) {
    "Ask some extra: " integer extra
  }
  else {
    "Ask some extra: " integer more
  }
}

