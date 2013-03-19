<?php
 
  //THIS IS AN AUTOMATICALLY GENERATED FILE. DO NOT EDIT!

  $__RES = array();


  if(!(is_int((integer) $_POST['theAge']))) {
    die("theAge is not an integer!");
  }
  
  $theAge = $_POST['theAge'];
  $__RES["theAge"] = $theAge;
  
    
      

  if(!(is_int((integer) $_POST['theAge2']))) {
    die("theAge2 is not an integer!");
  }
  
  $theAge2 = $_POST['theAge2'];
  $__RES["theAge2"] = $theAge2;
  
    
      

  if(!isset($_POST['ofAge'])) {
    // A boolean which is not set means false.
    $_POST['ofAge'] = "false";
  } else if($_POST['ofAge'] === "true" || 
            $_POST['ofAge'] === "false") {
  } else {
    die("ofAge is not a boolean!");
  }
  
  $ofAge = $_POST['ofAge'] === "true";
  $__RES["ofAge"] = $ofAge;
  
      
      

  if(!isset($_POST['ofAge2'])) {
    // A boolean which is not set means false.
    $_POST['ofAge2'] = "false";
  } else if($_POST['ofAge2'] === "true" || 
            $_POST['ofAge2'] === "false") {
  } else {
    die("ofAge2 is not a boolean!");
  }
  
  $ofAge2 = $_POST['ofAge2'] === "true";
  $__RES["ofAge2"] = $ofAge2;
  
      
      

  if((((($theAge >= 18) && ($ofAge == true)) && ($ofAge == $ofAge2)) && ($theAge == $theAge2))) { 
    $hourlyRate = floatval($_POST['hourlyRate']);
    $_shourlyRate = sprintf("%.2f", $hourlyRate);
    $hourlyRate = floatval($_shourlyRate);
    
    $hourlyRate = $_POST['hourlyRate'];
    $__RES["hourlyRate"] = $hourlyRate;
    
      
        
    if(($hourlyRate <= 5)) { 
      if(!(is_string($_POST['lowRemark']))) {
        die("lowRemark is not a string!");
      }
      
      $lowRemark = $_POST['lowRemark'];
      $__RES["lowRemark"] = $lowRemark;
      
        
          
    } else if(($hourlyRate <= 15)) { 
      if(!(is_string($_POST['averageRemark']))) {
        die("averageRemark is not a string!");
      }
      
      $averageRemark = $_POST['averageRemark'];
      $__RES["averageRemark"] = $averageRemark;
      
        
          
    } else { 
      if(!(is_string($_POST['highRemark']))) {
        die("highRemark is not a string!");
      }
      
      $highRemark = $_POST['highRemark'];
      $__RES["highRemark"] = $highRemark;
      
        
          
    }
    if(!(is_int((integer) $_POST['hoursAWeek']))) {
      die("hoursAWeek is not an integer!");
    }
    
    $hoursAWeek = $_POST['hoursAWeek'];
    $__RES["hoursAWeek"] = $hoursAWeek;
    
      
        
    
    $weeklyIncome = ($hourlyRate * $hoursAWeek);
    $__RES["weeklyIncome"] = $weeklyIncome;
    
      
    $birthdate = $_POST['birthdate'];
    $birthdate_arr = explode("-", $birthdate);
    
    $__year = $birthdate_arr[0];
    $__month = $birthdate_arr[1];
    $__day = $birthdate_arr[2];
    
    if(!(checkDate($__month, $__day, $__year))) {
      die("birthdate is not a valid date!");
    }
      
    
    $birthdate = $_POST['birthdate'];
    $__RES["birthdate"] = $birthdate;
    
      
        
    if(($birthdate < "2000-01-01")) { 
      if(!(is_string($_POST['bornRemark']))) {
        die("bornRemark is not a string!");
      }
      
      $bornRemark = $_POST['bornRemark'];
      $__RES["bornRemark"] = $bornRemark;
      
        
          
    }
  } else { 
    if(!isset($_POST['theAgeToYoung'])) {
      // A boolean which is not set means false.
      $_POST['theAgeToYoung'] = "false";
    } else if($_POST['theAgeToYoung'] === "true" || 
              $_POST['theAgeToYoung'] === "false") {
    } else {
      die("theAgeToYoung is not a boolean!");
    }
    
    $theAgeToYoung = $_POST['theAgeToYoung'] === "true";
    $__RES["theAgeToYoung"] = $theAgeToYoung;
    
        
        
  }

  
  $__JSON = json_encode($__RES);
  
  print_r($__JSON);
  echo "
  ";
    
?>
