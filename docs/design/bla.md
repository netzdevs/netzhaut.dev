\page blaaaa Blaaaaa

Here you can find design documents for all modules.

   \li \subpage nhmake

\page nhmake nhmake

Following a list of all nhmake design documents.

   \li \subpage nhmakelanguage
   \li \subpage nhmakeruntime
   \li \subpage nhmakegrammar

\page nhmakelanguage Language Specification

<div style="max-width:700px;">

\section langabout Language Specification
This is the language specification for the nhmake Language.  
<br>

The <b id="lang">nhmake Language</b> is a script-language specifically designed for <b id="#specbuildtool">build-tool</b> related tasks. 
Build-tool related tasks include building, installing and configuring project specific components such as source-code and other data. 

\section langrabstract Abstract
Scripts written in the nhmake Language are made up of <a href="#langfunction">Function</a>, <a href="#langoption">Option</a> and <a href="#langconditional">Conditional</a> elements. <a href="#langfunction">Function</a> elements can be executed and create diverse functionality. <a href="modules.html">Standard Functions</a> are <a href="#langfunction">Function</a> elements and provide default functionality mainly focused on <a href="#specbuildtool">build-tool</a> related tasks. <a href="#langoption">Option</a> elements are made up of <a href="#langfunction">Function</a> elements and can be executed dynamically by passing arguments to <a href="runtime.html#runapi2">\_run\_</a>. <a href="#langconditional">Conditional</a> elements are TODO.  
<br>
Variables can be set and accessed using special notation inside strings. <a href="variables.html">Standard Variables</a> allow control over specific runtime parameters.

\section langscripts Scripts
A script can be either a script-file or just script-data. The normative way to name a script-file is using the <code>.sm</code> extension. Scripts are added to a <a href="runtime.html#runrun">Runtime</a> using <a href="runtime.html#runapi1">\_addFile\_</a> or \_addData\_ and are executed using <a href="runtime.html#runapi2">\_run\_</a>. Scripts are made up of <a href="langelements">Language Elements</a>.

\section langelements Language Elements

\subsection langfunction Function

A <a href="#langfunction">Function</a> element is identified by an <a href="grammar.html#identifier">identifier</a> and uses round parentheses to enclose arguments. A function can have any number of <a href="grammar.html#identifier">identifier</a> or <a href="grammar.html#string">string</a> arguments. Commas between arguments are optional.

\subsubsection langfunctionexamples Examples

<pre style="white-space:pre-wrap;word-wrap:break-word;text-align:justify;">
<a href="grammar.html#identifier">identifier</a>()
<a href="grammar.html#identifier">identifier</a>(<a href="grammar.html#identifier">identifier</a>, <a href="grammar.html#string">string</a>)
<a href="grammar.html#identifier">identifier</a>(<a href="grammar.html#string">string</a> <a href="grammar.html#identifier">identifier</a>)
<a href="grammar.html#identifier">identifier</a>(<a href="grammar.html#string">string</a>, <a href="grammar.html#string">string</a> <a href="../../dev/html/grammar.html#string">string</a>)
</pre>

\subsubsection langfunctionsemantics Semantics
<a href="#langfunction">Function</a> elements are executed during <a href="runtime.html#rundef2">Script Execution</a> or during <a href="runtime.html#rundef4">Arguments Execution</a>. When <a href="runtime.html#rundef6">Function Callback Execution</a> does not apply, a <a href="#langfunction">Function</a> element must match a <a href="modules.html">Standard Function</a>.

\subsection langoption Option

<a href="#langoption">Option</a> elements are identified by an <a href="grammar.html#identifier">identifier</a> and can be prefixed with a string for description purposes. An option is either a long-option declared using a <code>\-\-</code> <a href="grammar.html#identifier">identifier</a>-prefix or a short-option declared using a <code>\-</code> <a href="#langidentifier">identfier</a>-prefix. An option block can have any number of <a href="#langfunction">Function</a> elements. Between option identifier and option block can be any number of arguments in the form of additional identifiers.

\subsubsection langoptionexamples Examples
<pre style="white-space:pre-wrap;word-wrap:break-word;text-align:justify;">
--<a href="grammar.html#identifier">identifier</a> {}
-<a href="grammar.html#identifier">identifier</a> <a href="grammar.html#identifier">identifier</a> {}
<a href="grammar.html#string">string</a> -<a href="grammar.html#identifier">identifier</a> {}
<a href="grammar.html#string">string</a> --<a href="grammar.html#identifier">identifier</a> <a href="grammar.html#identifier">identifier</a> <a href="grammar.html#identifier">identifier</a> {<a href="#langfunction">Function</a>}
--<a href="grammar.html#identifier">identifier</a> {<a href="#langfunction">Function</a> <a href="#langfunction">Function</a>}
</pre>

\subsubsection langoptionsemantics Semantics
<a href="#langoption">Option</a> elements are executed during <a href="runtime.html#rundef4">Arguments Execution</a>. 

