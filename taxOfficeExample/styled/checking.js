// THIS IS AN AUTOMATICALLY GENERATED FILE. DO NOT EDIT!

function validatetaxOfficeExample() {

  $("#taxOfficeExample").validate({
    rules: {
      
      hasSoldHouse: {
        required: true
          
      },
      
      hasBoughtHouse: {
        required: true
          
      },
      
      hasMaintLoan: {
        required: true
          
      },
      
      sellingPrice: {
        required: true,
        number: true,
        moneyValidator: true
          
      },
      
      privateDebt: {
        required: true,
        number: true,
        moneyValidator: true
          
      },
      
      valueResidue: {
        required: true,
        number: true,
        moneyValidator: true
          
      },
      
    }
  });

  $("#taxOfficeExample").on("input change", function(evt) {
    if($(evt.target).attr("type") !== "date") {
      $(evt.target).valid();
    }
    if(evt.type === "change") {
      $(evt.target).attr("touched", "touched");
    }
  });

  // Make sure all elements are properly styled before registering events
  styling();

  // The code to automatically generate calculated fields 
  
  
  $("#sellingPrice").on("input change", calc_callback_0);
  
  $("#privateDebt").on("input change", calc_callback_0);
  
  
  function calc_callback_0(e) {
    var result; 
  
    var sellingPrice = getFormValue("#sellingPrice");
  
    var privateDebt = getFormValue("#privateDebt");
  
    result = (sellingPrice - privateDebt);
    setFormValue("#valueResidue", roundMoney(result));
  }
      

  // End with control flow functionality for branches etc. 
  
  // Hide all elements in a conditional branch on page load 
  
  hide($("#sellingPriceBlock"));
  
  hide($("#privateDebtBlock"));
  
  hide($("#valueResidueBlock"));
  
      
  
  $("*[name=hasSoldHouse]").on("input change", callback_0);
      
  function callback_0(e) {
    
    var hasSoldHouse = getFormValue("#hasSoldHouse");
    
    
    hide($("#valueResidueBlock"));
    
    hide($("#sellingPriceBlock"));
    
    hide($("#privateDebtBlock"));
    
    if(hasSoldHouse) { 
    
      show($("#valueResidueBlock"));
    
      show($("#sellingPriceBlock"));
    
      show($("#privateDebtBlock"));
    
    
    
    
    
    }
  }
    
  
}
  