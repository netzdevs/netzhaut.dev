\page nhcss nhcss

<div style="max-width:700px;">

\section nhcss0360 ver.0.3.6.0

2022-03-16 | rev.0.10.43.0

 ---

 Rework nhmake. Refactor a lot of stuff.

<br>\section nhcss0350 ver.0.3.5.0

2021-06-29 | rev.0.8.24.13

 ---

 Fix tokenizer issue with parsing escape sequences where the following codepoint was ignored. Improve parser architecture. Add first iteration of counter-style based maker calculation. Add CSSCounterStyleRule interface.

<br>\section nhcss0341 ver.0.3.4.1

2021-06-27 | rev.0.8.23.14

 ---

 Add experimental marker pseudo-element implementation in source-tree. Improve source-tree logging.

<br>\section nhcss0340 ver.0.3.4.0

2021-06-18 | rev.0.7.21.12

 ---

 Fix font-size computation. Improve text-align routines. Add first iteration of float-property handling. Add first iteration of width-property handling.

<br>\section nhcss0331 ver.0.3.3.1

2021-05-27 | rev.0.4.14.9

 ---

 Prepare word-break implementation.

<br>\section nhcss0330 ver.0.3.3.0

2021-05-25 | rev.0.4.14.7

 ---

 Add initial support for text-align.

<br>\section nhcss0320 ver.0.3.2.0

2021-05-22 | rev.0.4.11.7

 ---

 Add initial support for box-sizing properties. Add support for padding shorthand. Add support for margin shorthand.

<br>\section nhcss0310 ver.0.3.1.0

2021-05-22 | rev.0.4.10.7

 ---

 Improve vertical font-positioning. Fix test-run handling in box-tree. Improve box-tree parsing.

<br>\section nhcss0300 ver.0.3.0.0

2021-05-18 | rev.0.4.9.7

 ---

 Improve logging. Add fragment-tree based layout/rendering. Add inline-box fragmentation.

<br>\section nhcss0200 ver.0.2.0.0

2021-05-15 | rev.0.3.9.6

 ---

 Add nh_css_RenderContext routines. Add CSSOM interfaces. Adjust parsing routines to use CSSOM interfaces.

<br>\section nhcss0140 ver.0.1.4.0

2021-05-11 | rev.0.2.10.7

 ---

 Add first iteration of text-width. Add first iteration of text-style. Add general improvements to text-rendering.

<br>\section nhcss0131 ver.0.1.3.1

2021-05-06 | rev.0.2.7.8

 ---

 Fix mixed-content check in box-tree creation. Fix font-related interface calls.

<br>\section nhcss0130 ver.0.1.3.0

2021-05-05 | rev.0.2.7.7

 ---

 Disable bottom margin-collapse. Adjust values corresponding to border-width keywords. Improve logging.

<br>\section nhcss0120 ver.0.1.2.0

2021-05-03 | rev.0.2.6.7

 ---

 Add first iteration of border handling/rendering. Add border-radius property. Improve text-rendering by offsetting correctly using the font ascender in nh_css_getTextVertices().

<br>\section nhcss0113 ver.0.1.1.3

2021-05-01 | rev.0.2.5.9

 ---

 Improve log-formatting.

<br>\section nhcss0112 ver.0.1.1.2

2021-04-30 | rev.0.2.4.7

 ---

 Fix margin-collapse in case of padding/border separation. Adjust and potentially fix text vertices generation in nh_css_getTextVertices().

<br>\section nhcss0111 ver.0.1.1.1

2021-04-24 | rev.0.2.2.2

 ---

 Rename default.css.h to default.css.inc

<br>\section nhcss0110 ver.0.1.1.0

2021-04-24 | rev.0.2.2.1

 ---

 Improve layout algorithm in nh_css_arrangeBlockFormattingContext(). Add nh_css_isLengthValue() and nh_css_isLengthPercentageValue(). Fix not initializing ref nh_css_Declaration. Add very simple margin-collapse routine nh_css_collapse(). Fix wrong variable assignments in nh_css_computeBoxValues(). Improve font-size and margin-block/margin-inline handling.

<br>\section nhcss0100 ver.0.1.0.0

2021-04-10 | rev.0.1.0.0

 ---

 Rewrite layout engine. Replace formatting-tree with box-tree. Replace annotated-nodes with source-tree.

<br>\section nhcss0000 ver.0.0.0.0

2021-02-23 | rev.0.0.0.0

 ---

 Initial version.

<br></div>