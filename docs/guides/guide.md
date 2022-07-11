\page guide Development Guide

<div style="max-width:700px;">

\section modules Modules 

The implementation is divided into following libraries (or modules): 

- [nhcore](group__nhcore.html)
- [nhwsi](group__nhwsi.html)
- [nhtty](group__nhtty.html)
- [nhnetwork](group__nhnetwork.html)
- [nhecmascript](group__nhecmascript.html)
- [nhhtml](group__nhhtml.html)
- [nhwebidl](group__nhwebidl.html)
- [nhencoding](group__nhencoding.html)
- [nhdom](group__nhdom.html)
- [nhgfx](group__nhgfx.html)
- [nhcss](group__nhcss.html)
- [nhurl](group__nhurl.html)

This list excludes the netzhaut library since it acts solely as the API, thus providing not much functionality other than a little bit of initialization and dispatching. 

\section specs Specifications

The following specifications are actively used in development. Implementing a web-browser-engine isn't possible without them. Implementers must use these specifications whenever they are relevant. 
Also, some specifications are living documents or might become deprecated and implementers need to act accordingly.  

\subsection specsw3c World Wide Web Consortium (W3C)
- [CSS Backgrounds and Borders Module Level 3](https://www.w3.org/TR/css-backgrounds-3/)
- [CSS Box Model Module Level 4](https://www.w3.org/TR/css-box-4/)
- [CSS Box Sizing Module Level 3](https://www.w3.org/TR/css-sizing-3/)
- [CSS Cascading and Inheritance Level 5](https://www.w3.org/TR/css-cascade-5/)
- [CSS Color Module 4](https://www.w3.org/TR/css-color-4/)
- [CSS Counter Styles Level 3](https://drafts.csswg.org/css-counter-styles-3)
- [CSS Display Module Level 3](https://www.w3.org/TR/css-display-3/)
- [CSS Fragmentation Module Level 4](https://www.w3.org/TR/css-break-4/)
- [CSS Fonts Module Level 4](https://www.w3.org/TR/css-fonts-4/)
- [CSS Inline Layout Module Level 3](https://www.w3.org/TR/css-inline-3)
- [CSS Lists and Counters Module Level 3](https://drafts.csswg.org/css-lists-3)
- [CSS Logical Properties and Values Level 1](https://www.w3.org/TR/css-logical-1)
- [CSS Object Model (CSSOM)](https://www.w3.org/TR/cssom-1/)
- [CSS Style Attributes](https://www.w3.org/TR/css-style-attr/)
- [CSS Syntax Module Level 3](https://www.w3.org/TR/css-syntax-3/)
- [CSS Text Module Level 3](https://www.w3.org/TR/css-text-3)
- [CSS Values and Units Module Level 4](https://www.w3.org/TR/css-values-4/)
- [CSS Writing Modes Level 4](https://www.w3.org/TR/css-writing-modes-4/)
- [Selectors Level 4](https://www.w3.org/TR/selectors-4/)
- [FileAPI](https://w3c.github.io/FileAPI/)
- [WebIDL](https://heycam.github.io/webidl/)  

\subsection specswhatwg Web Hypertext Application Technology Working Group (WHATWG)
- [DOM](https://dom.spec.whatwg.org/)  
- [Encoding](https://encoding.spec.whatwg.org/)
- [HTML](https://html.spec.whatwg.org/multipage/)  
- [URL](https://url.spec.whatwg.org/)  

\subsection specsecma ecma
- [ecma-262 (ECMAScript)](https://www.ecma-international.org/ecma-262/)  

\subsection specsdec Digital Equipment Corporation (DEC)
- [VT100](https://vt100.net/docs/vt100-ug/chapter3.html)  

\subsection specsietf Internet Engineering Task Force (IETF)
- [RFC3492: Punycode: A Bootstring encoding of Unicode for IDNA](https://www.ietf.org/rfc/rfc3492.txt)

\subsection suppunicode Unicode Consortium
- [Unicode IDNA Compatibility Processing](https://www.unicode.org/reports/tr46)

\section suppspecs Supplementary Specifications 

Supplementary specifications are relevant but probably not used directly in development. Thus, the following entries
are mostly anecdotes.  

\subsection suppspecsiso ISO/IEC
- [9899:TC3 (C99)](http://www.open-std.org/jtc1/sc22/WG14/www/docs/n1256.pdf) 
- [C9X Rationale](http://www.open-std.org/jtc1/sc22/wg14/www/docs/n897.pdf) 

\subsection suppspecsietf Internet Engineering Task Force (IETF)
- [RFC4291: IP Version 6 Addressing Architecture](https://datatracker.ietf.org/doc/html/rfc4291)

\subsection wsi WSI
- [Extended Window Manager Hints](https://specifications.freedesktop.org/wm-spec/wm-spec-latest.html)

</div>

