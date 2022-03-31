\page nhcss nhcss

<div style="max-width:700px;">

\section nhcss0360 v0.3.6.0

<pre>
2022-03-16
</pre>

 Rework nhmake. Refactor a lot of stuff.



\section nhcss0350 v0.3.5.0

<pre>
2021-06-29
</pre>

 Fix tokenizer issue with parsing escape sequences where the following codepoint was ignored. Improve parser architecture. Add first iteration of counter-style based maker calculation. Add CSSCounterStyleRule interface.



\section nhcss0341 v0.3.4.1

<pre>
2021-06-27
</pre>

 Add experimental marker pseudo-element implementation in source-tree. Improve source-tree logging.



\section nhcss0340 v0.3.4.0

<pre>
2021-06-18
</pre>

 Fix font-size computation. Improve text-align routines. Add first iteration of float-property handling. Add first iteration of width-property handling.



\section nhcss0331 v0.3.3.1

<pre>
2021-05-27
</pre>

 Prepare word-break implementation.



\section nhcss0330 v0.3.3.0

<pre>
2021-05-25
</pre>

 Add initial support for text-align.



\section nhcss0320 v0.3.2.0

<pre>
2021-05-22
</pre>

 Add initial support for box-sizing properties. Add support for padding shorthand. Add support for margin shorthand.



\section nhcss0310 v0.3.1.0

<pre>
2021-05-22
</pre>

 Improve vertical font-positioning. Fix test-run handling in box-tree. Improve box-tree parsing.



\section nhcss0300 v0.3.0.0

<pre>
2021-05-18
</pre>

 Improve logging. Add fragment-tree based layout/rendering. Add inline-box fragmentation.



\section nhcss0200 v0.2.0.0

<pre>
2021-05-15
</pre>

 Add nh_css_RenderContext routines. Add CSSOM interfaces. Adjust parsing routines to use CSSOM interfaces.



\section nhcss0140 v0.1.4.0

<pre>
2021-05-11
</pre>

 Add first iteration of text-width. Add first iteration of text-style. Add general improvements to text-rendering.



\section nhcss0131 v0.1.3.1

<pre>
2021-05-06
</pre>

 Fix mixed-content check in box-tree creation. Fix font-related interface calls.



\section nhcss0130 v0.1.3.0

<pre>
2021-05-05
</pre>

 Disable bottom margin-collapse. Adjust values corresponding to border-width keywords. Improve logging.



\section nhcss0120 v0.1.2.0

<pre>
2021-05-03
</pre>

 Add first iteration of border handling/rendering. Add border-radius property. Improve text-rendering by offsetting correctly using the font ascender in nh_css_getTextVertices().



\section nhcss0113 v0.1.1.3

<pre>
2021-05-01
</pre>

 Improve log-formatting.



\section nhcss0112 v0.1.1.2

<pre>
2021-04-30
</pre>

 Fix margin-collapse in case of padding/border separation. Adjust and potentially fix text vertices generation in nh_css_getTextVertices().



\section nhcss0111 v0.1.1.1

<pre>
2021-04-24
</pre>

 Rename default.css.h to default.css.inc



\section nhcss0110 v0.1.1.0

<pre>
2021-04-24
</pre>

 Improve layout algorithm in nh_css_arrangeBlockFormattingContext(). Add nh_css_isLengthValue() and nh_css_isLengthPercentageValue(). Fix not initializing ref nh_css_Declaration. Add very simple margin-collapse routine nh_css_collapse(). Fix wrong variable assignments in nh_css_computeBoxValues(). Improve font-size and margin-block/margin-inline handling.



\section nhcss0100 v0.1.0.0

<pre>
2021-04-10
</pre>

 Rewrite layout engine. Replace formatting-tree with box-tree. Replace annotated-nodes with source-tree.



\section nhcss0000 v0.0.0.0

<pre>
2021-02-23
</pre>

 Initial version.



</div>