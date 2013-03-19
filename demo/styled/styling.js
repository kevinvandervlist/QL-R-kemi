function styling() {
  
  addPage("page_Age_2_2", "Age precondition", "demo");
  
  
  addQuestion("theAgeBlock", "page_Age_2_2");
  
  addQuestion("theAge2Block", "page_Age_2_2");
  
  addQuestion("ofAgeBlock", "page_Age_2_2");
  
  addQuestion("ofAge2Block", "page_Age_2_2");
  
  
  
  addPage("page_Information_32_2", "Information", "demo");
  
  
  addSection("section_Too_33_4", "Too young", "page_Information_32_2");
  
  
  addQuestion("theAgeToYoungBlock", "section_Too_33_4");
  
  
  
  addSection("section_Income_37_4", "Income", "page_Information_32_2");
  
  
  addQuestion("hourlyRateBlock", "section_Income_37_4");
  
  addQuestion("lowRemarkBlock", "section_Income_37_4");
  
  addQuestion("averageRemarkBlock", "section_Income_37_4");
  
  addQuestion("highRemarkBlock", "section_Income_37_4");
  
  addQuestion("hoursAWeekBlock", "section_Income_37_4");
  
  
  
  
  
  addPage("page_Income_47_2", "Income overview", "demo");
  
  
  addQuestion("weeklyIncomeBlock", "page_Income_47_2");
  
  
  
  addPage("page_Date_56_2", "Date information", "demo");
  
  
  addQuestion("birthdateBlock", "page_Date_56_2");
  
  addQuestion("bornRemarkBlock", "page_Date_56_2");
  
  
  

  
  // Question bornRemark
  
  
  // Question ofAge
  
  addCheckbox("ofAge");
  
  
  // Question weeklyIncome
  
  
  // Question ofAge2
  
  addRadio("ofAge2");
  
  
  // Question birthdate
  
  addText("birthdate");
  
  
  // Question averageRemark
  
  
  // Question theAgeToYoung
  
  
  // Question theAge
  
  addNumber("theAge", 0., 125., 1.);
  
  
  // Question hourlyRate
  
  
  // Question highRemark
  
  
  // Question lowRemark
  
  
  // Question theAge2
  
  addSlider("theAge2", 0., 125., 1.);
  
  
  // Question hoursAWeek
  
  
  

  paginate();

  $("fieldset").trigger("check");
}
