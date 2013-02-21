Software Construction 2012-2013
===============================
From the [course wiki](https://github.com/software-engineering-amsterdam/software-construction/wiki)

Introduction
------------

This page covers all relevant information concerning the course
**Software Construction 2012-2013** in the Master Software
Engineering, University of Amsterdam.


### Schedule

Lectures and workshops will be from 9:00-11:00 on Mondays. Lectures
will be given by Paul Klint, Jurgen Vinju, Tijs van der Storm and
guest lecturers. Practical course will be on Mondays from 11:00 to
17:00 and Tuesdays the whole day. For details about rooms see
[datanose.nl](https://datanose.nl/#course[10815]). An iCal ICS link
can be found here:
[https://datanose.nl/course_10815.ics](https://datanose.nl/course_10815.ics). 

Primary contact for this course is [Tijs van der Storm](mailto:storm@cwi.nl).

### Week 2 - 4
 
 - 07-1: Introduction [(Slides)](https://github.com/software-engineering-amsterdam/software-construction/raw/master/2012-2013/introSlides1213.pdf)
 - 14-1: Lecture Grammars and Parsing [(Slides)](https://github.com/software-engineering-amsterdam/software-construction/raw/master/2012-2013/intro-parsing.pdf)
 - 21-1: Lecture Domain-Specific Languages ([(Slides)](https://github.com/software-engineering-amsterdam/software-construction/raw/master/2012-2013/DSLs.pdf)) and Language Engineering [(Slides)](https://github.com/software-engineering-amsterdam/software-construction/raw/master/2012-2013/lang-eng.pdf)
     * Grading part I lab assignment 

 
### Week 5 - 8

 - 28-1: Lecture Code Quality [(Slides)](https://github.com/software-engineering-amsterdam/software-construction/raw/master/2012-2013/CodeQuality1213.pdf)
     * Test I: technique
 - 04-2: Lecture Interpreters [(Slides)](https://github.com/software-engineering-amsterdam/software-construction/raw/master/2012-2013/Interpreters.pdf)
 - 11-2: Lecture Capita Code Smells
   [(Slides)](https://github.com/software-engineering-amsterdam/software-construction/raw/master/2012-2013/Capita1.pdf)
     * NB: slides and supporting material of the paper session by Bas
       van Vlijmen are availble from Blackboard.
     * Test II: philosophy
 - 18-2: Guest Lecture: Jeroen van den Bos, Derric: a DSL for digital forensics.
     * Grading part II lab assignment

### Week 9

 - 25-2: 
   - 09:00-09:30: Replay of Test I
   - 09:30-10:30: Replay of Test II
 
 Paper writing time: deadline Sunday, March 3rd.
 
				   
### How to pass this course

Required skills:

 - Create good low level designs
 - Produce clean, readable code
 - Reflect upon and argue for/against software construction
   techniques, patterns, guidelines etc.
 - Assess the quality of code.
 - Select and apply state of the art software construction tools and frameworks.

Required knowledge:

 - Understand basic principles of language implementation (parsing,
   AST, evaluation, generation)
 - Understand basic aspects of code quality
 - Understand encapsulation and modular design
 
How to pass this course:

- Part 1 of the practical course: this grade will be an indication
  that you can use to improve your code for Part 2.
- Part 2 of the practical course, this will constitute the final grade
- Having written a research paper and a review of someone else's paper.
- Be present at all lectures.
- Pass the two reading tests.


Debunking SC Myths
------------------

To pass this course you are required to write a paper. It can be seen
as an exercise in argumentation. This paper should be between 3-5
pages in size. For the topic, select one of the topics in the appendix
at the end of this document. Moreover, identify a thesis based on the
papers listed for each topic. For instance, in the topic "Design by
Contract", there are two papers advocating the use of design by
contract. In this exercise you are required to find evidence against
your selected thesis in an attempt to debunk it. You are required to
find a minimum of *two* academic papers that support your position. In
the paper you should argue against the thesis using the 2 papers as
evidence. 
 
Please submit your paper through EasyChair:
   
> [TODO]()
   

Lab assignment: QL, a DSL for Questionnaires
--------------------------------------------

The lab assignment this year is based on the Language Workbench
Challenge
([LWC'13)](http://www.languageworkbenches.net/index.php?title=LWC_2013))
exercise. The goal of that assignment is to build a DSL for
questionnaires (called QL): simple forms with conditions and computed
values. See
[this document](http://www.languageworkbenches.net/images/5/53/Ql.pdf) [mirror](Ql.pdf)
for more information.

There are three variants to the exercise depending on the technology
you choose to use or how ambitious you are.


### Variant 1: Rascal

If you choose to use [Rascal](http://www.rascal-mpl.org), a DSL for
source code analysis and transformation, the deliverables for the
assignment are as follows:

 - A correct Rascal grammar for the syntax of QL
 - A meta-model/abstract syntax ADT for representing QL models
 - Basic IDE features for QL files: syntax highlighting and
   outlining.
 - A semantic checker hooked up to the IDE. This
   means that, if there are errors, they are shown in QL
   editors. 
 - A generator that converts QL models to an Java and/or JavaScript
   code. This functionality should be made available in the IDE.

With respect to semantic checking, you're required to support the
following checks:

 - Basic type checking for integer, string and boolean expressions.
 - Check cyclic dependencies, 
 - Check for duplicate questions with different types,
 - Check for computed and answerable questions that bind the same
   variable. 
 - Check for undefined variables used in expressions.
 - Provide warnings for duplicate labels.

Many of you have used Rascal during Software Evolution. Furthermore,
since Rascal is a programming language specifically designed for
implementing DSLs, the assignment is more complex than the other
variant. It also requires ample knowledge of the Rascal language and
APIs. If you decide to use Rascal, you get a lot of power for free, so
your code will be graded much more thoroughly.


### Variant 2: Java

If you choose Java  as the primary implementation language, it is
unrealistic to require the more advanced IDE features required in the
Rascal variant. In this case, the assignment is as follows:

- Write a parser for the QL language, using a Java parser
  generator. The provided skeleton code (see below) includes three
  starting points based on Jacc, Rats! and ANTLR. You're expected to
  choose _one_, and be able to motivate your choice. It's your job to
  complete one of the provided grammars and AST hierarchies. 
  
- The parser should produce an abstract syntax tree (AST); this is a
  tree of objects representing the source program. The AST is
  described by a _class hierarchy_. (NB: this class hierarchy is
  required! You could use this requirement in your selection of parser
  generator).

- A well-formedness/consistency _checker_ implemented on top of your
  AST classes. You may restrict the supported data types by QL to
  integers, boolean, and strings. See Variant 1 for details. 
  
- An _interpreter_ for QL: this component should render a
  questionnaire as an interactive form (e.g., using Swing, JavaFX, or
  HTML). Note: an interpreter **runs** a questionnaire directly,
  there's no code generation involved. 
  

#### Skeleton code  

We've provided two projects which you can use to get started. This
code is *incomplete*. You should make it complete by adding the
following features:

- Syntax for booleans, string literals. Don't forget to take care of
  keyword reservation: true and false should be parsed as boolean
  literals, not as identifiers. 

- Add single-line comments (a la Java: //).

- Add syntax productions for forms, questions, computed quetsions,
  types (int, bool, and string) and if-then and if-then-else
  statements. Use string literals for question labels. See the LWC'13
  link above for an example questionnaire. 

- Add tests to check your syntax extensions.

- Add AST classes for the provided expression categories, and for you
  syntactic extensions. Make sure the parser creates objects of the
  appropriate type. 
  
- Change the start symbol of the parser to parse forms, instead of
  Expressions.

Note: don't be seduced by the provided example code and start
copy-pasting grammar rules around. It is important to really
understand the parser technology involved. ANTLR, Rats! and Jacc are
well-documented on the web. Please use this information to fulfill the
above requirements.

  

### Variant 3: Advanced Track

The advanced track is meant for excellent students. Depending on the
number of candidates, the students on the advanced track will
collaborate in pairs to develop a more advanced variant of the QL
language in Rascal:

This includes the following deliverables:

- **All of the components of the Rascal variant.**
- Next to integer, string and boolean, the QL language should support
  date and (fixed-precision) decimal.
- Development of the QLS layout language (including IDE
  support). Include support for at least date picker, spin lock and
  radio button widgets. This language has to be designed!
- Checking of the QLS language against the QL language.

The advanced track team(s) will work in close collaboration with CWI. If the
project is successful it will be presented at the LWC meeting at the
Code Generation conference in Cambridge, UK. Note that, the code for
the assignment will be published and used to show off the strengths of
Rascal. It is therefore very important that the code is typical and of
the highest quality!

Important goals to observe:

- The QLS language should be developed *modularly* "on top of"
  QL. This means that QL should still be useable in a standalone
  fashion. The code for QL should not depend in any way on code that
  deals with QLS.
  
- You should think carefully on how you generate code. If the target
  will be HTML + JavaScript, you have to take care of server side
  logic too. 

### Bonus exercises

Bonus exercise for Rascal variants: use SAT/SMT/Constraint solver to check for
non-determinism.

Bonus exercise for Java variant: use Object Algebras to modularize
your interpreter and type checker and modularly implement a language
extension. See the following paper for details on Object Algebras:

- [Bruno C.d.S. Oliveira and William R. Cook. _Extensibility for the Masses: Practical Extensibility with Object Algebras_](http://www.cs.utexas.edu/~wcook/Drafts/2012/ecoop2012.pdf)
  
  



### Time table for the the lab assignment

There are two grading moments of the lab assignment (see above) which
correspond to parts of the assignment:

- Part 1 (Front end): the frontend covers all aspects visible to the
  users of the DSL: parsing, checking, and in case of the Rascal
  variants, IDE support.
  
- Part 2 (Back end): the back end includes are aspects related to
  running QL programs. In the Java variant this is the interpreter, in
  the Rascal variants this is the compiler/codegenerator. 


### What we look for when grading your code

We take the principles laid down in _Code Complete_ as guidelines when
grading your solutions. More specifically, the following aspects of
quality code will be our focus:

- Functionality (e.g., are the requirements implemented)
- Tests (e.g., presence of meaningful unit tests)
- Simplicity (absence of code bloat and complexity; YAGNI)
- Modularity (e.g., encapsulation, class dependencies, package structure)
- Layout and style (indentation, comments, naming of variables etc.)
- Sensible use of design patterns (e.g., Visitor)

More concretely, we ask you to take the following list of advice into
consideration. 
 
 - Code quality is of the utmost importance in this course. You will
   write clean, consistently formatted, concise code. Your naming and
   indentation convention will be consistent.
   
 - You show that you master the concepts of encapsulation, modularity
   and separation of concerns. This should be visible from the
   code. The structure of the code should show the design.
   
 - Method and functions should realize a single piece of
   functionality. You adhere to the Don't Repeat Yourself (DRY)
   principle.
   
 - You will select tools and libraries wisely. You can argue why you
   chose to use a particular artifact.
      
 - You know your (standard) libraries and APIs. Do not reimplement
   (simple) functions that can be expected to be in a (standard)
   library. Especially, do not claim that your version is faster,
   because: it is irrelevant, and, you're probably wrong. Make the
   trade-off for reusing a library: do you really need a heavy
   dependency, for some simple functionality?

 - Test your code using unit tests if this is meaningful. Do not write
   tests, because your are somehow supposed to. Do not write your own
   testing framework; use appropriate libraries and/or language
   features of the platform (e.g. JUnit on Java). Separate test code
   from main code.
   
 - Use asserts in the correct way. Asserts are used to document and
   check assumptions. They are _not_ used for input validation or
   error handling.
   
 - Use exception handling wisely. Do not implement your Exception
   class in a situation where a standard library exception makes perfect
   sense. Handle exceptions sanely, if possible. Empty
   catch-blocks are unacceptable 99.9% of the time.

 - Non-constant static variables should be avoided at all cost.
 
 - If you are forced to need instanceof a lot, you probably have a
   flaw in your design.

 - You are expected not to indulge in elaborate gold plating. For
   instance, fancy graphics/user interfaces are not important. YAGNI:
   You Ain't Gonna Need It. Focus on the simplest thing that could
   possibly work, first.
   
 - Do not optimize your code unless you can argue there is a real
   problem (proven by profiling). Simplicity of the code has priority.
   
>  _We should forget about small efficiencies, say about 97% of the
>  time: premature optimization is the root of all
>  evil._ --Donald Knuth
   
 - You are not supposed to show off how smart you are. 
 
>  _Debugging is twice as hard as writing the code in the first
>  place. Therefore, if you write the code as cleverly as possible,
>  you are, by definition, not smart enough to debug it._ --Brian
>  Kernighan
 
 - You are expected to write comments, only if you need to explain a
   complicated algorithm or motivate a particular piece of code. Do
   not engage in obligatory comments. Javadoc (or similar) is ok, but
   think about the purpose of Javadoc first.
   
 - It is unacceptable that there are remnants of dead code, commented
   out sections, or debugging print statements etc. in the code that
   you will present for grading.

 - You will only present *working code* for grading. Note: working
   code implies your project compiles without errors. Additionally,
   you should use the IDE in the correct way, setup dependencies
   correctly, provide build-scripts if necessary.

Please take this advice to heart. It will influence your grade.
 
Note that, although Rascal is not an object-oriented programming
language, this does not imply that you cannot modularize and
encapsulate. On the other hand, your are forbidden to "write
Java/C/PHP/C# etc." in
Rascal. If you go with Rascal, be sure that you know how to use
comprehensions, visit, pattern matching etc.


### Administrativia

Each participant will have to use Github; please make an account if
you haven't already. Then send [me](mailto:storm@cwi.nl) a note with
your Github user name so that I can add you as a team member. After
you have commit access, you can clone the following repository and
start coding **in your own** subdirectory.

> [https://github.com/software-engineering-amsterdam/sea-of-ql](https://github.com/software-engineering-amsterdam/sea-of-ql)
    
To start with one of the skeleton projects copy the contents of one of
the prototype projects into your private directory. E.g., on Unix-like
machines:

> cd my-user-dir
> cp -r prototypes/QLJava/* .
     
**IMPORTANT:** You are **required** to use Github. You should also
commit **regularly**: NO huge final commit before the deadline.

**IMPORTANT:** You are required to complete the lab assignment
_individually_. We will use clone detection tools to detect
plagiarism.

**IMPORTANT:** You are required to use Eclipse for the skeleton
projects.

### Deadlines

- Part 1 (front-end): 21st of January, 2013
- Part 2 (back-end):  18th of February, 2013
- Part 2 1-day part-time students: 4th of March, 2013
- Part 2 "herkansing" (max grade = 8): 4th of March, 2013