\subsection langconds Conditional

<a href="#langconds">Conditional</a> elements are identified by an <a href="grammar.html#identifier">identifier</a> and use curly parentheses to enclose other elements. TODO

\subsubsection langcondsexamples Examples
<pre style="white-space:pre-wrap;word-wrap:break-word;text-align:justify;">
TODO
</pre>

\subsubsection langcondsemantics Semantics
<a href="#langcond">Conditional</a> elements are TODO. 

\section langvars Variables

A variable is declared and changed using the set() standard function. 

\subsection langvarspreprocess String Preprocessing
<a href="#langfunction">Function</a> arguments in the form of strings are preprocessed by expanding variable references. A variable can be referenced by using the reference notation <code>${EXAMPLE}</code>. A full string using a variable reference could look like <code>"My name is ${NAME}"</code> and would possibly be replaced after preprocessing to <code>"My name is Mud"</code>.

\subsection langvarsstandard Standard Variables
Some variables are builtin and control the behavior of the runtime. They can be changed just as any other variable. These variables are known as <a href="variables.html">Standard Variables</a>.

<br>

</div>

\page nhmakeruntime Runtime Specification

<div style="max-width:700px;">

\section runabout Runtime Specification
This document defines the nhmake Language Runtime for implementers.  
<br>
An <b href="runimpl">implementation</b> is written by implementers in a specific programming-language such as <code>C, C++ or Java</code>. Implementations must provide an API to create a nhmake Language Runtime that behaves as described in this document. 
<br>

\section runrun Runtime
A nhmake Language Runtime executes scripts written in the nhmake Language by implementing the <a href="#runapi">Abstract API</a> in an <a href="runimpl">implementation</a> specific way. Furthermore, a runtime implements the <a href="modules.html">Standard Functions</a> and <a href="variables.html">Standard Variables</a> according to their definitions and makes them usable through the nhmake Language. 
<br>

\section rundef Abstract Definitions 

\subsection rundef1 Script Parsing
A script-file must be parsed using a <a href="grammar.html">Language Grammar</a> parser. The nature of the parser-output format is not defined.

\subsection rundef2 Script Execution 
For script execution, <a href="#languagefunction">Function</a> elements belonging to a parser-output must be executed from top to bottom, excluding <a href="#languagefunction">Function</a> elements inside <a href="#languageoption">Option</a> elements. 

\subsection rundef9 Option Match
An Option can be matched to a number of arguments. An Option matches a number of arguments if the Option type and the identifier matches the first argument and the next arguments match all of the Object arguments. 

\subsection rundef3 Arguments Matching
Arguments are matched against all Options from all parser-outputs using <a href="#rundef9">Option Match</a>. Matching must be implemented using a greedy algorithm, meaning that between all matching Option elements, the Option element with the highest count of arguments is chosen.  
<br>
If a operation was succesfully matched and the next argument is not an Option identifier, then arguments must be matched using the Option identifier of the previous match.  

\subsection rundef4 Arguments Execution 
Arguments are executed by finding the next arguments match using the <a href="rundef3">Arguments Matching</a> rules and executing the corresponding Option element using <a href="#rundef8">Option Execution</a>.  
<br>
This goes on by advancing through the arguments, using the matched length of previous matches, until all arguments are matched.

\subsection rundef8 Option Execution 
An option is executed by executing all Function elements inside the option-block. The Function elements must be executed in order from top to bottom.

\subsection rundef5 Function Structure
A function structure corresponds to a Function element and must have the following attributes.
- function name
- function arguments

\subsection rundef6 Function Callback Execution
If a Function element is executed, either by <a href="rundef4">Arguments Execution</a> or <a href="rundef2">Script Execution</a> and a function callback has been set, then the function callback must be executed using the corresponding <a href="rundef5">Function Structure</a> as a argument.

\subsection rundef7 Print Format 
Text based output must be format in a specific way. Each message must be prefixed by the runtime name.

\section runapi Abstract API

\subsection runapi1 \_addFile\_
The \_addFile\_ interface exposes the ability to add script-files to the internal list of scripts. 

\subsection runapi5 \_addData\_
The \_addData\_ interface exposes the ability to add script-data to the internal list of scripts. 

\subsection runapi2 \_run\_
The runtime must expose an interface for the purpose of executing scripts. First, all scripts are parsed according to <a href="rundef1">Script Parsing</a>. Next, for each parser-output, the Function elements must be executed as defined by <a href="rundef2">Script Execution</a>. At last, arguments provided to \_run\_ are executed with rules defined in <a href="rundef4">Arguments Execution</a>. 

\subsection runapi3 \_setFunctionCallback\_
The \_setFunctionCallback\_ interface sets a function callback which is executed according to <a href="rundef6">Function Callback Execution</a>.

\subsection runapi4 \_messagef\_
The \_messagef\_ interface prints a message argument using <a href="rundef7">Print Format</a>. 

<br>

</div>

\page nhmakegrammar Language Grammar

