// THIS IS AN AUTOMATICALLY GENERATED FILE. DO NOT EDIT!

function validatedemo() {

  $("#demo").validate({
    rules: {
      
      theAge: {
        required: true,
        digits: true
          
      },
      
      theAge2: {
        required: true,
        digits: true
          
      },
      
      ofAge: {
        required: true
          
      },
      
      ofAge2: {
        required: true
          
      },
      
      hourlyRate: {
        required: true,
        number: true,
        moneyValidator: true
          
      },
      
      lowRemark: {
        required: true,
          
      },
      
      averageRemark: {
        required: true,
          
      },
      
      highRemark: {
        required: true,
          
      },
      
      hoursAWeek: {
        required: true,
        digits: true
          
      },
      
      weeklyIncome: {
        required: true,
        number: true,
        moneyValidator: true
          
      },
      
      birthdate: {
        required: true,
        date: true
          
      },
      
      bornRemark: {
        required: true,
          
      },
      
      theAgeToYoung: {
        required: true
          
      },
      
    }
  });

  $("#demo").on("input change", function(evt) {
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
  
  
  $("#hourlyRate").on("input change", calc_callback_0);
  
  $("#hoursAWeek").on("input change", calc_callback_0);
  
  
  function calc_callback_0(e) {
    var result; 
  
    var hourlyRate = getFormValue("#hourlyRate");
  
    var hoursAWeek = getFormValue("#hoursAWeek");
  
    result = (hourlyRate * hoursAWeek);
    setFormValue("#weeklyIncome", roundMoney(result));
  }
      

  // End with control flow functionality for branches etc. 
  
  // Hide all elements in a conditional branch on page load 
  
  hide($("#hourlyRateBlock"));
  
  hide($("#lowRemarkBlock"));
  
  hide($("#averageRemarkBlock"));
  
  hide($("#highRemarkBlock"));
  
  hide($("#hoursAWeekBlock"));
  
  hide($("#weeklyIncomeBlock"));
  
  hide($("#birthdateBlock"));
  
  hide($("#bornRemarkBlock"));
  
  hide($("#theAgeToYoungBlock"));
  
  hide($("#lowRemarkBlock"));
  
  hide($("#averageRemarkBlock"));
  
  hide($("#highRemarkBlock"));
  
  hide($("#bornRemarkBlock"));
  
      
  
  $("*[name=theAge]").on("input change", callback_0);
      
  $("*[name=ofAge2]").on("input change", callback_0);
      
  $("*[name=ofAge]").on("input change", callback_0);
      
  $("*[name=theAge2]").on("input change", callback_0);
      
  function callback_0(e) {
    
    var theAge = getFormValue("#theAge");
    
    var ofAge2 = getFormValue("#ofAge2");
    
    var ofAge = getFormValue("#ofAge");
    
    var theAge2 = getFormValue("#theAge2");
    
    
    hide($("#theAgeToYoungBlock"));
    
    hide($("#birthdateBlock"));
    
    hide($("#averageRemarkBlock"));
    
    hide($("#weeklyIncomeBlock"));
    
    hide($("#bornRemarkBlock"));
    
    hide($("#hoursAWeekBlock"));
    
    hide($("#lowRemarkBlock"));
    
    hide($("#highRemarkBlock"));
    
    hide($("#hourlyRateBlock"));
    
    if(((((theAge >= 18) && (ofAge == true)) && (ofAge == ofAge2)) && (theAge == theAge2))) { 
    
      show($("#birthdateBlock"));
    
      show($("#weeklyIncomeBlock"));
    
      show($("#hoursAWeekBlock"));
    
      show($("#hourlyRateBlock"));
    
    
    
    
    
    } else { 
      
        show($("#theAgeToYoungBlock"));    
      
    
    }
  }
    
  
  
  $("*[name=hourlyRate]").on("input change", callback_1);
      
  function callback_1(e) {
    
    var hourlyRate = getFormValue("#hourlyRate");
    
    
    hide($("#averageRemarkBlock"));
    
    hide($("#lowRemarkBlock"));
    
    hide($("#highRemarkBlock"));
    
    if((hourlyRate <= 5)) { 
    
      show($("#lowRemarkBlock"));
    
    
    
    } else if((hourlyRate <= 15)) { 
      
        show($("#averageRemarkBlock"));
      
    
    
    
    } else { 
      
        show($("#highRemarkBlock"));    
      
    
    }
  }
    
  
  
  $("*[name=birthdate]").on("input change", callback_2);
      
  function callback_2(e) {
    
    var birthdate = getFormValue("#birthdate");
    
    
    hide($("#bornRemarkBlock"));
    
    if((birthdate < "2000-01-01")) { 
    
      show($("#bornRemarkBlock"));
    
    
    
    
    
    }
  }
    
  
}
  