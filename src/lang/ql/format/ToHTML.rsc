module lang::ql::format::ToHTML

import lang::box::util::Highlight;
import lang::box::util::HighlightToHTML;

import lang::ql::\syntax::QL;
import ParseTree;

str HIGHLIGHT_CSS = "highlight.css";

str form2html(str title, Tree t) {
 boxes = highlight(t);
 src = highlight2html(boxes);
 return "\<html\>
        '\<title\><title>\</title\>
        '\<head\>
        '\<link rel=\"stylesheet\" type=\"text/css\" href=\"<HIGHLIGHT_CSS>\" media=\"screen\" /\>
        '\</head\>
        '\<body\>
        ' \<pre\>
        ' \<code\>
        '   <src>
        ' \</code\>
        ' \</pre\>
        '\</body\>
        '\</html\>"; 
}


//<link rel="stylesheet" type="text/css" href="theme.css" />
