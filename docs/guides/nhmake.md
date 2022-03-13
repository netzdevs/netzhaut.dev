Following a list of all nhmake guide documents.

   \li \subpage nhmakelangguide

\page nhmakelangguide Language Guide 

<div style="max-width:700px;">

\section nhmakelangguideabout Language Guide 
This is an informal guide for using the nhmake script language.  

\section nhmakelangguidescripts Scripts
Scripts must be submitted using <a href="runtime.html#rundef2">\_addFile\_</a> or <a href="runtime.html#rundef3">\_addData\_</a> and executed using <a href="runtime.html#rundef3">\_run\_</a>. The normative way to name a script-file is using the <code>.nhmake</code> extension. Scripts are executed in the order they are submitted. <a href="language.html#variables">Variables</a> are shared among scripts. Scripts are made of <a href="language.html#function">Functions</a> and <a href="language.html#option">Options</a>. 
<br><br>
In the next example, PROJ\_DIR, LIB\_DEST, etc. are variables, set(), lib(), compile(), mkdir(), etc. are functions and \-\-init{} is an option. Have a look.

<pre style="white-space:pre-wrap;word-wrap:break-word;text-align:justify;background-color:black;">
set(PROJ_DIR,"${WRK_DIR}")
set(LIB_DEST,"${WRK_DIR}/lib/")
set(BIN_DEST,"${WRK_DIR}/bin/")

lib(lib1,"src/lib1")
lib(lib2,"src/lib2")

compile(bin1,"-std=gnu99 -Wl,-rpath=/usr/local/lib")
link(lib2,"-L${LIB_DEST} -llib1")

source(
  lib1
  "file.c"
  lib2
  "file1.c"
  "file2.c"
)

"initialize project"
--init
{
    mkdir("downloads")
    chdir("downloads")
    system("wget -O tmp.zip https://example.com/example.zip")
    system("unzip -o tmp.zip")
}
</pre>

\section nhmakelangguidesyntax Syntax

\subsection nhmakelangguidetypes Types
There are no numeric types, only <a href="grammar.html#identifier">identifiers</a> and <a href="grammar.html#string">strings</a>. 

\subsection nhmakelangguideelements Elements

\subsubsection nhmakelangguidefuncs Functions
<a href="language.html#function">Functions</a> that are not inside an <a href="language.html#option">Option</a> will be executed once during <a href="runtime.html#rundef2">Script Execution</a>. The nhmake language provides <a href="modules.html">Standard Functions</a> which are based on build-tool specific needs. For defining your own functions, use <a href="runtime.html#apidef3">\_setFunctionCallback\_</a>. 

<pre style="white-space:pre-wrap;word-wrap:break-word;text-align:justify;">
copy("foo" "bar")
build(foo)
set(name, "jeff")
</pre>

\subsubsection nhmakelangguideopts Options 
<a href="language.html#langoption">Options</a> are executed during <a href="runtime.html#rundefs6">Arguments Execution</a> by passing <a href="language.html#langoption">Option</a> matching arguments to <a href="runtime.html#rundef3">\_run\_</a>.  

<pre style="white-space:pre-wrap;word-wrap:break-word;text-align:justify;">
"print hello world" --hello { message("hello world!") }
-h { message("hello world!") }
-h pluto { message("hello pluto!") }
</pre>

\subsubsection nhmakelangguideconds Conditionals
Conditionals are used to alter script flow and execution behavior based on variables. TODO 

<pre style="white-space:pre-wrap;word-wrap:break-word;text-align:justify;">
TODO
</pre>

\subsection nhmakelangguidevars Variables
Variables are set and changed using the set() function. They can be used in strings via <code>${VARIABLE}</code>. There are a number of <a href="variables.html">Standard Variables</a>.

<br>

</div>

