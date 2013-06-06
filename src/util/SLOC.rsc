module util::SLOC

//import util::LOC;
import util::FileSystem;
import ParseTree;
import util::Reflective;
import util::Math;
import List;
import IO;


//public data FileSystem 
//  = directory(loc l, set[FileSystem] children)
//  | file(loc l)
//  ;

void rascalFile() {
  fs = crawl(|project://QL-R-kemi/src|);
  for (/file(l) := fs, l.extension == "rsc") {
    ;
  }
}


bool excludePath(/^\/src\/lang\/ql\/tests/) = true;
bool excludePath(/^\/src\/lang\/qls\/tests/) = true;
bool excludePath(/^\/src\/lang\/ql\/format/) = true;
bool excludePath("/src/util/SLOC.rsc") = true;
bool excludePath("/src/util/Random.rsc") = true;
bool excludePath("/src/util/Priorities.rsc") = true;
bool excludePath("/src/lang/ql/ide/Visualize.rsc") = true;
bool excludePath("/src/lang/ql/util/Random.rsc") = true;
bool excludePath("/src/lang/ql/util/ParenthesizeExpression.rsc") = true;
bool excludePath("/src/lang/ql/util/FormGenerator.rsc") = true;
bool excludePath("/src/lang/ql/analysis/CFlow.rsc") = true;
bool excludePath("/src/lang/ql/analysis/CommentCheck.rsc") = true;
bool excludePath("/src/lang/ql/compiler/PrettyPrinter.rsc") = true;
bool excludePath("/src/lang/qls/compiler/PrettyPrinter.rsc") = true;
default bool excludePath(str _) = false;

alias Stats = tuple[int total, map[loc file, int sloc] dist];

Stats lwc13Stats() = slocStats(crawl(|project://QL-R-kemi/src|), <0, ()>);

Stats slocStats(file(loc l), Stats stats)
  = <stats.total + n, stats.dist + (l: n)>
  when l.extension == "rsc", !excludePath(l.path),
    int n := countSLOC(parseModule(l)),
    bprintln("Count of <l.path>: <n>"); 
    
Stats slocStats(directory(loc l, kids), Stats stats)
  = <stats.total + stats2.total, stats.dist + stats2.dist + (l: stats2.total)>
  when stats2 := ( <0, ()> | slocStats(k, it) | k <- kids );

default Stats slocStats(FileSystem _, Stats stats) = stats;





/*
 * Generic utilities to compute (S)LOC metrics based on grammars
 */
 

/*
 * Abstract domain to map parsetrees to
 */
data Output
  = newline()
  | stuff()
  ;
  
  
// TODO: deal with start parse trees.  
int countSLOC(Tree t) {
  list[Output] output = [];
  
  void write(Output x) {
    if (!isEmpty(output) && last(output) == x) {
      return;
    }
    output += [x]; 
  }
  
  void writeLayout(Tree t) {
    if (isComment(t)) {
      return;
    }
    switch (t) {
      case char(c): 
        if (isNewLineChar(c)) {
          write(newline());
        }
      case appl(_, as):
        writeKids(as, writeLayout);

      case amb(ts): 
        // all alts have the same yield
        // so just pick an arbitrary one
        if (x <- ts) writeLayout(x);
      
      default: ;        
    } 
  }
  
  void writeTree(Tree t) { 
    if (isComment(t)) {
      return;
    }
    if (isLayout(t)) { // todo: isLayout should look into ambs
      return writeLayout(t);
    }
    switch (t) {
      case char(c):
        write(isNewLineChar(c) ? newline() : stuff());
      
      case appl(_, as):
        writeKids(as, writeTree);
              
      case amb(ts): 
        if (x <- ts) writeTree(x);
      
      default: ;
    }
  }
  
  void writeKids(list[Tree] as, void(Tree) f) {
    i = 0;
    while (i < size(as)) {
      // Interpret CR LF as a single newline
      if (char(a) := as[i], i+1 < size(as),
          char(b) := as[i+1], 
          isCR(a), isLF(b)) {
        write(newline());
      }
       else {
        f(as[i]);
      } 
      i += 1;
    }
  }
 
  writeTree(t);
  // TODO: double check the + 1
  return size([ n | n:newline() <- output]) + 1;
}

// todo: look into ambs
bool isLayout(appl(prod(\layouts(_), _, _), _)) = true;
default bool isLayout(Tree t) = false;

bool isComment(appl(p:prod(_, _, {_*, \tag("category"("Comment"))}), _)) = true;
default bool isComment(Tree _) = false;


 /*
 
 From: http://en.wikipedia.org/wiki/Newline
 
 LF:    Line Feed, U+000A
 VT:    Vertical Tab, U+000B
 FF:    Form Feed, U+000C
 CR:    Carriage Return, U+000D
 CR+LF: CR (U+000D) followed by LF (U+000A)
 NEL:   Next Line, U+0085
 LS:    Line Separator, U+2028
 PS:    Paragraph Separator, U+2029
 
 */
 
bool isLF(int c) =  c == 0x000A;
bool isVT(int c) =  c == 0x000B;
bool isFF(int c) =  c == 0x000C;
bool isCR(int c) =  c == 0x000D;
bool isNEL(int c) = c == 0x0085; 
bool isLS(int c) =  c == 0x2028;
bool isPS(int c) =  c == 0x2029;
 
bool isNewLineChar(int c) = any(i <- [isLF, isVT, isFF, isCR, isNEL, isLS, isPS], i(c));

