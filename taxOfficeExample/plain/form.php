<?php
 
  //THIS IS AN AUTOMATICALLY GENERATED FILE. DO NOT EDIT!

  $__RES = array();


  if(!isset($_POST['hasSoldHouse'])) {
    // A boolean which is not set means false.
    $_POST['hasSoldHouse'] = "false";
  } else if($_POST['hasSoldHouse'] === "true" || 
            $_POST['hasSoldHouse'] === "false") {
  } else {
    die("hasSoldHouse is not a boolean!");
  }
  
  $hasSoldHouse = $_POST['hasSoldHouse'] === "true";
  $__RES["hasSoldHouse"] = $hasSoldHouse;
  
      
      

  if(!isset($_POST['hasBoughtHouse'])) {
    // A boolean which is not set means false.
    $_POST['hasBoughtHouse'] = "false";
  } else if($_POST['hasBoughtHouse'] === "true" || 
            $_POST['hasBoughtHouse'] === "false") {
  } else {
    die("hasBoughtHouse is not a boolean!");
  }
  
  $hasBoughtHouse = $_POST['hasBoughtHouse'] === "true";
  $__RES["hasBoughtHouse"] = $hasBoughtHouse;
  
      
      

  if(!isset($_POST['hasMaintLoan'])) {
    // A boolean which is not set means false.
    $_POST['hasMaintLoan'] = "false";
  } else if($_POST['hasMaintLoan'] === "true" || 
            $_POST['hasMaintLoan'] === "false") {
  } else {
    die("hasMaintLoan is not a boolean!");
  }
  
  $hasMaintLoan = $_POST['hasMaintLoan'] === "true";
  $__RES["hasMaintLoan"] = $hasMaintLoan;
  
      
      

  if($hasSoldHouse) { 
    $sellingPrice = floatval($_POST['sellingPrice']);
    $_ssellingPrice = sprintf("%.2f", $sellingPrice);
    $sellingPrice = floatval($_ssellingPrice);
    
    $sellingPrice = $_POST['sellingPrice'];
    $__RES["sellingPrice"] = $sellingPrice;
    
      
        
    $privateDebt = floatval($_POST['privateDebt']);
    $_sprivateDebt = sprintf("%.2f", $privateDebt);
    $privateDebt = floatval($_sprivateDebt);
    
    $privateDebt = $_POST['privateDebt'];
    $__RES["privateDebt"] = $privateDebt;
    
      
        
    
    $valueResidue = ($sellingPrice - $privateDebt);
    $__RES["valueResidue"] = $valueResidue;
    
      
  }

  
  $__JSON = json_encode($__RES);
  
  print_r($__JSON);
  echo "
  ";
    
?>
