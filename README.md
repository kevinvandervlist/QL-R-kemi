sc-ql-2012-2013-rascal
======================

* Jimi van der Woning ([@JimbowsNET](https://github.com/JimbowsNET))
* Kevin van der Vlist ([@kevinvandervlist](https://github.com/kevinvandervlist))

# About

Rascal implementation of a DSL for questionnaires, QL, which is the [assignment](http://www.languageworkbenches.net/images/5/53/Ql.pdf) 
for the [Language Workbench Competition 2013](http://www.languageworkbenches.net/index.php?title=LWC_2013). 


Questionnaires consist of (conditional) declarations of questions.
These declarations will be compiled to a interactive questionnaire consisting of a HTML form, JavaScript control flow and input checking 
and PHP input validation (resulting in a validated JSON object containing all the answers). 

The second part of this assignment was building a DSL which extends the questionnaires, by being able to declare styling attributes for the questionnaire. 
This will generate additional CSS and JavaScript to enhance the questionnaire with the styling attributes.

# Demonstration
* [A demonstration can be found here](http://ql-r-kemi.kevinvandervlist.nl/)

# Documentation
* [Form generation and deployment](doc/Generation.md) 
* [Form declaration](doc/Form.md)
* [Stylesheet declaration](doc/Stylesheet.md)
