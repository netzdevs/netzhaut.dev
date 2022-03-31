\page nhgfx nhgfx

<div style="max-width:700px;">

\section nhgfx0050 v0.0.5.0

<pre>
2022-03-16
</pre>

 Rework nhmake. Refactor a lot of stuff.



\section nhgfx0041 v0.0.4.1

<pre>
2021-06-14
</pre>

 Add nh_gfx_vk_reloadFontTexture(). Fix wrong scissor position for vulkan viewports.



\section nhgfx0040 v0.0.4.0

<pre>
2021-06-12
</pre>

 Add nh_gfx_claimViewport() to streamline viewport claiming. Add monospace font-family names. Add nh_gfx_createTextFromFont().



\section nhgfx0032 v0.0.3.2

<pre>
2021-05-25
</pre>

 Fix nh_gfx_getFittingTextLength() by calculating width based on pixel.



\section nhgfx0031 v0.0.3.1

<pre>
2021-05-16
</pre>

 Add codepoint to ref nh_gfx_Glyph.



\section nhgfx0030 v0.0.3.0

<pre>
2021-05-10
</pre>

 Fix text-width calculation by changing float-addition to int-addition in nh_gfx_getTextWidth(). Set fallback font-weight to 400 when parsing fails. Add nh_gfx_createText() for rendering text using multiple fonts.



\section nhgfx0020 v0.0.2.0

<pre>
2021-05-06
</pre>

 Create new directory for font-related stuff. Add first iteration of generic font-family handling. Improve general font-handling. Improve font-logging.



\section nhgfx0010 v0.0.1.0

<pre>
2021-04-30
</pre>

 Change nh_gfx_getGlyph(), nh_gfx_getTextHeight(), and nh_gfx_getTextWidth() to accept UTF32 arguments instead of UTF8. Improve font rendering by adding Harfbuzz routines. Improve font logging. Remove font-prototype concept.



\section nhgfx0000 v0.0.0.0

<pre>
2021-02-23
</pre>

 Initial version.



</div>