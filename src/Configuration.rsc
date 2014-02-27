module Configuration

private loc projectName = |project://QL-R-kemi/|;

public loc getProjectName(loc file) {
  loc fp = file.top;
  while(fp.parent != fp) {
    fp = fp.parent;
  }
  return fp;
}

public loc getStaticSourceLoc() = 
  projectName + "static/";

public loc getCompileTarget(loc file) = 
  getProjectName(file) + "output/";

public loc getCompileTarget() = 
  projectName + "output/";

public str getQLLangName() = 
  "QL-R";
  
public str getQLLangExt() = 
  "q";
  
public str getQLSLangName() = 
  "QLS-R";
  
public str getQLSLangExt() = 
  "qs";

public str getCSSStylesheetName() =
  "style.css";

public str getStylingJSName() =
  "styling.js";

public str getCheckingJSName() =
  "checking.js";

public str getHTMLName() =
  "index.html";

public str getPHPName() = 
  "form.php";
