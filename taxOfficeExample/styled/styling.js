function styling() {
  
  addPage("page_Housing_2_2", "Housing", "taxOfficeExample");
  
  
  addSection("section_Buying_3_4", "Buying", "page_Housing_2_2");
  
  
  addQuestion("hasBoughtHouseBlock", "section_Buying_3_4");
  
  
  
  addSection("section_Loaning_10_4", "Loaning", "page_Housing_2_2");
  
  
  addQuestion("hasMaintLoanBlock", "section_Loaning_10_4");
  
  
  
  addSection("section_Selling_14_4", "Selling", "page_Housing_2_2");
  
  
  addQuestion("hasSoldHouseBlock", "section_Selling_14_4");
  
  addSection("section_You_18_6", "You sold a house", "section_Selling_14_4");
  
  
  addQuestion("sellingPriceBlock", "section_You_18_6");
  
  addQuestion("privateDebtBlock", "section_You_18_6");
  
  addQuestion("valueResidueBlock", "section_You_18_6");
  
  
  
  
  
  
  

  
  // Question sellingPrice
  
  addNumber("sellingPrice", 0., 10000000., 10000.);
  
  
  // Question hasBoughtHouse
  
  addCheckbox("hasBoughtHouse");
  
  
  // Question valueResidue
  
  addNumber("valueResidue", -1, -1, -1);
  
  
  // Question hasMaintLoan
  
  addRadio("hasMaintLoan");
  
  
  // Question hasSoldHouse
  
  
  
  
  // Question privateDebt
  
  addSlider("privateDebt", 0., 10000000., 10000.);
  
  
  

  paginate();

  $("fieldset").trigger("check");
}