<div style="max-width:700px;">

\section grammarabout Language Grammar

This document defines a LL(1) grammar whose start symbol, <a href="#Definitions">Definitions</a>, matches an input sequence which can be parsed by a nhmake Language Parser.  
<br>
Each production in the grammar has on its right hand side either a non-zero sequence of terminal and non-terminal symbols, or an epsilon (ε) which indicates no symbols. Symbols that begin with an uppercase letter are non-terminal symbols.  
<br>
Composed terminal symbols begin with a lower-cased letter and are matched by following regular expressions:  

<div style="margin:10px;font-family:monospace;">
  <table style="background-color:inherit;">
    <tr>
      <td><b id="identifier">identifier</b></td><td><code>/[_]?[A-Za-z][A-Z_a-z-]*/</code></td>
    </tr>
    <tr>
      <td><b id="string">string</b></td><td><code>\"[^\"]*\"</code></td>
    </tr>
    <tr>
      <td><b id="whitespace">whitespace</b></td><td><code>/[\\t\\n\\r ]+/</code></td>  
    </tr>
    <tr>
      <td><b id="comment">comment</b></td><td><code>/\\/\\/.*/</code></td>
    </tr>
  </table>
</div>

Implicitly, any number of whitespace and comment terminals are allowed between every other terminal in the input text being parsed. Such whitespace and comment terminals are ignored while parsing.  

\section grammar Grammar

<b id="Definitions">Definitions</b> ::  
<div style="margin:10px;">
  <a href="#Definition">Definition</a> <a href="#Definitions">Definitions</a>  
  ε
</div>

<b id="Definition">Definition</b> ::  
<div style="margin:10px;">
  <a href="#Conditional">Conditional</a>   
  <a href="#Function">Function</a>   
  <a href="#Option">Option</a>  
</div>

<b id="Conditional">Conditional</b> ::  
<div style="margin:10px;">
  <a href="#identifier">identifier</a> <a href="#ConditionalBlock">ConditionalBlock</a>
</div>

<b id="Function">Function</b> ::  
<div style="margin:10px;">
  <a href="#identifier">identifier</a> ( <a href="#FunctionArguments">FunctionArguments</a> )
</div>

<b id="FunctionArguments">FunctionArguments</b> ::  
<div style="margin:10px;">
  <a href="#IdentifierOrString">IdentifierOrString</a> <a href="#FunctionArguments">FunctionArguments</a>  
  <a href="#IdentifierOrString">IdentifierOrString</a> , <a href="#FunctionArguments">FunctionArguments</a>  
  ε
</div>
   
<b id="IdentifierOrString">IdentifierOrString</b> ::  
<div style="margin:10px;">
  <a href="#identifier">identifier</a>  
  <a href="#string">string</a>
</div>

<b id="Option">Option</b> ::  
<div style="margin:10px;">
  <a href="#Description">Description</a> <a href="#ShortOption">ShortOption</a>  
  <a href="#Description">Description</a> <a href="#LongOption">LongOption</a>  
</div>
 
<b id="Description">Description</b> ::  
<div style="margin:10px;">
  <a href="#string">string</a>  
  ε
</div>

<b id="ShortOption">ShortOption</b> ::  
<div style="margin:10px;">
  \- <a href="#identifier">identifier</a> <a href="#OptionArguments">OptionArguments</a> <a href="#OptionBlock">OptionBlock</a>  
</div>

<b id="LongOption">LongOption</b> ::  
<div style="margin:10px;">
  \- \- <a href="#identifier">identifier</a> <a href="#OptionArguments">OptionArguments</a> <a href="#OptionBlock">OptionBlock</a>  
</div>

<b id="OptionArguments">OptionArguments</b> ::  
<div style="margin:10px;">
  <a href="#identifier">identifier</a> <a href="#OptionArguments">OptionArguments</a>  
  ε
</div>

<b id="OptionBlock">OptionBlock</b> ::  
<div style="margin:10px;">
  { <a href="#OptionBlockContent">OptionBlockContent</a> }  
</div>

<b id="OptionBlockContent">OptionBlockContent</b> ::  
<div style="margin:10px;">
  <a href="#Function">Function</a> <a href="#OptionBlockContent">OptionBlockContent</a>  
  ε
</div>

<b id="ConditionalBlock">ConditionalBlock</b> ::  
<div style="margin:10px;">
  { <a href="#ConditionalBlockContent">ConditionalBlockContent</a> }  
</div>

<b id="ConditionalBlockContent">ConditionalBlockContent</b> ::  
<div style="margin:10px;">
  <a href="#Conditional">Conditional</a> <a href="#ConditionalBlockContent">ConditionalBlockContent</a>  
  <a href="#Function">Function</a> <a href="#ConditionalBlockContent">ConditionalBlockContent</a>  
  <a href="#Option">Option</a> <a href="#ConditionalBlockContent">ConditionalBlockContent</a>  
  ε
</div>

</div>

