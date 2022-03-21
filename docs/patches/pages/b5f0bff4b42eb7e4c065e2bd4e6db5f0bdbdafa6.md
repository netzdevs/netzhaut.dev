\page b5f0bff4b42eb7e4c065e2bd4e6db5f0bdbdafa6 Rework nhmake. Refactor a lot of stuff.

Rework nhmake. Refactor a lot of stuff.

---

\htmlonly
<pre>
commit b5f0bff4b42eb7e4c065e2bd4e6db5f0bdbdafa6
Author: Dajo Frey <dajofrey+github@gmail.com>
Date:   Mon Mar 14 23:09:20 2022 +0100

    Rework nhmake. Refactor a lot of stuff.

diff --git a/CHANGES.txt b/CHANGES.txt
new file mode 100644
index 0000000..ee3c2f7
--- /dev/null
+++ b/CHANGES.txt
@@ -0,0 +1,11 @@
+changes{
+  summary: "Rework nhmake. Refactor a lot of stuff."
+  workload {
+    lib: "netzhaut", "nhcss", "nhcore", "nhdom", "nhecmascript", "nhencoding", "nhgfx", "nhhtml", "nhmake", "nhnetwork", "nhrenderer", "nhterm", "nhtty", "nhurl", "nhwebidl", "nhwsi"
+    bin: "nhmake"
+    scope: "minor"
+    author {
+      name: "Dajo Frey"
+    }
+  }
+}
diff --git a/HISTORY.txt b/HISTORY.txt
new file mode 100644
index 0000000..aac60c7
--- /dev/null
+++ b/HISTORY.txt
@@ -0,0 +1,89 @@
+changes{date:"2021-10-07"summary:"Add core functions."workload{scope:"minor"lib:"netzhaut"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-09-24"summary:"Add nhecmascript functions."workload{scope:"minor"lib:"netzhaut"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-09-09"summary:"Add convenience function nh_encoding_compareUTF32ASCII()."workload{scope:"minor"lib:"nhencoding"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-08-12"summary:"Improve testing. Improve parsing."workload{scope:"minor"lib:"nhurl"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-07-22"summary:"Initial version."workload{lib:"nhurl"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-07-14"summary:"Add nh_appendByteToString() and nh_removeFromString(). Rename bytes_p field in nh_String. Improve nh_appendToArray() by ensuring that data is NULL terminated."workload{scope:"minor"lib:"nhcore"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-07-08"summary:"Add abstract \ref nh_encoding_String interface. Add nh_encoding_splitUTF32(). Add nh_encoding_digitsToNumber()."workload{scope:"major"lib:"nhencoding"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-07-03"summary:"Add 'nhurl' data to loader. Improve major-version handling in loader by adding the possibility to specify -1 instead of a valid major-version."workload{scope:"minor"lib:"nhcore"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-06-29"summary:"Change nh_encoding_compareUTF32() parameters. Add nh_encoding_hexDigitToNumber()."workload{scope:"minor"lib:"nhencoding"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-06-29"summary:"Fix tokenizer issue with parsing escape sequences where the following codepoint was ignored. Improve parser architecture. Add first iteration of counter-style based maker calculation. Add CSSCounterStyleRule interface."workload{scope:"minor"lib:"nhcss"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-06-27"summary:"Add experimental marker pseudo-element implementation in source-tree. Improve source-tree logging."workload{scope:"patch"lib:"nhcss"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-06-24"summary:"Add basic thread logging. Improve workload handling."workload{scope:"minor"lib:"nhcore"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-06-23"summary:"Add first iteration of nhrenderer interface. Replace nhcss interface functions."workload{scope:"major"lib:"netzhaut"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-06-23"summary:"Initial version."workload{lib:"nhrenderer"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-06-23"summary:"Fix logger update routine constantly setting the refresh flag."workload{scope:"patch"lib:"nhtty"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-06-23"summary:"Adjust dependency handling of loader. Rename loader functions. Add nh_loadExistingSymbol()."workload{scope:"minor"lib:"nhcore"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-06-21"summary:"Change loading function of initializer routines."workload{scope:"patch"lib:"nhwebidl"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-06-21"summary:"Adjust CSS dependencies."workload{scope:"patch"lib:"nhhtml"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-06-18"summary:"Fix font-size computation. Improve text-align routines. Add first iteration of float-property handling. Add first iteration of width-property handling."workload{scope:"minor"lib:"nhcss"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-06-15"summary:"Add background-color variable."workload{scope:"patch"lib:"nhterm"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-06-15"summary:"Make slight changes to logger visuals."workload{scope:"patch"lib:"nhtty"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-06-15"summary:"Improve input handling."workload{scope:"minor"lib:"nhtty"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-06-14"summary:"Rewrite event-handling structures. Simplify keyboard handling. Add event callback."workload{scope:"minor"lib:"nhwsi"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-06-14"summary:"Add nh_gfx_vk_reloadFontTexture(). Fix wrong scissor position for vulkan viewports."workload{scope:"patch"lib:"nhgfx"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-06-14"summary:"Add first iteration of nhterm interface. Add nhwsi functions. Add and rename nhtty functions."workload{scope:"major"lib:"netzhaut"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-06-12"summary:"Add nh_gfx_claimViewport() to streamline viewport claiming. Add monospace font-family names. Add nh_gfx_createTextFromFont()."workload{scope:"minor"lib:"nhgfx"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-06-12"summary:"Add missing nhterm entry in nh_logModules()."workload{scope:"patch"lib:"nhcore"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-06-11"summary:"Add nhtty functions. Change file names."workload{scope:"minor"lib:"netzhaut"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-06-11"summary:"Add view callbacks and view data to programs. Rewrite various routines for future nhterm integration."workload{scope:"minor"lib:"nhtty"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-06-10"summary:"Initial version."workload{lib:"nhterm"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-06-10"summary:"Rename names containing 'Terminal' using the more precise name 'TTY'. Fix shell program so that it's now usable in a basic manner."workload{scope:"major"lib:"nhtty"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-06-10"summary:"Add 'nhterm' data to loader."workload{scope:"patch"lib:"nhcore"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-06-09"summary:"Improve UTF8 decoding functions by adding read parameters."workload{scope:"patch"lib:"nhencoding"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-06-08"summary:"Merge nhloader module into nhcore. Improve loader robustness. Add module logging routine."workload{scope:"major"lib:"nhcore"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-06-08"summary:"Fix drawing issues when disabling tree-listing in editor. Improve codepoint deletion in editor. Add tab-to-spaces configuration commands. Improve logger drawing. Fix logger cursor."workload{scope:"minor"lib:"nhtty"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-06-07"summary:"Improve messages and path handling in editor. Add first iteration of text-file search."workload{scope:"minor"lib:"nhtty"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-06-07"summary:"Add nh_encoding_compareUTF32(). Add nh_encoding_appendUTF32Codepoint(). Rename some UTF32 functions."workload{scope:"minor"lib:"nhencoding"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-06-06"summary:"Improve text-file navigation and internal processing. Add copy/paste in editor. Improve console"workload{scope:"minor"lib:"nhtty"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-06-05"summary:"Fix allocation size argument for realloc call in nh_removeTailFromArray()"workload{scope:"patch"lib:"nhcore"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-06-03"summary:"Introduce \ref nh_tty_Status. Improve design and runtime behavior. Simplify console."workload{scope:"minor"lib:"nhtty"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-05-31"summary:"Improve design. Add new-file functionality. Fix some file-editor bugs."workload{scope:"minor"lib:"nhtty"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-05-31"summary:"Improve nh_writeBytesToFile()."workload{scope:"patch"lib:"nhcore"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-05-30"summary:"Add simple UTF32 matching function."workload{scope:"minor"lib:"nhencoding"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-05-29"summary:"Improve messages. Fix some file-editor bugs."workload{scope:"minor"lib:"nhtty"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-05-29"summary:"Add UTF32 functions."workload{scope:"minor"lib:"nhencoding"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-05-28"summary:"Reorganize files."workload{scope:"patch"lib:"nhwsi"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-05-28"summary:"Rearrange source files. Delete legacy source files."workload{scope:"patch"lib:"nhcore"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-05-27"summary:"Fix Promise<> type parsing."workload{scope:"patch"lib:"nhwebidl"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-05-27"summary:"Prepare word-break implementation."workload{scope:"patch"lib:"nhcss"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-05-25"summary:"Fix nh_gfx_getFittingTextLength() by calculating width based on pixel."workload{scope:"patch"lib:"nhgfx"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-05-25"summary:"Add initial support for text-align."workload{scope:"minor"lib:"nhcss"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-05-24"summary:"Add nh_dom_getAttrByLocalName()."workload{scope:"minor"lib:"nhdom"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-05-22"summary:"Add implementation of nh_html_reconstructActiveFormattingElements(). Make nh_html_getTagIndex() more robust. Add HTMLElement interface implementation."workload{scope:"minor"lib:"nhhtml"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-05-22"summary:"Add initial support for box-sizing properties. Add support for padding shorthand. Add support for margin shorthand."workload{scope:"minor"lib:"nhcss"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-05-22"summary:"Improve vertical font-positioning. Fix test-run handling in box-tree. Improve box-tree parsing."workload{scope:"minor"lib:"nhcss"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-05-18"summary:"Improve logging. Add fragment-tree based layout/rendering. Add inline-box fragmentation."workload{scope:"major"lib:"nhcss"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-05-16"summary:"Add codepoint to \ref nh_gfx_Glyph."workload{scope:"patch"lib:"nhgfx"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-05-15"summary:"Add nh_css_RenderContext routines. Add CSSOM interfaces. Adjust parsing routines to use CSSOM interfaces."workload{scope:"major"lib:"nhcss"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-05-14"summary:"Move some CSS related routines to nhcss. Adjust nh_html_createDocumentContext()"workload{scope:"minor"lib:"nhhtml"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-05-14"summary:"Add nh_dom_getText()."workload{scope:"minor"lib:"nhdom"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-05-13"summary:"Add CSS RenderContext concept. Adjust HTML API."workload{scope:"minor"lib:"netzhaut"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-05-11"summary:"Add first iteration of text-width. Add first iteration of text-style. Add general improvements to text-rendering."workload{scope:"minor"lib:"nhcss"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-05-10"summary:"Fix text-width calculation by changing float-addition to int-addition in nh_gfx_getTextWidth(). Set fallback font-weight to 400 when parsing fails. Add nh_gfx_createText() for rendering text using multiple fonts."workload{scope:"minor"lib:"nhgfx"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-05-06"summary:"Create new directory for font-related stuff. Add first iteration of generic font-family handling. Improve general font-handling. Improve font-logging."workload{scope:"minor"lib:"nhgfx"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-05-06"summary:"Fix mixed-content check in box-tree creation. Fix font-related interface calls."workload{scope:"patch"lib:"nhcss"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-05-05"summary:"Disable bottom margin-collapse. Adjust values corresponding to border-width keywords. Improve logging."workload{scope:"minor"lib:"nhcss"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-05-03"summary:"Add first iteration of border handling/rendering. Add border-radius property. Improve text-rendering by offsetting correctly using the font ascender in nh_css_getTextVertices()."workload{scope:"minor"lib:"nhcss"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-05-01"summary:"Improve log-formatting."workload{scope:"patch"lib:"nhcss"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-04-30"summary:"Change nh_gfx_getGlyph(), nh_gfx_getTextHeight(), and nh_gfx_getTextWidth() to accept UTF32 arguments instead of UTF8. Improve font rendering by adding Harfbuzz routines. Improve font logging. Remove font-prototype concept."workload{scope:"minor"lib:"nhgfx"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-04-30"summary:"Fix margin-collapse in case of padding/border separation. Adjust and potentially fix text vertices generation in nh_css_getTextVertices()."workload{scope:"patch"lib:"nhcss"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-04-29"summary:"Fix not setting any node-parent int nh_html_createElementForToken()"workload{scope:"patch"lib:"nhhtml"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-04-29"summary:"Add nh_dom_setParentNode() and nh_dom_getParentNode(). Add nh_dom_getParentElement()."workload{scope:"minor"lib:"nhdom"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-04-25"summary:"Move specifications to build/.idl. Rename generated files extension from .idl.h to .idl.inc."workload{scope:"patch"lib:"nhwebidl"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-04-29"summary:"Move Unicode.h and UnicodeLookup.h files to the nhencoding library."workload{scope:"patch"lib:"nhcore"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-04-24"summary:"Rename default.css.h to default.css.inc"workload{scope:"patch"lib:"nhcss"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-04-24"summary:"Improve layout algorithm in nh_css_arrangeBlockFormattingContext(). Add nh_css_isLengthValue() and nh_css_isLengthPercentageValue(). Fix not initializing \ref nh_css_Declaration. Add very simple margin-collapse routine nh_css_collapse(). Fix wrong variable assignments in nh_css_computeBoxValues(). Improve font-size and margin-block/margin-inline handling."workload{scope:"minor"lib:"nhcss"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-04-10"summary:"Rewrite layout engine. Replace formatting-tree with box-tree. Replace annotated-nodes with source-tree."workload{scope:"major"lib:"nhcss"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-02-23"summary:"Initial version."workload{lib:"nhtty"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-02-23"summary:"Initial version."workload{lib:"nhwsi"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-02-23"summary:"Initial version."workload{lib:"nhwebidl"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-02-23"summary:"Initial version."workload{lib:"nhnetwork"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-02-23"summary:"Initial version."workload{lib:"nhhtml"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-02-23"summary:"Initial version."workload{lib:"nhgfx"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-02-23"summary:"Initial version."workload{lib:"nhencoding"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-02-23"summary:"Initial version."workload{lib:"nhecmascript"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-02-23"summary:"Initial version."workload{lib:"nhdom"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-02-23"summary:"Initial version."workload{lib:"nhcss"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-02-23"summary:"Initial version."workload{lib:"nhcore"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
+changes{date:"2021-02-23"summary:"Initial version."workload{lib:"netzhaut"author{name:"Dajo Frey"contact:"https://github.com/dajofrey"}}}
diff --git a/build/.sm/idl.sm b/build/.nhmake/idl.nhmake
similarity index 100%
rename from build/.sm/idl.sm
rename to build/.nhmake/idl.nhmake
diff --git a/build/.sm/news.sm b/build/.nhmake/news.nhmake
similarity index 100%
rename from build/.sm/news.sm
rename to build/.nhmake/news.nhmake
diff --git a/build/.sm/options.sm b/build/.nhmake/options.nhmake
similarity index 81%
rename from build/.sm/options.sm
rename to build/.nhmake/options.nhmake
index 99316df..6c222f7 100644
--- a/build/.sm/options.sm
+++ b/build/.nhmake/options.nhmake
@@ -1,6 +1,6 @@
 // GLSL ============================================================================================
 
-"[dev] download glslang"
+"[dev] Download glslang."
 --glsl download
 {
     mkdir("external/DOWNLOADS")
@@ -12,7 +12,7 @@
     system("cmake . && make")
 }
 
-"[dev] compile glsl shaders"
+"[dev] Compile GLSL shaders."
 --glsl compile
 {
     chdir("external/DOWNLOADS/glslang-master/StandAlone")
@@ -31,21 +31,27 @@
 
 // INCLUDE =========================================================================================
 
-"generate includes"
+"Generate include files."
 --inc
 {
     chdir()
     mkdir("include/netzhaut")
 
     copy("src/lib/netzhaut/netzhaut.h", "include/netzhaut")
+    copy("src/lib/netzhaut/nhcore.h", "include/netzhaut")
     copy("src/lib/netzhaut/nhtty.h", "include/netzhaut")
+    copy("src/lib/netzhaut/nhencoding.h", "include/netzhaut")
     copy("src/lib/netzhaut/nhwsi.h", "include/netzhaut")
     copy("src/lib/netzhaut/nhgfx.h", "include/netzhaut")
     copy("src/lib/netzhaut/nhhtml.h", "include/netzhaut")
+    copy("src/lib/netzhaut/nhwebidl.h", "include/netzhaut")
+    copy("src/lib/netzhaut/nhdom.h", "include/netzhaut")
     copy("src/lib/netzhaut/nhcss.h", "include/netzhaut")
     copy("src/lib/netzhaut/nhterm.h", "include/netzhaut")
     copy("src/lib/netzhaut/nhrenderer.h", "include/netzhaut")
     copy("src/lib/netzhaut/nhecmascript.h", "include/netzhaut")
+    copy("src/lib/netzhaut/nhurl.h", "include/netzhaut")
+    copy("src/lib/netzhaut/nhmake.h", "include/netzhaut")
 
     copy("src/lib/netzhaut/nhcore", "include/netzhaut", true)
     copy("src/lib/netzhaut/nhtty", "include/netzhaut", true)
@@ -60,46 +66,47 @@
     copy("src/lib/netzhaut/nhrenderer", "include/netzhaut", true)
     copy("src/lib/netzhaut/nhecmascript", "include/netzhaut", true)
     copy("src/lib/netzhaut/nhurl", "include/netzhaut", true)
+    copy("src/lib/netzhaut/nhmake", "include/netzhaut", true)
 }
 
-"install includes"
+"Install include files."
 --inc install
 {
     copy("include/netzhaut", "/usr/local/include", true, true)
 }
 
-// DOCS ============================================================================================
+// DOCUMENTATION ===================================================================================
 
-"[dev] clone docs"
+"[dev] Clone documentation."
 -d cln
 {
     mkdir("external/DOWNLOADS")
     chdir("external/DOWNLOADS")
-    system("git clone https://github.com/netzwerkz/netzhaut.netzwerkz.org.git")
+    system("git clone https://github.com/netzdevs/netzhaut.dev.git")
     chdir()
 }
 
-"[dev] pull docs"
+"[dev] Pull documentation."
 -d pll
 {
-    chdir("external/DOWNLOADS/netzhaut.netzwerkz.org")
+    chdir("external/DOWNLOADS/netzhaut.dev")
     system("git pull origin HEAD")
     chdir()
 }
 
-"[dev] generate docs"
+"[dev] Generate documentation."
 -d gen
 {
     chdir()
-    copy("AUTHORS.md", "external/DOWNLOADS/netzhaut.netzwerkz.org/docs/dev/meta/authors.md")
+    copy("AUTHORS.md", "external/DOWNLOADS/netzhaut.dev/docs/dev/meta/authors.md")
 
     generateFooter()
-    chdir("external/DOWNLOADS/netzhaut.netzwerkz.org/docs/dev")
+    chdir("external/DOWNLOADS/netzhaut.dev/docs/dev")
     system("doxygen Doxyfile")
     copy("../resize.js", "html")
 
     chdir()
-    chdir("external/DOWNLOADS/netzhaut.netzwerkz.org/docs/use")
+    chdir("external/DOWNLOADS/netzhaut.dev/docs/use")
     system("doxygen Doxyfile")
     copy("../resize.js", "html")
 
@@ -108,10 +115,10 @@
     chdir()
 }
 
-"[dev] push docs"
+"[dev] Push documentation."
 -d psh
 {
-    chdir("external/DOWNLOADS/netzhaut.netzwerkz.org")
+    chdir("external/DOWNLOADS/netzhaut.dev")
     system("git add .")
     system("git commit -m \"${PROJ_REV}\"")
     system("git push origin HEAD")
@@ -120,7 +127,7 @@
 
 // INITIALIZE ======================================================================================
 
-"initialize project"
+"Initialize netzhaut."
 --init
 {
     mkdir("external/DOWNLOADS")
@@ -164,6 +171,8 @@
     copy("src/lib/nhecmascript/Common/Result.h", "src/lib/netzhaut/nhecmascript/Common")
     copy("src/lib/nhurl/Common/Types/Public.h", "src/lib/netzhaut/nhurl/Common/Types")
     copy("src/lib/nhurl/Common/Result.h", "src/lib/netzhaut/nhurl/Common")
+    copy("src/lib/nhmake/Common/Types/Public.h", "src/lib/netzhaut/nhmake/Common/Types")
+    copy("src/lib/nhmake/Common/Result.h", "src/lib/netzhaut/nhmake/Common")
 
     chdir("external/xxd")
     system("gcc -o xxd xxd.c")
@@ -195,14 +204,49 @@
     chdir()
 }
 
-OTHER ==============================================================================================
+// UPDATE ==========================================================================================
 
-"[dev] push new version"
---psh
+"[dev] Update history by embedding changes."
+--update history
 {
     chdir()
-    system("git add .")
-    system("git commit -m \"${PROJ_REV}\"")
-    system("git push origin HEAD")
+    updateHistory("CHANGES.txt")
+}
+
+"[dev] Update source code versions."
+--update versions
+{
+    chdir()
+    updateVersions()
+}
+
+SHOW ===============================================================================================
+
+"[dev] Show versions of all source contexts."
+--show versions
+{
+    chdir()
+    printVersions()
+}
+
+"[dev] Show history."
+--show history 
+{
+    chdir()
+    printHistory()
+}
+
+"[dev] Show current documented changes."
+--show changes
+{
+    chdir()
+    printChanges("CHANGES.txt")
+}
+
+"[dev] Show documented changes with git formatting."
+--show changes git
+{
+    chdir()
+    printChanges("CHANGES.txt", "git")
 }
 
diff --git a/build/.sm/override.sm b/build/.nhmake/override.nhmake
similarity index 100%
rename from build/.sm/override.sm
rename to build/.nhmake/override.nhmake
diff --git a/build/.sm/source.sm b/build/.nhmake/source.nhmake
similarity index 94%
rename from build/.sm/source.sm
rename to build/.nhmake/source.nhmake
index f8f397c..a0128ef 100644
--- a/build/.sm/source.sm
+++ b/build/.nhmake/source.nhmake
@@ -6,6 +6,7 @@ set(LIB_DEST,"${WRK_DIR}/lib/")
 set(BIN_DEST,"${WRK_DIR}/bin/")
 set(PROJ_STAGE,"pre-alpha-1")
 set(PREFIX,"nh")
+set(HISTORY,"${WRK_DIR}/HISTORY.txt")
 
 // DEFINE LIBRARIES ================================================================================
 
@@ -25,6 +26,7 @@ lib(nhcss,"src/lib/nhcss")
 lib(nhterm,"src/lib/nhterm")
 lib(nhurl,"src/lib/nhurl")
 
+
 // DEFINE BINARIES =================================================================================
 
 bin(netzhaut,"src/bin/netzhaut")
@@ -33,8 +35,6 @@ bin(nhecmascript,"src/bin/nhecmascript")
 bin(nhtty,"src/bin/nhtty")
 bin(nhhtml,"src/bin/nhhtml")
 
-bin(nhmake,"src/bin/nhmake","${PROJ_DIR}/build/")
-
 // COMPILE LIBRARIES ===============================================================================
 
 compile_lib(netzhaut,"-std=gnu99")
@@ -61,8 +61,6 @@ compile_bin(nhecmascript,"-std=gnu99 -Wl,-rpath=${LIB_DEST}:/usr/local/lib")
 compile_bin(nhtty,"-std=gnu99 -Wl,-rpath=${LIB_DEST}:/usr/local/lib")
 compile_bin(nhhtml,"-std=gnu99 -Wl,-rpath=${LIB_DEST}:/usr/local/lib")
 
-compile_bin(nhmake,"-std=gnu99 -Wl,-rpath=${PROJ_DIR}/external/selfmake/lib")
-
 // LINK LIBRARIES ==================================================================================
 
 link_lib(netzhaut,"-ldl")
@@ -80,8 +78,6 @@ link_bin(nhecmascript,"-L${LIB_DEST} -lnetzhaut")
 link_bin(nhtty,"-L${LIB_DEST} -lnetzhaut")
 link_bin(nhhtml,"-L${LIB_DEST} -lnetzhaut")
 
-link_bin(nhmake,"-L${PROJ_DIR}/external/selfmake/lib -lselfmake")
-
 // LIBRARY SOURCES =================================================================================
 
 source_lib(
@@ -95,6 +91,7 @@ source_lib(
         "nhterm.c"
         "nhrenderer.c"
         "nhecmascript.c"
+        "nhmake.c"
     nhcore
         "Loader/Loader.c"
         "Loader/Library.c"
@@ -173,23 +170,25 @@ source_lib(
         "Common/Terminate.c"
         "Common/About.c"
     nhtty
-        "PseudoTerminal/PseudoTerminal.c"
-        "PseudoTerminal/Draw.c"
-        "PseudoTerminal/Program.c"
-        "PseudoTerminal/Tile.c"
-        "PseudoTerminal/Tab.c"
-        "PseudoTerminal/Messages.c"
-        "PseudoTerminal/Console.c"
-        "PseudoTerminal/Status.c"
-        "PseudoTerminal/Tiling.c"
-        "PseudoTerminal/StandardIO.c"
-        "PseudoTerminal/View.c"
+        "TTY/TTY.c"
+        "TTY/Draw.c"
+        "TTY/Program.c"
+        "TTY/Tile.c"
+        "TTY/Tab.c"
+        "TTY/Messages.c"
+        "TTY/Console.c"
+        "TTY/Status.c"
+        "TTY/Tiling.c"
+        "TTY/StandardIO.c"
+        "TTY/View.c"
         "Editor/TreeListing.c"
         "Editor/Editor.c"
         "Editor/FileEditor.c"
         "Editor/File.c"
         "Editor/TextFile.c"
         "Editor/TextFileInput.c"
+        "Editor/ChangesFile.c"
+        "Editor/ChangesFileInput.c"
         "Editor/SyntaxHighlights.c"
         "Logger/Logger.c"
         "Shell/Shell.c"
@@ -384,12 +383,6 @@ source_bin (
         "Main.c"
     nhhtml
         "Main.c"
-    nhmake
-        "Main.c"
-        "Version.c"
-        "Documents.c"
-        "UnicodeData.c"
-        "WebIDL.c"
     nhtty
         "Main.c"
 )
diff --git a/build/.sm/test.sm b/build/.nhmake/test.nhmake
similarity index 100%
rename from build/.sm/test.sm
rename to build/.nhmake/test.nhmake
diff --git a/build/nhmake.sh b/build/nhmake.sh
index a156442..fe48f60 100755
--- a/build/nhmake.sh
+++ b/build/nhmake.sh
@@ -1,23 +1,71 @@
 #!/bin/bash
 
-echo -e "BUILDING \e[1;32mnhmake\e[0m"
-echo 
+if [[ "$OSTYPE" == "linux-gnu"* ]]; then
+    echo -e "BUILDING \e[1;32mnhmake\e[0m"
+    echo
+    CC=gcc
+    LIBS="-ldl -lX11 -lX11-xcb -lXcursor -lxkbcommon -lxkbcommon-x11"
+elif [[ "$OSTYPE" == "darwin"* ]]; then
+    echo "BUILDING nhmake"
+    CC="clang -g -D_POSIX_C_SOURCE -D_C99_SOURCE"
+    LIBS=""
+fi
 
 DIR="$(dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd ))"
 
-$DIR/external/selfmake/build/selfmake.sh
+SRC_LIB="
+    $DIR/src/lib/nhmake/Common/Result.c \
+    $DIR/src/lib/nhmake/Common/About.c \
+    $DIR/src/lib/nhmake/Core/Runtime.c \
+    $DIR/src/lib/nhmake/Core/Utils.c \
+    $DIR/src/lib/nhmake/Core/Thread.c \
+    $DIR/src/lib/nhmake/Core/File.c \
+    $DIR/src/lib/nhmake/Core/Configure.c \
+    $DIR/src/lib/nhmake/Core/Build.c \
+    $DIR/src/lib/nhmake/Core/Options.c \
+    $DIR/src/lib/nhmake/Core/Source.c \
+    $DIR/src/lib/nhmake/Core/Changes.c \
+    $DIR/src/lib/nhmake/Core/Version.c \
+    $DIR/src/lib/nhmake/Parser/Tokenizer.c \
+    $DIR/src/lib/nhmake/Parser/Parser.c \
+    $DIR/src/lib/nhmake/Parser/Variables.c \
+    $DIR/src/lib/nhmake/Parser/Functions.c \
+    $DIR/src/lib/nhmake/Test/Channel.c \
+    $DIR/src/lib/nhmake/Test/Process.c \
+    $DIR/src/lib/nhmake/Test/Library.c \
+    $DIR/src/lib/nhmake/Test/Test.c \
+    $DIR/src/lib/nhmake/UI/Message.c
+"
+
+SRC_BIN="
+    $DIR/src/bin/nhmake/Main.c \
+    $DIR/src/bin/nhmake/Version.c \
+    $DIR/src/bin/nhmake/Documents.c \
+    $DIR/src/bin/nhmake/UnicodeData.c \
+    $DIR/src/bin/nhmake/WebIDL.c \
+    $DIR/src/bin/nhmake/Callbacks.c
+"
+
+if [[ "$OSTYPE" == "linux-gnu"* ]]; then
+    $CC -std=gnu99 -shared -o$DIR/lib/libnhmake.so.0.0.0.0 -lpthread $LIBS -fPIC $SRC_LIB
+elif [[ "$OSTYPE" == "darwin"* ]]; then
+    $CC -std=gnu11 -shared -o$DIR/lib/libnhmake.so.0.0.0.0 -lpthread $LIBS -fPIC $SRC_LIB
+fi
+
+ln -s $DIR/lib/libnhmake.so.0.0.0.0 $DIR/lib/libnhmake.so.0
+ln -s $DIR/lib/libnhmake.so.0.0.0.0 $DIR/lib/libnhmake.so
 
-gcc -std=gnu99 -no-pie -Wl,-rpath=$DIR/external/selfmake/lib:$DIR/lib -obuild/nhmake -L$DIR/external/selfmake/lib -lselfmake \
-$DIR/src/bin/nhmake/Main.c \
-$DIR/src/bin/nhmake/Version.c \
-$DIR/src/bin/nhmake/Documents.c \
-$DIR/src/bin/nhmake/UnicodeData.c \
-$DIR/src/bin/nhmake/WebIDL.c \
+if [[ "$OSTYPE" == "linux-gnu"* ]]; then
+    $CC -std=gnu99 -no-pie -Wl,-rpath=$DIR/lib -o$DIR/build/nhmake -L$DIR/lib -lnhmake $SRC_BIN
+elif [[ "$OSTYPE" == "darwin"* ]]; then
+    $CC -std=gnu11 -Wl -o$DIR/build/nhmake -L$DIR/lib/ -lnhmake $SRC_BIN
+fi
 
 if [ $? = 0 ]; then
     echo
-    echo -e "BUILD $DIR/build/\e[1;32mnhmake\e[0m"
+    echo -e "BUILD $DIR/lib/\e[1;32mnhmake\e[0m"
 else
     echo
     echo -e "BUILD \e[1;31mFAILURE\e[0m"
 fi
+
diff --git a/external/selfmake/LICENSE.txt b/external/selfmake/LICENSE.txt
deleted file mode 100644
index 38514c2..0000000
--- a/external/selfmake/LICENSE.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-Copyright (C) 2021 The selfmake Authors
-
-Permission is hereby granted, free of charge, to any person obtaining a copy of this 
-software and associated documentation files (the "Software"), to deal in the Software 
-without restriction, including without limitation the rights to use, copy, modify, 
-merge, publish, distribute, sublicense, and/or sell copies of the Software, and to 
-permit persons to whom the Software is furnished to do so, subject to the following 
-conditions:
-
-The above copyright notice and this permission notice shall be included in all copies 
-or substantial portions of the Software.
-
-THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
-INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
-PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE 
-LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
-TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE 
-USE OR OTHER DEALINGS IN THE SOFTWARE.
-
diff --git a/external/selfmake/README.md b/external/selfmake/README.md
deleted file mode 100644
index efc378b..0000000
--- a/external/selfmake/README.md
+++ /dev/null
@@ -1,5 +0,0 @@
-# selfmake 
-selfmake is a very simple script language designed for build automation purposes.  
-It is the base of the build system used by [netzhaut](https://github.com/netzwerkz/netzhaut).  
-
-Please visit [selfmake.netzwerkz.org](https://selfmake.netzwerkz.org) for further information.
diff --git a/external/selfmake/build/.gitignore b/external/selfmake/build/.gitignore
deleted file mode 100644
index d04a260..0000000
--- a/external/selfmake/build/.gitignore
+++ /dev/null
@@ -1 +0,0 @@
-smmake
diff --git a/external/selfmake/build/.sm/smmake.sm b/external/selfmake/build/.sm/smmake.sm
deleted file mode 100644
index 5dcb1ea..0000000
--- a/external/selfmake/build/.sm/smmake.sm
+++ /dev/null
@@ -1,120 +0,0 @@
-// CONFIGURE =======================================================================================
-
-set(PROJ_DIR,"${WRK_DIR}")
-set(LIB_DEST,"${WRK_DIR}/lib/")
-set(BIN_DEST,"${WRK_DIR}/bin/")
-set(LANG_VER,"0.2.0")
-set(LANG_DATE,"2021-10-07")
-
-// SOURCE ==========================================================================================
-
-lib(selfmake,"${WRK_DIR}/src/lib/")
-bin(smake,"${WRK_DIR}/src/bin/smake")
-
-MAC {
-    link(selfmake,"-shared -lpthread -ldl")
-    link(smake,"-Wl, -L${WRK_DIR}/lib -lselfmake")
-    compile(smake,"-g -std=gnu11 -D_POSIX_C_SOURCE -D_C99_SOURCE")
-    compile(selfmake,"-g -std=gnu11 -D_POSIX_C_SOURCE -D_C99_SOURCE")
-}
-
-LINUX {
-    link(selfmake,"-lpthread -ldl -lX11 -lX11-xcb -lXcursor -lxkbcommon -lxkbcommon-x11")
-    link(smake,"-Wl,-rpath=${WRK_DIR}/lib:usr/local/lib -L${WRK_DIR}/lib -lselfmake")
-    compile(smake,"-std=gnu99")
-    compile(selfmake,"-std=gnu99")
-}
-
-source(
-    selfmake
-        "Common/Result.c"
-        "Core/Runtime.c"
-        "Core/Utils.c"
-        "Core/Thread.c"
-        "Core/File.c"
-        "Core/Configure.c"
-        "Core/Build.c"
-        "Core/Options.c"
-        "Core/Source.c"
-        "Parser/Tokenizer.c"
-        "Parser/Parser.c"
-        "Parser/Variables.c"
-        "Parser/Functions.c"
-        "Test/Channel.c"
-        "Test/Process.c"
-        "Test/Library.c"
-        "Test/Test.c"
-        "UI/Message.c"
-    smake
-        "Main.c"
-)
-
-// DOCS ============================================================================================
-
-"[dev] clone docs"
--d cln
-{
-    chdir("external")
-    system("git clone https://github.com/netzwerkz/selfmake.netzwerkz.org.git")
-    chdir()
-}
-
-"[dev] pull docs"
--d pll
-{
-    chdir("external/selfmake.netzwerkz.org")
-    system("git pull origin HEAD")
-    chdir()
-}
-
-"[dev] generate docs"
--d gen
-{
-    generateFooter()
-    chdir("external/selfmake.netzwerkz.org/docs/impl")
-    system("doxygen Doxyfile")
-    copy("../resize.js", "html")
-
-    chdir()
-    chdir("external/selfmake.netzwerkz.org/docs/lang")
-    system("doxygen Doxyfile")
-    copy("../resize.js", "html")
-
-    chdir()
-    generateHomepage()
-    chdir()
-}
-
-"[dev] push docs"
--d psh
-{
-    chdir("external/selfmake.netzwerkz.org")
-    system("git add .")
-    system("git commit -m \"${PROJ_REV}-${LANG_VER}\"")
-    system("git push origin HEAD")
-    chdir()
-}
-
-// PUSH ============================================================================================
-
-"[dev] push new version"
---psh
-{
-    chdir()
-    system("git add .")
-    system("git commit -m \"${PROJ_REV}-${LANG_VER}\"")
-    system("git push origin HEAD")
-    chdir()
-}
-
-// NEWS ============================================================================================
-
-set(
-    NEWS
-    "<p><b>2021-09-29</b><br>selfmake can now be compiled on mac, thanks to <a href:\"https://github.com/vinhig\">vinhig</a>. Also, the first iteration of conditionals was added."
-    "<p><b>2021-04-27</b><br>Work on the language specification is now underway."
-    "<p><b>2021-04-21</b><br>A lot of things have been reworked and some hacky stuff was purged, resulting in <a href=\"./impl/html/group__selfmakeChangelog.html#v0.1.0.0\">v0.1.0.0</a></p>"
-    "<p><b>2021-04-17</b><br>hello world!</p>"
-)
-
- 
diff --git a/external/selfmake/build/selfmake.sh b/external/selfmake/build/selfmake.sh
deleted file mode 100755
index c2d8b78..0000000
--- a/external/selfmake/build/selfmake.sh
+++ /dev/null
@@ -1,64 +0,0 @@
-#!/bin/bash
-
-if [[ "$OSTYPE" == "linux-gnu"* ]]; then
-    echo -e "BUILDING \e[1;32mselfmake\e[0m"
-    echo
-    CC=gcc
-    LIBS="-ldl -lX11 -lX11-xcb -lXcursor -lxkbcommon -lxkbcommon-x11"
-elif [[ "$OSTYPE" == "darwin"* ]]; then
-    echo "BUILDING selfmake"
-    CC="clang -g -D_POSIX_C_SOURCE -D_C99_SOURCE"
-    LIBS=""
-fi
-
-DIR="$(dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd ))"
-
-cp $DIR/src/lib/Common/Types.h $DIR/include/selfmake/Types.h
-cp $DIR/src/lib/Common/Result.h $DIR/include/selfmake/Result.h
-cp $DIR/src/lib/Common/Functions.h $DIR/include/selfmake/selfmake.h
-
-$CC -std=gnu11 -shared -o$DIR/lib/libselfmake.so -lpthread $LIBS -fPIC \
-$DIR/src/lib/Common/Result.c \
-$DIR/src/lib/Core/Runtime.c \
-$DIR/src/lib/Core/Utils.c \
-$DIR/src/lib/Core/Thread.c \
-$DIR/src/lib/Core/File.c \
-$DIR/src/lib/Core/Configure.c \
-$DIR/src/lib/Core/Build.c \
-$DIR/src/lib/Core/Options.c \
-$DIR/src/lib/Core/Source.c \
-$DIR/src/lib/Parser/Tokenizer.c \
-$DIR/src/lib/Parser/Parser.c \
-$DIR/src/lib/Parser/Variables.c \
-$DIR/src/lib/Parser/Functions.c \
-$DIR/src/lib/Test/Channel.c \
-$DIR/src/lib/Test/Process.c \
-$DIR/src/lib/Test/Library.c \
-$DIR/src/lib/Test/Test.c \
-$DIR/src/lib/UI/Message.c \
-
-if [[ "$OSTYPE" == "linux-gnu"* ]]; then
-    $CC -std=gnu11 -no-pie -Wl,-rpath=$DIR/lib/ -o$DIR/build/smmake -L$DIR/lib/ -lselfmake \
-    $DIR/src/bin/smmake/Main.c \
-    $DIR/src/bin/smmake/Version.c \
-    $DIR/src/bin/smmake/Documents.c \
-
-    $DIR/build/smmake -b ALL 
-elif [[ "$OSTYPE" == "darwin"* ]]; then
-    $CC -std=gnu11 -Wl -o$DIR/build/smmake -L$DIR/lib/ -lselfmake \
-    $DIR/src/bin/smmake/Main.c \
-    $DIR/src/bin/smmake/Version.c \
-    $DIR/src/bin/smmake/Documents.c \
-
-    $DIR/build/smmake -b ALL 
-fi
-
-
-if [ $? = 0 ]; then
-    echo
-    echo -e "BUILD $DIR/lib/\e[1;32mselfmake\e[0m"
-else
-    echo
-    echo -e "BUILD \e[1;31mFAILURE\e[0m"
-fi
-
diff --git a/external/selfmake/external/.gitignore b/external/selfmake/external/.gitignore
deleted file mode 100644
index 5e7d273..0000000
--- a/external/selfmake/external/.gitignore
+++ /dev/null
@@ -1,4 +0,0 @@
-# Ignore everything in this directory
-*
-# Except this file
-!.gitignore
diff --git a/external/selfmake/git/COMMIT_EDITMSG b/external/selfmake/git/COMMIT_EDITMSG
deleted file mode 100644
index 1d7fa48..0000000
--- a/external/selfmake/git/COMMIT_EDITMSG
+++ /dev/null
@@ -1 +0,0 @@
-v0.3.2.0-0.2.0
diff --git a/external/selfmake/git/FETCH_HEAD b/external/selfmake/git/FETCH_HEAD
deleted file mode 100644
index 715bca3..0000000
--- a/external/selfmake/git/FETCH_HEAD
+++ /dev/null
@@ -1 +0,0 @@
-c8c3b7278df109d4e070f3b347aeab7d60ebe999		branch 'main' of https://github.com/netzwerkz/selfmake
diff --git a/external/selfmake/git/HEAD b/external/selfmake/git/HEAD
deleted file mode 100644
index b870d82..0000000
--- a/external/selfmake/git/HEAD
+++ /dev/null
@@ -1 +0,0 @@
-ref: refs/heads/main
diff --git a/external/selfmake/git/ORIG_HEAD b/external/selfmake/git/ORIG_HEAD
deleted file mode 100644
index d0863c3..0000000
--- a/external/selfmake/git/ORIG_HEAD
+++ /dev/null
@@ -1 +0,0 @@
-c8c3b7278df109d4e070f3b347aeab7d60ebe999
diff --git a/external/selfmake/git/config b/external/selfmake/git/config
deleted file mode 100644
index 7131ec0..0000000
--- a/external/selfmake/git/config
+++ /dev/null
@@ -1,14 +0,0 @@
-[core]
-	repositoryformatversion = 0
-	filemode = true
-	bare = false
-	logallrefupdates = true
-[remote "origin"]
-	url = https://github.com/netzwerkz/selfmake.git
-	fetch = +refs/heads/*:refs/remotes/origin/*
-[branch "main"]
-	remote = origin
-	merge = refs/heads/main
-[branch "feature_simple_conditionals"]
-	remote = origin
-	merge = refs/heads/feature_simple_conditionals
diff --git a/external/selfmake/git/description b/external/selfmake/git/description
deleted file mode 100644
index 498b267..0000000
--- a/external/selfmake/git/description
+++ /dev/null
@@ -1 +0,0 @@
-Unnamed repository; edit this file 'description' to name the repository.
diff --git a/external/selfmake/git/hooks/applypatch-msg.sample b/external/selfmake/git/hooks/applypatch-msg.sample
deleted file mode 100755
index a5d7b84..0000000
--- a/external/selfmake/git/hooks/applypatch-msg.sample
+++ /dev/null
@@ -1,15 +0,0 @@
-#!/bin/sh
-#
-# An example hook script to check the commit log message taken by
-# applypatch from an e-mail message.
-#
-# The hook should exit with non-zero status after issuing an
-# appropriate message if it wants to stop the commit.  The hook is
-# allowed to edit the commit message file.
-#
-# To enable this hook, rename this file to "applypatch-msg".
-
-. git-sh-setup
-commitmsg="$(git rev-parse --git-path hooks/commit-msg)"
-test -x "$commitmsg" && exec "$commitmsg" ${1+"$@"}
-:
diff --git a/external/selfmake/git/hooks/commit-msg.sample b/external/selfmake/git/hooks/commit-msg.sample
deleted file mode 100755
index b58d118..0000000
--- a/external/selfmake/git/hooks/commit-msg.sample
+++ /dev/null
@@ -1,24 +0,0 @@
-#!/bin/sh
-#
-# An example hook script to check the commit log message.
-# Called by "git commit" with one argument, the name of the file
-# that has the commit message.  The hook should exit with non-zero
-# status after issuing an appropriate message if it wants to stop the
-# commit.  The hook is allowed to edit the commit message file.
-#
-# To enable this hook, rename this file to "commit-msg".
-
-# Uncomment the below to add a Signed-off-by line to the message.
-# Doing this in a hook is a bad idea in general, but the prepare-commit-msg
-# hook is more suited to it.
-#
-# SOB=$(git var GIT_AUTHOR_IDENT | sed -n 's/^\(.*>\).*$/Signed-off-by: \1/p')
-# grep -qs "^$SOB" "$1" || echo "$SOB" >> "$1"
-
-# This example catches duplicate Signed-off-by lines.
-
-test "" = "$(grep '^Signed-off-by: ' "$1" |
-	 sort | uniq -c | sed -e '/^[ 	]*1[ 	]/d')" || {
-	echo >&2 Duplicate Signed-off-by lines.
-	exit 1
-}
diff --git a/external/selfmake/git/hooks/fsmonitor-watchman.sample b/external/selfmake/git/hooks/fsmonitor-watchman.sample
deleted file mode 100755
index 14ed0aa..0000000
--- a/external/selfmake/git/hooks/fsmonitor-watchman.sample
+++ /dev/null
@@ -1,173 +0,0 @@
-#!/usr/bin/perl
-
-use strict;
-use warnings;
-use IPC::Open2;
-
-# An example hook script to integrate Watchman
-# (https://facebook.github.io/watchman/) with git to speed up detecting
-# new and modified files.
-#
-# The hook is passed a version (currently 2) and last update token
-# formatted as a string and outputs to stdout a new update token and
-# all files that have been modified since the update token. Paths must
-# be relative to the root of the working tree and separated by a single NUL.
-#
-# To enable this hook, rename this file to "query-watchman" and set
-# 'git config core.fsmonitor .git/hooks/query-watchman'
-#
-my ($version, $last_update_token) = @ARGV;
-
-# Uncomment for debugging
-# print STDERR "$0 $version $last_update_token\n";
-
-# Check the hook interface version
-if ($version ne 2) {
-	die "Unsupported query-fsmonitor hook version '$version'.\n" .
-	    "Falling back to scanning...\n";
-}
-
-my $git_work_tree = get_working_dir();
-
-my $retry = 1;
-
-my $json_pkg;
-eval {
-	require JSON::XS;
-	$json_pkg = "JSON::XS";
-	1;
-} or do {
-	require JSON::PP;
-	$json_pkg = "JSON::PP";
-};
-
-launch_watchman();
-
-sub launch_watchman {
-	my $o = watchman_query();
-	if (is_work_tree_watched($o)) {
-		output_result($o->{clock}, @{$o->{files}});
-	}
-}
-
-sub output_result {
-	my ($clockid, @files) = @_;
-
-	# Uncomment for debugging watchman output
-	# open (my $fh, ">", ".git/watchman-output.out");
-	# binmode $fh, ":utf8";
-	# print $fh "$clockid\n@files\n";
-	# close $fh;
-
-	binmode STDOUT, ":utf8";
-	print $clockid;
-	print "\0";
-	local $, = "\0";
-	print @files;
-}
-
-sub watchman_clock {
-	my $response = qx/watchman clock "$git_work_tree"/;
-	die "Failed to get clock id on '$git_work_tree'.\n" .
-		"Falling back to scanning...\n" if $? != 0;
-
-	return $json_pkg->new->utf8->decode($response);
-}
-
-sub watchman_query {
-	my $pid = open2(\*CHLD_OUT, \*CHLD_IN, 'watchman -j --no-pretty')
-	or die "open2() failed: $!\n" .
-	"Falling back to scanning...\n";
-
-	# In the query expression below we're asking for names of files that
-	# changed since $last_update_token but not from the .git folder.
-	#
-	# To accomplish this, we're using the "since" generator to use the
-	# recency index to select candidate nodes and "fields" to limit the
-	# output to file names only. Then we're using the "expression" term to
-	# further constrain the results.
-	if (substr($last_update_token, 0, 1) eq "c") {
-		$last_update_token = "\"$last_update_token\"";
-	}
-	my $query = <<"	END";
-		["query", "$git_work_tree", {
-			"since": $last_update_token,
-			"fields": ["name"],
-			"expression": ["not", ["dirname", ".git"]]
-		}]
-	END
-
-	# Uncomment for debugging the watchman query
-	# open (my $fh, ">", ".git/watchman-query.json");
-	# print $fh $query;
-	# close $fh;
-
-	print CHLD_IN $query;
-	close CHLD_IN;
-	my $response = do {local $/; <CHLD_OUT>};
-
-	# Uncomment for debugging the watch response
-	# open ($fh, ">", ".git/watchman-response.json");
-	# print $fh $response;
-	# close $fh;
-
-	die "Watchman: command returned no output.\n" .
-	"Falling back to scanning...\n" if $response eq "";
-	die "Watchman: command returned invalid output: $response\n" .
-	"Falling back to scanning...\n" unless $response =~ /^\{/;
-
-	return $json_pkg->new->utf8->decode($response);
-}
-
-sub is_work_tree_watched {
-	my ($output) = @_;
-	my $error = $output->{error};
-	if ($retry > 0 and $error and $error =~ m/unable to resolve root .* directory (.*) is not watched/) {
-		$retry--;
-		my $response = qx/watchman watch "$git_work_tree"/;
-		die "Failed to make watchman watch '$git_work_tree'.\n" .
-		    "Falling back to scanning...\n" if $? != 0;
-		$output = $json_pkg->new->utf8->decode($response);
-		$error = $output->{error};
-		die "Watchman: $error.\n" .
-		"Falling back to scanning...\n" if $error;
-
-		# Uncomment for debugging watchman output
-		# open (my $fh, ">", ".git/watchman-output.out");
-		# close $fh;
-
-		# Watchman will always return all files on the first query so
-		# return the fast "everything is dirty" flag to git and do the
-		# Watchman query just to get it over with now so we won't pay
-		# the cost in git to look up each individual file.
-		my $o = watchman_clock();
-		$error = $output->{error};
-
-		die "Watchman: $error.\n" .
-		"Falling back to scanning...\n" if $error;
-
-		output_result($o->{clock}, ("/"));
-		$last_update_token = $o->{clock};
-
-		eval { launch_watchman() };
-		return 0;
-	}
-
-	die "Watchman: $error.\n" .
-	"Falling back to scanning...\n" if $error;
-
-	return 1;
-}
-
-sub get_working_dir {
-	my $working_dir;
-	if ($^O =~ 'msys' || $^O =~ 'cygwin') {
-		$working_dir = Win32::GetCwd();
-		$working_dir =~ tr/\\/\//;
-	} else {
-		require Cwd;
-		$working_dir = Cwd::cwd();
-	}
-
-	return $working_dir;
-}
diff --git a/external/selfmake/git/hooks/post-update.sample b/external/selfmake/git/hooks/post-update.sample
deleted file mode 100755
index ec17ec1..0000000
--- a/external/selfmake/git/hooks/post-update.sample
+++ /dev/null
@@ -1,8 +0,0 @@
-#!/bin/sh
-#
-# An example hook script to prepare a packed repository for use over
-# dumb transports.
-#
-# To enable this hook, rename this file to "post-update".
-
-exec git update-server-info
diff --git a/external/selfmake/git/hooks/pre-applypatch.sample b/external/selfmake/git/hooks/pre-applypatch.sample
deleted file mode 100755
index 4142082..0000000
--- a/external/selfmake/git/hooks/pre-applypatch.sample
+++ /dev/null
@@ -1,14 +0,0 @@
-#!/bin/sh
-#
-# An example hook script to verify what is about to be committed
-# by applypatch from an e-mail message.
-#
-# The hook should exit with non-zero status after issuing an
-# appropriate message if it wants to stop the commit.
-#
-# To enable this hook, rename this file to "pre-applypatch".
-
-. git-sh-setup
-precommit="$(git rev-parse --git-path hooks/pre-commit)"
-test -x "$precommit" && exec "$precommit" ${1+"$@"}
-:
diff --git a/external/selfmake/git/hooks/pre-commit.sample b/external/selfmake/git/hooks/pre-commit.sample
deleted file mode 100755
index e144712..0000000
--- a/external/selfmake/git/hooks/pre-commit.sample
+++ /dev/null
@@ -1,49 +0,0 @@
-#!/bin/sh
-#
-# An example hook script to verify what is about to be committed.
-# Called by "git commit" with no arguments.  The hook should
-# exit with non-zero status after issuing an appropriate message if
-# it wants to stop the commit.
-#
-# To enable this hook, rename this file to "pre-commit".
-
-if git rev-parse --verify HEAD >/dev/null 2>&1
-then
-	against=HEAD
-else
-	# Initial commit: diff against an empty tree object
-	against=$(git hash-object -t tree /dev/null)
-fi
-
-# If you want to allow non-ASCII filenames set this variable to true.
-allownonascii=$(git config --type=bool hooks.allownonascii)
-
-# Redirect output to stderr.
-exec 1>&2
-
-# Cross platform projects tend to avoid non-ASCII filenames; prevent
-# them from being added to the repository. We exploit the fact that the
-# printable range starts at the space character and ends with tilde.
-if [ "$allownonascii" != "true" ] &&
-	# Note that the use of brackets around a tr range is ok here, (it's
-	# even required, for portability to Solaris 10's /usr/bin/tr), since
-	# the square bracket bytes happen to fall in the designated range.
-	test $(git diff --cached --name-only --diff-filter=A -z $against |
-	  LC_ALL=C tr -d '[ -~]\0' | wc -c) != 0
-then
-	cat <<\EOF
-Error: Attempt to add a non-ASCII file name.
-
-This can cause problems if you want to work with people on other platforms.
-
-To be portable it is advisable to rename the file.
-
-If you know what you are doing you can disable this check using:
-
-  git config hooks.allownonascii true
-EOF
-	exit 1
-fi
-
-# If there are whitespace errors, print the offending file names and fail.
-exec git diff-index --check --cached $against --
diff --git a/external/selfmake/git/hooks/pre-merge-commit.sample b/external/selfmake/git/hooks/pre-merge-commit.sample
deleted file mode 100755
index 399eab1..0000000
--- a/external/selfmake/git/hooks/pre-merge-commit.sample
+++ /dev/null
@@ -1,13 +0,0 @@
-#!/bin/sh
-#
-# An example hook script to verify what is about to be committed.
-# Called by "git merge" with no arguments.  The hook should
-# exit with non-zero status after issuing an appropriate message to
-# stderr if it wants to stop the merge commit.
-#
-# To enable this hook, rename this file to "pre-merge-commit".
-
-. git-sh-setup
-test -x "$GIT_DIR/hooks/pre-commit" &&
-        exec "$GIT_DIR/hooks/pre-commit"
-:
diff --git a/external/selfmake/git/hooks/pre-push.sample b/external/selfmake/git/hooks/pre-push.sample
deleted file mode 100755
index 4ce688d..0000000
--- a/external/selfmake/git/hooks/pre-push.sample
+++ /dev/null
@@ -1,53 +0,0 @@
-#!/bin/sh
-
-# An example hook script to verify what is about to be pushed.  Called by "git
-# push" after it has checked the remote status, but before anything has been
-# pushed.  If this script exits with a non-zero status nothing will be pushed.
-#
-# This hook is called with the following parameters:
-#
-# $1 -- Name of the remote to which the push is being done
-# $2 -- URL to which the push is being done
-#
-# If pushing without using a named remote those arguments will be equal.
-#
-# Information about the commits which are being pushed is supplied as lines to
-# the standard input in the form:
-#
-#   <local ref> <local oid> <remote ref> <remote oid>
-#
-# This sample shows how to prevent push of commits where the log message starts
-# with "WIP" (work in progress).
-
-remote="$1"
-url="$2"
-
-zero=$(git hash-object --stdin </dev/null | tr '[0-9a-f]' '0')
-
-while read local_ref local_oid remote_ref remote_oid
-do
-	if test "$local_oid" = "$zero"
-	then
-		# Handle delete
-		:
-	else
-		if test "$remote_oid" = "$zero"
-		then
-			# New branch, examine all commits
-			range="$local_oid"
-		else
-			# Update to existing branch, examine new commits
-			range="$remote_oid..$local_oid"
-		fi
-
-		# Check for WIP commit
-		commit=$(git rev-list -n 1 --grep '^WIP' "$range")
-		if test -n "$commit"
-		then
-			echo >&2 "Found WIP commit in $local_ref, not pushing"
-			exit 1
-		fi
-	fi
-done
-
-exit 0
diff --git a/external/selfmake/git/hooks/pre-rebase.sample b/external/selfmake/git/hooks/pre-rebase.sample
deleted file mode 100755
index 6cbef5c..0000000
--- a/external/selfmake/git/hooks/pre-rebase.sample
+++ /dev/null
@@ -1,169 +0,0 @@
-#!/bin/sh
-#
-# Copyright (c) 2006, 2008 Junio C Hamano
-#
-# The "pre-rebase" hook is run just before "git rebase" starts doing
-# its job, and can prevent the command from running by exiting with
-# non-zero status.
-#
-# The hook is called with the following parameters:
-#
-# $1 -- the upstream the series was forked from.
-# $2 -- the branch being rebased (or empty when rebasing the current branch).
-#
-# This sample shows how to prevent topic branches that are already
-# merged to 'next' branch from getting rebased, because allowing it
-# would result in rebasing already published history.
-
-publish=next
-basebranch="$1"
-if test "$#" = 2
-then
-	topic="refs/heads/$2"
-else
-	topic=`git symbolic-ref HEAD` ||
-	exit 0 ;# we do not interrupt rebasing detached HEAD
-fi
-
-case "$topic" in
-refs/heads/??/*)
-	;;
-*)
-	exit 0 ;# we do not interrupt others.
-	;;
-esac
-
-# Now we are dealing with a topic branch being rebased
-# on top of master.  Is it OK to rebase it?
-
-# Does the topic really exist?
-git show-ref -q "$topic" || {
-	echo >&2 "No such branch $topic"
-	exit 1
-}
-
-# Is topic fully merged to master?
-not_in_master=`git rev-list --pretty=oneline ^master "$topic"`
-if test -z "$not_in_master"
-then
-	echo >&2 "$topic is fully merged to master; better remove it."
-	exit 1 ;# we could allow it, but there is no point.
-fi
-
-# Is topic ever merged to next?  If so you should not be rebasing it.
-only_next_1=`git rev-list ^master "^$topic" ${publish} | sort`
-only_next_2=`git rev-list ^master           ${publish} | sort`
-if test "$only_next_1" = "$only_next_2"
-then
-	not_in_topic=`git rev-list "^$topic" master`
-	if test -z "$not_in_topic"
-	then
-		echo >&2 "$topic is already up to date with master"
-		exit 1 ;# we could allow it, but there is no point.
-	else
-		exit 0
-	fi
-else
-	not_in_next=`git rev-list --pretty=oneline ^${publish} "$topic"`
-	/usr/bin/perl -e '
-		my $topic = $ARGV[0];
-		my $msg = "* $topic has commits already merged to public branch:\n";
-		my (%not_in_next) = map {
-			/^([0-9a-f]+) /;
-			($1 => 1);
-		} split(/\n/, $ARGV[1]);
-		for my $elem (map {
-				/^([0-9a-f]+) (.*)$/;
-				[$1 => $2];
-			} split(/\n/, $ARGV[2])) {
-			if (!exists $not_in_next{$elem->[0]}) {
-				if ($msg) {
-					print STDERR $msg;
-					undef $msg;
-				}
-				print STDERR " $elem->[1]\n";
-			}
-		}
-	' "$topic" "$not_in_next" "$not_in_master"
-	exit 1
-fi
-
-<<\DOC_END
-
-This sample hook safeguards topic branches that have been
-published from being rewound.
-
-The workflow assumed here is:
-
- * Once a topic branch forks from "master", "master" is never
-   merged into it again (either directly or indirectly).
-
- * Once a topic branch is fully cooked and merged into "master",
-   it is deleted.  If you need to build on top of it to correct
-   earlier mistakes, a new topic branch is created by forking at
-   the tip of the "master".  This is not strictly necessary, but
-   it makes it easier to keep your history simple.
-
- * Whenever you need to test or publish your changes to topic
-   branches, merge them into "next" branch.
-
-The script, being an example, hardcodes the publish branch name
-to be "next", but it is trivial to make it configurable via
-$GIT_DIR/config mechanism.
-
-With this workflow, you would want to know:
-
-(1) ... if a topic branch has ever been merged to "next".  Young
-    topic branches can have stupid mistakes you would rather
-    clean up before publishing, and things that have not been
-    merged into other branches can be easily rebased without
-    affecting other people.  But once it is published, you would
-    not want to rewind it.
-
-(2) ... if a topic branch has been fully merged to "master".
-    Then you can delete it.  More importantly, you should not
-    build on top of it -- other people may already want to
-    change things related to the topic as patches against your
-    "master", so if you need further changes, it is better to
-    fork the topic (perhaps with the same name) afresh from the
-    tip of "master".
-
-Let's look at this example:
-
-		   o---o---o---o---o---o---o---o---o---o "next"
-		  /       /           /           /
-		 /   a---a---b A     /           /
-		/   /               /           /
-	       /   /   c---c---c---c B         /
-	      /   /   /             \         /
-	     /   /   /   b---b C     \       /
-	    /   /   /   /             \     /
-    ---o---o---o---o---o---o---o---o---o---o---o "master"
-
-
-A, B and C are topic branches.
-
- * A has one fix since it was merged up to "next".
-
- * B has finished.  It has been fully merged up to "master" and "next",
-   and is ready to be deleted.
-
- * C has not merged to "next" at all.
-
-We would want to allow C to be rebased, refuse A, and encourage
-B to be deleted.
-
-To compute (1):
-
-	git rev-list ^master ^topic next
-	git rev-list ^master        next
-
-	if these match, topic has not merged in next at all.
-
-To compute (2):
-
-	git rev-list master..topic
-
-	if this is empty, it is fully merged to "master".
-
-DOC_END
diff --git a/external/selfmake/git/hooks/pre-receive.sample b/external/selfmake/git/hooks/pre-receive.sample
deleted file mode 100755
index a1fd29e..0000000
--- a/external/selfmake/git/hooks/pre-receive.sample
+++ /dev/null
@@ -1,24 +0,0 @@
-#!/bin/sh
-#
-# An example hook script to make use of push options.
-# The example simply echoes all push options that start with 'echoback='
-# and rejects all pushes when the "reject" push option is used.
-#
-# To enable this hook, rename this file to "pre-receive".
-
-if test -n "$GIT_PUSH_OPTION_COUNT"
-then
-	i=0
-	while test "$i" -lt "$GIT_PUSH_OPTION_COUNT"
-	do
-		eval "value=\$GIT_PUSH_OPTION_$i"
-		case "$value" in
-		echoback=*)
-			echo "echo from the pre-receive-hook: ${value#*=}" >&2
-			;;
-		reject)
-			exit 1
-		esac
-		i=$((i + 1))
-	done
-fi
diff --git a/external/selfmake/git/hooks/prepare-commit-msg.sample b/external/selfmake/git/hooks/prepare-commit-msg.sample
deleted file mode 100755
index 10fa14c..0000000
--- a/external/selfmake/git/hooks/prepare-commit-msg.sample
+++ /dev/null
@@ -1,42 +0,0 @@
-#!/bin/sh
-#
-# An example hook script to prepare the commit log message.
-# Called by "git commit" with the name of the file that has the
-# commit message, followed by the description of the commit
-# message's source.  The hook's purpose is to edit the commit
-# message file.  If the hook fails with a non-zero status,
-# the commit is aborted.
-#
-# To enable this hook, rename this file to "prepare-commit-msg".
-
-# This hook includes three examples. The first one removes the
-# "# Please enter the commit message..." help message.
-#
-# The second includes the output of "git diff --name-status -r"
-# into the message, just before the "git status" output.  It is
-# commented because it doesn't cope with --amend or with squashed
-# commits.
-#
-# The third example adds a Signed-off-by line to the message, that can
-# still be edited.  This is rarely a good idea.
-
-COMMIT_MSG_FILE=$1
-COMMIT_SOURCE=$2
-SHA1=$3
-
-/usr/bin/perl -i.bak -ne 'print unless(m/^. Please enter the commit message/..m/^#$/)' "$COMMIT_MSG_FILE"
-
-# case "$COMMIT_SOURCE,$SHA1" in
-#  ,|template,)
-#    /usr/bin/perl -i.bak -pe '
-#       print "\n" . `git diff --cached --name-status -r`
-# 	 if /^#/ && $first++ == 0' "$COMMIT_MSG_FILE" ;;
-#  *) ;;
-# esac
-
-# SOB=$(git var GIT_COMMITTER_IDENT | sed -n 's/^\(.*>\).*$/Signed-off-by: \1/p')
-# git interpret-trailers --in-place --trailer "$SOB" "$COMMIT_MSG_FILE"
-# if test -z "$COMMIT_SOURCE"
-# then
-#   /usr/bin/perl -i.bak -pe 'print "\n" if !$first_line++' "$COMMIT_MSG_FILE"
-# fi
diff --git a/external/selfmake/git/hooks/push-to-checkout.sample b/external/selfmake/git/hooks/push-to-checkout.sample
deleted file mode 100755
index af5a0c0..0000000
--- a/external/selfmake/git/hooks/push-to-checkout.sample
+++ /dev/null
@@ -1,78 +0,0 @@
-#!/bin/sh
-
-# An example hook script to update a checked-out tree on a git push.
-#
-# This hook is invoked by git-receive-pack(1) when it reacts to git
-# push and updates reference(s) in its repository, and when the push
-# tries to update the branch that is currently checked out and the
-# receive.denyCurrentBranch configuration variable is set to
-# updateInstead.
-#
-# By default, such a push is refused if the working tree and the index
-# of the remote repository has any difference from the currently
-# checked out commit; when both the working tree and the index match
-# the current commit, they are updated to match the newly pushed tip
-# of the branch. This hook is to be used to override the default
-# behaviour; however the code below reimplements the default behaviour
-# as a starting point for convenient modification.
-#
-# The hook receives the commit with which the tip of the current
-# branch is going to be updated:
-commit=$1
-
-# It can exit with a non-zero status to refuse the push (when it does
-# so, it must not modify the index or the working tree).
-die () {
-	echo >&2 "$*"
-	exit 1
-}
-
-# Or it can make any necessary changes to the working tree and to the
-# index to bring them to the desired state when the tip of the current
-# branch is updated to the new commit, and exit with a zero status.
-#
-# For example, the hook can simply run git read-tree -u -m HEAD "$1"
-# in order to emulate git fetch that is run in the reverse direction
-# with git push, as the two-tree form of git read-tree -u -m is
-# essentially the same as git switch or git checkout that switches
-# branches while keeping the local changes in the working tree that do
-# not interfere with the difference between the branches.
-
-# The below is a more-or-less exact translation to shell of the C code
-# for the default behaviour for git's push-to-checkout hook defined in
-# the push_to_deploy() function in builtin/receive-pack.c.
-#
-# Note that the hook will be executed from the repository directory,
-# not from the working tree, so if you want to perform operations on
-# the working tree, you will have to adapt your code accordingly, e.g.
-# by adding "cd .." or using relative paths.
-
-if ! git update-index -q --ignore-submodules --refresh
-then
-	die "Up-to-date check failed"
-fi
-
-if ! git diff-files --quiet --ignore-submodules --
-then
-	die "Working directory has unstaged changes"
-fi
-
-# This is a rough translation of:
-#
-#   head_has_history() ? "HEAD" : EMPTY_TREE_SHA1_HEX
-if git cat-file -e HEAD 2>/dev/null
-then
-	head=HEAD
-else
-	head=$(git hash-object -t tree --stdin </dev/null)
-fi
-
-if ! git diff-index --quiet --cached --ignore-submodules $head --
-then
-	die "Working directory has staged changes"
-fi
-
-if ! git read-tree -u -m "$commit"
-then
-	die "Could not update working tree to new HEAD"
-fi
diff --git a/external/selfmake/git/hooks/update.sample b/external/selfmake/git/hooks/update.sample
deleted file mode 100755
index c4d426b..0000000
--- a/external/selfmake/git/hooks/update.sample
+++ /dev/null
@@ -1,128 +0,0 @@
-#!/bin/sh
-#
-# An example hook script to block unannotated tags from entering.
-# Called by "git receive-pack" with arguments: refname sha1-old sha1-new
-#
-# To enable this hook, rename this file to "update".
-#
-# Config
-# ------
-# hooks.allowunannotated
-#   This boolean sets whether unannotated tags will be allowed into the
-#   repository.  By default they won't be.
-# hooks.allowdeletetag
-#   This boolean sets whether deleting tags will be allowed in the
-#   repository.  By default they won't be.
-# hooks.allowmodifytag
-#   This boolean sets whether a tag may be modified after creation. By default
-#   it won't be.
-# hooks.allowdeletebranch
-#   This boolean sets whether deleting branches will be allowed in the
-#   repository.  By default they won't be.
-# hooks.denycreatebranch
-#   This boolean sets whether remotely creating branches will be denied
-#   in the repository.  By default this is allowed.
-#
-
-# --- Command line
-refname="$1"
-oldrev="$2"
-newrev="$3"
-
-# --- Safety check
-if [ -z "$GIT_DIR" ]; then
-	echo "Don't run this script from the command line." >&2
-	echo " (if you want, you could supply GIT_DIR then run" >&2
-	echo "  $0 <ref> <oldrev> <newrev>)" >&2
-	exit 1
-fi
-
-if [ -z "$refname" -o -z "$oldrev" -o -z "$newrev" ]; then
-	echo "usage: $0 <ref> <oldrev> <newrev>" >&2
-	exit 1
-fi
-
-# --- Config
-allowunannotated=$(git config --type=bool hooks.allowunannotated)
-allowdeletebranch=$(git config --type=bool hooks.allowdeletebranch)
-denycreatebranch=$(git config --type=bool hooks.denycreatebranch)
-allowdeletetag=$(git config --type=bool hooks.allowdeletetag)
-allowmodifytag=$(git config --type=bool hooks.allowmodifytag)
-
-# check for no description
-projectdesc=$(sed -e '1q' "$GIT_DIR/description")
-case "$projectdesc" in
-"Unnamed repository"* | "")
-	echo "*** Project description file hasn't been set" >&2
-	exit 1
-	;;
-esac
-
-# --- Check types
-# if $newrev is 0000...0000, it's a commit to delete a ref.
-zero=$(git hash-object --stdin </dev/null | tr '[0-9a-f]' '0')
-if [ "$newrev" = "$zero" ]; then
-	newrev_type=delete
-else
-	newrev_type=$(git cat-file -t $newrev)
-fi
-
-case "$refname","$newrev_type" in
-	refs/tags/*,commit)
-		# un-annotated tag
-		short_refname=${refname##refs/tags/}
-		if [ "$allowunannotated" != "true" ]; then
-			echo "*** The un-annotated tag, $short_refname, is not allowed in this repository" >&2
-			echo "*** Use 'git tag [ -a | -s ]' for tags you want to propagate." >&2
-			exit 1
-		fi
-		;;
-	refs/tags/*,delete)
-		# delete tag
-		if [ "$allowdeletetag" != "true" ]; then
-			echo "*** Deleting a tag is not allowed in this repository" >&2
-			exit 1
-		fi
-		;;
-	refs/tags/*,tag)
-		# annotated tag
-		if [ "$allowmodifytag" != "true" ] && git rev-parse $refname > /dev/null 2>&1
-		then
-			echo "*** Tag '$refname' already exists." >&2
-			echo "*** Modifying a tag is not allowed in this repository." >&2
-			exit 1
-		fi
-		;;
-	refs/heads/*,commit)
-		# branch
-		if [ "$oldrev" = "$zero" -a "$denycreatebranch" = "true" ]; then
-			echo "*** Creating a branch is not allowed in this repository" >&2
-			exit 1
-		fi
-		;;
-	refs/heads/*,delete)
-		# delete branch
-		if [ "$allowdeletebranch" != "true" ]; then
-			echo "*** Deleting a branch is not allowed in this repository" >&2
-			exit 1
-		fi
-		;;
-	refs/remotes/*,commit)
-		# tracking branch
-		;;
-	refs/remotes/*,delete)
-		# delete tracking branch
-		if [ "$allowdeletebranch" != "true" ]; then
-			echo "*** Deleting a tracking branch is not allowed in this repository" >&2
-			exit 1
-		fi
-		;;
-	*)
-		# Anything else (is there anything else?)
-		echo "*** Update hook: unknown type of update to ref $refname of type $newrev_type" >&2
-		exit 1
-		;;
-esac
-
-# --- Finished
-exit 0
diff --git a/external/selfmake/git/index b/external/selfmake/git/index
deleted file mode 100644
index 47e1465..0000000
Binary files a/external/selfmake/git/index and /dev/null differ
diff --git a/external/selfmake/git/info/exclude b/external/selfmake/git/info/exclude
deleted file mode 100644
index a5196d1..0000000
--- a/external/selfmake/git/info/exclude
+++ /dev/null
@@ -1,6 +0,0 @@
-# git ls-files --others --exclude-from=.git/info/exclude
-# Lines that start with '#' are comments.
-# For a project mostly in C, the following would be a good set of
-# exclude patterns (uncomment them if you want to use them):
-# *.[oa]
-# *~
diff --git a/external/selfmake/git/logs/HEAD b/external/selfmake/git/logs/HEAD
deleted file mode 100644
index dbce5a7..0000000
--- a/external/selfmake/git/logs/HEAD
+++ /dev/null
@@ -1,31 +0,0 @@
-0000000000000000000000000000000000000000 fc3a3f39fdb3853b837a7b73d6870e66709395ef Dajo Frey <dajofrey+github@gmail.com> 1618520925 +0200	clone: from https://github.com/netzwerkz/selfmake.git
-fc3a3f39fdb3853b837a7b73d6870e66709395ef 98222a9d533690d5889bad4b30773a512470d12d Dajo Frey <dajofrey+github@gmail.com> 1618662742 +0200	commit: v0.0.0
-98222a9d533690d5889bad4b30773a512470d12d 86b3bffdfbb647eba5c718b35ac048389dc170d1 Dajo Frey <dajofrey+github@gmail.com> 1618663228 +0200	commit: v0.0.0
-86b3bffdfbb647eba5c718b35ac048389dc170d1 fb6a2f8a6e3e86847b5684c2aefd92b5c235ae66 Dajo Frey <dajofrey+github@gmail.com> 1618701779 +0200	commit: v0.0.1
-fb6a2f8a6e3e86847b5684c2aefd92b5c235ae66 d664ee53ca5d54def68029a2c1e5be3525a168a2 Dajo Frey <dajofrey+github@gmail.com> 1618702661 +0200	pull: Fast-forward
-d664ee53ca5d54def68029a2c1e5be3525a168a2 8e07e542ab85ae0cf07414ab591e2bf0051386ed Dajo Frey <dajofrey+github@gmail.com> 1619013442 +0200	commit: readme
-8e07e542ab85ae0cf07414ab591e2bf0051386ed 2c2dbda17a7ade12893267efefdce6632369d699 Dajo Frey <dajofrey+github@gmail.com> 1619089701 +0200	commit: v0.1.0
-2c2dbda17a7ade12893267efefdce6632369d699 462d6ffa3a9eb8c8dd2411089d434f7b184998f1 Dajo Frey <dajofrey+github@gmail.com> 1619089713 +0200	pull: Merge made by the 'recursive' strategy.
-462d6ffa3a9eb8c8dd2411089d434f7b184998f1 23550d865e5eba02c5cf98b4aa4afecc549a509c Dajo Frey <dajofrey+github@gmail.com> 1619107094 +0200	commit: v0.1.1.0
-23550d865e5eba02c5cf98b4aa4afecc549a509c 66cd2a04e433275d557318f52cfb9ca59806c9fb Dajo Frey <dajofrey+github@gmail.com> 1619112142 +0200	commit: v0.1.1.1
-66cd2a04e433275d557318f52cfb9ca59806c9fb ae281d1a28e4edb0206d4e9815ef7755ab0c8e4e Dajo Frey <dajofrey+github@gmail.com> 1619344030 +0200	commit: v0.1.2.0
-ae281d1a28e4edb0206d4e9815ef7755ab0c8e4e 1a2b0fb9d3036658d4f89031ee646273b78fc6d1 Dajo Frey <dajofrey+github@gmail.com> 1619402208 +0200	commit: v0.1.2.0
-1a2b0fb9d3036658d4f89031ee646273b78fc6d1 d5d180e9225373553502272e9d615e06291e939c Dajo Frey <dajofrey+github@gmail.com> 1619438649 +0200	commit: v0.1.2.1
-d5d180e9225373553502272e9d615e06291e939c a95b3d8a163a05e1ce8128efb3e42315350e3d81 Dajo Frey <dajofrey+github@gmail.com> 1619443039 +0200	commit: v0.1.2.1
-a95b3d8a163a05e1ce8128efb3e42315350e3d81 5a64896f37d890b2675f3195ad4427f26f10abda Dajo Frey <dajofrey+github@gmail.com> 1619482315 +0200	commit: v0.1.2.1
-5a64896f37d890b2675f3195ad4427f26f10abda 34b1a31e81df92ff741367a55c3cfa1d54c2edb6 Dajo Frey <dajofrey+github@gmail.com> 1619617831 +0200	commit: v0.1.2.2
-34b1a31e81df92ff741367a55c3cfa1d54c2edb6 57592cd7adf93e17d7ca2da8c39e7a5cd161d6b6 Dajo Frey <dajofrey+github@gmail.com> 1619950222 +0200	commit: v0.1.2.3
-57592cd7adf93e17d7ca2da8c39e7a5cd161d6b6 b022c94de5449cc67c9c5f0570700140de2e2c0b Dajo Frey <dajofrey+github@gmail.com> 1619953857 +0200	commit: v0.1.2.4
-b022c94de5449cc67c9c5f0570700140de2e2c0b 41921f584c53a8f7234fd4f9ca79a1cf99784345 Dajo Frey <dajofrey+github@gmail.com> 1619954805 +0200	commit: v0.1.2.4-0.0.0
-41921f584c53a8f7234fd4f9ca79a1cf99784345 8e47c4403673171232a73f5ee79057611a32569a Dajo Frey <dajofrey+github@gmail.com> 1625348214 +0200	commit: v0.2.0.0-0.0.0
-8e47c4403673171232a73f5ee79057611a32569a 6bbad77639ded51a626b11ed7d904c4585aa4496 Dajo Frey <dajofrey+github@gmail.com> 1625837514 +0200	commit: v0.2.0.1-0.0.0
-6bbad77639ded51a626b11ed7d904c4585aa4496 6bbad77639ded51a626b11ed7d904c4585aa4496 Dajo Frey <dajofrey+github@gmail.com> 1632162558 +0200	checkout: moving from main to feature_simple_conditionals
-6bbad77639ded51a626b11ed7d904c4585aa4496 a028755d54a004ff9dc534a947a94b4a1eb78ba5 Dajo Frey <dajofrey+github@gmail.com> 1632203920 +0200	commit: Add basic conditional parsing (currently not compilable).
-a028755d54a004ff9dc534a947a94b4a1eb78ba5 e728d39d0719541e13b6cf524363abea11eefd3c Dajo Frey <dajofrey+github@gmail.com> 1632205557 +0200	commit: Nothing noteworthy.
-e728d39d0719541e13b6cf524363abea11eefd3c 36fc1a83d20c0c5224f6163d71f1e1247eed9f7d Dajo Frey <dajofrey+github@gmail.com> 1632244108 +0200	pull: Fast-forward
-36fc1a83d20c0c5224f6163d71f1e1247eed9f7d 30cc66f335000838312dbdcad7f9a0f6d3850520 Dajo Frey <dajofrey+github@gmail.com> 1632255615 +0200	commit: Improve parsing.
-30cc66f335000838312dbdcad7f9a0f6d3850520 122c54c0897f62b63a63d4bcfd39b7c9d8ab8c68 Dajo Frey <dajofrey+github@gmail.com> 1632292390 +0200	commit: ...
-122c54c0897f62b63a63d4bcfd39b7c9d8ab8c68 6bbad77639ded51a626b11ed7d904c4585aa4496 Dajo Frey <dajofrey+github@gmail.com> 1632292553 +0200	checkout: moving from feature_simple_conditionals to main
-6bbad77639ded51a626b11ed7d904c4585aa4496 5159b532aff3744f655c7374f0c18b334b4f5070 Dajo Frey <dajofrey+github@gmail.com> 1632292686 +0200	commit: v0.3.0.0-0.1.0
-5159b532aff3744f655c7374f0c18b334b4f5070 f7b3a2d575b217e1a31109478712c86296cc85d4 Dajo Frey <dajofrey+github@gmail.com> 1632949440 +0200	pull: Fast-forward
-f7b3a2d575b217e1a31109478712c86296cc85d4 c8c3b7278df109d4e070f3b347aeab7d60ebe999 Dajo Frey <dajofrey+github@gmail.com> 1633627510 +0200	commit: v0.3.2.0-0.2.0
diff --git a/external/selfmake/git/logs/refs/heads/feature_simple_conditionals b/external/selfmake/git/logs/refs/heads/feature_simple_conditionals
deleted file mode 100644
index 6002ffb..0000000
--- a/external/selfmake/git/logs/refs/heads/feature_simple_conditionals
+++ /dev/null
@@ -1,6 +0,0 @@
-0000000000000000000000000000000000000000 6bbad77639ded51a626b11ed7d904c4585aa4496 Dajo Frey <dajofrey+github@gmail.com> 1632162512 +0200	branch: Created from main
-6bbad77639ded51a626b11ed7d904c4585aa4496 a028755d54a004ff9dc534a947a94b4a1eb78ba5 Dajo Frey <dajofrey+github@gmail.com> 1632203920 +0200	commit: Add basic conditional parsing (currently not compilable).
-a028755d54a004ff9dc534a947a94b4a1eb78ba5 e728d39d0719541e13b6cf524363abea11eefd3c Dajo Frey <dajofrey+github@gmail.com> 1632205557 +0200	commit: Nothing noteworthy.
-e728d39d0719541e13b6cf524363abea11eefd3c 36fc1a83d20c0c5224f6163d71f1e1247eed9f7d Dajo Frey <dajofrey+github@gmail.com> 1632244108 +0200	pull: Fast-forward
-36fc1a83d20c0c5224f6163d71f1e1247eed9f7d 30cc66f335000838312dbdcad7f9a0f6d3850520 Dajo Frey <dajofrey+github@gmail.com> 1632255615 +0200	commit: Improve parsing.
-30cc66f335000838312dbdcad7f9a0f6d3850520 122c54c0897f62b63a63d4bcfd39b7c9d8ab8c68 Dajo Frey <dajofrey+github@gmail.com> 1632292390 +0200	commit: ...
diff --git a/external/selfmake/git/logs/refs/heads/main b/external/selfmake/git/logs/refs/heads/main
deleted file mode 100644
index b79833e..0000000
--- a/external/selfmake/git/logs/refs/heads/main
+++ /dev/null
@@ -1,24 +0,0 @@
-0000000000000000000000000000000000000000 fc3a3f39fdb3853b837a7b73d6870e66709395ef Dajo Frey <dajofrey+github@gmail.com> 1618520925 +0200	clone: from https://github.com/netzwerkz/selfmake.git
-fc3a3f39fdb3853b837a7b73d6870e66709395ef 98222a9d533690d5889bad4b30773a512470d12d Dajo Frey <dajofrey+github@gmail.com> 1618662742 +0200	commit: v0.0.0
-98222a9d533690d5889bad4b30773a512470d12d 86b3bffdfbb647eba5c718b35ac048389dc170d1 Dajo Frey <dajofrey+github@gmail.com> 1618663228 +0200	commit: v0.0.0
-86b3bffdfbb647eba5c718b35ac048389dc170d1 fb6a2f8a6e3e86847b5684c2aefd92b5c235ae66 Dajo Frey <dajofrey+github@gmail.com> 1618701779 +0200	commit: v0.0.1
-fb6a2f8a6e3e86847b5684c2aefd92b5c235ae66 d664ee53ca5d54def68029a2c1e5be3525a168a2 Dajo Frey <dajofrey+github@gmail.com> 1618702661 +0200	pull: Fast-forward
-d664ee53ca5d54def68029a2c1e5be3525a168a2 8e07e542ab85ae0cf07414ab591e2bf0051386ed Dajo Frey <dajofrey+github@gmail.com> 1619013442 +0200	commit: readme
-8e07e542ab85ae0cf07414ab591e2bf0051386ed 2c2dbda17a7ade12893267efefdce6632369d699 Dajo Frey <dajofrey+github@gmail.com> 1619089701 +0200	commit: v0.1.0
-2c2dbda17a7ade12893267efefdce6632369d699 462d6ffa3a9eb8c8dd2411089d434f7b184998f1 Dajo Frey <dajofrey+github@gmail.com> 1619089713 +0200	pull: Merge made by the 'recursive' strategy.
-462d6ffa3a9eb8c8dd2411089d434f7b184998f1 23550d865e5eba02c5cf98b4aa4afecc549a509c Dajo Frey <dajofrey+github@gmail.com> 1619107094 +0200	commit: v0.1.1.0
-23550d865e5eba02c5cf98b4aa4afecc549a509c 66cd2a04e433275d557318f52cfb9ca59806c9fb Dajo Frey <dajofrey+github@gmail.com> 1619112142 +0200	commit: v0.1.1.1
-66cd2a04e433275d557318f52cfb9ca59806c9fb ae281d1a28e4edb0206d4e9815ef7755ab0c8e4e Dajo Frey <dajofrey+github@gmail.com> 1619344030 +0200	commit: v0.1.2.0
-ae281d1a28e4edb0206d4e9815ef7755ab0c8e4e 1a2b0fb9d3036658d4f89031ee646273b78fc6d1 Dajo Frey <dajofrey+github@gmail.com> 1619402208 +0200	commit: v0.1.2.0
-1a2b0fb9d3036658d4f89031ee646273b78fc6d1 d5d180e9225373553502272e9d615e06291e939c Dajo Frey <dajofrey+github@gmail.com> 1619438649 +0200	commit: v0.1.2.1
-d5d180e9225373553502272e9d615e06291e939c a95b3d8a163a05e1ce8128efb3e42315350e3d81 Dajo Frey <dajofrey+github@gmail.com> 1619443039 +0200	commit: v0.1.2.1
-a95b3d8a163a05e1ce8128efb3e42315350e3d81 5a64896f37d890b2675f3195ad4427f26f10abda Dajo Frey <dajofrey+github@gmail.com> 1619482315 +0200	commit: v0.1.2.1
-5a64896f37d890b2675f3195ad4427f26f10abda 34b1a31e81df92ff741367a55c3cfa1d54c2edb6 Dajo Frey <dajofrey+github@gmail.com> 1619617831 +0200	commit: v0.1.2.2
-34b1a31e81df92ff741367a55c3cfa1d54c2edb6 57592cd7adf93e17d7ca2da8c39e7a5cd161d6b6 Dajo Frey <dajofrey+github@gmail.com> 1619950222 +0200	commit: v0.1.2.3
-57592cd7adf93e17d7ca2da8c39e7a5cd161d6b6 b022c94de5449cc67c9c5f0570700140de2e2c0b Dajo Frey <dajofrey+github@gmail.com> 1619953857 +0200	commit: v0.1.2.4
-b022c94de5449cc67c9c5f0570700140de2e2c0b 41921f584c53a8f7234fd4f9ca79a1cf99784345 Dajo Frey <dajofrey+github@gmail.com> 1619954805 +0200	commit: v0.1.2.4-0.0.0
-41921f584c53a8f7234fd4f9ca79a1cf99784345 8e47c4403673171232a73f5ee79057611a32569a Dajo Frey <dajofrey+github@gmail.com> 1625348214 +0200	commit: v0.2.0.0-0.0.0
-8e47c4403673171232a73f5ee79057611a32569a 6bbad77639ded51a626b11ed7d904c4585aa4496 Dajo Frey <dajofrey+github@gmail.com> 1625837514 +0200	commit: v0.2.0.1-0.0.0
-6bbad77639ded51a626b11ed7d904c4585aa4496 5159b532aff3744f655c7374f0c18b334b4f5070 Dajo Frey <dajofrey+github@gmail.com> 1632292686 +0200	commit: v0.3.0.0-0.1.0
-5159b532aff3744f655c7374f0c18b334b4f5070 f7b3a2d575b217e1a31109478712c86296cc85d4 Dajo Frey <dajofrey+github@gmail.com> 1632949440 +0200	pull: Fast-forward
-f7b3a2d575b217e1a31109478712c86296cc85d4 c8c3b7278df109d4e070f3b347aeab7d60ebe999 Dajo Frey <dajofrey+github@gmail.com> 1633627510 +0200	commit: v0.3.2.0-0.2.0
diff --git a/external/selfmake/git/logs/refs/remotes/origin/HEAD b/external/selfmake/git/logs/refs/remotes/origin/HEAD
deleted file mode 100644
index 0ed90e9..0000000
--- a/external/selfmake/git/logs/refs/remotes/origin/HEAD
+++ /dev/null
@@ -1 +0,0 @@
-0000000000000000000000000000000000000000 fc3a3f39fdb3853b837a7b73d6870e66709395ef Dajo Frey <dajofrey+github@gmail.com> 1618520925 +0200	clone: from https://github.com/netzwerkz/selfmake.git
diff --git a/external/selfmake/git/logs/refs/remotes/origin/main b/external/selfmake/git/logs/refs/remotes/origin/main
deleted file mode 100644
index 2043bca..0000000
--- a/external/selfmake/git/logs/refs/remotes/origin/main
+++ /dev/null
@@ -1,22 +0,0 @@
-fc3a3f39fdb3853b837a7b73d6870e66709395ef 98222a9d533690d5889bad4b30773a512470d12d Dajo Frey <dajofrey+github@gmail.com> 1618662760 +0200	update by push
-98222a9d533690d5889bad4b30773a512470d12d 86b3bffdfbb647eba5c718b35ac048389dc170d1 Dajo Frey <dajofrey+github@gmail.com> 1618663244 +0200	update by push
-86b3bffdfbb647eba5c718b35ac048389dc170d1 fb6a2f8a6e3e86847b5684c2aefd92b5c235ae66 Dajo Frey <dajofrey+github@gmail.com> 1618701798 +0200	update by push
-fb6a2f8a6e3e86847b5684c2aefd92b5c235ae66 d664ee53ca5d54def68029a2c1e5be3525a168a2 Dajo Frey <dajofrey+github@gmail.com> 1618702661 +0200	pull: fast-forward
-d664ee53ca5d54def68029a2c1e5be3525a168a2 8f90db64478c2903cf0296d959e83be66e58c831 Dajo Frey <dajofrey+github@gmail.com> 1619089713 +0200	pull: fast-forward
-8f90db64478c2903cf0296d959e83be66e58c831 462d6ffa3a9eb8c8dd2411089d434f7b184998f1 Dajo Frey <dajofrey+github@gmail.com> 1619089721 +0200	update by push
-462d6ffa3a9eb8c8dd2411089d434f7b184998f1 23550d865e5eba02c5cf98b4aa4afecc549a509c Dajo Frey <dajofrey+github@gmail.com> 1619107100 +0200	update by push
-23550d865e5eba02c5cf98b4aa4afecc549a509c 66cd2a04e433275d557318f52cfb9ca59806c9fb Dajo Frey <dajofrey+github@gmail.com> 1619112148 +0200	update by push
-66cd2a04e433275d557318f52cfb9ca59806c9fb ae281d1a28e4edb0206d4e9815ef7755ab0c8e4e Dajo Frey <dajofrey+github@gmail.com> 1619344039 +0200	update by push
-ae281d1a28e4edb0206d4e9815ef7755ab0c8e4e 1a2b0fb9d3036658d4f89031ee646273b78fc6d1 Dajo Frey <dajofrey+github@gmail.com> 1619402215 +0200	update by push
-1a2b0fb9d3036658d4f89031ee646273b78fc6d1 d5d180e9225373553502272e9d615e06291e939c Dajo Frey <dajofrey+github@gmail.com> 1619438655 +0200	update by push
-d5d180e9225373553502272e9d615e06291e939c a95b3d8a163a05e1ce8128efb3e42315350e3d81 Dajo Frey <dajofrey+github@gmail.com> 1619443057 +0200	update by push
-a95b3d8a163a05e1ce8128efb3e42315350e3d81 5a64896f37d890b2675f3195ad4427f26f10abda Dajo Frey <dajofrey+github@gmail.com> 1619482321 +0200	update by push
-5a64896f37d890b2675f3195ad4427f26f10abda 34b1a31e81df92ff741367a55c3cfa1d54c2edb6 Dajo Frey <dajofrey+github@gmail.com> 1619617839 +0200	update by push
-34b1a31e81df92ff741367a55c3cfa1d54c2edb6 57592cd7adf93e17d7ca2da8c39e7a5cd161d6b6 Dajo Frey <dajofrey+github@gmail.com> 1619950244 +0200	update by push
-57592cd7adf93e17d7ca2da8c39e7a5cd161d6b6 b022c94de5449cc67c9c5f0570700140de2e2c0b Dajo Frey <dajofrey+github@gmail.com> 1619953863 +0200	update by push
-b022c94de5449cc67c9c5f0570700140de2e2c0b 41921f584c53a8f7234fd4f9ca79a1cf99784345 Dajo Frey <dajofrey+github@gmail.com> 1619954812 +0200	update by push
-41921f584c53a8f7234fd4f9ca79a1cf99784345 8e47c4403673171232a73f5ee79057611a32569a Dajo Frey <dajofrey+github@gmail.com> 1625348222 +0200	update by push
-8e47c4403673171232a73f5ee79057611a32569a 6bbad77639ded51a626b11ed7d904c4585aa4496 Dajo Frey <dajofrey+github@gmail.com> 1625837520 +0200	update by push
-6bbad77639ded51a626b11ed7d904c4585aa4496 5159b532aff3744f655c7374f0c18b334b4f5070 Dajo Frey <dajofrey+github@gmail.com> 1632292733 +0200	update by push
-5159b532aff3744f655c7374f0c18b334b4f5070 f7b3a2d575b217e1a31109478712c86296cc85d4 Dajo Frey <dajofrey+github@gmail.com> 1632949440 +0200	pull: fast-forward
-f7b3a2d575b217e1a31109478712c86296cc85d4 c8c3b7278df109d4e070f3b347aeab7d60ebe999 Dajo Frey <dajofrey+github@gmail.com> 1633627537 +0200	update by push
diff --git a/external/selfmake/git/objects/00/816b98587f328d1e709a97f0f778dcd3ac7080 b/external/selfmake/git/objects/00/816b98587f328d1e709a97f0f778dcd3ac7080
deleted file mode 100644
index 62c2254..0000000
Binary files a/external/selfmake/git/objects/00/816b98587f328d1e709a97f0f778dcd3ac7080 and /dev/null differ
diff --git a/external/selfmake/git/objects/00/dd07faa3a9ff9d923010d019f37a9ce49a94e7 b/external/selfmake/git/objects/00/dd07faa3a9ff9d923010d019f37a9ce49a94e7
deleted file mode 100644
index de2f726..0000000
Binary files a/external/selfmake/git/objects/00/dd07faa3a9ff9d923010d019f37a9ce49a94e7 and /dev/null differ
diff --git a/external/selfmake/git/objects/03/48f8c759547da1bbb573d847d8ce0de09323ce b/external/selfmake/git/objects/03/48f8c759547da1bbb573d847d8ce0de09323ce
deleted file mode 100644
index 81784ce..0000000
Binary files a/external/selfmake/git/objects/03/48f8c759547da1bbb573d847d8ce0de09323ce and /dev/null differ
diff --git a/external/selfmake/git/objects/04/6555fdc7ddb78b65c82b5367504b0b2acc04fe b/external/selfmake/git/objects/04/6555fdc7ddb78b65c82b5367504b0b2acc04fe
deleted file mode 100644
index 6f6f540..0000000
Binary files a/external/selfmake/git/objects/04/6555fdc7ddb78b65c82b5367504b0b2acc04fe and /dev/null differ
diff --git a/external/selfmake/git/objects/04/76757d4b20fc494fd738fae1e9ff5f002bc8cb b/external/selfmake/git/objects/04/76757d4b20fc494fd738fae1e9ff5f002bc8cb
deleted file mode 100644
index b200345..0000000
Binary files a/external/selfmake/git/objects/04/76757d4b20fc494fd738fae1e9ff5f002bc8cb and /dev/null differ
diff --git a/external/selfmake/git/objects/04/7e85d7bb2941c92b88c6b9e4ef1233925af580 b/external/selfmake/git/objects/04/7e85d7bb2941c92b88c6b9e4ef1233925af580
deleted file mode 100644
index b63f9b2..0000000
Binary files a/external/selfmake/git/objects/04/7e85d7bb2941c92b88c6b9e4ef1233925af580 and /dev/null differ
diff --git a/external/selfmake/git/objects/05/cf88fd806913d84342efd17c3a1e0f71b48b6a b/external/selfmake/git/objects/05/cf88fd806913d84342efd17c3a1e0f71b48b6a
deleted file mode 100644
index 74f0bdd..0000000
Binary files a/external/selfmake/git/objects/05/cf88fd806913d84342efd17c3a1e0f71b48b6a and /dev/null differ
diff --git a/external/selfmake/git/objects/07/010e2398db39d5f97dd858b8b3b0ac975675d7 b/external/selfmake/git/objects/07/010e2398db39d5f97dd858b8b3b0ac975675d7
deleted file mode 100644
index 384faa1..0000000
Binary files a/external/selfmake/git/objects/07/010e2398db39d5f97dd858b8b3b0ac975675d7 and /dev/null differ
diff --git a/external/selfmake/git/objects/07/3f6286ad2d1e4357bd52856090b3b38869836d b/external/selfmake/git/objects/07/3f6286ad2d1e4357bd52856090b3b38869836d
deleted file mode 100644
index f964225..0000000
Binary files a/external/selfmake/git/objects/07/3f6286ad2d1e4357bd52856090b3b38869836d and /dev/null differ
diff --git a/external/selfmake/git/objects/07/9b9408bad6ec0a3152a9a93e9b7801f9cb0e18 b/external/selfmake/git/objects/07/9b9408bad6ec0a3152a9a93e9b7801f9cb0e18
deleted file mode 100644
index 7a730dc..0000000
Binary files a/external/selfmake/git/objects/07/9b9408bad6ec0a3152a9a93e9b7801f9cb0e18 and /dev/null differ
diff --git a/external/selfmake/git/objects/09/d57f23b52dbf4852ced86ab10255c0513d3152 b/external/selfmake/git/objects/09/d57f23b52dbf4852ced86ab10255c0513d3152
deleted file mode 100644
index 0108380..0000000
Binary files a/external/selfmake/git/objects/09/d57f23b52dbf4852ced86ab10255c0513d3152 and /dev/null differ
diff --git a/external/selfmake/git/objects/0a/134a17ac2c5dafe40a4f06cff090b09dac7805 b/external/selfmake/git/objects/0a/134a17ac2c5dafe40a4f06cff090b09dac7805
deleted file mode 100644
index 11fbfcc..0000000
Binary files a/external/selfmake/git/objects/0a/134a17ac2c5dafe40a4f06cff090b09dac7805 and /dev/null differ
diff --git a/external/selfmake/git/objects/0a/1b3a8ea856e1583f02c98710452c4ecd16a972 b/external/selfmake/git/objects/0a/1b3a8ea856e1583f02c98710452c4ecd16a972
deleted file mode 100644
index 8aa0c46..0000000
Binary files a/external/selfmake/git/objects/0a/1b3a8ea856e1583f02c98710452c4ecd16a972 and /dev/null differ
diff --git a/external/selfmake/git/objects/0a/1e4ef90c277fc6c84cbab6b7f93d890cb5d9e0 b/external/selfmake/git/objects/0a/1e4ef90c277fc6c84cbab6b7f93d890cb5d9e0
deleted file mode 100644
index 9c820b0..0000000
Binary files a/external/selfmake/git/objects/0a/1e4ef90c277fc6c84cbab6b7f93d890cb5d9e0 and /dev/null differ
diff --git a/external/selfmake/git/objects/0b/2aeeb7b2728970173281f42746c31fd6e55211 b/external/selfmake/git/objects/0b/2aeeb7b2728970173281f42746c31fd6e55211
deleted file mode 100644
index b84d18d..0000000
Binary files a/external/selfmake/git/objects/0b/2aeeb7b2728970173281f42746c31fd6e55211 and /dev/null differ
diff --git a/external/selfmake/git/objects/0b/87c9b6e57c99f6f81911feebe6aae6b6d2c715 b/external/selfmake/git/objects/0b/87c9b6e57c99f6f81911feebe6aae6b6d2c715
deleted file mode 100644
index ecd7582..0000000
Binary files a/external/selfmake/git/objects/0b/87c9b6e57c99f6f81911feebe6aae6b6d2c715 and /dev/null differ
diff --git a/external/selfmake/git/objects/0d/642ba210e1a8d145a288c1ea60eda5e0c25625 b/external/selfmake/git/objects/0d/642ba210e1a8d145a288c1ea60eda5e0c25625
deleted file mode 100644
index 83ad17c..0000000
Binary files a/external/selfmake/git/objects/0d/642ba210e1a8d145a288c1ea60eda5e0c25625 and /dev/null differ
diff --git a/external/selfmake/git/objects/0e/e9cba7c84f169048956a8ed15df1e1d81fa3fe b/external/selfmake/git/objects/0e/e9cba7c84f169048956a8ed15df1e1d81fa3fe
deleted file mode 100644
index 42ff27c..0000000
Binary files a/external/selfmake/git/objects/0e/e9cba7c84f169048956a8ed15df1e1d81fa3fe and /dev/null differ
diff --git a/external/selfmake/git/objects/10/869a7ecf027624f81c9eff0ef8d3333e67f885 b/external/selfmake/git/objects/10/869a7ecf027624f81c9eff0ef8d3333e67f885
deleted file mode 100644
index 41c20d2..0000000
Binary files a/external/selfmake/git/objects/10/869a7ecf027624f81c9eff0ef8d3333e67f885 and /dev/null differ
diff --git a/external/selfmake/git/objects/10/8c054a677ac40fcddd5b4265995e29a0da1646 b/external/selfmake/git/objects/10/8c054a677ac40fcddd5b4265995e29a0da1646
deleted file mode 100644
index ecccd59..0000000
Binary files a/external/selfmake/git/objects/10/8c054a677ac40fcddd5b4265995e29a0da1646 and /dev/null differ
diff --git a/external/selfmake/git/objects/10/8f64ef3b49b7b6f3042f264dce165c91836580 b/external/selfmake/git/objects/10/8f64ef3b49b7b6f3042f264dce165c91836580
deleted file mode 100644
index b17349e..0000000
Binary files a/external/selfmake/git/objects/10/8f64ef3b49b7b6f3042f264dce165c91836580 and /dev/null differ
diff --git a/external/selfmake/git/objects/11/576c30d6eee97cf81629a5db7263ff57faf45f b/external/selfmake/git/objects/11/576c30d6eee97cf81629a5db7263ff57faf45f
deleted file mode 100644
index a845663..0000000
Binary files a/external/selfmake/git/objects/11/576c30d6eee97cf81629a5db7263ff57faf45f and /dev/null differ
diff --git a/external/selfmake/git/objects/12/2c54c0897f62b63a63d4bcfd39b7c9d8ab8c68 b/external/selfmake/git/objects/12/2c54c0897f62b63a63d4bcfd39b7c9d8ab8c68
deleted file mode 100644
index 37a7256..0000000
Binary files a/external/selfmake/git/objects/12/2c54c0897f62b63a63d4bcfd39b7c9d8ab8c68 and /dev/null differ
diff --git a/external/selfmake/git/objects/12/ddfabaf9ea4b8f39fefc1a62366cace850db83 b/external/selfmake/git/objects/12/ddfabaf9ea4b8f39fefc1a62366cace850db83
deleted file mode 100644
index 5ec72b5..0000000
Binary files a/external/selfmake/git/objects/12/ddfabaf9ea4b8f39fefc1a62366cace850db83 and /dev/null differ
diff --git a/external/selfmake/git/objects/14/a080796e2ffb049aa4ed858929f518a25699a7 b/external/selfmake/git/objects/14/a080796e2ffb049aa4ed858929f518a25699a7
deleted file mode 100644
index 7cec012..0000000
Binary files a/external/selfmake/git/objects/14/a080796e2ffb049aa4ed858929f518a25699a7 and /dev/null differ
diff --git a/external/selfmake/git/objects/14/f0bf7afc5b77181c9e8317641067f0949b974d b/external/selfmake/git/objects/14/f0bf7afc5b77181c9e8317641067f0949b974d
deleted file mode 100644
index 7e0b00c..0000000
Binary files a/external/selfmake/git/objects/14/f0bf7afc5b77181c9e8317641067f0949b974d and /dev/null differ
diff --git a/external/selfmake/git/objects/15/abdbe1a57b7f8494a61b588295224fdf7da327 b/external/selfmake/git/objects/15/abdbe1a57b7f8494a61b588295224fdf7da327
deleted file mode 100644
index 270e7ec..0000000
Binary files a/external/selfmake/git/objects/15/abdbe1a57b7f8494a61b588295224fdf7da327 and /dev/null differ
diff --git a/external/selfmake/git/objects/15/ee6b195e43c838993e4c31c99281e1313fc134 b/external/selfmake/git/objects/15/ee6b195e43c838993e4c31c99281e1313fc134
deleted file mode 100644
index 34f6f85..0000000
Binary files a/external/selfmake/git/objects/15/ee6b195e43c838993e4c31c99281e1313fc134 and /dev/null differ
diff --git a/external/selfmake/git/objects/16/c822baa89c863d135ace7f742b602ac07bda43 b/external/selfmake/git/objects/16/c822baa89c863d135ace7f742b602ac07bda43
deleted file mode 100644
index c81fda3..0000000
Binary files a/external/selfmake/git/objects/16/c822baa89c863d135ace7f742b602ac07bda43 and /dev/null differ
diff --git a/external/selfmake/git/objects/16/e8ed5213ffb5f8ff31983dd66eedfd683c0d89 b/external/selfmake/git/objects/16/e8ed5213ffb5f8ff31983dd66eedfd683c0d89
deleted file mode 100644
index f15a81d..0000000
Binary files a/external/selfmake/git/objects/16/e8ed5213ffb5f8ff31983dd66eedfd683c0d89 and /dev/null differ
diff --git a/external/selfmake/git/objects/17/0aa882ff38b09d873d5f2174b52f29f61fe05a b/external/selfmake/git/objects/17/0aa882ff38b09d873d5f2174b52f29f61fe05a
deleted file mode 100644
index 38870fa..0000000
--- a/external/selfmake/git/objects/17/0aa882ff38b09d873d5f2174b52f29f61fe05a
+++ /dev/null
@@ -1,2 +0,0 @@
-x�R�O�0����.�(Sj����6���n�ƭm����w[�r�໼�}����F�����IS�����ğh�4M�2���C�m�<��`쯦C�L(O��\�*R�%~'pA,�P0�,�8#p��4��m�^wo ��Q��U�ee���I�)a6	M�s�(,.tB�p-c����N����[�J��G�
-��?6�L�Y|2�k�$��8�`��0�	z��������
\ No newline at end of file
diff --git a/external/selfmake/git/objects/17/afde3d8ab53293046f16dc8bc08e563cd99f40 b/external/selfmake/git/objects/17/afde3d8ab53293046f16dc8bc08e563cd99f40
deleted file mode 100644
index 756cd61..0000000
Binary files a/external/selfmake/git/objects/17/afde3d8ab53293046f16dc8bc08e563cd99f40 and /dev/null differ
diff --git a/external/selfmake/git/objects/18/8c5e14d33fbb83fae8004e8ccb9273048c32e2 b/external/selfmake/git/objects/18/8c5e14d33fbb83fae8004e8ccb9273048c32e2
deleted file mode 100644
index ec5ff9b..0000000
Binary files a/external/selfmake/git/objects/18/8c5e14d33fbb83fae8004e8ccb9273048c32e2 and /dev/null differ
diff --git a/external/selfmake/git/objects/18/a4b69b53fddc443a3395151a1fba0b0b985e0d b/external/selfmake/git/objects/18/a4b69b53fddc443a3395151a1fba0b0b985e0d
deleted file mode 100644
index 6a61e10..0000000
Binary files a/external/selfmake/git/objects/18/a4b69b53fddc443a3395151a1fba0b0b985e0d and /dev/null differ
diff --git a/external/selfmake/git/objects/18/ee0d02bea6ee5e983c6cadab5c8feda7f94776 b/external/selfmake/git/objects/18/ee0d02bea6ee5e983c6cadab5c8feda7f94776
deleted file mode 100644
index e53cf3d..0000000
Binary files a/external/selfmake/git/objects/18/ee0d02bea6ee5e983c6cadab5c8feda7f94776 and /dev/null differ
diff --git a/external/selfmake/git/objects/19/93d296a5af062f292b7b7b386a6840d70d325e b/external/selfmake/git/objects/19/93d296a5af062f292b7b7b386a6840d70d325e
deleted file mode 100644
index 67a55e4..0000000
Binary files a/external/selfmake/git/objects/19/93d296a5af062f292b7b7b386a6840d70d325e and /dev/null differ
diff --git a/external/selfmake/git/objects/1a/1ed584dcc04e55515197bab1d93824f3d0fa0c b/external/selfmake/git/objects/1a/1ed584dcc04e55515197bab1d93824f3d0fa0c
deleted file mode 100644
index a3752db..0000000
Binary files a/external/selfmake/git/objects/1a/1ed584dcc04e55515197bab1d93824f3d0fa0c and /dev/null differ
diff --git a/external/selfmake/git/objects/1a/2b0fb9d3036658d4f89031ee646273b78fc6d1 b/external/selfmake/git/objects/1a/2b0fb9d3036658d4f89031ee646273b78fc6d1
deleted file mode 100644
index 083f427..0000000
Binary files a/external/selfmake/git/objects/1a/2b0fb9d3036658d4f89031ee646273b78fc6d1 and /dev/null differ
diff --git a/external/selfmake/git/objects/1a/84819406cf1a2194346b235806fee698a2a802 b/external/selfmake/git/objects/1a/84819406cf1a2194346b235806fee698a2a802
deleted file mode 100644
index 24caa34..0000000
Binary files a/external/selfmake/git/objects/1a/84819406cf1a2194346b235806fee698a2a802 and /dev/null differ
diff --git a/external/selfmake/git/objects/1a/9e5eee6a0a6743e1eaa2f9ce1889074848e1d6 b/external/selfmake/git/objects/1a/9e5eee6a0a6743e1eaa2f9ce1889074848e1d6
deleted file mode 100644
index 3f98a47..0000000
Binary files a/external/selfmake/git/objects/1a/9e5eee6a0a6743e1eaa2f9ce1889074848e1d6 and /dev/null differ
diff --git a/external/selfmake/git/objects/1a/ee3b5de96e3029dad5cfe75fd4ce595ccd15a7 b/external/selfmake/git/objects/1a/ee3b5de96e3029dad5cfe75fd4ce595ccd15a7
deleted file mode 100644
index 914b288..0000000
Binary files a/external/selfmake/git/objects/1a/ee3b5de96e3029dad5cfe75fd4ce595ccd15a7 and /dev/null differ
diff --git a/external/selfmake/git/objects/1b/4b8e3cf83ac53cd5f507e2d1225deeb82a27e7 b/external/selfmake/git/objects/1b/4b8e3cf83ac53cd5f507e2d1225deeb82a27e7
deleted file mode 100644
index 29e91eb..0000000
Binary files a/external/selfmake/git/objects/1b/4b8e3cf83ac53cd5f507e2d1225deeb82a27e7 and /dev/null differ
diff --git a/external/selfmake/git/objects/1b/a40e41301cb1205a22def7a88baf38f01a910c b/external/selfmake/git/objects/1b/a40e41301cb1205a22def7a88baf38f01a910c
deleted file mode 100644
index ea913e2..0000000
Binary files a/external/selfmake/git/objects/1b/a40e41301cb1205a22def7a88baf38f01a910c and /dev/null differ
diff --git a/external/selfmake/git/objects/1f/2eb5ed2670cdc6dc2cf1dccc400caa2fcaac9a b/external/selfmake/git/objects/1f/2eb5ed2670cdc6dc2cf1dccc400caa2fcaac9a
deleted file mode 100644
index f701807..0000000
Binary files a/external/selfmake/git/objects/1f/2eb5ed2670cdc6dc2cf1dccc400caa2fcaac9a and /dev/null differ
diff --git a/external/selfmake/git/objects/1f/9ab2b93bb794d532cd9760c7886d456986d7ca b/external/selfmake/git/objects/1f/9ab2b93bb794d532cd9760c7886d456986d7ca
deleted file mode 100644
index 9a197d8..0000000
Binary files a/external/selfmake/git/objects/1f/9ab2b93bb794d532cd9760c7886d456986d7ca and /dev/null differ
diff --git a/external/selfmake/git/objects/1f/cf5175ca917c6f3bef0bc6e4b26c50bd123970 b/external/selfmake/git/objects/1f/cf5175ca917c6f3bef0bc6e4b26c50bd123970
deleted file mode 100644
index 6f37b51..0000000
Binary files a/external/selfmake/git/objects/1f/cf5175ca917c6f3bef0bc6e4b26c50bd123970 and /dev/null differ
diff --git a/external/selfmake/git/objects/1f/d48d3fc3c2e8cf65bba2f445360bfbe777724a b/external/selfmake/git/objects/1f/d48d3fc3c2e8cf65bba2f445360bfbe777724a
deleted file mode 100644
index 62c381d..0000000
Binary files a/external/selfmake/git/objects/1f/d48d3fc3c2e8cf65bba2f445360bfbe777724a and /dev/null differ
diff --git a/external/selfmake/git/objects/20/94768a347cd2324fc0f99e92eed7a6b84cf1f7 b/external/selfmake/git/objects/20/94768a347cd2324fc0f99e92eed7a6b84cf1f7
deleted file mode 100644
index 33aa2ce..0000000
Binary files a/external/selfmake/git/objects/20/94768a347cd2324fc0f99e92eed7a6b84cf1f7 and /dev/null differ
diff --git a/external/selfmake/git/objects/20/d5e2ca2512b0199a33e1fd3b6c4c1ebda715d0 b/external/selfmake/git/objects/20/d5e2ca2512b0199a33e1fd3b6c4c1ebda715d0
deleted file mode 100644
index d3be4c1..0000000
--- a/external/selfmake/git/objects/20/d5e2ca2512b0199a33e1fd3b6c4c1ebda715d0
+++ /dev/null
@@ -1 +0,0 @@
-x�U�n�@��_1���IJ�J� IE�M�$-B�6�&��޵v�-��3�{.D<@�{v��Ι�"�v:/\�F��x:�������,�uP4\F��L=�b
\ No newline at end of file
diff --git a/external/selfmake/git/objects/20/d6e4310de773b195cb1c1b011984b5f12ec947 b/external/selfmake/git/objects/20/d6e4310de773b195cb1c1b011984b5f12ec947
deleted file mode 100644
index 2342479..0000000
Binary files a/external/selfmake/git/objects/20/d6e4310de773b195cb1c1b011984b5f12ec947 and /dev/null differ
diff --git a/external/selfmake/git/objects/20/e96f62674c1f277cc850222ffff727d8170377 b/external/selfmake/git/objects/20/e96f62674c1f277cc850222ffff727d8170377
deleted file mode 100644
index 83892af..0000000
Binary files a/external/selfmake/git/objects/20/e96f62674c1f277cc850222ffff727d8170377 and /dev/null differ
diff --git a/external/selfmake/git/objects/21/cc2fb0d2597693c22b522a7e6f3bd32e3f6129 b/external/selfmake/git/objects/21/cc2fb0d2597693c22b522a7e6f3bd32e3f6129
deleted file mode 100644
index 605edc2..0000000
Binary files a/external/selfmake/git/objects/21/cc2fb0d2597693c22b522a7e6f3bd32e3f6129 and /dev/null differ
diff --git a/external/selfmake/git/objects/22/2ca235a43a820573f12a146f9c9d611c92cad6 b/external/selfmake/git/objects/22/2ca235a43a820573f12a146f9c9d611c92cad6
deleted file mode 100644
index 9a7e8a0..0000000
Binary files a/external/selfmake/git/objects/22/2ca235a43a820573f12a146f9c9d611c92cad6 and /dev/null differ
diff --git a/external/selfmake/git/objects/22/822973742d6022544c7e7cc2a42f4bcdde3e0e b/external/selfmake/git/objects/22/822973742d6022544c7e7cc2a42f4bcdde3e0e
deleted file mode 100644
index ec2d1dd..0000000
Binary files a/external/selfmake/git/objects/22/822973742d6022544c7e7cc2a42f4bcdde3e0e and /dev/null differ
diff --git a/external/selfmake/git/objects/22/98adef2d6571d35c3e60bcd89eb90b1a4228de b/external/selfmake/git/objects/22/98adef2d6571d35c3e60bcd89eb90b1a4228de
deleted file mode 100644
index e548245..0000000
Binary files a/external/selfmake/git/objects/22/98adef2d6571d35c3e60bcd89eb90b1a4228de and /dev/null differ
diff --git a/external/selfmake/git/objects/23/11b864b2c81428a96207530815068079c53b56 b/external/selfmake/git/objects/23/11b864b2c81428a96207530815068079c53b56
deleted file mode 100644
index 702e2aa..0000000
Binary files a/external/selfmake/git/objects/23/11b864b2c81428a96207530815068079c53b56 and /dev/null differ
diff --git a/external/selfmake/git/objects/23/2890dfb6cc360fa9691a344bb28e23c373f922 b/external/selfmake/git/objects/23/2890dfb6cc360fa9691a344bb28e23c373f922
deleted file mode 100644
index 774b28e..0000000
Binary files a/external/selfmake/git/objects/23/2890dfb6cc360fa9691a344bb28e23c373f922 and /dev/null differ
diff --git a/external/selfmake/git/objects/23/29de6db3f8a22ade1087a4934b4f186b6cd57f b/external/selfmake/git/objects/23/29de6db3f8a22ade1087a4934b4f186b6cd57f
deleted file mode 100644
index 0d19c9b..0000000
Binary files a/external/selfmake/git/objects/23/29de6db3f8a22ade1087a4934b4f186b6cd57f and /dev/null differ
diff --git a/external/selfmake/git/objects/23/550d865e5eba02c5cf98b4aa4afecc549a509c b/external/selfmake/git/objects/23/550d865e5eba02c5cf98b4aa4afecc549a509c
deleted file mode 100644
index 316aa02..0000000
--- a/external/selfmake/git/objects/23/550d865e5eba02c5cf98b4aa4afecc549a509c
+++ /dev/null
@@ -1,3 +0,0 @@
-x��A
-� E����щQ(���{�3&)��`
-�}=Cy��[|~��lMj��3K�Ikk��5.��-#�)B����8�,�a�W�h5ٜ�	��K�H#�r��`�#8��e�hk��-<�����gꚻ
\ No newline at end of file
diff --git a/external/selfmake/git/objects/23/834ffe8f0365a5182fb44616cac70d169b706a b/external/selfmake/git/objects/23/834ffe8f0365a5182fb44616cac70d169b706a
deleted file mode 100644
index 43a216d..0000000
Binary files a/external/selfmake/git/objects/23/834ffe8f0365a5182fb44616cac70d169b706a and /dev/null differ
diff --git a/external/selfmake/git/objects/23/c49f8196500a629af037b46972ac0e250cb425 b/external/selfmake/git/objects/23/c49f8196500a629af037b46972ac0e250cb425
deleted file mode 100644
index 4219fbd..0000000
Binary files a/external/selfmake/git/objects/23/c49f8196500a629af037b46972ac0e250cb425 and /dev/null differ
diff --git a/external/selfmake/git/objects/23/d8e3c8c2e9d0a4ab845d04c5b601756dcc815d b/external/selfmake/git/objects/23/d8e3c8c2e9d0a4ab845d04c5b601756dcc815d
deleted file mode 100644
index c18fa2b..0000000
Binary files a/external/selfmake/git/objects/23/d8e3c8c2e9d0a4ab845d04c5b601756dcc815d and /dev/null differ
diff --git a/external/selfmake/git/objects/25/0de83076a3a49c17a7da44132849c504c395ab b/external/selfmake/git/objects/25/0de83076a3a49c17a7da44132849c504c395ab
deleted file mode 100644
index c59cbe0..0000000
Binary files a/external/selfmake/git/objects/25/0de83076a3a49c17a7da44132849c504c395ab and /dev/null differ
diff --git a/external/selfmake/git/objects/25/20f018a672dfecf0e2d540e34dc9925ff96487 b/external/selfmake/git/objects/25/20f018a672dfecf0e2d540e34dc9925ff96487
deleted file mode 100644
index e147680..0000000
Binary files a/external/selfmake/git/objects/25/20f018a672dfecf0e2d540e34dc9925ff96487 and /dev/null differ
diff --git a/external/selfmake/git/objects/25/2696c3f8c4a25f998faf6de0f58f195de59b5b b/external/selfmake/git/objects/25/2696c3f8c4a25f998faf6de0f58f195de59b5b
deleted file mode 100644
index 0a2de0a..0000000
Binary files a/external/selfmake/git/objects/25/2696c3f8c4a25f998faf6de0f58f195de59b5b and /dev/null differ
diff --git a/external/selfmake/git/objects/25/2f710f553e12acfb66ae819a2c2050188bb1d1 b/external/selfmake/git/objects/25/2f710f553e12acfb66ae819a2c2050188bb1d1
deleted file mode 100644
index 444e9a0..0000000
Binary files a/external/selfmake/git/objects/25/2f710f553e12acfb66ae819a2c2050188bb1d1 and /dev/null differ
diff --git a/external/selfmake/git/objects/25/c2dca522ca1d9c6f8c690b3e6e05d0dad7dacf b/external/selfmake/git/objects/25/c2dca522ca1d9c6f8c690b3e6e05d0dad7dacf
deleted file mode 100644
index bdeb6a5..0000000
Binary files a/external/selfmake/git/objects/25/c2dca522ca1d9c6f8c690b3e6e05d0dad7dacf and /dev/null differ
diff --git a/external/selfmake/git/objects/26/6c5d3e3f317e0682701d2317b3d1e9ef348263 b/external/selfmake/git/objects/26/6c5d3e3f317e0682701d2317b3d1e9ef348263
deleted file mode 100644
index 03f44df..0000000
Binary files a/external/selfmake/git/objects/26/6c5d3e3f317e0682701d2317b3d1e9ef348263 and /dev/null differ
diff --git a/external/selfmake/git/objects/26/d594e747bcf581c1745d315bb15117e38af928 b/external/selfmake/git/objects/26/d594e747bcf581c1745d315bb15117e38af928
deleted file mode 100644
index 9aeccc1..0000000
Binary files a/external/selfmake/git/objects/26/d594e747bcf581c1745d315bb15117e38af928 and /dev/null differ
diff --git a/external/selfmake/git/objects/27/fb5aa53e9decef6c342a886d7d986683252351 b/external/selfmake/git/objects/27/fb5aa53e9decef6c342a886d7d986683252351
deleted file mode 100644
index 2015ce9..0000000
Binary files a/external/selfmake/git/objects/27/fb5aa53e9decef6c342a886d7d986683252351 and /dev/null differ
diff --git a/external/selfmake/git/objects/28/472f6415509acd381728a31917e018a21cfe79 b/external/selfmake/git/objects/28/472f6415509acd381728a31917e018a21cfe79
deleted file mode 100644
index 005f0d7..0000000
Binary files a/external/selfmake/git/objects/28/472f6415509acd381728a31917e018a21cfe79 and /dev/null differ
diff --git a/external/selfmake/git/objects/28/6e1c2699cfebc9a502526f06b14adc9bac7022 b/external/selfmake/git/objects/28/6e1c2699cfebc9a502526f06b14adc9bac7022
deleted file mode 100644
index b0d6590..0000000
Binary files a/external/selfmake/git/objects/28/6e1c2699cfebc9a502526f06b14adc9bac7022 and /dev/null differ
diff --git a/external/selfmake/git/objects/28/80671d1c7748174fa5a6435296d1db89903615 b/external/selfmake/git/objects/28/80671d1c7748174fa5a6435296d1db89903615
deleted file mode 100644
index 8735992..0000000
Binary files a/external/selfmake/git/objects/28/80671d1c7748174fa5a6435296d1db89903615 and /dev/null differ
diff --git a/external/selfmake/git/objects/28/a9c11ce51c5f3c1b10c04e1ffb958c0394bb3b b/external/selfmake/git/objects/28/a9c11ce51c5f3c1b10c04e1ffb958c0394bb3b
deleted file mode 100644
index 99e25aa..0000000
Binary files a/external/selfmake/git/objects/28/a9c11ce51c5f3c1b10c04e1ffb958c0394bb3b and /dev/null differ
diff --git a/external/selfmake/git/objects/29/03a87ceea3231ecbf60f6947ff4d46d713f115 b/external/selfmake/git/objects/29/03a87ceea3231ecbf60f6947ff4d46d713f115
deleted file mode 100644
index f1ed846..0000000
Binary files a/external/selfmake/git/objects/29/03a87ceea3231ecbf60f6947ff4d46d713f115 and /dev/null differ
diff --git a/external/selfmake/git/objects/29/86b36f105fa954b1139de19036881b0458879f b/external/selfmake/git/objects/29/86b36f105fa954b1139de19036881b0458879f
deleted file mode 100644
index 4aacb7f..0000000
Binary files a/external/selfmake/git/objects/29/86b36f105fa954b1139de19036881b0458879f and /dev/null differ
diff --git a/external/selfmake/git/objects/29/a6b6388fed0fbe9e05ce80bafd325851fc50c8 b/external/selfmake/git/objects/29/a6b6388fed0fbe9e05ce80bafd325851fc50c8
deleted file mode 100644
index 6994bee..0000000
Binary files a/external/selfmake/git/objects/29/a6b6388fed0fbe9e05ce80bafd325851fc50c8 and /dev/null differ
diff --git a/external/selfmake/git/objects/2b/04cb4d455ec5c69673b069607f3ab714ad7af9 b/external/selfmake/git/objects/2b/04cb4d455ec5c69673b069607f3ab714ad7af9
deleted file mode 100644
index c4e2f0a..0000000
Binary files a/external/selfmake/git/objects/2b/04cb4d455ec5c69673b069607f3ab714ad7af9 and /dev/null differ
diff --git a/external/selfmake/git/objects/2b/98a7f4978e4cb7e558a6380a926e245d9f27fe b/external/selfmake/git/objects/2b/98a7f4978e4cb7e558a6380a926e245d9f27fe
deleted file mode 100644
index 0bdc921..0000000
Binary files a/external/selfmake/git/objects/2b/98a7f4978e4cb7e558a6380a926e245d9f27fe and /dev/null differ
diff --git a/external/selfmake/git/objects/2c/05081cb4af267bfb3345344c899b200a0a7220 b/external/selfmake/git/objects/2c/05081cb4af267bfb3345344c899b200a0a7220
deleted file mode 100644
index 9cabb51..0000000
--- a/external/selfmake/git/objects/2c/05081cb4af267bfb3345344c899b200a0a7220
+++ /dev/null
@@ -1,3 +0,0 @@
-x�P�N�0��X��6	�J��A*҇�D���4��"�#�> Ŀ�$�
-qa��W���qZ��w�Wc��sX��v��(��\�/�\_^�V;F�}.}�Xl(!��p��*��7�k�'�
-��u�yW�(5LS���n!*��ht)UۍLZ�����`��,�+E�*�!�\��x��?�[�����B�,ӲP�4 �N�ڈ��R���$`�n�qE�0��Dc kl��	��]�5;�y��������߿W�RjT��a�����`�����
\ No newline at end of file
diff --git a/external/selfmake/git/objects/2c/2dbda17a7ade12893267efefdce6632369d699 b/external/selfmake/git/objects/2c/2dbda17a7ade12893267efefdce6632369d699
deleted file mode 100644
index 7e1caf4..0000000
Binary files a/external/selfmake/git/objects/2c/2dbda17a7ade12893267efefdce6632369d699 and /dev/null differ
diff --git a/external/selfmake/git/objects/2c/b1371a8f33b104b8a4aedcc616dd953db3b39c b/external/selfmake/git/objects/2c/b1371a8f33b104b8a4aedcc616dd953db3b39c
deleted file mode 100644
index c844576..0000000
Binary files a/external/selfmake/git/objects/2c/b1371a8f33b104b8a4aedcc616dd953db3b39c and /dev/null differ
diff --git a/external/selfmake/git/objects/2e/a700881aab4814623ee671be1baf12f35d0d18 b/external/selfmake/git/objects/2e/a700881aab4814623ee671be1baf12f35d0d18
deleted file mode 100644
index d5b4827..0000000
Binary files a/external/selfmake/git/objects/2e/a700881aab4814623ee671be1baf12f35d0d18 and /dev/null differ
diff --git a/external/selfmake/git/objects/2e/b79f3f4ea3858d170c5a951defd862542f6a24 b/external/selfmake/git/objects/2e/b79f3f4ea3858d170c5a951defd862542f6a24
deleted file mode 100644
index 45bf696..0000000
Binary files a/external/selfmake/git/objects/2e/b79f3f4ea3858d170c5a951defd862542f6a24 and /dev/null differ
diff --git a/external/selfmake/git/objects/2e/f6026d76e28f2b9ff160a13582c58d109d3c93 b/external/selfmake/git/objects/2e/f6026d76e28f2b9ff160a13582c58d109d3c93
deleted file mode 100644
index f6c22d1..0000000
Binary files a/external/selfmake/git/objects/2e/f6026d76e28f2b9ff160a13582c58d109d3c93 and /dev/null differ
diff --git a/external/selfmake/git/objects/2f/1f71b2b9ac642e749ba06ba06cfcdc61a917a0 b/external/selfmake/git/objects/2f/1f71b2b9ac642e749ba06ba06cfcdc61a917a0
deleted file mode 100644
index 71b33e1..0000000
--- a/external/selfmake/git/objects/2f/1f71b2b9ac642e749ba06ba06cfcdc61a917a0
+++ /dev/null
@@ -1,4 +0,0 @@
-x�S]O�0�s~���K��	M�ҲV+m�m�4Y�}�XK����ﳓE���C��k�{ικ�k8=���o�
-.�����I���(��DV��
-�-MT�ϴa�KT|v 
-�7�H��U�֠+*�FYj��0�i��{���h��Uy�t!��Q�KfW��N7GI�\,��gm��CHɅ�CHno��r9;�!�\Pפ���տ�������]���/�VPåx��My5N/g�g䂛��΃��H���7K�z�#ko乒�y)���+�ِR��U���Mq�o���pڮ=C&_��h�+�;���'�L�G"�0�rl7�&ʙ>W�zm��"16��|���j����'7
\ No newline at end of file
diff --git a/external/selfmake/git/objects/30/64efdd78a08064ced018f71639e690ab8ba3e4 b/external/selfmake/git/objects/30/64efdd78a08064ced018f71639e690ab8ba3e4
deleted file mode 100644
index 4e241e8..0000000
Binary files a/external/selfmake/git/objects/30/64efdd78a08064ced018f71639e690ab8ba3e4 and /dev/null differ
diff --git a/external/selfmake/git/objects/30/be3ef7d5b47bcb9ff36f92e7536a19079aabc7 b/external/selfmake/git/objects/30/be3ef7d5b47bcb9ff36f92e7536a19079aabc7
deleted file mode 100644
index 422badd..0000000
Binary files a/external/selfmake/git/objects/30/be3ef7d5b47bcb9ff36f92e7536a19079aabc7 and /dev/null differ
diff --git a/external/selfmake/git/objects/30/cc66f335000838312dbdcad7f9a0f6d3850520 b/external/selfmake/git/objects/30/cc66f335000838312dbdcad7f9a0f6d3850520
deleted file mode 100644
index f3d18a0..0000000
Binary files a/external/selfmake/git/objects/30/cc66f335000838312dbdcad7f9a0f6d3850520 and /dev/null differ
diff --git a/external/selfmake/git/objects/34/0606fd57fb1c71e6aaef66b0d020f56eed4c1d b/external/selfmake/git/objects/34/0606fd57fb1c71e6aaef66b0d020f56eed4c1d
deleted file mode 100644
index d721a9a..0000000
Binary files a/external/selfmake/git/objects/34/0606fd57fb1c71e6aaef66b0d020f56eed4c1d and /dev/null differ
diff --git a/external/selfmake/git/objects/34/b1a31e81df92ff741367a55c3cfa1d54c2edb6 b/external/selfmake/git/objects/34/b1a31e81df92ff741367a55c3cfa1d54c2edb6
deleted file mode 100644
index bb32519..0000000
Binary files a/external/selfmake/git/objects/34/b1a31e81df92ff741367a55c3cfa1d54c2edb6 and /dev/null differ
diff --git a/external/selfmake/git/objects/35/3f045d828469a9a7543825204e2fd8cbf96557 b/external/selfmake/git/objects/35/3f045d828469a9a7543825204e2fd8cbf96557
deleted file mode 100644
index ecf08c7..0000000
Binary files a/external/selfmake/git/objects/35/3f045d828469a9a7543825204e2fd8cbf96557 and /dev/null differ
diff --git a/external/selfmake/git/objects/35/b586e2ad3e3c1258afbcb91fd2c6c5ec2e1b13 b/external/selfmake/git/objects/35/b586e2ad3e3c1258afbcb91fd2c6c5ec2e1b13
deleted file mode 100644
index c49bf66..0000000
Binary files a/external/selfmake/git/objects/35/b586e2ad3e3c1258afbcb91fd2c6c5ec2e1b13 and /dev/null differ
diff --git a/external/selfmake/git/objects/36/7d4c53b5d91eb9035f544ae435b63dea38d55a b/external/selfmake/git/objects/36/7d4c53b5d91eb9035f544ae435b63dea38d55a
deleted file mode 100644
index 280aa1e..0000000
Binary files a/external/selfmake/git/objects/36/7d4c53b5d91eb9035f544ae435b63dea38d55a and /dev/null differ
diff --git a/external/selfmake/git/objects/36/9cad33588818022998fb50a965126e004c2a32 b/external/selfmake/git/objects/36/9cad33588818022998fb50a965126e004c2a32
deleted file mode 100644
index 81ad79a..0000000
Binary files a/external/selfmake/git/objects/36/9cad33588818022998fb50a965126e004c2a32 and /dev/null differ
diff --git a/external/selfmake/git/objects/36/fc1a83d20c0c5224f6163d71f1e1247eed9f7d b/external/selfmake/git/objects/36/fc1a83d20c0c5224f6163d71f1e1247eed9f7d
deleted file mode 100644
index f6c3f9d..0000000
--- a/external/selfmake/git/objects/36/fc1a83d20c0c5224f6163d71f1e1247eed9f7d
+++ /dev/null
@@ -1,5 +0,0 @@
-x��M
-1�a�=E�4�?q!�#mS�8Vf*���ܽ|��ʲ�
-�ݮ��@^�#F
-�,�bm�4�4yI<%$�	�yɪ�
-:�)�q��w��~����B��"#�z++��^���e�Z����G�r�6�4�-�ik;X�j.�Ϳ�Cj.O���֭3?�+I�
\ No newline at end of file
diff --git a/external/selfmake/git/objects/37/fc4ba5ae8eff650458c7eb9f9fc317a14c8bb5 b/external/selfmake/git/objects/37/fc4ba5ae8eff650458c7eb9f9fc317a14c8bb5
deleted file mode 100644
index ce6c7f2..0000000
Binary files a/external/selfmake/git/objects/37/fc4ba5ae8eff650458c7eb9f9fc317a14c8bb5 and /dev/null differ
diff --git a/external/selfmake/git/objects/38/44f3a38401727777247ce39ad11aa48cc87388 b/external/selfmake/git/objects/38/44f3a38401727777247ce39ad11aa48cc87388
deleted file mode 100644
index e71db8a..0000000
Binary files a/external/selfmake/git/objects/38/44f3a38401727777247ce39ad11aa48cc87388 and /dev/null differ
diff --git a/external/selfmake/git/objects/39/f2765686303c185b811f7269d68d2db7c88104 b/external/selfmake/git/objects/39/f2765686303c185b811f7269d68d2db7c88104
deleted file mode 100644
index f091763..0000000
Binary files a/external/selfmake/git/objects/39/f2765686303c185b811f7269d68d2db7c88104 and /dev/null differ
diff --git a/external/selfmake/git/objects/3c/41c406597ccdb43ea16efc57fd733b1eb08197 b/external/selfmake/git/objects/3c/41c406597ccdb43ea16efc57fd733b1eb08197
deleted file mode 100644
index fac0621..0000000
Binary files a/external/selfmake/git/objects/3c/41c406597ccdb43ea16efc57fd733b1eb08197 and /dev/null differ
diff --git a/external/selfmake/git/objects/3d/05377bbf7a05b18475bd71244dc62136b428fa b/external/selfmake/git/objects/3d/05377bbf7a05b18475bd71244dc62136b428fa
deleted file mode 100644
index f85ec5a..0000000
Binary files a/external/selfmake/git/objects/3d/05377bbf7a05b18475bd71244dc62136b428fa and /dev/null differ
diff --git a/external/selfmake/git/objects/3d/a2964fe79ccacf6d2b9a106fcd10daebfc231b b/external/selfmake/git/objects/3d/a2964fe79ccacf6d2b9a106fcd10daebfc231b
deleted file mode 100644
index 8cafe4a..0000000
Binary files a/external/selfmake/git/objects/3d/a2964fe79ccacf6d2b9a106fcd10daebfc231b and /dev/null differ
diff --git a/external/selfmake/git/objects/3e/007b0d3f4061328a908d5a84c4ccb4c012b138 b/external/selfmake/git/objects/3e/007b0d3f4061328a908d5a84c4ccb4c012b138
deleted file mode 100644
index cb5ba27..0000000
Binary files a/external/selfmake/git/objects/3e/007b0d3f4061328a908d5a84c4ccb4c012b138 and /dev/null differ
diff --git a/external/selfmake/git/objects/3f/b3d41a12122ce103d7d1cd123cd1135021d008 b/external/selfmake/git/objects/3f/b3d41a12122ce103d7d1cd123cd1135021d008
deleted file mode 100644
index d9fbfe2..0000000
Binary files a/external/selfmake/git/objects/3f/b3d41a12122ce103d7d1cd123cd1135021d008 and /dev/null differ
diff --git a/external/selfmake/git/objects/3f/cd55f76303f5ef515203c0141a8458c6cfc0e6 b/external/selfmake/git/objects/3f/cd55f76303f5ef515203c0141a8458c6cfc0e6
deleted file mode 100644
index b53c152..0000000
Binary files a/external/selfmake/git/objects/3f/cd55f76303f5ef515203c0141a8458c6cfc0e6 and /dev/null differ
diff --git a/external/selfmake/git/objects/40/c0bce6ad433f2fe71d1531d2b633dc6702a302 b/external/selfmake/git/objects/40/c0bce6ad433f2fe71d1531d2b633dc6702a302
deleted file mode 100644
index 6f719e1..0000000
Binary files a/external/selfmake/git/objects/40/c0bce6ad433f2fe71d1531d2b633dc6702a302 and /dev/null differ
diff --git a/external/selfmake/git/objects/41/921f584c53a8f7234fd4f9ca79a1cf99784345 b/external/selfmake/git/objects/41/921f584c53a8f7234fd4f9ca79a1cf99784345
deleted file mode 100644
index 4f36721..0000000
Binary files a/external/selfmake/git/objects/41/921f584c53a8f7234fd4f9ca79a1cf99784345 and /dev/null differ
diff --git a/external/selfmake/git/objects/41/c608344a9bfb70829d5467dcc4755e82f8a034 b/external/selfmake/git/objects/41/c608344a9bfb70829d5467dcc4755e82f8a034
deleted file mode 100644
index 2773f04..0000000
Binary files a/external/selfmake/git/objects/41/c608344a9bfb70829d5467dcc4755e82f8a034 and /dev/null differ
diff --git a/external/selfmake/git/objects/43/bf32438b8e8c71368f14ce496f59bb1778748c b/external/selfmake/git/objects/43/bf32438b8e8c71368f14ce496f59bb1778748c
deleted file mode 100644
index 764fef3..0000000
--- a/external/selfmake/git/objects/43/bf32438b8e8c71368f14ce496f59bb1778748c
+++ /dev/null
@@ -1 +0,0 @@
-xM��N�@���#ѐ�,��t�ŝ���O�{����(�nV��v����z|{z�����!t�����=A��Y�m���	#	ϑFL��U�#l��r�ȵ�$$�>���Y!�馯�E)�J��H��4��ˢ���g֥:3����\�7
\ No newline at end of file
diff --git a/external/selfmake/git/objects/44/02c5aaeef9440b2280ae396d6435b79c989c20 b/external/selfmake/git/objects/44/02c5aaeef9440b2280ae396d6435b79c989c20
deleted file mode 100644
index b3a091b..0000000
Binary files a/external/selfmake/git/objects/44/02c5aaeef9440b2280ae396d6435b79c989c20 and /dev/null differ
diff --git a/external/selfmake/git/objects/44/3ddaa6bdb8a80c1d371c492580d8eddf0f0077 b/external/selfmake/git/objects/44/3ddaa6bdb8a80c1d371c492580d8eddf0f0077
deleted file mode 100644
index 01c642f..0000000
Binary files a/external/selfmake/git/objects/44/3ddaa6bdb8a80c1d371c492580d8eddf0f0077 and /dev/null differ
diff --git a/external/selfmake/git/objects/45/2e502b79e98e0817a69a9714305c54fe33b682 b/external/selfmake/git/objects/45/2e502b79e98e0817a69a9714305c54fe33b682
deleted file mode 100644
index fccf996..0000000
Binary files a/external/selfmake/git/objects/45/2e502b79e98e0817a69a9714305c54fe33b682 and /dev/null differ
diff --git a/external/selfmake/git/objects/45/584302d7f127c14a220b6b4cfa9c3d6ccc915f b/external/selfmake/git/objects/45/584302d7f127c14a220b6b4cfa9c3d6ccc915f
deleted file mode 100644
index b83193c..0000000
Binary files a/external/selfmake/git/objects/45/584302d7f127c14a220b6b4cfa9c3d6ccc915f and /dev/null differ
diff --git a/external/selfmake/git/objects/46/2d6ffa3a9eb8c8dd2411089d434f7b184998f1 b/external/selfmake/git/objects/46/2d6ffa3a9eb8c8dd2411089d434f7b184998f1
deleted file mode 100644
index d8180d3..0000000
--- a/external/selfmake/git/objects/46/2d6ffa3a9eb8c8dd2411089d434f7b184998f1
+++ /dev/null
@@ -1,3 +0,0 @@
-x�OAN�0�W쭇J��&�!�q��zݤm��u���1B|��J��ٙޖe���j��dġR�ٷ�ia#cA�l]w	E�
-�M�)h\H��'4�!KN,֢AK���}&���ِB�ʐM4�x��BF�unu�
-����E��95���:���a	������դ<9��WF����V�tR���'ص�u[��������I�W��O)�{�s^�I�o:�i~
\ No newline at end of file
diff --git a/external/selfmake/git/objects/48/06c94ce2a66a6077a4c779e87f2a6c27fba242 b/external/selfmake/git/objects/48/06c94ce2a66a6077a4c779e87f2a6c27fba242
deleted file mode 100644
index 557eea5..0000000
Binary files a/external/selfmake/git/objects/48/06c94ce2a66a6077a4c779e87f2a6c27fba242 and /dev/null differ
diff --git a/external/selfmake/git/objects/48/8b1bf27fc110e10781b28746b330d2246c2a73 b/external/selfmake/git/objects/48/8b1bf27fc110e10781b28746b330d2246c2a73
deleted file mode 100644
index d96d06a..0000000
Binary files a/external/selfmake/git/objects/48/8b1bf27fc110e10781b28746b330d2246c2a73 and /dev/null differ
diff --git a/external/selfmake/git/objects/49/8d24f71d660e0d6034099f2667c85825338001 b/external/selfmake/git/objects/49/8d24f71d660e0d6034099f2667c85825338001
deleted file mode 100644
index 4840ac3..0000000
--- a/external/selfmake/git/objects/49/8d24f71d660e0d6034099f2667c85825338001
+++ /dev/null
@@ -1,3 +0,0 @@
-x��]o�0�w�_qTn �`�Mb���DR���6��`G�ݮZ��wl�c�6��yχ��s�U.W�n�����7��
-\�#-�9�7�_G�$ϯ�C}�,0rA+�d�f�|g���ⅆi"R���Z�xP<�4�
-�cx�ِ�9eU1ǅ������_G	T}
\ No newline at end of file
diff --git a/external/selfmake/git/objects/4a/7581df12e5b96faeb3cde278eb0981ea166c6c b/external/selfmake/git/objects/4a/7581df12e5b96faeb3cde278eb0981ea166c6c
deleted file mode 100644
index ce36ab1..0000000
Binary files a/external/selfmake/git/objects/4a/7581df12e5b96faeb3cde278eb0981ea166c6c and /dev/null differ
diff --git a/external/selfmake/git/objects/4d/b1a8a8af6d6923751693d86151021f56969568 b/external/selfmake/git/objects/4d/b1a8a8af6d6923751693d86151021f56969568
deleted file mode 100644
index 7ef4c01..0000000
--- a/external/selfmake/git/objects/4d/b1a8a8af6d6923751693d86151021f56969568
+++ /dev/null
@@ -1,4 +0,0 @@
-x�V�o�F�3��� _r�J��k�`�m����x
-�G�Ge^�P��	<��F|Dd�W�x��o�'�7E����UIİ�����+�Xt`	]�9T��֌'�2���1}��H�`u6eJ�����<�S0��u#Pc~�xP�"z?w���A�R�<��/3���(ap�mҊ�cs&`������X�}�a�bm�\ρ8φ-�hL(��X���L�)��l6���0lb.Mý��kګ}�Z{�j��A|�\�ɇ(�X^���0���J�W��a(u%�z�]�j��y*3�ekmzը�YMGLb:g�W�6X���"q�@�;[�?��yBy\z����\��mc�;�w��ñ��xz-�����#�FL]F6
-ʸ�;�^3�G[>.��X�,�I��*F	��N)q޺�*2��c]	��Q�Qƫ�?,T�_L֣�=��_LԪO�&f[���-c1^^�!�q���\��⵪���}�w��	��;E+����0M��%����:I��D7�tt�9� ���d	?H4�[D#�T�U}�S\+��UG�D��퐗�"��R�i�1���F��w�FT�5��E�V�>��=��
-� |�Ow����8P�{�/f��j�Q��Yvw&�Y�j�k�gNIwP��7ɋ�<��p�	��x��
\ No newline at end of file
diff --git a/external/selfmake/git/objects/4d/b7f134b6bc23acaa8988321f0a5aae3011ec81 b/external/selfmake/git/objects/4d/b7f134b6bc23acaa8988321f0a5aae3011ec81
deleted file mode 100644
index 58bc22c..0000000
Binary files a/external/selfmake/git/objects/4d/b7f134b6bc23acaa8988321f0a5aae3011ec81 and /dev/null differ
diff --git a/external/selfmake/git/objects/4e/522664d9638acbf6e4dde65b1f1f2c2eb5d1e7 b/external/selfmake/git/objects/4e/522664d9638acbf6e4dde65b1f1f2c2eb5d1e7
deleted file mode 100644
index f106e43..0000000
Binary files a/external/selfmake/git/objects/4e/522664d9638acbf6e4dde65b1f1f2c2eb5d1e7 and /dev/null differ
diff --git a/external/selfmake/git/objects/4f/65f843f40cb9b1b1d5573cc7faf07afe1b5ac6 b/external/selfmake/git/objects/4f/65f843f40cb9b1b1d5573cc7faf07afe1b5ac6
deleted file mode 100644
index 11a3f3b..0000000
Binary files a/external/selfmake/git/objects/4f/65f843f40cb9b1b1d5573cc7faf07afe1b5ac6 and /dev/null differ
diff --git a/external/selfmake/git/objects/4f/b20d71565cb38cb62cfa1e234a398a998fb25c b/external/selfmake/git/objects/4f/b20d71565cb38cb62cfa1e234a398a998fb25c
deleted file mode 100644
index 86ebe52..0000000
Binary files a/external/selfmake/git/objects/4f/b20d71565cb38cb62cfa1e234a398a998fb25c and /dev/null differ
diff --git a/external/selfmake/git/objects/51/367b45c49ac4b57d36cc0dd2679b5818e04d24 b/external/selfmake/git/objects/51/367b45c49ac4b57d36cc0dd2679b5818e04d24
deleted file mode 100644
index a285ff8..0000000
Binary files a/external/selfmake/git/objects/51/367b45c49ac4b57d36cc0dd2679b5818e04d24 and /dev/null differ
diff --git a/external/selfmake/git/objects/51/59b532aff3744f655c7374f0c18b334b4f5070 b/external/selfmake/git/objects/51/59b532aff3744f655c7374f0c18b334b4f5070
deleted file mode 100644
index d16694a..0000000
Binary files a/external/selfmake/git/objects/51/59b532aff3744f655c7374f0c18b334b4f5070 and /dev/null differ
diff --git a/external/selfmake/git/objects/51/c6bc561584eab2b31e2eb702042ea2b523017e b/external/selfmake/git/objects/51/c6bc561584eab2b31e2eb702042ea2b523017e
deleted file mode 100644
index 8352642..0000000
Binary files a/external/selfmake/git/objects/51/c6bc561584eab2b31e2eb702042ea2b523017e and /dev/null differ
diff --git a/external/selfmake/git/objects/52/4ad2814b3dacd1a99ef8c0298b14f4d3a9741e b/external/selfmake/git/objects/52/4ad2814b3dacd1a99ef8c0298b14f4d3a9741e
deleted file mode 100644
index 0462422..0000000
Binary files a/external/selfmake/git/objects/52/4ad2814b3dacd1a99ef8c0298b14f4d3a9741e and /dev/null differ
diff --git a/external/selfmake/git/objects/53/7935e977ac6bcc6d356695ef93f4957dd3bf24 b/external/selfmake/git/objects/53/7935e977ac6bcc6d356695ef93f4957dd3bf24
deleted file mode 100644
index 042f3ac..0000000
--- a/external/selfmake/git/objects/53/7935e977ac6bcc6d356695ef93f4957dd3bf24
+++ /dev/null
@@ -1 +0,0 @@
-x�Tmo�0�g��[�P�L�>����Kِ�ZA�&�jJ��X8vd'۴�>�JE�E�s�so���"�"�޿z�F\�(4	!�>�7XL��ɗO�����]75(Vi�A��I�J���d��g1�2Lg�b����5������7���j�y��A˃K�*!�{��ل�g��Gˠa�R�<�C��Jһ_�vRa\2Q�H�j�e<CS��i]�.�q!YΕtǯi�"���qo-��s+&��|��UR����؂�,O4�VG��߂�:�-�J��(m��&b�z����_�N��@^�ݞ;�5�Y!s�b�et�sa��.i8���s�䊯�����MV���loCmP�;�A��>��kT'|jF���+�\���$s��n7OMuh1��hL��*t�QR�G𿊷���<�Z�n���!5i9��O�pQ��q7�+�R��!�Ϲ����'>R�HQ�i���<���)�W���G�A/ OP�W����2����J��v��Ae���d��]�7ي��=�]
\ No newline at end of file
diff --git a/external/selfmake/git/objects/54/1307debf7833e730bddb48a891a5b7df377f28 b/external/selfmake/git/objects/54/1307debf7833e730bddb48a891a5b7df377f28
deleted file mode 100644
index 2ec1299..0000000
Binary files a/external/selfmake/git/objects/54/1307debf7833e730bddb48a891a5b7df377f28 and /dev/null differ
diff --git a/external/selfmake/git/objects/54/2006e2705fa9bc2b727840956e833cb5852b92 b/external/selfmake/git/objects/54/2006e2705fa9bc2b727840956e833cb5852b92
deleted file mode 100644
index 397d8c0..0000000
Binary files a/external/selfmake/git/objects/54/2006e2705fa9bc2b727840956e833cb5852b92 and /dev/null differ
diff --git a/external/selfmake/git/objects/54/94d5397681428f557eaffc36008ba64316c9c1 b/external/selfmake/git/objects/54/94d5397681428f557eaffc36008ba64316c9c1
deleted file mode 100644
index 52a7d94..0000000
Binary files a/external/selfmake/git/objects/54/94d5397681428f557eaffc36008ba64316c9c1 and /dev/null differ
diff --git a/external/selfmake/git/objects/54/b9eccfe0612fce49effa094f20d934fcd88bb0 b/external/selfmake/git/objects/54/b9eccfe0612fce49effa094f20d934fcd88bb0
deleted file mode 100644
index f08f4f4..0000000
Binary files a/external/selfmake/git/objects/54/b9eccfe0612fce49effa094f20d934fcd88bb0 and /dev/null differ
diff --git a/external/selfmake/git/objects/54/bdc438132e91f3ca251828119b98e7e72e7309 b/external/selfmake/git/objects/54/bdc438132e91f3ca251828119b98e7e72e7309
deleted file mode 100644
index f914013..0000000
Binary files a/external/selfmake/git/objects/54/bdc438132e91f3ca251828119b98e7e72e7309 and /dev/null differ
diff --git a/external/selfmake/git/objects/54/e06b7f1c776677b6a65b03098381bd907f5acd b/external/selfmake/git/objects/54/e06b7f1c776677b6a65b03098381bd907f5acd
deleted file mode 100644
index 11aeefe..0000000
Binary files a/external/selfmake/git/objects/54/e06b7f1c776677b6a65b03098381bd907f5acd and /dev/null differ
diff --git a/external/selfmake/git/objects/55/6074efb25b147c15620534e0424cf636d74621 b/external/selfmake/git/objects/55/6074efb25b147c15620534e0424cf636d74621
deleted file mode 100644
index 9b62ee9..0000000
Binary files a/external/selfmake/git/objects/55/6074efb25b147c15620534e0424cf636d74621 and /dev/null differ
diff --git a/external/selfmake/git/objects/55/86ba7221ded8b4044b116ba40d1e7bd23cefec b/external/selfmake/git/objects/55/86ba7221ded8b4044b116ba40d1e7bd23cefec
deleted file mode 100644
index 99a129b..0000000
Binary files a/external/selfmake/git/objects/55/86ba7221ded8b4044b116ba40d1e7bd23cefec and /dev/null differ
diff --git a/external/selfmake/git/objects/56/4e5800a031a9571770f2fbc713402b5b2c94d9 b/external/selfmake/git/objects/56/4e5800a031a9571770f2fbc713402b5b2c94d9
deleted file mode 100644
index 8e07bf1..0000000
Binary files a/external/selfmake/git/objects/56/4e5800a031a9571770f2fbc713402b5b2c94d9 and /dev/null differ
diff --git a/external/selfmake/git/objects/56/75adba234c071aabb31d7a2b5fcdfdc1e54b0f b/external/selfmake/git/objects/56/75adba234c071aabb31d7a2b5fcdfdc1e54b0f
deleted file mode 100644
index 8f560e6..0000000
Binary files a/external/selfmake/git/objects/56/75adba234c071aabb31d7a2b5fcdfdc1e54b0f and /dev/null differ
diff --git a/external/selfmake/git/objects/57/348e3889e23a8204e2ffc10b7260cc921ef04e b/external/selfmake/git/objects/57/348e3889e23a8204e2ffc10b7260cc921ef04e
deleted file mode 100644
index b9d7764..0000000
Binary files a/external/selfmake/git/objects/57/348e3889e23a8204e2ffc10b7260cc921ef04e and /dev/null differ
diff --git a/external/selfmake/git/objects/57/592cd7adf93e17d7ca2da8c39e7a5cd161d6b6 b/external/selfmake/git/objects/57/592cd7adf93e17d7ca2da8c39e7a5cd161d6b6
deleted file mode 100644
index d2b91b5..0000000
Binary files a/external/selfmake/git/objects/57/592cd7adf93e17d7ca2da8c39e7a5cd161d6b6 and /dev/null differ
diff --git a/external/selfmake/git/objects/57/830f5fdcdf852401ffb696db40b4331701b318 b/external/selfmake/git/objects/57/830f5fdcdf852401ffb696db40b4331701b318
deleted file mode 100644
index 11efd51..0000000
Binary files a/external/selfmake/git/objects/57/830f5fdcdf852401ffb696db40b4331701b318 and /dev/null differ
diff --git a/external/selfmake/git/objects/58/a9804d3fabdfe9bba614d95278699d305cc863 b/external/selfmake/git/objects/58/a9804d3fabdfe9bba614d95278699d305cc863
deleted file mode 100644
index 7586e5b..0000000
Binary files a/external/selfmake/git/objects/58/a9804d3fabdfe9bba614d95278699d305cc863 and /dev/null differ
diff --git a/external/selfmake/git/objects/59/6aa791ade536b42b962dcd32ba25bdb75c4e8b b/external/selfmake/git/objects/59/6aa791ade536b42b962dcd32ba25bdb75c4e8b
deleted file mode 100644
index c948ff5..0000000
Binary files a/external/selfmake/git/objects/59/6aa791ade536b42b962dcd32ba25bdb75c4e8b and /dev/null differ
diff --git a/external/selfmake/git/objects/59/87e77673f5cac58606adbd9069a214c82d6d3f b/external/selfmake/git/objects/59/87e77673f5cac58606adbd9069a214c82d6d3f
deleted file mode 100644
index 5e6d2e6..0000000
Binary files a/external/selfmake/git/objects/59/87e77673f5cac58606adbd9069a214c82d6d3f and /dev/null differ
diff --git a/external/selfmake/git/objects/5a/169b9613edc99a35ee5003242a387833467608 b/external/selfmake/git/objects/5a/169b9613edc99a35ee5003242a387833467608
deleted file mode 100644
index c923f90..0000000
Binary files a/external/selfmake/git/objects/5a/169b9613edc99a35ee5003242a387833467608 and /dev/null differ
diff --git a/external/selfmake/git/objects/5a/64896f37d890b2675f3195ad4427f26f10abda b/external/selfmake/git/objects/5a/64896f37d890b2675f3195ad4427f26f10abda
deleted file mode 100644
index 6697f64..0000000
Binary files a/external/selfmake/git/objects/5a/64896f37d890b2675f3195ad4427f26f10abda and /dev/null differ
diff --git a/external/selfmake/git/objects/5b/1b1113b79e17bd57c264461f4c1bf0e4a2f8b6 b/external/selfmake/git/objects/5b/1b1113b79e17bd57c264461f4c1bf0e4a2f8b6
deleted file mode 100644
index bf959b5..0000000
Binary files a/external/selfmake/git/objects/5b/1b1113b79e17bd57c264461f4c1bf0e4a2f8b6 and /dev/null differ
diff --git a/external/selfmake/git/objects/5b/2f2623ad576166f72952859d7dc546fc68bcd5 b/external/selfmake/git/objects/5b/2f2623ad576166f72952859d7dc546fc68bcd5
deleted file mode 100644
index dcffaf1..0000000
Binary files a/external/selfmake/git/objects/5b/2f2623ad576166f72952859d7dc546fc68bcd5 and /dev/null differ
diff --git a/external/selfmake/git/objects/5b/6889b109581a1f634a71879f5cea90e19d4bb3 b/external/selfmake/git/objects/5b/6889b109581a1f634a71879f5cea90e19d4bb3
deleted file mode 100644
index 1d08876..0000000
Binary files a/external/selfmake/git/objects/5b/6889b109581a1f634a71879f5cea90e19d4bb3 and /dev/null differ
diff --git a/external/selfmake/git/objects/5b/c130fa3353744e4deb73248da4f957a9f9fde7 b/external/selfmake/git/objects/5b/c130fa3353744e4deb73248da4f957a9f9fde7
deleted file mode 100644
index 4d2861d..0000000
Binary files a/external/selfmake/git/objects/5b/c130fa3353744e4deb73248da4f957a9f9fde7 and /dev/null differ
diff --git a/external/selfmake/git/objects/5b/de2816adc75e4726317146d0b38eedf6e5d625 b/external/selfmake/git/objects/5b/de2816adc75e4726317146d0b38eedf6e5d625
deleted file mode 100644
index a30728d..0000000
Binary files a/external/selfmake/git/objects/5b/de2816adc75e4726317146d0b38eedf6e5d625 and /dev/null differ
diff --git a/external/selfmake/git/objects/5c/8c6521465d245ea6d94a8c9240a48defcb1f69 b/external/selfmake/git/objects/5c/8c6521465d245ea6d94a8c9240a48defcb1f69
deleted file mode 100644
index 111ad2f..0000000
Binary files a/external/selfmake/git/objects/5c/8c6521465d245ea6d94a8c9240a48defcb1f69 and /dev/null differ
diff --git a/external/selfmake/git/objects/5c/969fc7d4827f1cf124e07086589c04e0e64064 b/external/selfmake/git/objects/5c/969fc7d4827f1cf124e07086589c04e0e64064
deleted file mode 100644
index 6b46dd7..0000000
Binary files a/external/selfmake/git/objects/5c/969fc7d4827f1cf124e07086589c04e0e64064 and /dev/null differ
diff --git a/external/selfmake/git/objects/5c/9efd8c4342c0457f4fbc2bf547a3ff696cb45b b/external/selfmake/git/objects/5c/9efd8c4342c0457f4fbc2bf547a3ff696cb45b
deleted file mode 100644
index 51375e0..0000000
Binary files a/external/selfmake/git/objects/5c/9efd8c4342c0457f4fbc2bf547a3ff696cb45b and /dev/null differ
diff --git a/external/selfmake/git/objects/5c/cd95a299b28a98f40e84a2049e29ded9cc7037 b/external/selfmake/git/objects/5c/cd95a299b28a98f40e84a2049e29ded9cc7037
deleted file mode 100644
index c5982e3..0000000
Binary files a/external/selfmake/git/objects/5c/cd95a299b28a98f40e84a2049e29ded9cc7037 and /dev/null differ
diff --git a/external/selfmake/git/objects/5d/1dd9b0ba4225ed332663ab412cbcbca0e364b3 b/external/selfmake/git/objects/5d/1dd9b0ba4225ed332663ab412cbcbca0e364b3
deleted file mode 100644
index 7fdd1e9..0000000
Binary files a/external/selfmake/git/objects/5d/1dd9b0ba4225ed332663ab412cbcbca0e364b3 and /dev/null differ
diff --git a/external/selfmake/git/objects/5d/cb1ea852be09cdc7254677d9d1078c1a330044 b/external/selfmake/git/objects/5d/cb1ea852be09cdc7254677d9d1078c1a330044
deleted file mode 100644
index 9a5716f..0000000
Binary files a/external/selfmake/git/objects/5d/cb1ea852be09cdc7254677d9d1078c1a330044 and /dev/null differ
diff --git a/external/selfmake/git/objects/5f/2a1fdd0aa288a5c25233e997bd46a118fdccf6 b/external/selfmake/git/objects/5f/2a1fdd0aa288a5c25233e997bd46a118fdccf6
deleted file mode 100644
index e643002..0000000
Binary files a/external/selfmake/git/objects/5f/2a1fdd0aa288a5c25233e997bd46a118fdccf6 and /dev/null differ
diff --git a/external/selfmake/git/objects/61/c364c37e93676156e4c4183feda5bdf0f070dc b/external/selfmake/git/objects/61/c364c37e93676156e4c4183feda5bdf0f070dc
deleted file mode 100644
index cd6dc73..0000000
Binary files a/external/selfmake/git/objects/61/c364c37e93676156e4c4183feda5bdf0f070dc and /dev/null differ
diff --git a/external/selfmake/git/objects/61/ce2def9a74aea5ce4a78c24f5250ab8b2272d2 b/external/selfmake/git/objects/61/ce2def9a74aea5ce4a78c24f5250ab8b2272d2
deleted file mode 100644
index 32f61d3..0000000
Binary files a/external/selfmake/git/objects/61/ce2def9a74aea5ce4a78c24f5250ab8b2272d2 and /dev/null differ
diff --git a/external/selfmake/git/objects/61/e4ae641e83adc1073d971b853256ceff17a25c b/external/selfmake/git/objects/61/e4ae641e83adc1073d971b853256ceff17a25c
deleted file mode 100644
index 04df3ce..0000000
Binary files a/external/selfmake/git/objects/61/e4ae641e83adc1073d971b853256ceff17a25c and /dev/null differ
diff --git a/external/selfmake/git/objects/62/532082e21469617e5eb6d6d1ef84f6bed9896a b/external/selfmake/git/objects/62/532082e21469617e5eb6d6d1ef84f6bed9896a
deleted file mode 100644
index 1515d6e..0000000
--- a/external/selfmake/git/objects/62/532082e21469617e5eb6d6d1ef84f6bed9896a
+++ /dev/null
@@ -1,3 +0,0 @@
-x+)JMU01�`040031Qp+�K.���+�KfP���n��9&Z��3ҚU�1�e0D��7s����ZJZ�>��>w�5TY@bQqj�(�����t�VjXg��b�}Ό9
-�j2b�N]4sS׌/|-�X�i޻y���&8��(9�9?�$���h}5��i�5�Z��u����*v�3�Evt��~m��k҃���콬(jA3�uq�bL��kkn�]x�"����'��jH\��ck�/�PC��/vA��g��eV�=��y/w�EZ�ڗL����ιZ��,������Ȑڅ���p�q���d�sPea�E��I9� �=2�_�`�`v��fW���
-��2���:}(<1��ٔv��u��%���T
\ No newline at end of file
diff --git a/external/selfmake/git/objects/64/8a5c6d5f14ce618a076d57f9faa8fe8b252ba4 b/external/selfmake/git/objects/64/8a5c6d5f14ce618a076d57f9faa8fe8b252ba4
deleted file mode 100644
index 7b5af32..0000000
Binary files a/external/selfmake/git/objects/64/8a5c6d5f14ce618a076d57f9faa8fe8b252ba4 and /dev/null differ
diff --git a/external/selfmake/git/objects/65/7c7f02725d64347e3dc9529c281db7a2ba6a97 b/external/selfmake/git/objects/65/7c7f02725d64347e3dc9529c281db7a2ba6a97
deleted file mode 100644
index c5b6115..0000000
Binary files a/external/selfmake/git/objects/65/7c7f02725d64347e3dc9529c281db7a2ba6a97 and /dev/null differ
diff --git a/external/selfmake/git/objects/65/d6ba5cc3b45d99ac3ebe50316891c5ccc88d60 b/external/selfmake/git/objects/65/d6ba5cc3b45d99ac3ebe50316891c5ccc88d60
deleted file mode 100644
index 0c3575f..0000000
Binary files a/external/selfmake/git/objects/65/d6ba5cc3b45d99ac3ebe50316891c5ccc88d60 and /dev/null differ
diff --git a/external/selfmake/git/objects/66/cd2a04e433275d557318f52cfb9ca59806c9fb b/external/selfmake/git/objects/66/cd2a04e433275d557318f52cfb9ca59806c9fb
deleted file mode 100644
index fcedd5b..0000000
--- a/external/selfmake/git/objects/66/cd2a04e433275d557318f52cfb9ca59806c9fb
+++ /dev/null
@@ -1,2 +0,0 @@
-x��A
-� D����k�F��.J����$��EL����B��c���U�A�j�Q�0���Z�ȍP�`bH#��0(�_G��1N���w�!2�"3O��u�E���į<���Q7�u٧����9o���Jie��@�涛5�= >ЫC��H
\ No newline at end of file
diff --git a/external/selfmake/git/objects/67/a6a94af0612a98694172103e4b098eba8c959b b/external/selfmake/git/objects/67/a6a94af0612a98694172103e4b098eba8c959b
deleted file mode 100644
index 9b0bf85..0000000
--- a/external/selfmake/git/objects/67/a6a94af0612a98694172103e4b098eba8c959b
+++ /dev/null
@@ -1 +0,0 @@
-x+)JMU026g040031Q��tv�v�+�(a��Q�=#R�H�_��on�f?̃*rut�u��Ma��k#��`KQuc}PM� PH*��IahZ�ɳ^���՚�߿������O�(I-�K�a���|A߱��ۧms��ؾ9���DIf^rNiJ*�-�y��*֍-�{U|�)�m��Q����GqQ2��������D=�a�>�[(�d+
\ No newline at end of file
diff --git a/external/selfmake/git/objects/68/4b1f6fa75f916cda3086f505a7ece77e8a8753 b/external/selfmake/git/objects/68/4b1f6fa75f916cda3086f505a7ece77e8a8753
deleted file mode 100644
index c2558ea..0000000
--- a/external/selfmake/git/objects/68/4b1f6fa75f916cda3086f505a7ece77e8a8753
+++ /dev/null
@@ -1,2 +0,0 @@
-x+)JMU01�`040031Qp+�K.���+�Kfx����)�Nn�Η�x�7��?�����C�U���{O�z���?Pe�EũE@�fDڟ�e�Y�t�f�'\�֤����`X�iՍ�\�L����_f��rF���&8��(9�9?�$���h}5��i�5�Z��u����*v�3�Evt��~m��k҃���콬(jA3�uq�bL��kkn�]x�"����'��jH\��ck�/�PC��/vA��g��eV�=��y/w�EZ�ڗL����ιZ��,������Ȑڅ���p�q���d�sPea�E��I9� �=2�_�`�`v��fW���
-��2���:}(<1��ٔv��u��%����
\ No newline at end of file
diff --git a/external/selfmake/git/objects/69/2d0ad3c9535b6cc2b70ae77cd1a33c753aa420 b/external/selfmake/git/objects/69/2d0ad3c9535b6cc2b70ae77cd1a33c753aa420
deleted file mode 100644
index bdb1b0f..0000000
Binary files a/external/selfmake/git/objects/69/2d0ad3c9535b6cc2b70ae77cd1a33c753aa420 and /dev/null differ
diff --git a/external/selfmake/git/objects/6b/2f509005731cf76158fd4fa1275e92c70ee7f2 b/external/selfmake/git/objects/6b/2f509005731cf76158fd4fa1275e92c70ee7f2
deleted file mode 100644
index 3000c87..0000000
Binary files a/external/selfmake/git/objects/6b/2f509005731cf76158fd4fa1275e92c70ee7f2 and /dev/null differ
diff --git a/external/selfmake/git/objects/6b/bad77639ded51a626b11ed7d904c4585aa4496 b/external/selfmake/git/objects/6b/bad77639ded51a626b11ed7d904c4585aa4496
deleted file mode 100644
index 66f122b..0000000
Binary files a/external/selfmake/git/objects/6b/bad77639ded51a626b11ed7d904c4585aa4496 and /dev/null differ
diff --git a/external/selfmake/git/objects/6b/bd75ce82c90d17b82d367c4b08b9b7d5ecdd86 b/external/selfmake/git/objects/6b/bd75ce82c90d17b82d367c4b08b9b7d5ecdd86
deleted file mode 100644
index 855f707..0000000
Binary files a/external/selfmake/git/objects/6b/bd75ce82c90d17b82d367c4b08b9b7d5ecdd86 and /dev/null differ
diff --git a/external/selfmake/git/objects/6c/59d0e764434f315141bb996e1f523bf3bc0e1c b/external/selfmake/git/objects/6c/59d0e764434f315141bb996e1f523bf3bc0e1c
deleted file mode 100644
index 8e0b532..0000000
Binary files a/external/selfmake/git/objects/6c/59d0e764434f315141bb996e1f523bf3bc0e1c and /dev/null differ
diff --git a/external/selfmake/git/objects/6c/6ad504bc5e9e30ced24324eb55ce68cc6ff359 b/external/selfmake/git/objects/6c/6ad504bc5e9e30ced24324eb55ce68cc6ff359
deleted file mode 100644
index 886320f..0000000
Binary files a/external/selfmake/git/objects/6c/6ad504bc5e9e30ced24324eb55ce68cc6ff359 and /dev/null differ
diff --git a/external/selfmake/git/objects/6d/b4e5b92b5396c0ec97f41b642d3551e28b4751 b/external/selfmake/git/objects/6d/b4e5b92b5396c0ec97f41b642d3551e28b4751
deleted file mode 100644
index 61a5b55..0000000
Binary files a/external/selfmake/git/objects/6d/b4e5b92b5396c0ec97f41b642d3551e28b4751 and /dev/null differ
diff --git a/external/selfmake/git/objects/6e/5053593856dd848cb08ea35af49b9827557377 b/external/selfmake/git/objects/6e/5053593856dd848cb08ea35af49b9827557377
deleted file mode 100644
index a1420a3..0000000
Binary files a/external/selfmake/git/objects/6e/5053593856dd848cb08ea35af49b9827557377 and /dev/null differ
diff --git a/external/selfmake/git/objects/6e/58c92ab56c47b93ac2a4716a67aef950a4d60f b/external/selfmake/git/objects/6e/58c92ab56c47b93ac2a4716a67aef950a4d60f
deleted file mode 100644
index ec7a084..0000000
Binary files a/external/selfmake/git/objects/6e/58c92ab56c47b93ac2a4716a67aef950a4d60f and /dev/null differ
diff --git a/external/selfmake/git/objects/6e/9f01ebcbb69f33f1034606f2c61bb1d541ac05 b/external/selfmake/git/objects/6e/9f01ebcbb69f33f1034606f2c61bb1d541ac05
deleted file mode 100644
index 98bc656..0000000
Binary files a/external/selfmake/git/objects/6e/9f01ebcbb69f33f1034606f2c61bb1d541ac05 and /dev/null differ
diff --git a/external/selfmake/git/objects/70/f18b896a1906e716099a0742c45ff047965f81 b/external/selfmake/git/objects/70/f18b896a1906e716099a0742c45ff047965f81
deleted file mode 100644
index bbdc888..0000000
Binary files a/external/selfmake/git/objects/70/f18b896a1906e716099a0742c45ff047965f81 and /dev/null differ
diff --git a/external/selfmake/git/objects/71/1b1515add52540ef292db6f2c69d5e59e93afe b/external/selfmake/git/objects/71/1b1515add52540ef292db6f2c69d5e59e93afe
deleted file mode 100644
index 403c2b3..0000000
Binary files a/external/selfmake/git/objects/71/1b1515add52540ef292db6f2c69d5e59e93afe and /dev/null differ
diff --git a/external/selfmake/git/objects/71/2c1c5796c429dcdec4e63294785ea204a50bba b/external/selfmake/git/objects/71/2c1c5796c429dcdec4e63294785ea204a50bba
deleted file mode 100644
index a27821f..0000000
Binary files a/external/selfmake/git/objects/71/2c1c5796c429dcdec4e63294785ea204a50bba and /dev/null differ
diff --git a/external/selfmake/git/objects/71/da6079600316ee9df529065b6ade3de37f7bbb b/external/selfmake/git/objects/71/da6079600316ee9df529065b6ade3de37f7bbb
deleted file mode 100644
index 2480ace..0000000
Binary files a/external/selfmake/git/objects/71/da6079600316ee9df529065b6ade3de37f7bbb and /dev/null differ
diff --git a/external/selfmake/git/objects/72/9087771510a0c3a5dce9cd0f95942ed067eaa4 b/external/selfmake/git/objects/72/9087771510a0c3a5dce9cd0f95942ed067eaa4
deleted file mode 100644
index b9917f5..0000000
--- a/external/selfmake/git/objects/72/9087771510a0c3a5dce9cd0f95942ed067eaa4
+++ /dev/null
@@ -1,2 +0,0 @@
-x�PKo�@�y�D/JZiM<�b�ZI}E0iO�6�.Yv����]XD��C粓�1���3���ht�e1�0oIg����G�[a��_�������m���|�[L���n�?w=Bl�"`A�Y���B�
-��':H�fQ%KR=�����)^M/Z�B��t��+S�@WA%,]��mRE�a�#��&�%�A��
\ No newline at end of file
diff --git a/external/selfmake/git/objects/73/5db1262d784eb3d675ebc49ea571dbca9668ee b/external/selfmake/git/objects/73/5db1262d784eb3d675ebc49ea571dbca9668ee
deleted file mode 100644
index 5a39ee8..0000000
Binary files a/external/selfmake/git/objects/73/5db1262d784eb3d675ebc49ea571dbca9668ee and /dev/null differ
diff --git a/external/selfmake/git/objects/73/a08e9c45b42d61f3244c467e81f397ae8e8242 b/external/selfmake/git/objects/73/a08e9c45b42d61f3244c467e81f397ae8e8242
deleted file mode 100644
index dc86f46..0000000
Binary files a/external/selfmake/git/objects/73/a08e9c45b42d61f3244c467e81f397ae8e8242 and /dev/null differ
diff --git a/external/selfmake/git/objects/74/05f4f9c6698a870d52a36f55f3a25c8f4fdd31 b/external/selfmake/git/objects/74/05f4f9c6698a870d52a36f55f3a25c8f4fdd31
deleted file mode 100644
index 1a3be73..0000000
Binary files a/external/selfmake/git/objects/74/05f4f9c6698a870d52a36f55f3a25c8f4fdd31 and /dev/null differ
diff --git a/external/selfmake/git/objects/74/3a1b74cbc4fa8eba1e5e9fb3dca540ae080cd3 b/external/selfmake/git/objects/74/3a1b74cbc4fa8eba1e5e9fb3dca540ae080cd3
deleted file mode 100644
index af41d9f..0000000
Binary files a/external/selfmake/git/objects/74/3a1b74cbc4fa8eba1e5e9fb3dca540ae080cd3 and /dev/null differ
diff --git a/external/selfmake/git/objects/74/471c97e4e7ce2f3abb016efc34e87e5a6b7fbd b/external/selfmake/git/objects/74/471c97e4e7ce2f3abb016efc34e87e5a6b7fbd
deleted file mode 100644
index 51a08be..0000000
Binary files a/external/selfmake/git/objects/74/471c97e4e7ce2f3abb016efc34e87e5a6b7fbd and /dev/null differ
diff --git a/external/selfmake/git/objects/74/522094f6bec407ec72dda90bd1c33ab26360f9 b/external/selfmake/git/objects/74/522094f6bec407ec72dda90bd1c33ab26360f9
deleted file mode 100644
index 946bd8c..0000000
Binary files a/external/selfmake/git/objects/74/522094f6bec407ec72dda90bd1c33ab26360f9 and /dev/null differ
diff --git a/external/selfmake/git/objects/75/e43602e1f5fe3061f807ab0787fbe0bc78cf13 b/external/selfmake/git/objects/75/e43602e1f5fe3061f807ab0787fbe0bc78cf13
deleted file mode 100644
index 83954e7..0000000
Binary files a/external/selfmake/git/objects/75/e43602e1f5fe3061f807ab0787fbe0bc78cf13 and /dev/null differ
diff --git a/external/selfmake/git/objects/76/c0c2f345a4c42f9addbc9213325f2ea3c29901 b/external/selfmake/git/objects/76/c0c2f345a4c42f9addbc9213325f2ea3c29901
deleted file mode 100644
index a0a5594..0000000
Binary files a/external/selfmake/git/objects/76/c0c2f345a4c42f9addbc9213325f2ea3c29901 and /dev/null differ
diff --git a/external/selfmake/git/objects/76/eeeff20601cc8e1618ed37f5e563dbf4bbdac1 b/external/selfmake/git/objects/76/eeeff20601cc8e1618ed37f5e563dbf4bbdac1
deleted file mode 100644
index c6de3b8..0000000
Binary files a/external/selfmake/git/objects/76/eeeff20601cc8e1618ed37f5e563dbf4bbdac1 and /dev/null differ
diff --git a/external/selfmake/git/objects/77/8249dd2de719f90a16aa0372165b7d55a7feb7 b/external/selfmake/git/objects/77/8249dd2de719f90a16aa0372165b7d55a7feb7
deleted file mode 100644
index ab46220..0000000
Binary files a/external/selfmake/git/objects/77/8249dd2de719f90a16aa0372165b7d55a7feb7 and /dev/null differ
diff --git a/external/selfmake/git/objects/78/2e6c968b7a33befc7df55d39532fa8942d57c7 b/external/selfmake/git/objects/78/2e6c968b7a33befc7df55d39532fa8942d57c7
deleted file mode 100644
index 9c0dd32..0000000
--- a/external/selfmake/git/objects/78/2e6c968b7a33befc7df55d39532fa8942d57c7
+++ /dev/null
@@ -1,5 +0,0 @@
-x�V�o�8�����K�����p'�TBH�J ��j�(q�� 0��N��o���\h{�$�|������$}���o��p�ؖ��_d�2�`1��q�hwjTæ����t��i�?X��,,4�ѴhP�dw�(|?�㌃�}i�����K�
-�>��9�v�^�C��*��8�-�H0��Ep��	Dq�8����1+@_Y���&��3Z\��1��rK�G�2�ׇ���e�x'��}���t��e�0AW}����sr�	�B���b\}��dC�/#1�1%+�=�$N`Ĭߚ;�+��eġ8^�x|De��_*�/�C�MV��a$c��jL�4�!��aRJ���B���&�k&_}83�m߄�����
-��b1¤��X��xk��C��6ؗ:�(������`:*	9�ZN͙�b����r������C��ezg�>�,g~�`�={L<�x0I�Y�ye��s �E�o�RQ�tgn�o�RQ���U[Z��?����N��VR��bɊX�r{k����+�^�ѱ�֎�}b��C�m�t���=����+Q7�j�sO��wm���Q��D'����r_R^�ӻߗ�G���vjO�Y�"�LM��Iv�� �X�l���H��54�[�8���<RƋ��,�c�u֣��ۍ]�E�E5�^��d���#j�%@q5#Uȡ���ꐯ�ۤ��o=�7\��I̞�iɳ��zA���!��1�i�?1?H.:��ְ)��A�����;;c��\Ie��'����sGcQ���=�Ps��{��JPДa#������Y�[S-�t�);�O\Fl�F"��XY��;:4���-�u��/K���
-vW��eؾ@�^A6�vhu�\v�K���6�������c;q;
-U���	�
\ No newline at end of file
diff --git a/external/selfmake/git/objects/78/2fba17bec4c58c5e7c230064578a1c71dcd924 b/external/selfmake/git/objects/78/2fba17bec4c58c5e7c230064578a1c71dcd924
deleted file mode 100644
index 6a0b6f0..0000000
Binary files a/external/selfmake/git/objects/78/2fba17bec4c58c5e7c230064578a1c71dcd924 and /dev/null differ
diff --git a/external/selfmake/git/objects/78/75d69528d365fe563157e536af4a210ee2323a b/external/selfmake/git/objects/78/75d69528d365fe563157e536af4a210ee2323a
deleted file mode 100644
index efa162e..0000000
Binary files a/external/selfmake/git/objects/78/75d69528d365fe563157e536af4a210ee2323a and /dev/null differ
diff --git a/external/selfmake/git/objects/79/82a1b8508aeebeae1c892b49445abb57af22ea b/external/selfmake/git/objects/79/82a1b8508aeebeae1c892b49445abb57af22ea
deleted file mode 100644
index 9cc6137..0000000
--- a/external/selfmake/git/objects/79/82a1b8508aeebeae1c892b49445abb57af22ea
+++ /dev/null
@@ -1 +0,0 @@
-x+)JMU023g040031Q��tv�v�+�(a��Q�=#R�H�_��on�f?̃*rut�u��Max�b�ƒC'�T�^:{A�R��P��($e�1|^U����R��Ӷ��hlߜ���*[��� ��\��x#ˎ%���;�v��9�Ԋ�Ԣ��<Fd�%甦�2l{��d�y�i�7-���l9�bHNf��E���}6?���\����R�Z��zt�
\ No newline at end of file
diff --git a/external/selfmake/git/objects/79/b391a43aedefc31ad21c4c434874fd9eb078da b/external/selfmake/git/objects/79/b391a43aedefc31ad21c4c434874fd9eb078da
deleted file mode 100644
index df9d6c1..0000000
Binary files a/external/selfmake/git/objects/79/b391a43aedefc31ad21c4c434874fd9eb078da and /dev/null differ
diff --git a/external/selfmake/git/objects/7a/14f82bc5acef358c7e2f196bc4d163c57dc84c b/external/selfmake/git/objects/7a/14f82bc5acef358c7e2f196bc4d163c57dc84c
deleted file mode 100644
index 284aa15..0000000
Binary files a/external/selfmake/git/objects/7a/14f82bc5acef358c7e2f196bc4d163c57dc84c and /dev/null differ
diff --git a/external/selfmake/git/objects/7a/fd8ac52eba8116f597fcc0c43c8ba587844a97 b/external/selfmake/git/objects/7a/fd8ac52eba8116f597fcc0c43c8ba587844a97
deleted file mode 100644
index 985156e..0000000
Binary files a/external/selfmake/git/objects/7a/fd8ac52eba8116f597fcc0c43c8ba587844a97 and /dev/null differ
diff --git a/external/selfmake/git/objects/7b/25535df540799720d09244614e9816abcebbb1 b/external/selfmake/git/objects/7b/25535df540799720d09244614e9816abcebbb1
deleted file mode 100644
index 29a2909..0000000
Binary files a/external/selfmake/git/objects/7b/25535df540799720d09244614e9816abcebbb1 and /dev/null differ
diff --git a/external/selfmake/git/objects/7b/67ed2494e7300c1c8d2471ec2e5c2ee3806f57 b/external/selfmake/git/objects/7b/67ed2494e7300c1c8d2471ec2e5c2ee3806f57
deleted file mode 100644
index 5f18de8..0000000
Binary files a/external/selfmake/git/objects/7b/67ed2494e7300c1c8d2471ec2e5c2ee3806f57 and /dev/null differ
diff --git a/external/selfmake/git/objects/7c/15262ed824400e5a7a72ad13ae6e7bffce7824 b/external/selfmake/git/objects/7c/15262ed824400e5a7a72ad13ae6e7bffce7824
deleted file mode 100644
index 9805201..0000000
Binary files a/external/selfmake/git/objects/7c/15262ed824400e5a7a72ad13ae6e7bffce7824 and /dev/null differ
diff --git a/external/selfmake/git/objects/7c/a3a339f4473482455d30cd04fc069c363cefa4 b/external/selfmake/git/objects/7c/a3a339f4473482455d30cd04fc069c363cefa4
deleted file mode 100644
index 15ce524..0000000
Binary files a/external/selfmake/git/objects/7c/a3a339f4473482455d30cd04fc069c363cefa4 and /dev/null differ
diff --git a/external/selfmake/git/objects/7e/75f9c03ec705fc4d58d38c2d802e3fdf65d643 b/external/selfmake/git/objects/7e/75f9c03ec705fc4d58d38c2d802e3fdf65d643
deleted file mode 100644
index 2869f67..0000000
Binary files a/external/selfmake/git/objects/7e/75f9c03ec705fc4d58d38c2d802e3fdf65d643 and /dev/null differ
diff --git a/external/selfmake/git/objects/7e/e165b036bb895fd606180dbdf78dd69faab319 b/external/selfmake/git/objects/7e/e165b036bb895fd606180dbdf78dd69faab319
deleted file mode 100644
index 4fef78d..0000000
Binary files a/external/selfmake/git/objects/7e/e165b036bb895fd606180dbdf78dd69faab319 and /dev/null differ
diff --git a/external/selfmake/git/objects/7e/f6e9cc1ca1fb10f2050d2bad64823f7f9baf9d b/external/selfmake/git/objects/7e/f6e9cc1ca1fb10f2050d2bad64823f7f9baf9d
deleted file mode 100644
index 45dd840..0000000
Binary files a/external/selfmake/git/objects/7e/f6e9cc1ca1fb10f2050d2bad64823f7f9baf9d and /dev/null differ
diff --git a/external/selfmake/git/objects/80/46f3af8271fdb0013e0042ec4c15f01df0896c b/external/selfmake/git/objects/80/46f3af8271fdb0013e0042ec4c15f01df0896c
deleted file mode 100644
index beec749..0000000
Binary files a/external/selfmake/git/objects/80/46f3af8271fdb0013e0042ec4c15f01df0896c and /dev/null differ
diff --git a/external/selfmake/git/objects/80/5db9af67aa2b3b2a2a42aba0e66b751b0f9aeb b/external/selfmake/git/objects/80/5db9af67aa2b3b2a2a42aba0e66b751b0f9aeb
deleted file mode 100644
index 2ade769..0000000
Binary files a/external/selfmake/git/objects/80/5db9af67aa2b3b2a2a42aba0e66b751b0f9aeb and /dev/null differ
diff --git a/external/selfmake/git/objects/80/76cdd76874ddf03af51e6d07e16547b816c5a5 b/external/selfmake/git/objects/80/76cdd76874ddf03af51e6d07e16547b816c5a5
deleted file mode 100644
index 0a12530..0000000
Binary files a/external/selfmake/git/objects/80/76cdd76874ddf03af51e6d07e16547b816c5a5 and /dev/null differ
diff --git a/external/selfmake/git/objects/80/8ed3f651f7a7cf604e7b621b3f401a589df0ca b/external/selfmake/git/objects/80/8ed3f651f7a7cf604e7b621b3f401a589df0ca
deleted file mode 100644
index 857cb19..0000000
Binary files a/external/selfmake/git/objects/80/8ed3f651f7a7cf604e7b621b3f401a589df0ca and /dev/null differ
diff --git a/external/selfmake/git/objects/82/a7f2497f1f8186eaac93f7f771d8545af56663 b/external/selfmake/git/objects/82/a7f2497f1f8186eaac93f7f771d8545af56663
deleted file mode 100644
index a87b66b..0000000
Binary files a/external/selfmake/git/objects/82/a7f2497f1f8186eaac93f7f771d8545af56663 and /dev/null differ
diff --git a/external/selfmake/git/objects/83/b9d73ef342df923e21e8c9438c5d2e51186d6a b/external/selfmake/git/objects/83/b9d73ef342df923e21e8c9438c5d2e51186d6a
deleted file mode 100644
index 9dd628a..0000000
Binary files a/external/selfmake/git/objects/83/b9d73ef342df923e21e8c9438c5d2e51186d6a and /dev/null differ
diff --git a/external/selfmake/git/objects/83/e97f7cec3d109f7ea9d9616ba80e48ca01565d b/external/selfmake/git/objects/83/e97f7cec3d109f7ea9d9616ba80e48ca01565d
deleted file mode 100644
index b23f119..0000000
Binary files a/external/selfmake/git/objects/83/e97f7cec3d109f7ea9d9616ba80e48ca01565d and /dev/null differ
diff --git a/external/selfmake/git/objects/84/1b98d34778e64d6c6d77c6ea9dd787d56c4075 b/external/selfmake/git/objects/84/1b98d34778e64d6c6d77c6ea9dd787d56c4075
deleted file mode 100644
index 44b2e47..0000000
Binary files a/external/selfmake/git/objects/84/1b98d34778e64d6c6d77c6ea9dd787d56c4075 and /dev/null differ
diff --git a/external/selfmake/git/objects/85/506a6cfb8ea12f0cd720feaf847ab11da1195b b/external/selfmake/git/objects/85/506a6cfb8ea12f0cd720feaf847ab11da1195b
deleted file mode 100644
index 72049af..0000000
Binary files a/external/selfmake/git/objects/85/506a6cfb8ea12f0cd720feaf847ab11da1195b and /dev/null differ
diff --git a/external/selfmake/git/objects/85/901b973b9306f12fefc368f2dd6337e68f7e6c b/external/selfmake/git/objects/85/901b973b9306f12fefc368f2dd6337e68f7e6c
deleted file mode 100644
index d3e8b70..0000000
--- a/external/selfmake/git/objects/85/901b973b9306f12fefc368f2dd6337e68f7e6c
+++ /dev/null
@@ -1,2 +0,0 @@
-x��MO�0���_1����ho\ZJ�V�5-'�M����m��R����i견��df���gfU�/�߿�ؚ縆䁼�����b��Y�s1��c8ڗ�>�z�1�I�����$��'���I
-���A��	�����4
\ No newline at end of file
diff --git a/external/selfmake/git/objects/86/225333c68ce2422857bd7cd5fcd944f33c5362 b/external/selfmake/git/objects/86/225333c68ce2422857bd7cd5fcd944f33c5362
deleted file mode 100644
index 722a1d7..0000000
Binary files a/external/selfmake/git/objects/86/225333c68ce2422857bd7cd5fcd944f33c5362 and /dev/null differ
diff --git a/external/selfmake/git/objects/86/b3bffdfbb647eba5c718b35ac048389dc170d1 b/external/selfmake/git/objects/86/b3bffdfbb647eba5c718b35ac048389dc170d1
deleted file mode 100644
index eb6612a..0000000
Binary files a/external/selfmake/git/objects/86/b3bffdfbb647eba5c718b35ac048389dc170d1 and /dev/null differ
diff --git a/external/selfmake/git/objects/87/cce51686e3e650a82ad0e48e93305ea8270f9f b/external/selfmake/git/objects/87/cce51686e3e650a82ad0e48e93305ea8270f9f
deleted file mode 100644
index d7d34bd..0000000
Binary files a/external/selfmake/git/objects/87/cce51686e3e650a82ad0e48e93305ea8270f9f and /dev/null differ
diff --git a/external/selfmake/git/objects/88/134255dffb4ac257c05d1ab6e20dc951fad3a8 b/external/selfmake/git/objects/88/134255dffb4ac257c05d1ab6e20dc951fad3a8
deleted file mode 100644
index d4ad93c..0000000
Binary files a/external/selfmake/git/objects/88/134255dffb4ac257c05d1ab6e20dc951fad3a8 and /dev/null differ
diff --git a/external/selfmake/git/objects/8a/3cff7f447ee8991031de9987ad50b5aa4a9ead b/external/selfmake/git/objects/8a/3cff7f447ee8991031de9987ad50b5aa4a9ead
deleted file mode 100644
index c3e7d61..0000000
Binary files a/external/selfmake/git/objects/8a/3cff7f447ee8991031de9987ad50b5aa4a9ead and /dev/null differ
diff --git a/external/selfmake/git/objects/8a/fd2e2fe2d2efd60566343c5ba6faa05aaac247 b/external/selfmake/git/objects/8a/fd2e2fe2d2efd60566343c5ba6faa05aaac247
deleted file mode 100644
index e9d1ba2..0000000
Binary files a/external/selfmake/git/objects/8a/fd2e2fe2d2efd60566343c5ba6faa05aaac247 and /dev/null differ
diff --git a/external/selfmake/git/objects/8c/3cfc7c37b2f13b711ebaacab3b1a861a3233c0 b/external/selfmake/git/objects/8c/3cfc7c37b2f13b711ebaacab3b1a861a3233c0
deleted file mode 100644
index 83f1759..0000000
Binary files a/external/selfmake/git/objects/8c/3cfc7c37b2f13b711ebaacab3b1a861a3233c0 and /dev/null differ
diff --git a/external/selfmake/git/objects/8d/49cfa9153118da44cd1f67c2f9837bb140420c b/external/selfmake/git/objects/8d/49cfa9153118da44cd1f67c2f9837bb140420c
deleted file mode 100644
index 05eac6d..0000000
Binary files a/external/selfmake/git/objects/8d/49cfa9153118da44cd1f67c2f9837bb140420c and /dev/null differ
diff --git a/external/selfmake/git/objects/8d/c85f9b7b54c04678ae9c6e5dde20d758df6ffc b/external/selfmake/git/objects/8d/c85f9b7b54c04678ae9c6e5dde20d758df6ffc
deleted file mode 100644
index 5ed17e4..0000000
Binary files a/external/selfmake/git/objects/8d/c85f9b7b54c04678ae9c6e5dde20d758df6ffc and /dev/null differ
diff --git a/external/selfmake/git/objects/8e/07e542ab85ae0cf07414ab591e2bf0051386ed b/external/selfmake/git/objects/8e/07e542ab85ae0cf07414ab591e2bf0051386ed
deleted file mode 100644
index f519a19..0000000
Binary files a/external/selfmake/git/objects/8e/07e542ab85ae0cf07414ab591e2bf0051386ed and /dev/null differ
diff --git a/external/selfmake/git/objects/8e/3f7a9f008e079704cb85a8dee23325e77563b4 b/external/selfmake/git/objects/8e/3f7a9f008e079704cb85a8dee23325e77563b4
deleted file mode 100644
index e28b1f8..0000000
Binary files a/external/selfmake/git/objects/8e/3f7a9f008e079704cb85a8dee23325e77563b4 and /dev/null differ
diff --git a/external/selfmake/git/objects/8e/47c4403673171232a73f5ee79057611a32569a b/external/selfmake/git/objects/8e/47c4403673171232a73f5ee79057611a32569a
deleted file mode 100644
index 4fa42be..0000000
Binary files a/external/selfmake/git/objects/8e/47c4403673171232a73f5ee79057611a32569a and /dev/null differ
diff --git a/external/selfmake/git/objects/8e/c1beba81b63d4831d8a0e4551656ef686aded7 b/external/selfmake/git/objects/8e/c1beba81b63d4831d8a0e4551656ef686aded7
deleted file mode 100644
index 1db4746..0000000
Binary files a/external/selfmake/git/objects/8e/c1beba81b63d4831d8a0e4551656ef686aded7 and /dev/null differ
diff --git a/external/selfmake/git/objects/8f/6817d542e2706a76933215a3ac1a5b063d5853 b/external/selfmake/git/objects/8f/6817d542e2706a76933215a3ac1a5b063d5853
deleted file mode 100644
index 66a5d29..0000000
Binary files a/external/selfmake/git/objects/8f/6817d542e2706a76933215a3ac1a5b063d5853 and /dev/null differ
diff --git a/external/selfmake/git/objects/8f/90db64478c2903cf0296d959e83be66e58c831 b/external/selfmake/git/objects/8f/90db64478c2903cf0296d959e83be66e58c831
deleted file mode 100644
index 414b4e2..0000000
Binary files a/external/selfmake/git/objects/8f/90db64478c2903cf0296d959e83be66e58c831 and /dev/null differ
diff --git a/external/selfmake/git/objects/8f/d588d029b5028056c68d019c4a2741481982bb b/external/selfmake/git/objects/8f/d588d029b5028056c68d019c4a2741481982bb
deleted file mode 100644
index 799a858..0000000
Binary files a/external/selfmake/git/objects/8f/d588d029b5028056c68d019c4a2741481982bb and /dev/null differ
diff --git a/external/selfmake/git/objects/91/4cb3d4eeb6b84256914cfc455c3870eb80e8f8 b/external/selfmake/git/objects/91/4cb3d4eeb6b84256914cfc455c3870eb80e8f8
deleted file mode 100644
index ee72edf..0000000
Binary files a/external/selfmake/git/objects/91/4cb3d4eeb6b84256914cfc455c3870eb80e8f8 and /dev/null differ
diff --git a/external/selfmake/git/objects/91/9ebad5e130e66d65a64dc63c9ea83788620711 b/external/selfmake/git/objects/91/9ebad5e130e66d65a64dc63c9ea83788620711
deleted file mode 100644
index dc94b26..0000000
Binary files a/external/selfmake/git/objects/91/9ebad5e130e66d65a64dc63c9ea83788620711 and /dev/null differ
diff --git a/external/selfmake/git/objects/92/0fd9e08411b13b4cc90afb6118ba6d46469118 b/external/selfmake/git/objects/92/0fd9e08411b13b4cc90afb6118ba6d46469118
deleted file mode 100644
index 73601d0..0000000
Binary files a/external/selfmake/git/objects/92/0fd9e08411b13b4cc90afb6118ba6d46469118 and /dev/null differ
diff --git a/external/selfmake/git/objects/92/20a61db50ecc0f6d01d5d877d2fac5bd3ea87f b/external/selfmake/git/objects/92/20a61db50ecc0f6d01d5d877d2fac5bd3ea87f
deleted file mode 100644
index 311cc7e..0000000
Binary files a/external/selfmake/git/objects/92/20a61db50ecc0f6d01d5d877d2fac5bd3ea87f and /dev/null differ
diff --git a/external/selfmake/git/objects/95/0a71bf54b9df8b460b3ee454594f8757ec881e b/external/selfmake/git/objects/95/0a71bf54b9df8b460b3ee454594f8757ec881e
deleted file mode 100644
index 806a6b4..0000000
Binary files a/external/selfmake/git/objects/95/0a71bf54b9df8b460b3ee454594f8757ec881e and /dev/null differ
diff --git a/external/selfmake/git/objects/95/12ece1e74713405af0126eeb58f40c948527e2 b/external/selfmake/git/objects/95/12ece1e74713405af0126eeb58f40c948527e2
deleted file mode 100644
index 7145a5e..0000000
Binary files a/external/selfmake/git/objects/95/12ece1e74713405af0126eeb58f40c948527e2 and /dev/null differ
diff --git a/external/selfmake/git/objects/95/40b5c7cf290569a106a57456f2c6401671f3fe b/external/selfmake/git/objects/95/40b5c7cf290569a106a57456f2c6401671f3fe
deleted file mode 100644
index a79b468..0000000
Binary files a/external/selfmake/git/objects/95/40b5c7cf290569a106a57456f2c6401671f3fe and /dev/null differ
diff --git a/external/selfmake/git/objects/96/0ee1952bdacdd9372c868bce313e7d96f7d246 b/external/selfmake/git/objects/96/0ee1952bdacdd9372c868bce313e7d96f7d246
deleted file mode 100644
index 441455f..0000000
Binary files a/external/selfmake/git/objects/96/0ee1952bdacdd9372c868bce313e7d96f7d246 and /dev/null differ
diff --git a/external/selfmake/git/objects/96/d8a1f9c1ef582f5efe5bbe000db1b8ca4656b9 b/external/selfmake/git/objects/96/d8a1f9c1ef582f5efe5bbe000db1b8ca4656b9
deleted file mode 100644
index 18ccd03..0000000
Binary files a/external/selfmake/git/objects/96/d8a1f9c1ef582f5efe5bbe000db1b8ca4656b9 and /dev/null differ
diff --git a/external/selfmake/git/objects/96/f3bbdcd820187a0ba547df6c99c803ae1d145c b/external/selfmake/git/objects/96/f3bbdcd820187a0ba547df6c99c803ae1d145c
deleted file mode 100644
index a3c1e60..0000000
Binary files a/external/selfmake/git/objects/96/f3bbdcd820187a0ba547df6c99c803ae1d145c and /dev/null differ
diff --git a/external/selfmake/git/objects/97/5c510542f071c893f8cd648712a77e0df08719 b/external/selfmake/git/objects/97/5c510542f071c893f8cd648712a77e0df08719
deleted file mode 100644
index 76a9e03..0000000
Binary files a/external/selfmake/git/objects/97/5c510542f071c893f8cd648712a77e0df08719 and /dev/null differ
diff --git a/external/selfmake/git/objects/97/bf1f413b7f2f6e22446c35d0ec0cf4b1c8be9c b/external/selfmake/git/objects/97/bf1f413b7f2f6e22446c35d0ec0cf4b1c8be9c
deleted file mode 100644
index f1cb0a1..0000000
Binary files a/external/selfmake/git/objects/97/bf1f413b7f2f6e22446c35d0ec0cf4b1c8be9c and /dev/null differ
diff --git a/external/selfmake/git/objects/98/222a9d533690d5889bad4b30773a512470d12d b/external/selfmake/git/objects/98/222a9d533690d5889bad4b30773a512470d12d
deleted file mode 100644
index e27da2e..0000000
--- a/external/selfmake/git/objects/98/222a9d533690d5889bad4b30773a512470d12d
+++ /dev/null
@@ -1,2 +0,0 @@
-x��K
-1D]��I��".�{�ә1FBF���R�G-^U����SoD�bp� e\ eH �F���*))�Nڳ�o��<G�����*�7�`�����NQf��[m����}�9
\ No newline at end of file
diff --git a/external/selfmake/git/objects/98/593fcaba325c4eb32335acb338e40a9aac6516 b/external/selfmake/git/objects/98/593fcaba325c4eb32335acb338e40a9aac6516
deleted file mode 100644
index ce9e61e..0000000
Binary files a/external/selfmake/git/objects/98/593fcaba325c4eb32335acb338e40a9aac6516 and /dev/null differ
diff --git a/external/selfmake/git/objects/98/88fba2af582824f9b79e6bb617964473eeeb45 b/external/selfmake/git/objects/98/88fba2af582824f9b79e6bb617964473eeeb45
deleted file mode 100644
index f61d517..0000000
--- a/external/selfmake/git/objects/98/88fba2af582824f9b79e6bb617964473eeeb45
+++ /dev/null
@@ -1,4 +0,0 @@
-x�V]o�J�3�bԼ$M�T�/�b�+�F�R]U�bۍY[��U��w��k]HR^`w�Μ9�3�6N�p����wў��ܥG6+���\G���F
-9�g*9�b
-���˥zbߘ�1f��0��1��	��v̍7qT�A'�c��U���N�i��JF�q�ZsSՕ�:�j�Y-P��a������[ժR�L���İ��ϔ�0mk��+�D�҃�֖��}b��C�rw�o�^;����"�7"�6نcOu�{M��D%�&#+e��ۭFC���v�FǬ�~%\΢�����V�-P8=0/���x4��E��ۃJk���y�{�����7!��lk���%�&e�3
-��
\ No newline at end of file
diff --git a/external/selfmake/git/objects/99/08b7a2e95ea5e6e24983e68437538a84e96afe b/external/selfmake/git/objects/99/08b7a2e95ea5e6e24983e68437538a84e96afe
deleted file mode 100644
index 06f0808..0000000
Binary files a/external/selfmake/git/objects/99/08b7a2e95ea5e6e24983e68437538a84e96afe and /dev/null differ
diff --git a/external/selfmake/git/objects/99/4714b88b9c8beb325de38a92e052dd3f078d05 b/external/selfmake/git/objects/99/4714b88b9c8beb325de38a92e052dd3f078d05
deleted file mode 100644
index 63aff87..0000000
--- a/external/selfmake/git/objects/99/4714b88b9c8beb325de38a92e052dd3f078d05
+++ /dev/null
@@ -1 +0,0 @@
-x�S]O�0�s~��@�ZO��v![�ZթOV�\'��cZ7���NB�"�X�܏�sn֥\�����c�D��-%��2�i4�K����Ip�.�m0�Jo����;J&��솒�M&S�0 �%��G��@6��f��m��G#Yo�'�)\�_|����hlM!����.�.0�H+��&.<�)m�p�H�F5(���a$�J�a��Q{����%j[��E�Y��Yfd����X}�bc�
\ No newline at end of file
diff --git a/external/selfmake/git/objects/99/56b2116cceb1af2cd065c78006e3c8fd61ca78 b/external/selfmake/git/objects/99/56b2116cceb1af2cd065c78006e3c8fd61ca78
deleted file mode 100644
index 0936c91..0000000
Binary files a/external/selfmake/git/objects/99/56b2116cceb1af2cd065c78006e3c8fd61ca78 and /dev/null differ
diff --git a/external/selfmake/git/objects/9a/c0987bc3bf903db9820c760f7c04afddeeccae b/external/selfmake/git/objects/9a/c0987bc3bf903db9820c760f7c04afddeeccae
deleted file mode 100644
index 1a8ec27..0000000
Binary files a/external/selfmake/git/objects/9a/c0987bc3bf903db9820c760f7c04afddeeccae and /dev/null differ
diff --git a/external/selfmake/git/objects/9a/f8734d389a63c16e3b1077cc3d55403fe08604 b/external/selfmake/git/objects/9a/f8734d389a63c16e3b1077cc3d55403fe08604
deleted file mode 100644
index 936e51d..0000000
Binary files a/external/selfmake/git/objects/9a/f8734d389a63c16e3b1077cc3d55403fe08604 and /dev/null differ
diff --git a/external/selfmake/git/objects/9b/ec614dd56e8dd4b2f31446ebf1236798edaf7c b/external/selfmake/git/objects/9b/ec614dd56e8dd4b2f31446ebf1236798edaf7c
deleted file mode 100644
index 0bb1b02..0000000
Binary files a/external/selfmake/git/objects/9b/ec614dd56e8dd4b2f31446ebf1236798edaf7c and /dev/null differ
diff --git a/external/selfmake/git/objects/9c/665a19fe201b3c2d67820125bc70d424564d37 b/external/selfmake/git/objects/9c/665a19fe201b3c2d67820125bc70d424564d37
deleted file mode 100644
index 0b36afe..0000000
--- a/external/selfmake/git/objects/9c/665a19fe201b3c2d67820125bc70d424564d37
+++ /dev/null
@@ -1 +0,0 @@
-x+)JMU04�d040031QJ-.�)��`8!81�_�g�3�_*
\ No newline at end of file
diff --git a/external/selfmake/git/objects/9d/13df949d23ab7a50f566403e39124240f98b1e b/external/selfmake/git/objects/9d/13df949d23ab7a50f566403e39124240f98b1e
deleted file mode 100644
index 125ae15..0000000
Binary files a/external/selfmake/git/objects/9d/13df949d23ab7a50f566403e39124240f98b1e and /dev/null differ
diff --git a/external/selfmake/git/objects/9d/a28d8a6a298f4e1eb73356861a6438443f203b b/external/selfmake/git/objects/9d/a28d8a6a298f4e1eb73356861a6438443f203b
deleted file mode 100644
index 8369b46..0000000
Binary files a/external/selfmake/git/objects/9d/a28d8a6a298f4e1eb73356861a6438443f203b and /dev/null differ
diff --git a/external/selfmake/git/objects/9e/6967f0ee5558710ee714d0805308e6a5526639 b/external/selfmake/git/objects/9e/6967f0ee5558710ee714d0805308e6a5526639
deleted file mode 100644
index d429155..0000000
Binary files a/external/selfmake/git/objects/9e/6967f0ee5558710ee714d0805308e6a5526639 and /dev/null differ
diff --git a/external/selfmake/git/objects/9f/6ed11986879d6e186ce3aa9626ee53b000b7ec b/external/selfmake/git/objects/9f/6ed11986879d6e186ce3aa9626ee53b000b7ec
deleted file mode 100644
index 9c9c13c..0000000
Binary files a/external/selfmake/git/objects/9f/6ed11986879d6e186ce3aa9626ee53b000b7ec and /dev/null differ
diff --git a/external/selfmake/git/objects/a0/218809753d7719cdff23775a578eae7f152117 b/external/selfmake/git/objects/a0/218809753d7719cdff23775a578eae7f152117
deleted file mode 100644
index 0b936e9..0000000
Binary files a/external/selfmake/git/objects/a0/218809753d7719cdff23775a578eae7f152117 and /dev/null differ
diff --git a/external/selfmake/git/objects/a0/28755d54a004ff9dc534a947a94b4a1eb78ba5 b/external/selfmake/git/objects/a0/28755d54a004ff9dc534a947a94b4a1eb78ba5
deleted file mode 100644
index eebf5dd..0000000
Binary files a/external/selfmake/git/objects/a0/28755d54a004ff9dc534a947a94b4a1eb78ba5 and /dev/null differ
diff --git a/external/selfmake/git/objects/a1/1509cd625ee798c51c01e764acce244ecda4e5 b/external/selfmake/git/objects/a1/1509cd625ee798c51c01e764acce244ecda4e5
deleted file mode 100644
index 49b55f1..0000000
Binary files a/external/selfmake/git/objects/a1/1509cd625ee798c51c01e764acce244ecda4e5 and /dev/null differ
diff --git a/external/selfmake/git/objects/a1/7b5cfb603743695ff69092b8ce179dea599f0a b/external/selfmake/git/objects/a1/7b5cfb603743695ff69092b8ce179dea599f0a
deleted file mode 100644
index 26e990a..0000000
Binary files a/external/selfmake/git/objects/a1/7b5cfb603743695ff69092b8ce179dea599f0a and /dev/null differ
diff --git a/external/selfmake/git/objects/a1/f975cb2efddfffb055a2f91920b3b13ef98305 b/external/selfmake/git/objects/a1/f975cb2efddfffb055a2f91920b3b13ef98305
deleted file mode 100644
index eded9f3..0000000
Binary files a/external/selfmake/git/objects/a1/f975cb2efddfffb055a2f91920b3b13ef98305 and /dev/null differ
diff --git a/external/selfmake/git/objects/a3/dbb1043fe6a150e22e8eafcc912ac554850753 b/external/selfmake/git/objects/a3/dbb1043fe6a150e22e8eafcc912ac554850753
deleted file mode 100644
index 1d3d6ef..0000000
Binary files a/external/selfmake/git/objects/a3/dbb1043fe6a150e22e8eafcc912ac554850753 and /dev/null differ
diff --git a/external/selfmake/git/objects/a4/1acf7216d8f964b5ebc429866ad7fbed8c0773 b/external/selfmake/git/objects/a4/1acf7216d8f964b5ebc429866ad7fbed8c0773
deleted file mode 100644
index adad230..0000000
Binary files a/external/selfmake/git/objects/a4/1acf7216d8f964b5ebc429866ad7fbed8c0773 and /dev/null differ
diff --git a/external/selfmake/git/objects/a6/19d7f3400613753844065d057b217ef4342558 b/external/selfmake/git/objects/a6/19d7f3400613753844065d057b217ef4342558
deleted file mode 100644
index 966198b..0000000
Binary files a/external/selfmake/git/objects/a6/19d7f3400613753844065d057b217ef4342558 and /dev/null differ
diff --git a/external/selfmake/git/objects/a6/24554e944224272045a87f6a8c37ffcfb8a5f2 b/external/selfmake/git/objects/a6/24554e944224272045a87f6a8c37ffcfb8a5f2
deleted file mode 100644
index e9b4f95..0000000
Binary files a/external/selfmake/git/objects/a6/24554e944224272045a87f6a8c37ffcfb8a5f2 and /dev/null differ
diff --git a/external/selfmake/git/objects/a6/369df245f30966c68d5c0c563765767c67bfe1 b/external/selfmake/git/objects/a6/369df245f30966c68d5c0c563765767c67bfe1
deleted file mode 100644
index 6d6694f..0000000
--- a/external/selfmake/git/objects/a6/369df245f30966c68d5c0c563765767c67bfe1
+++ /dev/null
@@ -1 +0,0 @@
-x+)JMU024a040031QpL�/-��`�w�l��`��w7�NVؽ�T�[i^rIf~^1P�TK���R�SL��#��=��h��(�&&�3������-�$���²	���O�5'(��4�D/�����#]{nnMy��+��H-���j2>L智t�=G�Ÿ�c��{@ՄT���bj��Ԓ�ry��������?S��W+
\ No newline at end of file
diff --git a/external/selfmake/git/objects/a6/64679803abe2a0f86c30a668012b9f3ba762b9 b/external/selfmake/git/objects/a6/64679803abe2a0f86c30a668012b9f3ba762b9
deleted file mode 100644
index 7c43ce5..0000000
Binary files a/external/selfmake/git/objects/a6/64679803abe2a0f86c30a668012b9f3ba762b9 and /dev/null differ
diff --git a/external/selfmake/git/objects/a6/b2aad8bd0afe344ac7371fd3009d44cc1c0f8a b/external/selfmake/git/objects/a6/b2aad8bd0afe344ac7371fd3009d44cc1c0f8a
deleted file mode 100644
index ee0e657..0000000
Binary files a/external/selfmake/git/objects/a6/b2aad8bd0afe344ac7371fd3009d44cc1c0f8a and /dev/null differ
diff --git a/external/selfmake/git/objects/a8/9026ec7a692cd3838c9fc4ef11e2c36f26a571 b/external/selfmake/git/objects/a8/9026ec7a692cd3838c9fc4ef11e2c36f26a571
deleted file mode 100644
index b6a17ac..0000000
Binary files a/external/selfmake/git/objects/a8/9026ec7a692cd3838c9fc4ef11e2c36f26a571 and /dev/null differ
diff --git a/external/selfmake/git/objects/a9/5b3d8a163a05e1ce8128efb3e42315350e3d81 b/external/selfmake/git/objects/a9/5b3d8a163a05e1ce8128efb3e42315350e3d81
deleted file mode 100644
index c2ef269..0000000
Binary files a/external/selfmake/git/objects/a9/5b3d8a163a05e1ce8128efb3e42315350e3d81 and /dev/null differ
diff --git a/external/selfmake/git/objects/a9/68e76003af1cbade77baee45424c6e605486bf b/external/selfmake/git/objects/a9/68e76003af1cbade77baee45424c6e605486bf
deleted file mode 100644
index 08a0612..0000000
Binary files a/external/selfmake/git/objects/a9/68e76003af1cbade77baee45424c6e605486bf and /dev/null differ
diff --git a/external/selfmake/git/objects/a9/a327600c7b708826a2810fdba748256060c193 b/external/selfmake/git/objects/a9/a327600c7b708826a2810fdba748256060c193
deleted file mode 100644
index a567107..0000000
Binary files a/external/selfmake/git/objects/a9/a327600c7b708826a2810fdba748256060c193 and /dev/null differ
diff --git a/external/selfmake/git/objects/a9/db128dfc0895989d6caca4c208b665c416ef1e b/external/selfmake/git/objects/a9/db128dfc0895989d6caca4c208b665c416ef1e
deleted file mode 100644
index a32fd31..0000000
Binary files a/external/selfmake/git/objects/a9/db128dfc0895989d6caca4c208b665c416ef1e and /dev/null differ
diff --git a/external/selfmake/git/objects/aa/31e34ef2378793d1189039525fe49da0d7a26c b/external/selfmake/git/objects/aa/31e34ef2378793d1189039525fe49da0d7a26c
deleted file mode 100644
index 272cdb2..0000000
Binary files a/external/selfmake/git/objects/aa/31e34ef2378793d1189039525fe49da0d7a26c and /dev/null differ
diff --git a/external/selfmake/git/objects/ad/a72e74ea1fb0da585ddbbcd356e8ba6182dc86 b/external/selfmake/git/objects/ad/a72e74ea1fb0da585ddbbcd356e8ba6182dc86
deleted file mode 100644
index ef416a1..0000000
Binary files a/external/selfmake/git/objects/ad/a72e74ea1fb0da585ddbbcd356e8ba6182dc86 and /dev/null differ
diff --git a/external/selfmake/git/objects/ae/281d1a28e4edb0206d4e9815ef7755ab0c8e4e b/external/selfmake/git/objects/ae/281d1a28e4edb0206d4e9815ef7755ab0c8e4e
deleted file mode 100644
index afd1b39..0000000
Binary files a/external/selfmake/git/objects/ae/281d1a28e4edb0206d4e9815ef7755ab0c8e4e and /dev/null differ
diff --git a/external/selfmake/git/objects/ae/52e12e7b52e52d30ab7a13e874863d0c9f73ca b/external/selfmake/git/objects/ae/52e12e7b52e52d30ab7a13e874863d0c9f73ca
deleted file mode 100644
index 710bee4..0000000
--- a/external/selfmake/git/objects/ae/52e12e7b52e52d30ab7a13e874863d0c9f73ca
+++ /dev/null
@@ -1,3 +0,0 @@
-x+)JMU01�`040031Qp+�K.���+�KfP���n��9&Z��3ҚU�1�e0D��7s����ZJZ�>��>w�5TY@bQqj�(�����t�VjXg��b�}Ό9
-�j2b�N]4sS׌/|-�X�i޻y���&8��(9�9?�$���?�
-��2���:}(<1��ٔv��u��%M���
\ No newline at end of file
diff --git a/external/selfmake/git/objects/ae/e6866b922554d9382eeb944224d20d5c2d3312 b/external/selfmake/git/objects/ae/e6866b922554d9382eeb944224d20d5c2d3312
deleted file mode 100644
index e188d3d..0000000
Binary files a/external/selfmake/git/objects/ae/e6866b922554d9382eeb944224d20d5c2d3312 and /dev/null differ
diff --git a/external/selfmake/git/objects/b0/22c94de5449cc67c9c5f0570700140de2e2c0b b/external/selfmake/git/objects/b0/22c94de5449cc67c9c5f0570700140de2e2c0b
deleted file mode 100644
index 26469d1..0000000
--- a/external/selfmake/git/objects/b0/22c94de5449cc67c9c5f0570700140de2e2c0b
+++ /dev/null
@@ -1,5 +0,0 @@
-x��K
-1D]����3�����t�GGBF����U��ʾmk�`ͩUfYJt�fF�9��<Rp)�����:�o��j��
-�)Y6�BA ��&�
-o�g/�h�^�
-�(~t�G�
\ No newline at end of file
diff --git a/external/selfmake/git/objects/b0/278ca114b01344c0ed4e6c41e34be1ac2b7559 b/external/selfmake/git/objects/b0/278ca114b01344c0ed4e6c41e34be1ac2b7559
deleted file mode 100644
index ea882ef..0000000
Binary files a/external/selfmake/git/objects/b0/278ca114b01344c0ed4e6c41e34be1ac2b7559 and /dev/null differ
diff --git a/external/selfmake/git/objects/b0/70ebf3ae4fe06bad75da05c445c0e2427ea04b b/external/selfmake/git/objects/b0/70ebf3ae4fe06bad75da05c445c0e2427ea04b
deleted file mode 100644
index e5f2598..0000000
Binary files a/external/selfmake/git/objects/b0/70ebf3ae4fe06bad75da05c445c0e2427ea04b and /dev/null differ
diff --git a/external/selfmake/git/objects/b1/16eb67223353f3ab355be0ec8439d2f4b4c1fc b/external/selfmake/git/objects/b1/16eb67223353f3ab355be0ec8439d2f4b4c1fc
deleted file mode 100644
index cbb5ab6..0000000
Binary files a/external/selfmake/git/objects/b1/16eb67223353f3ab355be0ec8439d2f4b4c1fc and /dev/null differ
diff --git a/external/selfmake/git/objects/b1/ad0c4919c3300563b5db75f5502f4846430c00 b/external/selfmake/git/objects/b1/ad0c4919c3300563b5db75f5502f4846430c00
deleted file mode 100644
index f4ec1a2..0000000
Binary files a/external/selfmake/git/objects/b1/ad0c4919c3300563b5db75f5502f4846430c00 and /dev/null differ
diff --git a/external/selfmake/git/objects/b1/b12cfac959199f1bd35c12d4f0fc6876b6cdf6 b/external/selfmake/git/objects/b1/b12cfac959199f1bd35c12d4f0fc6876b6cdf6
deleted file mode 100644
index 023db4b..0000000
Binary files a/external/selfmake/git/objects/b1/b12cfac959199f1bd35c12d4f0fc6876b6cdf6 and /dev/null differ
diff --git a/external/selfmake/git/objects/b2/50a1fc2d3c85cea074931b66c0afb0fdcadfa7 b/external/selfmake/git/objects/b2/50a1fc2d3c85cea074931b66c0afb0fdcadfa7
deleted file mode 100644
index e52e857..0000000
Binary files a/external/selfmake/git/objects/b2/50a1fc2d3c85cea074931b66c0afb0fdcadfa7 and /dev/null differ
diff --git a/external/selfmake/git/objects/b2/835491cf0ab550270b2516a21d19ab8365ae6f b/external/selfmake/git/objects/b2/835491cf0ab550270b2516a21d19ab8365ae6f
deleted file mode 100644
index 056701e..0000000
Binary files a/external/selfmake/git/objects/b2/835491cf0ab550270b2516a21d19ab8365ae6f and /dev/null differ
diff --git a/external/selfmake/git/objects/b3/7ca3f4f12966a8dceeac2690c1dc3371e39431 b/external/selfmake/git/objects/b3/7ca3f4f12966a8dceeac2690c1dc3371e39431
deleted file mode 100644
index 6256528..0000000
Binary files a/external/selfmake/git/objects/b3/7ca3f4f12966a8dceeac2690c1dc3371e39431 and /dev/null differ
diff --git a/external/selfmake/git/objects/b4/9675909b64b0bdee6a79216ff8db2d94fa6336 b/external/selfmake/git/objects/b4/9675909b64b0bdee6a79216ff8db2d94fa6336
deleted file mode 100644
index 7d48640..0000000
--- a/external/selfmake/git/objects/b4/9675909b64b0bdee6a79216ff8db2d94fa6336
+++ /dev/null
@@ -1,7 +0,0 @@
-x�WmO�H���w;	��~�(H\H{QC@8��t�"'�$+۲*��;�^��
-�;����S�K����B�ZQ�av8�q
-.�r�	��5�Π��<	�o�w/���&q��c��7�v,_6��zF8���j�z�Y��hK
��ҚGA�eX��H��x��U�0Q���S�bВ�P�E��|�����Ed	6�|�6�; �d4� ����PaheAv|���O�c��6Y����&Fgh);@m@�)0�7O5�Й���K��4"l݄k�5-u�*f"6�eQiF���)f
-�_֐��I��,�j�Ah�<�q#�6~[
-6���o�pp��v}܁�&�Nk�r����C��������'�>RKݓo҆B�I�*(X�@HAm�����V!��>����88��EJ��(��	@��������
-�f���{��K����
-A�!��h���0�kXI}�D��'sa({j�Ӥ�O*#V("����2'������t�ǖ+�2O�T��"�j��Wn'�O
\ No newline at end of file
diff --git a/external/selfmake/git/objects/b4/a841d95e38d72866ec698f306ce5a2810d0e73 b/external/selfmake/git/objects/b4/a841d95e38d72866ec698f306ce5a2810d0e73
deleted file mode 100644
index 18ff183..0000000
Binary files a/external/selfmake/git/objects/b4/a841d95e38d72866ec698f306ce5a2810d0e73 and /dev/null differ
diff --git a/external/selfmake/git/objects/b5/5939085b358d935ac7b7a57e29061b348fd94b b/external/selfmake/git/objects/b5/5939085b358d935ac7b7a57e29061b348fd94b
deleted file mode 100644
index 36b4ace..0000000
Binary files a/external/selfmake/git/objects/b5/5939085b358d935ac7b7a57e29061b348fd94b and /dev/null differ
diff --git a/external/selfmake/git/objects/b5/f04e0b0c6150b559e356c31a04ef29e9d80208 b/external/selfmake/git/objects/b5/f04e0b0c6150b559e356c31a04ef29e9d80208
deleted file mode 100644
index 66edf5b..0000000
Binary files a/external/selfmake/git/objects/b5/f04e0b0c6150b559e356c31a04ef29e9d80208 and /dev/null differ
diff --git a/external/selfmake/git/objects/b6/5feb8606a409e473c05478c4156901b9c5cd23 b/external/selfmake/git/objects/b6/5feb8606a409e473c05478c4156901b9c5cd23
deleted file mode 100644
index 4191581..0000000
Binary files a/external/selfmake/git/objects/b6/5feb8606a409e473c05478c4156901b9c5cd23 and /dev/null differ
diff --git a/external/selfmake/git/objects/b6/6b378ab10b6c07d67af925c02fbbca5e8815cd b/external/selfmake/git/objects/b6/6b378ab10b6c07d67af925c02fbbca5e8815cd
deleted file mode 100644
index fc07b36..0000000
Binary files a/external/selfmake/git/objects/b6/6b378ab10b6c07d67af925c02fbbca5e8815cd and /dev/null differ
diff --git a/external/selfmake/git/objects/b6/7a27a0643de2e057e8411165e9bceb6a85f92d b/external/selfmake/git/objects/b6/7a27a0643de2e057e8411165e9bceb6a85f92d
deleted file mode 100644
index 14cdcb7..0000000
Binary files a/external/selfmake/git/objects/b6/7a27a0643de2e057e8411165e9bceb6a85f92d and /dev/null differ
diff --git a/external/selfmake/git/objects/b8/5011cf4724c1ceee1f80d7e3b72381c1fb8a60 b/external/selfmake/git/objects/b8/5011cf4724c1ceee1f80d7e3b72381c1fb8a60
deleted file mode 100644
index ed73d34..0000000
--- a/external/selfmake/git/objects/b8/5011cf4724c1ceee1f80d7e3b72381c1fb8a60
+++ /dev/null
@@ -1,4 +0,0 @@
-x�Umo�0�g~ō��6ͥl���BSC�	�.Q^�Nm���F6��~���M�M��(!������.�2��W�ͻ�^�`�9[��-���d�kt�B�˙�Vh)*�#�ߟB�Q��P�I@��,���pGo��/�sM�"�����fqc�a�$�1�?	\�S���~{E+������X����<�⹍V��:�b�b���A�[�ǖ�a�������$�����p6��'������hɻ΂9� n�}�~p��3O<���Y�
-�:-��(�;�P�T�>��7�D�rzt���k6m�����b�R,زR6�_1�Z��6�{lGXi���|����j������WX1�p#�Y)�O�����f�����T�^�a!(ߧѠ#%
-�
-F]�OH�̂��;M'u�=��MP��΍^릷�t�4[�3ќ����*m޾��HR�T�����%���^��v�qm�m�&�����n����8��i�d��XjV�,�p�������k���gQ<��gZ��h�9�
\ No newline at end of file
diff --git a/external/selfmake/git/objects/b9/949eb9975c4dee675f029f0c5f554e9bb67b4c b/external/selfmake/git/objects/b9/949eb9975c4dee675f029f0c5f554e9bb67b4c
deleted file mode 100644
index 4280cf8..0000000
Binary files a/external/selfmake/git/objects/b9/949eb9975c4dee675f029f0c5f554e9bb67b4c and /dev/null differ
diff --git a/external/selfmake/git/objects/b9/e913be3560487ca8a8d608d358ca2e7ebf0f93 b/external/selfmake/git/objects/b9/e913be3560487ca8a8d608d358ca2e7ebf0f93
deleted file mode 100644
index 2f509b4..0000000
Binary files a/external/selfmake/git/objects/b9/e913be3560487ca8a8d608d358ca2e7ebf0f93 and /dev/null differ
diff --git a/external/selfmake/git/objects/bd/13df8fdebc9c51c8137f1e89af3d7f11dc7f56 b/external/selfmake/git/objects/bd/13df8fdebc9c51c8137f1e89af3d7f11dc7f56
deleted file mode 100644
index ada0c55..0000000
Binary files a/external/selfmake/git/objects/bd/13df8fdebc9c51c8137f1e89af3d7f11dc7f56 and /dev/null differ
diff --git a/external/selfmake/git/objects/bd/f2daec800f493e4c2b1e75dc502fed4c1babce b/external/selfmake/git/objects/bd/f2daec800f493e4c2b1e75dc502fed4c1babce
deleted file mode 100644
index e94ca2e..0000000
Binary files a/external/selfmake/git/objects/bd/f2daec800f493e4c2b1e75dc502fed4c1babce and /dev/null differ
diff --git a/external/selfmake/git/objects/be/00250b69954363e6b52333f0758c65c18cf0e0 b/external/selfmake/git/objects/be/00250b69954363e6b52333f0758c65c18cf0e0
deleted file mode 100644
index ed06957..0000000
Binary files a/external/selfmake/git/objects/be/00250b69954363e6b52333f0758c65c18cf0e0 and /dev/null differ
diff --git a/external/selfmake/git/objects/be/19a88772ced0188431f415ee87c79a4b979cd6 b/external/selfmake/git/objects/be/19a88772ced0188431f415ee87c79a4b979cd6
deleted file mode 100644
index c58775d..0000000
Binary files a/external/selfmake/git/objects/be/19a88772ced0188431f415ee87c79a4b979cd6 and /dev/null differ
diff --git a/external/selfmake/git/objects/be/e2611e2d6dfc7903b1271c4e5ab48ff0397841 b/external/selfmake/git/objects/be/e2611e2d6dfc7903b1271c4e5ab48ff0397841
deleted file mode 100644
index ee9b078..0000000
Binary files a/external/selfmake/git/objects/be/e2611e2d6dfc7903b1271c4e5ab48ff0397841 and /dev/null differ
diff --git a/external/selfmake/git/objects/be/e7d545b6393591b0c39547f227747193899a41 b/external/selfmake/git/objects/be/e7d545b6393591b0c39547f227747193899a41
deleted file mode 100644
index a970891..0000000
Binary files a/external/selfmake/git/objects/be/e7d545b6393591b0c39547f227747193899a41 and /dev/null differ
diff --git a/external/selfmake/git/objects/be/e873720891eb156b8144cd1e4029de51cd61ed b/external/selfmake/git/objects/be/e873720891eb156b8144cd1e4029de51cd61ed
deleted file mode 100644
index 52e9b17..0000000
Binary files a/external/selfmake/git/objects/be/e873720891eb156b8144cd1e4029de51cd61ed and /dev/null differ
diff --git a/external/selfmake/git/objects/bf/4e08813ea427ab5b6f1d93d4be7aea8ace7863 b/external/selfmake/git/objects/bf/4e08813ea427ab5b6f1d93d4be7aea8ace7863
deleted file mode 100644
index 3c5c8f3..0000000
--- a/external/selfmake/git/objects/bf/4e08813ea427ab5b6f1d93d4be7aea8ace7863
+++ /dev/null
@@ -1,4 +0,0 @@
-x�TMo�@�_1�/	J�:�z��.��Ub[K�	a`�E�Qũ�߻&6�������޼�e_�=L���|��&������qCg�
-܇��Hg��Ֆޭ����_�w�]��Xn�`��-kb�� �H��	�#�1'�/���24Y�UN�\¥s7�n��x*�+�3.�э�D䘀Ң9�/�XZ
-�� \l".�����x<qXY2:	
-�=U��[��M-҄�u0��D��3U���%W��E��W#����)�<�2���1:�J|�sΣ���E��i&��N���WQ�^/Շ��.ª�y&�=��Z{�/g��o�ƒ0�gs?I2�Dv��.�:��l���OX�Ǯ��A��\�+�r�J����ѯ��6�ބյ��&�Wi�܄�������0�B�l]��H��;��fl���uvW='#���V��9�T�m'�Qq>a�Sk%��iI����O������;�'�����Q�~X�i�
\ No newline at end of file
diff --git a/external/selfmake/git/objects/bf/99337cc0bd1b0703a019635067ff12837b4365 b/external/selfmake/git/objects/bf/99337cc0bd1b0703a019635067ff12837b4365
deleted file mode 100644
index d9881b2..0000000
Binary files a/external/selfmake/git/objects/bf/99337cc0bd1b0703a019635067ff12837b4365 and /dev/null differ
diff --git a/external/selfmake/git/objects/c1/d08b4ad2e175de277fe4982dae94f09766ff7c b/external/selfmake/git/objects/c1/d08b4ad2e175de277fe4982dae94f09766ff7c
deleted file mode 100644
index 6a04c6b..0000000
--- a/external/selfmake/git/objects/c1/d08b4ad2e175de277fe4982dae94f09766ff7c
+++ /dev/null
@@ -1,2 +0,0 @@
-x+)JMU051a040031Qp��K,�L-�Kfج���H��b�ݯN�Mg��3�c��*��I*�9M>����V]մ��)�Ž2�(�`8�󭿩� ��2�w�i��o2�A�8��e���M��ٓ�Xs�����W/w{�v~��
-�(JM�È�ͅ[���vN�{�Ɣ}�����7�{e~�*b}�� �-�f�0TMhIf�g��.J���͓�y�j�ڻ�
\ No newline at end of file
diff --git a/external/selfmake/git/objects/c2/749459bc502f6bf26463408f588aa771ef1aaa b/external/selfmake/git/objects/c2/749459bc502f6bf26463408f588aa771ef1aaa
deleted file mode 100644
index 3e8ffcd..0000000
Binary files a/external/selfmake/git/objects/c2/749459bc502f6bf26463408f588aa771ef1aaa and /dev/null differ
diff --git a/external/selfmake/git/objects/c2/8de298611ec6e2b910db61a5b02c24afb24c4e b/external/selfmake/git/objects/c2/8de298611ec6e2b910db61a5b02c24afb24c4e
deleted file mode 100644
index 3677615..0000000
Binary files a/external/selfmake/git/objects/c2/8de298611ec6e2b910db61a5b02c24afb24c4e and /dev/null differ
diff --git a/external/selfmake/git/objects/c2/9a8db0fc3b5c3f2bad62897d4cf050a74abbc6 b/external/selfmake/git/objects/c2/9a8db0fc3b5c3f2bad62897d4cf050a74abbc6
deleted file mode 100644
index 3e07c88..0000000
Binary files a/external/selfmake/git/objects/c2/9a8db0fc3b5c3f2bad62897d4cf050a74abbc6 and /dev/null differ
diff --git a/external/selfmake/git/objects/c2/d8b7809f0952aecf17daf93fc21b21e6f2018d b/external/selfmake/git/objects/c2/d8b7809f0952aecf17daf93fc21b21e6f2018d
deleted file mode 100644
index 3d60769..0000000
Binary files a/external/selfmake/git/objects/c2/d8b7809f0952aecf17daf93fc21b21e6f2018d and /dev/null differ
diff --git a/external/selfmake/git/objects/c2/ddfef6df912029442158ff507b0d6e998f6aff b/external/selfmake/git/objects/c2/ddfef6df912029442158ff507b0d6e998f6aff
deleted file mode 100644
index 1dfd865..0000000
Binary files a/external/selfmake/git/objects/c2/ddfef6df912029442158ff507b0d6e998f6aff and /dev/null differ
diff --git a/external/selfmake/git/objects/c3/412eb32c8868548fae870be7554e26fd7594a0 b/external/selfmake/git/objects/c3/412eb32c8868548fae870be7554e26fd7594a0
deleted file mode 100644
index 2010df2..0000000
Binary files a/external/selfmake/git/objects/c3/412eb32c8868548fae870be7554e26fd7594a0 and /dev/null differ
diff --git a/external/selfmake/git/objects/c3/fe7c43199010bc3d98630c75a9f4b606a417b1 b/external/selfmake/git/objects/c3/fe7c43199010bc3d98630c75a9f4b606a417b1
deleted file mode 100644
index 2509537..0000000
Binary files a/external/selfmake/git/objects/c3/fe7c43199010bc3d98630c75a9f4b606a417b1 and /dev/null differ
diff --git a/external/selfmake/git/objects/c4/25b40b2153f87dcf97178f777b7724f2a2df12 b/external/selfmake/git/objects/c4/25b40b2153f87dcf97178f777b7724f2a2df12
deleted file mode 100644
index 35bc7e5..0000000
Binary files a/external/selfmake/git/objects/c4/25b40b2153f87dcf97178f777b7724f2a2df12 and /dev/null differ
diff --git a/external/selfmake/git/objects/c4/3604dfb7284565dabd165c1b98828284437c3a b/external/selfmake/git/objects/c4/3604dfb7284565dabd165c1b98828284437c3a
deleted file mode 100644
index c661dd8..0000000
Binary files a/external/selfmake/git/objects/c4/3604dfb7284565dabd165c1b98828284437c3a and /dev/null differ
diff --git a/external/selfmake/git/objects/c5/4b5cf68f8280c107c7763bee5f666921ec699e b/external/selfmake/git/objects/c5/4b5cf68f8280c107c7763bee5f666921ec699e
deleted file mode 100644
index fab1375..0000000
Binary files a/external/selfmake/git/objects/c5/4b5cf68f8280c107c7763bee5f666921ec699e and /dev/null differ
diff --git a/external/selfmake/git/objects/c6/2119611d0341d9f0e6019ef112f672b157d4ab b/external/selfmake/git/objects/c6/2119611d0341d9f0e6019ef112f672b157d4ab
deleted file mode 100644
index de52fd2..0000000
Binary files a/external/selfmake/git/objects/c6/2119611d0341d9f0e6019ef112f672b157d4ab and /dev/null differ
diff --git a/external/selfmake/git/objects/c7/c382b6d9c8bf464e8d614762320583d2f1ba12 b/external/selfmake/git/objects/c7/c382b6d9c8bf464e8d614762320583d2f1ba12
deleted file mode 100644
index 1c504f4..0000000
Binary files a/external/selfmake/git/objects/c7/c382b6d9c8bf464e8d614762320583d2f1ba12 and /dev/null differ
diff --git a/external/selfmake/git/objects/c8/259c603987e473824b10847fbfe568aaa0c9f6 b/external/selfmake/git/objects/c8/259c603987e473824b10847fbfe568aaa0c9f6
deleted file mode 100644
index e8eb8d5..0000000
Binary files a/external/selfmake/git/objects/c8/259c603987e473824b10847fbfe568aaa0c9f6 and /dev/null differ
diff --git a/external/selfmake/git/objects/c8/c3b7278df109d4e070f3b347aeab7d60ebe999 b/external/selfmake/git/objects/c8/c3b7278df109d4e070f3b347aeab7d60ebe999
deleted file mode 100644
index 3d01991..0000000
Binary files a/external/selfmake/git/objects/c8/c3b7278df109d4e070f3b347aeab7d60ebe999 and /dev/null differ
diff --git a/external/selfmake/git/objects/c9/1e985774de8e6ad91667bc23236b7ef75ca5e0 b/external/selfmake/git/objects/c9/1e985774de8e6ad91667bc23236b7ef75ca5e0
deleted file mode 100644
index 09f6a19..0000000
Binary files a/external/selfmake/git/objects/c9/1e985774de8e6ad91667bc23236b7ef75ca5e0 and /dev/null differ
diff --git a/external/selfmake/git/objects/c9/4f05438addda512fb95fd62cdb4898d3eed0c0 b/external/selfmake/git/objects/c9/4f05438addda512fb95fd62cdb4898d3eed0c0
deleted file mode 100644
index 4c0158b..0000000
Binary files a/external/selfmake/git/objects/c9/4f05438addda512fb95fd62cdb4898d3eed0c0 and /dev/null differ
diff --git a/external/selfmake/git/objects/cb/292a65ba5c32f15e29ab85c8263a5dc51c64e7 b/external/selfmake/git/objects/cb/292a65ba5c32f15e29ab85c8263a5dc51c64e7
deleted file mode 100644
index 238ff17..0000000
Binary files a/external/selfmake/git/objects/cb/292a65ba5c32f15e29ab85c8263a5dc51c64e7 and /dev/null differ
diff --git a/external/selfmake/git/objects/cb/2e1c7259f3bbab16e5834494ce83a16550e9d5 b/external/selfmake/git/objects/cb/2e1c7259f3bbab16e5834494ce83a16550e9d5
deleted file mode 100644
index b7373e7..0000000
Binary files a/external/selfmake/git/objects/cb/2e1c7259f3bbab16e5834494ce83a16550e9d5 and /dev/null differ
diff --git a/external/selfmake/git/objects/cb/2f7e43a51ee8740aa01fe1d03d8c2e41b3d03a b/external/selfmake/git/objects/cb/2f7e43a51ee8740aa01fe1d03d8c2e41b3d03a
deleted file mode 100644
index 1e965c1..0000000
--- a/external/selfmake/git/objects/cb/2f7e43a51ee8740aa01fe1d03d8c2e41b3d03a
+++ /dev/null
@@ -1 +0,0 @@
-x�Tmo�0�g��[�P�Lؾ��N��n/�$ZM�s�Fv��M��s�T�Z�X?��\�.*�������ksI�Ȥ� K��`NF�������]73(VY�A��ɼJ��Q8�{���ke�`	��o�Ɵ�����ٗ�tx��<�����M���нj�l��g��G�B���F3*xL�*˔��_[4��¸d�H��Yը�x���Ӻ�]��B��+�_'ҶE\3�ɓ�Z���Hc���*)��h`l��6O5FVG$�߂�:��K��(m��&f�z�����_݅Cx /������鴐9ϰ�2�ȹ0l�O���p�*���B��A�Er��.�5��
\ No newline at end of file
diff --git a/external/selfmake/git/objects/cb/46b6467aa4684af66f530cd20f8c7c374de2e1 b/external/selfmake/git/objects/cb/46b6467aa4684af66f530cd20f8c7c374de2e1
deleted file mode 100644
index 758da13..0000000
Binary files a/external/selfmake/git/objects/cb/46b6467aa4684af66f530cd20f8c7c374de2e1 and /dev/null differ
diff --git a/external/selfmake/git/objects/cb/58245a1ee7eb1b19a486b47892975a93c03d1f b/external/selfmake/git/objects/cb/58245a1ee7eb1b19a486b47892975a93c03d1f
deleted file mode 100644
index ea8a4d6..0000000
Binary files a/external/selfmake/git/objects/cb/58245a1ee7eb1b19a486b47892975a93c03d1f and /dev/null differ
diff --git a/external/selfmake/git/objects/cc/5ef4d1e64418c2b6361bd7144215d79fc01272 b/external/selfmake/git/objects/cc/5ef4d1e64418c2b6361bd7144215d79fc01272
deleted file mode 100644
index adefe29..0000000
Binary files a/external/selfmake/git/objects/cc/5ef4d1e64418c2b6361bd7144215d79fc01272 and /dev/null differ
diff --git a/external/selfmake/git/objects/cc/8593bea00ebd02d2b4d75991796428233308a6 b/external/selfmake/git/objects/cc/8593bea00ebd02d2b4d75991796428233308a6
deleted file mode 100644
index 9827245..0000000
Binary files a/external/selfmake/git/objects/cc/8593bea00ebd02d2b4d75991796428233308a6 and /dev/null differ
diff --git a/external/selfmake/git/objects/cd/9ef35c196224e9f9d02c772ef24eebd990a27b b/external/selfmake/git/objects/cd/9ef35c196224e9f9d02c772ef24eebd990a27b
deleted file mode 100644
index 14c454a..0000000
Binary files a/external/selfmake/git/objects/cd/9ef35c196224e9f9d02c772ef24eebd990a27b and /dev/null differ
diff --git a/external/selfmake/git/objects/ce/a8643c16822a760507c808381680cd779fd97b b/external/selfmake/git/objects/ce/a8643c16822a760507c808381680cd779fd97b
deleted file mode 100644
index 2692a78..0000000
Binary files a/external/selfmake/git/objects/ce/a8643c16822a760507c808381680cd779fd97b and /dev/null differ
diff --git a/external/selfmake/git/objects/cf/75905f0e16a5ee0daa005b92bcdcb94508f359 b/external/selfmake/git/objects/cf/75905f0e16a5ee0daa005b92bcdcb94508f359
deleted file mode 100644
index 049cb9b..0000000
--- a/external/selfmake/git/objects/cf/75905f0e16a5ee0daa005b92bcdcb94508f359
+++ /dev/null
@@ -1 +0,0 @@
-x+)JMU06g040031Q(��M�N�+�e��V/�ݢ��*Ɗ��f+�D�tNhu
\ No newline at end of file
diff --git a/external/selfmake/git/objects/d0/4a260a4da847308e003705871df663d89347fb b/external/selfmake/git/objects/d0/4a260a4da847308e003705871df663d89347fb
deleted file mode 100644
index 23b0463..0000000
Binary files a/external/selfmake/git/objects/d0/4a260a4da847308e003705871df663d89347fb and /dev/null differ
diff --git a/external/selfmake/git/objects/d0/feea2fd1e5eac233a058907570e7cc498e9042 b/external/selfmake/git/objects/d0/feea2fd1e5eac233a058907570e7cc498e9042
deleted file mode 100644
index 5603df6..0000000
Binary files a/external/selfmake/git/objects/d0/feea2fd1e5eac233a058907570e7cc498e9042 and /dev/null differ
diff --git a/external/selfmake/git/objects/d1/3773e343dcd768a34f7bf25ddbf9f4554b0807 b/external/selfmake/git/objects/d1/3773e343dcd768a34f7bf25ddbf9f4554b0807
deleted file mode 100644
index 7f88c74..0000000
Binary files a/external/selfmake/git/objects/d1/3773e343dcd768a34f7bf25ddbf9f4554b0807 and /dev/null differ
diff --git a/external/selfmake/git/objects/d1/743bdd738e3824e44c5084a1085397bf1c8f9c b/external/selfmake/git/objects/d1/743bdd738e3824e44c5084a1085397bf1c8f9c
deleted file mode 100644
index e0da2c9..0000000
Binary files a/external/selfmake/git/objects/d1/743bdd738e3824e44c5084a1085397bf1c8f9c and /dev/null differ
diff --git a/external/selfmake/git/objects/d2/a6a211e2418da273efedbd15a4f23d6d4d3068 b/external/selfmake/git/objects/d2/a6a211e2418da273efedbd15a4f23d6d4d3068
deleted file mode 100644
index 541010f..0000000
Binary files a/external/selfmake/git/objects/d2/a6a211e2418da273efedbd15a4f23d6d4d3068 and /dev/null differ
diff --git a/external/selfmake/git/objects/d2/b1ee3745b757f0b9a5e8a46ece57ebcf02dc00 b/external/selfmake/git/objects/d2/b1ee3745b757f0b9a5e8a46ece57ebcf02dc00
deleted file mode 100644
index 60e7356..0000000
Binary files a/external/selfmake/git/objects/d2/b1ee3745b757f0b9a5e8a46ece57ebcf02dc00 and /dev/null differ
diff --git a/external/selfmake/git/objects/d3/5eaf409f6775b102cda343797644acf40cb713 b/external/selfmake/git/objects/d3/5eaf409f6775b102cda343797644acf40cb713
deleted file mode 100644
index c691da3..0000000
Binary files a/external/selfmake/git/objects/d3/5eaf409f6775b102cda343797644acf40cb713 and /dev/null differ
diff --git a/external/selfmake/git/objects/d3/735ed9c248cef8eb04e1a6d7a6b8e6e4fa44cc b/external/selfmake/git/objects/d3/735ed9c248cef8eb04e1a6d7a6b8e6e4fa44cc
deleted file mode 100644
index 1d6e109..0000000
Binary files a/external/selfmake/git/objects/d3/735ed9c248cef8eb04e1a6d7a6b8e6e4fa44cc and /dev/null differ
diff --git a/external/selfmake/git/objects/d3/8c29363877cda6e78904a3c23ff79f3580a5ea b/external/selfmake/git/objects/d3/8c29363877cda6e78904a3c23ff79f3580a5ea
deleted file mode 100644
index 873949b..0000000
Binary files a/external/selfmake/git/objects/d3/8c29363877cda6e78904a3c23ff79f3580a5ea and /dev/null differ
diff --git a/external/selfmake/git/objects/d4/1829defcbdcc337a3692fbe41944e8ea1cc8dd b/external/selfmake/git/objects/d4/1829defcbdcc337a3692fbe41944e8ea1cc8dd
deleted file mode 100644
index 765ccda..0000000
Binary files a/external/selfmake/git/objects/d4/1829defcbdcc337a3692fbe41944e8ea1cc8dd and /dev/null differ
diff --git a/external/selfmake/git/objects/d4/40c766ea7c22a2fb6d45ae3f18710506832712 b/external/selfmake/git/objects/d4/40c766ea7c22a2fb6d45ae3f18710506832712
deleted file mode 100644
index 90a3e6a..0000000
Binary files a/external/selfmake/git/objects/d4/40c766ea7c22a2fb6d45ae3f18710506832712 and /dev/null differ
diff --git a/external/selfmake/git/objects/d4/9125f34f35fbe085b47e7022124c418829fac8 b/external/selfmake/git/objects/d4/9125f34f35fbe085b47e7022124c418829fac8
deleted file mode 100644
index ed52868..0000000
Binary files a/external/selfmake/git/objects/d4/9125f34f35fbe085b47e7022124c418829fac8 and /dev/null differ
diff --git a/external/selfmake/git/objects/d5/d180e9225373553502272e9d615e06291e939c b/external/selfmake/git/objects/d5/d180e9225373553502272e9d615e06291e939c
deleted file mode 100644
index a71aee5..0000000
Binary files a/external/selfmake/git/objects/d5/d180e9225373553502272e9d615e06291e939c and /dev/null differ
diff --git a/external/selfmake/git/objects/d6/64ee53ca5d54def68029a2c1e5be3525a168a2 b/external/selfmake/git/objects/d6/64ee53ca5d54def68029a2c1e5be3525a168a2
deleted file mode 100644
index bbf1475..0000000
Binary files a/external/selfmake/git/objects/d6/64ee53ca5d54def68029a2c1e5be3525a168a2 and /dev/null differ
diff --git a/external/selfmake/git/objects/d6/78c0ac6f6e95ff2808474140e9ee1c5fcc42e8 b/external/selfmake/git/objects/d6/78c0ac6f6e95ff2808474140e9ee1c5fcc42e8
deleted file mode 100644
index caa0a89..0000000
Binary files a/external/selfmake/git/objects/d6/78c0ac6f6e95ff2808474140e9ee1c5fcc42e8 and /dev/null differ
diff --git a/external/selfmake/git/objects/d8/202bdbca3708f396948cc225f935de4ae3ae09 b/external/selfmake/git/objects/d8/202bdbca3708f396948cc225f935de4ae3ae09
deleted file mode 100644
index 48f1c9f..0000000
Binary files a/external/selfmake/git/objects/d8/202bdbca3708f396948cc225f935de4ae3ae09 and /dev/null differ
diff --git a/external/selfmake/git/objects/d8/52f4e30a3d41c5b62cf15091b4a233c62ab653 b/external/selfmake/git/objects/d8/52f4e30a3d41c5b62cf15091b4a233c62ab653
deleted file mode 100644
index 9ba266f..0000000
Binary files a/external/selfmake/git/objects/d8/52f4e30a3d41c5b62cf15091b4a233c62ab653 and /dev/null differ
diff --git a/external/selfmake/git/objects/d8/a03c0417623064b7baf2d3e4c3a40e669c99c5 b/external/selfmake/git/objects/d8/a03c0417623064b7baf2d3e4c3a40e669c99c5
deleted file mode 100644
index 474a816..0000000
Binary files a/external/selfmake/git/objects/d8/a03c0417623064b7baf2d3e4c3a40e669c99c5 and /dev/null differ
diff --git a/external/selfmake/git/objects/d8/dd890a5cd3928f3284b961f889e130d04d97aa b/external/selfmake/git/objects/d8/dd890a5cd3928f3284b961f889e130d04d97aa
deleted file mode 100644
index aa589b4..0000000
Binary files a/external/selfmake/git/objects/d8/dd890a5cd3928f3284b961f889e130d04d97aa and /dev/null differ
diff --git a/external/selfmake/git/objects/d9/966aa7d20a038f94d967da18b59c4c4afc36d0 b/external/selfmake/git/objects/d9/966aa7d20a038f94d967da18b59c4c4afc36d0
deleted file mode 100644
index 1292675..0000000
Binary files a/external/selfmake/git/objects/d9/966aa7d20a038f94d967da18b59c4c4afc36d0 and /dev/null differ
diff --git a/external/selfmake/git/objects/da/57e614ec0e8453b39b8d7cf5777f626eb97f0f b/external/selfmake/git/objects/da/57e614ec0e8453b39b8d7cf5777f626eb97f0f
deleted file mode 100644
index 9ea13c3..0000000
Binary files a/external/selfmake/git/objects/da/57e614ec0e8453b39b8d7cf5777f626eb97f0f and /dev/null differ
diff --git a/external/selfmake/git/objects/dc/54b34511dec84deba465849364a7203eba8cf6 b/external/selfmake/git/objects/dc/54b34511dec84deba465849364a7203eba8cf6
deleted file mode 100644
index e9d4c92..0000000
Binary files a/external/selfmake/git/objects/dc/54b34511dec84deba465849364a7203eba8cf6 and /dev/null differ
diff --git a/external/selfmake/git/objects/dc/bbb977427d14adef9c8b635b8fb68ba33d1b72 b/external/selfmake/git/objects/dc/bbb977427d14adef9c8b635b8fb68ba33d1b72
deleted file mode 100644
index c02ab9b..0000000
Binary files a/external/selfmake/git/objects/dc/bbb977427d14adef9c8b635b8fb68ba33d1b72 and /dev/null differ
diff --git a/external/selfmake/git/objects/dd/82d5bdc4c67fafa55850834a547dc231902e99 b/external/selfmake/git/objects/dd/82d5bdc4c67fafa55850834a547dc231902e99
deleted file mode 100644
index c2a01c9..0000000
Binary files a/external/selfmake/git/objects/dd/82d5bdc4c67fafa55850834a547dc231902e99 and /dev/null differ
diff --git a/external/selfmake/git/objects/de/4da603c952de5ff7cfc2b1556a1adede628269 b/external/selfmake/git/objects/de/4da603c952de5ff7cfc2b1556a1adede628269
deleted file mode 100644
index edc5ead..0000000
Binary files a/external/selfmake/git/objects/de/4da603c952de5ff7cfc2b1556a1adede628269 and /dev/null differ
diff --git a/external/selfmake/git/objects/df/68cf14be16763d4781e705680d8d2b241124a3 b/external/selfmake/git/objects/df/68cf14be16763d4781e705680d8d2b241124a3
deleted file mode 100644
index ccd6826..0000000
Binary files a/external/selfmake/git/objects/df/68cf14be16763d4781e705680d8d2b241124a3 and /dev/null differ
diff --git a/external/selfmake/git/objects/df/9b87c3a874a88db33ee0b1fd2cc51df4d10a51 b/external/selfmake/git/objects/df/9b87c3a874a88db33ee0b1fd2cc51df4d10a51
deleted file mode 100644
index e6b0e90..0000000
Binary files a/external/selfmake/git/objects/df/9b87c3a874a88db33ee0b1fd2cc51df4d10a51 and /dev/null differ
diff --git a/external/selfmake/git/objects/df/9e313d76c8e16cdfa201c90a7f0baa5a0b181a b/external/selfmake/git/objects/df/9e313d76c8e16cdfa201c90a7f0baa5a0b181a
deleted file mode 100644
index 4571e70..0000000
Binary files a/external/selfmake/git/objects/df/9e313d76c8e16cdfa201c90a7f0baa5a0b181a and /dev/null differ
diff --git a/external/selfmake/git/objects/e2/32160fa0603c540036c00dd98a539f93200843 b/external/selfmake/git/objects/e2/32160fa0603c540036c00dd98a539f93200843
deleted file mode 100644
index fd37db6..0000000
Binary files a/external/selfmake/git/objects/e2/32160fa0603c540036c00dd98a539f93200843 and /dev/null differ
diff --git a/external/selfmake/git/objects/e2/664bebd6c5ef26fd3e6e3a5a419a69491f70d9 b/external/selfmake/git/objects/e2/664bebd6c5ef26fd3e6e3a5a419a69491f70d9
deleted file mode 100644
index c848e19..0000000
Binary files a/external/selfmake/git/objects/e2/664bebd6c5ef26fd3e6e3a5a419a69491f70d9 and /dev/null differ
diff --git a/external/selfmake/git/objects/e2/d1162b98d196a8f48b23b5962596dd654b52cd b/external/selfmake/git/objects/e2/d1162b98d196a8f48b23b5962596dd654b52cd
deleted file mode 100644
index f78a321..0000000
--- a/external/selfmake/git/objects/e2/d1162b98d196a8f48b23b5962596dd654b52cd
+++ /dev/null
@@ -1,4 +0,0 @@
-x�Vmo�6���
-/����۽�H-З��T@�I�T9�!�0vd;����q ��^iں��y�s����8�Pi��c�JI�yr~z=����x�[�����������n��,�����no8Z���]��痻x�e�������^�O��T�<c*�G���7=�|�w��=��A��4�P�a�z�y7=Pe���j�x�&����q�;�X3{'��K�\N�|"����@$~k4��c�Q\h�4�'Q��S%���c���܊z�sf����s,?FS�b&�	.6at[��b���r
-�MSY|���
-[i�{F:��G�S�,���Y��B�0��
\ No newline at end of file
diff --git a/external/selfmake/git/objects/e3/84a6df6151534c41be672b1036b1c946e20093 b/external/selfmake/git/objects/e3/84a6df6151534c41be672b1036b1c946e20093
deleted file mode 100644
index 91f89fe..0000000
Binary files a/external/selfmake/git/objects/e3/84a6df6151534c41be672b1036b1c946e20093 and /dev/null differ
diff --git a/external/selfmake/git/objects/e4/bd21186c8ccc00f9b51507b53c360e03102790 b/external/selfmake/git/objects/e4/bd21186c8ccc00f9b51507b53c360e03102790
deleted file mode 100644
index 1d4531a..0000000
Binary files a/external/selfmake/git/objects/e4/bd21186c8ccc00f9b51507b53c360e03102790 and /dev/null differ
diff --git a/external/selfmake/git/objects/e5/44879217ea76c6e4969f4b29e734d6723a0cf8 b/external/selfmake/git/objects/e5/44879217ea76c6e4969f4b29e734d6723a0cf8
deleted file mode 100644
index 23bacd5..0000000
Binary files a/external/selfmake/git/objects/e5/44879217ea76c6e4969f4b29e734d6723a0cf8 and /dev/null differ
diff --git a/external/selfmake/git/objects/e5/7e21d9acf88855bc3dfd2b11444bb7cfa9aad0 b/external/selfmake/git/objects/e5/7e21d9acf88855bc3dfd2b11444bb7cfa9aad0
deleted file mode 100644
index 8ab6ff1..0000000
Binary files a/external/selfmake/git/objects/e5/7e21d9acf88855bc3dfd2b11444bb7cfa9aad0 and /dev/null differ
diff --git a/external/selfmake/git/objects/e5/a2d37fb78b91abf2ddb429273f4d6681801220 b/external/selfmake/git/objects/e5/a2d37fb78b91abf2ddb429273f4d6681801220
deleted file mode 100644
index bcb4844..0000000
Binary files a/external/selfmake/git/objects/e5/a2d37fb78b91abf2ddb429273f4d6681801220 and /dev/null differ
diff --git a/external/selfmake/git/objects/e5/a7d1f4a93ef13f14cb7cecee741801918a11cc b/external/selfmake/git/objects/e5/a7d1f4a93ef13f14cb7cecee741801918a11cc
deleted file mode 100644
index 7fa92be..0000000
Binary files a/external/selfmake/git/objects/e5/a7d1f4a93ef13f14cb7cecee741801918a11cc and /dev/null differ
diff --git a/external/selfmake/git/objects/e6/b7b1c5d5b3dc7a597ba93e27264f5ed42250a9 b/external/selfmake/git/objects/e6/b7b1c5d5b3dc7a597ba93e27264f5ed42250a9
deleted file mode 100644
index 5ca9f7f..0000000
Binary files a/external/selfmake/git/objects/e6/b7b1c5d5b3dc7a597ba93e27264f5ed42250a9 and /dev/null differ
diff --git a/external/selfmake/git/objects/e6/ff04ff82cdefa87a98f0487070d93a04e90c25 b/external/selfmake/git/objects/e6/ff04ff82cdefa87a98f0487070d93a04e90c25
deleted file mode 100644
index 98cfc56..0000000
Binary files a/external/selfmake/git/objects/e6/ff04ff82cdefa87a98f0487070d93a04e90c25 and /dev/null differ
diff --git a/external/selfmake/git/objects/e7/28d39d0719541e13b6cf524363abea11eefd3c b/external/selfmake/git/objects/e7/28d39d0719541e13b6cf524363abea11eefd3c
deleted file mode 100644
index 1eb6846..0000000
--- a/external/selfmake/git/objects/e7/28d39d0719541e13b6cf524363abea11eefd3c
+++ /dev/null
@@ -1,2 +0,0 @@
-x��Mj�0F��)f0�<IPJ���a$�Bl1!�������-��}�<��6(��Gb'$��c�e1���X�8���r�C����h"dkq��ThDN�2vO13~�Z��Q��	Sǹ�u�t}�e��9������["
-p��Z�ߞ��o����n�GUyצ�9�?��MP
\ No newline at end of file
diff --git a/external/selfmake/git/objects/e7/5e9faba292dd6293542b5335a5a23e0bd08eec b/external/selfmake/git/objects/e7/5e9faba292dd6293542b5335a5a23e0bd08eec
deleted file mode 100644
index 7b7dec5..0000000
Binary files a/external/selfmake/git/objects/e7/5e9faba292dd6293542b5335a5a23e0bd08eec and /dev/null differ
diff --git a/external/selfmake/git/objects/e7/e89c24e139761116d4aa95a9b0598ac14900b2 b/external/selfmake/git/objects/e7/e89c24e139761116d4aa95a9b0598ac14900b2
deleted file mode 100644
index 3f5b2c5..0000000
Binary files a/external/selfmake/git/objects/e7/e89c24e139761116d4aa95a9b0598ac14900b2 and /dev/null differ
diff --git a/external/selfmake/git/objects/e8/c5995dfc9c184820acf5e4b8da24eeeb748874 b/external/selfmake/git/objects/e8/c5995dfc9c184820acf5e4b8da24eeeb748874
deleted file mode 100644
index fc4086e..0000000
Binary files a/external/selfmake/git/objects/e8/c5995dfc9c184820acf5e4b8da24eeeb748874 and /dev/null differ
diff --git a/external/selfmake/git/objects/ea/5d74b4ab8535e162688d474c3ac629c23da123 b/external/selfmake/git/objects/ea/5d74b4ab8535e162688d474c3ac629c23da123
deleted file mode 100644
index 22f447a..0000000
Binary files a/external/selfmake/git/objects/ea/5d74b4ab8535e162688d474c3ac629c23da123 and /dev/null differ
diff --git a/external/selfmake/git/objects/eb/1c1bacf2a55d2a74a7908459b9bb9ac51c858d b/external/selfmake/git/objects/eb/1c1bacf2a55d2a74a7908459b9bb9ac51c858d
deleted file mode 100644
index 2c8ed38..0000000
Binary files a/external/selfmake/git/objects/eb/1c1bacf2a55d2a74a7908459b9bb9ac51c858d and /dev/null differ
diff --git a/external/selfmake/git/objects/eb/496bebc04c2d0e74c8c8a3a860c0ce208323cf b/external/selfmake/git/objects/eb/496bebc04c2d0e74c8c8a3a860c0ce208323cf
deleted file mode 100644
index e79cb73..0000000
Binary files a/external/selfmake/git/objects/eb/496bebc04c2d0e74c8c8a3a860c0ce208323cf and /dev/null differ
diff --git a/external/selfmake/git/objects/eb/96e8fd56811e82dc3a8022bfacf9644b72c352 b/external/selfmake/git/objects/eb/96e8fd56811e82dc3a8022bfacf9644b72c352
deleted file mode 100644
index 18bc526..0000000
Binary files a/external/selfmake/git/objects/eb/96e8fd56811e82dc3a8022bfacf9644b72c352 and /dev/null differ
diff --git a/external/selfmake/git/objects/ec/bf97ebfb6496c871b77b6f1cf1d9ca0b091f4f b/external/selfmake/git/objects/ec/bf97ebfb6496c871b77b6f1cf1d9ca0b091f4f
deleted file mode 100644
index 7da1157..0000000
Binary files a/external/selfmake/git/objects/ec/bf97ebfb6496c871b77b6f1cf1d9ca0b091f4f and /dev/null differ
diff --git a/external/selfmake/git/objects/ec/e1184458c230aec0cd3d9717dc06f249e61846 b/external/selfmake/git/objects/ec/e1184458c230aec0cd3d9717dc06f249e61846
deleted file mode 100644
index 2d343b3..0000000
--- a/external/selfmake/git/objects/ec/e1184458c230aec0cd3d9717dc06f249e61846
+++ /dev/null
@@ -1,7 +0,0 @@
-x�V�o�6���+�����Hզ��D�(Ж��T|y��N�����#�)Ъ��.�PB�i�H�sg�}���]�r����R�^�.��>9}��q���h��}o0���nG���g�c�������ɾ�
-Э�lp�ZpY���I�_w#0<�$M���|����[=7|�����ל4N�^�'��D������Q���@�ë��C%n��2v�f�Nȃ/49`��|ϖ'R�h`�D$��k��yz�0�Ga���8Z̓P-JU3�acu�ݻuO��&�/�����M�
-�ȿ�wUU��2�(�J��2&���4���Ϩ��v�TԎQ����J�Ň�-"�#0��~�R
-%�D*4��E�)��Q�D\�\
-��m�8��
-=ս5��ޚ��-�"��T�&�(�PoA���
-ҳ���jۜ���#���e�`����/���Y���$�
\ No newline at end of file
diff --git a/external/selfmake/git/objects/ed/071de2e5b9ca579f24223b1110b6c158de0a5d b/external/selfmake/git/objects/ed/071de2e5b9ca579f24223b1110b6c158de0a5d
deleted file mode 100644
index 12fe266..0000000
Binary files a/external/selfmake/git/objects/ed/071de2e5b9ca579f24223b1110b6c158de0a5d and /dev/null differ
diff --git a/external/selfmake/git/objects/ed/bfb8953f0aff5ad972703ad7b272ce058c282c b/external/selfmake/git/objects/ed/bfb8953f0aff5ad972703ad7b272ce058c282c
deleted file mode 100644
index 095105e..0000000
Binary files a/external/selfmake/git/objects/ed/bfb8953f0aff5ad972703ad7b272ce058c282c and /dev/null differ
diff --git a/external/selfmake/git/objects/ef/1899f3f43a466f0632c918bcba1a9615b5cde5 b/external/selfmake/git/objects/ef/1899f3f43a466f0632c918bcba1a9615b5cde5
deleted file mode 100644
index 31d7e3b..0000000
Binary files a/external/selfmake/git/objects/ef/1899f3f43a466f0632c918bcba1a9615b5cde5 and /dev/null differ
diff --git a/external/selfmake/git/objects/ef/92f53cfa75d3e0ecebc55f6910455fe2b41616 b/external/selfmake/git/objects/ef/92f53cfa75d3e0ecebc55f6910455fe2b41616
deleted file mode 100644
index 2d1b268..0000000
--- a/external/selfmake/git/objects/ef/92f53cfa75d3e0ecebc55f6910455fe2b41616
+++ /dev/null
@@ -1,4 +0,0 @@
-x�Vmo�F�g��=�8	{C�^t'�D�$�w!��R�����-ˮ���S�{�LH���	��Y�<����r����JIgpsٿ�{��m.�1`k�����nXw�v7�->���s�b����<�[����,���hܾ����%If�t߾��~�a���n{��6��_��bJ2L��7�UvL�f@�l�����1Ś9:!O�@r���/O�6��"�H������[�A>
-3m���j�j�Pr�����ޝ�{:e69^����h*T�D�D��Uݖ9�D1V��9y�F��>~Dp��4���Q����J�Ń�)2�C0��~�V
-��x>J�[�(L"�k.�Z2�%S���XX�ܘ�������D)Z�,𱮨��=�e��;��t��ܭ�M���ӎP�	��'�8�W\�Y8T��\��^��j�$hf��@�6z�]*�z�6bH�
-%��K�"=�0R�5�%]�ϰ�Kb*]�\ߧ[�#��N��.������sL��/Jq��R,�<յ5��ښ修-�"��T�&�(�PoA���+�+<����#s�I�c}�	u;]�
\ No newline at end of file
diff --git a/external/selfmake/git/objects/ef/aa9fd5b0f84bf8310e9654abdf6e6b40aa5fb8 b/external/selfmake/git/objects/ef/aa9fd5b0f84bf8310e9654abdf6e6b40aa5fb8
deleted file mode 100644
index 4310f98..0000000
Binary files a/external/selfmake/git/objects/ef/aa9fd5b0f84bf8310e9654abdf6e6b40aa5fb8 and /dev/null differ
diff --git a/external/selfmake/git/objects/ef/c378bf28a4c2c81625bdd2cdd024d2593f1288 b/external/selfmake/git/objects/ef/c378bf28a4c2c81625bdd2cdd024d2593f1288
deleted file mode 100644
index e6d12c6..0000000
--- a/external/selfmake/git/objects/ef/c378bf28a4c2c81625bdd2cdd024d2593f1288
+++ /dev/null
@@ -1,3 +0,0 @@
-xm�;n�0DS���
-He���)HkE-��K��CɈӤ`f���ޏǗW�9�ax&X\���%�\�(�M�YO�H�'�0�
-�8L�Ms��9��Z��`�Tt�.g���G�Od��&�V��}��E���8z֥9s�q����}O���@��ӯ�y�M����=�V�����C�?��ke
\ No newline at end of file
diff --git a/external/selfmake/git/objects/f0/8dc9c890ce6ed7cbb3742e4bfe15d248401c5f b/external/selfmake/git/objects/f0/8dc9c890ce6ed7cbb3742e4bfe15d248401c5f
deleted file mode 100644
index 607cdab..0000000
Binary files a/external/selfmake/git/objects/f0/8dc9c890ce6ed7cbb3742e4bfe15d248401c5f and /dev/null differ
diff --git a/external/selfmake/git/objects/f0/930c95a5973f085cd15e5410743322e8afe348 b/external/selfmake/git/objects/f0/930c95a5973f085cd15e5410743322e8afe348
deleted file mode 100644
index 07de4c8..0000000
Binary files a/external/selfmake/git/objects/f0/930c95a5973f085cd15e5410743322e8afe348 and /dev/null differ
diff --git a/external/selfmake/git/objects/f3/df1874d0e4f80921cb04adda650f7e20286b1f b/external/selfmake/git/objects/f3/df1874d0e4f80921cb04adda650f7e20286b1f
deleted file mode 100644
index 75e194e..0000000
Binary files a/external/selfmake/git/objects/f3/df1874d0e4f80921cb04adda650f7e20286b1f and /dev/null differ
diff --git a/external/selfmake/git/objects/f4/3c8e2298c1d4a1c796a49279527e4ff505283c b/external/selfmake/git/objects/f4/3c8e2298c1d4a1c796a49279527e4ff505283c
deleted file mode 100644
index 4a150bc..0000000
Binary files a/external/selfmake/git/objects/f4/3c8e2298c1d4a1c796a49279527e4ff505283c and /dev/null differ
diff --git a/external/selfmake/git/objects/f4/c506cf144ceebb6ae9f96ff89c09286ec32124 b/external/selfmake/git/objects/f4/c506cf144ceebb6ae9f96ff89c09286ec32124
deleted file mode 100644
index 4f85913..0000000
Binary files a/external/selfmake/git/objects/f4/c506cf144ceebb6ae9f96ff89c09286ec32124 and /dev/null differ
diff --git a/external/selfmake/git/objects/f4/e817a56fb388b2bd57d7200e56956ef037a93c b/external/selfmake/git/objects/f4/e817a56fb388b2bd57d7200e56956ef037a93c
deleted file mode 100644
index 62bf308..0000000
Binary files a/external/selfmake/git/objects/f4/e817a56fb388b2bd57d7200e56956ef037a93c and /dev/null differ
diff --git a/external/selfmake/git/objects/f5/e233ec8356a2e82337277d6369304187b4eada b/external/selfmake/git/objects/f5/e233ec8356a2e82337277d6369304187b4eada
deleted file mode 100644
index a72c543..0000000
Binary files a/external/selfmake/git/objects/f5/e233ec8356a2e82337277d6369304187b4eada and /dev/null differ
diff --git a/external/selfmake/git/objects/f6/86cc9e2f490fc0e1e263d02226c4318e7373a0 b/external/selfmake/git/objects/f6/86cc9e2f490fc0e1e263d02226c4318e7373a0
deleted file mode 100644
index 477309c..0000000
Binary files a/external/selfmake/git/objects/f6/86cc9e2f490fc0e1e263d02226c4318e7373a0 and /dev/null differ
diff --git a/external/selfmake/git/objects/f7/746f5f93f8c6e025e4ea3b16957cf7882a5dfa b/external/selfmake/git/objects/f7/746f5f93f8c6e025e4ea3b16957cf7882a5dfa
deleted file mode 100644
index 20395cc..0000000
Binary files a/external/selfmake/git/objects/f7/746f5f93f8c6e025e4ea3b16957cf7882a5dfa and /dev/null differ
diff --git a/external/selfmake/git/objects/f7/b3a2d575b217e1a31109478712c86296cc85d4 b/external/selfmake/git/objects/f7/b3a2d575b217e1a31109478712c86296cc85d4
deleted file mode 100644
index 7e86c1f..0000000
Binary files a/external/selfmake/git/objects/f7/b3a2d575b217e1a31109478712c86296cc85d4 and /dev/null differ
diff --git a/external/selfmake/git/objects/f8/43c18159bdaff7a37784dba5c43ec0eeb1305a b/external/selfmake/git/objects/f8/43c18159bdaff7a37784dba5c43ec0eeb1305a
deleted file mode 100644
index d04e7a6..0000000
Binary files a/external/selfmake/git/objects/f8/43c18159bdaff7a37784dba5c43ec0eeb1305a and /dev/null differ
diff --git a/external/selfmake/git/objects/f9/961f63003f747d2725357bd33501d1bda069c1 b/external/selfmake/git/objects/f9/961f63003f747d2725357bd33501d1bda069c1
deleted file mode 100644
index 316c3a2..0000000
Binary files a/external/selfmake/git/objects/f9/961f63003f747d2725357bd33501d1bda069c1 and /dev/null differ
diff --git a/external/selfmake/git/objects/f9/e867d8314f08e7d709e73b4c37bb63f92566bb b/external/selfmake/git/objects/f9/e867d8314f08e7d709e73b4c37bb63f92566bb
deleted file mode 100644
index 984f63b..0000000
Binary files a/external/selfmake/git/objects/f9/e867d8314f08e7d709e73b4c37bb63f92566bb and /dev/null differ
diff --git a/external/selfmake/git/objects/fa/a43f6e6bce910527ef94389df9f2e6093156c1 b/external/selfmake/git/objects/fa/a43f6e6bce910527ef94389df9f2e6093156c1
deleted file mode 100644
index 7fe5761..0000000
Binary files a/external/selfmake/git/objects/fa/a43f6e6bce910527ef94389df9f2e6093156c1 and /dev/null differ
diff --git a/external/selfmake/git/objects/fb/6a2f8a6e3e86847b5684c2aefd92b5c235ae66 b/external/selfmake/git/objects/fb/6a2f8a6e3e86847b5684c2aefd92b5c235ae66
deleted file mode 100644
index 67af420..0000000
Binary files a/external/selfmake/git/objects/fb/6a2f8a6e3e86847b5684c2aefd92b5c235ae66 and /dev/null differ
diff --git a/external/selfmake/git/objects/fb/8f176f51d750d96258ea70c564b339e4e30867 b/external/selfmake/git/objects/fb/8f176f51d750d96258ea70c564b339e4e30867
deleted file mode 100644
index f3e0987..0000000
Binary files a/external/selfmake/git/objects/fb/8f176f51d750d96258ea70c564b339e4e30867 and /dev/null differ
diff --git a/external/selfmake/git/objects/fb/c5d028e281a23de1ecd07356dd8af0a985d075 b/external/selfmake/git/objects/fb/c5d028e281a23de1ecd07356dd8af0a985d075
deleted file mode 100644
index 1a86e3e..0000000
Binary files a/external/selfmake/git/objects/fb/c5d028e281a23de1ecd07356dd8af0a985d075 and /dev/null differ
diff --git a/external/selfmake/git/objects/fc/4440756806804d24694d85b928bd4de97b94f1 b/external/selfmake/git/objects/fc/4440756806804d24694d85b928bd4de97b94f1
deleted file mode 100644
index e3ce5bf..0000000
Binary files a/external/selfmake/git/objects/fc/4440756806804d24694d85b928bd4de97b94f1 and /dev/null differ
diff --git a/external/selfmake/git/objects/fc/667f19b73875f5aa017852e736a8310a14562d b/external/selfmake/git/objects/fc/667f19b73875f5aa017852e736a8310a14562d
deleted file mode 100644
index 5b3fcb4..0000000
Binary files a/external/selfmake/git/objects/fc/667f19b73875f5aa017852e736a8310a14562d and /dev/null differ
diff --git a/external/selfmake/git/objects/fc/6860dcaaf3cf366c72b72a4db6fc73a202c444 b/external/selfmake/git/objects/fc/6860dcaaf3cf366c72b72a4db6fc73a202c444
deleted file mode 100644
index 810ae6c..0000000
Binary files a/external/selfmake/git/objects/fc/6860dcaaf3cf366c72b72a4db6fc73a202c444 and /dev/null differ
diff --git a/external/selfmake/git/objects/fc/7f809d48d29146de34126b7ec6c43b8d2e0b2a b/external/selfmake/git/objects/fc/7f809d48d29146de34126b7ec6c43b8d2e0b2a
deleted file mode 100644
index 813fac2..0000000
Binary files a/external/selfmake/git/objects/fc/7f809d48d29146de34126b7ec6c43b8d2e0b2a and /dev/null differ
diff --git a/external/selfmake/git/objects/fd/cf09fd25580e28a7362eb4da642e092c58b129 b/external/selfmake/git/objects/fd/cf09fd25580e28a7362eb4da642e092c58b129
deleted file mode 100644
index 368719b..0000000
--- a/external/selfmake/git/objects/fd/cf09fd25580e28a7362eb4da642e092c58b129
+++ /dev/null
@@ -1,2 +0,0 @@
-x+)JMU023g040031Q��tv�v�+�(a��Q�=#R�H�_��on�f?̃*rut�u��Max�b�ƒC'�T�^:{A�R��P��($e�1|^U����R��Ӷ��hlߜ���*[����p����#���/�h�
-�=d8Ao&D>��$�(/1��y�9�)�����k	�<���ky}R��z~�!9�Ix�%3�L�jY���Z���C�2g���s?
\ No newline at end of file
diff --git a/external/selfmake/git/objects/fe/a2d0205817ee3f3cdd46e03c4a3af24fde9c35 b/external/selfmake/git/objects/fe/a2d0205817ee3f3cdd46e03c4a3af24fde9c35
deleted file mode 100644
index 4a305be..0000000
Binary files a/external/selfmake/git/objects/fe/a2d0205817ee3f3cdd46e03c4a3af24fde9c35 and /dev/null differ
diff --git a/external/selfmake/git/objects/fe/c3cd7ad1532089eed8a07365719320bbb8fd3a b/external/selfmake/git/objects/fe/c3cd7ad1532089eed8a07365719320bbb8fd3a
deleted file mode 100644
index 38aaaa6..0000000
Binary files a/external/selfmake/git/objects/fe/c3cd7ad1532089eed8a07365719320bbb8fd3a and /dev/null differ
diff --git a/external/selfmake/git/objects/ff/898c6ca329b71dd7dfc7aba746e026cf9442d8 b/external/selfmake/git/objects/ff/898c6ca329b71dd7dfc7aba746e026cf9442d8
deleted file mode 100644
index 36f46a9..0000000
Binary files a/external/selfmake/git/objects/ff/898c6ca329b71dd7dfc7aba746e026cf9442d8 and /dev/null differ
diff --git a/external/selfmake/git/objects/ff/b63d7207da613fab77facc1d9fd10beb7edaa7 b/external/selfmake/git/objects/ff/b63d7207da613fab77facc1d9fd10beb7edaa7
deleted file mode 100644
index 8a8021a..0000000
Binary files a/external/selfmake/git/objects/ff/b63d7207da613fab77facc1d9fd10beb7edaa7 and /dev/null differ
diff --git a/external/selfmake/git/objects/pack/pack-5272b25eacd6109a2629b84ac4ee6d6db209bbf9.idx b/external/selfmake/git/objects/pack/pack-5272b25eacd6109a2629b84ac4ee6d6db209bbf9.idx
deleted file mode 100644
index 23f757e..0000000
Binary files a/external/selfmake/git/objects/pack/pack-5272b25eacd6109a2629b84ac4ee6d6db209bbf9.idx and /dev/null differ
diff --git a/external/selfmake/git/objects/pack/pack-5272b25eacd6109a2629b84ac4ee6d6db209bbf9.pack b/external/selfmake/git/objects/pack/pack-5272b25eacd6109a2629b84ac4ee6d6db209bbf9.pack
deleted file mode 100644
index 9b64ee4..0000000
Binary files a/external/selfmake/git/objects/pack/pack-5272b25eacd6109a2629b84ac4ee6d6db209bbf9.pack and /dev/null differ
diff --git a/external/selfmake/git/packed-refs b/external/selfmake/git/packed-refs
deleted file mode 100644
index 0b34934..0000000
--- a/external/selfmake/git/packed-refs
+++ /dev/null
@@ -1,2 +0,0 @@
-# pack-refs with: peeled fully-peeled sorted 
-fc3a3f39fdb3853b837a7b73d6870e66709395ef refs/remotes/origin/main
diff --git a/external/selfmake/git/refs/heads/feature_simple_conditionals b/external/selfmake/git/refs/heads/feature_simple_conditionals
deleted file mode 100644
index 76d029c..0000000
--- a/external/selfmake/git/refs/heads/feature_simple_conditionals
+++ /dev/null
@@ -1 +0,0 @@
-122c54c0897f62b63a63d4bcfd39b7c9d8ab8c68
diff --git a/external/selfmake/git/refs/heads/main b/external/selfmake/git/refs/heads/main
deleted file mode 100644
index d0863c3..0000000
--- a/external/selfmake/git/refs/heads/main
+++ /dev/null
@@ -1 +0,0 @@
-c8c3b7278df109d4e070f3b347aeab7d60ebe999
diff --git a/external/selfmake/git/refs/remotes/origin/HEAD b/external/selfmake/git/refs/remotes/origin/HEAD
deleted file mode 100644
index 4b0a875..0000000
--- a/external/selfmake/git/refs/remotes/origin/HEAD
+++ /dev/null
@@ -1 +0,0 @@
-ref: refs/remotes/origin/main
diff --git a/external/selfmake/git/refs/remotes/origin/main b/external/selfmake/git/refs/remotes/origin/main
deleted file mode 100644
index d0863c3..0000000
--- a/external/selfmake/git/refs/remotes/origin/main
+++ /dev/null
@@ -1 +0,0 @@
-c8c3b7278df109d4e070f3b347aeab7d60ebe999
diff --git a/external/selfmake/include/selfmake/Result.h b/external/selfmake/include/selfmake/Result.h
deleted file mode 100644
index f0930c9..0000000
--- a/external/selfmake/include/selfmake/Result.h
+++ /dev/null
@@ -1,108 +0,0 @@
-#ifndef SM_RESULT_H
-#define SM_RESULT_H
-
-#ifndef DOXYGEN_SHOULD_SKIP_THIS
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-#endif
-
-/** @addtogroup selfmakeAPIEnums
- *  @{
- */ 
-
-    /**
-     * Return values for functions.
-     */
-    typedef enum SM_RESULT 
-    {
-        SM_SUCCESS,
-        SM_ERROR_INVALID_OPTION,
-        SM_ERROR_NULL_POINTER,
-        SM_ERROR_BAD_STATE,
-        SM_ERROR_GENERATE_DOCUMENTS_FAILURE,
-        SM_ERROR_DOWNLOAD_FAILED,
-        SM_ERROR_BUILD_EXTERNAL_FAILED,
-        SM_ERROR_COPY_EXTERNAL_HEADER_FAILED,
-        SM_ERROR_COPY_PUBLIC_LIBRARY_HEADER_FAILED,
-        SM_ERROR_CREATE_LIBRARY_INCLUDES_FAILED,
-        SM_ERROR_BUILD_LIBRARY_FAILED,
-        SM_ERROR_WGET_EXECUTION_FAILED,
-        SM_ERROR_UNZIP_EXECUTION_FAILED,
-        SM_ERROR_DOXYGEN_EXECUTION_FAILED,
-        SM_ERROR_GCC_EXECUTION_FAILED,
-        SM_ERROR_AR_EXECUTION_FAILED,
-        SM_ERROR_XXD_EXECUTION_FAILED,
-        SM_ERROR_CP_EXECUTION_FAILED,
-        SM_ERROR_LIBRARY_NOT_FOUND,
-        SM_ERROR_WGET_NOT_FOUND,
-        SM_ERROR_UNZIP_NOT_FOUND,
-        SM_ERROR_DOXYGEN_NOT_FOUND,
-        SM_ERROR_GCC_NOT_FOUND,
-        SM_ERROR_AR_NOT_FOUND,
-        SM_ERROR_CP_NOT_FOUND,
-        SM_ERROR_GENERATE_VERSION_DEPENDENT_DOCS,
-        SM_ERROR_GENERATE_DOCS_USING_DOXYGEN,
-        SM_ERROR_GET_PROJECT_DIRECTORY,
-        SM_ERROR_GET_WORK_DIRECTORY,
-        SM_ERROR_CANT_OPEN_README,
-        SM_ERROR_CANT_OPEN_HEADER,
-        SM_ERROR_CANT_OPEN_DIR,
-        SM_ERROR_CANT_DOWNLOAD_VULKAN_HEADERS,
-        SM_ERROR_CANT_DOWNLOAD_VOLK,
-        SM_ERROR_CANT_DOWNLOAD_FREETYPE,
-        SM_ERROR_CANT_DOWNLOAD_OPENSSL,
-        SM_ERROR_CANT_DOWNLOAD_PROJECT,
-        SM_ERROR_BUILD_XXD_FAILED,
-        SM_ERROR_BUILD_HELPER_LIBRARY_FAILED,
-        SM_ERROR_NOT_IMPLEMENTED,
-        SM_ERROR_CANT_CREATE_DIRECTORY,
-        SM_ERROR_CANT_CREATE_OBJECT_FILE,
-        SM_ERROR_CANT_CREATE_OBJECTS,
-        SM_ERROR_CANT_CREATE_LIBRARY,
-        SM_ERROR_CANT_CREATE_EXTERNAL_BIN_DIRECTORY,
-        SM_ERROR_CANT_CREATE_EXTERNAL_BIN_OBJECT_DIRECTORY,
-        SM_ERROR_CANT_CREATE_BIN_OBJECT_DIRECTORY,
-        SM_ERROR_CANT_CREATE_BIN_DIRECTORY,
-        SM_ERROR_CANT_CREATE_SHARED_LIB,
-        SM_ERROR_CANT_CREATE_STATIC_LIB,
-        SM_ERROR_CANT_CREATE_INCLUDE_FILE,
-        SM_ERROR_CANT_CREATE_INCLUDE_DIRECTORY,
-        SM_ERROR_CANT_CREATE_EXTERNAL_DIRECTORY,
-        SM_ERROR_COPY_EXTERNAL_HEADER_USING_CP_FAILED,
-        SM_ERROR_COPY_PUBLIC_LIBRARY_HEADER_USING_CP_FAILED,
-        SM_ERROR_COPY_FAILED,
-        SM_ERROR_CANT_CREATE_NETZHAUT_OBJECT_FILES,
-        SM_ERROR_CANT_CREATE_IO_OBJECT_FILES,
-        SM_ERROR_CANT_CREATE_GRAPHICS_OBJECT_FILES,
-        SM_ERROR_CANT_CREATE_CSS_OBJECT_FILES,
-        SM_ERROR_CANT_CREATE_HTML_OBJECT_FILES,
-        SM_ERROR_CANT_CREATE_JAVASCRIPT_OBJECT_FILES,
-        SM_ERROR_CANT_CREATE_TTY_OBJECT_FILES,
-        SM_ERROR_CANT_CREATE_NETWORK_OBJECT_FILES,
-        SM_ERROR_CANT_CREATE_API_OBJECT_FILES,
-        SM_ERROR_THREAD_CREATION_FAILED,
-        SM_ERROR_INSTALL_ALL_LIBRARY_FAILED,
-        SM_ERROR_INSTALL_ALL_EXTERNAL_LIBRARY_FAILED,
-        SM_ERROR_INSTALL_ALL_WEB_BROWSER_FAILED,
-        SM_ERROR_INSTALL_ALL_LOGO_FAILED,
-        SM_ERROR_BUILD_WEB_BROWSER_FAILED,
-
-    } SM_RESULT;
-
-/** @} */
-
-/** @addtogroup selfmakeAPIVars 
- *  @{
- */ 
-
-    extern const char *SM_RESULTS_PP[];
-    extern unsigned int SM_RESULTS_PP_COUNT;
-
-/** @} */
-
-#endif
diff --git a/external/selfmake/include/selfmake/Types.h b/external/selfmake/include/selfmake/Types.h
deleted file mode 100644
index 16e8ed5..0000000
--- a/external/selfmake/include/selfmake/Types.h
+++ /dev/null
@@ -1,129 +0,0 @@
-#ifndef SM_TYPES_H
-#define SM_TYPES_H
-
-#ifndef DOXYGEN_SHOULD_SKIP_THIS
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-/**
- * This file contains API-level types.
- */
-
-#include "Result.h"
-
-#endif
-
-/** @addtogroup selfmakeAPITypedefs
- *  @{
- */
-
-    typedef char           SM_BYTE;
-    typedef unsigned char  SM_UNSIGNED_BYTE;
-
-    typedef struct sm_Runtime sm_Runtime;
-
-/** @} */
-
-/** @addtogroup selfmakeAPIEnums
- *  @{
- */ 
-
-    /**
-     * Boolean values.
-     */
-    typedef enum SM_BOOL {
-        SM_FALSE = 0, /**<Indicates false.*/
-        SM_TRUE = 1,  /**<Indicates true.*/
-    } SM_BOOL;
-
-    typedef enum SM_TOKEN {
-        SM_TOKEN_UNDEFINED,
-        SM_TOKEN_COMMA,
-        SM_TOKEN_IDENTIFIER,
-        SM_TOKEN_STRING,
-        SM_TOKEN_CURLY_BRACKET_RIGHT,
-        SM_TOKEN_CURLY_BRACKET_LEFT,
-        SM_TOKEN_ROUND_BRACKET_RIGHT,
-        SM_TOKEN_ROUND_BRACKET_LEFT,
-        SM_TOKEN_ANGLE_BRACKET_RIGHT,
-        SM_TOKEN_ANGLE_BRACKET_LEFT,
-        SM_TOKEN_HYPHEN_MINUS,
-        SM_TOKEN_EOF,
-    } SM_TOKEN;
-
-    typedef enum SM_DEFINITION {
-        SM_DEFINITION_UNDEFINED,
-        SM_DEFINITION_OPTION,
-        SM_DEFINITION_FUNCTION,
-        SM_DEFINITION_BLOCK,
-        SM_DEFINITION_IF,
-    } SM_DEFINITION;
-
-    typedef enum SM_SOURCE_CONTEXT {
-        SM_SOURCE_CONTEXT_UNDEFINED,
-        SM_SOURCE_CONTEXT_SHARED_LIBRARY,
-        SM_SOURCE_CONTEXT_STATIC_LIBRARY,
-        SM_SOURCE_CONTEXT_BINARY,
-    } SM_SOURCE_CONTEXT;
-
-/** @} */
-
-/** @addtogroup selfmakeAPIStructs
- *  @{
- */
-
-    typedef struct sm_Function {
-        SM_DEFINITION type;
-        SM_BYTE *name_p;
-        unsigned int arguments;
-        SM_BYTE **arguments_pp;
-        SM_TOKEN *argumentTypes_p;
-    } sm_Function;
-
-    typedef struct sm_SourceContext {
-        SM_SOURCE_CONTEXT type;
-        SM_BYTE *path_p;
-        SM_BYTE *name_p;
-        SM_BYTE *compileArgs_p;
-        SM_BYTE *linkArgs_p;
-        SM_BYTE *outputPath_p;
-        long api, major, minor, patch;
-        long apiDate_p[3], majorDate_p[3], minorDate_p[3], patchDate_p[3];
-    } sm_SourceContext;
-
-    typedef struct sm_SourceContextArray {
-        int length;
-        int maxNameLength;
-        sm_SourceContext *SourceContexts_p;
-    } sm_SourceContextArray;
-
-    typedef struct sm_ValueArray {
-        SM_BYTE **values_pp;
-        int length;
-    } sm_ValueArray;
-
-    typedef struct sm_TestArgument {
-        SM_BYTE *p;
-    } sm_TestArgument;
-
-/** @} */
-
-/** @addtogroup selfmakeAPITypedefs
- *  @{
- */
-
-    typedef SM_RESULT (*sm_functionCallback_f)(
-        sm_Runtime *Runtime_p, sm_Function *Function_p
-    );
-
-    typedef SM_RESULT (*sm_sourceContextCallback_f)(
-        sm_Runtime *Runtime_p, sm_SourceContext *Context_p
-    );
-
-/** @} */
-
-#endif
diff --git a/external/selfmake/include/selfmake/selfmake.h b/external/selfmake/include/selfmake/selfmake.h
deleted file mode 100644
index 1a84819..0000000
--- a/external/selfmake/include/selfmake/selfmake.h
+++ /dev/null
@@ -1,114 +0,0 @@
-#ifndef SELFMAKE_H
-#define SELFMAKE_H
-
-#ifndef DOXYGEN_SHOULD_SKIP_THIS
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-/**
- * This file contains API-level functions.
- */
-
-#include "Result.h"
-#include "Types.h"
-
-#endif
-
-/** @addtogroup selfmakeAPIFunctions
- *  @{
- */
-
-    SM_RESULT sm_initialize(
-    );
-    
-    void sm_terminate(
-    );
-
-    sm_Runtime *sm_createRuntime(
-        SM_BYTE *name_p
-    );
-
-    void sm_destroyRuntime(
-        sm_Runtime *Runtime_p
-    );
-
-    SM_RESULT sm_run(
-        sm_Runtime *Runtime_p, int argc, SM_BYTE **argv_pp
-    );
-
-    SM_RESULT sm_addFile(
-        sm_Runtime *Runtime_p, SM_BYTE *path_p
-    );
-
-    void sm_setFunctionCallback(
-        sm_Runtime *Runtime_p, sm_functionCallback_f functionCallback_f
-    );
-
-    void sm_setSourceContextCallback(
-        sm_Runtime *Runtime_p, sm_sourceContextCallback_f sourceContextCallback_f
-    );
-
-    void sm_setBeforeBuildCallback(
-        sm_Runtime *Runtime_p, sm_sourceContextCallback_f sourceContextCallback_f
-    );
-
-    void sm_setAfterBuildCallback(
-        sm_Runtime *Runtime_p, sm_sourceContextCallback_f sourceContextCallback_f
-    );
-
-    sm_SourceContextArray *sm_getSourceContextArray(
-        sm_Runtime *Runtime_p
-    );
-
-    sm_SourceContext *sm_getSourceContext(
-        sm_Runtime *Runtime_p, SM_BYTE *name_p
-    );
-
-    void sm_setQuiet(
-        sm_Runtime *Runtime_p, SM_BOOL quiet
-    );
-    
-    void sm_setShowParseTree(
-        sm_Runtime *Runtime_p, SM_BOOL showParseTree
-    );
-
-    SM_RESULT sm_setVariable(
-        sm_Runtime *Runtime_p, SM_BYTE *variables_p, SM_BYTE **values_pp, int valueCount
-    );
-
-    sm_ValueArray sm_getVariableValues(
-        sm_Runtime *Runtime_p, SM_BYTE *variable_p
-    );
-
-    int sm_isRunning(
-    );
-    
-    SM_RESULT sm_sleepMs(
-        int milliseconds
-    );
-
-    SM_BYTE *sm_getProcessDirectory(
-    );
-
-    SM_BYTE *sm_getWorkDirectory(
-    );
-
-    SM_BYTE *sm_getFileData(
-        const SM_BYTE* path_p, long *size_p
-    );
-
-    SM_RESULT sm_writeBytesToFile(
-        SM_BYTE *filename_p, SM_BYTE *bytes_p
-    );
-
-    SM_RESULT sm_messagef(
-        SM_BYTE *format_p, ...
-    );
-
-/** @} */
-
-#endif
diff --git a/external/selfmake/lib/.gitignore b/external/selfmake/lib/.gitignore
deleted file mode 100644
index 5e7d273..0000000
--- a/external/selfmake/lib/.gitignore
+++ /dev/null
@@ -1,4 +0,0 @@
-# Ignore everything in this directory
-*
-# Except this file
-!.gitignore
diff --git a/external/selfmake/src/bin/smake/Main.c b/external/selfmake/src/bin/smake/Main.c
deleted file mode 100644
index 8813425..0000000
--- a/external/selfmake/src/bin/smake/Main.c
+++ /dev/null
@@ -1,31 +0,0 @@
-// LICENSE NOTICE ==================================================================================
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-// INCLUDE =========================================================================================
-
-#include "../../../include/selfmake/selfmake.h"
-
-// MAIN ============================================================================================
-
-int main(int argc, char **argv_pp)
-{
-    sm_initialize();
-
-    sm_Runtime *Runtime_p = sm_createRuntime("smake");
-    if (!Runtime_p) {return 1;}
-
-    sm_addFile(Runtime_p, "MAKE.sm");
-
-    if (sm_run(Runtime_p, argc - 1, argv_pp + 1)) {return 1;}
-
-    while (sm_isRunning()) {sm_sleepMs(100);}
-
-    sm_destroyRuntime(Runtime_p);
-    sm_terminate();
-} 
-
diff --git a/external/selfmake/src/bin/smmake/Documents.c b/external/selfmake/src/bin/smmake/Documents.c
deleted file mode 100644
index 914cb3d..0000000
--- a/external/selfmake/src/bin/smmake/Documents.c
+++ /dev/null
@@ -1,239 +0,0 @@
-// LICENSE NOTICE ==================================================================================
-
-/**
- * netzhaut - Web Browser Engine
- * Copyright (C) 2020 The netzhaut Authors
- * Published under LGPLv3
- */
-
-// INCLUDE =========================================================================================
-
-#include "Documents.h"
-#include "Version.h"
-
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <unistd.h>
-#include <ctype.h>
-#include <time.h>
-
-#include <sys/types.h> 
-#include <sys/stat.h>
-
-// HELPER ==========================================================================================
-
-static long *getLatestDate(
-    long date1_p[3], long date2_p[3], long date3_p[3])
-{
-    if (date1_p[0] > date2_p[0] && date1_p[0] > date3_p[0]) {
-        return date1_p;
-    }
-    else if (date1_p[0] < date2_p[0] || date1_p[0] < date3_p[0]) {
-        return NULL;
-    }
-    if (date1_p[1] > date2_p[1] && date1_p[1] > date3_p[1]) {
-        return date1_p;
-    }
-    else if (date1_p[1] < date2_p[1] || date1_p[1] < date3_p[1]) {
-        return NULL;
-    }
-    else if (date1_p[2] > date2_p[2] && date1_p[2] > date3_p[2]) {
-        return date1_p;
-    }
-    else if (date1_p[2] < date2_p[2] || date1_p[2] < date3_p[2]) {
-        return NULL;
-    }
-
-    return NULL;
-}
-
-// INSERT ==========================================================================================
-
-static SM_BYTE *insertFullVersion(
-    sm_Runtime *Runtime_p, SM_BYTE *data_p, size_t size)
-{
-    SM_BYTE *new_p = malloc(size + 10000);
-    memset(new_p, 0, size + 10000);
-
-    SM_BYTE *before_p = data_p;
-    SM_BYTE *after_p = strstr(data_p, "SM_MAKE_INSERT_FULL_VERSION_BEGIN"); 
-    if (!after_p) {return NULL;}
-
-    after_p += 37;
-    *after_p = 0;
-
-    sprintf(new_p, before_p);
-
-    SM_BYTE version_p[255];
-    getProjectVersion(Runtime_p, version_p);
-    sprintf(new_p + strlen(new_p), "\n%s", version_p);
-
-    after_p = strstr(after_p + 1, "<!-- SM_MAKE_INSERT_FULL_VERSION_END"); 
-    if (!after_p) {return NULL;}
-
-    sprintf(new_p + strlen(new_p), "\n%s", after_p);
-
-    free(data_p);
-
-    return new_p;
-}
-
-static SM_BYTE *insertChangelogs(
-    sm_Runtime *Runtime_p, SM_BYTE *data_p, size_t size)
-{
-    SM_BYTE *new_p = malloc(size + 10000);
-    memset(new_p, 0, size + 10000);
-
-    SM_BYTE *before_p = data_p;
-    SM_BYTE *after_p = strstr(data_p, "SM_MAKE_INSERT_CHANGELOGS_BEGIN"); 
-    if (!after_p) {return NULL;}
-    
-    after_p += 35;
-    *after_p = 0;
-
-    sprintf(new_p, before_p);
-        
-    int versionNums_p[4];
-    long versionDates_pp[4][3];
-    getVersionData(versionNums_p, versionDates_pp);
-
-    long *date_p = getLatestDate(versionDates_pp[1], versionDates_pp[2], versionDates_pp[3]);
-    if (!date_p) {date_p = getLatestDate(versionDates_pp[2], versionDates_pp[1], versionDates_pp[3]);}
-    if (!date_p) {date_p = getLatestDate(versionDates_pp[3], versionDates_pp[1], versionDates_pp[2]);}
-    if (!date_p) {date_p = versionDates_pp[1];} 
-
-    SM_BYTE line_p[512];
-    sprintf(line_p, "\n%d-%02d-%02d <a href=\"impl/html/group__selfmakeChangelog.html#v%d.%d.%d.%d\">selfmakeLibrary v%d.%d.%d.%d</a><br>\n", 
-        date_p[0], date_p[1], date_p[2], versionNums_p[0], versionNums_p[1], versionNums_p[2], versionNums_p[3], 
-        versionNums_p[0], versionNums_p[1], versionNums_p[2], versionNums_p[3]);
-
-    sprintf(new_p + strlen(new_p), line_p);
-
-    sm_ValueArray LangVer = sm_getVariableValues(Runtime_p, "LANG_VER");
-    sm_ValueArray LangDate = sm_getVariableValues(Runtime_p, "LANG_DATE");
-
-    memset(line_p, 0, 512);
-    sprintf(line_p, "\n%s <a href=\"lang/html/changelog.html#v%s\">selfmakeLanguage v%s</a><br>", 
-        LangDate.values_pp[0], LangVer.values_pp[0], LangVer.values_pp[0]);
-
-    sprintf(new_p + strlen(new_p), line_p);
-
-    after_p = strstr(after_p + 1, "<!-- SM_MAKE_INSERT_CHANGELOGS_END"); 
-    if (!after_p) {return NULL;}
-
-    sprintf(new_p + strlen(new_p), "\n%s", after_p);
-
-    free(data_p);
-
-    return new_p;
-}
-
-static SM_BYTE *insertNews(
-    sm_Runtime *Runtime_p, SM_BYTE *data_p, size_t size)
-{
-    SM_BYTE *new_p = malloc(size + 10000);
-    memset(new_p, 0, size + 10000);
-
-    SM_BYTE *before_p = data_p;
-    SM_BYTE *after_p = strstr(data_p, "SM_MAKE_INSERT_NEWS_BEGIN"); 
-    if (!after_p) {return NULL;}
-    
-    after_p += 29;
-    *after_p = 0;
-
-    sprintf(new_p, before_p);
-
-    sm_ValueArray News = sm_getVariableValues(Runtime_p, "NEWS");
-
-    for (int i = 0; i < News.length; ++i) 
-    {
-        sprintf(new_p + strlen(new_p), "\n");
-        sprintf(new_p + strlen(new_p), News.values_pp[i]);
-    }
-
-    after_p = strstr(after_p + 1, "<!-- SM_MAKE_INSERT_NEWS_END"); 
-    if (!after_p) {return NULL;}
-
-    sprintf(new_p + strlen(new_p), "\n%s", after_p);
-
-    free(data_p);
-
-    return new_p;
-}
-
-static SM_BYTE *insertTime(
-    sm_Runtime *Runtime_p, SM_BYTE *data_p, size_t size)
-{
-    SM_BYTE *new_p = malloc(size + 10000);
-    memset(new_p, 0, size + 10000);
-
-    SM_BYTE *before_p = data_p;
-    SM_BYTE *after_p = strstr(data_p, "SM_MAKE_INSERT_TIME_BEGIN"); 
-    if (!after_p) {return NULL;}
-    
-    after_p += 29;
-    *after_p = 0;
-
-    sprintf(new_p, before_p);
-
-    time_t t; struct tm* tm;
-    SM_BYTE date_p[11];
-    
-    time(&t);
-    tm = localtime(&t);
-    
-    strftime(date_p, sizeof(date_p), "%Y-%m-%d", tm);
-    sprintf(new_p + strlen(new_p), "\n");
-    sprintf(new_p + strlen(new_p), date_p);
-
-    after_p = strstr(after_p + 1, "<!-- SM_MAKE_INSERT_TIME_END"); 
-    if (!after_p) {return NULL;}
-
-    sprintf(new_p + strlen(new_p), "\n%s", after_p);
-
-    free(data_p);
-
-    return new_p;
-}
-
-// GENERATE ========================================================================================
-
-SM_RESULT generateHomepage(
-    sm_Runtime *Runtime_p)
-{
-    long size;
-    SM_BYTE *data_p = sm_getFileData("external/selfmake.netzwerkz.org/docs/index.html", &size);
-    if (!data_p) {return SM_ERROR_BAD_STATE;}
-
-    data_p = insertChangelogs(Runtime_p, data_p, size);
-    data_p = insertFullVersion(Runtime_p, data_p, size);
-    data_p = insertNews(Runtime_p, data_p, size);
-    data_p = insertTime(Runtime_p, data_p, size);
-
-    sm_writeBytesToFile("external/selfmake.netzwerkz.org/docs/index.html", data_p);
-
-    free(data_p);
-
-    return SM_SUCCESS;
-}
-
-SM_RESULT generateFooter(
-    sm_Runtime *Runtime_p)
-{
-    long size;
-    SM_BYTE *data_p = sm_getFileData("external/selfmake.netzwerkz.org/docs/theme/footer1.html", &size);
-    if (!data_p) {return SM_ERROR_BAD_STATE;}
-    data_p = insertFullVersion(Runtime_p, data_p, size);
-    sm_writeBytesToFile("external/selfmake.netzwerkz.org/docs/theme/footer1.html", data_p);
-    free(data_p);
-
-    data_p = sm_getFileData("external/selfmake.netzwerkz.org/docs/theme/footer2.html", &size);
-    if (!data_p) {return SM_ERROR_BAD_STATE;}
-    data_p = insertFullVersion(Runtime_p, data_p, size);
-    sm_writeBytesToFile("external/selfmake.netzwerkz.org/docs/theme/footer2.html", data_p);
-    free(data_p);
-
-    return SM_SUCCESS;
-}
-
diff --git a/external/selfmake/src/bin/smmake/Documents.h b/external/selfmake/src/bin/smmake/Documents.h
deleted file mode 100644
index 2c05081..0000000
--- a/external/selfmake/src/bin/smmake/Documents.h
+++ /dev/null
@@ -1,30 +0,0 @@
-#ifndef DOCUMENTS_H
-#define DOCUMENTS_H
-
-#ifndef DOXYGEN_SHOULD_SKIP_THIS
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-#include "../../../include/selfmake/selfmake.h"
-
-#endif
-
-/** @addtogroup nhmakeFunctions
- *  @{
- */
-
-    SM_RESULT generateHomepage(
-        sm_Runtime *Runtime_p
-    );
-
-    SM_RESULT generateFooter(
-        sm_Runtime *Runtime_p
-    );
-
-/** @} */
-
-#endif
diff --git a/external/selfmake/src/bin/smmake/Main.c b/external/selfmake/src/bin/smmake/Main.c
deleted file mode 100644
index 07010e2..0000000
--- a/external/selfmake/src/bin/smmake/Main.c
+++ /dev/null
@@ -1,85 +0,0 @@
-// LICENSE NOTICE ==================================================================================
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-// INCLUDE =========================================================================================
-
-#include "Version.h"
-#include "Documents.h"
-
-#include "../../../include/selfmake/selfmake.h"
-
-#include <stdio.h>
-#include <string.h>
-#include <stdlib.h>
-#include <ctype.h>
-
-// MAIN ============================================================================================
-
-static SM_RESULT sourceContextCallback(
-    sm_Runtime *Runtime_p, sm_SourceContext *SourceContext_p)
-{
-    if (!strcmp(SourceContext_p->name_p, "selfmake")) 
-    {
-        int versionNums_p[4];
-        long versionDates_pp[4][3];
-        getVersionData(versionNums_p, versionDates_pp);
-        SourceContext_p->api   = versionNums_p[0];
-        SourceContext_p->major = versionNums_p[1];
-        SourceContext_p->minor = versionNums_p[2];
-        SourceContext_p->patch = versionNums_p[3];
-    }
-
-    return SM_SUCCESS;
-}
-
-static SM_RESULT functionCallback(
-    sm_Runtime *Runtime_p, sm_Function *Function_p)
-{
-    if (!strcmp(Function_p->name_p, "generateFooter")) {
-        generateFooter(Runtime_p); 
-    }
-    else if (!strcmp(Function_p->name_p, "generateHomepage")) {
-        generateHomepage(Runtime_p); 
-    }
-
-    return SM_SUCCESS;
-}
-
-int main(
-    int argc, char **argv_pp)
-{
-    sm_initialize();
-
-    sm_Runtime *Runtime_p = sm_createRuntime("smmake");
-    if (!Runtime_p) {return 1;}
-
-    SM_BYTE *wrkDir_p = malloc(255);
-    if (!wrkDir_p) {return 1;}
-    SM_BYTE *version_p = malloc(255);
-    if (!version_p) {return 1;}
-
-    sprintf(wrkDir_p, "%s/..", sm_getProcessDirectory());
-    getProjectVersion(Runtime_p, version_p);
-
-    sm_setVariable(Runtime_p, "PROJ_REV", &version_p, 1);
-    sm_setVariable(Runtime_p, "WRK_DIR", &wrkDir_p, 1);
-
-    sm_addFile(Runtime_p, "build/.sm/smmake.sm");
-    sm_setFunctionCallback(Runtime_p, functionCallback);
-    sm_setSourceContextCallback(Runtime_p, sourceContextCallback);
-
-    if (sm_run(Runtime_p, argc - 1, argv_pp + 1)) {return 1;}
-
-    while (sm_isRunning()) {sm_sleepMs(100);}
-
-    sm_destroyRuntime(Runtime_p);
-    sm_terminate();
-
-    return 0;
-} 
-
diff --git a/external/selfmake/src/bin/smmake/Version.c b/external/selfmake/src/bin/smmake/Version.c
deleted file mode 100644
index 047e85d..0000000
--- a/external/selfmake/src/bin/smmake/Version.c
+++ /dev/null
@@ -1,112 +0,0 @@
-// LICENSE NOTICE ==================================================================================
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-// INCLUDE =========================================================================================
-
-#include "Version.h"
-
-#include <stdio.h>
-#include <string.h>
-#include <stdlib.h>
-#include <ctype.h>
-
-// VERSION =========================================================================================
-
-static long getVersion(
-    SM_BYTE *data_p, SM_BYTE *macro_p)
-{
-    SM_BYTE *p = strstr(data_p, macro_p); 
-    if (!p) {return 0;}
-    p += strlen(macro_p);
-    long val = strtol(p, &p, 10);
-
-    return val;
-}
-
-static void getVersionDate(
-    SM_BYTE *data_p, SM_BYTE *macro_p, long date_p[3])
-{
-    date_p[0] = 0;
-    date_p[1] = 0;
-    date_p[2] = 0;
-
-    SM_BYTE *p = strstr(data_p, macro_p); 
-    if (!p) {return;}
-
-    while (p[0] != '/' || p[1] != '*' || p[2] != '*') {p--;}
-    while (*p && !isdigit(*p++)) {}
-    if (!*p) {return;}
-
-    p--;
-
-    date_p[0] = strtol(p, &p, 10);
-    p++;
-    date_p[1] = strtol(p, &p, 10);
-    p++;
-    date_p[2] = strtol(p, &p, 10);
-    p++;
-}
-
-SM_RESULT getVersionData(
-    int version_p[4], long versionDates_pp[4][3])
-{
-    SM_BYTE *api_p   = "SM_API_VERSION"; 
-    SM_BYTE *major_p = "SM_MAJOR_VERSION"; 
-    SM_BYTE *minor_p = "SM_MINOR_VERSION";
-    SM_BYTE *patch_p = "SM_PATCH_VERSION";
-
-    SM_BYTE path_p[512]; 
-    sprintf(path_p, "src/lib/Common/About.h");
-
-    SM_BYTE *data_p = sm_getFileData(path_p, NULL);
-    if (!data_p) {return SM_ERROR_BAD_STATE;}
-
-    version_p[0] = getVersion(data_p, api_p);
-    version_p[1] = getVersion(data_p, major_p);
-    version_p[2] = getVersion(data_p, minor_p);
-    version_p[3] = getVersion(data_p, patch_p);
-
-    getVersionDate(data_p, api_p, versionDates_pp[0]);
-    getVersionDate(data_p, major_p, versionDates_pp[1]);
-    getVersionDate(data_p, minor_p, versionDates_pp[2]);
-    getVersionDate(data_p, patch_p, versionDates_pp[3]);
-
-    free(data_p);
-
-    return SM_SUCCESS;
-}
-
-void getProjectVersion(
-    sm_Runtime *Runtime_p, SM_BYTE *version_p)
-{
-    sm_ValueArray Stage = sm_getVariableValues(Runtime_p, "PROJ_STAGE");
-
-    int versionNums_p[4];
-    long versionDates_pp[4][3];
-    getVersionData(versionNums_p, versionDates_pp);
-
-    sm_ValueArray LangVer = sm_getVariableValues(Runtime_p, "LANG_VER");
-
-    if (LangVer.length && Stage.length) {
-        sprintf(version_p, "v%d.%d.%d.%d-%s %s", versionNums_p[0], versionNums_p[1], versionNums_p[2], 
-            versionNums_p[3], LangVer.values_pp[0], Stage.values_pp[0]);
-    }
-    else if (LangVer.length) {
-        sprintf(version_p, "v%d.%d.%d.%d-%s", versionNums_p[0], versionNums_p[1], versionNums_p[2], 
-            versionNums_p[3], LangVer.values_pp[0]);
-    }
-    else if (Stage.length) {
-        sprintf(version_p, "v%d.%d.%d.%d %s", versionNums_p[0], versionNums_p[1], versionNums_p[2], 
-            versionNums_p[3], Stage.values_pp[0]);
-    }
-    else {
-        sprintf(version_p, "v%d.%d.%d.%d", versionNums_p[0], versionNums_p[1], versionNums_p[2], 
-            versionNums_p[3]);
-    }
-}
-
diff --git a/external/selfmake/src/bin/smmake/Version.h b/external/selfmake/src/bin/smmake/Version.h
deleted file mode 100644
index d1743bd..0000000
--- a/external/selfmake/src/bin/smmake/Version.h
+++ /dev/null
@@ -1,30 +0,0 @@
-#ifndef VERSION_H
-#define VERSION_H
-
-#ifndef DOXYGEN_SHOULD_SKIP_THIS
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-#include "../../../include/selfmake/selfmake.h"
-
-#endif
-
-/** @addtogroup selfmakeFunctions
- *  @{
- */
-
-    SM_RESULT getVersionData(
-        int version_p[3], long versionDates_pp[3][3]
-    );
-
-    void getProjectVersion(
-        sm_Runtime *Runtime_p, SM_BYTE *version_p
-    );
-
-/** @} */
-
-#endif
diff --git a/external/selfmake/src/lib/Common/Functions.h b/external/selfmake/src/lib/Common/Functions.h
deleted file mode 100644
index 1a84819..0000000
--- a/external/selfmake/src/lib/Common/Functions.h
+++ /dev/null
@@ -1,114 +0,0 @@
-#ifndef SELFMAKE_H
-#define SELFMAKE_H
-
-#ifndef DOXYGEN_SHOULD_SKIP_THIS
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-/**
- * This file contains API-level functions.
- */
-
-#include "Result.h"
-#include "Types.h"
-
-#endif
-
-/** @addtogroup selfmakeAPIFunctions
- *  @{
- */
-
-    SM_RESULT sm_initialize(
-    );
-    
-    void sm_terminate(
-    );
-
-    sm_Runtime *sm_createRuntime(
-        SM_BYTE *name_p
-    );
-
-    void sm_destroyRuntime(
-        sm_Runtime *Runtime_p
-    );
-
-    SM_RESULT sm_run(
-        sm_Runtime *Runtime_p, int argc, SM_BYTE **argv_pp
-    );
-
-    SM_RESULT sm_addFile(
-        sm_Runtime *Runtime_p, SM_BYTE *path_p
-    );
-
-    void sm_setFunctionCallback(
-        sm_Runtime *Runtime_p, sm_functionCallback_f functionCallback_f
-    );
-
-    void sm_setSourceContextCallback(
-        sm_Runtime *Runtime_p, sm_sourceContextCallback_f sourceContextCallback_f
-    );
-
-    void sm_setBeforeBuildCallback(
-        sm_Runtime *Runtime_p, sm_sourceContextCallback_f sourceContextCallback_f
-    );
-
-    void sm_setAfterBuildCallback(
-        sm_Runtime *Runtime_p, sm_sourceContextCallback_f sourceContextCallback_f
-    );
-
-    sm_SourceContextArray *sm_getSourceContextArray(
-        sm_Runtime *Runtime_p
-    );
-
-    sm_SourceContext *sm_getSourceContext(
-        sm_Runtime *Runtime_p, SM_BYTE *name_p
-    );
-
-    void sm_setQuiet(
-        sm_Runtime *Runtime_p, SM_BOOL quiet
-    );
-    
-    void sm_setShowParseTree(
-        sm_Runtime *Runtime_p, SM_BOOL showParseTree
-    );
-
-    SM_RESULT sm_setVariable(
-        sm_Runtime *Runtime_p, SM_BYTE *variables_p, SM_BYTE **values_pp, int valueCount
-    );
-
-    sm_ValueArray sm_getVariableValues(
-        sm_Runtime *Runtime_p, SM_BYTE *variable_p
-    );
-
-    int sm_isRunning(
-    );
-    
-    SM_RESULT sm_sleepMs(
-        int milliseconds
-    );
-
-    SM_BYTE *sm_getProcessDirectory(
-    );
-
-    SM_BYTE *sm_getWorkDirectory(
-    );
-
-    SM_BYTE *sm_getFileData(
-        const SM_BYTE* path_p, long *size_p
-    );
-
-    SM_RESULT sm_writeBytesToFile(
-        SM_BYTE *filename_p, SM_BYTE *bytes_p
-    );
-
-    SM_RESULT sm_messagef(
-        SM_BYTE *format_p, ...
-    );
-
-/** @} */
-
-#endif
diff --git a/external/selfmake/src/lib/Common/Macros/FLOW.h b/external/selfmake/src/lib/Common/Macros/FLOW.h
deleted file mode 100644
index 7d2501e..0000000
--- a/external/selfmake/src/lib/Common/Macros/FLOW.h
+++ /dev/null
@@ -1,35 +0,0 @@
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-#undef SM_BEGIN
-#undef SM_END
-#undef SM_SILENT_END
-#undef SM_DIAGNOSTIC_END
-
-#ifdef SM_LOG_FLOW
-    #define SM_BEGIN()
-#else
-    #define SM_BEGIN() 
-#endif
-
-#ifdef SM_LOG_FLOW
-    #define SM_END(result) {return result;}
-#else
-    #define SM_END(result) {return result;} 
-#endif
-
-#ifdef SM_LOG_FLOW
-    #define SM_SILENT_END() {return;}
-#else
-    #define SM_SILENT_END() {return;} 
-#endif
-
-#ifdef SM_LOG_FLOW
-    #define SM_DIAGNOSTIC_END(result) {return result;}
-#else
-    #define SM_DIAGNOSTIC_END(result) {return result;} 
-#endif
-
diff --git a/external/selfmake/src/lib/Common/Macros/Macros.h b/external/selfmake/src/lib/Common/Macros/Macros.h
deleted file mode 100644
index 981f98c..0000000
--- a/external/selfmake/src/lib/Common/Macros/Macros.h
+++ /dev/null
@@ -1,18 +0,0 @@
-#ifndef SM_MACROS_H
-#define SM_MACROS_H
-
-#ifndef DOXYGEN_SHOULD_SKIP_THIS
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-#define SM_DEFAULT_CHECK "../Common/Macros/DEFAULT_CHECK.h"
-#define SM_CUSTOM_CHECK "../Common/Macros/CUSTOM_CHECK.h"
-#define SM_FLOW "../Common/Macros/FLOW.h"
-
-#endif
-
-#endif 
diff --git a/external/selfmake/src/lib/Common/Result.c b/external/selfmake/src/lib/Common/Result.c
deleted file mode 100644
index ce0c28e..0000000
--- a/external/selfmake/src/lib/Common/Result.c
+++ /dev/null
@@ -1,91 +0,0 @@
-// LICENSE NOTICE ==================================================================================
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-// INCLUDE ==========================================================================================
-
-#include "Result.h"
-
-// RESULTS =========================================================================================
-
-const char *SM_RESULTS_PP[] = 
-{
-    "SM_SUCCESS",
-    "SM_ERROR_INVALID_OPTION",
-    "SM_ERROR_NULL_POINTER",
-    "SM_ERROR_BAD_STATE",
-    "SM_ERROR_GENERATE_DOCUMENTS_FAILURE",
-    "SM_ERROR_DOWNLOAD_FAILED",
-    "SM_ERROR_BUILD_EXTERNAL_FAILED",
-    "SM_ERROR_COPY_EXTERNAL_HEADER_FAILED",
-    "SM_ERROR_COPY_PUBLIC_LIBRARY_HEADER_FAILED",
-    "SM_ERROR_CREATE_LIBRARY_INCLUDES_FAILED",
-    "SM_ERROR_BUILD_LIBRARY_FAILED",
-    "SM_ERROR_WGET_EXECUTION_FAILED",
-    "SM_ERROR_UNZIP_EXECUTION_FAILED",
-    "SM_ERROR_DOXYGEN_EXECUTION_FAILED",
-    "SM_ERROR_GCC_EXECUTION_FAILED",
-    "SM_ERROR_AR_EXECUTION_FAILED",
-    "SM_ERROR_XXD_EXECUTION_FAILED",
-    "SM_ERROR_CP_EXECUTION_FAILED",
-    "SM_ERROR_LIBRARY_NOT_FOUND",
-    "SM_ERROR_WGET_NOT_FOUND",
-    "SM_ERROR_UNZIP_NOT_FOUND",
-    "SM_ERROR_DOXYGEN_NOT_FOUND",
-    "SM_ERROR_GCC_NOT_FOUND",
-    "SM_ERROR_AR_NOT_FOUND",
-    "SM_ERROR_CP_NOT_FOUND",
-    "SM_ERROR_GENERATE_VERSION_DEPENDENT_DOCS",
-    "SM_ERROR_GENERATE_DOCS_USING_DOXYGEN",
-    "SM_ERROR_GET_PROJECT_DIRECTORY",
-    "SM_ERROR_GET_WORK_DIRECTORY",
-    "SM_ERROR_CANT_OPEN_README",
-    "SM_ERROR_CANT_OPEN_HEADER",
-    "SM_ERROR_CANT_OPEN_DIR",
-    "SM_ERROR_CANT_DOWNLOAD_VULKAN_HEADERS",
-    "SM_ERROR_CANT_DOWNLOAD_VOLK",
-    "SM_ERROR_CANT_DOWNLOAD_FREETYPE",
-    "SM_ERROR_CANT_DOWNLOAD_OPENSSL",
-    "SM_ERROR_CANT_DOWNLOAD_PROJECT",
-    "SM_ERROR_BUILD_XXD_FAILED",
-    "SM_ERROR_BUILD_HELPER_LIBRARY_FAILED",
-    "SM_ERROR_NOT_IMPLEMENTED",
-    "SM_ERROR_CANT_CREATE_DIRECTORY",
-    "SM_ERROR_CANT_CREATE_OBJECT_FILE",
-    "SM_ERROR_CANT_CREATE_OBJECTS",
-    "SM_ERROR_CANT_CREATE_LIBRARY",
-    "SM_ERROR_CANT_CREATE_EXTERNAL_BIN_DIRECTORY",
-    "SM_ERROR_CANT_CREATE_EXTERNAL_BIN_OBJECT_DIRECTORY",
-    "SM_ERROR_CANT_CREATE_BIN_OBJECT_DIRECTORY",
-    "SM_ERROR_CANT_CREATE_BIN_DIRECTORY",
-    "SM_ERROR_CANT_CREATE_SHARED_LIB",
-    "SM_ERROR_CANT_CREATE_STATIC_LIB",
-    "SM_ERROR_CANT_CREATE_INCLUDE_FILE",
-    "SM_ERROR_CANT_CREATE_INCLUDE_DIRECTORY",
-    "SM_ERROR_CANT_CREATE_EXTERNAL_DIRECTORY",
-    "SM_ERROR_COPY_EXTERNAL_HEADER_USING_CP_FAILED",
-    "SM_ERROR_COPY_PUBLIC_LIBRARY_HEADER_USING_CP_FAILED",
-    "SM_ERROR_COPY_FAILED",
-    "SM_ERROR_CANT_CREATE_NETZHAUT_OBJECT_FILES",
-    "SM_ERROR_CANT_CREATE_IO_OBJECT_FILES",
-    "SM_ERROR_CANT_CREATE_GRAPHICS_OBJECT_FILES",
-    "SM_ERROR_CANT_CREATE_CSS_OBJECT_FILES",
-    "SM_ERROR_CANT_CREATE_HTML_OBJECT_FILES",
-    "SM_ERROR_CANT_CREATE_JAVASCRIPT_OBJECT_FILES",
-    "SM_ERROR_CANT_CREATE_TTY_OBJECT_FILES",
-    "SM_ERROR_CANT_CREATE_NETWORK_OBJECT_FILES",
-    "SM_ERROR_CANT_CREATE_API_OBJECT_FILES",
-    "SM_ERROR_THREAD_CREATION_FAILED",
-    "SM_ERROR_INSTALL_ALL_LIBRARY_FAILED",
-    "SM_ERROR_INSTALL_ALL_EXTERNAL_LIBRARY_FAILED",
-    "SM_ERROR_INSTALL_ALL_WEB_BROWSER_FAILED",
-    "SM_ERROR_INSTALL_ALL_LOGO_FAILED",
-    "SM_ERROR_BUILD_WEB_BROWSER_FAILED",
-};
-
-unsigned int SM_RESULTS_PP_COUNT = sizeof(SM_RESULTS_PP) / sizeof(SM_RESULTS_PP[0]);
-
diff --git a/external/selfmake/src/lib/Common/Result.h b/external/selfmake/src/lib/Common/Result.h
deleted file mode 100644
index f0930c9..0000000
--- a/external/selfmake/src/lib/Common/Result.h
+++ /dev/null
@@ -1,108 +0,0 @@
-#ifndef SM_RESULT_H
-#define SM_RESULT_H
-
-#ifndef DOXYGEN_SHOULD_SKIP_THIS
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-#endif
-
-/** @addtogroup selfmakeAPIEnums
- *  @{
- */ 
-
-    /**
-     * Return values for functions.
-     */
-    typedef enum SM_RESULT 
-    {
-        SM_SUCCESS,
-        SM_ERROR_INVALID_OPTION,
-        SM_ERROR_NULL_POINTER,
-        SM_ERROR_BAD_STATE,
-        SM_ERROR_GENERATE_DOCUMENTS_FAILURE,
-        SM_ERROR_DOWNLOAD_FAILED,
-        SM_ERROR_BUILD_EXTERNAL_FAILED,
-        SM_ERROR_COPY_EXTERNAL_HEADER_FAILED,
-        SM_ERROR_COPY_PUBLIC_LIBRARY_HEADER_FAILED,
-        SM_ERROR_CREATE_LIBRARY_INCLUDES_FAILED,
-        SM_ERROR_BUILD_LIBRARY_FAILED,
-        SM_ERROR_WGET_EXECUTION_FAILED,
-        SM_ERROR_UNZIP_EXECUTION_FAILED,
-        SM_ERROR_DOXYGEN_EXECUTION_FAILED,
-        SM_ERROR_GCC_EXECUTION_FAILED,
-        SM_ERROR_AR_EXECUTION_FAILED,
-        SM_ERROR_XXD_EXECUTION_FAILED,
-        SM_ERROR_CP_EXECUTION_FAILED,
-        SM_ERROR_LIBRARY_NOT_FOUND,
-        SM_ERROR_WGET_NOT_FOUND,
-        SM_ERROR_UNZIP_NOT_FOUND,
-        SM_ERROR_DOXYGEN_NOT_FOUND,
-        SM_ERROR_GCC_NOT_FOUND,
-        SM_ERROR_AR_NOT_FOUND,
-        SM_ERROR_CP_NOT_FOUND,
-        SM_ERROR_GENERATE_VERSION_DEPENDENT_DOCS,
-        SM_ERROR_GENERATE_DOCS_USING_DOXYGEN,
-        SM_ERROR_GET_PROJECT_DIRECTORY,
-        SM_ERROR_GET_WORK_DIRECTORY,
-        SM_ERROR_CANT_OPEN_README,
-        SM_ERROR_CANT_OPEN_HEADER,
-        SM_ERROR_CANT_OPEN_DIR,
-        SM_ERROR_CANT_DOWNLOAD_VULKAN_HEADERS,
-        SM_ERROR_CANT_DOWNLOAD_VOLK,
-        SM_ERROR_CANT_DOWNLOAD_FREETYPE,
-        SM_ERROR_CANT_DOWNLOAD_OPENSSL,
-        SM_ERROR_CANT_DOWNLOAD_PROJECT,
-        SM_ERROR_BUILD_XXD_FAILED,
-        SM_ERROR_BUILD_HELPER_LIBRARY_FAILED,
-        SM_ERROR_NOT_IMPLEMENTED,
-        SM_ERROR_CANT_CREATE_DIRECTORY,
-        SM_ERROR_CANT_CREATE_OBJECT_FILE,
-        SM_ERROR_CANT_CREATE_OBJECTS,
-        SM_ERROR_CANT_CREATE_LIBRARY,
-        SM_ERROR_CANT_CREATE_EXTERNAL_BIN_DIRECTORY,
-        SM_ERROR_CANT_CREATE_EXTERNAL_BIN_OBJECT_DIRECTORY,
-        SM_ERROR_CANT_CREATE_BIN_OBJECT_DIRECTORY,
-        SM_ERROR_CANT_CREATE_BIN_DIRECTORY,
-        SM_ERROR_CANT_CREATE_SHARED_LIB,
-        SM_ERROR_CANT_CREATE_STATIC_LIB,
-        SM_ERROR_CANT_CREATE_INCLUDE_FILE,
-        SM_ERROR_CANT_CREATE_INCLUDE_DIRECTORY,
-        SM_ERROR_CANT_CREATE_EXTERNAL_DIRECTORY,
-        SM_ERROR_COPY_EXTERNAL_HEADER_USING_CP_FAILED,
-        SM_ERROR_COPY_PUBLIC_LIBRARY_HEADER_USING_CP_FAILED,
-        SM_ERROR_COPY_FAILED,
-        SM_ERROR_CANT_CREATE_NETZHAUT_OBJECT_FILES,
-        SM_ERROR_CANT_CREATE_IO_OBJECT_FILES,
-        SM_ERROR_CANT_CREATE_GRAPHICS_OBJECT_FILES,
-        SM_ERROR_CANT_CREATE_CSS_OBJECT_FILES,
-        SM_ERROR_CANT_CREATE_HTML_OBJECT_FILES,
-        SM_ERROR_CANT_CREATE_JAVASCRIPT_OBJECT_FILES,
-        SM_ERROR_CANT_CREATE_TTY_OBJECT_FILES,
-        SM_ERROR_CANT_CREATE_NETWORK_OBJECT_FILES,
-        SM_ERROR_CANT_CREATE_API_OBJECT_FILES,
-        SM_ERROR_THREAD_CREATION_FAILED,
-        SM_ERROR_INSTALL_ALL_LIBRARY_FAILED,
-        SM_ERROR_INSTALL_ALL_EXTERNAL_LIBRARY_FAILED,
-        SM_ERROR_INSTALL_ALL_WEB_BROWSER_FAILED,
-        SM_ERROR_INSTALL_ALL_LOGO_FAILED,
-        SM_ERROR_BUILD_WEB_BROWSER_FAILED,
-
-    } SM_RESULT;
-
-/** @} */
-
-/** @addtogroup selfmakeAPIVars 
- *  @{
- */ 
-
-    extern const char *SM_RESULTS_PP[];
-    extern unsigned int SM_RESULTS_PP_COUNT;
-
-/** @} */
-
-#endif
diff --git a/external/selfmake/src/lib/Common/Types.h b/external/selfmake/src/lib/Common/Types.h
deleted file mode 100644
index 16e8ed5..0000000
--- a/external/selfmake/src/lib/Common/Types.h
+++ /dev/null
@@ -1,129 +0,0 @@
-#ifndef SM_TYPES_H
-#define SM_TYPES_H
-
-#ifndef DOXYGEN_SHOULD_SKIP_THIS
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-/**
- * This file contains API-level types.
- */
-
-#include "Result.h"
-
-#endif
-
-/** @addtogroup selfmakeAPITypedefs
- *  @{
- */
-
-    typedef char           SM_BYTE;
-    typedef unsigned char  SM_UNSIGNED_BYTE;
-
-    typedef struct sm_Runtime sm_Runtime;
-
-/** @} */
-
-/** @addtogroup selfmakeAPIEnums
- *  @{
- */ 
-
-    /**
-     * Boolean values.
-     */
-    typedef enum SM_BOOL {
-        SM_FALSE = 0, /**<Indicates false.*/
-        SM_TRUE = 1,  /**<Indicates true.*/
-    } SM_BOOL;
-
-    typedef enum SM_TOKEN {
-        SM_TOKEN_UNDEFINED,
-        SM_TOKEN_COMMA,
-        SM_TOKEN_IDENTIFIER,
-        SM_TOKEN_STRING,
-        SM_TOKEN_CURLY_BRACKET_RIGHT,
-        SM_TOKEN_CURLY_BRACKET_LEFT,
-        SM_TOKEN_ROUND_BRACKET_RIGHT,
-        SM_TOKEN_ROUND_BRACKET_LEFT,
-        SM_TOKEN_ANGLE_BRACKET_RIGHT,
-        SM_TOKEN_ANGLE_BRACKET_LEFT,
-        SM_TOKEN_HYPHEN_MINUS,
-        SM_TOKEN_EOF,
-    } SM_TOKEN;
-
-    typedef enum SM_DEFINITION {
-        SM_DEFINITION_UNDEFINED,
-        SM_DEFINITION_OPTION,
-        SM_DEFINITION_FUNCTION,
-        SM_DEFINITION_BLOCK,
-        SM_DEFINITION_IF,
-    } SM_DEFINITION;
-
-    typedef enum SM_SOURCE_CONTEXT {
-        SM_SOURCE_CONTEXT_UNDEFINED,
-        SM_SOURCE_CONTEXT_SHARED_LIBRARY,
-        SM_SOURCE_CONTEXT_STATIC_LIBRARY,
-        SM_SOURCE_CONTEXT_BINARY,
-    } SM_SOURCE_CONTEXT;
-
-/** @} */
-
-/** @addtogroup selfmakeAPIStructs
- *  @{
- */
-
-    typedef struct sm_Function {
-        SM_DEFINITION type;
-        SM_BYTE *name_p;
-        unsigned int arguments;
-        SM_BYTE **arguments_pp;
-        SM_TOKEN *argumentTypes_p;
-    } sm_Function;
-
-    typedef struct sm_SourceContext {
-        SM_SOURCE_CONTEXT type;
-        SM_BYTE *path_p;
-        SM_BYTE *name_p;
-        SM_BYTE *compileArgs_p;
-        SM_BYTE *linkArgs_p;
-        SM_BYTE *outputPath_p;
-        long api, major, minor, patch;
-        long apiDate_p[3], majorDate_p[3], minorDate_p[3], patchDate_p[3];
-    } sm_SourceContext;
-
-    typedef struct sm_SourceContextArray {
-        int length;
-        int maxNameLength;
-        sm_SourceContext *SourceContexts_p;
-    } sm_SourceContextArray;
-
-    typedef struct sm_ValueArray {
-        SM_BYTE **values_pp;
-        int length;
-    } sm_ValueArray;
-
-    typedef struct sm_TestArgument {
-        SM_BYTE *p;
-    } sm_TestArgument;
-
-/** @} */
-
-/** @addtogroup selfmakeAPITypedefs
- *  @{
- */
-
-    typedef SM_RESULT (*sm_functionCallback_f)(
-        sm_Runtime *Runtime_p, sm_Function *Function_p
-    );
-
-    typedef SM_RESULT (*sm_sourceContextCallback_f)(
-        sm_Runtime *Runtime_p, sm_SourceContext *Context_p
-    );
-
-/** @} */
-
-#endif
diff --git a/external/selfmake/src/lib/Core/Binaries.c b/external/selfmake/src/lib/Core/Binaries.c
deleted file mode 100644
index b327a73..0000000
--- a/external/selfmake/src/lib/Core/Binaries.c
+++ /dev/null
@@ -1,151 +0,0 @@
-// LICENSE NOTICE ==================================================================================
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-// INCLUDE =========================================================================================
-
-#include "Binaries.h"
-#include "Util.h"
-#include "Main.h"
-
-#include "../Common/Macro.h"
-
-#include SM_FLOW
-#include SM_CUSTOM_CHECK
-
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <unistd.h>
-
-// BUILD BINARY ====================================================================================
-
-SM_RESULT sm_buildnhterminal()
-{
-SM_BEGIN()
-
-    char projDir_p[2048] = {'\0'};
-    SM_CHECK(SM_ERROR_GET_PROJECT_DIRECTORY, sm_getProjectDir(projDir_p, 2048))
-
-    // set -no-pie because of https://stackoverflow.com/questions/41398444/gcc-creates-mime-type-application-x-sharedlib-instead-of-application-x-applicati
-    static char command_p[2048] = {'\0'};
-    sprintf(command_p, "gcc -std=gnu99 -Wl,-rpath=%s/lib:/usr/local/lib -o%s/bin/nhterminal -no-pie -L%s/lib -lnetzhaut %s/src/bin/nhterminal/Terminal.c", projDir_p, projDir_p, projDir_p, projDir_p);
-
-    int status = system(command_p);
-    if (WEXITSTATUS(status) || WIFSIGNALED(status)) {SM_DIAGNOSTIC_END(SM_ERROR_GCC_EXECUTION_FAILED)}
-
-SM_DIAGNOSTIC_END(SM_SUCCESS)
-}
-
-SM_RESULT sm_buildnhwebbrowser()
-{
-SM_BEGIN()
-
-    char projDir_p[2048] = {'\0'};
-    SM_CHECK(SM_ERROR_GET_PROJECT_DIRECTORY, sm_getProjectDir(projDir_p, 2048))
-
-    // set -no-pie because of https://stackoverflow.com/questions/41398444/gcc-creates-mime-type-application-x-sharedlib-instead-of-application-x-applicati
-    static char command_p[2048] = {'\0'};
-    sprintf(command_p, "gcc -std=gnu99 -Wl,-rpath=%s/lib:/usr/local/lib -o%s/bin/nhwebbrowser -no-pie -L%s/lib -lnetzhaut %s/src/bin/nhwebbrowser/WebBrowser.c", projDir_p, projDir_p, projDir_p, projDir_p);
-
-    int status = system(command_p);
-    if (WEXITSTATUS(status) || WIFSIGNALED(status)) {SM_DIAGNOSTIC_END(SM_ERROR_GCC_EXECUTION_FAILED)}
-
-SM_DIAGNOSTIC_END(SM_SUCCESS)
-}
-
-// INSTALL BINARY ==================================================================================
-
-SM_RESULT sm_installnhterminal()
-{
-SM_BEGIN()
-
-    char wrkDir_p[2048] = {'\0'};
-    SM_CHECK_NULL(SM_ERROR_GET_WORK_DIRECTORY, getcwd(wrkDir_p, 2048))
-
-    char projDir_p[2048] = {'\0'};
-    SM_CHECK(SM_ERROR_GET_PROJECT_DIRECTORY, sm_getProjectDir(projDir_p, 2048))
-
-    chdir(projDir_p);
-
-    const char *homedir_p = sm_getHomeDir();
-    char dest_p[512] = {'\0'};
-
-    sprintf(dest_p, "%s/.local/share/applications/", homedir_p);
-    SM_CHECK(SM_ERROR_COPY_FAILED, sm_copy("src/bin/nhterminal/Common/Data/nhterminal.desktop", dest_p, SM_FALSE, SM_FALSE))
-    SM_CHECK(SM_ERROR_COPY_FAILED, sm_copy("bin/nhterminal", "/usr/local/bin", SM_FALSE, SM_TRUE))
-
-    chdir(wrkDir_p);
-
-SM_DIAGNOSTIC_END(SM_SUCCESS)
-}
-
-SM_RESULT sm_installnhwebbrowser()
-{
-SM_BEGIN()
-
-    char wrkDir_p[2048] = {'\0'};
-    SM_CHECK_NULL(SM_ERROR_GET_WORK_DIRECTORY, getcwd(wrkDir_p, 2048))
-
-    char projDir_p[2048] = {'\0'};
-    SM_CHECK(SM_ERROR_GET_PROJECT_DIRECTORY, sm_getProjectDir(projDir_p, 2048))
-
-    chdir(projDir_p);
-
-    const char *homedir_p = sm_getHomeDir();
-    char dest_p[512] = {'\0'};
-
-    sprintf(dest_p, "%s/.local/share/applications/", homedir_p);
-    SM_CHECK(SM_ERROR_COPY_FAILED, sm_copy("src/bin/nhwebbrowser/Common/Data/nhwebbrowser.desktop", dest_p, SM_FALSE, SM_FALSE))
-    SM_CHECK(SM_ERROR_COPY_FAILED, sm_copy("bin/nhwebbrowser", "/usr/local/bin", SM_FALSE, SM_TRUE))
-
-    chdir(wrkDir_p);
-
-SM_DIAGNOSTIC_END(SM_SUCCESS)
-}
-
-// INSTALL LOGO ====================================================================================
-
-SM_RESULT sm_installLogo()
-{
-SM_BEGIN()
-
-    char wrkDir_p[2048] = {'\0'};
-    SM_CHECK_NULL(SM_ERROR_GET_WORK_DIRECTORY, getcwd(wrkDir_p, 2048))
-
-    char projDir_p[2048] = {'\0'};
-    SM_CHECK(SM_ERROR_GET_PROJECT_DIRECTORY, sm_getProjectDir(projDir_p, 2048))
-
-    chdir(projDir_p);
-
-    const char *homedir_p = sm_getHomeDir();
-    char dest_p[512] = {'\0'};
-
-    sprintf(dest_p, "%s/.local/share/icons/hicolor/32x32/apps", homedir_p);
-    SM_CHECK(SM_ERROR_COPY_FAILED, sm_copy("docs/Logo/32x32/netzhaut.png", dest_p, SM_FALSE, SM_TRUE))
-
-    memset(dest_p, '\0', sizeof(char) * 512);
-    sprintf(dest_p, "%s/.local/share/icons/hicolor/64x64/apps", homedir_p);
-    SM_CHECK(SM_ERROR_COPY_FAILED, sm_copy("docs/Logo/64x64/netzhaut.png", dest_p, SM_FALSE, SM_TRUE))
-
-    memset(dest_p, '\0', sizeof(char) * 512);
-    sprintf(dest_p, "%s/.local/share/icons/hicolor/128x128/apps", homedir_p);
-    SM_CHECK(SM_ERROR_COPY_FAILED, sm_copy("docs/Logo/128x128/netzhaut.png", dest_p, SM_FALSE, SM_TRUE))
-
-    memset(dest_p, '\0', sizeof(char) * 512);
-    sprintf(dest_p, "%s/.local/share/icons/hicolor/256x256/apps", homedir_p);
-    SM_CHECK(SM_ERROR_COPY_FAILED, sm_copy("docs/Logo/256x256/netzhaut.png", dest_p, SM_FALSE, SM_TRUE))
-
-    memset(dest_p, '\0', sizeof(char) * 512);
-    sprintf(dest_p, "%s/.local/share/icons/hicolor/512x512/apps", homedir_p);
-    SM_CHECK(SM_ERROR_COPY_FAILED, sm_copy("docs/Logo/512x512/netzhaut.png", dest_p, SM_FALSE, SM_TRUE))
-
-    chdir(wrkDir_p);
-
-SM_DIAGNOSTIC_END(SM_SUCCESS)
-}
-
diff --git a/external/selfmake/src/lib/Core/Build.c b/external/selfmake/src/lib/Core/Build.c
deleted file mode 100644
index 079b940..0000000
--- a/external/selfmake/src/lib/Core/Build.c
+++ /dev/null
@@ -1,345 +0,0 @@
-// LICENSE NOTICE ==================================================================================
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-// INCLUDE =========================================================================================
-
-#include "Build.h"
-#include "Utils.h"
-
-#include "../UI/Message.h"
-#include "../Common/Macros/Macros.h"
-
-#include SM_FLOW
-#include SM_DEFAULT_CHECK
-
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <unistd.h>
-#include <pthread.h>
-#include <dirent.h>
-#include <errno.h>
-
-// CREATE BINARY ===================================================================================
-
-static SM_RESULT sm_createBinary(
-    sm_Runtime *Runtime_p, sm_SourceContext *SourceContext_p)
-{
-SM_BEGIN()
-
-    chdir(SourceContext_p->path_p);
-
-    SM_BYTE binPath_p[256] = {'\0'};
-    sprintf(binPath_p, "%s/%s", sm_getVariable(&Runtime_p->VariableArray, "BIN_DEST")->values_pp[0], SourceContext_p->name_p);
-    if (SourceContext_p->outputPath_p) {
-        sprintf(binPath_p, "%s/%s", SourceContext_p->outputPath_p, SourceContext_p->name_p);
-    }
-
-    int length = 0;
-    for (int i = 0; i < Runtime_p->SourceArray.length; ++i) {
-        sm_Source *Source_p = &Runtime_p->SourceArray.Sources_p[i];
-        if (Source_p->Context_p == SourceContext_p) {
-            length += strlen(Source_p->path_p) + 1;
-        }
-    }
-   
-    SM_BYTE *sources_p = malloc(length + 1);
-    SM_CHECK_NULL(sources_p)
-    memset(sources_p, 0, length + 1);
-
-    int offset = 0;
-    for (int i = 0; i < Runtime_p->SourceArray.length; ++i) {
-        sm_Source *Source_p = &Runtime_p->SourceArray.Sources_p[i];
-        if (Source_p->Context_p == SourceContext_p) {
-            sprintf(sources_p + strlen(sources_p), "%s ", Source_p->path_p);
-        }
-    }
-
-    int compileArgsLength = SourceContext_p->compileArgs_p ? strlen(SourceContext_p->compileArgs_p) : 0;
-    int linkArgsLength = SourceContext_p->linkArgs_p ? strlen(SourceContext_p->linkArgs_p) : 0;
-    int commandLength = strlen(sources_p) + compileArgsLength + linkArgsLength + strlen(binPath_p) + 128;
-    SM_BYTE *command_p = malloc(commandLength);
-    SM_CHECK_NULL(command_p)
-    memset(command_p, 0, commandLength);
-
-    SM_BYTE empty = 0;
-    SM_BYTE *linkArgs_p = SourceContext_p->linkArgs_p ? SourceContext_p->linkArgs_p : &empty;
-    SM_BYTE *compileArgs_p = SourceContext_p->compileArgs_p ? SourceContext_p->compileArgs_p : &empty;
-
-    // set -no-pie because of https://stackoverflow.com/questions/41398444/gcc-creates-mime-type-application-x-sharedlib-instead-of-application-x-applicati
-    sprintf(command_p, "gcc %s -o%s -no-pie %s %s", compileArgs_p, binPath_p, linkArgs_p, sources_p);
-    sm_messagef(command_p);
-
-    int status = system(command_p);
-    if (WEXITSTATUS(status) || WIFSIGNALED(status)) {SM_DIAGNOSTIC_END(SM_ERROR_GCC_EXECUTION_FAILED)}
-
-    chdir(sm_getVariable(&Runtime_p->VariableArray, "WRK_DIR")->values_pp[0]);
-
-    free(command_p);
-    free(sources_p);
-
-SM_DIAGNOSTIC_END(SM_SUCCESS)
-}
-
-// CREATE LIBRARY ==================================================================================
-
-static SM_RESULT sm_createSharedLibraryUsingGCC(
-    const SM_BYTE *objects_p, const SM_BYTE *out_p, SM_BYTE *compile_p, const SM_BYTE *link_p)
-{
-SM_BEGIN()
-
-    static SM_BYTE command_p[16384] = {'\0'};
-
-    sprintf(command_p, "gcc -shared %s %s %s -o %s", objects_p, compile_p, link_p, out_p);
-    sm_messagef(command_p);
-
-    int status = system(command_p);
-    if (WEXITSTATUS(status) || WIFSIGNALED(status)) {SM_DIAGNOSTIC_END(SM_ERROR_GCC_EXECUTION_FAILED)}
-
-SM_DIAGNOSTIC_END(SM_SUCCESS)
-}
-
-static SM_RESULT sm_createLibrary(
-    sm_Runtime *Runtime_p, sm_SourceContext *Context_p)
-{
-SM_BEGIN()
-
-    SM_BYTE empty = 0;
-    SM_BYTE *libName_p = Context_p->name_p;
-    SM_BYTE *linkArgs_p = Context_p->linkArgs_p ? Context_p->linkArgs_p : &empty;
-    SM_BYTE *compileArgs_p = Context_p->compileArgs_p ? Context_p->compileArgs_p : &empty;
-
-    int api   = Context_p->api; 
-    int major = Context_p->major; 
-    int minor = Context_p->minor; 
-    int patch = Context_p->patch;
-
-    SM_BYTE tmp_p[255] = {0};
-    sprintf(tmp_p, "/tmp/%s", sm_getVariable(&Runtime_p->VariableArray, "NAME")->values_pp[0]);
-    chdir(tmp_p);
-
-#if defined(__linux__) || defined(__APPLE__)
-
-    int index = 0;
-    SM_BYTE objects_p[16384] = {'\0'};
-
-    DIR *dir;
-    struct dirent *ent;
-    
-    if ((dir = opendir(tmp_p)) != NULL) 
-    {
-        while ((ent = readdir(dir)) != NULL) {
-            for (int i = 0; ent->d_name[i] != '\0' && ent->d_name[0] != '.'; ++i) {
-                objects_p[index++] = ent->d_name[i];
-            }
-            objects_p[index++] = ' ';
-        }
-        closedir(dir);
-    } 
-    else {SM_DIAGNOSTIC_END(SM_ERROR_CANT_OPEN_DIR)}
-
-    SM_BYTE *dest_p = sm_getVariable(&Runtime_p->VariableArray, "LIB_DEST")->values_pp[0];
-    if (Context_p->outputPath_p) {dest_p = Context_p->outputPath_p;}
-
-    SM_BYTE libPath_p[256] = {'\0'};
-    sprintf(libPath_p, "%s/lib%s.so.%d.%d.%d.%d", dest_p, libName_p, api, major, minor, patch);
-    SM_BYTE symPath1_p[256] = {'\0'};
-    sprintf(symPath1_p, "%s/lib%s.so.%d", dest_p, libName_p, api);
-    SM_BYTE symPath2_p[256] = {'\0'};
-    sprintf(symPath2_p, "%s/lib%s.so", dest_p, libName_p);
-  
-    SM_CHECK(sm_createSharedLibraryUsingGCC(objects_p, libPath_p, compileArgs_p, linkArgs_p))
-
-    memset(libPath_p, 0, 256); 
-    sprintf(libPath_p, "lib%s.so.%d.%d.%d.%d", libName_p, api, major, minor, patch);
-    sm_createSymLink(libPath_p, symPath1_p, SM_FALSE);
-    sm_createSymLink(libPath_p, symPath2_p, SM_FALSE);
-
-#endif 
-
-    chdir(sm_getVariable(&Runtime_p->VariableArray, "WRK_DIR")->values_pp[0]);
-
-SM_DIAGNOSTIC_END(SM_SUCCESS)
-}
-
-// COMPILE =========================================================================================
-
-static void sm_getObjectFileName(
-    sm_Source *Source_p, SM_BYTE *name_p)
-{
-SM_BEGIN()
-
-    SM_BYTE path_p[255] = {0};
-    strcpy(path_p, Source_p->path_p);
-
-    int index = strlen(path_p) - 1;
-    while (path_p[index] != '/' && index) {index--;}
-
-    SM_BYTE fileName_p[255] = {0};
-    strcpy(fileName_p, index ? path_p + index + 1 : path_p);
-
-    int tmp = index ? index - 1 : 0;
-    while (path_p[tmp] != '/' && tmp) {tmp--;}
-
-    if (index) {
-        path_p[index] = '\0';
-        sprintf(name_p, "%s%s.o", path_p + tmp, fileName_p);
-    }
-    else {
-        sprintf(name_p, "%s.o", fileName_p);
-    }
-
-SM_SILENT_END()
-}
-
-static SM_RESULT sm_createPICObjectFileUsingGCC(
-    const SM_BYTE *in_p, const SM_BYTE *out_p, SM_BYTE *compileArgs_p)
-{
-SM_BEGIN()
-
-    SM_BYTE realout_p[1024] = {'\0'};
-    realpath(out_p, realout_p);
-
-    SM_BYTE command_p[1024] = {'\0'};
-
-    if (compileArgs_p != NULL) {sprintf(command_p, "gcc -fPIC %s -c %s -o %s", compileArgs_p, in_p, out_p);}
-    else {sprintf(command_p, "gcc -fPIC -c %s -o %s", in_p, out_p);}
-
-    sm_messagef(command_p);
-
-    int status = system(command_p);
-    if (WEXITSTATUS(status) || WIFSIGNALED(status)) {SM_DIAGNOSTIC_END(SM_ERROR_GCC_EXECUTION_FAILED)}
-
-SM_DIAGNOSTIC_END(SM_SUCCESS)
-}
-
-static SM_RESULT sm_compileFiles(
-    sm_Runtime *Runtime_p, sm_SourceContext *Context_p)
-{
-SM_BEGIN()
-
-    chdir(Context_p->path_p);
-
-    for (int i = 0; i < Runtime_p->SourceArray.length; ++i) 
-    {
-        sm_Source *Source_p = &Runtime_p->SourceArray.Sources_p[i];
-
-        if (Source_p->Context_p == Context_p) 
-        {
-            SM_BYTE tmp_p[255] = {0};
-            SM_BYTE fileName_p[255] = {0};
-            sm_getObjectFileName(Source_p, fileName_p);
-
-            sprintf(tmp_p, "/tmp/%s/%s", sm_getVariable(&Runtime_p->VariableArray, "NAME")->values_pp[0], fileName_p);
-            SM_BYTE empty = 0;
-
-            if (Context_p->type == SM_SOURCE_CONTEXT_SHARED_LIBRARY) {
-                SM_CHECK(sm_createPICObjectFileUsingGCC(
-                        Source_p->path_p, tmp_p, Context_p->compileArgs_p ? Context_p->compileArgs_p : &empty
-                ))
-            }
-        }
-    }
-
-    chdir(sm_getVariable(&Runtime_p->VariableArray, "WRK_DIR")->values_pp[0]);
-
-SM_DIAGNOSTIC_END(SM_SUCCESS)
-}
-
-// INSTALL =========================================================================================
-
-//static SM_RESULT sm_installLibrary(
-//    SM_BYTE *libName_p, int major, int minor, int patch)
-//{
-//SM_BEGIN()
-//
-//    SM_BYTE wrkDir_p[2048] = {'\0'};
-//    SM_CHECK_NULL(SM_ERROR_GET_WORK_DIRECTORY, getcwd(wrkDir_p, 2048))
-//
-//    SM_BYTE projDir_p[2048] = {'\0'};
-//    SM_CHECK(SM_ERROR_GET_PROJECT_DIRECTORY, sm_getProjectDir(projDir_p, 2048))
-//
-//    chdir(projDir_p);
-//
-//    SM_BYTE libPath_p[512] = {'\0'};
-//    sprintf(libPath_p, "lib/lib%s.so.%d.%d.%d", libName_p, major, minor, patch);
-//
-//    SM_CHECK(SM_ERROR_COPY_FAILED, sm_copy(libPath_p, "/usr/local/lib", SM_FALSE, SM_TRUE))
-//
-//    chdir("/usr/local/lib");
-//
-//    SM_BYTE cpyPath_p[256] = {'\0'};
-//    sprintf(cpyPath_p, "lib%s.so.%d.%d.%d", libName_p, major, minor, patch);
-//    SM_BYTE symPath1_p[256] = {'\0'};
-//    sprintf(symPath1_p, "lib%s.so.%d", libName_p, major);
-//    SM_BYTE symPath2_p[256] = {'\0'};
-//    sprintf(symPath2_p, "lib%s.so", libName_p);
-//
-//    sm_createSymLink(cpyPath_p, symPath1_p, SM_TRUE);
-//    sm_createSymLink(cpyPath_p, symPath2_p, SM_TRUE);
-//
-//    chdir(wrkDir_p);
-//
-//SM_DIAGNOSTIC_END(SM_SUCCESS)
-//}
-
-// BUILD ===========================================================================================
-
-static SM_RESULT sm_buildSourceContext(
-    sm_Runtime *Runtime_p, sm_SourceContext *Context_p) 
-{
-SM_BEGIN()
-
-    SM_BYTE empty = 0;
-    SM_BYTE tmp_p[255];
-    sprintf(tmp_p, "/tmp/%s", sm_getVariable(&Runtime_p->VariableArray, "NAME")->values_pp[0]);
-
-    SM_CHECK(sm_createDir(tmp_p))
-
-    if (Runtime_p->beforeBuildCallback_f) {
-        SM_CHECK(Runtime_p->beforeBuildCallback_f(Runtime_p, Context_p))
-    }
-
-    if (Context_p->type == SM_SOURCE_CONTEXT_BINARY) {
-        SM_CHECK(sm_createBinary(Runtime_p, Context_p))
-    }
-    else {
-        SM_CHECK(sm_compileFiles(Runtime_p, Context_p))
-        SM_CHECK(sm_createLibrary(Runtime_p, Context_p))
-    }
-
-    if (Runtime_p->afterBuildCallback_f) {
-        SM_CHECK(Runtime_p->afterBuildCallback_f(Runtime_p, Context_p))
-    }
-
-//    if (install) {
-//        SM_CHECK(SM_ERROR_BAD_STATE, sm_installLibrary(
-//            Library_p->name_p, 0, 0, 0 
-//        ))
-//    }
-
-    SM_CHECK(sm_removeDir(tmp_p))
-
-SM_DIAGNOSTIC_END(SM_SUCCESS)
-}
-
-SM_RESULT sm_build(
-    sm_Runtime *Runtime_p, SM_BYTE *name_p)
-{
-SM_BEGIN()
-
-    for (int i = 0; i < Runtime_p->SourceContextArray.length; ++i) {
-        sm_SourceContext *SourceContext_p = &Runtime_p->SourceContextArray.SourceContexts_p[i];
-        if (!strcmp(SourceContext_p->name_p, name_p)) {
-            SM_CHECK(sm_buildSourceContext(Runtime_p, SourceContext_p))
-        }
-    }
-
-SM_DIAGNOSTIC_END(SM_SUCCESS)
-}
-
diff --git a/external/selfmake/src/lib/Core/Build.h b/external/selfmake/src/lib/Core/Build.h
deleted file mode 100644
index c54b5cf..0000000
--- a/external/selfmake/src/lib/Core/Build.h
+++ /dev/null
@@ -1,28 +0,0 @@
-#ifndef SM_BUILD_H
-#define SM_BUILD_H
-
-#ifndef DOXYGEN_SHOULD_SKIP_THIS
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-#include "../Parser/Functions.h"
-#include "../Common/Result.h"
-#include "../Common/Types.h"
-
-#endif
-
-/** @addtogroup selfmakeFunctions
- *  @{
- */
-
-    SM_RESULT sm_build(
-        sm_Runtime *Runtime_p, SM_BYTE *name_p
-    ); 
-
-/** @} */
-
-#endif
diff --git a/external/selfmake/src/lib/Core/Configure.c b/external/selfmake/src/lib/Core/Configure.c
deleted file mode 100644
index ff898c6..0000000
--- a/external/selfmake/src/lib/Core/Configure.c
+++ /dev/null
@@ -1,149 +0,0 @@
-// LICENSE NOTICE ==================================================================================
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-// INCLUDE =========================================================================================
-
-#include "Runtime.h"
-#include "Thread.h"
-#include "File.h"
-#include "../Parser/Functions.h"
-#include "../Parser/Variables.h"
-
-#include "../Common/Macros/Macros.h"
-#include SM_FLOW
-#include SM_DEFAULT_CHECK
-
-#include <stdio.h>
-#include <string.h>
-#include <stdlib.h>
-#include <ctype.h>
-#include <unistd.h>
-
-// ADD =============================================================================================
-
-SM_RESULT sm_addFile(
-    sm_Runtime *Runtime_p, SM_BYTE *path_p)
-{
-SM_BEGIN()
-
-    SM_CHECK_NULL(Runtime_p)
-    SM_CHECK_NULL(path_p)
-
-    SM_CHECK(sm_appendFile(&Runtime_p->FileArray, path_p))
-
-SM_DIAGNOSTIC_END(SM_SUCCESS)
-}
-
-// SET =============================================================================================
-
-void sm_setFunctionCallback(
-    sm_Runtime *Runtime_p, sm_functionCallback_f functionCallback_f)
-{
-SM_BEGIN()
-
-    Runtime_p->functionCallback_f = functionCallback_f;
-
-SM_SILENT_END()
-}
-
-void sm_setSourceContextCallback(
-    sm_Runtime *Runtime_p, sm_sourceContextCallback_f sourceContextCallback_f)
-{
-SM_BEGIN()
-
-    Runtime_p->sourceContextCallback_f = sourceContextCallback_f;
-
-SM_SILENT_END()
-}
-
-void sm_setBeforeBuildCallback(
-    sm_Runtime *Runtime_p, sm_sourceContextCallback_f sourceContextCallback_f)
-{
-SM_BEGIN()
-
-    Runtime_p->beforeBuildCallback_f = sourceContextCallback_f;
-
-SM_SILENT_END()
-}
-
-void sm_setAfterBuildCallback(
-    sm_Runtime *Runtime_p, sm_sourceContextCallback_f sourceContextCallback_f)
-{
-SM_BEGIN()
-
-    Runtime_p->afterBuildCallback_f = sourceContextCallback_f;
-
-SM_SILENT_END()
-}
-
-sm_SourceContextArray *sm_getSourceContextArray(
-    sm_Runtime *Runtime_p)
-{
-SM_BEGIN()
-SM_END(&Runtime_p->SourceContextArray)
-}
-
-sm_SourceContext *sm_getSourceContext(
-    sm_Runtime *Runtime_p, SM_BYTE *name_p)
-{
-SM_BEGIN()
-
-    for (int i = 0; i < Runtime_p->SourceContextArray.length; ++i) {
-        sm_SourceContext *Context_p = &Runtime_p->SourceContextArray.SourceContexts_p[i];
-        if (!strcmp(Context_p->name_p, name_p)) {SM_END(Context_p)}
-    }
-
-SM_END(NULL)
-}
-
-void sm_setQuiet(
-    sm_Runtime *Runtime_p, SM_BOOL quiet)
-{
-SM_BEGIN()
-
-    Runtime_p->quiet = quiet;
-
-SM_SILENT_END()
-}
-
-void sm_setShowParseTree(
-    sm_Runtime *Runtime_p, SM_BOOL showParseTree)
-{
-SM_BEGIN()
-
-    Runtime_p->showParseTree = showParseTree;
-
-SM_SILENT_END()
-}
-
-SM_RESULT sm_setVariable(
-    sm_Runtime *Runtime_p, SM_BYTE *variable_p, SM_BYTE **values_pp, int valueCount)
-{
-SM_BEGIN()
-SM_END(sm_updateVariable(&Runtime_p->VariableArray, variable_p, values_pp, valueCount))
-}
-
-sm_ValueArray sm_getVariableValues(
-    sm_Runtime *Runtime_p, SM_BYTE *variable_p)
-{
-SM_BEGIN()
-
-    sm_Variable *Variable_p = sm_getVariable(&Runtime_p->VariableArray, variable_p);
-
-    sm_ValueArray Values;
-    Values.values_pp = NULL;
-    Values.length = 0;
-
-    if (Variable_p) {
-        Values.values_pp = Variable_p->values_pp;
-        Values.length = Variable_p->valueCount;
-    }
-
-SM_END(Values)
-}
-
diff --git a/external/selfmake/src/lib/Core/Configure.h b/external/selfmake/src/lib/Core/Configure.h
deleted file mode 100644
index 8fd588d..0000000
--- a/external/selfmake/src/lib/Core/Configure.h
+++ /dev/null
@@ -1,60 +0,0 @@
-#ifndef SM_RUNTIME_H
-#define SM_RUNTIME_H
-
-#ifndef DOXYGEN_SHOULD_SKIP_THIS
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-#include "Source.h"
-
-#include "../Common/Result.h"
-#include "../Common/Types.h"
-
-#include "../Parser/Parser.h"
-#include "../Parser/Variables.h"
-
-#endif
-
-/** @addtogroup selfmakeStructs
- *  @{
- */
-
-    typedef struct sm_Runtime {
-        SM_BOOL quiet;
-        SM_BOOL GUI;
-        SM_BOOL showParseTree;
-        SM_BYTE *name_p;
-        SM_BYTE *prefix_p;
-        SM_BYTE *projectDirectory_p;
-        sm_ParserArray ParserArray;
-        sm_SourceArray SourceArray; 
-        sm_SourceContextArray SourceContextArray; 
-        sm_VariableArray VariableArray; 
-        sm_FileArray FileArray; 
-    } sm_Runtime;
-
-/** @} */
-
-/** @addtogroup selfmakeVars
- *  @{
- */
-
-    extern sm_Runtime SM_DEFAULT_RUNTIME;
-
-/** @} */
-
-/** @addtogroup selfmakeFunctions
- *  @{
- */
-
-    SM_RESULT sm_executeRuntime(
-        sm_Runtime *Runtime_p, SM_BYTE **args_pp, int args
-    );
-
-/** @} */
-
-#endif
diff --git a/external/selfmake/src/lib/Core/File.c b/external/selfmake/src/lib/Core/File.c
deleted file mode 100644
index 805db9a..0000000
--- a/external/selfmake/src/lib/Core/File.c
+++ /dev/null
@@ -1,199 +0,0 @@
-// LICENSE NOTICE ==================================================================================
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-// INCLUDE =========================================================================================
-
-#include "File.h"
-#include "Utils.h"
-
-#include "../UI/Message.h"
-#include "../Common/Macros/Macros.h"
-
-#include SM_FLOW
-#include SM_DEFAULT_CHECK
-
-#include <unistd.h>
-#include <string.h>
-#include <stdlib.h>
-#include <dlfcn.h>
-#include <stdio.h>
-#include <pwd.h>
-
-#if defined(__linux__) || defined(__APPLE__)
-    #include <sys/stat.h>
-    #include <sys/types.h>
-#endif
-
-// FILE ============================================================================================
-
-SM_BOOL sm_canFindSharedLib(
-    const SM_BYTE *lib_p)
-{
-SM_BEGIN()
-
-    SM_BYTE path_p[1024] = {'\0'};
-    sprintf(path_p, "/usr/lib/lib%s.so", lib_p);
-
-    if(access(path_p, F_OK) != -1) {SM_DIAGNOSTIC_END(SM_TRUE)}
-
-SM_DIAGNOSTIC_END(SM_FALSE)
-}
-
-SM_RESULT sm_copy(
-    sm_VariableArray *Array_p, SM_BYTE *in_p, SM_BYTE *out_p, SM_BOOL recursive, SM_BOOL sudo)
-{
-SM_BEGIN()
-
-    SM_BYTE realin_p[1024] = {'\0'}, realout_p[1024] = {'\0'};
-    realpath(out_p, realout_p);
-    realpath(in_p, realin_p);
-    sm_messagef(sudo ? "COPY %s TO %s \e[1;31mSUDO PREPENDED\e[0m" : "COPY %s TO %s", realin_p, realout_p);
-
-    if (!sm_canRunCommand("cp")) {SM_DIAGNOSTIC_END(SM_ERROR_CP_NOT_FOUND)}
-
-#if defined(__linux__) || defined(__APPLE__)
-
-    SM_BYTE command_p[32] = {'\0'};
-    sprintf(command_p, sudo ? "sudo cp" : "cp");
-    SM_BYTE fullCommand_p[1024] = {'\0'};
-
-    if (out_p[0] != '/') {
-        sprintf(fullCommand_p, recursive ? "%s -rp %s %s" : "%s -p %s %s", command_p, in_p, out_p);
-    }
-    else {
-        sprintf(fullCommand_p, recursive ? "%s -rp %s %s" : "%s -p %s %s", command_p, in_p, out_p);
-    }
-
-    int status = system(fullCommand_p);
-    if (WEXITSTATUS(status) || WIFSIGNALED(status)) {SM_DIAGNOSTIC_END(SM_ERROR_CP_EXECUTION_FAILED)}
-
-#elif defined(WIN_32)
-
-#endif
-
-SM_DIAGNOSTIC_END(SM_SUCCESS)
-}
-
-SM_RESULT sm_createSymLink(
-    SM_BYTE *filePath_p, SM_BYTE *symLinkPath_p, SM_BOOL sudo)
-{
-SM_BEGIN()
-
-#if defined(__linux__) || defined(__APPLE__)
-
-    if (!sm_canRunCommand("ln")) {SM_DIAGNOSTIC_END(SM_ERROR_CP_NOT_FOUND)}
-
-    SM_BYTE command_p[64] = {'\0'};
-    sprintf(command_p, sudo ? "sudo ln -s" : "ln -s");
-
-    SM_BYTE fullCommand_p[1024] = {'\0'};
-    sprintf(fullCommand_p, "%s %s %s", command_p, filePath_p, symLinkPath_p);
-
-    int status = system(fullCommand_p);
-    if (WEXITSTATUS(status) || WIFSIGNALED(status)) {SM_DIAGNOSTIC_END(SM_ERROR_CP_EXECUTION_FAILED)}
-
-#elif defined(WIN_32)
-
-#endif
-
-SM_DIAGNOSTIC_END(SM_SUCCESS)
-}
-
-SM_BOOL sm_fileExists(
-    SM_BYTE *filename_p)
-{
-SM_BEGIN()
-SM_END(access(filename_p, F_OK) != -1 ? SM_TRUE : SM_FALSE)
-}
-
-SM_RESULT sm_writeBytesToFile(
-    SM_BYTE *filename_p, SM_BYTE *bytes_p)
-{
-SM_BEGIN()
-
-    SM_CHECK_NULL(bytes_p)
-    SM_CHECK_NULL(filename_p)
-
-    FILE *f = fopen(filename_p, "w");
-    SM_CHECK_NULL(f)    
-    
-    fprintf(f, "%s\n", bytes_p);
-    fclose(f);
-
-SM_DIAGNOSTIC_END(SM_SUCCESS)
-}
-
-// FILE ARRAY ======================================================================================
-
-SM_BYTE *sm_getFileData(
-    const SM_BYTE* path_p, long *size_p)
-{
-SM_BEGIN()
-
-    FILE *fh = fopen(path_p, "rb");
-    if (fh == NULL) {SM_END(NULL)}
-    
-    if (fseek(fh, 0, SEEK_END) != 0) {SM_END(NULL)}
-    long size = ftell(fh);
-    rewind(fh);
-
-    if(size <= 0) {
-        fclose(fh);
-        SM_END(NULL)
-    }
-
-    SM_BYTE *data_p = malloc(size + 1); 
-    if (data_p == NULL) {SM_END(NULL)}
-    
-    fread(data_p, 1, size, fh);
-    fclose(fh);
-
-    data_p[size] = 0;
-    if (size_p != NULL) {*size_p = size;}
-
-SM_END(data_p)
-}
-
-void sm_initFileArray(
-    sm_FileArray *Array_p)
-{
-SM_BEGIN()
-
-    Array_p->length = 0;
-    Array_p->Files_p = NULL;
-
-SM_SILENT_END()
-}
-
-SM_RESULT sm_appendFile(
-    sm_FileArray *Array_p, SM_BYTE *path_p)
-{
-SM_BEGIN()
-
-    SM_BYTE *data_p = sm_getFileData(path_p, NULL);
-    SM_CHECK_NULL(data_p)
-
-    if (!Array_p->length) {
-        Array_p->Files_p = malloc(sizeof(sm_File));
-        SM_CHECK_NULL(Array_p->Files_p)       
-    }
-    else {
-        Array_p->Files_p = realloc(Array_p->Files_p, sizeof(sm_File) * (Array_p->length + 1));
-        SM_CHECK_NULL(Array_p->Files_p)       
-    }
-
-    Array_p->Files_p[Array_p->length].data_p = data_p;
-    Array_p->Files_p[Array_p->length].path_p = malloc(strlen(path_p) + 1);
-    SM_CHECK_NULL(Array_p->Files_p[Array_p->length].path_p)
-    strcpy(Array_p->Files_p[Array_p->length].path_p, path_p);
-
-    Array_p->length++;
-
-SM_DIAGNOSTIC_END(SM_SUCCESS)
-}
-
diff --git a/external/selfmake/src/lib/Core/File.h b/external/selfmake/src/lib/Core/File.h
deleted file mode 100644
index b5f04e0..0000000
--- a/external/selfmake/src/lib/Core/File.h
+++ /dev/null
@@ -1,67 +0,0 @@
-#ifndef SM_FILE_H
-#define SM_FILE_H
-
-#ifndef DOXYGEN_SHOULD_SKIP_THIS
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-#include "../Parser/Variables.h"
-
-#include "../Common/Result.h"
-#include "../Common/Types.h"
-
-#include <stddef.h>
-
-#endif
-
-/** @addtogroup selfmakeStructs
- *  @{
- */
-
-    typedef struct sm_File {
-        SM_BYTE *path_p;
-        SM_BYTE *data_p;
-    } sm_File;
-
-    typedef struct sm_FileArray {
-        int length;
-        sm_File *Files_p;
-    } sm_FileArray;
-
-/** @} */
-
-/** @addtogroup selfmakeFunctions
- *  @{
- */
-
-    SM_BOOL sm_canFindSharedLib(
-        const SM_BYTE *lib_p
-    );
-
-    SM_RESULT sm_copy(
-        sm_VariableArray *Array_p, SM_BYTE *in_p, SM_BYTE *out_p, SM_BOOL recursive, SM_BOOL sudo
-    );
-
-    SM_RESULT sm_createSymLink(
-        SM_BYTE *filePath_p, SM_BYTE *symLinkPath_p, SM_BOOL sudo
-    );
-
-    SM_BOOL sm_fileExists(
-        SM_BYTE *filename_p
-    );
-
-    void sm_initFileArray(
-        sm_FileArray *Array_p
-    );
-    
-    SM_RESULT sm_appendFile(
-        sm_FileArray *Array_p, SM_BYTE *path_p
-    );
-
-/** @} */
-
-#endif
diff --git a/external/selfmake/src/lib/Core/Options.c b/external/selfmake/src/lib/Core/Options.c
deleted file mode 100644
index 7b25535..0000000
--- a/external/selfmake/src/lib/Core/Options.c
+++ /dev/null
@@ -1,469 +0,0 @@
-// LICENSE NOTICE ==================================================================================
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-// INCLUDE =========================================================================================
-
-#include "Options.h"
-#include "Thread.h"
-#include "File.h"
-#include "Build.h"
-
-#include "../Parser/Functions.h"
-#include "../Parser/Variables.h"
-
-#include "../Common/Functions.h"
-#include "../Common/Macros/Macros.h"
-#include SM_FLOW
-#include SM_DEFAULT_CHECK
-
-#include <stdio.h>
-#include <string.h>
-#include <stdlib.h>
-#include <ctype.h>
-
-// HELPER ==========================================================================================
-
-static SM_BYTE *sm_offsetBuildArgumentPrefix(
-    sm_Runtime *Runtime_p, SM_BYTE *name_p)
-{
-SM_BEGIN()
-
-    sm_Variable *Prefix_p = sm_getVariable(&Runtime_p->VariableArray, "PREFIX");
-
-    if (Prefix_p) {
-        int offset = 0;
-        for (offset = 0; offset < strlen(Prefix_p->values_pp[0]) && offset < strlen(name_p) 
-            && Prefix_p->values_pp[0][offset] == name_p[offset]; ++offset) {};
-        if (offset == strlen(Prefix_p->values_pp[0])) {
-            SM_END(name_p + offset)
-        }
-    }
-
-SM_END(name_p)
-}
-
-// GET OPTION ======================================================================================
-
-static sm_Option *sm_getOptionFromBlock(
-    sm_Runtime *Runtime_p, sm_Block *Block_p, SM_BYTE *name_p, SM_BYTE **argv_pp, int args)
-{
-SM_BEGIN()
-
-    for (int d = 0; d < Block_p->definitions; ++d) 
-    {
-        switch (Block_p->Definitions_p[d].type)
-        {
-            case SM_DEFINITION_IF :
-                if (sm_compareIf(Runtime_p, &Block_p->Definitions_p[d].If, SM_TRUE)) {
-                    sm_Option *Option_p = sm_getOptionFromBlock(Runtime_p, &Block_p->Definitions_p[d].If.Block_p->Block, name_p, argv_pp, args);
-                    if (Option_p) {SM_END(Option_p)}
-                }
-                break;
-
-            case SM_DEFINITION_OPTION :
-                if (!strcmp(Block_p->Definitions_p[d].Option.name_p, name_p)
-                &&  Block_p->Definitions_p[d].Option.arguments == args) {
-                    SM_BOOL sameArguments = SM_TRUE;
-                    for (int i = 0; i < args; ++i) {
-                        SM_BYTE *argument_p = Block_p->Definitions_p[d].Option.arguments_pp[i];
-                        SM_BYTE *offsetArgument_p = argument_p;
-                        if (Block_p->Definitions_p[d].Option.name_p[0] == 'b' || Block_p->Definitions_p[d].Option.name_p[0] == 't') {
-                            offsetArgument_p = sm_offsetBuildArgumentPrefix(Runtime_p, argument_p);
-                        }
-                        if (strcmp(argument_p, argv_pp[i]) && strcmp(offsetArgument_p, argv_pp[i])) {
-                            sameArguments = SM_FALSE; 
-                            break;
-                        }
-                    }
-                    if (sameArguments) {
-                        SM_END(&Block_p->Definitions_p[d].Option)
-                    }
-                }
-                break;
-        }
-    }
-
-SM_END(NULL)
-}
-
-static sm_Option *sm_getOptionFromParser(
-    sm_Runtime *Runtime_p, sm_Parser *Parser_p, SM_BYTE *name_p, SM_BYTE **argv_pp, int args)
-{
-SM_BEGIN()
-
-    sm_Block Block;
-    Block.definitions = Parser_p->definitions;
-    Block.Definitions_p = Parser_p->Definitions_p;
-
-SM_END(sm_getOptionFromBlock(Runtime_p, &Block, name_p, argv_pp, args))
-}
-
-static sm_Option *sm_getShortOptions(
-    sm_Runtime *Runtime_p, SM_BYTE *name_p, SM_BYTE **argv_pp, int args, int *options_p)
-{
-SM_BEGIN()
-
-    *options_p = 0;
-
-    sm_Option *Options_p = NULL;
-    SM_BYTE c = 0;
-
-    for (int i = 0; i < strlen(name_p); ++i) 
-    {
-        if (i + 1 < strlen(name_p)) {
-            c = name_p[i+1];
-            name_p[i+1] = 0;
-        }
-
-        sm_Option *Option_p = NULL;
-        for (int j = 0; j < Runtime_p->ParserArray.length; ++j) {
-            sm_Parser *Parser_p = &Runtime_p->ParserArray.Parsers_p[j];
-            Option_p = sm_getOptionFromParser(Runtime_p, Parser_p, name_p+i, argv_pp, args);
-            if (Option_p) {break;}
-        }
-
-        if (Option_p) {
-            if (*options_p == 0) {
-                Options_p = Option_p;
-            }
-            else if (*options_p == 1) {
-                sm_Option *Tmp_p = malloc(sizeof(sm_Option)*2);
-                Tmp_p[0] = *Options_p;
-                Tmp_p[1] = *Option_p;
-                Options_p = Tmp_p;
-            }
-            else {
-                Options_p = realloc(Options_p, sizeof(sm_Option)*(*options_p+1));
-                Options_p[*options_p] = *Option_p;
-            }
-            *options_p += 1;
-        }
-
-        if (c != 0) {
-            name_p[i+1] = c;
-            c = 0;
-        }
-    }
-
-SM_END(Options_p)
-}
-
-static sm_Option *sm_getOption(
-    sm_Runtime *Runtime_p, SM_BYTE *name_p, SM_BYTE **argv_pp, int args)
-{
-SM_BEGIN()
-
-    sm_Option *Option_p = NULL;
-
-    for (int j = 0; j < Runtime_p->ParserArray.length; ++j) {
-        sm_Parser *Parser_p = &Runtime_p->ParserArray.Parsers_p[j];
-        Option_p = sm_getOptionFromParser(Runtime_p, Parser_p, name_p, argv_pp, args);
-        if (Option_p) {break;}
-    }
-
-SM_END(Option_p)
-}
-
-// OPTION NAME =====================================================================================
-
-static SM_BOOL sm_optionNameExistsInBlock(
-    sm_Runtime *Runtime_p, sm_Block *Block_p, SM_BYTE *name_p)
-{
-SM_BEGIN()
-
-    for (int d = 0; d < Block_p->definitions; ++d) {
-        switch (Block_p->Definitions_p[d].type) {
-            case SM_DEFINITION_OPTION :
-                if (!strcmp(Block_p->Definitions_p[d].Option.name_p, name_p)) {
-                    SM_END(SM_TRUE)
-                }
-                break;
-            case SM_DEFINITION_IF :
-                if (sm_compareIf(Runtime_p, &Block_p->Definitions_p[d].If, SM_TRUE)) {
-                    if (sm_optionNameExistsInBlock(Runtime_p, &Block_p->Definitions_p[d].If.Block_p->Block, name_p)) {
-                        SM_END(SM_TRUE)
-                    }
-                }
-                break;
-        }
-          
-    } 
-
-SM_END(SM_FALSE)
-}
-
-static SM_BOOL sm_optionNameExists(
-    sm_Runtime *Runtime_p, SM_BYTE *name_p)
-{
-SM_BEGIN()
-
-    for (int i = 0; i < Runtime_p->ParserArray.length; ++i) {
-        sm_Parser *Parser_p = &Runtime_p->ParserArray.Parsers_p[i];
-        sm_Block Block;
-        Block.definitions = Parser_p->definitions;
-        Block.Definitions_p = Parser_p->Definitions_p;
-        if (sm_optionNameExistsInBlock(Runtime_p, &Block, name_p)) {
-            SM_END(SM_TRUE)
-        } 
-    }
-
-SM_END(SM_FALSE)
-}
-
-// EXECUTE OPTION ==================================================================================
-
-static SM_RESULT sm_printOption(
-    sm_Option *Option_p)
-{
-SM_BEGIN()
-
-    SM_BYTE args_p[1024]; // TODO malloc
-    memset(args_p, 0, 1024);
-    for (int i = 0; i < Option_p->arguments; ++i) {
-        sprintf(args_p + strlen(args_p), "%s ", Option_p->arguments_pp[i]); 
-    }
-
-    sm_operationf(Option_p->longOption ? "--%s %s'%s'" : "-%s %s'%s'", Option_p->name_p, args_p, Option_p->description_p);
-
-SM_DIAGNOSTIC_END(SM_SUCCESS)
-}
-
-static SM_RESULT sm_executeOption(
-    sm_Runtime *Runtime_p, sm_Option *Option_p)
-{
-SM_BEGIN()
-
-    SM_CHECK(sm_printOption(Option_p))
-
-    if (!Option_p->Block_p) {
-        if (!strcmp(Option_p->name_p, "b")) {
-            SM_CHECK(sm_build(Runtime_p, Option_p->arguments_pp[0]))
-        }
-        else if (!strcmp(Option_p->name_p, "i")) {
-        }
-        else if (!strcmp(Option_p->name_p, "t")) {
-            SM_CHECK(sm_test(Runtime_p, Option_p->arguments_pp[0]))
-        }
-        else {SM_DIAGNOSTIC_END(SM_ERROR_BAD_STATE)}
-    }
-    else {
-        SM_CHECK(sm_executeBlock(Runtime_p, &Option_p->Block_p->Block))
-    }
-
-SM_DIAGNOSTIC_END(SM_SUCCESS)
-}
-
-// BUILD OPTIONS ===================================================================================
-
-static SM_BOOL sm_buildOptionOverride(
-    sm_Runtime *Runtime_p, SM_BYTE *name_p)
-{
-SM_BEGIN()
-
-    for (int j = 0; j < Runtime_p->ParserArray.length; ++j)
-    {
-        sm_Parser *Parser_p = &Runtime_p->ParserArray.Parsers_p[j];
-
-        for (int i = 0; i < Parser_p->definitions; ++i) 
-        {
-            sm_Definition *Definition_p = &Parser_p->Definitions_p[i];
-
-            if (Definition_p->type == SM_DEFINITION_OPTION 
-            &&  !Definition_p->Option.longOption
-            &&  !strcmp(Definition_p->Option.name_p, "b") 
-            &&  Definition_p->Option.arguments == 1 
-            &&  (!strcmp(Definition_p->Option.arguments_pp[0], name_p) || !strcmp(sm_offsetBuildArgumentPrefix(Runtime_p, Definition_p->Option.arguments_pp[0]), name_p))) {
-                SM_END(SM_TRUE)
-            }
-        }
-    }
-
-SM_END(SM_FALSE)
-}
-
-SM_RESULT sm_addBuildOption(
-    sm_Runtime *Runtime_p, SM_BYTE *name_p)
-{
-SM_BEGIN()
-
-    if (sm_buildOptionOverride(Runtime_p, name_p)) {SM_DIAGNOSTIC_END(SM_SUCCESS)}
-
-    static SM_BYTE *option_p = "b";
-
-    sm_Parser *Parser_p = &Runtime_p->ParserArray.Parsers_p[0];
-
-    Parser_p->Definitions_p = realloc(Parser_p->Definitions_p, sizeof(sm_Definition) * (Parser_p->definitions + 1));
-    SM_CHECK_NULL(Parser_p->Definitions_p)
-
-    sm_Definition *Definition_p = &Parser_p->Definitions_p[Parser_p->definitions++];
-
-    SM_BYTE *description_p = malloc(strlen(name_p) + 7);
-    SM_CHECK_NULL(description_p)
-    sprintf(description_p, "build %s", name_p);
-
-    SM_BYTE *argument_p = malloc(strlen(name_p) + 1);
-    SM_CHECK_NULL(argument_p)
-    strcpy(argument_p, name_p);
-
-    SM_BYTE **arguments_pp = malloc(sizeof(SM_BYTE*));
-    SM_CHECK_NULL(arguments_pp)
-    arguments_pp[0] = argument_p;
-
-    Definition_p->type = SM_DEFINITION_OPTION;
-    Definition_p->Option.arguments     = 1;
-    Definition_p->Option.arguments_pp  = arguments_pp;
-    Definition_p->Option.longOption    = SM_FALSE;
-    Definition_p->Option.name_p        = option_p;
-    Definition_p->Option.description_p = description_p;
-    Definition_p->Option.Block_p       = NULL;
-
-    sm_messagef("Generate Option '-b %s'", name_p);
-
-SM_DIAGNOSTIC_END(SM_SUCCESS)
-}
-
-SM_RESULT sm_addTestOption(
-    sm_Runtime *Runtime_p, SM_BYTE *name_p)
-{
-SM_BEGIN()
-
-    static SM_BYTE *option_p = "t";
-
-    sm_Parser *Parser_p = &Runtime_p->ParserArray.Parsers_p[0];
-
-    Parser_p->Definitions_p = realloc(Parser_p->Definitions_p, sizeof(sm_Definition) * (Parser_p->definitions + 1));
-    SM_CHECK_NULL(Parser_p->Definitions_p)
-
-    sm_Definition *Definition_p = &Parser_p->Definitions_p[Parser_p->definitions++];
-
-    SM_BYTE *description_p = malloc(strlen(name_p) + 7);
-    SM_CHECK_NULL(description_p)
-    sprintf(description_p, "test %s", name_p);
-
-    SM_BYTE *argument_p = malloc(strlen(name_p) + 1);
-    SM_CHECK_NULL(argument_p)
-    strcpy(argument_p, name_p);
-
-    SM_BYTE **arguments_pp = malloc(sizeof(SM_BYTE*));
-    SM_CHECK_NULL(arguments_pp)
-    arguments_pp[0] = argument_p;
-
-    Definition_p->type = SM_DEFINITION_OPTION;
-    Definition_p->Option.arguments     = 1;
-    Definition_p->Option.arguments_pp  = arguments_pp;
-    Definition_p->Option.longOption    = SM_FALSE;
-    Definition_p->Option.name_p        = option_p;
-    Definition_p->Option.description_p = description_p;
-    Definition_p->Option.Block_p       = NULL;
-
-    sm_messagef("Generate Option '-t %s'", name_p);
-
-SM_DIAGNOSTIC_END(SM_SUCCESS)
-}
-
-// PARSE ===========================================================================================
-
-static SM_RESULT sm_parseShortOption(
-    sm_Runtime *Runtime_p, int argc, SM_BYTE **argv_pp, int *advance_p)
-{
-SM_BEGIN()
-
-    SM_BOOL match = SM_FALSE;
-    int options = 0;
-    sm_Option *Options_p = NULL;
-
-    *advance_p = 1;
-
-    for (int i = 1; i < argc; ++i) 
-    {
-        if (argv_pp[i][0] == '-') {
-            break;
-        }
-
-        Options_p = sm_getShortOptions(Runtime_p, &argv_pp[0][1], &argv_pp[i], 1, &options);
-        if (Options_p) {
-            for (int j = 0; j < options; ++j) {
-                SM_CHECK(sm_executeOption(Runtime_p, Options_p+j))
-            }
-            if (options > 1) {free(Options_p);}
-            Options_p = NULL;
-            match = SM_TRUE;
-        }
-
-        *advance_p += 1;
-    }
-
-    if (Options_p) {
-        for (int i = 0; i < options; ++i) {
-            SM_CHECK(sm_executeOption(Runtime_p, Options_p+i))
-        }
-        if (options > 1) {free(Options_p);}
-    }
-
-SM_DIAGNOSTIC_END(SM_SUCCESS)
-}
-
-static SM_RESULT sm_parseLongOption(
-    sm_Runtime *Runtime_p, int argc, SM_BYTE **argv_pp, int *advance_p)
-{
-SM_BEGIN()
-
-    SM_BOOL match = SM_FALSE;
-    sm_Option *Option_p = NULL;
-
-    for (int i = 0; i < argc; ++i) 
-    {
-        if (i > 0 && argv_pp[i][0] == '-') {
-            break;
-        }
-
-        sm_Option *NewOption_p = 
-            sm_getOption(Runtime_p, &argv_pp[0][2], i == 0 ? NULL : &argv_pp[1], *advance_p);
-
-        if (NewOption_p) {
-            Option_p = NewOption_p;
-        }
-        else {
-            sm_noticef("Invalid option \"%s\"", argv_pp[i]);
-            SM_DIAGNOSTIC_END(SM_ERROR_INVALID_OPTION)
-        }
-
-        *advance_p += 1;
-    }
-
-    if (Option_p) {
-        SM_CHECK(sm_executeOption(Runtime_p, Option_p))
-    }
- 
-SM_DIAGNOSTIC_END(SM_SUCCESS)
-}
-
-SM_RESULT sm_parseOption(
-    sm_Runtime *Runtime_p, int argc, SM_BYTE **argv_pp, int *advance_p)
-{
-SM_BEGIN()
-
-    int advance = 0;
-
-    for (int i = 0; i < argc; i += advance) 
-    {
-        advance = 0;
-
-        if (argv_pp[i][0] == '-' && argv_pp[i][1] != '-') {
-            SM_CHECK(sm_parseShortOption(Runtime_p, argc-i, &argv_pp[i], &advance))
-        }
-        else if (argv_pp[i][0] == '-' && argv_pp[i][1] == '-') {
-            SM_CHECK(sm_parseLongOption(Runtime_p, argc-i, &argv_pp[i], &advance))
-        }
-
-        *advance_p += advance;
-    }
-
-SM_DIAGNOSTIC_END(SM_SUCCESS)
-}
-
diff --git a/external/selfmake/src/lib/Core/Options.h b/external/selfmake/src/lib/Core/Options.h
deleted file mode 100644
index 170aa88..0000000
--- a/external/selfmake/src/lib/Core/Options.h
+++ /dev/null
@@ -1,40 +0,0 @@
-#ifndef SM_OPTIONS_H
-#define SM_OPTIONS_H
-
-#ifndef DOXYGEN_SHOULD_SKIP_THIS
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-#include "Source.h"
-
-#include "../Common/Result.h"
-#include "../Common/Types.h"
-
-#include "../Parser/Parser.h"
-#include "../Parser/Variables.h"
-
-#endif
-
-/** @addtogroup selfmakeFunctions
- *  @{
- */
-
-    SM_RESULT sm_addBuildOption(
-        sm_Runtime *Runtime_p, SM_BYTE *name_p
-    );
-
-    SM_RESULT sm_addTestOption(
-        sm_Runtime *Runtime_p, SM_BYTE *name_p
-    );
-
-    SM_RESULT sm_parseOption(
-        sm_Runtime *Runtime_p, int argc, SM_BYTE **argv_pp, int *advance_p
-    );
-
-/** @} */
-
-#endif
diff --git a/external/selfmake/src/lib/Core/Runtime.c b/external/selfmake/src/lib/Core/Runtime.c
deleted file mode 100644
index 57830f5..0000000
--- a/external/selfmake/src/lib/Core/Runtime.c
+++ /dev/null
@@ -1,267 +0,0 @@
-// LICENSE NOTICE ==================================================================================
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-// INCLUDE =========================================================================================
-
-#include "Runtime.h"
-#include "Thread.h"
-#include "File.h"
-#include "Build.h"
-#include "Options.h"
-
-#include "../Parser/Functions.h"
-#include "../Parser/Variables.h"
-
-#include "../Common/Functions.h"
-#include "../Common/Macros/Macros.h"
-#include SM_FLOW
-#include SM_DEFAULT_CHECK
-
-#include <stdio.h>
-#include <string.h>
-#include <stdlib.h>
-#include <ctype.h>
-
-// VARS ============================================================================================
-
-sm_Runtime SM_DEFAULT_RUNTIME;
-
-// HELPER ==========================================================================================
-
-SM_BYTE *sm_getSourceContextName(
-    sm_Runtime *Runtime_p, sm_SourceContext *SourceContext_p)
-{
-SM_BEGIN()
-
-    sm_Variable *Prefix_p = sm_getVariable(&Runtime_p->VariableArray, "PREFIX");
-
-    if (!Prefix_p) {
-        SM_END(SourceContext_p->name_p)
-    }
-
-    int offset = 0;
-    for (int i = 0; i < strlen(Prefix_p->values_pp[0]) && i < strlen(SourceContext_p->name_p); ++i) {
-        if (Prefix_p->values_pp[0][i] != SourceContext_p->name_p[i]) {
-            break;
-        }
-        offset++;
-    }
-
-SM_END(SourceContext_p->name_p + offset)
-}
-
-// PARSE ===========================================================================================
-
-static SM_RESULT sm_parseArguments(
-    sm_Runtime *Runtime_p, int argc, SM_BYTE **argv_pp)
-{
-SM_BEGIN()
-
-    for (int i = 0; i < argc; ++i) {
-        int advance = 0;
-        SM_CHECK(sm_parseOption(Runtime_p, argc - i, &argv_pp[i], &advance))
-        i += advance - 1;
-    }
-
-SM_DIAGNOSTIC_END(SM_SUCCESS)
-}
-
-// RUN =============================================================================================
-
-SM_BYTE **sm_processArguments(
-    sm_VariableArray *Variables_p, SM_BYTE **args_pp, int args, int *processedArgCount_p)
-{
-SM_BEGIN()
-
-#include SM_CUSTOM_CHECK
-
-    int processedArgCount = 0;
-    SM_BYTE **processedArgs_pp = malloc(sizeof(SM_BYTE*)); 
-    SM_CHECK_NULL(NULL, processedArgs_pp)    
-
-    for (int i = 0; i < args; ++i) 
-    {
-        sm_Variable *Variable_p = sm_getVariable(Variables_p, args_pp[i]);
-        if (Variable_p) {
-            for (int j = 0; j < Variable_p->valueCount; ++j) {
-                processedArgs_pp[processedArgCount] = malloc(strlen(Variable_p->values_pp[j]) + 1);
-                SM_CHECK_NULL(NULL, processedArgs_pp[processedArgCount])
-                strcpy(processedArgs_pp[processedArgCount++], Variable_p->values_pp[j]);
-                processedArgs_pp = realloc(processedArgs_pp, sizeof(SM_BYTE*) * (processedArgCount + 1));
-                SM_CHECK_NULL(NULL, processedArgs_pp)
-            } 
-        }
-        else {
-            processedArgs_pp[processedArgCount] = malloc(strlen(args_pp[i]) + 1);
-            SM_CHECK_NULL(NULL, processedArgs_pp[processedArgCount])
-            strcpy(processedArgs_pp[processedArgCount++], args_pp[i]);
-            processedArgs_pp = realloc(processedArgs_pp, sizeof(SM_BYTE*) * (processedArgCount + 1));
-            SM_CHECK_NULL(NULL, processedArgs_pp)
-        }
-    }
-
-#include SM_DEFAULT_CHECK
-
-    *processedArgCount_p = processedArgCount;
-
-SM_END(processedArgs_pp)
-}
-
-static SM_RESULT sm_executeGlobalFunctions(
-    sm_Runtime *Runtime_p, sm_Parser *Parser_p)
-{
-SM_BEGIN()
-
-    if (Parser_p->executed) {SM_END(SM_SUCCESS)}
-
-    sm_Block Block;
-    Block.definitions = Parser_p->definitions;
-    Block.Definitions_p = Parser_p->Definitions_p;
-
-    SM_CHECK(sm_executeBlock(Runtime_p, &Block))
-
-    Parser_p->executed = SM_TRUE;
-
-SM_END(SM_SUCCESS)
-}
-
-SM_RESULT sm_executeRuntime(
-    sm_Runtime *Runtime_p, SM_BYTE **args_pp, int args)
-{
-SM_BEGIN()
-
-    for (int i = 0; i < Runtime_p->FileArray.length; ++i) 
-    {
-        SM_CHECK(sm_appendParser(
-            &Runtime_p->ParserArray, &Runtime_p->FileArray.Files_p[i], Runtime_p->showParseTree
-        ))
-
-        sm_operationf("Execute Global Functions");
-        sm_Parser *Parser_p = &Runtime_p->ParserArray.Parsers_p[Runtime_p->ParserArray.length - 1];
-
-        if (Parser_p->executed) {continue;}
-        SM_CHECK(sm_executeGlobalFunctions(Runtime_p, Parser_p))
-        Parser_p->executed = SM_TRUE;
-
-        sm_Variable *All_p = sm_getVariable(&Runtime_p->VariableArray, "ALL");
-        for (int j = 0; All_p && j < All_p->valueCount; ++j) {
-            SM_CHECK(sm_addBuildOption(Runtime_p, All_p->values_pp[j]))
-            SM_CHECK(sm_addTestOption(Runtime_p, All_p->values_pp[j]))
-        }
-    }
-    
-    int processedArgs = 0;
-    SM_BYTE **processedArgs_pp = sm_processArguments(&Runtime_p->VariableArray, args_pp, args, &processedArgs);
-    SM_CHECK_NULL(processedArgs_pp)
-
-    SM_RESULT result = sm_parseArguments(Runtime_p, processedArgs, processedArgs_pp);
-
-    for (int i = 0; i < processedArgs; ++i) {
-        free(processedArgs_pp[i]);
-    }
-    free(processedArgs_pp);
-
-    SM_CHECK(sm_exitMessage(result))
-
-SM_DIAGNOSTIC_END(SM_SUCCESS)
-}
-
-SM_RESULT sm_run(
-    sm_Runtime *Runtime_p, int argc, SM_BYTE **argv_pp)
-{
-SM_BEGIN()
-SM_DIAGNOSTIC_END(sm_runThread(Runtime_p, argv_pp, argc))
-} 
-
-// CREATE ==========================================================================================
-
-static SM_RESULT sm_initRuntime(
-    sm_Runtime *Runtime_p)
-{
-SM_BEGIN()
-
-    Runtime_p->showParseTree = SM_TRUE;
-    Runtime_p->GUI = SM_FALSE;
-    Runtime_p->quiet = SM_FALSE;
-
-    Runtime_p->functionCallback_f      = NULL;
-    Runtime_p->sourceContextCallback_f = NULL;
-    Runtime_p->beforeBuildCallback_f   = NULL;
-    Runtime_p->afterBuildCallback_f    = NULL;
-
-    sm_initFileArray(&Runtime_p->FileArray);
-    sm_initParserArray(&Runtime_p->ParserArray);
-    sm_initTestArray(&Runtime_p->TestArray);
-    sm_initSourceArray(&Runtime_p->SourceArray);
-    sm_initSourceContextArray(&Runtime_p->SourceContextArray);
-    sm_initVariableArray(&Runtime_p->VariableArray);
-
-    SM_BYTE *wrk_p = sm_getWorkDirectory();
-
-    sm_updateVariable(&Runtime_p->VariableArray, "WRK_DIR", &wrk_p, 1);
-    sm_updateVariable(&Runtime_p->VariableArray, "PROJ_DIR", &wrk_p, 1);
-    sm_updateVariable(&Runtime_p->VariableArray, "LIB_DEST", &wrk_p, 1);
-    sm_updateVariable(&Runtime_p->VariableArray, "BIN_DEST", &wrk_p, 1);
-
-    SM_BYTE *true_p = "true";
-
-#ifdef __APPLE__
-    sm_updateVariable(&Runtime_p->VariableArray, "MAC", &true_p, 1);
-#elif WIN32 
-    sm_updateVariable(&Runtime_p->VariableArray, "WINDOWS", &true_p, 1);
-#elif __linux__
-    sm_updateVariable(&Runtime_p->VariableArray, "LINUX", &true_p, 1);
-#endif
-
-SM_DIAGNOSTIC_END(SM_SUCCESS)
-}
-
-sm_Runtime *sm_createRuntime(
-    SM_BYTE *name_p)
-{
-SM_BEGIN()
-
-#include SM_CUSTOM_CHECK
-
-    SM_CHECK_NULL(NULL, name_p)
-
-    sm_Runtime *Runtime_p = malloc(sizeof(sm_Runtime));
-    SM_CHECK_NULL(NULL, Runtime_p)
-
-    SM_CHECK(NULL, sm_initRuntime(Runtime_p))
-
-    sm_updateVariable(&Runtime_p->VariableArray, "NAME", &name_p, 1);
-
-#include SM_DEFAULT_CHECK
-
-SM_END(Runtime_p)
-}
-
-void sm_destroyRuntime(
-    sm_Runtime *Runtime_p)
-{
-SM_BEGIN()
-SM_SILENT_END()
-}
-
-// INITIALIZE/TERMINATE ============================================================================
-
-SM_RESULT sm_initialize()
-{
-    sm_initThreadPool();
-    SM_CHECK(sm_initRuntime(&SM_DEFAULT_RUNTIME))
-    SM_BYTE *name_p = "selfmake";
-    sm_updateVariable(&SM_DEFAULT_RUNTIME.VariableArray, "NAME", &name_p, 1);
-}
-
-void sm_terminate()
-{
-SM_BEGIN()
-SM_SILENT_END()
-}
-
diff --git a/external/selfmake/src/lib/Core/Runtime.h b/external/selfmake/src/lib/Core/Runtime.h
deleted file mode 100644
index 5c9efd8..0000000
--- a/external/selfmake/src/lib/Core/Runtime.h
+++ /dev/null
@@ -1,65 +0,0 @@
-#ifndef SM_RUNTIME_H
-#define SM_RUNTIME_H
-
-#ifndef DOXYGEN_SHOULD_SKIP_THIS
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-#include "Source.h"
-
-#include "../Common/Result.h"
-#include "../Common/Types.h"
-
-#include "../Parser/Parser.h"
-#include "../Parser/Variables.h"
-
-#include "../Test/Test.h"
-
-#endif
-
-/** @addtogroup selfmakeStructs
- *  @{
- */
-
-    typedef struct sm_Runtime {
-        SM_BOOL quiet;
-        SM_BOOL GUI;
-        SM_BOOL showParseTree;
-        SM_BYTE *prefix_p;
-        sm_ParserArray ParserArray;
-        sm_SourceArray SourceArray; 
-        sm_TestArray TestArray;
-        sm_SourceContextArray SourceContextArray; 
-        sm_VariableArray VariableArray; 
-        sm_FileArray FileArray; 
-        sm_functionCallback_f functionCallback_f;
-        sm_sourceContextCallback_f sourceContextCallback_f;
-        sm_sourceContextCallback_f beforeBuildCallback_f;
-        sm_sourceContextCallback_f afterBuildCallback_f;
-    } sm_Runtime;
-
-/** @} */
-
-/** @addtogroup selfmakeVars
- *  @{
- */
-
-    extern sm_Runtime SM_DEFAULT_RUNTIME;
-
-/** @} */
-
-/** @addtogroup selfmakeFunctions
- *  @{
- */
-
-    SM_RESULT sm_executeRuntime(
-        sm_Runtime *Runtime_p, SM_BYTE **args_pp, int args
-    );
-
-/** @} */
-
-#endif
diff --git a/external/selfmake/src/lib/Core/Source.c b/external/selfmake/src/lib/Core/Source.c
deleted file mode 100644
index 5987e77..0000000
--- a/external/selfmake/src/lib/Core/Source.c
+++ /dev/null
@@ -1,317 +0,0 @@
-// LICENSE NOTICE ==================================================================================
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-// INCLUDE =========================================================================================
-
-#include "Source.h"
-#include "Runtime.h"
-
-#include "../Common/Macros/Macros.h"
-#include SM_FLOW
-#include SM_DEFAULT_CHECK
-
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <unistd.h>
-#include <ctype.h>
-
-// INIT ============================================================================================
-
-void sm_initSourceContextArray(
-    sm_SourceContextArray *Array_p)
-{
-SM_BEGIN()
-
-    Array_p->length = 0;
-    Array_p->maxNameLength = 0;
-    Array_p->SourceContexts_p = NULL;
-
-SM_SILENT_END()
-}
-
-static sm_SourceContext sm_initSourceContext(
-    SM_SOURCE_CONTEXT type)
-{
-SM_BEGIN()
-
-    sm_SourceContext SourceContext;
-
-    SourceContext.type = type;
-    SourceContext.path_p = NULL;
-    SourceContext.compileArgs_p = NULL;
-    SourceContext.linkArgs_p = NULL;
-    SourceContext.api = 0;
-    SourceContext.major = 0;
-    SourceContext.minor = 0;
-    SourceContext.patch = 0;
-    SourceContext.outputPath_p = NULL;
-    memset(SourceContext.apiDate_p, 0, sizeof(long) * 3);
-    memset(SourceContext.majorDate_p, 0, sizeof(long) * 3);
-    memset(SourceContext.minorDate_p, 0, sizeof(long) * 3);
-    memset(SourceContext.patchDate_p, 0, sizeof(long) * 3);
-
-SM_END(SourceContext)
-}
-
-void sm_initSourceArray(
-    sm_SourceArray *Array_p)
-{
-SM_BEGIN()
-
-    Array_p->length = 0;
-    Array_p->Sources_p = NULL;
-
-SM_SILENT_END()
-}
-
-static sm_Source sm_initSource()
-{
-SM_BEGIN()
-
-    sm_Source Source;
-    Source.Context_p = NULL;
-    Source.path_p = NULL;
-
-SM_END(Source)
-}
-
-// INDENT ==========================================================================================
-
-void sm_getIndentAfterSourceContext(
-    SM_BYTE *name_p, SM_BYTE *buffer_p, int size, sm_SourceContextArray *Array_p)
-{
-SM_BEGIN()
-
-    memset(buffer_p, 0, size);
-    int diff = Array_p->maxNameLength - strlen(name_p);
-    for (int i = 0; i < diff; ++i) {buffer_p[i] = ' ';}
-
-SM_SILENT_END()
-}
-
-// ADD =============================================================================================
-
-static SM_BOOL sm_matchSourceContext(
-    sm_SourceContext *SourceContext_p, SM_SOURCE_CONTEXT type)
-{
-SM_BEGIN()
-
-    if (type != SM_SOURCE_CONTEXT_UNDEFINED) {
-        if (type == SM_SOURCE_CONTEXT_BINARY && SourceContext_p->type != SM_SOURCE_CONTEXT_BINARY) {
-            SM_END(SM_FALSE)
-        }
-        if ((type == SM_SOURCE_CONTEXT_SHARED_LIBRARY || type == SM_SOURCE_CONTEXT_STATIC_LIBRARY) && SourceContext_p->type == SM_SOURCE_CONTEXT_BINARY) {
-            SM_END(SM_FALSE)
-        }
-    }
-
-SM_END(SM_TRUE)
-}
-
-SM_RESULT sm_addSourceContext(
-    sm_Runtime *Runtime_p, sm_Function *Function_p, SM_SOURCE_CONTEXT type, int offset)
-{
-SM_BEGIN()
-
-    sm_SourceContextArray *Array_p = &Runtime_p->SourceContextArray;
-
-    if (Function_p->arguments < 1) {SM_DIAGNOSTIC_END(SM_ERROR_BAD_STATE)}
-
-    if (!Array_p->SourceContexts_p) {
-        Array_p->SourceContexts_p = malloc(sizeof(sm_SourceContext));
-        SM_CHECK_NULL(Array_p->SourceContexts_p)
-    }
-    else {
-        Array_p->SourceContexts_p = realloc(Array_p->SourceContexts_p, sizeof(sm_SourceContext) * (Array_p->length + 1));
-        SM_CHECK_NULL(Array_p->SourceContexts_p)
-    }
-
-    sm_SourceContext *SourceContext_p = &Array_p->SourceContexts_p[Array_p->length];
-    *SourceContext_p = sm_initSourceContext(type);
-
-    int index = offset;
-
-    SourceContext_p->name_p = malloc(strlen(Function_p->arguments_pp[index]) + 1);
-    SM_CHECK_NULL(SourceContext_p->name_p)
-    strcpy(SourceContext_p->name_p, Function_p->arguments_pp[index++]);
-
-    if (Function_p->arguments > index) {
-        SourceContext_p->path_p = malloc(strlen(Function_p->arguments_pp[index]) + 1);
-        SM_CHECK_NULL(SourceContext_p->path_p)
-        strcpy(SourceContext_p->path_p, Function_p->arguments_pp[index++]);
-    }
-
-    if (Function_p->arguments > index) {
-        SourceContext_p->outputPath_p = malloc(strlen(Function_p->arguments_pp[index]) + 1);
-        SM_CHECK_NULL(SourceContext_p->outputPath_p)
-        strcpy(SourceContext_p->outputPath_p, Function_p->arguments_pp[index++]);
-    }
-
-    if (Function_p->arguments > index) {
-        SourceContext_p->major = strtol(Function_p->arguments_pp[index++], NULL, 10);
-    }
-
-    if (Function_p->arguments > index) {
-        SourceContext_p->minor = strtol(Function_p->arguments_pp[index++], NULL, 10);
-    }
-
-    if (Function_p->arguments > index) {
-        SourceContext_p->patch = strtol(Function_p->arguments_pp[index++], NULL, 10);
-    }
-
-    if (strlen(SourceContext_p->name_p) > Array_p->maxNameLength) {
-        Array_p->maxNameLength = strlen(SourceContext_p->name_p);
-    }
-
-    Array_p->length++;
-
-    SM_CHECK(sm_appendToVariable(&Runtime_p->VariableArray, "ALL", &Function_p->arguments_pp[offset], 1))
-
-    if (type == SM_SOURCE_CONTEXT_BINARY) {
-        SM_CHECK(sm_appendToVariable(&Runtime_p->VariableArray, "BINS", &Function_p->arguments_pp[offset], 1))
-    }
-    else {
-        SM_CHECK(sm_appendToVariable(&Runtime_p->VariableArray, "LIBS", &Function_p->arguments_pp[offset], 1))
-    }
-
-    switch (type)
-    {
-        case SM_SOURCE_CONTEXT_BINARY :
-            sm_messagef("Add binary [%s]", SourceContext_p->name_p);
-            break;
-        case SM_SOURCE_CONTEXT_SHARED_LIBRARY :
-            sm_messagef("Add shared library [%s]", SourceContext_p->name_p);
-            break;
-        case SM_SOURCE_CONTEXT_STATIC_LIBRARY :
-            sm_messagef("Add static library [%s]", SourceContext_p->name_p);
-            break;
-    }
-
-SM_END(SM_SUCCESS)
-}
-
-// ARGUMENTS =======================================================================================
-
-SM_RESULT sm_addCompileArguments(
-    sm_SourceContextArray *ContextArray_p, sm_Function *Function_p, SM_SOURCE_CONTEXT type)
-{
-SM_BEGIN()
-
-    if (Function_p->arguments < 2) {SM_DIAGNOSTIC_END(SM_ERROR_BAD_STATE)}
-
-    sm_SourceContext *Context_p = NULL;
-    for (int j = 0; j < ContextArray_p->length; ++j) {
-        if (!sm_matchSourceContext(ContextArray_p->SourceContexts_p+j, type)) {
-            continue;
-        }
-        if (!strcmp(ContextArray_p->SourceContexts_p[j].name_p, Function_p->arguments_pp[0])) {
-            Context_p = &ContextArray_p->SourceContexts_p[j];
-        }
-    }
-
-    if (!Context_p) {SM_DIAGNOSTIC_END(SM_ERROR_LIBRARY_NOT_FOUND)}
-
-    Context_p->compileArgs_p = malloc(strlen(Function_p->arguments_pp[1]) + 1);
-    SM_CHECK_NULL(Context_p->compileArgs_p)
-    sprintf(Context_p->compileArgs_p, Function_p->arguments_pp[1]);
-
-    SM_BYTE offset_p[64];
-    sm_getIndentAfterSourceContext(Context_p->name_p, offset_p, 64, ContextArray_p);
-    sm_messagef("[%s]%s Set compile arguments \"%s\"", Context_p->name_p, offset_p, Context_p->compileArgs_p);
-
-SM_END(SM_SUCCESS)
-}
-
-SM_RESULT sm_addLinkArguments(
-    sm_SourceContextArray *ContextArray_p, sm_Function *Function_p, SM_SOURCE_CONTEXT type)
-{
-SM_BEGIN()
-
-    if (Function_p->arguments != 2) {SM_DIAGNOSTIC_END(SM_ERROR_BAD_STATE)}
-
-    sm_SourceContext *Context_p = NULL;
-    for (int j = 0; j < ContextArray_p->length; ++j) {
-        if (!sm_matchSourceContext(ContextArray_p->SourceContexts_p+j, type)) {
-            continue;
-        }
-        if (!strcmp(ContextArray_p->SourceContexts_p[j].name_p, Function_p->arguments_pp[0])) {
-            Context_p = &ContextArray_p->SourceContexts_p[j];
-        }
-    }
-
-    if (!Context_p) {SM_DIAGNOSTIC_END(SM_ERROR_LIBRARY_NOT_FOUND)}
-
-    Context_p->linkArgs_p = malloc(strlen(Function_p->arguments_pp[1]) + 1);
-    SM_CHECK_NULL(Context_p->linkArgs_p)
-    sprintf(Context_p->linkArgs_p, Function_p->arguments_pp[1]);
-
-    SM_BYTE offset_p[64];
-    sm_getIndentAfterSourceContext(Context_p->name_p, offset_p, 64, ContextArray_p);
-    sm_messagef("[%s]%s Set link arguments \"%s\"", Context_p->name_p, offset_p, Context_p->linkArgs_p);
-
-SM_END(SM_SUCCESS)
-}
-
-// SOURCES =========================================================================================
-
-SM_RESULT sm_addSource(
-    sm_SourceContextArray *ContextArray_p, sm_SourceArray *SourceArray_p, sm_Function *Function_p, 
-    SM_SOURCE_CONTEXT type)
-{
-SM_BEGIN()
-
-    sm_SourceContext *Context_p = NULL;
-
-    for (int i = 0; i < Function_p->arguments; ++i) 
-    {
-        if (Function_p->argumentTypes_p[i] == SM_TOKEN_IDENTIFIER) {
-            for (int j = 0; j < ContextArray_p->length; ++j) {
-                if (!sm_matchSourceContext(ContextArray_p->SourceContexts_p+j, type)) {
-                    continue;
-                }
-                if (!strcmp(ContextArray_p->SourceContexts_p[j].name_p, Function_p->arguments_pp[i])) {
-                    Context_p = &ContextArray_p->SourceContexts_p[j];
-                }
-            }
-        }
-        else {
-
-            if (!Context_p) {
-                if (!ContextArray_p->length) {SM_DIAGNOSTIC_END(SM_ERROR_BAD_STATE)}
-                Context_p = ContextArray_p->SourceContexts_p;
-            }
-
-            if (!SourceArray_p->Sources_p) {
-                SourceArray_p->Sources_p = malloc(sizeof(sm_Source));
-                SM_CHECK_NULL(SourceArray_p->Sources_p)
-            }
-            else {
-                SourceArray_p->Sources_p = realloc(SourceArray_p->Sources_p, sizeof(sm_Source) * (SourceArray_p->length + 1));
-                SM_CHECK_NULL(SourceArray_p->Sources_p)
-            }
-        
-            sm_Source *Source_p = &SourceArray_p->Sources_p[SourceArray_p->length];
-            *Source_p = sm_initSource();
-
-            Source_p->Context_p = Context_p;
-            Source_p->path_p = malloc(strlen(Function_p->arguments_pp[i]) + 1);
-            SM_CHECK_NULL(Source_p->path_p)
-            sprintf(Source_p->path_p, Function_p->arguments_pp[i]);
-        
-            SourceArray_p->length++;
-
-            SM_BYTE offset_p[64];
-            sm_getIndentAfterSourceContext(Context_p->name_p, offset_p, 64, ContextArray_p);
-            sm_messagef("[%s]%s Add source file (%d) \"%s\"", Context_p->name_p, offset_p, Context_p->type, Source_p->path_p);
-        }
-    }
-
-SM_DIAGNOSTIC_END(SM_SUCCESS)
-}
-
diff --git a/external/selfmake/src/lib/Core/Source.h b/external/selfmake/src/lib/Core/Source.h
deleted file mode 100644
index df9e313..0000000
--- a/external/selfmake/src/lib/Core/Source.h
+++ /dev/null
@@ -1,68 +0,0 @@
-#ifndef SM_SOURCE_H
-#define SM_SOURCE_H
-
-#ifndef DOXYGEN_SHOULD_SKIP_THIS
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-#include "../Common/Types.h"
-#include "../Common/Result.h"
-
-#endif
-
-/** @addtogroup selfmakeStructs
- *  @{
- */
-
-    typedef struct sm_Source {
-        sm_SourceContext *Context_p;
-        SM_BYTE *path_p;
-    } sm_Source;
-
-    typedef struct sm_SourceArray {
-        int length;
-        sm_Source *Sources_p;
-    } sm_SourceArray;
-
-/** @} */
-
-/** @addtogroup selfmakeFunctions
- *  @{
- */
-
-    void sm_initSourceArray(
-        sm_SourceArray *Array_p
-    );
-
-    SM_RESULT sm_addSource(
-        sm_SourceContextArray *ContextArray_p, sm_SourceArray *SourceArray_p, sm_Function *Function_p,
-        SM_SOURCE_CONTEXT type
-    );
-
-    void sm_initSourceContextArray(
-        sm_SourceContextArray *Array_p
-    );
-
-    void sm_getIndentAfterSourceContext(
-        SM_BYTE *name_p, SM_BYTE *buffer_p, int size, sm_SourceContextArray *Array_p
-    );
-
-    SM_RESULT sm_addSourceContext(
-        sm_Runtime *Runtime_p, sm_Function *Function_p, SM_SOURCE_CONTEXT type, int offset
-    );
-
-    SM_RESULT sm_addCompileArguments(
-        sm_SourceContextArray *ContextArray_p, sm_Function *Function_p, SM_SOURCE_CONTEXT type
-    );
-    
-    SM_RESULT sm_addLinkArguments(
-        sm_SourceContextArray *Array_p, sm_Function *Function_p, SM_SOURCE_CONTEXT type
-    );
-
-/** @} */
-
-#endif
diff --git a/external/selfmake/src/lib/Core/Thread.h b/external/selfmake/src/lib/Core/Thread.h
deleted file mode 100644
index 498d24f..0000000
--- a/external/selfmake/src/lib/Core/Thread.h
+++ /dev/null
@@ -1,70 +0,0 @@
-#ifndef SM_THREAD_H
-#define SM_THREAD_H
-
-#ifndef DOXYGEN_SHOULD_SKIP_THIS
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-#include "../Core/Runtime.h"
-
-#include "../Common/Types.h"
-#include "../Common/Result.h"
-
-#include <stdint.h>
-#include <stdlib.h>
-#include <stdbool.h>
-    
-#if defined(__linux__) || defined(__APPLE__)
-#include <pthread.h>
-#elif defined(_WIN32) || defined(WIN32)
-#include <windows.h>
-#endif
-
-#endif
-
-/** @addtogroup selfmakeMacros
- *  @{
- */
-
-    #define SM_MAX_THREADS 64
-
-/** @} */
-
-/** @addtogroup selfmakeStructs
- *  @{
- */
-
-    typedef struct sm_Thread {
-        int depth;
-        SM_BOOL running;
-        sm_Runtime *Runtime_p;
-    #if defined(__linux__) || defined(__APPLE__)
-        pthread_t id;              
-    #elif defined(_WIN32) || defined (WIN32)
-        DWORD id;              
-    #endif
-    } sm_Thread;
-
-/** @} */
-
-/** @addtogroup selfmakeFunctions
- *  @{
- */
-
-    void sm_initThreadPool(
-    );
-    
-    SM_RESULT sm_runThread(
-        sm_Runtime *Runtime_p, SM_BYTE **args_pp, int args
-    );
-
-    sm_Thread *_sm_getThread(
-    );
-    
-/** @} */
-
-#endif 
diff --git a/external/selfmake/src/lib/Core/Utils.h b/external/selfmake/src/lib/Core/Utils.h
deleted file mode 100644
index 69d34b2..0000000
--- a/external/selfmake/src/lib/Core/Utils.h
+++ /dev/null
@@ -1,40 +0,0 @@
-#ifndef SM_UTILS_H
-#define SM_UTILS_H
-
-#ifndef DOXYGEN_SHOULD_SKIP_THIS
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-#include "../Common/Result.h"
-#include "../Common/Types.h"
-
-#include <stddef.h>
-
-#endif
-
-/** @addtogroup selfmakeFunctions
- *  @{
- */
-
-    const SM_BYTE *sm_getHomeDir(
-    );
-
-    SM_RESULT sm_createDir(
-        SM_BYTE *path_p
-    );
-    
-    SM_RESULT sm_removeDir(
-        SM_BYTE *path_p
-    );
-
-    SM_BOOL sm_canRunCommand(
-        const SM_BYTE *cmd
-    );
-
-/** @} */
-
-#endif
diff --git a/external/selfmake/src/lib/Parser/Functions.c b/external/selfmake/src/lib/Parser/Functions.c
deleted file mode 100644
index 5bc130f..0000000
--- a/external/selfmake/src/lib/Parser/Functions.c
+++ /dev/null
@@ -1,275 +0,0 @@
-// LICENSE NOTICE ==================================================================================
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-// INCLUDE =========================================================================================
-
-#include "Functions.h"
-#include "Variables.h"
-
-#include "../Core/Build.h"
-#include "../Core/Utils.h"
-#include "../UI/Message.h"
-#include "../Common/Macros/Macros.h"
-#include SM_FLOW
-#include SM_DEFAULT_CHECK
-
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <unistd.h>
-#include <ctype.h>
-
-#include <sys/types.h> 
-#include <sys/stat.h>
-
-// HELPER ==========================================================================================
-
-static SM_BOOL sm_caseInsensitiveMatch(
-    SM_BYTE *str1_p, SM_BYTE *str2_p)
-{
-SM_BEGIN()
-
-    if (strlen(str1_p) != strlen(str2_p)) {SM_END(SM_FALSE)}
-
-    for (int i = 0; i < strlen(str1_p); ++i) {
-        int d = tolower((unsigned char)str1_p[i]) - tolower((unsigned char)str2_p[i]);
-        if (d != 0) {
-            SM_END(SM_FALSE)
-        }
-    }
-   
-SM_END(SM_TRUE)
-}
-
-// EXECUTE =========================================================================================
-
-static SM_RESULT sm_executeCopyFunction(
-    sm_Runtime *Runtime_p, sm_Function *Function_p)
-{
-SM_BEGIN()
-
-    if (Function_p->arguments <= 0 || Function_p->arguments > 4) {SM_DIAGNOSTIC_END(SM_ERROR_BAD_STATE)}
-
-    switch(Function_p->arguments)
-    {
-        case 2 :
-            sm_copy(&Runtime_p->VariableArray, Function_p->arguments_pp[0], Function_p->arguments_pp[1], SM_FALSE, SM_FALSE);
-            break;
-        case 3 :
-            sm_copy(&Runtime_p->VariableArray, Function_p->arguments_pp[0], Function_p->arguments_pp[1], !strcmp(Function_p->arguments_pp[2], "true") ? SM_TRUE : SM_FALSE, SM_FALSE);
-            break;
-        case 4 :
-            sm_copy(&Runtime_p->VariableArray, Function_p->arguments_pp[0], Function_p->arguments_pp[1], !strcmp(Function_p->arguments_pp[2], "true") ? SM_TRUE : SM_FALSE, !strcmp(Function_p->arguments_pp[3], "true") ? SM_TRUE : SM_FALSE);
-            break;
-    }
-
-SM_END(SM_SUCCESS)
-}
-
-static SM_RESULT sm_executeChdirFunction(
-    sm_Runtime *Runtime_p, sm_Function *Function_p)
-{
-SM_BEGIN()
-
-    if (Function_p->arguments == 0) {
-        sm_updateVariable(&Runtime_p->VariableArray, "WRK_DIR", sm_getVariable(&Runtime_p->VariableArray, "PROJ_DIR")->values_pp, 1);
-    }
-    else {
-        sm_updateVariable(&Runtime_p->VariableArray, "WRK_DIR", Function_p->arguments_pp, 1);
-    }
-
-    sm_messagef("chdir %s", sm_getVariable(&Runtime_p->VariableArray, "WRK_DIR")->values_pp[0]);
-
-SM_END(SM_SUCCESS)
-}
-
-static SM_RESULT sm_executeMkdirFunction(
-    sm_Function *Function_p)
-{
-SM_BEGIN()
-
-    if (Function_p->arguments != 1) {SM_DIAGNOSTIC_END(SM_SUCCESS)}
-
-    struct stat st = {0};
-    if (stat(Function_p->arguments_pp[0], &st) == -1) {
-        int err = mkdir(Function_p->arguments_pp[0], 0755);  // 0755 -> drwxr-xr-x
-        if (err != 0) {
-            SM_DIAGNOSTIC_END(SM_ERROR_CANT_CREATE_DIRECTORY)
-        }
-    }
-
-    sm_messagef("mkdir %s", Function_p->arguments_pp[0]);
-
-SM_END(SM_SUCCESS)
-}
-
-static SM_RESULT sm_executeSystemFunction(
-    sm_Function *Function_p)
-{
-SM_BEGIN()
-
-    if (Function_p->arguments != 1) {SM_DIAGNOSTIC_END(SM_ERROR_BAD_STATE)}
-    sm_messagef("system %s", Function_p->arguments_pp[0]);
-    system(Function_p->arguments_pp[0]);
-
-SM_END(SM_SUCCESS)
-}
-
-SM_RESULT sm_executeFunction(
-    sm_Runtime *Runtime_p, sm_Function *Function_p) 
-{
-SM_BEGIN()
-
-    SM_BYTE **arguments_pp = malloc(sizeof(SM_BYTE*) * Function_p->arguments);
-    memcpy(arguments_pp, Function_p->arguments_pp, sizeof(SM_BYTE*) * Function_p->arguments);
-
-    for (int i = 0; i < Function_p->arguments; ++i) {
-        Function_p->arguments_pp[i] = sm_substituteVariables(&Runtime_p->VariableArray, arguments_pp[i]);
-        SM_CHECK_NULL(Function_p->arguments_pp[i])
-    }
-    SM_RESULT result = SM_SUCCESS;
-
-    if (sm_caseInsensitiveMatch(Function_p->name_p, "lib")) {
-        if (!strcmp(Function_p->arguments_pp[0], "SHARED")) {
-            result = sm_addSourceContext(Runtime_p, Function_p, SM_SOURCE_CONTEXT_SHARED_LIBRARY, 1);
-        }
-        else if (!strcmp(Function_p->arguments_pp[0], "STATIC")) {
-            result = sm_addSourceContext(Runtime_p, Function_p, SM_SOURCE_CONTEXT_STATIC_LIBRARY, 1);
-        }
-        else {
-            result = sm_addSourceContext(Runtime_p, Function_p, SM_SOURCE_CONTEXT_SHARED_LIBRARY, 0);
-        }
-        if (!result && Runtime_p->sourceContextCallback_f) {
-            result = Runtime_p->sourceContextCallback_f(
-                Runtime_p, &Runtime_p->SourceContextArray.SourceContexts_p[Runtime_p->SourceContextArray.length - 1]
-            );
-        }
-    }
-    else if (sm_caseInsensitiveMatch(Function_p->name_p, "bin")) {
-        result = sm_addSourceContext(Runtime_p, Function_p, SM_SOURCE_CONTEXT_BINARY, 0);
-        if (!result && Runtime_p->sourceContextCallback_f) {
-            result = Runtime_p->sourceContextCallback_f(
-                Runtime_p, &Runtime_p->SourceContextArray.SourceContexts_p[Runtime_p->SourceContextArray.length - 1]
-            );
-        }
-    }
-    else if (sm_caseInsensitiveMatch(Function_p->name_p, "compile")) {
-        result = sm_addCompileArguments(&Runtime_p->SourceContextArray, Function_p, SM_SOURCE_CONTEXT_UNDEFINED);
-    }
-    else if (sm_caseInsensitiveMatch(Function_p->name_p, "compile_lib")) {
-        result = sm_addCompileArguments(&Runtime_p->SourceContextArray, Function_p, SM_SOURCE_CONTEXT_SHARED_LIBRARY);
-    }
-    else if (sm_caseInsensitiveMatch(Function_p->name_p, "compile_bin")) {
-        result = sm_addCompileArguments(&Runtime_p->SourceContextArray, Function_p, SM_SOURCE_CONTEXT_BINARY);
-    }
-    else if (sm_caseInsensitiveMatch(Function_p->name_p, "link")) {
-        result = sm_addLinkArguments(&Runtime_p->SourceContextArray, Function_p, SM_SOURCE_CONTEXT_UNDEFINED);
-    }
-    else if (sm_caseInsensitiveMatch(Function_p->name_p, "link_lib")) {
-        result = sm_addLinkArguments(&Runtime_p->SourceContextArray, Function_p, SM_SOURCE_CONTEXT_SHARED_LIBRARY);
-    }
-    else if (sm_caseInsensitiveMatch(Function_p->name_p, "link_bin")) {
-        result = sm_addLinkArguments(&Runtime_p->SourceContextArray, Function_p, SM_SOURCE_CONTEXT_BINARY);
-    }
-    else if (sm_caseInsensitiveMatch(Function_p->name_p, "source")) { 
-        result = sm_addSource(&Runtime_p->SourceContextArray, &Runtime_p->SourceArray, Function_p, SM_SOURCE_CONTEXT_UNDEFINED);
-    }
-    else if (sm_caseInsensitiveMatch(Function_p->name_p, "source_lib")) {
-        result = sm_addSource(&Runtime_p->SourceContextArray, &Runtime_p->SourceArray, Function_p, SM_SOURCE_CONTEXT_SHARED_LIBRARY);
-    }
-    else if (sm_caseInsensitiveMatch(Function_p->name_p, "source_bin")) {
-        result = sm_addSource(&Runtime_p->SourceContextArray, &Runtime_p->SourceArray, Function_p, SM_SOURCE_CONTEXT_BINARY);
-    }
-    else if (sm_caseInsensitiveMatch(Function_p->name_p, "test")) {
-        result = sm_addTest(&Runtime_p->SourceContextArray, &Runtime_p->TestArray, Function_p);
-    }
-    else if (sm_caseInsensitiveMatch(Function_p->name_p, "copy")) {
-        result = sm_executeCopyFunction(Runtime_p, Function_p);
-    }
-    else if (sm_caseInsensitiveMatch(Function_p->name_p, "build")) {
-        result = sm_build(Runtime_p, Function_p->arguments_pp[0]);
-    }
-    else if (sm_caseInsensitiveMatch(Function_p->name_p, "chdir")) {
-        result = sm_executeChdirFunction(Runtime_p, Function_p);
-    }
-    else if (sm_caseInsensitiveMatch(Function_p->name_p, "mkdir")) {
-        result = sm_executeMkdirFunction(Function_p);
-    }
-    else if (sm_caseInsensitiveMatch(Function_p->name_p, "system")) {
-        result = sm_executeSystemFunction(Function_p);
-    }
-    else if (sm_caseInsensitiveMatch(Function_p->name_p, "system")) {
-        result = sm_executeSystemFunction(Function_p);
-    }
-    else if (sm_caseInsensitiveMatch(Function_p->name_p, "set")) {
-        result = sm_updateVariable(
-            &Runtime_p->VariableArray, Function_p->arguments_pp[0], Function_p->arguments_pp + 1, 
-            Function_p->arguments - 1
-        );
-    }
-
-    if (!result && Runtime_p->functionCallback_f) {
-        result = Runtime_p->functionCallback_f(Runtime_p, Function_p);
-    }
-
-    for (int i = 0; i < Function_p->arguments; ++i) {
-        free(Function_p->arguments_pp[i]);
-    }
-
-    memcpy(Function_p->arguments_pp, arguments_pp, sizeof(SM_BYTE*) * Function_p->arguments);
-    free(arguments_pp);
-
-SM_DIAGNOSTIC_END(result)
-}
-
-SM_BOOL sm_compareIf(
-    sm_Runtime *Runtime_p, sm_If *If_p, SM_BOOL b)
-{
-SM_BEGIN()
-
-    sm_Variable *Var_p = sm_getVariable(&Runtime_p->VariableArray, If_p->string_p);
-    if (Var_p && Var_p->valueCount > 0) {
-        if (!strcmp(*Var_p->values_pp, "true") && b == SM_TRUE) {SM_END(SM_TRUE)}
-        if (!strcmp(*Var_p->values_pp, "false") && b == SM_FALSE) {SM_END(SM_TRUE)}
-    }
-
-SM_END(SM_FALSE)
-}
-
-SM_RESULT sm_executeIf(
-    sm_Runtime *Runtime_p, sm_If *If_p) 
-{
-SM_BEGIN()
-
-    sm_Variable *Var_p = sm_getVariable(&Runtime_p->VariableArray, If_p->string_p);
-    if (Var_p && Var_p->valueCount > 0 && !strcmp(*Var_p->values_pp, "true")) {
-        SM_CHECK(sm_executeBlock(Runtime_p, &If_p->Block_p->Block))
-    }
-
-SM_DIAGNOSTIC_END(SM_SUCCESS)
-}
-
-// EXECUTE BLOCK ===================================================================================
-
-SM_RESULT sm_executeBlock(
-    sm_Runtime *Runtime_p, sm_Block *Block_p)
-{
-SM_BEGIN()
-
-    for (int d = 0; d < Block_p->definitions; ++d) {
-        switch (Block_p->Definitions_p[d].type) {
-            case SM_DEFINITION_FUNCTION :
-                SM_CHECK(sm_executeFunction(Runtime_p, &Block_p->Definitions_p[d].Function))
-            case SM_DEFINITION_IF :
-                SM_CHECK(sm_executeIf(Runtime_p, &Block_p->Definitions_p[d].If))
-        }
-    }
-
-SM_END(SM_SUCCESS)
-}
-
diff --git a/external/selfmake/src/lib/Parser/Functions.h b/external/selfmake/src/lib/Parser/Functions.h
deleted file mode 100644
index 8dc85f9..0000000
--- a/external/selfmake/src/lib/Parser/Functions.h
+++ /dev/null
@@ -1,39 +0,0 @@
-#ifndef SM_FUNCTIONS_H
-#define SM_FUNCTIONS_H
-
-#ifndef DOXYGEN_SHOULD_SKIP_THIS
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-#include "Parser.h"
-
-#include "../Core/Runtime.h"
-
-#include "../Common/Types.h"
-#include "../Common/Result.h"
-
-#endif
-
-/** @addtogroup selfmakeFunctions
- *  @{
- */
-
-    SM_RESULT sm_executeFunction(
-        sm_Runtime *Runtime_p, sm_Function *Function_p
-    ); 
-
-    SM_RESULT sm_executeBlock(
-        sm_Runtime *Runtime_p, sm_Block *Block_p
-    );
-
-    SM_BOOL sm_compareIf(
-        sm_Runtime *Runtime_p, sm_If *If_p, SM_BOOL b
-    );
-
-/** @} */
-
-#endif
diff --git a/external/selfmake/src/lib/Parser/Parser.c b/external/selfmake/src/lib/Parser/Parser.c
deleted file mode 100644
index e5a7d1f..0000000
--- a/external/selfmake/src/lib/Parser/Parser.c
+++ /dev/null
@@ -1,369 +0,0 @@
-// LICENSE NOTICE ==================================================================================
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-// INCLUDE =========================================================================================
-
-#include "Parser.h"
-
-#include "../Common/Macros/Macros.h"
-#include SM_FLOW
-#include SM_CUSTOM_CHECK
-
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <unistd.h>
-#include <ctype.h>
-
-// PARSE ===========================================================================================
-
-static sm_Token *sm_parseToken(
-    sm_Token *Token_p, sm_Definition *Definition_p
-); 
-
-static sm_Token *sm_parseFunction(
-    sm_Token *Token_p, sm_Definition *Definition_p)
-{
-SM_BEGIN()
-
-    Definition_p->type = SM_DEFINITION_FUNCTION;
-    Definition_p->Function.name_p = Token_p->string_p;
-    Definition_p->Function.arguments_pp = NULL; 
-    Definition_p->Function.arguments = 0;
-
-    ++Token_p;
-
-    if (Token_p->type != SM_TOKEN_ROUND_BRACKET_LEFT) {
-        SM_END(Token_p)
-    }
-
-    Definition_p->Function.arguments_pp = malloc(sizeof(SM_BYTE*));
-    SM_CHECK_NULL(NULL, Definition_p->Function.arguments_pp)
-
-    Definition_p->Function.argumentTypes_p = malloc(sizeof(SM_TOKEN));
-    SM_CHECK_NULL(NULL, Definition_p->Function.argumentTypes_p)
-
-    while (Token_p->type != SM_TOKEN_ROUND_BRACKET_RIGHT)
-    {
-        switch (Token_p->type)
-        {
-            case SM_TOKEN_IDENTIFIER :
-            case SM_TOKEN_STRING :
-                Definition_p->Function.argumentTypes_p[Definition_p->Function.arguments] = Token_p->type;
-                Definition_p->Function.arguments_pp[Definition_p->Function.arguments++] = Token_p->string_p;
-                Definition_p->Function.arguments_pp = realloc(Definition_p->Function.arguments_pp, sizeof(SM_BYTE*) * (Definition_p->Function.arguments + 1));
-                Definition_p->Function.argumentTypes_p = realloc(Definition_p->Function.argumentTypes_p, sizeof(SM_TOKEN) * (Definition_p->Function.arguments + 1));
-                break;
-        }
-        ++Token_p;
-    }
-
-SM_END(++Token_p)
-}
-
-static sm_Token *sm_parseBlock(
-    sm_Token *Token_p, sm_Definition *Definition_p)
-{
-SM_BEGIN()
-
-    Definition_p->type = SM_DEFINITION_BLOCK;
-    Definition_p->Block.Definitions_p = NULL;
-    Definition_p->Block.definitions   = 0;
-
-    if (Token_p->type == SM_TOKEN_CURLY_BRACKET_RIGHT) {
-        SM_END(Token_p)
-    }
-
-    Definition_p->Block.Definitions_p = malloc(sizeof(sm_Definition));
-    SM_CHECK_NULL(NULL, Definition_p->Block.Definitions_p)
-
-    while (Token_p->type != SM_TOKEN_CURLY_BRACKET_RIGHT) {        
-        Token_p = sm_parseToken(Token_p, &Definition_p->Block.Definitions_p[Definition_p->Block.definitions++]);
-        Definition_p->Block.Definitions_p = realloc(Definition_p->Block.Definitions_p, sizeof(sm_Definition) * (Definition_p->Block.definitions + 1));
-    }
-
-SM_END(Token_p)
-}
-
-static sm_Token *sm_parseOption(
-    sm_Token *Token_p, sm_Definition *Definition_p)
-{
-SM_BEGIN()
-
-    Definition_p->type = SM_DEFINITION_OPTION;
-
-    sm_Token *Description_p = Token_p->type == SM_TOKEN_STRING ? Token_p : NULL;
-    SM_BOOL longOption = SM_FALSE;
-
-    if (Token_p->type == SM_TOKEN_STRING) {
-        if (Token_p[2].type == SM_TOKEN_HYPHEN_MINUS) {
-            longOption = SM_TRUE; 
-            Token_p = Token_p + 3;
-        }
-        else {Token_p = Token_p + 2;}
-    }
-    else {
-        if (Token_p[1].type == SM_TOKEN_HYPHEN_MINUS) {
-            longOption = SM_TRUE;
-            Token_p = Token_p + 2;
-        }
-        else {Token_p = Token_p + 1;}
-    }
-
-    Definition_p->Option.arguments = 0;
-    Definition_p->Option.arguments_pp = NULL;
-    Definition_p->Option.longOption = longOption;
-    Definition_p->Option.name_p = Token_p->string_p;
-    Definition_p->Option.description_p = Description_p ? Description_p->string_p : NULL;
-    Definition_p->Option.Block_p = malloc(sizeof(sm_Block));
-    SM_CHECK_NULL(NULL, Definition_p->Option.Block_p)
-
-    ++Token_p;
-
-    sm_Token *Argument_p = Token_p;
-    int arguments = 0;
-    while (Argument_p->type == SM_TOKEN_IDENTIFIER || Argument_p->type == SM_TOKEN_STRING) {
-        arguments++;
-        Argument_p++;
-    }
-
-    if (arguments) {
-        Definition_p->Option.arguments = arguments;
-        Definition_p->Option.arguments_pp = malloc(sizeof(SM_BYTE*) * arguments);
-        SM_CHECK_NULL(NULL, Definition_p->Option.arguments_pp)
-        for (int i = 0; i < arguments; ++i) {
-            Definition_p->Option.arguments_pp[i] = Token_p->string_p;
-            Token_p++;
-        }
-    }
-
-    if (Token_p->type != SM_TOKEN_CURLY_BRACKET_LEFT) {
-        SM_END(Token_p)
-    }
-
-SM_END(sm_parseBlock(++Token_p, Definition_p->Option.Block_p))
-}
-
-static sm_Token *sm_parseIf(
-    sm_Token *Token_p, sm_Definition *Definition_p)
-{
-SM_BEGIN()
-
-    Definition_p->type = SM_DEFINITION_IF;
-    Definition_p->If.string_p = Token_p->string_p;
-    Definition_p->If.Block_p = malloc(sizeof(sm_Definition)); 
-    SM_CHECK_NULL(NULL, Definition_p->If.Block_p)
-
-    ++Token_p;
-
-    if (Token_p->type != SM_TOKEN_CURLY_BRACKET_LEFT) {
-        SM_END(Token_p)
-    }
-
-SM_END(sm_parseBlock(++Token_p, Definition_p->If.Block_p))
-}
-
-static sm_Token *sm_parseToken(
-    sm_Token *Token_p, sm_Definition *Definition_p) 
-{
-SM_BEGIN()
-
-    Definition_p->type = SM_DEFINITION_UNDEFINED;
-
-    switch (Token_p->type)
-    {
-        case SM_TOKEN_CURLY_BRACKET_RIGHT :
-        case SM_TOKEN_CURLY_BRACKET_LEFT  :
-        case SM_TOKEN_ROUND_BRACKET_RIGHT :
-        case SM_TOKEN_ROUND_BRACKET_LEFT  :
-        case SM_TOKEN_ANGLE_BRACKET_RIGHT :
-        case SM_TOKEN_ANGLE_BRACKET_LEFT  :
-        case SM_TOKEN_COMMA               :
-            break;
-
-        case SM_TOKEN_STRING :
-            if (Token_p[1].type == SM_TOKEN_HYPHEN_MINUS) {
-                SM_END(sm_parseOption(Token_p, Definition_p))
-            }
-            break;
-
-        case SM_TOKEN_IDENTIFIER :
-            switch((Token_p+1)->type) {
-                case SM_TOKEN_CURLY_BRACKET_LEFT :
-                    SM_END(sm_parseIf(Token_p, Definition_p))
-                case SM_TOKEN_ROUND_BRACKET_LEFT :
-                    SM_END(sm_parseFunction(Token_p, Definition_p))
-            }
-            break;
-
-        case SM_TOKEN_HYPHEN_MINUS :
-            SM_END(sm_parseOption(Token_p, Definition_p))
-            break;
-    }
-
-SM_END(++Token_p)
-}
-
-static SM_RESULT sm_parseFile(
-    sm_Parser *Parser_p, sm_File *File_p) 
-{
-SM_BEGIN()
-
-#include SM_DEFAULT_CHECK
-
-    sm_Tokenizer Tokenizer = sm_initTokenizer();
-    SM_CHECK(sm_tokenizeFile(&Tokenizer, File_p))
-
-    sm_Token *Token_p = Tokenizer.Tokens_p;
-
-    Parser_p->definitions = 0;
-    Parser_p->Definitions_p = malloc(sizeof(sm_Definition));
-    SM_CHECK_NULL(Parser_p->Definitions_p)
-
-    while (Token_p->type != SM_TOKEN_EOF) {
-        Token_p = sm_parseToken(Token_p, &Parser_p->Definitions_p[Parser_p->definitions]);
-        if (Parser_p->Definitions_p[Parser_p->definitions].type != SM_DEFINITION_UNDEFINED) {
-            Parser_p->definitions++;
-            Parser_p->Definitions_p = realloc(Parser_p->Definitions_p, sizeof(sm_Definition) * (Parser_p->definitions + 1));
-        }
-    }
-
-#include SM_CUSTOM_CHECK
-
-SM_DIAGNOSTIC_END(SM_SUCCESS)
-}
-
-// SHOW ============================================================================================
-
-static void sm_showParserDefinition(
-    sm_Definition *Definition_p, unsigned int depth)
-{
-SM_BEGIN()
-
-    SM_BYTE depth_p[255];
-    memset(depth_p, 0, 255);
-
-    for (int i = 0; i < (depth * 2); ++i) {depth_p[i] = ' ';}
-
-    switch (Definition_p->type)
-    {
-        case SM_DEFINITION_IF :
-            sm_messagef("%s%s", depth_p, Definition_p->If.string_p);
-            sm_messagef("%s{", depth_p);
-            for (int j = 0; j < Definition_p->If.Block_p->Block.definitions; ++j) {
-                sm_showParserDefinition(&Definition_p->If.Block_p->Block.Definitions_p[j], depth + 1);
-            }
-            sm_messagef("%s}", depth_p);
-            break;
-
-        case SM_DEFINITION_FUNCTION :
-            sm_messagef("%s%s", depth_p, Definition_p->Function.name_p);
-            for (int j = 0; j < Definition_p->Function.arguments; ++j) {
-                sm_messagef("%s  %s", depth_p, Definition_p->Function.arguments_pp[j]);
-            }
-            break;
-
-        case SM_DEFINITION_BLOCK :
-            sm_messagef("%s{", depth_p);
-            for (int j = 0; j < Definition_p->Block.definitions; ++j) {
-                sm_showParserDefinition(&Definition_p->Block.Definitions_p[j], depth + 1);
-            }
-            sm_messagef("%s}", depth_p);
-            break;
-
-        case SM_DEFINITION_OPTION :
-            if (Definition_p->Option.longOption) {
-                sm_messagef("%s--%s", depth_p, Definition_p->Option.name_p);
-            }
-            else {
-                sm_messagef("%s-%s", depth_p, Definition_p->Option.name_p);
-            }
-            if (Definition_p->Option.description_p) {
-                sm_messagef("%s  description: %s", depth_p, Definition_p->Option.description_p);
-            }
-            for (int i = 0; i < Definition_p->Option.arguments; ++i) {
-                sm_messagef("%s  argument %d: %s", depth_p, i, Definition_p->Option.arguments_pp[i]);
-            }
-            sm_showParserDefinition(Definition_p->Option.Block_p, depth + 1);
-            break;
-    }
-
-SM_SILENT_END()
-}
-
-static void sm_showParseTree(
-    sm_Parser *Parser_p)
-{
-SM_BEGIN()
-
-    sm_operationf("Show Parse-Tree");
-
-    for (int i = 0; i < Parser_p->definitions; ++i) {
-        sm_showParserDefinition(&Parser_p->Definitions_p[i], 0);
-    }
-
-SM_SILENT_END()
-}
-
-// PARSER ARRAY ====================================================================================
-
-void sm_initParserArray(
-    sm_ParserArray *Array_p)
-{
-SM_BEGIN()
-
-    Array_p->length = 0;
-    Array_p->Parsers_p = NULL;
-
-SM_SILENT_END()
-}
-
-static sm_Parser sm_initParser()
-{
-SM_BEGIN()
-
-    sm_Parser Parser;
-    Parser.executed = SM_FALSE;
-    Parser.Definitions_p = NULL;
-    Parser.definitions = 0;
-
-SM_END(Parser)
-}
-
-SM_RESULT sm_appendParser(
-    sm_ParserArray *Array_p, sm_File *File_p, SM_BOOL showParseTree)
-{
-SM_BEGIN()
-
-#include SM_DEFAULT_CHECK
-
-    if (!Array_p->Parsers_p) {
-        Array_p->Parsers_p = malloc(sizeof(sm_Parser));
-        SM_CHECK_NULL(Array_p->Parsers_p)
-    }
-    else {
-        Array_p->Parsers_p = realloc(Array_p->Parsers_p, sizeof(sm_Parser) * (Array_p->length + 1));
-        SM_CHECK_NULL(Array_p->Parsers_p)
-    }
-
-    sm_Parser *Parser_p = &Array_p->Parsers_p[Array_p->length];
-
-    *Parser_p = sm_initParser();
-    SM_CHECK(sm_parseFile(Parser_p, File_p))
-
-    if (showParseTree) {
-        sm_showParseTree(Parser_p);
-    }
-
-    Array_p->length++;
-
-#include SM_CUSTOM_CHECK
-
-SM_DIAGNOSTIC_END(SM_SUCCESS)
-}
-
diff --git a/external/selfmake/src/lib/Parser/Parser.h b/external/selfmake/src/lib/Parser/Parser.h
deleted file mode 100644
index a6b2aad..0000000
--- a/external/selfmake/src/lib/Parser/Parser.h
+++ /dev/null
@@ -1,85 +0,0 @@
-#ifndef SM_PARSER_H
-#define SM_PARSER_H
-
-#ifndef DOXYGEN_SHOULD_SKIP_THIS
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-#include "Tokenizer.h"
-
-#include "../Common/Types.h"
-#include "../Common/Result.h"
-
-#include "../Core/File.h"
-
-#endif
-
-/** @addtogroup selfmakeStructs
- *  @{
- */
-
-    typedef union sm_Definition sm_Definition;
-
-    typedef struct sm_Block {
-        SM_DEFINITION type;
-        unsigned int definitions;
-        sm_Definition *Definitions_p;
-    } sm_Block;
-
-    typedef struct sm_Option {
-        SM_DEFINITION type;
-        SM_BOOL longOption;
-        int arguments;
-        SM_BYTE **arguments_pp;
-        SM_BYTE *name_p;
-        SM_BYTE *description_p;
-        sm_Definition *Block_p;
-    } sm_Option;
-
-    typedef struct sm_If {
-        SM_DEFINITION type;
-        SM_BYTE *string_p;
-        sm_Definition *Block_p;
-    } sm_If;
-
-    typedef union sm_Definition {
-        SM_DEFINITION type;
-        sm_Option Option;
-        sm_Function Function;
-        sm_Block Block;
-        sm_If If;
-    } sm_Definition;
-
-    typedef struct sm_Parser {
-        SM_BOOL executed;
-        SM_BOOL expectExpression;
-        unsigned int definitions;
-        sm_Definition *Definitions_p;
-    } sm_Parser;
-
-    typedef struct sm_ParserArray {
-        int length;
-        sm_Parser *Parsers_p;
-    } sm_ParserArray;
-
-/** @} */
-
-/** @addtogroup selfmakeFunctions
- *  @{
- */
-
-    void sm_initParserArray(
-        sm_ParserArray *Array_p
-    );
-
-    SM_RESULT sm_appendParser(
-        sm_ParserArray *Array_p, sm_File *File_p, SM_BOOL showParseTree
-    ); 
-
-/** @} */
-
-#endif
diff --git a/external/selfmake/src/lib/Parser/Tokenizer.c b/external/selfmake/src/lib/Parser/Tokenizer.c
deleted file mode 100644
index 2329de6..0000000
--- a/external/selfmake/src/lib/Parser/Tokenizer.c
+++ /dev/null
@@ -1,228 +0,0 @@
-// LICENSE NOTICE ==================================================================================
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-// INCLUDE =========================================================================================
-
-#include "Tokenizer.h"
-
-#include "../Core/Utils.h"
-#include "../Common/Macros/Macros.h"
-#include SM_FLOW
-#include SM_DEFAULT_CHECK
-
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <unistd.h>
-#include <ctype.h>
-
-// HELPER ==========================================================================================
-
-static SM_BOOL sm_isASCIIUpperAlpha(
-    SM_BYTE codepoint)
-{
-SM_BEGIN()
-SM_END(codepoint >= 0x41 && codepoint <= 0x5A)
-}
-
-static SM_BOOL sm_isASCIILowerAlpha(
-    SM_BYTE codepoint)
-{
-SM_BEGIN()
-SM_END(codepoint >= 0x61 && codepoint <= 0x7A)
-}
-
-static SM_BOOL sm_isASCIIAlpha(
-    SM_BYTE codepoint)
-{
-SM_BEGIN()
-SM_END(sm_isASCIIUpperAlpha(codepoint) || sm_isASCIILowerAlpha(codepoint))
-}
-
-static SM_BOOL sm_isBracket(
-    SM_BYTE codepoint)
-{
-SM_BEGIN()
-SM_END(codepoint == '(' || codepoint == ')' || codepoint == '{' || codepoint == '}' || codepoint == '[' || codepoint == ']')
-}
-
-static SM_BOOL sm_isTokenBegin(
-    SM_BYTE codepoint)
-{
-SM_BEGIN()
-
-    if (sm_isASCIIAlpha(codepoint) || sm_isBracket(codepoint) 
-    || codepoint == ',' 
-    || codepoint == '"' 
-    || codepoint == '-') 
-
-    {SM_END(SM_TRUE)}
-
-SM_END(SM_FALSE)
-}
-
-// TOKENIZE ========================================================================================
-
-static SM_BYTE *sm_tokenizeString(
-    sm_Token *Token_p, SM_BYTE *bytes_p)
-{
-SM_BEGIN()
-
-    SM_BYTE *string_p = malloc(1);
-    unsigned int stringLength = 0;
-
-    SM_BYTE *stringBegin_p = bytes_p;
-
-    SM_BOOL escape = SM_FALSE;
-    while (*bytes_p && (*bytes_p != '"' || escape)) {
-        escape = escape ? SM_FALSE : *bytes_p == 0x5C;
-        if (!escape) {
-            string_p = realloc(string_p, stringLength + 1);
-            string_p[stringLength++] = *bytes_p;
-        }
-        bytes_p++;
-    }
-    if (!*bytes_p) {SM_END(NULL)}
-
-    *bytes_p = 0;
-
-    string_p = realloc(string_p, stringLength + 1);
-    string_p[stringLength] = 0;
-
-    Token_p->string_p = string_p;
-
-    *bytes_p = '"';
-
-SM_END(&bytes_p[1])
-}
-
-static SM_BYTE *sm_getToken(
-    sm_Token *Token_p, SM_BYTE *bytes_p) 
-{
-SM_BEGIN()
-
-    if (!*bytes_p) {SM_END(NULL)}
-
-    Token_p->type     = SM_TOKEN_UNDEFINED;
-    Token_p->string_p = NULL;
-
-    while (*bytes_p && !sm_isTokenBegin(*bytes_p)) {
-        if (bytes_p[0] == '/' && bytes_p[1] == '/') {
-            while (*bytes_p && *bytes_p != '\n') {bytes_p++;}
-        }
-        bytes_p++;
-    }
-    if (!*bytes_p) {SM_END(NULL)}
-
-    SM_BYTE *tokenBegin_p = bytes_p;
-
-    switch (*tokenBegin_p) 
-    {
-        case '(' : Token_p->type = SM_TOKEN_ROUND_BRACKET_LEFT; break;
-        case ')' : Token_p->type = SM_TOKEN_ROUND_BRACKET_RIGHT; break;
-        case '{' : Token_p->type = SM_TOKEN_CURLY_BRACKET_LEFT; break;
-        case '}' : Token_p->type = SM_TOKEN_CURLY_BRACKET_RIGHT; break;
-        case '[' : Token_p->type = SM_TOKEN_ANGLE_BRACKET_LEFT; break;
-        case ']' : Token_p->type = SM_TOKEN_ANGLE_BRACKET_RIGHT; break;
-        case '-' : Token_p->type = SM_TOKEN_HYPHEN_MINUS; break;
-        case ',' : Token_p->type = SM_TOKEN_COMMA; break;
-        case '"' :
-            Token_p->type = SM_TOKEN_STRING;
-            SM_END(sm_tokenizeString(Token_p, &bytes_p[1]))
-            break;
-    }
-    
-    if (Token_p->type != SM_TOKEN_UNDEFINED) {
-        SM_END(&bytes_p[1])
-    }
-
-    while (*bytes_p && (sm_isASCIIAlpha(*bytes_p) || *bytes_p == '_')) {bytes_p++;}
-    if (!*bytes_p) {SM_END(NULL)}
-
-    SM_BYTE tmp = *bytes_p;
-    *bytes_p = 0;    
-
-    Token_p->type = SM_TOKEN_IDENTIFIER;
-    Token_p->string_p = malloc(strlen(tokenBegin_p) + 1);
-    strcpy(Token_p->string_p, tokenBegin_p);
-
-    *bytes_p = tmp;
-
-SM_END(bytes_p)
-}
-
-static void sm_getTokens(
-    sm_Token *Tokens_p, SM_BYTE *bytes_p, unsigned int *tokens_p) 
-{
-SM_BEGIN()
-
-    unsigned int tokens = 0;
-
-    while (bytes_p)
-    {
-        sm_Token Token;
-        bytes_p = sm_getToken(&Token, bytes_p);
-        if (Tokens_p) {Tokens_p[tokens] = Token;}
-        tokens++;
-    }
-
-    if (Tokens_p) {
-        Tokens_p[tokens - 1].type = SM_TOKEN_EOF;        
-    }
-
-    if (tokens_p) {*tokens_p = tokens;}
-
-SM_SILENT_END()
-}
-
-SM_RESULT sm_tokenizeFile(
-    sm_Tokenizer *Tokenizer_p, sm_File *File_p) 
-{
-SM_BEGIN()
-
-    SM_BYTE *bytes_p = malloc(strlen(File_p->data_p) + 1);
-    SM_CHECK_NULL(bytes_p)
-    strcpy(bytes_p, File_p->data_p);
-
-    unsigned int tokens = 0;
-    sm_getTokens(NULL, bytes_p, &tokens);
-
-    free(bytes_p);
-    bytes_p = NULL;
-
-    bytes_p = malloc(strlen(File_p->data_p) + 1);
-    SM_CHECK_NULL(bytes_p)
-    strcpy(bytes_p, File_p->data_p);
-
-    sm_Token *Tokens_p = malloc(sizeof(sm_Token) * tokens);
-    for (int i = 0; i < tokens; ++i) {
-        Tokens_p[i].string_p = NULL;
-    }
-    sm_getTokens(Tokens_p, bytes_p, NULL);
-
-    free(bytes_p);
-
-    Tokenizer_p->tokens   = tokens;
-    Tokenizer_p->Tokens_p = Tokens_p;
-
-SM_END(SM_SUCCESS)
-}
-
-// INIT ============================================================================================
-
-sm_Tokenizer sm_initTokenizer()
-{
-SM_BEGIN()
-
-    sm_Tokenizer Tokenizer;
-    Tokenizer.tokens = 0;
-    Tokenizer.Tokens_p = NULL;
-
-SM_END(Tokenizer)
-}
-
diff --git a/external/selfmake/src/lib/Parser/Tokenizer.h b/external/selfmake/src/lib/Parser/Tokenizer.h
deleted file mode 100644
index 0348f8c..0000000
--- a/external/selfmake/src/lib/Parser/Tokenizer.h
+++ /dev/null
@@ -1,48 +0,0 @@
-#ifndef SM_TOKENIZER_H
-#define SM_TOKENIZER_H
-
-#ifndef DOXYGEN_SHOULD_SKIP_THIS
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-#include "../Common/Types.h"
-#include "../Common/Result.h"
-
-#include "../Core/File.h"
-
-#endif
-
-/** @addtogroup selfmakeStructs
- *  @{
- */
-
-    typedef struct sm_Token {
-        SM_TOKEN type;
-        SM_BYTE *string_p;
-    } sm_Token;
-
-    typedef struct sm_Tokenizer {
-        unsigned int tokens;
-        sm_Token *Tokens_p;
-    } sm_Tokenizer;
-
-/** @} */
-
-/** @addtogroup selfmakeFunctions
- *  @{
- */
-
-    sm_Tokenizer sm_initTokenizer(
-    );
-
-    SM_RESULT sm_tokenizeFile(
-        sm_Tokenizer *Tokenizer_p, sm_File *File_p 
-    ); 
-
-/** @} */
-
-#endif
diff --git a/external/selfmake/src/lib/Parser/Variables.h b/external/selfmake/src/lib/Parser/Variables.h
deleted file mode 100644
index 975c510..0000000
--- a/external/selfmake/src/lib/Parser/Variables.h
+++ /dev/null
@@ -1,60 +0,0 @@
-#ifndef SM_VARIABLES_H
-#define SM_VARIABLES_H
-
-#ifndef DOXYGEN_SHOULD_SKIP_THIS
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-#include "../Common/Types.h"
-#include "../Common/Result.h"
-
-#endif
-
-/** @addtogroup selfmakeStructs
- *  @{
- */
-
-    typedef struct sm_Variable {
-        SM_BYTE *name_p;
-        int valueCount;
-        SM_BYTE **values_pp;
-    } sm_Variable;
-
-    typedef struct sm_VariableArray {
-        int length;
-        sm_Variable *Variables_p;
-    } sm_VariableArray;
-
-/** @} */
-
-/** @addtogroup selfmakeFunctions
- *  @{
- */
-
-    void sm_initVariableArray(
-        sm_VariableArray *Array_p
-    );
-
-    sm_Variable *sm_getVariable(
-        sm_VariableArray *Array_p, SM_BYTE *name_p
-    );
-
-    SM_RESULT sm_appendToVariable(
-        sm_VariableArray *Array_p, SM_BYTE *variable_p, SM_BYTE **values_pp, int valueCount
-    );
-
-    SM_RESULT sm_updateVariable(
-        sm_VariableArray *Array_p, SM_BYTE *variable_p, SM_BYTE **values_pp, int valueCount
-    );
-
-    SM_BYTE *sm_substituteVariables(
-        sm_VariableArray *Array_p, SM_BYTE *string_p
-    );
-
-/** @} */
-
-#endif
diff --git a/external/selfmake/src/lib/Test/Channel.h b/external/selfmake/src/lib/Test/Channel.h
deleted file mode 100644
index 2f1f71b..0000000
--- a/external/selfmake/src/lib/Test/Channel.h
+++ /dev/null
@@ -1,61 +0,0 @@
-#ifndef SM_CHANNEL_H
-#define SM_CHANNEL_H
-
-#ifndef DOXYGEN_SHOULD_SKIP_THIS
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-#include "../Common/Result.h"
-
-#include <stddef.h>
-
-#endif
-
-/** @addtogroup smcoreStructs
- *  @{
- */
-
-    // TODO semaphore etc.
-    typedef struct sm_Channel {
-#if defined(__linux__) || defined(__APPLE__)
-        int rw_p[2];
-#endif
-    } sm_Channel;
-
-/** @} */
-
-/** @addtogroup smcoreFunctions
- *  @{
- */
-
-    SM_RESULT sm_initChannel(
-        sm_Channel *Channel_p
-    );
-    
-    SM_RESULT sm_openChannel(
-        sm_Channel *Channel_p
-    );
-    
-    void sm_closeChannelReadAccess(
-        sm_Channel *Channel_p
-    );
-    
-    void sm_closeChannelWriteAccess(
-        sm_Channel *Channel_p
-    );
-    
-    int sm_writeToChannel(
-        sm_Channel *Channel_p, char *bytes_p, int byteCount
-    );
-    
-    char *sm_readFromChannel(
-        sm_Channel *Channel_p, size_t *size_p
-    );
-
-/** @} */
-
-#endif 
diff --git a/external/selfmake/src/lib/Test/Library.h b/external/selfmake/src/lib/Test/Library.h
deleted file mode 100644
index 808ed3f..0000000
--- a/external/selfmake/src/lib/Test/Library.h
+++ /dev/null
@@ -1,41 +0,0 @@
-#ifndef SM_LIBRARY_H
-#define SM_LIBRARY_H
-
-#ifndef DOXYGEN_SHOULD_SKIP_THIS
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-#include "../Common/Result.h"
-#include "../Common/Types.h"
-
-#include <stddef.h>
-
-#endif
-
-/** @addtogroup selfmakeFunctions
- *  @{
- */
-
-    void *sm_openLibrary(
-        SM_BYTE *path_p
-    );
-    
-    void sm_closeLibrary(
-        void *lib_p
-    );
-    
-    SM_RESULT sm_getExeDir(
-        SM_BYTE *buffer_p, size_t size
-    );
-    
-    void *sm_loadSymbol(
-        void *lib_p, const SM_BYTE *name_p
-    );
-
-/** @} */
-
-#endif
diff --git a/external/selfmake/src/lib/Test/Process.c b/external/selfmake/src/lib/Test/Process.c
deleted file mode 100644
index e75e9fa..0000000
--- a/external/selfmake/src/lib/Test/Process.c
+++ /dev/null
@@ -1,158 +0,0 @@
-// LICENSE NOTICE ==================================================================================
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-// INCLUDE =========================================================================================
-
-#include "Process.h"
-#include "Channel.h"
-
-#include "../Common/Types.h"
-#include "../Common/Macros/Macros.h"
-#include SM_FLOW
-#include SM_DEFAULT_CHECK
-
-#include <stdlib.h>
-#include <stdio.h>
-#include <unistd.h>
-#include <errno.h>
-#include <string.h>
-
-#if defined(__linux__) || defined(__APPLE__)
-    #include <sys/wait.h>
-    #include <signal.h>
-#endif
-
-// FORK ============================================================================================
-
-static sm_Process sm_initProcess()
-{
-SM_BEGIN()
-
-    sm_Process Process;
-    Process.id = 0;
-
-    sm_initChannel(&Process.IPC.In);
-    sm_initChannel(&Process.IPC.Out);
-
-SM_END(Process)
-}
-
-sm_Process sm_fork()
-{
-SM_BEGIN()
-
-#include SM_CUSTOM_CHECK
-
-    sm_Process Fork = sm_initProcess();
-
-    sm_openChannel(&Fork.IPC.In);
-    sm_openChannel(&Fork.IPC.Out);
-
-    Fork.id = fork();
-
-    if (Fork.id == 0) { // child
-        sm_closeChannelWriteAccess(&Fork.IPC.In);
-        sm_closeChannelReadAccess(&Fork.IPC.Out);
-        SM_END(Fork)
-    }
-
-    sm_closeChannelReadAccess(&Fork.IPC.In);
-    sm_closeChannelWriteAccess(&Fork.IPC.Out);
-
-#include SM_DEFAULT_CHECK
-
-SM_END(Fork)
-}
-
-
-
-
-
-
-
-
-
-
-
-
-// TODO ============================================================================
-
-static SM_RESULT sm_unregisterFork(
-    sm_Process *Fork_p)
-{
-SM_BEGIN()
-
-    if (Fork_p->id == 0) {SM_DIAGNOSTIC_END(SM_ERROR_BAD_STATE)}
-
-    sm_closeChannelWriteAccess(&Fork_p->IPC.In);
-    sm_closeChannelReadAccess(&Fork_p->IPC.Out);
-
-SM_DIAGNOSTIC_END(SM_SUCCESS)
-}
-
-void sm_checkForks()
-{
-SM_BEGIN()
-
-//    if (init == SM_FALSE) {SM_SILENT_END()}
-//
-//    for (int i = 0; i < SM_MAX_FORKS; ++i) {
-//        sm_Process *Proc_p = &SM_PROCESS_POOL.Forks_p[i];
-//        if (Proc_p->id != 0) {
-//            int status;
-//#if defined(__linux__) || defined(__APPLE__)
-//            int result = waitpid(Proc_p->id, &status, WNOHANG);
-//            if (result == -1) {
-//                printf("sm_checkForks %s\n", strerror(errno));
-//            }
-//            if (result == -1 || WIFEXITED(status)) {
-//                sm_unregisterFork(&SM_PROCESS_POOL.Forks_p[i]);
-//            }
-//#endif
-//        }
-//    }
-
-SM_SILENT_END()
-}
-
-void sm_killFork(
-    sm_Process *Fork_p)
-{
-SM_BEGIN()
-
-    kill(Fork_p->id, SIGTERM);
-    sm_unregisterFork(Fork_p);
-
-SM_SILENT_END()
-}
-
-// WRITE ===========================================================================================
-
-SM_BYTE *_sm_writeToProcess(
-    sm_Process *Proc_p, SM_BYTE *write_p, int writeLen, SM_BOOL getResponse)
-{
-    sm_writeToChannel(&Proc_p->IPC.In, write_p, writeLen);
-
-    while (getResponse) 
-    {
-        SM_BYTE *response_p = sm_readFromChannel(&Proc_p->IPC.Out, NULL);
-        if (response_p != NULL) {
-            return response_p;
-        }
-    }
-
-    return NULL;
-}
-
-SM_BYTE *sm_writeToProcess(
-    sm_Process *Proc_p, SM_BYTE *write_p, int writeLen, SM_BOOL getResponse)
-{
-SM_BEGIN()
-SM_END(_sm_writeToProcess(Proc_p, write_p, writeLen, getResponse))
-}
-
diff --git a/external/selfmake/src/lib/Test/Process.h b/external/selfmake/src/lib/Test/Process.h
deleted file mode 100644
index 0b87c9b..0000000
--- a/external/selfmake/src/lib/Test/Process.h
+++ /dev/null
@@ -1,50 +0,0 @@
-#ifndef SM_PROCESS_H
-#define SM_PROCESS_H
-
-#ifndef DOXYGEN_SHOULD_SKIP_THIS
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-#include "Channel.h"
-
-#include "../Common/Result.h"
-#include "../Common/Types.h"
-
-#include <sys/types.h> 
-
-#endif
-
-/** @addtogroup selfmakeStructs
- *  @{
- */
-
-#if defined(__unix__) || defined(__APPLE__)
-    typedef pid_t SM_PROCESS;
-#endif
-
-    typedef struct sm_ProcessIPC {
-        sm_Channel In;
-        sm_Channel Out;
-    } sm_ProcessIPC;
-
-    typedef struct sm_Process {
-        SM_PROCESS id;
-        sm_ProcessIPC IPC;
-    } sm_Process;
-
-/** @} */
-
-/** @addtogroup selfmakeFunctions
- *  @{
- */
-
-    sm_Process sm_fork(
-    );
-
-/** @} */
-
-#endif
diff --git a/external/selfmake/src/lib/Test/Test.c b/external/selfmake/src/lib/Test/Test.c
deleted file mode 100644
index d440c76..0000000
--- a/external/selfmake/src/lib/Test/Test.c
+++ /dev/null
@@ -1,316 +0,0 @@
-// LICENSE NOTICE ==================================================================================
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-// INCLUDE =========================================================================================
-
-#include "Test.h"
-#include "Channel.h"
-#include "Process.h"
-#include "Library.h"
-
-#include "../Core/Runtime.h"
-#include "../Parser/Variables.h"
-
-#include "../Common/Types.h"
-#include "../Common/Macros/Macros.h"
-#include SM_FLOW
-#include SM_DEFAULT_CHECK
-
-#include <stdlib.h>
-#include <stdio.h>
-#include <unistd.h>
-#include <errno.h>
-#include <string.h>
-
-#if defined(__linux__) || defined(__APPLE__)
-    #include <sys/wait.h>
-#endif
-
-// TEST ============================================================================================
-
-typedef int (*sm_initializer_f)();
-typedef void *(*sm_customLoader_f)(SM_BYTE *libraryName_p, SM_BYTE *functionName_p);
-typedef int (*sm_test_f)(int arguments, sm_TestArgument *Arguments_p, SM_BYTE *output_p, int maxOutputLength);
-
-static SM_RESULT sm_runTests(
-    sm_TestEnvironment *TestEnvironment_p)
-{
-SM_BEGIN()
-
-    void *initLib_p = NULL;
-    void *loadLib_p = NULL;
-
-    if (TestEnvironment_p->Initializer_p) 
-    {
-        initLib_p = sm_openLibrary(TestEnvironment_p->Initializer_p->libraryName_p);
-        SM_CHECK_NULL(initLib_p)
-
-        sm_initializer_f initializer_f = sm_loadSymbol(initLib_p, TestEnvironment_p->Initializer_p->functionName_p);
-        SM_CHECK_NULL(initializer_f)
-
-        // run custom initializer
-        if (initializer_f()) {SM_END(SM_ERROR_BAD_STATE)}
-    }
-
-    sm_customLoader_f customLoader_f = NULL;
-
-    if (TestEnvironment_p->Loader_p) 
-    {
-        loadLib_p = sm_openLibrary(TestEnvironment_p->Loader_p->libraryName_p);
-        SM_CHECK_NULL(loadLib_p)
-
-        customLoader_f = sm_loadSymbol(loadLib_p, TestEnvironment_p->Loader_p->functionName_p);
-        SM_CHECK_NULL(customLoader_f)
-    }
-
-    SM_BOOL match = SM_FALSE;
-
-    for (int i = 0; i < TestEnvironment_p->TestArray_p->length; ++i) 
-    {
-        sm_Test *Test_p = &TestEnvironment_p->TestArray_p->Tests_p[i];
-        sm_test_f test_f = NULL;
-
-        if (strcmp(Test_p->Context_p->name_p, TestEnvironment_p->target_p)) {continue;}
-
-        if (customLoader_f) {
-            test_f = customLoader_f(Test_p->Context_p->name_p, Test_p->name_p);
-        }
-        else {
-            Test_p->dl_p = sm_openLibrary(Test_p->Context_p->name_p);
-            SM_CHECK_NULL(Test_p->dl_p)
-            test_f = sm_loadSymbol(Test_p->dl_p, Test_p->name_p);
-        }
-
-        SM_CHECK_NULL(test_f)
-
-        SM_BYTE result_p[1024];
-        memset(result_p, 0, 1024);
-
-        // perform the test
-        int result = test_f(Test_p->arguments, Test_p->Arguments_p, result_p, 1024);
-
-        sm_messagef("%d: %s", result, result_p);
-
-        match = SM_TRUE;
-    }
-
-    if (match) {
-        sm_messagef("");
-    }
-
-SM_END(SM_SUCCESS)
-}
-
-static sm_TestEnvironment sm_initializeTestEnvironment(
-    sm_Runtime *Runtime_p, sm_ExternalFunction *Initializer_p, sm_ExternalFunction *Loader_p,
-    SM_BYTE *target_p)
-{
-SM_BEGIN()
-
-    sm_TestEnvironment TestEnvironment;
-    TestEnvironment.target_p = target_p;
-
-    sm_Variable *InitLibrary_p = sm_getVariable(&Runtime_p->VariableArray, "TEST_INITIALIZER_SOURCE");
-    sm_Variable *InitFunction_p = sm_getVariable(&Runtime_p->VariableArray, "TEST_INITIALIZER");
-
-    if (InitLibrary_p && InitFunction_p) {
-        Initializer_p->libraryName_p = InitLibrary_p->values_pp[0];
-        Initializer_p->functionName_p = InitFunction_p->values_pp[0];
-        TestEnvironment.Initializer_p = Initializer_p;
-    }
-    else {TestEnvironment.Initializer_p = NULL;}
-  
-    sm_Variable *LoadLibrary_p = sm_getVariable(&Runtime_p->VariableArray, "TEST_LOADER_SOURCE");
-    sm_Variable *LoadFunction_p = sm_getVariable(&Runtime_p->VariableArray, "TEST_LOADER");
-
-    if (LoadLibrary_p && LoadFunction_p) {
-        Loader_p->libraryName_p = LoadLibrary_p->values_pp[0];
-        Loader_p->functionName_p = LoadFunction_p->values_pp[0];
-        TestEnvironment.Loader_p = Loader_p;
-    }
-    else {TestEnvironment.Loader_p = NULL;}
-
-SM_END(TestEnvironment)
-}
-
-static SM_RESULT sm_runTestEnvironment(
-    sm_TestEnvironment *TestEnvironment_p, sm_TestArray *TestArray_p)
-{
-SM_BEGIN()
-
-    TestEnvironment_p->Process = sm_fork();
-    TestEnvironment_p->TestArray_p = TestArray_p;
-
-    if (TestEnvironment_p->Process.id == 0) {
-        exit(sm_runTests(TestEnvironment_p));
-    }
-
-    pid_t w;
-    int wstatus;
-
-    do {
-        w = waitpid(TestEnvironment_p->Process.id, &wstatus, WUNTRACED | WCONTINUED);
-        if (w == -1) {
-            perror("waitpid");
-            exit(EXIT_FAILURE);
-        }
-//        if (WIFEXITED(wstatus)) {
-//            printf("exited, status=%d\n", WEXITSTATUS(wstatus));
-//        } else if (WIFSIGNALED(wstatus)) {
-//            printf("killed by signal %d\n", WTERMSIG(wstatus));
-//        } else if (WIFSTOPPED(wstatus)) {
-//            printf("stopped by signal %d\n", WSTOPSIG(wstatus));
-//        } else if (WIFCONTINUED(wstatus)) {
-//            printf("continued\n");
-//        }
-    } while (!WIFEXITED(wstatus) && !WIFSIGNALED(wstatus));
-
-SM_END(SM_SUCCESS)
-}
-
-SM_RESULT sm_test(
-    sm_Runtime *Runtime_p, SM_BYTE *name_p)
-{
-SM_BEGIN()
-
-    sm_ExternalFunction Initializer;
-    sm_ExternalFunction Loader;
-
-    sm_TestEnvironment TestEnvironment = 
-        sm_initializeTestEnvironment(Runtime_p, &Initializer, &Loader, name_p);
-
-    SM_CHECK(sm_runTestEnvironment(&TestEnvironment, &Runtime_p->TestArray))
-
-SM_END(SM_SUCCESS)
-}
-
-//SM_BYTE *sm_getTestResult(
-//    sm_Process *Fork_p)
-//{
-//SM_BEGIN()
-//
-//    if (Fork_p->id != 0) {
-//        SM_BYTE *receive_p = sm_readFromChannel(&Fork_p->IPC.Out, NULL);
-//        if (receive_p != NULL) {
-//            SM_CHECK(sm_handleIPCReceive(receive_p))
-//        }
-//// TODO free?
-//    }
-//
-//SM_END(SM_SIGNAL_OK)
-//}
-//
-//SM_RESULT sm_destroyTestEnvironment(
-//    sm_TestEnvironment *TestEnvironment_p)
-//{
-//SM_BEGIN()
-//
-//SM_END(SM_SUCCESS)
-//}
-
-
-// TEST ARRAY ======================================================================================
-
-void sm_initTestArray(
-    sm_TestArray *Array_p)
-{
-SM_BEGIN()
-
-    Array_p->length = 0;
-    Array_p->Tests_p = NULL;
-
-SM_SILENT_END()
-}
-
-static sm_Test sm_initTest()
-{
-SM_BEGIN()
-
-    sm_Test Test;
-    Test.Context_p = NULL;
-    Test.name_p = NULL;
-    Test.dl_p = NULL;
-    Test.arguments = 0;
-    Test.Arguments_p = NULL;
-
-SM_END(Test)
-}
-
-SM_RESULT sm_addTest(
-    sm_SourceContextArray *ContextArray_p, sm_TestArray *TestArray_p, sm_Function *Function_p)
-{
-SM_BEGIN()
-
-    sm_SourceContext *Context_p = NULL;
-    sm_Test *Test_p = NULL;
-
-    for (int i = 0; i < Function_p->arguments; ++i) 
-    {
-        if (Function_p->argumentTypes_p[i] == SM_TOKEN_IDENTIFIER) {
-            for (int j = 0; j < ContextArray_p->length; ++j) {
-                if (!strcmp(ContextArray_p->SourceContexts_p[j].name_p, Function_p->arguments_pp[i])) {
-                    Context_p = &ContextArray_p->SourceContexts_p[j];
-                }
-            }
-        }
-        else {
-
-            if (!Context_p) {
-                SM_DIAGNOSTIC_END(SM_ERROR_BAD_STATE)
-            }
-
-            if (!Test_p)
-            {
-                if (!TestArray_p->Tests_p) {
-                    TestArray_p->Tests_p = malloc(sizeof(sm_Test));
-                    SM_CHECK_NULL(TestArray_p->Tests_p)
-                }
-                else {
-                    TestArray_p->Tests_p = realloc(TestArray_p->Tests_p, sizeof(sm_Test) * (TestArray_p->length + 1));
-                    SM_CHECK_NULL(TestArray_p->Tests_p)
-                }
-        
-                Test_p = &TestArray_p->Tests_p[TestArray_p->length];
-                *Test_p = sm_initTest();
-
-                Test_p->Context_p = Context_p;
-                Test_p->name_p = malloc(strlen(Function_p->arguments_pp[i]) + 1);
-                SM_CHECK_NULL(Test_p->name_p)
-                sprintf(Test_p->name_p, Function_p->arguments_pp[i]);
-        
-                TestArray_p->length++;
-                
-                SM_BYTE offset_p[64];
-                sm_getIndentAfterSourceContext(Context_p->name_p, offset_p, 64, ContextArray_p);
-                sm_messagef("[%s]%s Add test \"%s\"", Context_p->name_p, offset_p, Test_p->name_p);
-            }
-            else
-            {
-                if (!Test_p->Arguments_p) {
-                    Test_p->Arguments_p = malloc(sizeof(sm_TestArgument));
-                    SM_CHECK_NULL(Test_p->Arguments_p)
-                }
-                else {
-                    Test_p->Arguments_p = realloc(Test_p->Arguments_p, sizeof(sm_TestArgument) * (Test_p->arguments + 1));
-                    SM_CHECK_NULL(Test_p->Arguments_p)
-                }
-        
-                sm_TestArgument *TestArgument_p = &Test_p->Arguments_p[Test_p->arguments];
-
-                TestArgument_p->p = malloc(strlen(Function_p->arguments_pp[i]) + 1);
-                SM_CHECK_NULL(TestArgument_p->p)
-                sprintf(TestArgument_p->p, Function_p->arguments_pp[i]);
-        
-                Test_p->arguments++;
-            }
-        }
-    }
-
-SM_DIAGNOSTIC_END(SM_SUCCESS)
-}
-
diff --git a/external/selfmake/src/lib/Test/Test.h b/external/selfmake/src/lib/Test/Test.h
deleted file mode 100644
index 3844f3a..0000000
--- a/external/selfmake/src/lib/Test/Test.h
+++ /dev/null
@@ -1,69 +0,0 @@
-#ifndef SM_TEST_H
-#define SM_TEST_H
-
-#ifndef DOXYGEN_SHOULD_SKIP_THIS
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-#include "Process.h"
-
-#include "../Common/Result.h"
-#include "../Common/Types.h"
-
-#endif
-
-/** @addtogroup selfmakeStructs
- *  @{
- */
-
-    typedef struct sm_ExternalFunction {
-        SM_BYTE *libraryName_p;
-        SM_BYTE *functionName_p;
-    } sm_ExternalFunction;
-
-    typedef struct sm_Test {
-        sm_SourceContext *Context_p;
-        SM_BYTE *name_p;
-        void *dl_p;
-        int arguments;
-        sm_TestArgument *Arguments_p;
-    } sm_Test;
-
-    typedef struct sm_TestArray {
-        int length;
-        sm_Test *Tests_p;
-    } sm_TestArray;
-
-    typedef struct sm_TestEnvironment {
-        sm_Process Process;
-        sm_ExternalFunction *Initializer_p;
-        sm_ExternalFunction *Loader_p;
-        sm_TestArray *TestArray_p;
-        SM_BYTE *target_p;
-    } sm_TestEnvironment;
-
-/** @} */
-
-/** @addtogroup selfmakeFunctions
- *  @{
- */
-
-    void sm_initTestArray(
-        sm_TestArray *Array_p
-    );
-    
-    SM_RESULT sm_addTest(
-        sm_SourceContextArray *ContextArray_p, sm_TestArray *TestArray_p, sm_Function *Function_p
-    );
-
-    SM_RESULT sm_test(
-        sm_Runtime *Runtime_p, SM_BYTE *name_p
-    );
-
-/** @} */
-
-#endif
diff --git a/external/selfmake/src/lib/UI/GUI.c b/external/selfmake/src/lib/UI/GUI.c
deleted file mode 100644
index 08995df..0000000
--- a/external/selfmake/src/lib/UI/GUI.c
+++ /dev/null
@@ -1,58 +0,0 @@
-// LICENSE NOTICE ==================================================================================
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-// INCLUDE =========================================================================================
-
-#include "GUI.h"
-#include "X11.h"
-
-#include "../Common/Macro.h"
-#include "../Common/API.h"
-#include SM_FLOW
-#include SM_DEFAULT_CHECK
-
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <unistd.h>
-
-// DATA ============================================================================================
-
-SM_BOOL SM_GUI = SM_FALSE;
-static SM_BOOL run = SM_TRUE;
-
-// BUILD ===========================================================================================
-
-SM_RESULT sm_runGUI()
-{
-SM_BEGIN()
-
-    sm_X11_createWindow("netzhaut-Installer", 300, 300);
-    while (run) {sm_X11_getInput();}
-    
-SM_DIAGNOSTIC_END(SM_SUCCESS)
-}
-
-SM_RESULT sm_handleGUIExpose()
-{
-SM_BEGIN()
-
-    sm_X11_drawTextLine(5, 5, "Building via GUI is planned, but not implemented yet. Please use the command-line for now.");
-
-SM_END(SM_SUCCESS)
-}
-
-void sm_handleGUIExit()
-{
-SM_BEGIN()
-
-    run = SM_FALSE;
-
-SM_SILENT_END()
-}
-
diff --git a/external/selfmake/src/lib/UI/GUI.h b/external/selfmake/src/lib/UI/GUI.h
deleted file mode 100644
index c0efb98..0000000
--- a/external/selfmake/src/lib/UI/GUI.h
+++ /dev/null
@@ -1,40 +0,0 @@
-#ifndef SM_GUI_H
-#define SM_GUI_H
-
-#ifndef DOXYGEN_SHOULD_SKIP_THIS
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-#include "../Common/Result.h"
-#include "../Common/Types.h"
-
-#endif
-
-/** @addtogroup selfmakeVars
- *  @{
- */
-
-    extern SM_BOOL SM_GUI;
-
-/** @} */
-
-/** @addtogroup selfmakeFunctions
- *  @{
- */
-
-    SM_RESULT sm_runGUI(
-    );
-
-    SM_RESULT sm_handleGUIExpose(
-    );
-
-    void sm_handleGUIExit(
-    );
-
-/** @} */
-
-#endif
diff --git a/external/selfmake/src/lib/UI/Message.h b/external/selfmake/src/lib/UI/Message.h
deleted file mode 100644
index 9fc4b52..0000000
--- a/external/selfmake/src/lib/UI/Message.h
+++ /dev/null
@@ -1,43 +0,0 @@
-#ifndef SM_MESSAGE_H
-#define SM_MESSAGE_H
-
-#ifndef DOXYGEN_SHOULD_SKIP_THIS
-
-/**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
- * Published under MIT
- */
-
-#include "../Common/Result.h"
-#include "../Common/Types.h"
-
-#endif
-
-/** @addtogroup selfmakeFunctions
- *  @{
- */
-
-    SM_RESULT sm_operationf(
-        SM_BYTE *format_p, ...
-    );
-    
-    SM_RESULT sm_messagef(
-        SM_BYTE *format_p, ...
-    );
-
-    SM_RESULT sm_noticef(
-        SM_BYTE *format_p, ...
-    );
-
-    SM_RESULT sm_externalMessage(
-        SM_BYTE *prepend_p, SM_BYTE *message_p
-    );
-
-    SM_RESULT sm_exitMessage(
-        SM_RESULT result
-    );
-
-/** @} */
-
-#endif
diff --git a/src/bin/netzhaut/About.h b/src/bin/netzhaut/About.h
index 511affd..1a2d624 100644
--- a/src/bin/netzhaut/About.h
+++ b/src/bin/netzhaut/About.h
@@ -42,7 +42,7 @@
      * 2021-10-03 | v0.0.0.0
      * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
-    #define NETZHAUT_MAJOR_VERSION 0
+    #define NETZHAUT_MAJOR_VERSION 2
 
     /**
      * Minor version.
@@ -50,7 +50,7 @@
      * 2021-10-03 | v0.0.0.0 
      * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
-    #define NETZHAUT_MINOR_VERSION 0
+    #define NETZHAUT_MINOR_VERSION 2
 
     /**
      * Patch version.
diff --git a/src/bin/nhcore/About.h b/src/bin/nhcore/About.h
index 44f0d16..5937528 100644
--- a/src/bin/nhcore/About.h
+++ b/src/bin/nhcore/About.h
@@ -38,7 +38,7 @@
      * 2021-10-02 | v0.0.0.0
      * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
-    #define NH_CORE_MAJOR_VERSION 0
+    #define NH_CORE_MAJOR_VERSION 1
 
     /**
      * Minor version.
@@ -46,7 +46,7 @@
      * 2021-10-02 | v0.0.0.0 
      * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
-    #define NH_CORE_MINOR_VERSION 0
+    #define NH_CORE_MINOR_VERSION 4
 
     /**
      * Patch version.
diff --git a/src/bin/nhhtml/About.h b/src/bin/nhhtml/About.h
index 6f53c9c..d2855ed 100644
--- a/src/bin/nhhtml/About.h
+++ b/src/bin/nhhtml/About.h
@@ -46,7 +46,7 @@
      * 2021-02-23 | v0.0.0.0 
      * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
-    #define NH_HTML_MINOR_VERSION 0
+    #define NH_HTML_MINOR_VERSION 2
 
     /**
      * Patch version.
@@ -54,7 +54,7 @@
      * 2021-02-23 | v0.0.0.0 
      * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
-    #define NH_HTML_PATCH_VERSION 0
+    #define NH_HTML_PATCH_VERSION 1
 
 /** @} */
 
diff --git a/src/bin/nhhtml/Main.c b/src/bin/nhhtml/Main.c
index bfe3a9f..66b75a6 100644
--- a/src/bin/nhhtml/Main.c
+++ b/src/bin/nhhtml/Main.c
@@ -39,7 +39,7 @@ static void *getFileData(
     return data_p;
 }
 
-static nh_tty_PseudoTerminal *PseudoTerminal_p = NULL;
+static nh_tty_TTY *TTY_p = NULL;
 
 static void handleInput(
     nh_wsi_Window *Window_p, nh_wsi_Event Event)
@@ -47,7 +47,7 @@ static void handleInput(
     switch (Event.type)
     {
         case NH_WSI_EVENT_KEYBOARD :
-            nh_tty_sendInput(PseudoTerminal_p, Event);
+            nh_tty_sendInput(TTY_p, Event);
             break;
     }
 }
@@ -55,14 +55,14 @@ static void handleInput(
 static int openLogger(
     nh_gfx_Surface *Surface_p)
 {
-    PseudoTerminal_p = nh_tty_openPseudoTerminal();
-    if (!PseudoTerminal_p) {return 1;}
+    TTY_p = nh_tty_openTTY();
+    if (!TTY_p) {return 1;}
 
-    if (nh_tty_addDefaultProgram(PseudoTerminal_p, "logger") != NH_TTY_SUCCESS) {
+    if (nh_tty_addDefaultProgram(TTY_p, "logger") != NH_TTY_SUCCESS) {
         return 1;
     }
 
-    nh_term_Terminal *Terminal_p =  nh_term_openTerminal(PseudoTerminal_p);
+    nh_term_Terminal *Terminal_p =  nh_term_openTerminal(TTY_p);
     if (!Terminal_p) {return 1;}
 
     nh_PixelSize Size;
diff --git a/src/bin/nhmake/About.c b/src/bin/nhmake/About.c
new file mode 100644
index 0000000..b2c336e
--- /dev/null
+++ b/src/bin/nhmake/About.c
@@ -0,0 +1,21 @@
+// LICENSE NOTICE ==================================================================================
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2020 The netzhaut Authors
+ * Published under MIT
+ */
+
+// INCLUDE ==========================================================================================
+
+#include "About.h"
+
+// VERSION =========================================================================================
+
+int NH_MAKE_VERSION_P[4] = {
+    NH_MAKE_API_VERSION, 
+    NH_MAKE_MAJOR_VERSION, 
+    NH_MAKE_MINOR_VERSION,
+    NH_MAKE_PATCH_VERSION,
+};
+
diff --git a/src/bin/nhmake/Callbacks.c b/src/bin/nhmake/Callbacks.c
new file mode 100644
index 0000000..9ec6d33
--- /dev/null
+++ b/src/bin/nhmake/Callbacks.c
@@ -0,0 +1,122 @@
+// LICENSE NOTICE ==================================================================================
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2020 The netzhaut Authors
+ * Published under MIT
+ */
+
+// INCLUDE =========================================================================================
+
+#include "Callbacks.h"
+#include "Documents.h"
+#include "UnicodeData.h"
+#include "WebIDL.h"
+#include "Version.h"
+
+#include "../../lib/netzhaut/nhmake.h"
+
+#include <stdio.h>
+#include <string.h>
+#include <stdlib.h>
+#include <ctype.h>
+#include <time.h>
+
+// CALLBACKS =======================================================================================
+
+// TODO Fix memory leak.
+NH_MAKE_RESULT printChanges(
+    nh_make_Runtime *Runtime_p, nh_make_Function *Function_p)
+{
+    if (Function_p->arguments < 1) {
+        return NH_MAKE_ERROR_BAD_STATE;
+    }
+
+    nh_make_ChangesNode *Tree_p = nh_make_parseChangesFile(Function_p->arguments_pp[0]);
+    int num = 0;
+    nh_make_Changes *Changes_p = nh_make_getChanges(Tree_p, &num);
+
+    for (int i = 0; i < num; ++i) {
+        if (Function_p->arguments <= 1) {
+            nh_make_printChanges(Runtime_p, Changes_p+i, NH_MAKE_PRINT_CHANGES_DEFAULT);
+        }
+        else if (!strcmp(Function_p->arguments_pp[1], "git")) {
+            nh_make_printChanges(Runtime_p, Changes_p+i, NH_MAKE_PRINT_CHANGES_GIT);
+        }
+    }
+
+    return NH_MAKE_SUCCESS;
+}
+
+NH_MAKE_RESULT printVersions(
+    nh_make_Runtime *Runtime_p)
+{
+    nh_make_SourceContextArray *Array_p = nh_make_getSourceContextArray(Runtime_p);
+
+    for (int j = 0; j < Array_p->length; j++) {
+        nh_make_SourceContext SourceContext = Array_p->SourceContexts_p[j];
+        NH_BYTE string_p[255];
+        nh_make_stringifySourceContextNameAndVersion(&SourceContext, string_p);
+        nh_make_messagef(string_p);
+    }
+
+    return NH_MAKE_SUCCESS;
+}
+
+// TODO Fix memory leak.
+static NH_BYTE *getChanges(
+    NH_BYTE *path_p, NH_BYTE *changes_p, int length)
+{
+    nh_make_ChangesNode *Root_p = nh_make_parseChangesFile(path_p);
+    nh_make_Changes *Changes_p = nh_make_getChanges(Root_p, NULL);
+
+    nh_make_addDateAndIdToChanges(Changes_p);
+    nh_make_normalizeChanges(Changes_p, changes_p, length);
+
+    return changes_p;
+}
+
+// TODO Fix memory leak.
+NH_MAKE_RESULT updateHistory(
+    nh_make_Runtime *Runtime_p, nh_make_Function *Function_p)
+{
+    if (Function_p->arguments != 1) {
+        return NH_MAKE_ERROR_BAD_STATE;
+    }
+
+    int length = 4096;
+    NH_BYTE changes_p[length];
+    memset(changes_p, 0, length);
+    getChanges(Function_p->arguments_pp[0], changes_p, length);
+    strcpy(changes_p+strlen(changes_p), "\n");
+
+    nh_make_ValueArray History = nh_make_getVariableValues(Runtime_p, "HISTORY");
+    if (!History.length) {return NH_MAKE_ERROR_BAD_STATE;}
+
+    NH_BYTE *data_p = nh_make_getFileData(History.values_pp[0], NULL);
+    if (!data_p) {return NH_MAKE_ERROR_BAD_STATE;}
+
+    NH_BYTE *newData_p = malloc(sizeof(NH_BYTE)*(strlen(data_p)+strlen(changes_p)+1));
+    if (!data_p) {return NH_MAKE_ERROR_BAD_STATE;}
+    memset(newData_p, 0, sizeof(NH_BYTE)*(strlen(data_p)+strlen(changes_p)+1));
+
+    sprintf(newData_p, "%s%s", changes_p, data_p);
+    nh_make_writeBytesToFile(History.values_pp[0], newData_p);
+
+    free(newData_p);
+    free(data_p);
+
+    return NH_MAKE_SUCCESS;
+}
+
+NH_MAKE_RESULT updateVersions(
+    nh_make_Runtime *Runtime_p, nh_make_Function *Function_p)
+{
+    nh_make_updateVersions(Runtime_p);
+    nh_make_SourceContextArray *Array_p = nh_make_getSourceContextArray(Runtime_p);
+    for (int i = 0; i < Array_p->length; ++i) {
+        updateVersionInAboutFile(Array_p->SourceContexts_p+i);
+    }
+    return NH_MAKE_SUCCESS;
+}
+
diff --git a/src/bin/nhmake/Callbacks.h b/src/bin/nhmake/Callbacks.h
new file mode 100644
index 0000000..8dc9b86
--- /dev/null
+++ b/src/bin/nhmake/Callbacks.h
@@ -0,0 +1,38 @@
+#ifndef CALLBACKS_H
+#define CALLBACKS_H
+
+#ifndef DOXYGEN_SHOULD_SKIP_THIS
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2022 The netzhaut Authors
+ * Published under MIT
+ */
+
+#include "../../lib/netzhaut/nhmake.h"
+
+#endif
+
+/** @addtogroup bin_nhmake_functions
+ *  @{
+ */
+
+    NH_MAKE_RESULT printChanges(
+        nh_make_Runtime *Runtime_p, nh_make_Function *Function_p
+    );
+    
+    NH_MAKE_RESULT printVersions(
+        nh_make_Runtime *Runtime_p
+    );
+    
+    NH_MAKE_RESULT updateHistory(
+        nh_make_Runtime *Runtime_p, nh_make_Function *Function_p
+    );
+    
+    NH_MAKE_RESULT updateVersions(
+        nh_make_Runtime *Runtime_p, nh_make_Function *Function_p
+    );
+
+/** @} */
+
+#endif
diff --git a/src/bin/nhmake/Documents.c b/src/bin/nhmake/Documents.c
index 1d72dd5..89c15d2 100644
--- a/src/bin/nhmake/Documents.c
+++ b/src/bin/nhmake/Documents.c
@@ -23,10 +23,10 @@
 
 // HELPER ==========================================================================================
 
-static long *nh_make_getLatestDate(
+static long *getLatestDate(
     long date1_p[3], long date2_p[3], long date3_p[3])
 {
-    SM_BOOL ignoreDate2 = SM_FALSE, ignoreDate3 = SM_FALSE;
+    NH_BOOL ignoreDate2 = NH_FALSE, ignoreDate3 = NH_FALSE;
 
     if (date1_p[0] > date2_p[0] && date1_p[0] > date3_p[0]) {
         return date1_p;
@@ -34,8 +34,8 @@ static long *nh_make_getLatestDate(
     else if (date1_p[0] < date2_p[0] || date1_p[0] < date3_p[0]) {
         return NULL;
     }
-    if (date1_p[0] > date2_p[0]) {ignoreDate2 = SM_TRUE;}
-    if (date1_p[0] > date3_p[0]) {ignoreDate3 = SM_TRUE;}
+    if (date1_p[0] > date2_p[0]) {ignoreDate2 = NH_TRUE;}
+    if (date1_p[0] > date3_p[0]) {ignoreDate3 = NH_TRUE;}
 
     if ((ignoreDate2 || date1_p[1] > date2_p[1]) && (ignoreDate3 || date1_p[1] > date3_p[1])) {
         return date1_p;
@@ -43,8 +43,8 @@ static long *nh_make_getLatestDate(
     else if (date1_p[1] < date2_p[1] || date1_p[1] < date3_p[1]) {
         return NULL;
     }
-    if (date1_p[1] > date2_p[1]) {ignoreDate2 = SM_TRUE;}
-    if (date1_p[1] > date3_p[1]) {ignoreDate3 = SM_TRUE;}
+    if (date1_p[1] > date2_p[1]) {ignoreDate2 = NH_TRUE;}
+    if (date1_p[1] > date3_p[1]) {ignoreDate3 = NH_TRUE;}
 
 
     if ((ignoreDate2 || date1_p[2] > date2_p[2]) && (ignoreDate3 || date1_p[2] > date3_p[2])) {
@@ -59,101 +59,106 @@ static long *nh_make_getLatestDate(
 
 // INSERT ==========================================================================================
 
-static SM_BYTE *nh_make_insertVersion(
-    sm_Runtime *Runtime_p, SM_BYTE *data_p, size_t size, SM_BOOL ver)
+static NH_BYTE *insertVersion(
+    nh_make_Runtime *Runtime_p, NH_BYTE *data_p, size_t size, NH_BOOL ver)
 {
-    int offset = 0;
-
-    while (ver ? strstr(data_p + offset, "NH_MAKE_INSERT_VER_BEGIN") : strstr(data_p + offset, "NH_MAKE_INSERT_REV_BEGIN"))
-    {
-        SM_BYTE *new_p = malloc(size + 10000);
-        memset(new_p, 0, size + 10000);
-
-        SM_BYTE *before_p = data_p;
-        SM_BYTE *after_p = ver ? strstr(before_p + offset, "NH_MAKE_INSERT_VER_BEGIN") : strstr(before_p + offset, "NH_MAKE_INSERT_REV_BEGIN");
-        if (!after_p) {return NULL;}
-
-        after_p += 28;
-        *after_p = 0;
-
-        sprintf(new_p, before_p);
-        offset = strlen(new_p);
-
-        SM_BYTE version_p[255];
-        if (ver) {nh_make_getVersion(Runtime_p, version_p);}
-        else {nh_make_getRevision(Runtime_p, version_p);}
-        sprintf(new_p + strlen(new_p), "\n<b>%s</b>", version_p);
-
-        after_p = ver ? strstr(after_p + 1, "<!-- NH_MAKE_INSERT_VER_END") : strstr(after_p + 1, "<!-- NH_MAKE_INSERT_REV_END"); 
-        if (!after_p) {return NULL;}
-
-        sprintf(new_p + strlen(new_p), "\n%s", after_p);
-
-        SM_BOOL next = ver ? strstr(after_p, "NH_MAKE_INSERT_VER_BEGIN") != NULL : strstr(after_p, "NH_MAKE_INSERT_REV_BEGIN") != NULL;
-
-        free(data_p);
-        data_p = new_p;
-    }
-
-    return data_p;
+//    int offset = 0;
+//
+//    while (ver ? strstr(data_p + offset, "NH_MAKE_INSERT_VER_BEGIN") : strstr(data_p + offset, "NH_MAKE_INSERT_REV_BEGIN"))
+//    {
+//        NH_BYTE *new_p = malloc(size + 10000);
+//        memset(new_p, 0, size + 10000);
+//
+//        NH_BYTE *before_p = data_p;
+//        NH_BYTE *after_p = ver ? strstr(before_p + offset, "NH_MAKE_INSERT_VER_BEGIN") : 
+//            strstr(before_p + offset, "NH_MAKE_INSERT_REV_BEGIN");
+//
+//        if (!after_p) {return NULL;}
+//
+//        after_p += 28;
+//        *after_p = 0;
+//
+//        sprintf(new_p, before_p);
+//        offset = strlen(new_p);
+//
+//        NH_BYTE version_p[255];
+//        if (ver) {getVersion(Runtime_p, version_p);}
+//        else {getRevision(Runtime_p, version_p);}
+//        sprintf(new_p + strlen(new_p), "\n<b>%s</b>", version_p);
+//
+//        after_p = ver ? strstr(after_p + 1, "<!-- NH_MAKE_INSERT_VER_END") : 
+//            strstr(after_p + 1, "<!-- NH_MAKE_INSERT_REV_END"); 
+//
+//        if (!after_p) {return NULL;}
+//
+//        sprintf(new_p + strlen(new_p), "\n%s", after_p);
+//
+//        NH_BOOL next = ver ? strstr(after_p, "NH_MAKE_INSERT_VER_BEGIN") != NULL : 
+//            strstr(after_p, "NH_MAKE_INSERT_REV_BEGIN") != NULL;
+//
+//        free(data_p);
+//        data_p = new_p;
+//    }
+//
+//    return data_p;
 }
 
-static SM_BYTE *nh_make_insertChangelogs(
-    sm_SourceContextArray *Array_p, SM_BYTE *data_p, size_t size)
+static NH_BYTE *insertChangelogs(
+    nh_make_SourceContextArray *Array_p, NH_BYTE *data_p, size_t size)
 {
-    SM_BYTE *new_p = malloc(size + 10000);
-    memset(new_p, 0, size + 10000);
-
-    SM_BYTE *before_p = data_p;
-    SM_BYTE *after_p = strstr(data_p, "NH_MAKE_INSERT_CHANGELOGS_BEGIN"); 
-    if (!after_p) {return NULL;}
-    
-    after_p += 35;
-    *after_p = 0;
-
-    sprintf(new_p, before_p);
-
-    for (int i = 0; i < Array_p->length; ++i) 
-    {
-        sm_SourceContext *Context_p = &Array_p->SourceContexts_p[i];
-        
-        long *date_p = nh_make_getLatestDate(Context_p->majorDate_p, Context_p->minorDate_p, Context_p->patchDate_p);
-        if (!date_p) {date_p = nh_make_getLatestDate(Context_p->minorDate_p, Context_p->majorDate_p, Context_p->patchDate_p);}
-        if (!date_p) {date_p = nh_make_getLatestDate(Context_p->patchDate_p, Context_p->majorDate_p, Context_p->minorDate_p);}
-        if (!date_p) {date_p = Context_p->majorDate_p;} 
-        
-        SM_BYTE line_p[512];
-
-        sprintf(line_p, "\n%d-%02d-%02d", date_p[0], date_p[1], date_p[2]);
-        sprintf(line_p+strlen(line_p), Context_p->type == SM_SOURCE_CONTEXT_BINARY ? " bin " : " lib ");
-        sprintf(line_p+strlen(line_p), Context_p->type == SM_SOURCE_CONTEXT_BINARY ? 
-            "<a href=\"dev/html/group__bin__%s__changelog.html" 
-         :  "<a href=\"dev/html/group__lib__%s__changelog.html", Context_p->name_p);
-        sprintf(line_p+strlen(line_p), "#v%d.%d.%d.%d\">%s v%d.%d.%d.%d</a><br>", 
-            Context_p->api, Context_p->major, Context_p->minor, Context_p->patch, Context_p->name_p, 
-            Context_p->api, Context_p->major, Context_p->minor, Context_p->patch);
-
-        sprintf(new_p+strlen(new_p), line_p);
-    }
-
-    after_p = strstr(after_p + 1, "<!-- NH_MAKE_INSERT_CHANGELOGS_END"); 
-    if (!after_p) {return NULL;}
-
-    sprintf(new_p + strlen(new_p), "\n%s", after_p);
-
-    free(data_p);
-
-    return new_p;
+//    NH_BYTE *new_p = malloc(size + 10000);
+//    memset(new_p, 0, size + 10000);
+//
+//    NH_BYTE *before_p = data_p;
+//    NH_BYTE *after_p = strstr(data_p, "NH_MAKE_INSERT_CHANGELOGS_BEGIN"); 
+//    if (!after_p) {return NULL;}
+//    
+//    after_p += 35;
+//    *after_p = 0;
+//
+//    sprintf(new_p, before_p);
+//
+//    for (int i = 0; i < Array_p->length; ++i) 
+//    {
+//        nh_make_SourceContext *Context_p = &Array_p->SourceContexts_p[i];
+//        
+//        long *date_p = getLatestDate(Context_p->majorDate_p, Context_p->minorDate_p, Context_p->patchDate_p);
+//        if (!date_p) {date_p = getLatestDate(Context_p->minorDate_p, Context_p->majorDate_p, Context_p->patchDate_p);}
+//        if (!date_p) {date_p = getLatestDate(Context_p->patchDate_p, Context_p->majorDate_p, Context_p->minorDate_p);}
+//        if (!date_p) {date_p = Context_p->majorDate_p;} 
+//        
+//        NH_BYTE line_p[512];
+//
+//        sprintf(line_p, "\n%d-%02d-%02d", date_p[0], date_p[1], date_p[2]);
+//        sprintf(line_p+strlen(line_p), Context_p->type == NH_MAKE_SOURCE_CONTEXT_BINARY ? " bin " : " lib ");
+//        sprintf(line_p+strlen(line_p), Context_p->type == NH_MAKE_SOURCE_CONTEXT_BINARY ? 
+//            "<a href=\"dev/html/group__bin__%s__changelog.html" 
+//         :  "<a href=\"dev/html/group__lib__%s__changelog.html", Context_p->name_p);
+//        sprintf(line_p+strlen(line_p), "#v%d.%d.%d.%d\">%s v%d.%d.%d.%d</a><br>", 
+//            Context_p->api, Context_p->major, Context_p->minor, Context_p->patch, Context_p->name_p, 
+//            Context_p->api, Context_p->major, Context_p->minor, Context_p->patch);
+//
+//        sprintf(new_p+strlen(new_p), line_p);
+//    }
+//
+//    after_p = strstr(after_p + 1, "<!-- NH_MAKE_INSERT_CHANGELOGS_END"); 
+//    if (!after_p) {return NULL;}
+//
+//    sprintf(new_p + strlen(new_p), "\n%s", after_p);
+//
+//    free(data_p);
+//
+//    return new_p;
 }
 
-static SM_BYTE *nh_make_insertNews(
-    sm_Runtime *Runtime_p, SM_BYTE *data_p, size_t size)
+static NH_BYTE *insertNews(
+    nh_make_Runtime *Runtime_p, NH_BYTE *data_p, size_t size)
 {
-    SM_BYTE *new_p = malloc(size + 10000);
+    NH_BYTE *new_p = malloc(size + 10000);
     memset(new_p, 0, size + 10000);
 
-    SM_BYTE *before_p = data_p;
-    SM_BYTE *after_p = strstr(data_p, "NH_MAKE_INSERT_NEWS_BEGIN"); 
+    NH_BYTE *before_p = data_p;
+    NH_BYTE *after_p = strstr(data_p, "NH_MAKE_INSERT_NEWS_BEGIN"); 
     if (!after_p) {return NULL;}
     
     after_p += 29;
@@ -161,7 +166,7 @@ static SM_BYTE *nh_make_insertNews(
 
     sprintf(new_p, before_p);
 
-    sm_ValueArray News = sm_getVariableValues(Runtime_p, "NEWS");
+    nh_make_ValueArray News = nh_make_getVariableValues(Runtime_p, "NEWS");
 
     for (int i = 0; i < News.length; ++i) {
         sprintf(new_p + strlen(new_p), "\n");
@@ -178,18 +183,18 @@ static SM_BYTE *nh_make_insertNews(
     return new_p;
 }
 
-static SM_BYTE *nh_make_insertStage(
-    sm_Runtime *Runtime_p, SM_BYTE *data_p, size_t size)
+static NH_BYTE *insertStage(
+    nh_make_Runtime *Runtime_p, NH_BYTE *data_p, size_t size)
 {
     int offset = 0;
 
     while (strstr(data_p + offset, "NH_MAKE_INSERT_STAGE_BEGIN"))
     {
-        SM_BYTE *new_p = malloc(size + 10000);
+        NH_BYTE *new_p = malloc(size + 10000);
         memset(new_p, 0, size + 10000);
     
-        SM_BYTE *before_p = data_p;
-        SM_BYTE *after_p = strstr(data_p + offset, "NH_MAKE_INSERT_STAGE_BEGIN"); 
+        NH_BYTE *before_p = data_p;
+        NH_BYTE *after_p = strstr(data_p + offset, "NH_MAKE_INSERT_STAGE_BEGIN"); 
         if (!after_p) {return NULL;}
         
         after_p += 30;
@@ -198,7 +203,7 @@ static SM_BYTE *nh_make_insertStage(
         sprintf(new_p, before_p);
         offset = strlen(new_p);
 
-        sm_ValueArray Stage = sm_getVariableValues(Runtime_p, "PROJ_STAGE");
+        nh_make_ValueArray Stage = nh_make_getVariableValues(Runtime_p, "PROJ_STAGE");
         sprintf(new_p + strlen(new_p), "\n");
         if (Stage.length) {sprintf(new_p + strlen(new_p), "<b>%s</b>", Stage.values_pp[0]);}
     
@@ -216,42 +221,42 @@ static SM_BYTE *nh_make_insertStage(
 
 // GENERATE ========================================================================================
 
-SM_RESULT nh_make_generateHomepage(
-    sm_Runtime *Runtime_p)
+NH_MAKE_RESULT generateHomepage(
+    nh_make_Runtime *Runtime_p)
 {
     long size;
-    SM_BYTE *data_p = sm_getFileData("external/DOWNLOADS/netzhaut.netzwerkz.org/docs/index.html", &size);
-    if (!data_p) {return SM_ERROR_BAD_STATE;}
+    NH_BYTE *data_p = nh_make_getFileData("external/DOWNLOADS/netzhaut.netzwerkz.org/docs/index.html", &size);
+    if (!data_p) {return NH_MAKE_ERROR_BAD_STATE;}
 
-    data_p = nh_make_insertChangelogs(sm_getSourceContextArray(Runtime_p), data_p, size);
-    data_p = nh_make_insertVersion(Runtime_p, data_p, size, SM_TRUE);
-    data_p = nh_make_insertVersion(Runtime_p, data_p, size, SM_FALSE);
-    data_p = nh_make_insertNews(Runtime_p, data_p, size);
-    data_p = nh_make_insertStage(Runtime_p, data_p, size);
+    data_p = insertChangelogs(nh_make_getSourceContextArray(Runtime_p), data_p, size);
+    data_p = insertVersion(Runtime_p, data_p, size, NH_TRUE);
+    data_p = insertVersion(Runtime_p, data_p, size, NH_FALSE);
+    data_p = insertNews(Runtime_p, data_p, size);
+    data_p = insertStage(Runtime_p, data_p, size);
 
-    sm_writeBytesToFile("external/DOWNLOADS/netzhaut.netzwerkz.org/docs/index.html", data_p);
+    nh_make_writeBytesToFile("external/DOWNLOADS/netzhaut.netzwerkz.org/docs/index.html", data_p);
 
     free(data_p);
 
-    return SM_SUCCESS;
+    return NH_MAKE_SUCCESS;
 }
 
-SM_RESULT nh_make_generateFooter(
-    sm_Runtime *Runtime_p)
+NH_MAKE_RESULT generateFooter(
+    nh_make_Runtime *Runtime_p)
 {
     long size;
-    SM_BYTE *data_p = sm_getFileData("external/DOWNLOADS/netzhaut.netzwerkz.org/docs/theme/footer1.html", &size);
-    if (!data_p) {return SM_ERROR_BAD_STATE;}
-    data_p = nh_make_insertVersion(Runtime_p, data_p, size, SM_TRUE);
-    sm_writeBytesToFile("external/DOWNLOADS/netzhaut.netzwerkz.org/docs/theme/footer1.html", data_p);
+    NH_BYTE *data_p = nh_make_getFileData("external/DOWNLOADS/netzhaut.netzwerkz.org/docs/theme/footer1.html", &size);
+    if (!data_p) {return NH_MAKE_ERROR_BAD_STATE;}
+    data_p = insertVersion(Runtime_p, data_p, size, NH_TRUE);
+    nh_make_writeBytesToFile("external/DOWNLOADS/netzhaut.netzwerkz.org/docs/theme/footer1.html", data_p);
     free(data_p);
 
-    data_p = sm_getFileData("external/DOWNLOADS/netzhaut.netzwerkz.org/docs/theme/footer2.html", &size);
-    if (!data_p) {return SM_ERROR_BAD_STATE;}
-    data_p = nh_make_insertVersion(Runtime_p, data_p, size, SM_FALSE);
-    sm_writeBytesToFile("external/DOWNLOADS/netzhaut.netzwerkz.org/docs/theme/footer2.html", data_p);
+    data_p = nh_make_getFileData("external/DOWNLOADS/netzhaut.netzwerkz.org/docs/theme/footer2.html", &size);
+    if (!data_p) {return NH_MAKE_ERROR_BAD_STATE;}
+    data_p = insertVersion(Runtime_p, data_p, size, NH_FALSE);
+    nh_make_writeBytesToFile("external/DOWNLOADS/netzhaut.netzwerkz.org/docs/theme/footer2.html", data_p);
     free(data_p);
 
-    return SM_SUCCESS;
+    return NH_MAKE_SUCCESS;
 }
 
diff --git a/src/bin/nhmake/Documents.h b/src/bin/nhmake/Documents.h
index d115ebb..b15261e 100644
--- a/src/bin/nhmake/Documents.h
+++ b/src/bin/nhmake/Documents.h
@@ -9,7 +9,7 @@
  * Published under MIT
  */
 
-#include "../../../external/selfmake/include/selfmake/selfmake.h"
+#include "../../lib/netzhaut/nhmake.h"
 
 #endif
 
@@ -17,10 +17,10 @@
  *  @{
  */
 
-    SM_RESULT nh_make_generateHomepage(
+    NH_MAKE_RESULT generateHomepage(
     );
 
-    SM_RESULT nh_make_generateFooter(
+    NH_MAKE_RESULT generateFooter(
     );
 
 /** @} */
diff --git a/src/bin/nhmake/Main.c b/src/bin/nhmake/Main.c
index f6604fb..648e2b7 100644
--- a/src/bin/nhmake/Main.c
+++ b/src/bin/nhmake/Main.c
@@ -8,80 +8,77 @@
 
 // INCLUDE =========================================================================================
 
+#include "Main.h"
 #include "Version.h"
 #include "Documents.h"
 #include "UnicodeData.h"
 #include "WebIDL.h"
+#include "Callbacks.h"
 
-#include "../../../external/selfmake/include/selfmake/selfmake.h"
+#include "../../lib/netzhaut/nhmake.h"
 
 #include <stdio.h>
 #include <string.h>
 #include <stdlib.h>
 #include <ctype.h>
+#include <time.h>
 
 // MAIN ============================================================================================
 
-static SM_RESULT nh_make_sourceContextCallback(
-    sm_Runtime *Runtime_p, sm_SourceContext *SourceContext_p)
-{
-    SM_RESULT result = nh_make_getSourceContextVersion(SourceContext_p);
-
-    SM_BYTE *version_p = malloc(255);
-    if (!version_p) {return SM_ERROR_NULL_POINTER;}
-
-    nh_make_getRevision(Runtime_p, version_p);
-    sm_setVariable(Runtime_p, "PROJ_REV", &version_p, 1);
-
-    free(version_p);
-
-    return result;
-}
-
-static SM_RESULT nh_make_functionCallback(
-    sm_Runtime *Runtime_p, sm_Function *Function_p)
+static NH_MAKE_RESULT functionCallback(
+    nh_make_Runtime *Runtime_p, nh_make_Function *Function_p)
 {
     if (!strcmp(Function_p->name_p, "generateFooter")) {
-        return nh_make_generateFooter(Runtime_p); 
+        return generateFooter(Runtime_p); 
     }
     else if (!strcmp(Function_p->name_p, "generateHomepage")) {
-        return nh_make_generateHomepage(Runtime_p); 
+        return generateHomepage(Runtime_p); 
     }
     else if (!strcmp(Function_p->name_p, "createUnicodeData")) {
-        return nh_make_createUnicodeData(Runtime_p);
+        return createUnicodeData(Runtime_p);
     }
     else if (!strcmp(Function_p->name_p, "processWebIDL")) {
-        return nh_make_processWebIDL(Runtime_p);
+        return processWebIDL(Runtime_p);
+    }
+    else if (!strcmp(Function_p->name_p, "printChanges")) {
+        return printChanges(Runtime_p, Function_p);
+    }
+    else if (!strcmp(Function_p->name_p, "printVersions")) {
+        return printVersions(Runtime_p);
+    }
+    else if (!strcmp(Function_p->name_p, "updateHistory")) {
+        return updateHistory(Runtime_p, Function_p);
+    }
+    else if (!strcmp(Function_p->name_p, "updateVersions")) {
+        return updateVersions(Runtime_p, Function_p);
     }
 
-    return SM_SUCCESS;
+    return NH_MAKE_SUCCESS;
 }
 
 int main(
     int argc, char **argv_pp)
 {
-    sm_initialize();
-
-    sm_Runtime *Runtime_p = sm_createRuntime("nhmake");
+    nh_make_initialize();
 
-    SM_BYTE *procDir_p = sm_getProcessDirectory();
-    sm_setVariable(Runtime_p, "WRK_DIR", &procDir_p, 1);
+    nh_make_Runtime *Runtime_p = nh_make_createRuntime("nhmake");
 
-    sm_addFile(Runtime_p, ".sm/override.sm");
-    sm_addFile(Runtime_p, ".sm/source.sm");
-    sm_addFile(Runtime_p, ".sm/options.sm");
-    sm_addFile(Runtime_p, ".sm/news.sm");
-    sm_addFile(Runtime_p, ".sm/idl.sm");
-    sm_addFile(Runtime_p, ".sm/test.sm");
+    NH_BYTE *procDir_p = nh_make_getProcessDirectory();
+    nh_make_setVariable(Runtime_p, "WRK_DIR", &procDir_p, 1);
 
-    sm_setFunctionCallback(Runtime_p, nh_make_functionCallback);
-    sm_setSourceContextCallback(Runtime_p, nh_make_sourceContextCallback);
+    nh_make_addFile(Runtime_p, ".nhmake/override.nhmake");
+    nh_make_addFile(Runtime_p, ".nhmake/source.nhmake");
+    nh_make_addFile(Runtime_p, ".nhmake/options.nhmake");
+    nh_make_addFile(Runtime_p, ".nhmake/news.nhmake");
+    nh_make_addFile(Runtime_p, ".nhmake/idl.nhmake");
+    nh_make_addFile(Runtime_p, ".nhmake/test.nhmake");
 
-    sm_run(Runtime_p, argc - 1, argv_pp + 1);
+    nh_make_setFunctionCallback(Runtime_p, functionCallback);
 
-    while (sm_isRunning()) {sm_sleepMs(100);}
+    nh_make_run(Runtime_p, argc - 1, argv_pp + 1);
+    while (nh_make_isRunning()) {nh_make_sleepMs(100);}
 
-    sm_destroyRuntime(Runtime_p);
-    sm_terminate();
+    nh_make_destroyRuntime(Runtime_p);
+    nh_make_terminate();
 } 
 
diff --git a/src/bin/nhmake/Main.h b/src/bin/nhmake/Main.h
index 3ce9431..73ec5cd 100644
--- a/src/bin/nhmake/Main.h
+++ b/src/bin/nhmake/Main.h
@@ -1,5 +1,5 @@
-#ifndef NH_MAKE_MAIN_H
-#define NH_MAKE_MAIN_H
+#ifndef MAIN_H
+#define MAIN_H
 
 #ifndef DOXYGEN_SHOULD_SKIP_THIS
 
@@ -9,9 +9,6 @@
  * Published under MIT
  */
 
-#include "../Common/Result.h"
-#include "../Common/Types.h"
-
 #endif
 
 #endif
diff --git a/src/bin/nhmake/UnicodeData.c b/src/bin/nhmake/UnicodeData.c
index 27d6720..b980577 100644
--- a/src/bin/nhmake/UnicodeData.c
+++ b/src/bin/nhmake/UnicodeData.c
@@ -23,8 +23,8 @@
 // BUILD ===========================================================================================
 
 // http://unicode.org/Public/
-static SM_RESULT nh_make_createUnicodeDataSource(
-    SM_BYTE *bytes_p, FILE *File_p, int *count1_p, int *count2_p)
+static NH_MAKE_RESULT createUnicodeDataSource(
+    NH_BYTE *bytes_p, FILE *File_p, int *count1_p, int *count2_p)
 {
     fprintf(File_p, "// LICENSE NOTICE ==================================================================================\n\n");
     fprintf(File_p, LICENSE_NOTICE);
@@ -40,7 +40,7 @@ static SM_RESULT nh_make_createUnicodeDataSource(
     fprintf(File_p, "// LOOKUP ==========================================================================================\n\n");
     fprintf(File_p, "const NH_BYTE NH_ENCODING_UNICODE_DATA_PP[%d][255] = \n{\n", lines);
 
-    SM_BYTE *line_p = bytes_p;
+    NH_BYTE *line_p = bytes_p;
     long expectedCodepoint = 0, currentEmpty = 0;
     long empty_pp[2048][2] = {0};
 
@@ -75,10 +75,10 @@ static SM_RESULT nh_make_createUnicodeDataSource(
     *count1_p = lines;
     *count2_p = currentEmpty;
 
-    return SM_SUCCESS;
+    return NH_MAKE_SUCCESS;
 }
 
-static SM_RESULT nh_make_createUnicodeDataHeader(
+static NH_MAKE_RESULT createUnicodeDataHeader(
     FILE *File_p, int count1, int count2)
 {
     fprintf(File_p, "#ifndef NH_ENCODING_UNICODE_DATA_H\n");
@@ -103,40 +103,40 @@ static SM_RESULT nh_make_createUnicodeDataHeader(
 
     fprintf(File_p, "/** @} */\n\n#endif");
 
-    return SM_SUCCESS;
+    return NH_MAKE_SUCCESS;
 }
 
-SM_RESULT nh_make_createUnicodeData(
-    sm_Runtime *Runtime_p) 
+NH_MAKE_RESULT createUnicodeData(
+    nh_make_Runtime *Runtime_p) 
 {
-    sm_ValueArray ProjDir = sm_getVariableValues(Runtime_p, "PROJ_DIR");
-    if (!ProjDir.length) {return SM_ERROR_BAD_STATE;}
+    nh_make_ValueArray ProjDir = nh_make_getVariableValues(Runtime_p, "PROJ_DIR");
+    if (!ProjDir.length) {return NH_MAKE_ERROR_BAD_STATE;}
 
-    SM_BYTE inPath_p[255] = {'\0'};
+    NH_BYTE inPath_p[255] = {'\0'};
     sprintf(inPath_p, "%s/build/.misc/UnicodeData-14.0.0d3.txt", ProjDir.values_pp[0]);
 
-    SM_BYTE *bytes_p = sm_getFileData(inPath_p, NULL);
-    if (!bytes_p) {return SM_ERROR_BAD_STATE;}
+    NH_BYTE *bytes_p = nh_make_getFileData(inPath_p, NULL);
+    if (!bytes_p) {return NH_MAKE_ERROR_BAD_STATE;}
 
-    SM_BYTE outPath_p[255] = {'\0'};
+    NH_BYTE outPath_p[255] = {'\0'};
     sprintf(outPath_p, "%s/src/lib/nhencoding/Base/UnicodeData.c", ProjDir.values_pp[0]);
 
     FILE *File_p = fopen(outPath_p, "w");
-    if (!File_p) {return SM_ERROR_BAD_STATE;}
+    if (!File_p) {return NH_MAKE_ERROR_BAD_STATE;}
 
     int count1, count2;
-    if (nh_make_createUnicodeDataSource(bytes_p, File_p, &count1, &count2)) {return SM_ERROR_BAD_STATE;}
+    if (createUnicodeDataSource(bytes_p, File_p, &count1, &count2)) {return NH_MAKE_ERROR_BAD_STATE;}
 
     free(bytes_p);
     fclose(File_p);
 
     outPath_p[strlen(outPath_p) - 1] = 'h';
     File_p = fopen(outPath_p, "w");
-    if (!File_p) {return SM_ERROR_BAD_STATE;}
+    if (!File_p) {return NH_MAKE_ERROR_BAD_STATE;}
 
-    if (nh_make_createUnicodeDataHeader(File_p, count1, count2)) {return SM_ERROR_BAD_STATE;}
+    if (createUnicodeDataHeader(File_p, count1, count2)) {return NH_MAKE_ERROR_BAD_STATE;}
     fclose(File_p);
 
-    return SM_SUCCESS;
+    return NH_MAKE_SUCCESS;
 }
 
diff --git a/src/bin/nhmake/UnicodeData.h b/src/bin/nhmake/UnicodeData.h
index 42cfa03..2491d23 100644
--- a/src/bin/nhmake/UnicodeData.h
+++ b/src/bin/nhmake/UnicodeData.h
@@ -1,5 +1,5 @@
-#ifndef NH_MAKE_UNICODE_DATA_H
-#define NH_MAKE_UNICODE_DATA_H
+#ifndef UNICODE_DATA_H
+#define UNICODE_DATA_H
 
 #ifndef DOXYGEN_SHOULD_SKIP_THIS
 
@@ -9,7 +9,7 @@
  * Published under MIT
  */
 
-#include "../../../external/selfmake/include/selfmake/selfmake.h"
+#include "../../lib/netzhaut/nhmake.h"
 
 #endif
 
@@ -17,8 +17,8 @@
  *  @{
  */
 
-    SM_RESULT nh_make_createUnicodeData(
-        sm_Runtime *Runtime_p
+    NH_MAKE_RESULT createUnicodeData(
+        nh_make_Runtime *Runtime_p
     ); 
 
 /** @} */
diff --git a/src/bin/nhmake/Version.c b/src/bin/nhmake/Version.c
index 42a846d..149812a 100644
--- a/src/bin/nhmake/Version.c
+++ b/src/bin/nhmake/Version.c
@@ -8,7 +8,7 @@
 
 // INCLUDE =========================================================================================
 
-#include "Documents.h"
+#include "Version.h"
 
 #include <stdio.h>
 #include <stdlib.h>
@@ -21,109 +21,114 @@
 
 // PROJECT VERSION =================================================================================
 
-static void nh_make_getVersionSum(
-    sm_SourceContextArray *Array_p, long version_p[4])
+//static void getVersionSum(
+//    nh_make_SourceContextArray *Array_p, long version_p[4])
+//{
+//    version_p[0] = 0;
+//    version_p[1] = 0;
+//    version_p[2] = 0;
+//    version_p[3] = 0;
+//
+//    for (int i = 0; i < Array_p->length; ++i) 
+//    {
+//        nh_make_SourceContext *Context_p = &Array_p->SourceContexts_p[i];
+//        version_p[0] += Context_p->api;
+//        version_p[1] += Context_p->major; 
+//        version_p[2] += Context_p->minor;
+//        version_p[3] += Context_p->patch;
+//    }
+//}
+//
+//void getVersion(
+//    nh_make_Runtime *Runtime_p, NH_BYTE *version_p)
+//{
+//    nh_make_SourceContextArray *Array_p = nh_make_getSourceContextArray(Runtime_p); 
+//    nh_make_SourceContext *SourceContext_p = nh_make_getSourceContext(Runtime_p, "netzhaut");
+//    sprintf(version_p, "ver.%d.%d.%d.%d", SourceContext_p->api, SourceContext_p->major, SourceContext_p->minor, SourceContext_p->patch);
+//}
+//
+//void getRevision(
+//    nh_make_Runtime *Runtime_p, NH_BYTE *version_p)
+//{
+//    nh_make_SourceContextArray *Array_p = nh_make_getSourceContextArray(Runtime_p); 
+//    long versionSum_p[4];
+//    getVersionSum(Array_p, versionSum_p);
+//    sprintf(version_p, "rev.%d.%d.%d.%d", versionSum_p[0], versionSum_p[1], versionSum_p[2], versionSum_p[3]);
+//}
+
+// UPDATE VERSION IN ABOUT FILE ====================================================================
+
+static NH_BYTE *writeVersion(
+    NH_BYTE *data_p, NH_BYTE *scope_p, long version)
 {
-    version_p[0] = 0;
-    version_p[1] = 0;
-    version_p[2] = 0;
-    version_p[3] = 0;
-
-    for (int i = 0; i < Array_p->length; ++i) 
-    {
-        sm_SourceContext *Context_p = &Array_p->SourceContexts_p[i];
-        version_p[0] += Context_p->api;
-        version_p[1] += Context_p->major; 
-        version_p[2] += Context_p->minor;
-        version_p[3] += Context_p->patch;
-    }
-}
-
-void nh_make_getVersion(
-    sm_Runtime *Runtime_p, SM_BYTE *version_p)
-{
-    sm_SourceContextArray *Array_p = sm_getSourceContextArray(Runtime_p); 
-    sm_SourceContext *SourceContext_p = sm_getSourceContext(Runtime_p, "netzhaut");
-    sprintf(version_p, "ver.%d.%d.%d.%d", SourceContext_p->api, SourceContext_p->major, SourceContext_p->minor, SourceContext_p->patch);
-}
-
-void nh_make_getRevision(
-    sm_Runtime *Runtime_p, SM_BYTE *version_p)
-{
-    sm_SourceContextArray *Array_p = sm_getSourceContextArray(Runtime_p); 
-    long versionSum_p[4];
-    nh_make_getVersionSum(Array_p, versionSum_p);
-    sprintf(version_p, "rev.%d.%d.%d.%d", versionSum_p[0], versionSum_p[1], versionSum_p[2], versionSum_p[3]);
-}
+    NH_BYTE *newData_p = malloc(sizeof(NH_BYTE)* (strlen(data_p)+8));
+    if (!newData_p) {return NULL;}
+    memset(newData_p, 0, strlen(data_p)+8);
 
-// VERSION =========================================================================================
+    NH_BYTE *n = strstr(data_p, scope_p);
+    if (!n) {return NULL;}
 
-static long nh_make_getVersionNumber(
-    SM_BYTE *data_p, SM_BYTE *macro_p)
-{
-    SM_BYTE *p = strstr(data_p, macro_p); 
-    if (!p) {return 0;}
-    p += strlen(macro_p);
-    long val = strtol(p, &p, 10);
-
-    return val;
-}
+    *n = '\0';
 
-static void nh_make_getVersionDate(
-    SM_BYTE *data_p, SM_BYTE *macro_p, long date_p[3])
-{
-    date_p[0] = 0;
-    date_p[1] = 0;
-    date_p[2] = 0;
+    NH_BYTE new_p[255];
+    memset(new_p, 0, 255);
+    sprintf(new_p, "%s %d", scope_p, version);
 
-    SM_BYTE *p = strstr(data_p, macro_p); 
-    if (!p) {return;}
+    NH_BYTE *end_p = n+1;
+    while (*end_p != '\n') {++end_p;}
 
-    while (p[0] != '/' || p[1] != '*' || p[2] != '*') {p--;}
-    while (*p && !isdigit(*p++)) {}
-    if (!*p) {return;}
+    sprintf(newData_p, "%s%s%s", data_p, new_p, end_p);
 
-    p--;
+    free(data_p);
 
-    date_p[0] = strtol(p, &p, 10);
-    p++;
-    date_p[1] = strtol(p, &p, 10);
-    p++;
-    date_p[2] = strtol(p, &p, 10);
-    p++;
+    return newData_p;
 }
 
-SM_RESULT nh_make_getSourceContextVersion(
-    sm_SourceContext *Context_p)
+static NH_BYTE *createFileData(
+    NH_BYTE *data_p, nh_make_SourceContext *Context_p)
 {
-    SM_BYTE name_p[255];
-    strcpy(name_p, Context_p->name_p + 2);
-    for (int j = 0; j < strlen(name_p); ++j) {name_p[j] = toupper(name_p[j]);}
+    NH_BYTE api_p[255], major_p[255], minor_p[255], patch_p[255];
+    NH_BYTE name_p[255];
+    memset(name_p, 0, 255);
 
-    SM_BYTE api_p[512]; 
-    SM_BYTE major_p[255];
-    SM_BYTE minor_p[255];
-    SM_BYTE patch_p[255];
-    SM_BYTE path_p[255];
+    strcpy(name_p, Context_p->name_p + 2);
+    for (int i = 0; i < strlen(name_p); ++i) {name_p[i] = toupper(name_p[i]);}
 
     if (!strcmp(Context_p->name_p, "netzhaut")) {
         sprintf(api_p, "NETZHAUT_API_VERSION"); 
         sprintf(major_p, "NETZHAUT_MAJOR_VERSION"); 
         sprintf(minor_p, "NETZHAUT_MINOR_VERSION");
         sprintf(patch_p, "NETZHAUT_PATCH_VERSION");
-        if (Context_p->type == SM_SOURCE_CONTEXT_BINARY) {
-            sprintf(path_p, "src/bin/netzhaut/About.h");
-        }
-        else {
-            sprintf(path_p, "src/lib/netzhaut/netzhaut.h");
-        }
     }
     else {
         sprintf(api_p, "NH_%s_API_VERSION", name_p); 
         sprintf(major_p, "NH_%s_MAJOR_VERSION", name_p); 
         sprintf(minor_p, "NH_%s_MINOR_VERSION", name_p);
         sprintf(patch_p, "NH_%s_PATCH_VERSION", name_p);
-        if (Context_p->type == SM_SOURCE_CONTEXT_BINARY) {
+    }
+
+    NH_BYTE *newData_p = NULL;
+
+    newData_p = writeVersion(data_p, api_p, Context_p->Version.api);
+    newData_p = writeVersion(newData_p, major_p, Context_p->Version.major);
+    newData_p = writeVersion(newData_p, minor_p, Context_p->Version.minor);
+    newData_p = writeVersion(newData_p, patch_p, Context_p->Version.patch);
+
+    return newData_p;
+}
+
+NH_MAKE_RESULT updateVersionInAboutFile(
+    nh_make_SourceContext *Context_p)
+{
+    long size = 0;
+    NH_BYTE path_p[255];
+    memset(path_p, 0, 255);
+
+    if (!strcmp(Context_p->name_p, "netzhaut") && Context_p->type != NH_MAKE_SOURCE_CONTEXT_BINARY) {
+        sprintf(path_p, "src/lib/netzhaut/netzhaut.h");
+    }
+    else {
+        if (Context_p->type == NH_MAKE_SOURCE_CONTEXT_BINARY) {
             sprintf(path_p, "src/bin/%s/About.h", Context_p->name_p);
         }
         else {
@@ -131,21 +136,15 @@ SM_RESULT nh_make_getSourceContextVersion(
         }
     }
 
-    SM_BYTE *data_p = sm_getFileData(path_p, NULL);
-    if (!data_p) {return SM_ERROR_BAD_STATE;}
-
-    Context_p->api   = nh_make_getVersionNumber(data_p, api_p);
-    Context_p->major = nh_make_getVersionNumber(data_p, major_p);
-    Context_p->minor = nh_make_getVersionNumber(data_p, minor_p);
-    Context_p->patch = nh_make_getVersionNumber(data_p, patch_p);
-
-    nh_make_getVersionDate(data_p, api_p, Context_p->apiDate_p);
-    nh_make_getVersionDate(data_p, major_p, Context_p->majorDate_p);
-    nh_make_getVersionDate(data_p, minor_p, Context_p->minorDate_p);
-    nh_make_getVersionDate(data_p, patch_p, Context_p->patchDate_p);
+    NH_BYTE *data_p = nh_make_getFileData(path_p, &size);
+    if (!data_p) {return NH_MAKE_ERROR_BAD_STATE;}
 
+    data_p = createFileData(data_p, Context_p);
+    nh_make_writeBytesToFile(path_p, data_p);
     free(data_p);
 
-    return SM_SUCCESS;
+    nh_make_messagef("%s updated", path_p);
+
+    return NH_MAKE_SUCCESS;
 }
 
diff --git a/src/bin/nhmake/Version.h b/src/bin/nhmake/Version.h
index 0971eba..3217f57 100644
--- a/src/bin/nhmake/Version.h
+++ b/src/bin/nhmake/Version.h
@@ -1,15 +1,15 @@
-#ifndef NH_MAKE_VERSION_H
-#define NH_MAKE_VERSION_H
+#ifndef VERSION_H
+#define VERSION_H
 
 #ifndef DOXYGEN_SHOULD_SKIP_THIS
 
 /**
  * netzhaut - Web Browser Engine
- * Copyright (C) 2020 The netzhaut Authors
+ * Copyright (C) 2022 The netzhaut Authors
  * Published under MIT
  */
 
-#include "../../../external/selfmake/include/selfmake/selfmake.h"
+#include "../../lib/netzhaut/nhmake.h"
 
 #endif
 
@@ -17,16 +17,8 @@
  *  @{
  */
 
-    void nh_make_getVersion(
-        sm_Runtime *Runtime_p, SM_BYTE *version_p
-    );
-    
-    void nh_make_getRevision(
-        sm_Runtime *Runtime_p, SM_BYTE *version_p
-    );
-
-    SM_RESULT nh_make_getSourceContextVersion(
-        sm_SourceContext *Context_p
+    NH_MAKE_RESULT updateVersionInAboutFile(
+        nh_make_SourceContext *Context_p
     );
 
 /** @} */
diff --git a/src/bin/nhmake/WebIDL.c b/src/bin/nhmake/WebIDL.c
index 8a9f68f..e5bc6dc 100644
--- a/src/bin/nhmake/WebIDL.c
+++ b/src/bin/nhmake/WebIDL.c
@@ -19,13 +19,13 @@
 
 // DECLARE =========================================================================================
 
-static SM_BYTE *totalOperations_pp[16384] = {'\0'}; // should suffice
+static NH_BYTE *totalOperations_pp[16384] = {'\0'}; // should suffice
 static int totalOperationCount = 0;
 
 // HELPER ==========================================================================================
 
-static void nh_make_getOutPath(
-    SM_BYTE *filepath_p, SM_BYTE *outpath_p)
+static void getOutPath(
+    NH_BYTE *filepath_p, NH_BYTE *outpath_p)
 {
     filepath_p = filepath_p + strlen(filepath_p);
     while (*filepath_p != '/') {filepath_p = filepath_p - 1;}
@@ -35,8 +35,8 @@ static void nh_make_getOutPath(
     sprintf(outpath_p, "src/lib/nhwebidl/Specifications/%s.inc", filepath_p);
 }
 
-static SM_RESULT nh_make_getFragmentName(
-    SM_BYTE *filepath_p, SM_BYTE *fragmentname_p)
+static NH_MAKE_RESULT getFragmentName(
+    NH_BYTE *filepath_p, NH_BYTE *fragmentname_p)
 {
     filepath_p = filepath_p + strlen(filepath_p);
     while (*filepath_p != '/') {filepath_p = filepath_p - 1;}
@@ -45,19 +45,19 @@ static SM_RESULT nh_make_getFragmentName(
     filepath_p = filepath_p + 1;
     for (int i = 0; strcmp(filepath_p, ".idl"); ++i) {fragmentname_p[i] = *filepath_p; filepath_p = filepath_p + 1;}
     for (int i = 0; i < strlen(fragmentname_p); ++i) {if (fragmentname_p[i] == '/') {fragmentname_p[i] = '_';}}
-    return SM_SUCCESS;
+    return NH_MAKE_SUCCESS;
 }
 
-static SM_RESULT nh_make_createIncludes(
-    FILE *f, sm_ValueArray *IDL_p)
+static NH_MAKE_RESULT createIncludes(
+    FILE *f, nh_make_ValueArray *IDL_p)
 {
     fprintf(f, "// INCLUDE =========================================================================================\n\n");
     fprintf(f, "#include \"Builtin.h\"\n\n");
 
     for (int i = 0; i < IDL_p->length; ++i) 
     {
-        SM_BYTE fragmentName_p[1024] = {'\0'};
-        nh_make_getFragmentName(IDL_p->values_pp[i], fragmentName_p);
+        NH_BYTE fragmentName_p[1024] = {'\0'};
+        getFragmentName(IDL_p->values_pp[i], fragmentName_p);
 
         for (int j = 0; j < strlen(fragmentName_p); ++j) {
             if (fragmentName_p[j] == '_') {
@@ -68,11 +68,11 @@ static SM_RESULT nh_make_createIncludes(
         fprintf(f,"#include \"../Specifications/%s.idl.inc\"\n", fragmentName_p);
     }
 
-    return SM_SUCCESS;
+    return NH_MAKE_SUCCESS;
 }
 
-static SM_RESULT nh_make_createFragmentDataArrays(
-    FILE *f, sm_ValueArray *IDL_p, int mode)
+static NH_MAKE_RESULT createFragmentDataArrays(
+    FILE *f, nh_make_ValueArray *IDL_p, int mode)
 {
     if (mode == 0) {
         fprintf(f, "\n// FRAGMENT NAMES ==================================================================================\n\n");
@@ -89,8 +89,8 @@ static SM_RESULT nh_make_createFragmentDataArrays(
 
     for (int i = 0; i < IDL_p->length; ++i) 
     {
-        SM_BYTE fragmentName_p[1024] = {'\0'}, *p;
-        nh_make_getFragmentName(IDL_p->values_pp[i], fragmentName_p);
+        NH_BYTE fragmentName_p[1024] = {'\0'}, *p;
+        getFragmentName(IDL_p->values_pp[i], fragmentName_p);
 
         if (mode == 0) {
             fprintf(f, "    \"%s\",\n", fragmentName_p);
@@ -112,13 +112,13 @@ static SM_RESULT nh_make_createFragmentDataArrays(
         fprintf(f, "\nsize_t NH_WEBIDL_FRAGMENTS_PP_COUNT = sizeof(NH_WEBIDL_FRAGMENTS_PP) / sizeof(NH_WEBIDL_FRAGMENTS_PP[0]);\n");
     }
 
-    return SM_SUCCESS;
+    return NH_MAKE_SUCCESS;
 }
 
-static SM_RESULT nh_make_createIncludeFile(
-    SM_BYTE *runtimePath_p, sm_ValueArray *IDL_p)
+static NH_MAKE_RESULT createIncludeFile(
+    NH_BYTE *runtimePath_p, nh_make_ValueArray *IDL_p)
 {
-    SM_BYTE filepath_p[1024] = {'\0'};
+    NH_BYTE filepath_p[1024] = {'\0'};
     sprintf(filepath_p, "%s/Builtin.c", runtimePath_p);
 
     FILE *f = fopen(filepath_p, "w");
@@ -133,51 +133,51 @@ static SM_RESULT nh_make_createIncludeFile(
     fprintf(f, "// LICENSE NOTICE ==================================================================================\n\n");
     fprintf(f, LICENSE_NOTICE);
 
-    nh_make_createIncludes(f, IDL_p);
-    nh_make_createFragmentDataArrays(f, IDL_p, 0);
-    nh_make_createFragmentDataArrays(f, IDL_p, 1);
-    nh_make_createFragmentDataArrays(f, IDL_p, 2);
+    createIncludes(f, IDL_p);
+    createFragmentDataArrays(f, IDL_p, 0);
+    createFragmentDataArrays(f, IDL_p, 1);
+    createFragmentDataArrays(f, IDL_p, 2);
 
     fclose(f);
 
-    return SM_SUCCESS;
+    return NH_MAKE_SUCCESS;
 }
 
 // HEADER ===========================================================================================
 
-static SM_RESULT nh_make_generateHexDumpFile(
-    SM_BYTE *filePath_p, SM_BYTE *fragmentName_p)
+static NH_MAKE_RESULT generateHexDumpFile(
+    NH_BYTE *filePath_p, NH_BYTE *fragmentName_p)
 {
-    SM_BYTE outfilepath_p[1024] = {'\0'};
-    nh_make_getOutPath(filePath_p, outfilepath_p);
+    NH_BYTE outfilepath_p[1024] = {'\0'};
+    getOutPath(filePath_p, outfilepath_p);
 
     FILE *File_p = fopen(outfilepath_p, "w");
-    if (!File_p) {return SM_ERROR_BAD_STATE;}
+    if (!File_p) {return NH_MAKE_ERROR_BAD_STATE;}
 
-    SM_BYTE name_p[1024] = {'\0'};
+    NH_BYTE name_p[1024] = {'\0'};
     sprintf(name_p, "nh_webidl_%s", fragmentName_p);
 
-    SM_BYTE command_p[1024] = {'\0'};
+    NH_BYTE command_p[1024] = {'\0'};
     sprintf(command_p, "./external/xxd/xxd -i %s %s nh_webidl_%s_p", filePath_p, outfilepath_p, fragmentName_p);
 
     int status = system(command_p);
-    if (WEXITSTATUS(status) || WIFSIGNALED(status)) {return SM_ERROR_XXD_EXECUTION_FAILED;}
+    if (WEXITSTATUS(status) || WIFSIGNALED(status)) {return NH_MAKE_ERROR_XXD_EXECUTION_FAILED;}
 
     fclose(File_p);
 
-    sm_messagef("Generate %s", outfilepath_p);
+    nh_make_messagef("Generate %s", outfilepath_p);
 
-    return SM_SUCCESS;
+    return NH_MAKE_SUCCESS;
 }
 
 // GET OPERATIONS ==================================================================================
 
-static SM_RESULT nh_make_getFragmentOperations(
-    SM_BYTE *filePath_p, SM_BYTE **operations_pp, int *count_p)
+static NH_MAKE_RESULT getFragmentOperations(
+    NH_BYTE *filePath_p, NH_BYTE **operations_pp, int *count_p)
 {
     long size = 0;
-    SM_BYTE *bytes_p = sm_getFileData(filePath_p, &size);
-    if (!bytes_p) {return SM_ERROR_BAD_STATE;}
+    NH_BYTE *bytes_p = nh_make_getFileData(filePath_p, &size);
+    if (!bytes_p) {return NH_MAKE_ERROR_BAD_STATE;}
 
     int operation = 0;
 
@@ -193,8 +193,8 @@ static SM_RESULT nh_make_getFragmentOperations(
                 int begin = i;
                 while (bytes_p[begin] == ' ' && begin > 0) {--begin;}
                 while (bytes_p[begin] != ' ' && begin > 0) {--begin;}
-                SM_BYTE *operation_p = malloc(sizeof(SM_BYTE) * ((i - begin) + 1));
-                if (!operation_p) {return SM_ERROR_BAD_STATE;}
+                NH_BYTE *operation_p = malloc(sizeof(NH_BYTE) * ((i - begin) + 1));
+                if (!operation_p) {return NH_MAKE_ERROR_BAD_STATE;}
                 strcpy(operation_p, bytes_p + begin + 1);
                 operations_pp[operation++] = operation_p;
                 bytes_p[i] = '(';
@@ -206,42 +206,42 @@ static SM_RESULT nh_make_getFragmentOperations(
     *count_p = operation;
     free(bytes_p);
 
-    return SM_SUCCESS;
+    return NH_MAKE_SUCCESS;
 }
 
 // MAIN ============================================================================================
 
-static SM_RESULT nh_make_processWebFragment(
-    SM_BYTE *filePath_p, sm_ValueArray *IDL_p)
+static NH_MAKE_RESULT processWebFragment(
+    NH_BYTE *filePath_p, nh_make_ValueArray *IDL_p)
 {
     int count = 0;
-    if (nh_make_getFragmentOperations(filePath_p, &totalOperations_pp[totalOperationCount], &count)) {return SM_ERROR_BAD_STATE;}
+    if (getFragmentOperations(filePath_p, &totalOperations_pp[totalOperationCount], &count)) {return NH_MAKE_ERROR_BAD_STATE;}
     totalOperationCount += count;
 
-    SM_BYTE fragmentName_p[1024] = {'\0'};
-    nh_make_getFragmentName(filePath_p, fragmentName_p);
+    NH_BYTE fragmentName_p[1024] = {'\0'};
+    getFragmentName(filePath_p, fragmentName_p);
 
-    if (nh_make_generateHexDumpFile(filePath_p, fragmentName_p)
-    ||  nh_make_createIncludeFile("src/lib/nhwebidl/Runtime", IDL_p)) {return SM_ERROR_BAD_STATE;}
+    if (generateHexDumpFile(filePath_p, fragmentName_p)
+    ||  createIncludeFile("src/lib/nhwebidl/Runtime", IDL_p)) {return NH_MAKE_ERROR_BAD_STATE;}
 
-    return SM_SUCCESS;
+    return NH_MAKE_SUCCESS;
 }
 
-SM_RESULT nh_make_processWebIDL(
-    sm_Runtime *Runtime_p)
+NH_MAKE_RESULT processWebIDL(
+    nh_make_Runtime *Runtime_p)
 {
-    SM_BYTE name_p[1023];
-    sm_ValueArray ProjDir = sm_getVariableValues(Runtime_p, "PROJ_DIR");
-    if (!ProjDir.length) {return SM_ERROR_BAD_STATE;}
+    NH_BYTE name_p[1023];
+    nh_make_ValueArray ProjDir = nh_make_getVariableValues(Runtime_p, "PROJ_DIR");
+    if (!ProjDir.length) {return NH_MAKE_ERROR_BAD_STATE;}
 
-    sm_ValueArray IDL = sm_getVariableValues(Runtime_p, "IDL");
+    nh_make_ValueArray IDL = nh_make_getVariableValues(Runtime_p, "IDL");
 
     for (int i = 0; i < IDL.length; ++i) {
         sprintf(name_p, "%s/%s", ProjDir.values_pp[0], IDL.values_pp[i]);
-        if (nh_make_processWebFragment(name_p, &IDL)) {return SM_ERROR_BAD_STATE;}
+        if (processWebFragment(name_p, &IDL)) {return NH_MAKE_ERROR_BAD_STATE;}
         memset(name_p, 0, 1023);
     }
 
-    return SM_SUCCESS;
+    return NH_MAKE_SUCCESS;
 } 
 
diff --git a/src/bin/nhmake/WebIDL.h b/src/bin/nhmake/WebIDL.h
index f1f7ce0..179bbef 100644
--- a/src/bin/nhmake/WebIDL.h
+++ b/src/bin/nhmake/WebIDL.h
@@ -1,5 +1,5 @@
-#ifndef NH_MAKE_WEBIDL_H
-#define NH_MAKE_WEBIDL_H
+#ifndef WEBIDL_H
+#define WEBIDL_H
 
 #ifndef DOXYGEN_SHOULD_SKIP_THIS
 
@@ -9,7 +9,7 @@
  * Published under MIT
  */
 
-#include "../../../external/selfmake/include/selfmake/selfmake.h"
+#include "../../lib/netzhaut/nhmake.h"
 
 #endif
 
@@ -17,8 +17,8 @@
  *  @{
  */
 
-    SM_RESULT nh_make_processWebIDL(
-        sm_Runtime *Runtime_p
+    NH_MAKE_RESULT processWebIDL(
+        nh_make_Runtime *Runtime_p
     );
 
 /** @} */
diff --git a/src/bin/nhtty/About.h b/src/bin/nhtty/About.h
index fe54ad6..e5cd229 100644
--- a/src/bin/nhtty/About.h
+++ b/src/bin/nhtty/About.h
@@ -38,7 +38,7 @@
      * 2021-02-23 | v0.0.0.0
      * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
-    #define NH_TTY_MAJOR_VERSION 0
+    #define NH_TTY_MAJOR_VERSION 1
 
     /**
      * Minor version.
@@ -46,7 +46,7 @@
      * 2021-02-23 | v0.0.0.0 
      * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
-    #define NH_TTY_MINOR_VERSION 0
+    #define NH_TTY_MINOR_VERSION 2
 
     /**
      * Patch version.
@@ -54,7 +54,7 @@
      * 2021-02-23 | v0.0.0.0 
      * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
-    #define NH_TTY_PATCH_VERSION 0
+    #define NH_TTY_PATCH_VERSION 2
 
 /** @} */
 
diff --git a/src/bin/nhtty/Main.c b/src/bin/nhtty/Main.c
index ebbfebd..b6e8479 100644
--- a/src/bin/nhtty/Main.c
+++ b/src/bin/nhtty/Main.c
@@ -10,7 +10,7 @@
 #include <stdio.h>
 #include <unistd.h>
 
-static nh_tty_PseudoTerminal *PseudoTerminal_p = NULL;
+static nh_tty_TTY *TTY_p = NULL;
 
 void handleInput(
     nh_wsi_Window *Window_p, nh_wsi_Event Event)
@@ -18,7 +18,7 @@ void handleInput(
     switch (Event.type)
     {
         case NH_WSI_EVENT_KEYBOARD :
-            nh_tty_sendInput(PseudoTerminal_p, Event);
+            nh_tty_sendInput(TTY_p, Event);
             break;
     }
 }
@@ -27,12 +27,12 @@ int main(int argc, char **argv_pp)
 {
     if (nh_initialize(NH_LOADER_SCOPE_SYSTEM, NULL, NH_FALSE) != NH_SUCCESS) {return 1;}
 
-    PseudoTerminal_p = nh_tty_openPseudoTerminal();
-    if (!PseudoTerminal_p) {return 1;}
+    TTY_p = nh_tty_openTTY();
+    if (!TTY_p) {return 1;}
 
-    if (nh_tty_claimStandardIO(PseudoTerminal_p)) 
+    if (nh_tty_claimStandardIO(TTY_p)) 
     {
-        nh_term_Terminal *Terminal_p =  nh_term_openTerminal(PseudoTerminal_p);
+        nh_term_Terminal *Terminal_p =  nh_term_openTerminal(TTY_p);
         if (!Terminal_p) {return 1;}
 
         nh_PixelSize Size;
@@ -59,13 +59,13 @@ int main(int argc, char **argv_pp)
         nh_wsi_setEventListener(Window_p, handleInput);
     }
 
-    if (nh_tty_addDefaultProgram(PseudoTerminal_p, "shell") != NH_TTY_SUCCESS) {
+    if (nh_tty_addDefaultProgram(TTY_p, "shell") != NH_TTY_SUCCESS) {
         return 1;
     }
-    if (nh_tty_addDefaultProgram(PseudoTerminal_p, "editor") != NH_TTY_SUCCESS) {
+    if (nh_tty_addDefaultProgram(TTY_p, "editor") != NH_TTY_SUCCESS) {
         return 1;
     }
-    if (nh_tty_addDefaultProgram(PseudoTerminal_p, "logger") != NH_TTY_SUCCESS) {
+    if (nh_tty_addDefaultProgram(TTY_p, "logger") != NH_TTY_SUCCESS) {
         return 1;
     }
 
diff --git a/src/lib/netzhaut/netzhaut.c b/src/lib/netzhaut/netzhaut.c
new file mode 100644
index 0000000..4f74b33
--- /dev/null
+++ b/src/lib/netzhaut/netzhaut.c
@@ -0,0 +1,21 @@
+// LICENSE NOTICE ==================================================================================
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2020 The netzhaut Authors
+ * Published under MIT
+ */
+
+// INCLUDE ==========================================================================================
+
+#include "netzhaut.h"
+
+// VERSION =========================================================================================
+
+int NETZHAUT_VERSION_P[4] = {
+    NETZHAUT_API_VERSION, 
+    NETZHAUT_MAJOR_VERSION, 
+    NETZHAUT_MINOR_VERSION,
+    NETZHAUT_PATCH_VERSION,
+};
+
diff --git a/src/lib/netzhaut/netzhaut.h b/src/lib/netzhaut/netzhaut.h
index 5518167..0f6b776 100644
--- a/src/lib/netzhaut/netzhaut.h
+++ b/src/lib/netzhaut/netzhaut.h
@@ -14,6 +14,7 @@
 #include "nhhtml.h"
 #include "nhterm.h"
 #include "nhecmascript.h"
+#include "nhmake.h"
 
 #endif
 
@@ -26,6 +27,9 @@
  *  @brief TODO
  */
 
+/** @defgroup lib_netzhaut_version Version
+ *  @ingroup lib_netzhaut
+ */
 /** @defgroup lib_netzhaut_vars Variables
  *  @ingroup lib_netzhaut
  */
@@ -35,86 +39,37 @@
 /** @defgroup lib_netzhaut_functions Functions
  *  @ingroup lib_netzhaut
  */
-/** @defgroup lib_netzhaut_changelog Changelog
- *  @ingroup lib_netzhaut
- */
 
-/** @addtogroup lib_netzhaut_changelog
+/** @addtogroup lib_netzhaut_version
  *  @{
  */
 
     /**
      * The API version is used for documenting backwards-incompatible API changes. 
-     *
-     * @nhmake_ver{2021-02-23,ver.0.0.0.0}
-     * - @nhmake_msg{[Dajo Frey](https://github.com/dajofrey): Initial version.}
      */
     #define NETZHAUT_API_VERSION 0
 
     /**
      * The major version is used for documenting the completion of big functionalities. 
-     *
-     * @nhmake_ver{2021-06-23,ver.0.2.0.0} <a id="v0.2.0.0"></a>
-     * - @nhmake_msg{[Dajo Frey](https://github.com/dajofrey): Add first iteration of nhrenderer interface.}
-     * - @nhmake_msg{[Dajo Frey](https://github.com/dajofrey): Replace nhcss interface functions.}
-     *
-     * @nhmake_ver{2021-06-14,ver.0.1.0.0} <a id="v0.1.0.0"></a>
-     * - @nhmake_msg{[Dajo Frey](https://github.com/dajofrey): Add first iteration of nhterm interface.}
-     * - @nhmake_msg{[Dajo Frey](https://github.com/dajofrey): Add nhwsi functions.}
-     * - @nhmake_msg{[Dajo Frey](https://github.com/dajofrey): Add and rename nhtty functions.}
-     *
-     * nhmake_ver{2021-02-23,ver.0.0.0.0}
-     * - @nhmake_msg{[Dajo Frey](https://github.com/dajofrey): Initial version.}
      */
     #define NETZHAUT_MAJOR_VERSION 2
 
     /**
      * The minor version is used for documenting the addition of small functionalities or consequential changes. 
-     *
-     * @nhmake_ver{2021-10-07,ver.0.2.2.0} <a id="ver.0.2.2.0"></a>
-     * - @nhmake_msg{[Dajo Frey](https://github.com/dajofrey): Add core functions.}
-     *
-     * @nhmake_ver{2021-09-24,ver.0.2.1.0} <a id="ver.0.2.1.0"></a>
-     * - @nhmake_msg{[Dajo Frey](https://github.com/dajofrey): Add nhecmascript functions.}
-     *
-     * @nhmake_ver{2021-06-11,ver.0.0.2.0} <a id="ver.0.0.2.0"></a>
-     * - @nhmake_msg{[Dajo Frey](https://github.com/dajofrey): Add nhtty functions.}
-     * - @nhmake_msg{[Dajo Frey](https://github.com/dajofrey): Change file names.}
-     *
-     * @nhmake_ver{2021-05-13,ver.0.0.1.0} <a id="ver.0.0.1.0"></a>
-     * - @nhmake_msg{[Dajo Frey](https://github.com/dajofrey): Add CSS RenderContext concept.}
-     * - @nhmake_msg{[Dajo Frey](https://github.com/dajofrey): Adjust HTML API.}
-     *
-     * @nhmake_ver{2021-02-23,ver.0.0.0.0}
-     * - @nhmake_msg{[Dajo Frey](https://github.com/dajofrey): Initial version.}
      */
     #define NETZHAUT_MINOR_VERSION 2
 
     /**
      * The patch version is used for documenting bugfixes or non-consequential changes. 
-     *
-     * @nhmake_ver{2021-07-03,ver.0.2.0.1} <a id="ver.0.2.0.1"></a>
-     * - @nhmake_msg{[Dajo Frey](https://github.com/dajofrey): Add nh_initializeUsingDefaultArguments() for quick and simple initialization.}
-     *
-     * @nhmake_ver{2021-06-10,ver.0.0.1.2} <a id="ver.0.0.1.2"></a>
-     * - @nhmake_msg{[Dajo Frey](https://github.com/dajofrey): Rename nhtty functions and structures.}
-     *
-     * @nhmake_ver{2021-06-08,ver.0.0.1.1} <a id="ver.0.0.1.1"></a>
-     * - @nhmake_msg{[Dajo Frey](https://github.com/dajofrey): Replace nhloader routines and types following the merge of the nhloader-module into the nhcore-module.}
-     *
-     * @nhmake_ver{2021-02-23,ver.0.0.0.0}
-     * - @nhmake_msg{[Dajo Frey](https://github.com/dajofrey): Initial version.}
      */
     #define NETZHAUT_PATCH_VERSION 0
 
     /**
-     * The meta version is used for documenting non-code changes. 
-     *
-     * @nhmake_ver{2021-10-30,meta.0}
-     * - @nhmake_msg{[Dajo Frey](https://github.com/dajofrey): Initial version.}
+     * Version array. 
      */
-    #define NETZHAUT_META_VERSION 0
+    extern int NETZHAUT_VERSION_P[4];
 
 /** @} */
 
 #endif // NETZHAUT_H
+
diff --git a/src/lib/netzhaut/nhmake.c b/src/lib/netzhaut/nhmake.c
new file mode 100644
index 0000000..c134a39
--- /dev/null
+++ b/src/lib/netzhaut/nhmake.c
@@ -0,0 +1,241 @@
+// LICENSE NOTICE ==================================================================================
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2020 The netzhaut Authors
+ * Published under MIT
+ */
+
+// INCLUDE =========================================================================================
+
+#include "nhmake.h"
+#include "nhcore.h"
+
+#include "../nhcore/Loader/Loader.h"
+
+#include "../nhmake/Core/Runtime.h"
+#include "../nhmake/Core/File.h"
+#include "../nhmake/Core/Utils.h"
+#include "../nhmake/Core/Thread.h"
+#include "../nhmake/Core/Configure.h"
+#include "../nhmake/Core/Changes.h"
+#include "../nhmake/Core/Version.h"
+#include "../nhmake/UI/Message.h"
+
+#include <unistd.h>
+#include <dlfcn.h>
+#include <stddef.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+// FUNCTIONS =======================================================================================
+
+NH_MAKE_RESULT nh_make_initialize()
+{
+    nh_make_initialize_f initialize_f = !NH_LOADER_P ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_MAKE, 0, "nh_make_initialize");
+    return initialize_f ? initialize_f() : NH_MAKE_ERROR_BAD_STATE;
+}
+
+void nh_make_terminate()
+{
+    nh_make_terminate_f terminate_f = !NH_LOADER_P ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_MAKE, 0, "nh_make_terminate");
+    if (terminate_f) {terminate_f();}
+}
+
+nh_make_Runtime *nh_make_createRuntime(
+    NH_BYTE *name_p)
+{
+    nh_make_createRuntime_f createRuntime_f = !NH_LOADER_P ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_MAKE, 0, "nh_make_createRuntime");
+    return createRuntime_f ? createRuntime_f(name_p) : NULL;
+}
+
+void nh_make_destroyRuntime(
+    nh_make_Runtime *Runtime_p)
+{
+    nh_make_destroyRuntime_f destroyRuntime_f = !NH_LOADER_P ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_MAKE, 0, "nh_make_destroyRuntime");
+    if (destroyRuntime_f) {destroyRuntime_f(Runtime_p);}
+}
+
+NH_MAKE_RESULT nh_make_run(
+    nh_make_Runtime *Runtime_p, int argc, NH_BYTE **argv_pp)
+{
+    nh_make_run_f run_f = !NH_LOADER_P ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_MAKE, 0, "nh_make_run");
+    return run_f ? run_f(Runtime_p, argc, argv_pp) : NH_MAKE_ERROR_BAD_STATE;
+}
+
+NH_MAKE_RESULT nh_make_addFile(
+    nh_make_Runtime *Runtime_p, NH_BYTE *path_p)
+{
+    nh_make_addFile_f addFile_f = !NH_LOADER_P ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_MAKE, 0, "nh_make_addFile");
+    return addFile_f ? addFile_f(Runtime_p, path_p) : NH_MAKE_ERROR_BAD_STATE;
+}
+
+void nh_make_setFunctionCallback(
+    nh_make_Runtime *Runtime_p, nh_make_functionCallback_f functionCallback_f)
+{
+    nh_make_setFunctionCallback_f setFunctionCallback_f = !NH_LOADER_P ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_MAKE, 0, "nh_make_setFunctionCallback");
+    if (setFunctionCallback_f) {setFunctionCallback_f(Runtime_p, functionCallback_f);}
+}
+
+void nh_make_setSourceContextCallback(
+    nh_make_Runtime *Runtime_p, nh_make_sourceContextCallback_f sourceContextCallback_f)
+{
+    nh_make_setSourceContextCallback_f setSourceContextCallback_f = !NH_LOADER_P ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_MAKE, 0, "nh_make_setSourceContextCallback");
+    if (setSourceContextCallback_f) {setSourceContextCallback_f(Runtime_p, sourceContextCallback_f);}
+}
+
+void nh_make_setBeforeBuildCallback(
+    nh_make_Runtime *Runtime_p, nh_make_sourceContextCallback_f sourceContextCallback_f)
+{
+    nh_make_setBeforeBuildCallback_f setBeforeBuildCallback_f = !NH_LOADER_P ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_MAKE, 0, "nh_make_setBeforeBuildCallback");
+    if (setBeforeBuildCallback_f) {setBeforeBuildCallback_f(Runtime_p, sourceContextCallback_f);}
+}
+
+void nh_make_setAfterBuildCallback(
+    nh_make_Runtime *Runtime_p, nh_make_sourceContextCallback_f sourceContextCallback_f)
+{
+    nh_make_setAfterBuildCallback_f setAfterBuildCallback_f = !NH_LOADER_P ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_MAKE, 0, "nh_make_setAfterBuildCallback");
+    if (setAfterBuildCallback_f) {setAfterBuildCallback_f(Runtime_p, sourceContextCallback_f);}
+}
+
+nh_make_SourceContextArray *nh_make_getSourceContextArray(
+    nh_make_Runtime *Runtime_p)
+{
+    nh_make_getSourceContextArray_f getSourceContextArray_f = !NH_LOADER_P ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_MAKE, 0, "nh_make_getSourceContextArray");
+    return getSourceContextArray_f ? getSourceContextArray_f(Runtime_p) : NULL;
+}
+
+nh_make_SourceContext *nh_make_getSourceContext(
+    nh_make_Runtime *Runtime_p, NH_BYTE *name_p)
+{
+    nh_make_getSourceContext_f getSourceContext_f = !NH_LOADER_P ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_MAKE, 0, "nh_make_getSourceContext");
+    return getSourceContext_f ? getSourceContext_f(Runtime_p, name_p) : NULL;
+}
+
+void nh_make_setQuiet(
+    nh_make_Runtime *Runtime_p, NH_MAKE_BOOL quiet)
+{
+    nh_make_setQuiet_f setQuiet_f = !NH_LOADER_P ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_MAKE, 0, "nh_make_setQuiet");
+    if (setQuiet_f) {setQuiet_f(Runtime_p, quiet);}
+}
+
+void nh_make_setShowParseTree(
+    nh_make_Runtime *Runtime_p, NH_MAKE_BOOL showParseTree)
+{
+    nh_make_setShowParseTree_f setShowParseTree_f = !NH_LOADER_P ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_MAKE, 0, "nh_make_setShowParseTree");
+    if (setShowParseTree_f) {setShowParseTree_f(Runtime_p, showParseTree);}
+}
+
+NH_MAKE_RESULT nh_make_setVariable(
+    nh_make_Runtime *Runtime_p, NH_BYTE *variables_p, NH_BYTE **values_pp, int valueCount)
+{
+    nh_make_setVariable_f setVariable_f = !NH_LOADER_P ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_MAKE, 0, "nh_make_setVariable");
+    return setVariable_f ? setVariable_f(Runtime_p, variables_p, values_pp, valueCount) : NH_MAKE_ERROR_BAD_STATE;
+}
+
+nh_make_ValueArray nh_make_getVariableValues(
+    nh_make_Runtime *Runtime_p, NH_BYTE *variable_p)
+{
+    nh_make_getVariableValues_f getVariableValues_f = !NH_LOADER_P ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_MAKE, 0, "nh_make_getVariableValues");
+    nh_make_ValueArray Array;
+    Array.values_pp = NULL;
+    Array.length = 0;
+    return getVariableValues_f ? getVariableValues_f(Runtime_p, variable_p) : Array;
+}
+
+int nh_make_isRunning()
+{
+    nh_make_isRunning_f isRunning_f = !NH_LOADER_P ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_MAKE, 0, "nh_make_isRunning");
+    return isRunning_f ? isRunning_f() : -1;
+}
+
+NH_MAKE_RESULT nh_make_sleepMs(
+    int milliseconds)
+{
+    nh_make_sleepMs_f sleepMs_f = !NH_LOADER_P ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_MAKE, 0, "nh_make_sleepMs");
+    return sleepMs_f ? sleepMs_f(milliseconds) : NH_MAKE_ERROR_BAD_STATE;
+}
+
+NH_BYTE *nh_make_getProcessDirectory()
+{
+    nh_make_getProcessDirectory_f getProcessDirectory_f = !NH_LOADER_P ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_MAKE, 0, "nh_make_getProcessDirectory");
+    return getProcessDirectory_f ? getProcessDirectory_f() : NULL;
+}
+
+NH_BYTE *nh_make_getWorkDirectory()
+{
+    nh_make_getWorkDirectory_f getWorkDirectory_f = !NH_LOADER_P ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_MAKE, 0, "nh_make_getWorkDirectory");
+    return getWorkDirectory_f ? getWorkDirectory_f() : NULL;
+}
+
+NH_BYTE *nh_make_getFileData(
+    const NH_BYTE* path_p, long *size_p)
+{
+    nh_make_getFileData_f getFileData_f = !NH_LOADER_P ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_MAKE, 0, "nh_make_getFileData");
+    return getFileData_f ? getFileData_f(path_p, size_p) : NULL;
+}
+
+NH_MAKE_RESULT nh_make_writeBytesToFile(
+    NH_BYTE *filename_p, NH_BYTE *bytes_p)
+{
+    nh_make_writeBytesToFile_f writeBytesToFile_f = !NH_LOADER_P ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_MAKE, 0, "nh_make_writeBytesToFile");
+    return writeBytesToFile_f ? writeBytesToFile_f(filename_p, bytes_p) : NH_MAKE_ERROR_BAD_STATE;
+}
+
+NH_MAKE_RESULT nh_make_messagef(
+    NH_BYTE *format_p, ...)
+{
+    nh_make_messagef_f messagef_f = !NH_LOADER_P ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_MAKE, 0, "nh_make_messagef");
+    return messagef_f ? messagef_f(format_p) : NH_MAKE_ERROR_BAD_STATE;
+}
+
+nh_make_ChangesNode *nh_make_parseChangesFile(
+    NH_BYTE *path_p)
+{
+    nh_make_parseChangesFile_f parseChangesFile_f = !NH_LOADER_P ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_MAKE, 0, "nh_make_parseChangesFile");
+    return parseChangesFile_f ? parseChangesFile_f(path_p) : NULL;
+}
+
+nh_make_Changes *nh_make_getChanges(
+    nh_make_ChangesNode *Root_p, int *changes_p)
+{
+    nh_make_getChanges_f getChanges_f = !NH_LOADER_P ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_MAKE, 0, "nh_make_getChanges");
+    return getChanges_f ? getChanges_f(Root_p, changes_p) : NULL;
+}
+
+NH_MAKE_RESULT nh_make_printChanges(
+    nh_make_Runtime *Runtime_p, nh_make_Changes *Changes_p, NH_MAKE_PRINT_CHANGES type)
+{
+    nh_make_printChanges_f printChanges_f = !NH_LOADER_P ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_MAKE, 0, "nh_make_printChanges");
+    return printChanges_f ? printChanges_f(Runtime_p, Changes_p, type) : NH_MAKE_ERROR_BAD_STATE;
+}
+
+NH_MAKE_RESULT nh_make_stringifySourceContextNameAndVersion(
+    nh_make_SourceContext *SourceContext_p, NH_BYTE string_p[255])
+{
+    nh_make_stringifySourceContextNameAndVersion_f stringifySourceContextNameAndVersion_f = !NH_LOADER_P ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_MAKE, 0, "nh_make_stringifySourceContextNameAndVersion");
+    return stringifySourceContextNameAndVersion_f ? stringifySourceContextNameAndVersion_f(SourceContext_p, string_p) : NH_MAKE_ERROR_BAD_STATE;
+}
+
+NH_MAKE_RESULT nh_make_normalizeChanges(
+    nh_make_Changes *Changes_p, NH_BYTE *changes_p, int length)
+{
+    nh_make_normalizeChanges_f normalizeChanges_f = !NH_LOADER_P ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_MAKE, 0, "nh_make_normalizeChanges");
+    return normalizeChanges_f ? normalizeChanges_f(Changes_p, changes_p, length) : NH_MAKE_ERROR_BAD_STATE;
+}
+
+NH_MAKE_RESULT nh_make_addDateAndIdToChanges(
+    nh_make_Changes *Changes_p)
+{
+    nh_make_addDateAndIdToChanges_f addDateAndIdToChanges_f = !NH_LOADER_P ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_MAKE, 0, "nh_make_addDateAndIdToChanges");
+    return addDateAndIdToChanges_f ? addDateAndIdToChanges_f(Changes_p) : NH_MAKE_ERROR_BAD_STATE;
+}
+
+NH_MAKE_RESULT nh_make_updateVersions(
+    nh_make_Runtime *Runtime_p)
+{
+    nh_make_updateVersions_f updateVersions_f = !NH_LOADER_P ? NH_MAKE_ERROR_BAD_STATE : NH_LOADER_P->loadSymbol_f(NH_MODULE_MAKE, 0, "nh_make_updateVersions");
+    return updateVersions_f ? updateVersions_f(Runtime_p) : NH_MAKE_ERROR_BAD_STATE;
+}
+
diff --git a/src/lib/netzhaut/nhmake.h b/src/lib/netzhaut/nhmake.h
new file mode 100644
index 0000000..913527d
--- /dev/null
+++ b/src/lib/netzhaut/nhmake.h
@@ -0,0 +1,137 @@
+#ifndef NETZHAUT_MAKE_H
+#define NETZHAUT_MAKE_H
+
+#ifndef DOXYGEN_SHOULD_SKIP_THIS
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2020 The netzhaut Authors
+ * Published under MIT
+ */
+
+#include "nhmake/Common/Types/Public.h"
+
+#endif
+
+/** @addtogroup lib_netzhaut_functions
+ *  @{
+ */
+
+    NH_MAKE_RESULT nh_make_initialize(
+    );
+    
+    void nh_make_terminate(
+    );
+
+    nh_make_Runtime *nh_make_createRuntime(
+        NH_BYTE *name_p
+    );
+
+    void nh_make_destroyRuntime(
+        nh_make_Runtime *Runtime_p
+    );
+
+    NH_MAKE_RESULT nh_make_run(
+        nh_make_Runtime *Runtime_p, int argc, NH_BYTE **argv_pp
+    );
+
+    NH_MAKE_RESULT nh_make_addFile(
+        nh_make_Runtime *Runtime_p, NH_BYTE *path_p
+    );
+
+    void nh_make_setFunctionCallback(
+        nh_make_Runtime *Runtime_p, nh_make_functionCallback_f functionCallback_f
+    );
+
+    void nh_make_setSourceContextCallback(
+        nh_make_Runtime *Runtime_p, nh_make_sourceContextCallback_f sourceContextCallback_f
+    );
+
+    void nh_make_setBeforeBuildCallback(
+        nh_make_Runtime *Runtime_p, nh_make_sourceContextCallback_f sourceContextCallback_f
+    );
+
+    void nh_make_setAfterBuildCallback(
+        nh_make_Runtime *Runtime_p, nh_make_sourceContextCallback_f sourceContextCallback_f
+    );
+
+    nh_make_SourceContextArray *nh_make_getSourceContextArray(
+        nh_make_Runtime *Runtime_p
+    );
+
+    nh_make_SourceContext *nh_make_getSourceContext(
+        nh_make_Runtime *Runtime_p, NH_BYTE *name_p
+    );
+
+    void nh_make_setQuiet(
+        nh_make_Runtime *Runtime_p, NH_MAKE_BOOL quiet
+    );
+    
+    void nh_make_setShowParseTree(
+        nh_make_Runtime *Runtime_p, NH_MAKE_BOOL showParseTree
+    );
+
+    NH_MAKE_RESULT nh_make_setVariable(
+        nh_make_Runtime *Runtime_p, NH_BYTE *variables_p, NH_BYTE **values_pp, int valueCount
+    );
+
+    nh_make_ValueArray nh_make_getVariableValues(
+        nh_make_Runtime *Runtime_p, NH_BYTE *variable_p
+    );
+
+    int nh_make_isRunning(
+    );
+    
+    NH_MAKE_RESULT nh_make_sleepMs(
+        int milliseconds
+    );
+
+    NH_BYTE *nh_make_getProcessDirectory(
+    );
+
+    NH_BYTE *nh_make_getWorkDirectory(
+    );
+
+    NH_BYTE *nh_make_getFileData(
+        const NH_BYTE* path_p, long *size_p
+    );
+
+    NH_MAKE_RESULT nh_make_writeBytesToFile(
+        NH_BYTE *filename_p, NH_BYTE *bytes_p
+    );
+
+    NH_MAKE_RESULT nh_make_messagef(
+        NH_BYTE *format_p, ...
+    );
+
+    nh_make_ChangesNode *nh_make_parseChangesFile(
+        NH_BYTE *path_p 
+    );
+
+    nh_make_Changes *nh_make_getChanges(
+        nh_make_ChangesNode *Root_p, int *changes_p
+    );
+
+    NH_MAKE_RESULT nh_make_printChanges(
+        nh_make_Runtime *Runtime_p, nh_make_Changes *Changes_p, NH_MAKE_PRINT_CHANGES type
+    );
+
+    NH_MAKE_RESULT nh_make_stringifySourceContextNameAndVersion(
+        nh_make_SourceContext *SourceContext_p, NH_BYTE string_p[255]
+    );
+
+    NH_MAKE_RESULT nh_make_normalizeChanges(
+        nh_make_Changes *Changes_p, NH_BYTE *changes_p, int length
+    );
+
+    NH_MAKE_RESULT nh_make_addDateAndIdToChanges(
+        nh_make_Changes *Changes_p
+    );
+
+    NH_MAKE_RESULT nh_make_updateVersions(
+        nh_make_Runtime *Runtime_p
+    );
+
+/** @} */
+
+#endif // NETZHAUT_MAKE_H
diff --git a/external/selfmake/bin/.gitignore b/src/lib/netzhaut/nhmake/Common/.gitignore
similarity index 100%
rename from external/selfmake/bin/.gitignore
rename to src/lib/netzhaut/nhmake/Common/.gitignore
diff --git a/src/lib/netzhaut/nhterm.c b/src/lib/netzhaut/nhterm.c
index 41237a9..084d32d 100644
--- a/src/lib/netzhaut/nhterm.c
+++ b/src/lib/netzhaut/nhterm.c
@@ -23,10 +23,10 @@
 // CREATE ==========================================================================================
 
 nh_term_Terminal *nh_term_openTerminal(
-    nh_tty_PseudoTerminal *PseudoTerminal_p)
+    nh_tty_TTY *TTY_p)
 {
-    nh_term_openTerminal_f openTerminal_f = !NH_LOADER_P || !PseudoTerminal_p ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_TERM, 0, "nh_term_openTerminal");
-    return openTerminal_f ? openTerminal_f(PseudoTerminal_p) : NULL;
+    nh_term_openTerminal_f openTerminal_f = !NH_LOADER_P || !TTY_p ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_TERM, 0, "nh_term_openTerminal");
+    return openTerminal_f ? openTerminal_f(TTY_p) : NULL;
 }
 
 NH_TERM_RESULT nh_term_setViewport(
diff --git a/src/lib/netzhaut/nhterm.h b/src/lib/netzhaut/nhterm.h
index 4c393d6..70fe12e 100644
--- a/src/lib/netzhaut/nhterm.h
+++ b/src/lib/netzhaut/nhterm.h
@@ -21,7 +21,7 @@
  */
 
     nh_term_Terminal *nh_term_openTerminal(
-        nh_tty_PseudoTerminal *PseudoTerminal_p
+        nh_tty_TTY *TTY_p
     );
 
     NH_TERM_RESULT nh_term_setViewport(
diff --git a/src/lib/netzhaut/nhtty.c b/src/lib/netzhaut/nhtty.c
index 0e99937..18aaedd 100644
--- a/src/lib/netzhaut/nhtty.c
+++ b/src/lib/netzhaut/nhtty.c
@@ -13,9 +13,9 @@
 
 #include "../nhcore/Loader/Loader.h"
 
-#include "../nhtty/PseudoTerminal/PseudoTerminal.h"
-#include "../nhtty/PseudoTerminal/StandardIO.h"
-#include "../nhtty/PseudoTerminal/Program.h"
+#include "../nhtty/TTY/TTY.h"
+#include "../nhtty/TTY/StandardIO.h"
+#include "../nhtty/TTY/Program.h"
 
 #include <dlfcn.h>
 #include <stddef.h>
@@ -25,43 +25,43 @@
 
 // ADD =============================================================================================
 
-nh_tty_PseudoTerminal *nh_tty_openPseudoTerminal()
+nh_tty_TTY *nh_tty_openTTY()
 {
-    nh_tty_openPseudoTerminal_f openTerminal_f = !NH_LOADER_P ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_TTY, 0, "nh_tty_openPseudoTerminal");
+    nh_tty_openTTY_f openTerminal_f = !NH_LOADER_P ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_TTY, 0, "nh_tty_openTTY");
     return openTerminal_f ? openTerminal_f() : NULL;
 }
 
 NH_TTY_RESULT nh_tty_addDefaultProgram(
-    nh_tty_PseudoTerminal *PseudoTerminal_p, NH_BYTE *name_p) 
+    nh_tty_TTY *TTY_p, NH_BYTE *name_p) 
 {
-    nh_tty_addDefaultProgram_f addDefaultProgram_f = !NH_LOADER_P || !PseudoTerminal_p || !name_p ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_TTY, 0, "nh_tty_addDefaultProgram");
-    return addDefaultProgram_f ? addDefaultProgram_f(PseudoTerminal_p, name_p) : NH_TTY_ERROR_BAD_STATE;
+    nh_tty_addDefaultProgram_f addDefaultProgram_f = !NH_LOADER_P || !TTY_p || !name_p ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_TTY, 0, "nh_tty_addDefaultProgram");
+    return addDefaultProgram_f ? addDefaultProgram_f(TTY_p, name_p) : NH_TTY_ERROR_BAD_STATE;
 }
 
 NH_TTY_RESULT nh_tty_addProgram(
-    nh_tty_PseudoTerminal *PseudoTerminal_p, nh_tty_ProgramPrototype *Prototype_p)
+    nh_tty_TTY *TTY_p, nh_tty_ProgramPrototype *Prototype_p)
 {
     return 1;
 }
 
 NH_TTY_RESULT nh_tty_claimStandardIO(
-    nh_tty_PseudoTerminal *PseudoTerminal_p)
+    nh_tty_TTY *TTY_p)
 {
-    nh_tty_claimStandardIO_f claimStandardIO_f = !NH_LOADER_P || !PseudoTerminal_p ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_TTY, 0, "nh_tty_claimStandardIO");
-    return claimStandardIO_f ? claimStandardIO_f(PseudoTerminal_p) : NH_TTY_ERROR_BAD_STATE;
+    nh_tty_claimStandardIO_f claimStandardIO_f = !NH_LOADER_P || !TTY_p ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_TTY, 0, "nh_tty_claimStandardIO");
+    return claimStandardIO_f ? claimStandardIO_f(TTY_p) : NH_TTY_ERROR_BAD_STATE;
 }
 
 NH_TTY_RESULT nh_tty_unclaimStandardIO(
-    nh_tty_PseudoTerminal *PseudoTerminal_p)
+    nh_tty_TTY *TTY_p)
 {
-    nh_tty_unclaimStandardIO_f unclaimStandardIO_f = !NH_LOADER_P || !PseudoTerminal_p ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_TTY, 0, "nh_tty_unclaimStandardIO");
-    return unclaimStandardIO_f ? unclaimStandardIO_f(PseudoTerminal_p) : NH_TTY_ERROR_BAD_STATE;
+    nh_tty_unclaimStandardIO_f unclaimStandardIO_f = !NH_LOADER_P || !TTY_p ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_TTY, 0, "nh_tty_unclaimStandardIO");
+    return unclaimStandardIO_f ? unclaimStandardIO_f(TTY_p) : NH_TTY_ERROR_BAD_STATE;
 }
 
 NH_TTY_RESULT nh_tty_sendInput(
-    nh_tty_PseudoTerminal *PseudoTerminal_p, nh_wsi_Event Event)
+    nh_tty_TTY *TTY_p, nh_wsi_Event Event)
 {
-    nh_tty_sendInput_f sendInput_f = !NH_LOADER_P || !PseudoTerminal_p ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_TTY, 0, "nh_tty_sendInput");
-    return sendInput_f ? sendInput_f(PseudoTerminal_p, Event) : NH_TTY_ERROR_BAD_STATE;
+    nh_tty_sendInput_f sendInput_f = !NH_LOADER_P || !TTY_p ? NULL : NH_LOADER_P->loadSymbol_f(NH_MODULE_TTY, 0, "nh_tty_sendInput");
+    return sendInput_f ? sendInput_f(TTY_p, Event) : NH_TTY_ERROR_BAD_STATE;
 }
 
diff --git a/src/lib/netzhaut/nhtty.h b/src/lib/netzhaut/nhtty.h
index 8104faf..0ef9154 100644
--- a/src/lib/netzhaut/nhtty.h
+++ b/src/lib/netzhaut/nhtty.h
@@ -17,23 +17,23 @@
  *  @{
  */
 
-    nh_tty_PseudoTerminal *nh_tty_openPseudoTerminal(
+    nh_tty_TTY *nh_tty_openTTY(
     );
 
     NH_TTY_RESULT nh_tty_addDefaultProgram(
-        nh_tty_PseudoTerminal *PseudoTerminal_p, NH_BYTE *name_p
+        nh_tty_TTY *TTY_p, NH_BYTE *name_p
     ); 
 
     NH_TTY_RESULT nh_tty_claimStandardIO(
-        nh_tty_PseudoTerminal *PseudoTerminal_p
+        nh_tty_TTY *TTY_p
     );
     
     NH_TTY_RESULT nh_tty_unclaimStandardIO(
-        nh_tty_PseudoTerminal *PseudoTerminal_p
+        nh_tty_TTY *TTY_p
     );
 
     NH_TTY_RESULT nh_tty_sendInput(
-        nh_tty_PseudoTerminal *PseudoTerminal_p, nh_wsi_Event Event
+        nh_tty_TTY *TTY_p, nh_wsi_Event Event
     );
 
 /** @} */
diff --git a/src/lib/nhcore/Common/About.h b/src/lib/nhcore/Common/About.h
index c4752a5..0128f58 100644
--- a/src/lib/nhcore/Common/About.h
+++ b/src/lib/nhcore/Common/About.h
@@ -16,7 +16,7 @@
  *  @ingroup lib
  */
 
-/** @defgroup lib_nhcore_changelog Changelog
+/** @defgroup lib_nhcore_version Version
  *  @ingroup lib_nhcore
  */
 /** @defgroup lib_nhcore_macros Macros 
@@ -38,90 +38,33 @@
  *  @ingroup lib_nhcore
  */
 
-/** @addtogroup lib_nhcore_changelog
+/** @addtogroup lib_nhcore_version
  *  @{
  */
 
     /**
      * The API version is used for backwards-incompatible API changes. 
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_CORE_API_VERSION 0
 
     /**
      * The major version is used for the completion of big functionalities. 
-     *
-     * 2021-06-08 | v0.1.0.0 <a id="v0.1.0.0"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Merge nhloader-module into nhcore.
-     * - [Dajo Frey](https://github.com/dajofrey): Improve loader robustness.
-     * - [Dajo Frey](https://github.com/dajofrey): Add module logging routine.
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_CORE_MAJOR_VERSION 1
 
     /**
      * The minor version is used for the addition of small functionalities or consequential changes. 
-     *
-     * 2021-07-14 | v0.1.3.0 <a id="v0.1.3.0"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Add nh_appendByteToString() and nh_removeFromString().
-     * - [Dajo Frey](https://github.com/dajofrey): Rename bytes_p field in \ref nh_String.
-     * - [Dajo Frey](https://github.com/dajofrey): Improve nh_appendToArray() by ensuring that data is NULL terminated.
-     *
-     * 2021-07-03 | v0.1.2.0 <a id="v0.1.2.0"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Add 'nhurl' data to loader.
-     * - [Dajo Frey](https://github.com/dajofrey): Improve major-version handling in loader by adding the possibility to specify -1 instead of a valid major-version.
-     *
-     * 2021-06-24 | v0.1.1.0 <a id="v0.1.1.0"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Add basic thread logging.
-     * - [Dajo Frey](https://github.com/dajofrey): Improve workload handling.
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
-    #define NH_CORE_MINOR_VERSION 3
+    #define NH_CORE_MINOR_VERSION 4
 
     /**
      * The patch version is used for bugfixes or non-consequential changes. 
-     *
-     * 2021-06-23 | v0.1.0.3 <a id="v0.1.0.3"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Adjust dependency handling of loader.
-     * - [Dajo Frey](https://github.com/dajofrey): Rename loader functions.
-     * - [Dajo Frey](https://github.com/dajofrey): Add nh_loadExistingSymbol().
-     *
-     * 2021-06-12 | v0.1.0.2 <a id="v0.1.0.2"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Add missing nhterm entry in nh_logModules().
-     *
-     * 2021-06-10 | v0.1.0.1 <a id="v0.1.0.1"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Add 'nhterm' data to loader.
-     *
-     * 2021-06-05 | v0.0.0.4 <a id="v0.0.0.4"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Fix allocation size argument for realloc call in nh_removeTailFromArray().
-     *
-     * 2021-05-31 | v0.0.0.3 <a id="v0.0.0.3"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Improve nh_writeBytesToFile().
-     *
-     * 2021-05-28 | v0.0.0.2 <a id="v0.0.0.2"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Rearrange source files.
-     * - [Dajo Frey](https://github.com/dajofrey): Delete legacy source files.
-     *
-     * 2021-04-29 | v0.0.0.1 <a id="v0.0.0.1"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Move Unicode.h and UnicodeLookup.h files to the nhencoding library.
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_CORE_PATCH_VERSION 0
 
-/** @} */
-
-/** @addtogroup lib_nhcore_vars
- *  @{
- */
-
+    /**
+     * Version array.
+     */
     extern int NH_CORE_VERSION_P[4];
 
 /** @} */
diff --git a/src/lib/nhcore/Common/Log.c b/src/lib/nhcore/Common/Log.c
index c6f2815..16fe612 100644
--- a/src/lib/nhcore/Common/Log.c
+++ b/src/lib/nhcore/Common/Log.c
@@ -130,6 +130,9 @@ NH_BEGIN()
                 case NH_MODULE_URL :
                     ver_p = NH_LOADER.loadSymbol_f(i, NH_LOADER.Modules_p[i].major, "NH_URL_VERSION_P");
                     break;
+                case NH_MODULE_MAKE :
+                    ver_p = NH_LOADER.loadSymbol_f(i, NH_LOADER.Modules_p[i].major, "NH_MAKE_VERSION_P");
+                    break;
             }
             if (!ver_p) {NH_END(NH_ERROR_BAD_STATE)}
             sprintf(message_p, "%s%s : v%d.%d.%d.%d", NH_MODULE_NAMES_PP[i], indent_p, ver_p[0], ver_p[1], ver_p[2], ver_p[3]);
diff --git a/src/lib/nhcore/Loader/Loader.c b/src/lib/nhcore/Loader/Loader.c
index 6ab3c3c..ca72ef6 100644
--- a/src/lib/nhcore/Loader/Loader.c
+++ b/src/lib/nhcore/Loader/Loader.c
@@ -50,6 +50,7 @@ const NH_BYTE *NH_MODULE_NAMES_PP[] = {
     "nhterm",
     "nhrenderer",
     "nhurl",
+    "nhmake",
 };
 
 int nh_getModuleIndex(
@@ -83,7 +84,10 @@ static nh_Module *nh_getModule(
 {
 NH_BEGIN()
 
-    if (!NH_LOADER.Modules_p[_module].lib_p || (major != -1 && NH_LOADER.Modules_p[_module].major != major)) {
+    if (NH_LOADER.Modules_p[_module].lib_p == NULL) {
+        NH_END(NULL)
+    }
+    if (major != -1 && NH_LOADER.Modules_p[_module].major != major) {
         NH_END(NULL)
     }
 
@@ -153,6 +157,9 @@ NH_BEGIN()
         case NH_MODULE_URL :
             NH_CHECK(NH_LOADER.load_f(NH_MODULE_ENCODING, 0))
             break;
+
+        case NH_MODULE_MAKE :
+            break;
     }
 
 NH_DIAGNOSTIC_END(NH_SUCCESS)
@@ -255,7 +262,7 @@ NH_BEGIN()
 
 #ifdef __unix__
 
-    NH_BYTE *error_p;
+    NH_BYTE *error_p = NULL;
     dlerror(); // clear any existing error
 
     void *function_p = dlsym(Module_p->lib_p, functionName_p); 
@@ -291,7 +298,6 @@ NH_BEGIN()
     NH_LOADER.unload_f = nh_unload;
     NH_LOADER.loadSymbol_f = nh_loadSymbol;
 
-
     for (int i = 0; i < _NH_MODULE_COUNT; ++i) {
         NH_LOADER.Modules_p[i] = nh_initModule(i);
     }
diff --git a/src/lib/nhcore/Loader/Loader.h b/src/lib/nhcore/Loader/Loader.h
index 8db04cb..504084f 100644
--- a/src/lib/nhcore/Loader/Loader.h
+++ b/src/lib/nhcore/Loader/Loader.h
@@ -17,6 +17,9 @@
  *  @{
  */
 
+    /**
+     * !!! DONT FORGET TO EDIT COMMON/LOG.H WHEN ADDING A MODULE !!!
+     */
     typedef enum NH_MODULE {
         NH_MODULE_CORE,
         NH_MODULE_WSI,
@@ -32,6 +35,7 @@
         NH_MODULE_TERM,
         NH_MODULE_RENDERER,
         NH_MODULE_URL,
+        NH_MODULE_MAKE,
        _NH_MODULE_COUNT,
     } NH_MODULE;
 
diff --git a/src/lib/nhcss/Common/About.h b/src/lib/nhcss/Common/About.h
index 71f83d2..fff895f 100644
--- a/src/lib/nhcss/Common/About.h
+++ b/src/lib/nhcss/Common/About.h
@@ -16,7 +16,7 @@
  *  @brief The nhcss library implements the CSS based renderer.
  */
 
-/** @defgroup lib_nhcss_changelog Changelog
+/** @defgroup lib_nhcss_version Version
  *  @ingroup lib_nhcss
  */
 /** @defgroup lib_nhcss_macros Macros 
@@ -38,132 +38,33 @@
  *  @ingroup lib_nhcss
  */
 
-/** @addtogroup lib_nhcss_changelog 
+/** @addtogroup lib_nhcss_version
  *  @{
  */
 
     /**
      * The API version is used for backwards-incompatible API changes. 
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_CSS_API_VERSION 0
 
     /**
      * The major version is used for the completion of big functionalities. 
-     *
-     * 2021-05-18 | v0.2.0.0 <a id="v0.2.0.0"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Improve logging.
-     * - [Dajo Frey](https://github.com/dajofrey): Add fragment tree based layout/rendering.
-     * - [Dajo Frey](https://github.com/dajofrey): Add inline-box fragmentation.
-     *
-     * 2021-05-15 | v0.1.0.0 <a id="v0.1.0.0"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Add \ref nh_css_RenderContext routines.
-     * - [Dajo Frey](https://github.com/dajofrey): Add CSSOM interfaces.
-     * - [Dajo Frey](https://github.com/dajofrey): Adjust parsing routines to use CSSOM interfaces.
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
-    #define NH_CSS_MAJOR_VERSION 2
+    #define NH_CSS_MAJOR_VERSION 3
 
     /**
      * The minor version is used for the addition of small functionalities or consequential changes. 
-     *
-     * 2021-06-29 | v0.2.5.0 <a id="v0.2.5.0"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Fix tokenizer issue with parsing escape sequences where the following codepoint was ignored.
-     * - [Dajo Frey](https://github.com/dajofrey): Improve parser architecture.
-     * - [Dajo Frey](https://github.com/dajofrey): Add first iteration of counter-style based marker calculation.
-     * - [Dajo Frey](https://github.com/dajofrey): Add CSSCounterStyleRule interface.
-     *
-     * 2021-06-18 | v0.2.4.0 <a id="v0.2.4.0"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Fix font-size computation seg-fault when using em values.
-     * - [Dajo Frey](https://github.com/dajofrey): Fix/Improve text-align routines.
-     * - [Dajo Frey](https://github.com/dajofrey): Add first iteration of float-property handling.
-     * - [Dajo Frey](https://github.com/dajofrey): Add first iteration of width-property handling.
-     *
-     * 2021-05-25 | v0.2.3.0 <a id="v0.2.3.0"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Add initial support for text-align.
-     *
-     * 2021-05-22 | v0.2.2.0 <a id="v0.2.2.0"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Add initial support for box-sizing properties.
-     * - [Dajo Frey](https://github.com/dajofrey): Add support for padding shorthand.
-     * - [Dajo Frey](https://github.com/dajofrey): Add support for margin shorthand.
-     *
-     * 2021-05-22 | v0.2.1.0 <a id="v0.2.1.0"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Improve vertical font-positioning.
-     * - [Dajo Frey](https://github.com/dajofrey): Fix text-run handling in box-tree.
-     * - [Dajo Frey](https://github.com/dajofrey): Improve box-tree parsing.
-     *
-     * 2021-05-11 | v0.0.3.0 <a id="v0.0.3.0"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Add first iteration of text-width.
-     * - [Dajo Frey](https://github.com/dajofrey): Add first iteration of text-style.
-     * - [Dajo Frey](https://github.com/dajofrey): Add general improvements to text-rendering.
-     *
-     * 2021-05-03 | v0.0.2.0 <a id="v0.0.2.0"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Add first iteration of border handling/rendering.
-     * - [Dajo Frey](https://github.com/dajofrey): Add border-radius property.
-     * - [Dajo Frey](https://github.com/dajofrey): Improve text-rendering by offsetting correctly using the font ascender in nh_css_getTextVertices().
-     *
-     * 2021-04-24 | v0.0.1.0 <a id="v0.0.1.0"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Improve layout algorithm in nh_css_arrangeBlockFormattingContext().
-     * - [Dajo Frey](https://github.com/dajofrey): Add nh_css_isLengthValue() and nh_css_isLengthPercentageValue().
-     * - [Dajo Frey](https://github.com/dajofrey): Fix not initializing \ref nh_css_Declaration.important.
-     * - [Dajo Frey](https://github.com/dajofrey): Add very simple margin-collapse routine nh_css_collapse().
-     * - [Dajo Frey](https://github.com/dajofrey): Fix wrong variable assignments in nh_css_computeBoxValues().
-     * - [Dajo Frey](https://github.com/dajofrey): Improve font-size and margin-block/margin-inline handling.
-     *
-     * 2021-02-23 | v0.0.0.0 
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_CSS_MINOR_VERSION 5
 
     /**
      * The patch version is used for bugfixes or non-consequential changes. 
-     *
-     * 2021-06-27 | v0.2.4.1 <a id="v0.2.4.1"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Add experimental marker pseudo-element implementation in source-tree.
-     * - [Dajo Frey](https://github.com/dajofrey): Improve source-tree logging.
-     *
-     * 2021-05-27 | v0.2.3.1 <a id="v0.2.3.1"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Prepare word-break implementation.
-     *
-     * 2021-05-06 | v0.0.2.2 <a id="v0.0.2.2"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Fix mixed-content check in box-tree creation.
-     * - [Dajo Frey](https://github.com/dajofrey): Fix font-related interface calls.
-     *
-     * 2021-05-05 | v0.0.2.1 <a id="v0.0.2.1"></a> 
-     * - [Dajo Frey](https://github.com/dajofrey): Disable bottom margin collapse. 
-     * - [Dajo Frey](https://github.com/dajofrey): Adjust values corresponding to border-width keywords. 
-     * - [Dajo Frey](https://github.com/dajofrey): Improve logging. 
-     *
-     * 2021-05-01 | v0.0.1.3 <a id="v0.0.1.3"></a> 
-     * - [Dajo Frey](https://github.com/dajofrey): Improve log formatting. 
-     *
-     * 2021-04-30 | v0.0.1.2 <a id="v0.0.1.2"></a> 
-     * - [Dajo Frey](https://github.com/dajofrey): Fix margin-collapse in case of padding/border separation. 
-     * - [Dajo Frey](https://github.com/dajofrey): Adjust and potentially fix text vertices generation in nh_css_getTextVertices().
-     *
-     * 2021-04-24 | v0.0.1.1 <a id="v0.0.1.1"></a> 
-     * - [Dajo Frey](https://github.com/dajofrey): Rename default.css.h to default.css.inc.
-     *
-     * 2021-04-10 | v0.0.0.1 <a id="v0.0.0.1"></a> 
-     * - [Dajo Frey](https://github.com/dajofrey): Rewrite layout engine.
-     * - [Dajo Frey](https://github.com/dajofrey): Replace formatting-tree with box-tree.
-     * - [Dajo Frey](https://github.com/dajofrey): Replace annotated-nodes with source-tree.
-     *
-     * 2021-02-23 | v0.0.0.0 
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_CSS_PATCH_VERSION 0
 
-/** @} */
-
-/** @addtogroup lib_nhcss_vars
- *  @{
- */
-
+    /**
+     * Version array.
+     */
     extern int NH_CSS_VERSION_P[4];
 
 /** @} */
diff --git a/src/lib/nhdom/Common/About.h b/src/lib/nhdom/Common/About.h
index 85d9a88..9ffca9b 100644
--- a/src/lib/nhdom/Common/About.h
+++ b/src/lib/nhdom/Common/About.h
@@ -17,7 +17,7 @@
  *  DOM defines a platform-neutral model for events, aborting activities, and node trees.
  */
 
-/** @defgroup lib_nhdom_changelog Changelog
+/** @defgroup lib_nhdom_version Version
  *  @ingroup lib_nhdom
  */
 /** @defgroup lib_nhdom_macros Macros 
@@ -39,58 +39,33 @@
  *  @ingroup lib_nhdom
  */
 
-/** @addtogroup lib_nhdom_changelog 
+/** @addtogroup lib_nhdom_version
  *  @{
  */
 
     /**
      * The API version is used for backwards-incompatible API changes. 
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_DOM_API_VERSION 0
 
     /**
      * The major version is used for the completion of big functionalities. 
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_DOM_MAJOR_VERSION 0
 
     /**
      * The minor version is used for the addition of small functionalities or consequential changes. 
-     *
-     * 2021-04-29 | v0.0.1.0 <a id="v0.0.1.0"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Add nh_dom_setParentNode() and nh_dom_getParentNode().
-     * - [Dajo Frey](https://github.com/dajofrey): Add nh_dom_getParentElement().
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
-    #define NH_DOM_MINOR_VERSION 1
+    #define NH_DOM_MINOR_VERSION 3
 
     /**
      * The patch version is used for bugfixes or non-consequential changes. 
-     *
-     * 2021-05-24 | v0.0.1.2 <a id="v0.0.1.2"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Add nh_dom_getAttrByLocalName().
-
-     * 2021-05-14 | v0.0.1.1 <a id="v0.0.1.1"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Add nh_dom_getText().
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
-    #define NH_DOM_PATCH_VERSION 2
-
-/** @} */
-
-/** @addtogroup lib_nhdom_vars
- *  @{
- */
+    #define NH_DOM_PATCH_VERSION 0
 
+    /**
+     * Version array.
+     */
     extern int NH_DOM_VERSION_P[4];
 
 /** @} */
diff --git a/src/lib/nhecmascript/Common/About.h b/src/lib/nhecmascript/Common/About.h
index ad04c26..04706d0 100644
--- a/src/lib/nhecmascript/Common/About.h
+++ b/src/lib/nhecmascript/Common/About.h
@@ -16,7 +16,7 @@
  *  @brief The nhecmascript library implements the ECMAScript Language Specification (ECMA-262).
  */
 
-/** @defgroup lib_nhecmascript_changelog Changelog
+/** @defgroup lib_nhecmascript_version Version
  *  @ingroup lib_nhecmascript
  */
 /** @defgroup lib_nhecmascript_macros Macros 
@@ -38,48 +38,33 @@
  *  @ingroup lib_nhecmascript
  */
 
-/** @addtogroup lib_nhecmascript_changelog 
+/** @addtogroup lib_nhecmascript_version
  *  @{
  */
 
     /**
-     * API version.
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
+     * The API version is used for backwards-incompatible API changes. 
      */
     #define NH_ECMASCRIPT_API_VERSION 0
 
     /**
-     * Major version.
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
+     * The major version is used for the completion of big functionalities. 
      */
     #define NH_ECMASCRIPT_MAJOR_VERSION 0
 
     /**
-     * Minor version.
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
+     * The minor version is used for the addition of small functionalities or consequential changes. 
      */
     #define NH_ECMASCRIPT_MINOR_VERSION 0
 
     /**
-     * Patch version.
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
+     * The patch version is used for bugfixes or non-consequential changes. 
      */
     #define NH_ECMASCRIPT_PATCH_VERSION 0
 
-/** @} */
-
-/** @addtogroup lib_nhecmascript_vars
- *  @{
- */
-
+    /**
+     * Version array.
+     */
     extern int NH_ECMASCRIPT_VERSION_P[4];
 
 /** @} */
diff --git a/src/lib/nhencoding/Common/About.h b/src/lib/nhencoding/Common/About.h
index 96e9c64..4ad53da 100644
--- a/src/lib/nhencoding/Common/About.h
+++ b/src/lib/nhencoding/Common/About.h
@@ -16,7 +16,7 @@
  *  @brief The nhencoding library implements the ECMA-262 engine.
  */
 
-/** @defgroup lib_nhencoding_changelog Changelog
+/** @defgroup lib_nhencoding_version Version
  *  @ingroup lib_nhencoding
  */
 /** @defgroup lib_nhencoding_macros Macros 
@@ -38,74 +38,33 @@
  *  @ingroup lib_nhencoding
  */
 
-/** @addtogroup lib_nhencoding_changelog 
+/** @addtogroup lib_nhencoding_version 
  *  @{
  */
 
     /**
      * The API version is used for backwards-incompatible API changes. 
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_ENCODING_API_VERSION 0
 
     /**
      * The major version is used for the completion of big functionalities. 
-     *
-     * 2021-07-08 | v0.1.0.0 <a id="v0.1.0.0"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Add abstract \ref nh_encoding_String interface. 
-     * - [Dajo Frey](https://github.com/dajofrey): Add nh_encoding_splitUTF32(). 
-     * - [Dajo Frey](https://github.com/dajofrey): Add nh_encoding_digitsToNumber(). 
-
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_ENCODING_MAJOR_VERSION 1
 
     /**
      * The minor version is used for the addition of small functionalities or consequential changes. 
-     *
-     * 2021-09-09 | v0.1.1.0 <a id="v0.1.1.0"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Add convenience function nh_encoding_compareUTF32ASCII(). 
-     *
-     * 2021-06-29 | v0.0.4.0 <a id="v0.0.4.0"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Change nh_encoding_compareUTF32() parameters. 
-     * - [Dajo Frey](https://github.com/dajofrey): Add nh_encoding_hexDigitToNumber(). 
-     *
-     * 2021-06-07 | v0.0.3.0 <a id="v0.0.3.0"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Add nh_encoding_compareUTF32().
-     * - [Dajo Frey](https://github.com/dajofrey): Add nh_encoding_appendUTF32Codepoint().
-     * - [Dajo Frey](https://github.com/dajofrey): Rename some UTF32 functions.
-     *
-     * 2021-05-30 | v0.0.2.0 <a id="v0.0.2.0"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Add simple UTF32 matching function.
-     *
-     * 2021-05-29 | v0.0.1.0 <a id="v0.0.1.0"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Add UTF32 functions.
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_ENCODING_MINOR_VERSION 1
 
     /**
      * The patch version is used for bugfixes or non-consequential changes. 
-     *
-     * 2021-06-09 | v0.0.3.1 <a id="v0.0.3.1"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Improve UTF8 decoding functions by adding read parameters. 
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_ENCODING_PATCH_VERSION 0
 
-/** @} */
-
-/** @addtogroup lib_nhencoding_vars
- *  @{
- */
-
+    /**
+     * Version array.
+     */
     extern int NH_ENCODING_VERSION_P[4];
 
 /** @} */
diff --git a/src/lib/nhgfx/Common/About.h b/src/lib/nhgfx/Common/About.h
index bde8c74..a7e79d9 100644
--- a/src/lib/nhgfx/Common/About.h
+++ b/src/lib/nhgfx/Common/About.h
@@ -16,7 +16,7 @@
   * @brief The nhgfx library implements the ECMA-262 engine.
   */
 
-/** @defgroup lib_nhgfx_changelog Changelog
+/** @defgroup lib_nhgfx_version Version
  *  @ingroup lib_nhgfx
  */
 /** @defgroup lib_nhgfx_macros Macros 
@@ -38,80 +38,33 @@
  *  @ingroup lib_nhgfx
  */
 
-/** @addtogroup lib_nhgfx_changelog 
+/** @addtogroup lib_nhgfx_version
  *  @{
  */
 
     /**
      * The API version is used for backwards-incompatible API changes. 
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_GFX_API_VERSION 0
 
     /**
      * The major version is used for the completion of big functionalities. 
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_GFX_MAJOR_VERSION 0
 
     /**
      * The minor version is used for the addition of small functionalities or consequential changes. 
-     *
-     * 2021-06-12 | v0.0.3.0 <a id="v0.0.3.0"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Add nh_gfx_claimViewport() to streamline viewport claiming.
-     * - [Dajo Frey](https://github.com/dajofrey): Add monospace font-family names.
-     * - [Dajo Frey](https://github.com/dajofrey): Add nh_gfx_createTextFromFont().
-     *
-     * 2021-05-10 | v0.0.2.0 <a id="v0.0.2.0"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Fix text-width calculation by changing float-addition to int-addition in nh_gfx_getTextWidth().
-     * - [Dajo Frey](https://github.com/dajofrey): Set fallback font-weight to 400 when parsing fails.
-     * - [Dajo Frey](https://github.com/dajofrey): Add nh_gfx_createText() for rendering text using multiple fonts.
-     *
-     * 2021-05-06 | v0.0.1.0 <a id="v0.0.1.0"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Create new directory for font-related stuff.
-     * - [Dajo Frey](https://github.com/dajofrey): Add first iteration of generic font-family handling. 
-     * - [Dajo Frey](https://github.com/dajofrey): Improve general font-handling.
-     * - [Dajo Frey](https://github.com/dajofrey): Improve font-logging.
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
-    #define NH_GFX_MINOR_VERSION 3
+    #define NH_GFX_MINOR_VERSION 4
 
     /**
      * The patch version is used for bugfixes or non-consequential changes. 
-     *
-     * 2021-06-14 | v0.0.3.1 <a id="v0.0.3.1"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Add nh_gfx_vk_reloadFontTexture().
-     * - [Dajo Frey](https://github.com/dajofrey): Fix wrong scissor position for vulkan viewports.
-     *
-     * 2021-05-25 | v0.0.2.2 <a id="v0.0.2.2"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Fix nh_gfx_getFittingTextLength() by calculating width based on pixel.
-     *
-     * 2021-05-16 | v0.0.2.1 <a id="v0.0.2.1"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Add codepoint to \ref nh_gfx_Glyph.
-     *
-     * 2021-04-30 | v0.0.0.1 <a id="v0.0.0.1"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Change nh_gfx_getGlyph(), nh_gfx_getTextHeight(), and nh_gfx_getTextWidth() to accept UTF32 arguments instead of UTF8.
-     * - [Dajo Frey](https://github.com/dajofrey): Improve font rendering by adding Harfbuzz routines.
-     * - [Dajo Frey](https://github.com/dajofrey): Improve font logging.
-     * - [Dajo Frey](https://github.com/dajofrey): Remove font-prototype concept.
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_GFX_PATCH_VERSION 1
 
-/** @} */
-
-/** @addtogroup lib_nhgfx_vars
- *  @{
- */
-
+    /**
+     * Version array.
+     */
     extern int NH_GFX_VERSION_P[4];
 
 /** @} */
diff --git a/src/lib/nhhtml/Common/About.h b/src/lib/nhhtml/Common/About.h
index f22dce9..838b408 100644
--- a/src/lib/nhhtml/Common/About.h
+++ b/src/lib/nhhtml/Common/About.h
@@ -16,7 +16,7 @@
  *  @brief The nhhtml library implements HTML parsing and the HTML event loop.
  */
 
-/** @defgroup lib_nhhtml_changelog Changelog
+/** @defgroup lib_nhhtml_version Version
  *  @ingroup lib_nhhtml
  */
 /** @defgroup lib_nhhtml_macros Macros 
@@ -38,63 +38,33 @@
  *  @ingroup lib_nhhtml
  */
 
-/** @addtogroup lib_nhhtml_changelog 
+/** @addtogroup lib_nhhtml_version
  *  @{
  */
 
     /**
      * The API version is used for backwards-incompatible API changes. 
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_HTML_API_VERSION 0
 
     /**
      * The major version is used for the completion of big functionalities. 
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_HTML_MAJOR_VERSION 0
 
     /**
      * The minor version is used for the addition of small functionalities or consequential changes. 
-     *
-     * 2021-05-22 | v0.0.2.0 <a id="v0.0.2.0"></a> 
-     * - [Dajo Frey](https://github.com/dajofrey): Add implementation of nh_html_reconstructActiveFormattingElements().
-     * - [Dajo Frey](https://github.com/dajofrey): Make nh_html_getTagIndex() more robust.
-     * - [Dajo Frey](https://github.com/dajofrey): Add HTMLElement interface implementation.
-
-     * 2021-05-14 | v0.0.1.0 <a id="v0.0.1.0"></a> 
-     * - [Dajo Frey](https://github.com/dajofrey): Move some CSS related routines to nhcss.
-     * - [Dajo Frey](https://github.com/dajofrey): Adjust nh_html_createDocumentContext().
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_HTML_MINOR_VERSION 2
 
     /**
      * The patch version is used for bugfixes or non-consequential changes. 
-     *
-     * 2021-06-21 | v0.0.2.1 <a id="v0.0.2.1"></a> 
-     * - [Dajo Frey](https://github.com/dajofrey): Adjust css dependencies.
-     *
-     * 2021-04-29 | v0.0.0.1 <a id="v0.0.0.1"></a> 
-     * - [Dajo Frey](https://github.com/dajofrey): Fix not setting any node-parent in nh_html_createElementForToken().
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_HTML_PATCH_VERSION 1
 
-/** @} */
-
-/** @addtogroup lib_nhhtml_vars
- *  @{
- */
-
+    /**
+     * Version array. 
+     */
     extern int NH_HTML_VERSION_P[4];
 
 /** @} */
diff --git a/src/lib/nhmake/Common/About.c b/src/lib/nhmake/Common/About.c
new file mode 100644
index 0000000..b2c336e
--- /dev/null
+++ b/src/lib/nhmake/Common/About.c
@@ -0,0 +1,21 @@
+// LICENSE NOTICE ==================================================================================
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2020 The netzhaut Authors
+ * Published under MIT
+ */
+
+// INCLUDE ==========================================================================================
+
+#include "About.h"
+
+// VERSION =========================================================================================
+
+int NH_MAKE_VERSION_P[4] = {
+    NH_MAKE_API_VERSION, 
+    NH_MAKE_MAJOR_VERSION, 
+    NH_MAKE_MINOR_VERSION,
+    NH_MAKE_PATCH_VERSION,
+};
+
diff --git a/external/selfmake/src/lib/Common/About.h b/src/lib/nhmake/Common/About.h
similarity index 58%
rename from external/selfmake/src/lib/Common/About.h
rename to src/lib/nhmake/Common/About.h
index e5a2d37..d9f6841 100644
--- a/external/selfmake/src/lib/Common/About.h
+++ b/src/lib/nhmake/Common/About.h
@@ -1,126 +1,102 @@
-#ifndef SM_ABOUT_H
-#define SM_ABOUT_H
+#ifndef NH_MAKE_ABOUT_H
+#define NH_MAKE_ABOUT_H
 
 #ifndef DOXYGEN_SHOULD_SKIP_THIS
 
 /**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
  * Published under MIT
  */
 
 #endif
 
-/** @defgroup selfmake selfmake internal
- *  @brief The internal code-documentation for selfmake. 
+/** @defgroup lib_nhmake nhmake
+ *  @brief The nhmake library implements the build/versioning system used by netzhaut.
  */
 /** @defgroup selfmakeAPI selfmake API 
  *  @brief The API code-documentation for selfmake. 
  */
 
-/** @defgroup selfmakeChangelog Changelog
- *  @ingroup selfmake
+/** @defgroup lib_nhmake_changelog Changelog
+ *  @ingroup nhmake
  */
-/** @defgroup selfmakeMacros Macros 
- *  @ingroup selfmake
+/** @defgroup lib_nhmake_macros Macros 
+ *  @ingroup nhmake
  */
-/** @defgroup selfmakeEnums Enumerations
- *  @ingroup selfmake
+/** @defgroup lib_nhmake_enums Enumerations
+ *  @ingroup nhmake
  */
-/** @defgroup selfmakeStructs Data Structures
- *  @ingroup selfmake
+/** @defgroup lib_nhmake_structs Data Structures
+ *  @ingroup nhmake
  */
-/** @defgroup selfmakeFunctions Functions
- *  @ingroup selfmake
+/** @defgroup lib_nhmake_functions Functions
+ *  @ingroup nhmake
  */
-/** @defgroup selfmakeTypedefs Typedefs
- *  @ingroup selfmake
+/** @defgroup lib_nhmake_typedefs Typedefs
+ *  @ingroup nhmake
  */
-/** @defgroup selfmakeVars Variables
- *  @ingroup selfmake
+/** @defgroup lib_nhmake_vars Variables
+ *  @ingroup nhmake
  */
 
 /** @defgroup selfmakeAPIEnums Enumerations
- *  @ingroup selfmakeAPI
+ *  @ingroup nhmakeAPI
  */
 /** @defgroup selfmakeAPIStructs Data Structures
- *  @ingroup selfmakeAPI
+ *  @ingroup nhmakeAPI
  */
 /** @defgroup selfmakeAPIFunctions Functions
- *  @ingroup selfmakeAPI
+ *  @ingroup nhmakeAPI
  */
 /** @defgroup selfmakeAPITypedefs Typedefs
- *  @ingroup selfmakeAPI
+ *  @ingroup nhmakeAPI
  */
 /** @defgroup selfmakeAPIVars Variables
- *  @ingroup selfmakeAPI
+ *  @ingroup nhmakeAPI
  */
 
-/** @addtogroup selfmakeChangelog
+/** @addtogroup lib_nhmake_changelog
  *  @{
  */
 
     /**
      * The API version is used for backwards-incompatible API changes.
-     *
-     * 2021-04-17 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
-    #define SM_API_VERSION 0
+    #define NH_MAKE_API_VERSION 0
 
     /**
      * The major version is used for the completion of big functionalities.
-     *
-     * 2021-09-22 | v0.3.0.0 <a id="v0.3.0.0"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Add first iteration of conditional element support.
-     *
-     * 2021-07-03 | v0.2.0.0 <a id="v0.2.0.0"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Add experimental test capabilities.
-     * - [Dajo Frey](https://github.com/dajofrey): Improve option parsing.
-     *
-     * 2021-04-21 | v0.1.0.0 <a id="v0.1.0.0"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Add first iteration of binary building, mostly implemented in sm_build().
-     * - [Dajo Frey](https://github.com/dajofrey): Add parameter to sm_addSourceContext() to offset argument parsing.
-     * - [Dajo Frey](https://github.com/dajofrey): Add sm_setBeforeBuildCallback() and sm_setAfterBuildCallback().
-     * - [Dajo Frey](https://github.com/dajofrey): Improve option parsing and language syntax. For this, sm_parseOption() is introduced.
-     *
-     * 2021-04-17 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
-    #define SM_MAJOR_VERSION 3
+    #define NH_MAKE_MAJOR_VERSION 3
 
     /**
      * The minor version is used for the addition of small functionalities.
-     *
+     */
+    #define NH_MAKE_MINOR_VERSION 2
+
+    /**
+     * The patch version is used for bugfixes or non-consequential changes.
+     */
+    #define NH_MAKE_PATCH_VERSION 0
+
+    /**
      * 2021-10-07 | v0.3.2.0 <a id="v0.3.2.0"></a>
      * - [Dajo Frey](https://github.com/dajofrey): Add build related functions which allow users to create a lib and a bin with the same name. 
      *
      * 2021-09-29 | v0.3.1.0 <a id="v0.3.1.0"></a>
      * - [Dajo Frey](https://github.com/dajofrey): Add macos port by vinhig. 
      *
-     * 2021-04-25 | v0.1.2.0 <a id="v0.1.2.0"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Add sm_messagef() to API. 
-     *
-     * 2021-04-22 | v0.1.1.0 <a id="v0.1.1.0"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Add custom output path parameter for source contexts, stored in \ref sm_SourceContext.outputPath_p
-     *
-     * 2021-04-17 | v0.0.1.0 <a id="v0.0.1.0"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Fix invalid memory writes in sm_replaceVariables().
-     * - [Dajo Frey](https://github.com/dajofrey): Add sm_terminate() and sm_destroyRuntime(). Not implemented yet though.
-     * - [Dajo Frey](https://github.com/dajofrey): Rename sm_init() to sm_initialize().
-     * - [Dajo Frey](https://github.com/dajofrey): Add sm_getSourceContextArray() and sm_getSourceContext().
-     *
-     * 2021-04-17 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
-     */
-    #define SM_MINOR_VERSION 2
-
-    /**
-     * The patch version is used for bugfixes or non-consequential changes.
+     * 2021-09-22 | v0.3.0.0 <a id="v0.3.0.0"></a>
+     * - [Dajo Frey](https://github.com/dajofrey): Add first iteration of conditional element support.
      *
      * 2021-07-09 | v0.2.0.1 <a id="v0.2.0.1"></a>
      * - [Dajo Frey](https://github.com/dajofrey): Improve test procedure output.
      *
+     * 2021-07-03 | v0.2.0.0 <a id="v0.2.0.0"></a>
+     * - [Dajo Frey](https://github.com/dajofrey): Add experimental test capabilities.
+     * - [Dajo Frey](https://github.com/dajofrey): Improve option parsing.
+     *
      * 2021-05-02 | v0.1.2.4 <a id="v0.1.2.4"></a>
      * - [Dajo Frey](https://github.com/dajofrey): Fix missing last character in messages.
      *
@@ -131,15 +107,33 @@
      * - [Dajo Frey](https://github.com/dajofrey): Remove offset from argument parsing.
      *
      * 2021-04-26 | v0.1.2.1 <a id="v0.1.2.1"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Remove inserted project-prefixes in sm_copy(). 
+     * - [Dajo Frey](https://github.com/dajofrey): Remove inserted project-prefixes in nh_make_copy(). 
+     *
+     * 2021-04-25 | v0.1.2.0 <a id="v0.1.2.0"></a>
+     * - [Dajo Frey](https://github.com/dajofrey): Add nh_make_messagef() to API. 
      *
      * 2021-04-22 | v0.1.1.1 <a id="v0.1.1.1"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Fix missing initialization of \ref sm_SourceContext.api and \ref sm_SourceContext.apiDate_p.
+     * - [Dajo Frey](https://github.com/dajofrey): Fix missing initialization of \ref nh_make_SourceContext.api and \ref nh_make_SourceContext.apiDate_p.
+     *
+     * 2021-04-22 | v0.1.1.0 <a id="v0.1.1.0"></a>
+     * - [Dajo Frey](https://github.com/dajofrey): Add custom output path parameter for source contexts, stored in \ref nh_make_SourceContext.outputPath_p
+     *
+     * 2021-04-21 | v0.1.0.0 <a id="v0.1.0.0"></a>
+     * - [Dajo Frey](https://github.com/dajofrey): Add first iteration of binary building, mostly implemented in nh_make_build().
+     * - [Dajo Frey](https://github.com/dajofrey): Add parameter to nh_make_addSourceContext() to offset argument parsing.
+     * - [Dajo Frey](https://github.com/dajofrey): Add nh_make_setBeforeBuildCallback() and nh_make_setAfterBuildCallback().
+     * - [Dajo Frey](https://github.com/dajofrey): Improve option parsing and language syntax. For this, nh_make_parseOption() is introduced.
+     * 
+     * 2021-04-17 | v0.0.1.0 <a id="v0.0.1.0"></a>
+     * - [Dajo Frey](https://github.com/dajofrey): Fix invalid memory writes in nh_make_replaceVariables().
+     * - [Dajo Frey](https://github.com/dajofrey): Add nh_make_terminate() and nh_make_destroyRuntime(). Not implemented yet though.
+     * - [Dajo Frey](https://github.com/dajofrey): Rename nh_make_init() to nh_make_initialize().
+     * - [Dajo Frey](https://github.com/dajofrey): Add nh_make_getSourceContextArray() and nh_make_getSourceContext().
      *
      * 2021-04-17 | v0.0.0.0
      * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
-    #define SM_PATCH_VERSION 0
+    extern int NH_MAKE_VERSION_P[4];
 
 /** @} */
 
diff --git a/external/selfmake/src/lib/Common/Macros/CUSTOM_CHECK.h b/src/lib/nhmake/Common/Macros/CUSTOM_CHECK.h
similarity index 56%
rename from external/selfmake/src/lib/Common/Macros/CUSTOM_CHECK.h
rename to src/lib/nhmake/Common/Macros/CUSTOM_CHECK.h
index 0befabe..ff1d825 100644
--- a/external/selfmake/src/lib/Common/Macros/CUSTOM_CHECK.h
+++ b/src/lib/nhmake/Common/Macros/CUSTOM_CHECK.h
@@ -1,28 +1,28 @@
 /**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
  * Published under MIT
  */
 
 #include "../../UI/Message.h"
 #include "../Result.h"
 
-#undef  SM_CHECK
-#define SM_CHECK(checkReturn, checkable)                                          \
+#undef  NH_MAKE_CHECK
+#define NH_MAKE_CHECK(checkReturn, checkable)                                          \
 {                                                                                      \
-    SM_RESULT checkResult = checkable;                                            \
-    if (checkResult != SM_SUCCESS) {                                              \
-        sm_messagef("-> \e[1;31mERROR\e[0m %s", SM_RESULTS_PP[checkResult]); \
+    NH_MAKE_RESULT checkResult = checkable;                                            \
+    if (checkResult != NH_MAKE_SUCCESS) {                                              \
+        nh_make_messagef("-> \e[1;31mERROR\e[0m %s", NH_MAKE_RESULTS_PP[checkResult]); \
         return checkReturn;                                                            \
     }                                                                                  \
 }
 
-#undef  SM_CHECK_NULL
-#define SM_CHECK_NULL(checkReturn, checkable)                                                    \
+#undef  NH_MAKE_CHECK_NULL
+#define NH_MAKE_CHECK_NULL(checkReturn, checkable)                                                    \
 {                                                                                                     \
     void *checkResult_p = checkable;                                                                  \
     if (checkResult_p == NULL) {                                                                      \
-        sm_messagef("-> \e[1;31mERROR\e[0m %s", SM_RESULTS_PP[SM_ERROR_NULL_POINTER]); \
+        nh_make_messagef("-> \e[1;31mERROR\e[0m %s", NH_MAKE_RESULTS_PP[NH_MAKE_ERROR_NULL_POINTER]); \
         return checkReturn;                                                                           \
     }                                                                                                 \
 }
diff --git a/external/selfmake/src/lib/Common/Macros/DEFAULT_CHECK.h b/src/lib/nhmake/Common/Macros/DEFAULT_CHECK.h
similarity index 53%
rename from external/selfmake/src/lib/Common/Macros/DEFAULT_CHECK.h
rename to src/lib/nhmake/Common/Macros/DEFAULT_CHECK.h
index e58dda3..000fdf1 100644
--- a/external/selfmake/src/lib/Common/Macros/DEFAULT_CHECK.h
+++ b/src/lib/nhmake/Common/Macros/DEFAULT_CHECK.h
@@ -1,29 +1,29 @@
 /**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
  * Published under MIT
  */
 
 #include "../../UI/Message.h"
 #include "../Result.h"
 
-#undef  SM_CHECK
-#define SM_CHECK(checkable)                                                            \
+#undef  NH_MAKE_CHECK
+#define NH_MAKE_CHECK(checkable)                                                            \
 {                                                                                      \
-    SM_RESULT checkResult = checkable;                                            \
-    if (checkResult != SM_SUCCESS) {                                              \
-        sm_messagef("-> \e[1;31mERROR\e[0m %s", SM_RESULTS_PP[checkResult]); \
+    NH_MAKE_RESULT checkResult = checkable;                                            \
+    if (checkResult != NH_MAKE_SUCCESS) {                                              \
+        nh_make_messagef("-> \e[1;31mERROR\e[0m %s", NH_MAKE_RESULTS_PP[checkResult]); \
         return checkResult;                                                            \
     }                                                                                  \
 }
 
-#undef  SM_CHECK_NULL
-#define SM_CHECK_NULL(checkable)                                                                      \
+#undef  NH_MAKE_CHECK_NULL
+#define NH_MAKE_CHECK_NULL(checkable)                                                                      \
 {                                                                                                     \
     void *checkResult_p = checkable;                                                                  \
     if (checkResult_p == NULL) {                                                                      \
-        sm_messagef("-> \e[1;31mERROR\e[0m %s", SM_RESULTS_PP[SM_ERROR_NULL_POINTER]); \
-        return SM_ERROR_NULL_POINTER;                                                            \
+        nh_make_messagef("-> \e[1;31mERROR\e[0m %s", NH_MAKE_RESULTS_PP[NH_MAKE_ERROR_NULL_POINTER]); \
+        return NH_MAKE_ERROR_NULL_POINTER;                                                            \
     }                                                                                                 \
 }
 
diff --git a/src/lib/nhmake/Common/Macros/FLOW.h b/src/lib/nhmake/Common/Macros/FLOW.h
new file mode 100644
index 0000000..d314858
--- /dev/null
+++ b/src/lib/nhmake/Common/Macros/FLOW.h
@@ -0,0 +1,35 @@
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+#undef NH_MAKE_BEGIN
+#undef NH_MAKE_END
+#undef NH_MAKE_SILENT_END
+#undef NH_MAKE_DIAGNOSTIC_END
+
+#ifdef NH_MAKE_LOG_FLOW
+    #define NH_MAKE_BEGIN()
+#else
+    #define NH_MAKE_BEGIN() 
+#endif
+
+#ifdef NH_MAKE_LOG_FLOW
+    #define NH_MAKE_END(result) {return result;}
+#else
+    #define NH_MAKE_END(result) {return result;} 
+#endif
+
+#ifdef NH_MAKE_LOG_FLOW
+    #define NH_MAKE_SILENT_END() {return;}
+#else
+    #define NH_MAKE_SILENT_END() {return;} 
+#endif
+
+#ifdef NH_MAKE_LOG_FLOW
+    #define NH_MAKE_DIAGNOSTIC_END(result) {return result;}
+#else
+    #define NH_MAKE_DIAGNOSTIC_END(result) {return result;} 
+#endif
+
diff --git a/src/lib/nhmake/Common/Macros/Macros.h b/src/lib/nhmake/Common/Macros/Macros.h
new file mode 100644
index 0000000..3a404dd
--- /dev/null
+++ b/src/lib/nhmake/Common/Macros/Macros.h
@@ -0,0 +1,18 @@
+#ifndef NH_MAKE_MACROS_H
+#define NH_MAKE_MACROS_H
+
+#ifndef DOXYGEN_SHOULD_SKIP_THIS
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+#define NH_MAKE_DEFAULT_CHECK "../Common/Macros/DEFAULT_CHECK.h"
+#define NH_MAKE_CUSTOM_CHECK "../Common/Macros/CUSTOM_CHECK.h"
+#define NH_MAKE_FLOW "../Common/Macros/FLOW.h"
+
+#endif
+
+#endif 
diff --git a/src/lib/nhmake/Common/Result.c b/src/lib/nhmake/Common/Result.c
new file mode 100644
index 0000000..bb369be
--- /dev/null
+++ b/src/lib/nhmake/Common/Result.c
@@ -0,0 +1,91 @@
+// LICENSE NOTICE ==================================================================================
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+// INCLUDE ==========================================================================================
+
+#include "Result.h"
+
+// RESULTS =========================================================================================
+
+const char *NH_MAKE_RESULTS_PP[] = 
+{
+    "NH_MAKE_SUCCESS",
+    "NH_MAKE_ERROR_INVALID_OPTION",
+    "NH_MAKE_ERROR_NULL_POINTER",
+    "NH_MAKE_ERROR_BAD_STATE",
+    "NH_MAKE_ERROR_GENERATE_DOCUMENTS_FAILURE",
+    "NH_MAKE_ERROR_DOWNLOAD_FAILED",
+    "NH_MAKE_ERROR_BUILD_EXTERNAL_FAILED",
+    "NH_MAKE_ERROR_COPY_EXTERNAL_HEADER_FAILED",
+    "NH_MAKE_ERROR_COPY_PUBLIC_LIBRARY_HEADER_FAILED",
+    "NH_MAKE_ERROR_CREATE_LIBRARY_INCLUDES_FAILED",
+    "NH_MAKE_ERROR_BUILD_LIBRARY_FAILED",
+    "NH_MAKE_ERROR_WGET_EXECUTION_FAILED",
+    "NH_MAKE_ERROR_UNZIP_EXECUTION_FAILED",
+    "NH_MAKE_ERROR_DOXYGEN_EXECUTION_FAILED",
+    "NH_MAKE_ERROR_GCC_EXECUTION_FAILED",
+    "NH_MAKE_ERROR_AR_EXECUTION_FAILED",
+    "NH_MAKE_ERROR_XXD_EXECUTION_FAILED",
+    "NH_MAKE_ERROR_CP_EXECUTION_FAILED",
+    "NH_MAKE_ERROR_LIBRARY_NOT_FOUND",
+    "NH_MAKE_ERROR_WGET_NOT_FOUND",
+    "NH_MAKE_ERROR_UNZIP_NOT_FOUND",
+    "NH_MAKE_ERROR_DOXYGEN_NOT_FOUND",
+    "NH_MAKE_ERROR_GCC_NOT_FOUND",
+    "NH_MAKE_ERROR_AR_NOT_FOUND",
+    "NH_MAKE_ERROR_CP_NOT_FOUND",
+    "NH_MAKE_ERROR_GENERATE_VERSION_DEPENDENT_DOCS",
+    "NH_MAKE_ERROR_GENERATE_DOCS_USING_DOXYGEN",
+    "NH_MAKE_ERROR_GET_PROJECT_DIRECTORY",
+    "NH_MAKE_ERROR_GET_WORK_DIRECTORY",
+    "NH_MAKE_ERROR_CANT_OPEN_README",
+    "NH_MAKE_ERROR_CANT_OPEN_HEADER",
+    "NH_MAKE_ERROR_CANT_OPEN_DIR",
+    "NH_MAKE_ERROR_CANT_DOWNLOAD_VULKAN_HEADERS",
+    "NH_MAKE_ERROR_CANT_DOWNLOAD_VOLK",
+    "NH_MAKE_ERROR_CANT_DOWNLOAD_FREETYPE",
+    "NH_MAKE_ERROR_CANT_DOWNLOAD_OPENSSL",
+    "NH_MAKE_ERROR_CANT_DOWNLOAD_PROJECT",
+    "NH_MAKE_ERROR_BUILD_XXD_FAILED",
+    "NH_MAKE_ERROR_BUILD_HELPER_LIBRARY_FAILED",
+    "NH_MAKE_ERROR_NOT_IMPLEMENTED",
+    "NH_MAKE_ERROR_CANT_CREATE_DIRECTORY",
+    "NH_MAKE_ERROR_CANT_CREATE_OBJECT_FILE",
+    "NH_MAKE_ERROR_CANT_CREATE_OBJECTS",
+    "NH_MAKE_ERROR_CANT_CREATE_LIBRARY",
+    "NH_MAKE_ERROR_CANT_CREATE_EXTERNAL_BIN_DIRECTORY",
+    "NH_MAKE_ERROR_CANT_CREATE_EXTERNAL_BIN_OBJECT_DIRECTORY",
+    "NH_MAKE_ERROR_CANT_CREATE_BIN_OBJECT_DIRECTORY",
+    "NH_MAKE_ERROR_CANT_CREATE_BIN_DIRECTORY",
+    "NH_MAKE_ERROR_CANT_CREATE_SHARED_LIB",
+    "NH_MAKE_ERROR_CANT_CREATE_STATIC_LIB",
+    "NH_MAKE_ERROR_CANT_CREATE_INCLUDE_FILE",
+    "NH_MAKE_ERROR_CANT_CREATE_INCLUDE_DIRECTORY",
+    "NH_MAKE_ERROR_CANT_CREATE_EXTERNAL_DIRECTORY",
+    "NH_MAKE_ERROR_COPY_EXTERNAL_HEADER_USING_CP_FAILED",
+    "NH_MAKE_ERROR_COPY_PUBLIC_LIBRARY_HEADER_USING_CP_FAILED",
+    "NH_MAKE_ERROR_COPY_FAILED",
+    "NH_MAKE_ERROR_CANT_CREATE_NETZHAUT_OBJECT_FILES",
+    "NH_MAKE_ERROR_CANT_CREATE_IO_OBJECT_FILES",
+    "NH_MAKE_ERROR_CANT_CREATE_GRAPHICS_OBJECT_FILES",
+    "NH_MAKE_ERROR_CANT_CREATE_CSS_OBJECT_FILES",
+    "NH_MAKE_ERROR_CANT_CREATE_HTML_OBJECT_FILES",
+    "NH_MAKE_ERROR_CANT_CREATE_JAVASCRIPT_OBJECT_FILES",
+    "NH_MAKE_ERROR_CANT_CREATE_TTY_OBJECT_FILES",
+    "NH_MAKE_ERROR_CANT_CREATE_NETWORK_OBJECT_FILES",
+    "NH_MAKE_ERROR_CANT_CREATE_API_OBJECT_FILES",
+    "NH_MAKE_ERROR_THREAD_CREATION_FAILED",
+    "NH_MAKE_ERROR_INSTALL_ALL_LIBRARY_FAILED",
+    "NH_MAKE_ERROR_INSTALL_ALL_EXTERNAL_LIBRARY_FAILED",
+    "NH_MAKE_ERROR_INSTALL_ALL_WEB_BROWSER_FAILED",
+    "NH_MAKE_ERROR_INSTALL_ALL_LOGO_FAILED",
+    "NH_MAKE_ERROR_BUILD_WEB_BROWSER_FAILED",
+};
+
+unsigned int NH_MAKE_RESULTS_PP_COUNT = sizeof(NH_MAKE_RESULTS_PP) / sizeof(NH_MAKE_RESULTS_PP[0]);
+
diff --git a/src/lib/nhmake/Common/Result.h b/src/lib/nhmake/Common/Result.h
new file mode 100644
index 0000000..d32d7d5
--- /dev/null
+++ b/src/lib/nhmake/Common/Result.h
@@ -0,0 +1,108 @@
+#ifndef NH_MAKE_RESULT_H
+#define NH_MAKE_RESULT_H
+
+#ifndef DOXYGEN_SHOULD_SKIP_THIS
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+#endif
+
+/** @addtogroup selfmakeAPIEnums
+ *  @{
+ */ 
+
+    /**
+     * Return values for functions.
+     */
+    typedef enum NH_MAKE_RESULT 
+    {
+        NH_MAKE_SUCCESS,
+        NH_MAKE_ERROR_INVALID_OPTION,
+        NH_MAKE_ERROR_NULL_POINTER,
+        NH_MAKE_ERROR_BAD_STATE,
+        NH_MAKE_ERROR_GENERATE_DOCUMENTS_FAILURE,
+        NH_MAKE_ERROR_DOWNLOAD_FAILED,
+        NH_MAKE_ERROR_BUILD_EXTERNAL_FAILED,
+        NH_MAKE_ERROR_COPY_EXTERNAL_HEADER_FAILED,
+        NH_MAKE_ERROR_COPY_PUBLIC_LIBRARY_HEADER_FAILED,
+        NH_MAKE_ERROR_CREATE_LIBRARY_INCLUDES_FAILED,
+        NH_MAKE_ERROR_BUILD_LIBRARY_FAILED,
+        NH_MAKE_ERROR_WGET_EXECUTION_FAILED,
+        NH_MAKE_ERROR_UNZIP_EXECUTION_FAILED,
+        NH_MAKE_ERROR_DOXYGEN_EXECUTION_FAILED,
+        NH_MAKE_ERROR_GCC_EXECUTION_FAILED,
+        NH_MAKE_ERROR_AR_EXECUTION_FAILED,
+        NH_MAKE_ERROR_XXD_EXECUTION_FAILED,
+        NH_MAKE_ERROR_CP_EXECUTION_FAILED,
+        NH_MAKE_ERROR_LIBRARY_NOT_FOUND,
+        NH_MAKE_ERROR_WGET_NOT_FOUND,
+        NH_MAKE_ERROR_UNZIP_NOT_FOUND,
+        NH_MAKE_ERROR_DOXYGEN_NOT_FOUND,
+        NH_MAKE_ERROR_GCC_NOT_FOUND,
+        NH_MAKE_ERROR_AR_NOT_FOUND,
+        NH_MAKE_ERROR_CP_NOT_FOUND,
+        NH_MAKE_ERROR_GENERATE_VERSION_DEPENDENT_DOCS,
+        NH_MAKE_ERROR_GENERATE_DOCS_USING_DOXYGEN,
+        NH_MAKE_ERROR_GET_PROJECT_DIRECTORY,
+        NH_MAKE_ERROR_GET_WORK_DIRECTORY,
+        NH_MAKE_ERROR_CANT_OPEN_README,
+        NH_MAKE_ERROR_CANT_OPEN_HEADER,
+        NH_MAKE_ERROR_CANT_OPEN_DIR,
+        NH_MAKE_ERROR_CANT_DOWNLOAD_VULKAN_HEADERS,
+        NH_MAKE_ERROR_CANT_DOWNLOAD_VOLK,
+        NH_MAKE_ERROR_CANT_DOWNLOAD_FREETYPE,
+        NH_MAKE_ERROR_CANT_DOWNLOAD_OPENSSL,
+        NH_MAKE_ERROR_CANT_DOWNLOAD_PROJECT,
+        NH_MAKE_ERROR_BUILD_XXD_FAILED,
+        NH_MAKE_ERROR_BUILD_HELPER_LIBRARY_FAILED,
+        NH_MAKE_ERROR_NOT_IMPLEMENTED,
+        NH_MAKE_ERROR_CANT_CREATE_DIRECTORY,
+        NH_MAKE_ERROR_CANT_CREATE_OBJECT_FILE,
+        NH_MAKE_ERROR_CANT_CREATE_OBJECTS,
+        NH_MAKE_ERROR_CANT_CREATE_LIBRARY,
+        NH_MAKE_ERROR_CANT_CREATE_EXTERNAL_BIN_DIRECTORY,
+        NH_MAKE_ERROR_CANT_CREATE_EXTERNAL_BIN_OBJECT_DIRECTORY,
+        NH_MAKE_ERROR_CANT_CREATE_BIN_OBJECT_DIRECTORY,
+        NH_MAKE_ERROR_CANT_CREATE_BIN_DIRECTORY,
+        NH_MAKE_ERROR_CANT_CREATE_SHARED_LIB,
+        NH_MAKE_ERROR_CANT_CREATE_STATIC_LIB,
+        NH_MAKE_ERROR_CANT_CREATE_INCLUDE_FILE,
+        NH_MAKE_ERROR_CANT_CREATE_INCLUDE_DIRECTORY,
+        NH_MAKE_ERROR_CANT_CREATE_EXTERNAL_DIRECTORY,
+        NH_MAKE_ERROR_COPY_EXTERNAL_HEADER_USING_CP_FAILED,
+        NH_MAKE_ERROR_COPY_PUBLIC_LIBRARY_HEADER_USING_CP_FAILED,
+        NH_MAKE_ERROR_COPY_FAILED,
+        NH_MAKE_ERROR_CANT_CREATE_NETZHAUT_OBJECT_FILES,
+        NH_MAKE_ERROR_CANT_CREATE_IO_OBJECT_FILES,
+        NH_MAKE_ERROR_CANT_CREATE_GRAPHICS_OBJECT_FILES,
+        NH_MAKE_ERROR_CANT_CREATE_CSS_OBJECT_FILES,
+        NH_MAKE_ERROR_CANT_CREATE_HTML_OBJECT_FILES,
+        NH_MAKE_ERROR_CANT_CREATE_JAVASCRIPT_OBJECT_FILES,
+        NH_MAKE_ERROR_CANT_CREATE_TTY_OBJECT_FILES,
+        NH_MAKE_ERROR_CANT_CREATE_NETWORK_OBJECT_FILES,
+        NH_MAKE_ERROR_CANT_CREATE_API_OBJECT_FILES,
+        NH_MAKE_ERROR_THREAD_CREATION_FAILED,
+        NH_MAKE_ERROR_INSTALL_ALL_LIBRARY_FAILED,
+        NH_MAKE_ERROR_INSTALL_ALL_EXTERNAL_LIBRARY_FAILED,
+        NH_MAKE_ERROR_INSTALL_ALL_WEB_BROWSER_FAILED,
+        NH_MAKE_ERROR_INSTALL_ALL_LOGO_FAILED,
+        NH_MAKE_ERROR_BUILD_WEB_BROWSER_FAILED,
+
+    } NH_MAKE_RESULT;
+
+/** @} */
+
+/** @addtogroup selfmakeAPIVars 
+ *  @{
+ */ 
+
+    extern const char *NH_MAKE_RESULTS_PP[];
+    extern unsigned int NH_MAKE_RESULTS_PP_COUNT;
+
+/** @} */
+
+#endif
diff --git a/src/lib/nhmake/Common/Types/Private.h b/src/lib/nhmake/Common/Types/Private.h
new file mode 100644
index 0000000..ea0b5c1
--- /dev/null
+++ b/src/lib/nhmake/Common/Types/Private.h
@@ -0,0 +1,16 @@
+#ifndef NH_MAKE_PRIVATE_H
+#define NH_MAKE_PRIVATE_H
+
+#ifndef DOXYGEN_SHOULD_SKIP_THIS
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2020 The netzhaut Authors
+ * Published under MIT
+ */
+
+#include "Public.h"
+
+#endif
+
+#endif
diff --git a/src/lib/nhmake/Common/Types/Public.h b/src/lib/nhmake/Common/Types/Public.h
new file mode 100644
index 0000000..84653b8
--- /dev/null
+++ b/src/lib/nhmake/Common/Types/Public.h
@@ -0,0 +1,177 @@
+#ifndef NH_MAKE_PUBLIC_H
+#define NH_MAKE_PUBLIC_H
+
+#ifndef DOXYGEN_SHOULD_SKIP_THIS
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2020 The netzhaut Authors
+ * Published under MIT
+ */
+
+#include "../Result.h"
+
+#include "../../../nhcore/Common/Types/Public.h"
+
+#endif
+
+/** @addtogroup lib_nhmake_typedefs
+ *  @{
+ */
+
+    typedef struct nh_make_Runtime nh_make_Runtime;
+    typedef struct nh_make_ChangesNode nh_make_ChangesNode;
+
+/** @} */
+
+/** @addtogroup lib_nhmake_enums
+ *  @{
+ */ 
+
+    /**
+     * Boolean values.
+     */
+    typedef enum NH_MAKE_BOOL {
+        NH_MAKE_FALSE = 0, /**<Indicates false.*/
+        NH_MAKE_TRUE = 1,  /**<Indicates true.*/
+    } NH_MAKE_BOOL;
+
+    typedef enum NH_MAKE_TOKEN {
+        NH_MAKE_TOKEN_UNDEFINED,
+        NH_MAKE_TOKEN_COMMA,
+        NH_MAKE_TOKEN_IDENTIFIER,
+        NH_MAKE_TOKEN_STRING,
+        NH_MAKE_TOKEN_CURLY_BRACKET_RIGHT,
+        NH_MAKE_TOKEN_CURLY_BRACKET_LEFT,
+        NH_MAKE_TOKEN_ROUND_BRACKET_RIGHT,
+        NH_MAKE_TOKEN_ROUND_BRACKET_LEFT,
+        NH_MAKE_TOKEN_ANGLE_BRACKET_RIGHT,
+        NH_MAKE_TOKEN_ANGLE_BRACKET_LEFT,
+        NH_MAKE_TOKEN_HYPHEN_MINUS,
+        NH_MAKE_TOKEN_COLON,
+        NH_MAKE_TOKEN_EOF,
+    } NH_MAKE_TOKEN;
+
+    typedef enum NH_MAKE_DEFINITION {
+        NH_MAKE_DEFINITION_UNDEFINED,
+        NH_MAKE_DEFINITION_OPTION,
+        NH_MAKE_DEFINITION_FUNCTION,
+        NH_MAKE_DEFINITION_BLOCK,
+        NH_MAKE_DEFINITION_IF,
+    } NH_MAKE_DEFINITION;
+
+    typedef enum NH_MAKE_SOURCE_CONTEXT {
+        NH_MAKE_SOURCE_CONTEXT_UNDEFINED,
+        NH_MAKE_SOURCE_CONTEXT_SHARED_LIBRARY,
+        NH_MAKE_SOURCE_CONTEXT_STATIC_LIBRARY,
+        NH_MAKE_SOURCE_CONTEXT_BINARY,
+    } NH_MAKE_SOURCE_CONTEXT;
+
+    typedef enum NH_MAKE_CHANGES_NODE {
+        NH_MAKE_CHANGES_NODE_UNDEFINED,
+        NH_MAKE_CHANGES_NODE_ROOT,
+        NH_MAKE_CHANGES_NODE_WORKLOAD,
+        NH_MAKE_CHANGES_NODE_SUMMARY,
+        NH_MAKE_CHANGES_NODE_AUTHOR,
+        NH_MAKE_CHANGES_NODE_DATE,
+        NH_MAKE_CHANGES_NODE_ID,
+        NH_MAKE_CHANGES_NODE_WORKLOAD_BIN,
+        NH_MAKE_CHANGES_NODE_WORKLOAD_LIB,
+        NH_MAKE_CHANGES_NODE_WORKLOAD_SCOPE,
+        NH_MAKE_CHANGES_NODE_AUTHOR_NAME,
+        NH_MAKE_CHANGES_NODE_AUTHOR_CONTACT,
+        NH_MAKE_CHANGES_NODE_AUTHOR_MESSAGE,
+    } NH_MAKE_CHANGES_NODE;
+
+    typedef enum NH_MAKE_PRINT_CHANGES {
+        NH_MAKE_PRINT_CHANGES_DEFAULT,
+        NH_MAKE_PRINT_CHANGES_GIT,
+    } NH_MAKE_PRINT_CHANGES;
+
+/** @} */
+
+/** @addtogroup lib_nhmake_structs
+ *  @{
+ */
+
+    typedef struct nh_make_Function {
+        NH_MAKE_DEFINITION type;
+        NH_BYTE *name_p;
+        unsigned int arguments;
+        NH_BYTE **arguments_pp;
+        NH_MAKE_TOKEN *argumentTypes_p;
+    } nh_make_Function;
+
+    typedef struct nh_make_Version {
+        long api, major, minor, patch;
+        long apiDate_p[3], majorDate_p[3], minorDate_p[3], patchDate_p[3];
+    } nh_make_Version;
+
+    typedef struct nh_make_SourceContext {
+        NH_MAKE_SOURCE_CONTEXT type;
+        NH_BYTE *path_p;
+        NH_BYTE *name_p;
+        NH_BYTE *compileArgs_p;
+        NH_BYTE *linkArgs_p;
+        NH_BYTE *outputPath_p;
+        nh_make_Version Version;
+    } nh_make_SourceContext;
+
+    typedef struct nh_make_SourceContextArray {
+        int length;
+        int maxNameLength;
+        nh_make_SourceContext *SourceContexts_p;
+    } nh_make_SourceContextArray;
+
+    typedef struct nh_make_ValueArray {
+        NH_BYTE **values_pp;
+        int length;
+    } nh_make_ValueArray;
+
+    typedef struct nh_make_TestArgument {
+        NH_BYTE *p;
+    } nh_make_TestArgument;
+
+    typedef struct nh_make_Author {
+        NH_BYTE *name_p;
+        NH_BYTE *contact_p;
+        NH_BYTE **messages_pp;
+        int messages; 
+    } nh_make_Author;
+
+    typedef struct nh_make_Workload {
+        NH_BYTE **libs_pp;
+        int libs;
+        NH_BYTE **bins_pp;
+        int bins;
+        NH_BYTE *scope_p;
+        nh_make_Author *Authors_p;
+        int authors;
+    } nh_make_Workload;
+
+    typedef struct nh_make_Changes {
+        NH_BYTE *date_p;
+        NH_BYTE *id_p;
+        NH_BYTE *summary_p;
+        int workloads;
+        nh_make_Workload *Workloads_p;
+    } nh_make_Changes;
+
+/** @} */
+
+/** @addtogroup lib_nhmake_typedefs
+ *  @{
+ */
+
+    typedef NH_MAKE_RESULT (*nh_make_functionCallback_f)(
+        nh_make_Runtime *Runtime_p, nh_make_Function *Function_p
+    );
+
+    typedef NH_MAKE_RESULT (*nh_make_sourceContextCallback_f)(
+        nh_make_Runtime *Runtime_p, nh_make_SourceContext *Context_p
+    );
+
+/** @} */
+
+#endif
+
diff --git a/src/lib/nhmake/Core/Binaries.c b/src/lib/nhmake/Core/Binaries.c
new file mode 100644
index 0000000..b543fea
--- /dev/null
+++ b/src/lib/nhmake/Core/Binaries.c
@@ -0,0 +1,151 @@
+// LICENSE NOTICE ==================================================================================
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+// INCLUDE =========================================================================================
+
+#include "Binaries.h"
+#include "Util.h"
+#include "Main.h"
+
+#include "../Common/Macro.h"
+
+#include NH_MAKE_FLOW
+#include NH_MAKE_CUSTOM_CHECK
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+// BUILD BINARY ====================================================================================
+
+NH_MAKE_RESULT nh_make_buildnhterminal()
+{
+NH_MAKE_BEGIN()
+
+    char projDir_p[2048] = {'\0'};
+    NH_MAKE_CHECK(NH_MAKE_ERROR_GET_PROJECT_DIRECTORY, nh_make_getProjectDir(projDir_p, 2048))
+
+    // set -no-pie because of https://stackoverflow.com/questions/41398444/gcc-creates-mime-type-application-x-sharedlib-instead-of-application-x-applicati
+    static char command_p[2048] = {'\0'};
+    sprintf(command_p, "gcc -std=gnu99 -Wl,-rpath=%s/lib:/usr/local/lib -o%s/bin/nhterminal -no-pie -L%s/lib -lnetzhaut %s/src/bin/nhterminal/Terminal.c", projDir_p, projDir_p, projDir_p, projDir_p);
+
+    int status = system(command_p);
+    if (WEXITSTATUS(status) || WIFSIGNALED(status)) {NH_MAKE_DIAGNOSTIC_END(NH_MAKE_ERROR_GCC_EXECUTION_FAILED)}
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
+NH_MAKE_RESULT nh_make_buildnhwebbrowser()
+{
+NH_MAKE_BEGIN()
+
+    char projDir_p[2048] = {'\0'};
+    NH_MAKE_CHECK(NH_MAKE_ERROR_GET_PROJECT_DIRECTORY, nh_make_getProjectDir(projDir_p, 2048))
+
+    // set -no-pie because of https://stackoverflow.com/questions/41398444/gcc-creates-mime-type-application-x-sharedlib-instead-of-application-x-applicati
+    static char command_p[2048] = {'\0'};
+    sprintf(command_p, "gcc -std=gnu99 -Wl,-rpath=%s/lib:/usr/local/lib -o%s/bin/nhwebbrowser -no-pie -L%s/lib -lnetzhaut %s/src/bin/nhwebbrowser/WebBrowser.c", projDir_p, projDir_p, projDir_p, projDir_p);
+
+    int status = system(command_p);
+    if (WEXITSTATUS(status) || WIFSIGNALED(status)) {NH_MAKE_DIAGNOSTIC_END(NH_MAKE_ERROR_GCC_EXECUTION_FAILED)}
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
+// INSTALL BINARY ==================================================================================
+
+NH_MAKE_RESULT nh_make_installnhterminal()
+{
+NH_MAKE_BEGIN()
+
+    char wrkDir_p[2048] = {'\0'};
+    NH_MAKE_CHECK_NULL(NH_MAKE_ERROR_GET_WORK_DIRECTORY, getcwd(wrkDir_p, 2048))
+
+    char projDir_p[2048] = {'\0'};
+    NH_MAKE_CHECK(NH_MAKE_ERROR_GET_PROJECT_DIRECTORY, nh_make_getProjectDir(projDir_p, 2048))
+
+    chdir(projDir_p);
+
+    const char *homedir_p = nh_make_getHomeDir();
+    char dest_p[512] = {'\0'};
+
+    sprintf(dest_p, "%s/.local/share/applications/", homedir_p);
+    NH_MAKE_CHECK(NH_MAKE_ERROR_COPY_FAILED, nh_make_copy("src/bin/nhterminal/Common/Data/nhterminal.desktop", dest_p, NH_MAKE_FALSE, NH_MAKE_FALSE))
+    NH_MAKE_CHECK(NH_MAKE_ERROR_COPY_FAILED, nh_make_copy("bin/nhterminal", "/usr/local/bin", NH_MAKE_FALSE, NH_MAKE_TRUE))
+
+    chdir(wrkDir_p);
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
+NH_MAKE_RESULT nh_make_installnhwebbrowser()
+{
+NH_MAKE_BEGIN()
+
+    char wrkDir_p[2048] = {'\0'};
+    NH_MAKE_CHECK_NULL(NH_MAKE_ERROR_GET_WORK_DIRECTORY, getcwd(wrkDir_p, 2048))
+
+    char projDir_p[2048] = {'\0'};
+    NH_MAKE_CHECK(NH_MAKE_ERROR_GET_PROJECT_DIRECTORY, nh_make_getProjectDir(projDir_p, 2048))
+
+    chdir(projDir_p);
+
+    const char *homedir_p = nh_make_getHomeDir();
+    char dest_p[512] = {'\0'};
+
+    sprintf(dest_p, "%s/.local/share/applications/", homedir_p);
+    NH_MAKE_CHECK(NH_MAKE_ERROR_COPY_FAILED, nh_make_copy("src/bin/nhwebbrowser/Common/Data/nhwebbrowser.desktop", dest_p, NH_MAKE_FALSE, NH_MAKE_FALSE))
+    NH_MAKE_CHECK(NH_MAKE_ERROR_COPY_FAILED, nh_make_copy("bin/nhwebbrowser", "/usr/local/bin", NH_MAKE_FALSE, NH_MAKE_TRUE))
+
+    chdir(wrkDir_p);
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
+// INSTALL LOGO ====================================================================================
+
+NH_MAKE_RESULT nh_make_installLogo()
+{
+NH_MAKE_BEGIN()
+
+    char wrkDir_p[2048] = {'\0'};
+    NH_MAKE_CHECK_NULL(NH_MAKE_ERROR_GET_WORK_DIRECTORY, getcwd(wrkDir_p, 2048))
+
+    char projDir_p[2048] = {'\0'};
+    NH_MAKE_CHECK(NH_MAKE_ERROR_GET_PROJECT_DIRECTORY, nh_make_getProjectDir(projDir_p, 2048))
+
+    chdir(projDir_p);
+
+    const char *homedir_p = nh_make_getHomeDir();
+    char dest_p[512] = {'\0'};
+
+    sprintf(dest_p, "%s/.local/share/icons/hicolor/32x32/apps", homedir_p);
+    NH_MAKE_CHECK(NH_MAKE_ERROR_COPY_FAILED, nh_make_copy("docs/Logo/32x32/netzhaut.png", dest_p, NH_MAKE_FALSE, NH_MAKE_TRUE))
+
+    memset(dest_p, '\0', sizeof(char) * 512);
+    sprintf(dest_p, "%s/.local/share/icons/hicolor/64x64/apps", homedir_p);
+    NH_MAKE_CHECK(NH_MAKE_ERROR_COPY_FAILED, nh_make_copy("docs/Logo/64x64/netzhaut.png", dest_p, NH_MAKE_FALSE, NH_MAKE_TRUE))
+
+    memset(dest_p, '\0', sizeof(char) * 512);
+    sprintf(dest_p, "%s/.local/share/icons/hicolor/128x128/apps", homedir_p);
+    NH_MAKE_CHECK(NH_MAKE_ERROR_COPY_FAILED, nh_make_copy("docs/Logo/128x128/netzhaut.png", dest_p, NH_MAKE_FALSE, NH_MAKE_TRUE))
+
+    memset(dest_p, '\0', sizeof(char) * 512);
+    sprintf(dest_p, "%s/.local/share/icons/hicolor/256x256/apps", homedir_p);
+    NH_MAKE_CHECK(NH_MAKE_ERROR_COPY_FAILED, nh_make_copy("docs/Logo/256x256/netzhaut.png", dest_p, NH_MAKE_FALSE, NH_MAKE_TRUE))
+
+    memset(dest_p, '\0', sizeof(char) * 512);
+    sprintf(dest_p, "%s/.local/share/icons/hicolor/512x512/apps", homedir_p);
+    NH_MAKE_CHECK(NH_MAKE_ERROR_COPY_FAILED, nh_make_copy("docs/Logo/512x512/netzhaut.png", dest_p, NH_MAKE_FALSE, NH_MAKE_TRUE))
+
+    chdir(wrkDir_p);
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
diff --git a/src/lib/nhmake/Core/Build.c b/src/lib/nhmake/Core/Build.c
new file mode 100644
index 0000000..f8d34b7
--- /dev/null
+++ b/src/lib/nhmake/Core/Build.c
@@ -0,0 +1,350 @@
+// LICENSE NOTICE ==================================================================================
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+// INCLUDE =========================================================================================
+
+#include "Build.h"
+#include "Utils.h"
+
+#include "../UI/Message.h"
+#include "../Common/Macros/Macros.h"
+
+#include NH_MAKE_FLOW
+#include NH_MAKE_DEFAULT_CHECK
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <pthread.h>
+#include <dirent.h>
+#include <errno.h>
+
+// CREATE BINARY ===================================================================================
+
+static NH_MAKE_RESULT nh_make_createBinary(
+    nh_make_Runtime *Runtime_p, nh_make_SourceContext *SourceContext_p)
+{
+NH_MAKE_BEGIN()
+
+    chdir(SourceContext_p->path_p);
+
+    NH_BYTE binPath_p[256] = {'\0'};
+    sprintf(binPath_p, "%s/%s", nh_make_getVariable(&Runtime_p->VariableArray, "BIN_DEST")->values_pp[0], SourceContext_p->name_p);
+    if (SourceContext_p->outputPath_p) {
+        sprintf(binPath_p, "%s/%s", SourceContext_p->outputPath_p, SourceContext_p->name_p);
+    }
+
+    int length = 0;
+    for (int i = 0; i < Runtime_p->SourceArray.length; ++i) {
+        nh_make_Source *Source_p = &Runtime_p->SourceArray.Sources_p[i];
+        if (Source_p->Context_p == SourceContext_p) {
+            length += strlen(Source_p->path_p) + 1;
+        }
+    }
+   
+    NH_BYTE *sources_p = malloc(length + 1);
+    NH_MAKE_CHECK_NULL(sources_p)
+    memset(sources_p, 0, length + 1);
+
+    int offset = 0;
+    for (int i = 0; i < Runtime_p->SourceArray.length; ++i) {
+        nh_make_Source *Source_p = &Runtime_p->SourceArray.Sources_p[i];
+        if (Source_p->Context_p == SourceContext_p) {
+            sprintf(sources_p + strlen(sources_p), "%s ", Source_p->path_p);
+        }
+    }
+
+    int compileArgsLength = SourceContext_p->compileArgs_p ? strlen(SourceContext_p->compileArgs_p) : 0;
+    int linkArgsLength = SourceContext_p->linkArgs_p ? strlen(SourceContext_p->linkArgs_p) : 0;
+    int commandLength = strlen(sources_p) + compileArgsLength + linkArgsLength + strlen(binPath_p) + 128;
+    NH_BYTE *command_p = malloc(commandLength);
+    NH_MAKE_CHECK_NULL(command_p)
+    memset(command_p, 0, commandLength);
+
+    NH_BYTE empty = 0;
+    NH_BYTE *linkArgs_p = SourceContext_p->linkArgs_p ? SourceContext_p->linkArgs_p : &empty;
+    NH_BYTE *compileArgs_p = SourceContext_p->compileArgs_p ? SourceContext_p->compileArgs_p : &empty;
+
+    // set -no-pie because of https://stackoverflow.com/questions/41398444/gcc-creates-mime-type-application-x-sharedlib-instead-of-application-x-applicati
+    sprintf(command_p, "gcc %s -o%s -no-pie %s %s", compileArgs_p, binPath_p, linkArgs_p, sources_p);
+    nh_make_messagef(command_p);
+
+    int status = system(command_p);
+    if (WEXITSTATUS(status) || WIFSIGNALED(status)) {NH_MAKE_DIAGNOSTIC_END(NH_MAKE_ERROR_GCC_EXECUTION_FAILED)}
+
+    chdir(nh_make_getVariable(&Runtime_p->VariableArray, "WRK_DIR")->values_pp[0]);
+
+    free(command_p);
+    free(sources_p);
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
+// CREATE LIBRARY ==================================================================================
+
+static NH_MAKE_RESULT nh_make_createSharedLibraryUsingGCC(
+    const NH_BYTE *objects_p, const NH_BYTE *out_p, NH_BYTE *compile_p, const NH_BYTE *link_p)
+{
+NH_MAKE_BEGIN()
+
+    static NH_BYTE command_p[16384] = {'\0'};
+
+    sprintf(command_p, "gcc -shared %s %s %s -o %s", objects_p, compile_p, link_p, out_p);
+    nh_make_messagef(command_p);
+
+    int status = system(command_p);
+    if (WEXITSTATUS(status) || WIFSIGNALED(status)) {NH_MAKE_DIAGNOSTIC_END(NH_MAKE_ERROR_GCC_EXECUTION_FAILED)}
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
+static NH_MAKE_RESULT nh_make_createLibrary(
+    nh_make_Runtime *Runtime_p, nh_make_SourceContext *Context_p)
+{
+NH_MAKE_BEGIN()
+
+    NH_BYTE empty = 0;
+    NH_BYTE *libName_p = Context_p->name_p;
+    NH_BYTE *linkArgs_p = Context_p->linkArgs_p ? Context_p->linkArgs_p : &empty;
+    NH_BYTE *compileArgs_p = Context_p->compileArgs_p ? Context_p->compileArgs_p : &empty;
+
+    int api   = Context_p->Version.api; 
+    int major = Context_p->Version.major; 
+    int minor = Context_p->Version.minor; 
+    int patch = Context_p->Version.patch;
+
+    NH_BYTE tmp_p[255] = {0};
+    sprintf(tmp_p, "/tmp/%s", nh_make_getVariable(&Runtime_p->VariableArray, "NAME")->values_pp[0]);
+    chdir(tmp_p);
+
+#if defined(__linux__) || defined(__APPLE__)
+
+    int index = 0;
+    NH_BYTE objects_p[16384] = {'\0'};
+
+    DIR *dir;
+    struct dirent *ent;
+    
+    if ((dir = opendir(tmp_p)) != NULL) 
+    {
+        while ((ent = readdir(dir)) != NULL) {
+            for (int i = 0; ent->d_name[i] != '\0' && ent->d_name[0] != '.'; ++i) {
+                objects_p[index++] = ent->d_name[i];
+            }
+            objects_p[index++] = ' ';
+        }
+        closedir(dir);
+    } 
+    else {NH_MAKE_DIAGNOSTIC_END(NH_MAKE_ERROR_CANT_OPEN_DIR)}
+
+    NH_BYTE *dest_p = nh_make_getVariable(&Runtime_p->VariableArray, "LIB_DEST")->values_pp[0];
+    if (Context_p->outputPath_p) {dest_p = Context_p->outputPath_p;}
+
+    NH_BYTE libPath_p[256] = {'\0'};
+    sprintf(libPath_p, "%s/lib%s.so.%d.%d.%d.%d", dest_p, libName_p, api, major, minor, patch);
+    NH_BYTE symPath1_p[256] = {'\0'};
+    sprintf(symPath1_p, "%s/lib%s.so.%d", dest_p, libName_p, api);
+    NH_BYTE symPath2_p[256] = {'\0'};
+    sprintf(symPath2_p, "%s/lib%s.so", dest_p, libName_p);
+  
+    NH_MAKE_CHECK(nh_make_createSharedLibraryUsingGCC(objects_p, libPath_p, compileArgs_p, linkArgs_p))
+
+    memset(libPath_p, 0, 256); 
+    sprintf(libPath_p, "lib%s.so.%d.%d.%d.%d", libName_p, api, major, minor, patch);
+    nh_make_createSymLink(libPath_p, symPath1_p, NH_MAKE_FALSE);
+    nh_make_createSymLink(libPath_p, symPath2_p, NH_MAKE_FALSE);
+
+#endif 
+
+    chdir(nh_make_getVariable(&Runtime_p->VariableArray, "WRK_DIR")->values_pp[0]);
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
+// COMPILE =========================================================================================
+
+static void nh_make_getObjectFileName(
+    nh_make_Source *Source_p, NH_BYTE *name_p)
+{
+NH_MAKE_BEGIN()
+
+    NH_BYTE path_p[255] = {0};
+    strcpy(path_p, Source_p->path_p);
+
+    int index = strlen(path_p) - 1;
+    while (path_p[index] != '/' && index) {index--;}
+
+    NH_BYTE fileName_p[255] = {0};
+    strcpy(fileName_p, index ? path_p + index + 1 : path_p);
+
+    int tmp = index ? index - 1 : 0;
+    while (path_p[tmp] != '/' && tmp) {tmp--;}
+
+    if (index) {
+        path_p[index] = '\0';
+        sprintf(name_p, "%s%s.o", path_p + tmp, fileName_p);
+    }
+    else {
+        sprintf(name_p, "%s.o", fileName_p);
+    }
+
+NH_MAKE_SILENT_END()
+}
+
+static NH_MAKE_RESULT nh_make_createPICObjectFileUsingGCC(
+    const NH_BYTE *in_p, const NH_BYTE *out_p, NH_BYTE *compileArgs_p)
+{
+NH_MAKE_BEGIN()
+
+    NH_BYTE realout_p[1024] = {'\0'};
+    realpath(out_p, realout_p);
+
+    NH_BYTE command_p[1024] = {'\0'};
+
+    if (compileArgs_p != NULL) {sprintf(command_p, "gcc -fPIC %s -c %s -o %s", compileArgs_p, in_p, out_p);}
+    else {sprintf(command_p, "gcc -fPIC -c %s -o %s", in_p, out_p);}
+
+    nh_make_messagef(command_p);
+
+    int status = system(command_p);
+    if (WEXITSTATUS(status) || WIFSIGNALED(status)) {NH_MAKE_DIAGNOSTIC_END(NH_MAKE_ERROR_GCC_EXECUTION_FAILED)}
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
+static NH_MAKE_RESULT nh_make_compileFiles(
+    nh_make_Runtime *Runtime_p, nh_make_SourceContext *Context_p)
+{
+NH_MAKE_BEGIN()
+
+    chdir(Context_p->path_p);
+
+    for (int i = 0; i < Runtime_p->SourceArray.length; ++i) 
+    {
+        nh_make_Source *Source_p = &Runtime_p->SourceArray.Sources_p[i];
+
+        if (Source_p->Context_p == Context_p) 
+        {
+            NH_BYTE tmp_p[255] = {0};
+            NH_BYTE fileName_p[255] = {0};
+            nh_make_getObjectFileName(Source_p, fileName_p);
+
+            sprintf(tmp_p, "/tmp/%s/%s", nh_make_getVariable(&Runtime_p->VariableArray, "NAME")->values_pp[0], fileName_p);
+            NH_BYTE empty = 0;
+
+            if (Context_p->type == NH_MAKE_SOURCE_CONTEXT_SHARED_LIBRARY) {
+                NH_MAKE_CHECK(nh_make_createPICObjectFileUsingGCC(
+                        Source_p->path_p, tmp_p, Context_p->compileArgs_p ? Context_p->compileArgs_p : &empty
+                ))
+            }
+        }
+    }
+
+    chdir(nh_make_getVariable(&Runtime_p->VariableArray, "WRK_DIR")->values_pp[0]);
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
+// INSTALL =========================================================================================
+
+//static NH_MAKE_RESULT nh_make_installLibrary(
+//    NH_BYTE *libName_p, int major, int minor, int patch)
+//{
+//NH_MAKE_BEGIN()
+//
+//    NH_BYTE wrkDir_p[2048] = {'\0'};
+//    NH_MAKE_CHECK_NULL(NH_MAKE_ERROR_GET_WORK_DIRECTORY, getcwd(wrkDir_p, 2048))
+//
+//    NH_BYTE projDir_p[2048] = {'\0'};
+//    NH_MAKE_CHECK(NH_MAKE_ERROR_GET_PROJECT_DIRECTORY, nh_make_getProjectDir(projDir_p, 2048))
+//
+//    chdir(projDir_p);
+//
+//    NH_BYTE libPath_p[512] = {'\0'};
+//    sprintf(libPath_p, "lib/lib%s.so.%d.%d.%d", libName_p, major, minor, patch);
+//
+//    NH_MAKE_CHECK(NH_MAKE_ERROR_COPY_FAILED, nh_make_copy(libPath_p, "/usr/local/lib", NH_MAKE_FALSE, NH_MAKE_TRUE))
+//
+//    chdir("/usr/local/lib");
+//
+//    NH_BYTE cpyPath_p[256] = {'\0'};
+//    sprintf(cpyPath_p, "lib%s.so.%d.%d.%d", libName_p, major, minor, patch);
+//    NH_BYTE symPath1_p[256] = {'\0'};
+//    sprintf(symPath1_p, "lib%s.so.%d", libName_p, major);
+//    NH_BYTE symPath2_p[256] = {'\0'};
+//    sprintf(symPath2_p, "lib%s.so", libName_p);
+//
+//    nh_make_createSymLink(cpyPath_p, symPath1_p, NH_MAKE_TRUE);
+//    nh_make_createSymLink(cpyPath_p, symPath2_p, NH_MAKE_TRUE);
+//
+//    chdir(wrkDir_p);
+//
+//NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+//}
+
+// BUILD ===========================================================================================
+
+static NH_MAKE_RESULT nh_make_buildSourceContext(
+    nh_make_Runtime *Runtime_p, nh_make_SourceContext *Context_p) 
+{
+NH_MAKE_BEGIN()
+
+    NH_BYTE empty = 0;
+    NH_BYTE tmp_p[255];
+    sprintf(tmp_p, "/tmp/%s", nh_make_getVariable(&Runtime_p->VariableArray, "NAME")->values_pp[0]);
+
+    // make sure that we start with a fresh/empty directory
+    nh_make_removeDir(tmp_p);
+    NH_MAKE_CHECK(nh_make_createDir(tmp_p))
+
+    if (Runtime_p->beforeBuildCallback_f) {
+        NH_MAKE_CHECK(Runtime_p->beforeBuildCallback_f(Runtime_p, Context_p))
+    }
+
+    if (Context_p->type == NH_MAKE_SOURCE_CONTEXT_BINARY) {
+        NH_MAKE_CHECK(nh_make_createBinary(Runtime_p, Context_p))
+    }
+    else {
+        NH_MAKE_CHECK(nh_make_compileFiles(Runtime_p, Context_p))
+        NH_MAKE_CHECK(nh_make_createLibrary(Runtime_p, Context_p))
+    }
+
+    if (Runtime_p->afterBuildCallback_f) {
+        NH_MAKE_CHECK(Runtime_p->afterBuildCallback_f(Runtime_p, Context_p))
+    }
+
+//    if (install) {
+//        NH_MAKE_CHECK(NH_MAKE_ERROR_BAD_STATE, nh_make_installLibrary(
+//            Library_p->name_p, 0, 0, 0 
+//        ))
+//    }
+
+    NH_MAKE_CHECK(nh_make_removeDir(tmp_p))
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
+NH_MAKE_RESULT nh_make_build(
+    nh_make_Runtime *Runtime_p, NH_BYTE *name_p)
+{
+NH_MAKE_BEGIN()
+
+    for (int i = 0; i < Runtime_p->SourceContextArray.length; ++i) {
+        nh_make_SourceContext *SourceContext_p = &Runtime_p->SourceContextArray.SourceContexts_p[i];
+        if (!strcmp(SourceContext_p->name_p, name_p)) {
+            nh_make_messagef("");
+            nh_make_messagef(SourceContext_p->type == NH_MAKE_SOURCE_CONTEXT_BINARY ? "-- BINARY --" : "-- LIBRARY --");
+            nh_make_messagef("");
+            NH_MAKE_CHECK(nh_make_buildSourceContext(Runtime_p, SourceContext_p))
+        }
+    }
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
diff --git a/src/lib/nhmake/Core/Build.h b/src/lib/nhmake/Core/Build.h
new file mode 100644
index 0000000..ae3203d
--- /dev/null
+++ b/src/lib/nhmake/Core/Build.h
@@ -0,0 +1,27 @@
+#ifndef NH_MAKE_BUILD_H
+#define NH_MAKE_BUILD_H
+
+#ifndef DOXYGEN_SHOULD_SKIP_THIS
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+#include "../Parser/Functions.h"
+#include "../Common/Types/Private.h"
+
+#endif
+
+/** @addtogroup lib_nhmake_functions
+ *  @{
+ */
+
+    NH_MAKE_RESULT nh_make_build(
+        nh_make_Runtime *Runtime_p, NH_BYTE *name_p
+    ); 
+
+/** @} */
+
+#endif
diff --git a/src/lib/nhmake/Core/Changes.c b/src/lib/nhmake/Core/Changes.c
new file mode 100644
index 0000000..89b0ef4
--- /dev/null
+++ b/src/lib/nhmake/Core/Changes.c
@@ -0,0 +1,746 @@
+// LICENSE NOTICE ==================================================================================
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+// INCLUDE =========================================================================================
+
+#include "Changes.h"
+#include "Configure.h"
+
+#include "../Parser/Tokenizer.h"
+#include "../Core/File.h"
+
+#include "../Common/Macros/Macros.h"
+#include NH_MAKE_FLOW
+#include NH_MAKE_DEFAULT_CHECK
+
+#include <stdio.h>
+#include <string.h>
+#include <stdlib.h>
+#include <ctype.h>
+#include <unistd.h>
+#include <time.h>
+
+
+// CREATE PARSE-TREE ===============================================================================
+
+typedef struct nh_make_ChangesParser {
+    nh_make_Token *Token_p;
+    nh_make_ChangesNode *Node_p;
+} nh_make_ChangesParser;
+
+static NH_MAKE_RESULT nh_make_initChangesNode(
+    nh_make_ChangesNode *Node_p, NH_MAKE_CHANGES_NODE type, nh_make_ChangesNode *Parent_p)
+{
+NH_MAKE_BEGIN()
+
+    Node_p->type = type;
+    Node_p->text_p = NULL;
+    Node_p->length = 0;
+    Node_p->Children_pp = NULL;
+    Node_p->children = 0;
+    Node_p->Parent_p = Parent_p;
+
+NH_MAKE_END(NH_MAKE_SUCCESS)
+}
+
+static nh_make_ChangesNode *nh_make_createChangesNode(
+    NH_MAKE_CHANGES_NODE type, nh_make_ChangesNode *Parent_p)
+{
+NH_MAKE_BEGIN()
+
+#include NH_MAKE_CUSTOM_CHECK
+
+    nh_make_ChangesNode *Node_p = malloc(sizeof(nh_make_ChangesNode));
+    NH_MAKE_CHECK_NULL(NULL, Node_p)
+
+    nh_make_initChangesNode(Node_p, type, Parent_p);
+
+    if (!Parent_p) {NH_MAKE_END(Node_p)}
+
+    if (!Parent_p->Children_pp) {
+        Parent_p->Children_pp = malloc(sizeof(nh_make_ChangesNode*));
+        NH_MAKE_CHECK_NULL(NULL, Parent_p->Children_pp)
+        Parent_p->Children_pp[0] = Node_p;
+        Parent_p->children = 1;
+    }
+    else {
+        Parent_p->Children_pp =
+            realloc(Parent_p->Children_pp, sizeof(nh_make_ChangesNode*) * (Parent_p->children + 1));
+        NH_MAKE_CHECK_NULL(NULL, Parent_p->Children_pp)
+        Parent_p->Children_pp[Parent_p->children] = Node_p;
+        Parent_p->children++;
+    }
+
+#include NH_MAKE_DEFAULT_CHECK
+
+NH_MAKE_END(Node_p)
+}
+
+static NH_MAKE_RESULT nh_make_parseChild(
+    nh_make_ChangesParser *Parser_p) 
+{
+NH_MAKE_BEGIN()
+
+    if (!Parser_p->Token_p->string_p) {
+         NH_MAKE_END(NH_MAKE_ERROR_BAD_STATE)       
+    }
+
+    NH_MAKE_CHANGES_NODE type = NH_MAKE_CHANGES_NODE_UNDEFINED;
+
+    if (!strcmp(Parser_p->Token_p->string_p, "summary")) {
+        type = NH_MAKE_CHANGES_NODE_SUMMARY;
+    }
+    else if (!strcmp(Parser_p->Token_p->string_p, "date")) {
+        type = NH_MAKE_CHANGES_NODE_DATE;
+    }
+    else if (!strcmp(Parser_p->Token_p->string_p, "id")) {
+        type = NH_MAKE_CHANGES_NODE_ID;
+    }
+    else if (!strcmp(Parser_p->Token_p->string_p, "bin")) {
+        type = NH_MAKE_CHANGES_NODE_WORKLOAD_BIN;
+    }
+    else if (!strcmp(Parser_p->Token_p->string_p, "lib")) {
+        type = NH_MAKE_CHANGES_NODE_WORKLOAD_LIB;
+    }
+    else if (!strcmp(Parser_p->Token_p->string_p, "scope")) {
+        type = NH_MAKE_CHANGES_NODE_WORKLOAD_SCOPE;
+    }
+    else if (!strcmp(Parser_p->Token_p->string_p, "contact")) {
+        type = NH_MAKE_CHANGES_NODE_AUTHOR_CONTACT;
+    }
+    else if (!strcmp(Parser_p->Token_p->string_p, "message")) {
+        type = NH_MAKE_CHANGES_NODE_AUTHOR_MESSAGE;
+    }
+    else if (!strcmp(Parser_p->Token_p->string_p, "name")) {
+        type = NH_MAKE_CHANGES_NODE_AUTHOR_NAME;
+    }
+
+    if (type == NH_MAKE_CHANGES_NODE_UNDEFINED) {
+        NH_MAKE_END(NH_MAKE_ERROR_BAD_STATE)
+    }
+
+    nh_make_ChangesNode *Node_p = nh_make_createChangesNode(type, Parser_p->Node_p);
+    NH_MAKE_CHECK_NULL(Node_p)
+
+    ++(Parser_p->Token_p);
+    ++(Parser_p->Token_p);
+
+    if (Parser_p->Token_p->type != NH_MAKE_TOKEN_STRING) {
+        NH_MAKE_END(NH_MAKE_ERROR_BAD_STATE)
+    }
+
+    Node_p->text_p = Parser_p->Token_p->string_p;
+
+    ++(Parser_p->Token_p);
+
+    while (Parser_p->Token_p->type == NH_MAKE_TOKEN_COMMA) {
+        Node_p = nh_make_createChangesNode(type, Parser_p->Node_p);
+        NH_MAKE_CHECK_NULL(Node_p)
+        ++(Parser_p->Token_p);
+        Node_p->text_p = Parser_p->Token_p->string_p;
+        ++(Parser_p->Token_p);
+    }
+
+NH_MAKE_END(NH_MAKE_SUCCESS)
+}
+
+static NH_MAKE_RESULT nh_make_parseToken(
+    nh_make_ChangesParser *Parser_p
+);
+
+static NH_MAKE_RESULT nh_make_parseParent(
+    nh_make_ChangesParser *Parser_p) 
+{
+NH_MAKE_BEGIN()
+
+    if (!Parser_p->Token_p->string_p) {
+        NH_MAKE_END(NH_MAKE_ERROR_BAD_STATE)
+    }
+
+    NH_MAKE_CHANGES_NODE type = NH_MAKE_CHANGES_NODE_UNDEFINED;
+
+    if (!strcmp(Parser_p->Token_p->string_p, "changes")) {
+        type = NH_MAKE_CHANGES_NODE_ROOT;
+    }
+    else if (!strcmp(Parser_p->Token_p->string_p, "workload")) {
+        type = NH_MAKE_CHANGES_NODE_WORKLOAD;
+    }
+    else if (!strcmp(Parser_p->Token_p->string_p, "author")) {
+        type = NH_MAKE_CHANGES_NODE_AUTHOR;
+    }
+
+    if (type == NH_MAKE_CHANGES_NODE_UNDEFINED) {
+        NH_MAKE_END(NH_MAKE_ERROR_BAD_STATE)
+    }
+
+    Parser_p->Node_p = nh_make_createChangesNode(type, Parser_p->Node_p);
+    NH_MAKE_CHECK_NULL(Parser_p->Node_p)
+
+    ++(Parser_p->Token_p);
+    ++(Parser_p->Token_p);
+
+    while (Parser_p->Token_p->type != NH_MAKE_TOKEN_CURLY_BRACKET_RIGHT) {
+        NH_MAKE_CHECK(nh_make_parseToken(Parser_p))
+    }
+
+    ++(Parser_p->Token_p);
+
+    if (Parser_p->Node_p->Parent_p) {
+        Parser_p->Node_p = Parser_p->Node_p->Parent_p;
+    }
+
+NH_MAKE_END(NH_MAKE_SUCCESS)
+}
+
+static NH_MAKE_RESULT nh_make_parseToken(
+    nh_make_ChangesParser *Parser_p)
+{
+NH_MAKE_BEGIN()
+
+    if (Parser_p->Token_p->type != NH_MAKE_TOKEN_IDENTIFIER) {
+        NH_MAKE_END(NH_MAKE_ERROR_BAD_STATE)
+    }
+
+    switch ((Parser_p->Token_p+1)->type) {
+        case NH_MAKE_TOKEN_CURLY_BRACKET_LEFT :
+            NH_MAKE_END(nh_make_parseParent(Parser_p))
+        case NH_MAKE_TOKEN_COLON :
+            NH_MAKE_END(nh_make_parseChild(Parser_p))
+        default :
+            NH_MAKE_END(NH_MAKE_ERROR_BAD_STATE)
+    }
+
+NH_MAKE_END(NH_MAKE_SUCCESS)
+}
+
+nh_make_ChangesNode *nh_make_parseChangesFile(
+    NH_BYTE *path_p)
+{
+NH_MAKE_BEGIN()
+
+#include NH_MAKE_CUSTOM_CHECK
+
+    nh_make_File File = nh_make_initFile();
+    NH_MAKE_CHECK(NULL, nh_make_setFileData(&File, path_p))
+
+    nh_make_Tokenizer Tokenizer = nh_make_initTokenizer();
+    NH_MAKE_CHECK(NULL, nh_make_tokenizeFile(&Tokenizer, &File))
+
+    nh_make_ChangesParser Parser;
+    Parser.Token_p = Tokenizer.Tokens_p;
+    Parser.Node_p = malloc(sizeof(nh_make_ChangesNode));
+    NH_MAKE_CHECK_NULL(NULL, Parser.Node_p)
+
+    nh_make_initChangesNode(Parser.Node_p, NH_MAKE_CHANGES_NODE_UNDEFINED, NULL);
+
+    while (Parser.Token_p->type != NH_MAKE_TOKEN_EOF) {
+        NH_MAKE_CHECK(NULL, nh_make_parseToken(&Parser))
+    }
+
+    nh_make_freeFileData(&File);
+
+#include NH_MAKE_DEFAULT_CHECK
+
+NH_MAKE_END((nh_make_ChangesNode*)Parser.Node_p)
+}
+
+// PARSE PARSE-TREE ================================================================================
+
+typedef struct nh_make_ChangesNodeArray {
+    nh_make_ChangesNode **Nodes_pp;
+    int nodes; 
+} nh_make_ChangesNodeArray;
+
+static nh_make_ChangesNodeArray nh_make_initChangesNodeArray()
+{
+NH_MAKE_BEGIN()
+
+    nh_make_ChangesNodeArray Array;
+    Array.Nodes_pp = NULL;
+    Array.nodes = 0;
+
+NH_MAKE_END(Array)
+}
+
+static NH_MAKE_RESULT nh_make_addToChangesNodeArray(
+    nh_make_ChangesNodeArray *Array_p, nh_make_ChangesNode *Node_p)
+{
+NH_MAKE_BEGIN()
+
+     if (!Array_p->Nodes_pp) {
+        Array_p->Nodes_pp = malloc(sizeof(nh_make_ChangesNode*));
+        NH_MAKE_CHECK_NULL(Array_p->Nodes_pp)
+        Array_p->Nodes_pp[0] = Node_p;
+        Array_p->nodes = 1;
+    }
+    else {
+        Array_p->Nodes_pp =
+            realloc(Array_p->Nodes_pp, sizeof(nh_make_ChangesNode*) * (Array_p->nodes + 1));
+        NH_MAKE_CHECK_NULL(Array_p->Nodes_pp)
+        Array_p->Nodes_pp[Array_p->nodes] = Node_p;
+        Array_p->nodes++;
+    }
+   
+NH_MAKE_END(NH_MAKE_SUCCESS)
+}
+
+static void nh_make_freeChangesNodeArray(
+    nh_make_ChangesNodeArray *Array_p)
+{
+NH_MAKE_BEGIN()
+
+    free(Array_p->Nodes_pp);
+
+NH_MAKE_SILENT_END()
+}
+
+static NH_MAKE_RESULT nh_make_getChangesNode(
+    nh_make_ChangesNodeArray *Array_p, nh_make_ChangesNode *Node_p, NH_MAKE_CHANGES_NODE type)
+{
+NH_MAKE_BEGIN()
+
+    if (Node_p->type == type) {
+        NH_MAKE_CHECK(nh_make_addToChangesNodeArray(Array_p, Node_p))
+    }
+
+    for (int i = 0; i < Node_p->children; ++i) {
+        nh_make_getChangesNode(Array_p, Node_p->Children_pp[i], type);
+    }
+
+NH_MAKE_END(NH_MAKE_SUCCESS)
+}
+
+static NH_MAKE_RESULT nh_make_getChangesAuthor(
+    nh_make_Author *Author_p, nh_make_ChangesNode *Node_p)
+{
+NH_MAKE_BEGIN()
+
+    Author_p->name_p = NULL;
+    Author_p->contact_p = NULL;
+    Author_p->messages_pp = NULL;
+    Author_p->messages = 0;
+
+    int messages = 0;
+
+    for (int i = 0; i < Node_p->children; ++i) {
+        nh_make_ChangesNode *Child_p = Node_p->Children_pp[i];
+        switch (Child_p->type) {
+            case NH_MAKE_CHANGES_NODE_AUTHOR_NAME :
+                Author_p->name_p = Child_p->text_p;
+                break;
+            case NH_MAKE_CHANGES_NODE_AUTHOR_CONTACT :
+                Author_p->contact_p = Child_p->text_p;
+                break;
+            case NH_MAKE_CHANGES_NODE_AUTHOR_MESSAGE :
+                ++messages;
+                break;
+        }
+    }
+
+    Author_p->messages_pp = malloc(sizeof(NH_BYTE*)*messages);
+    NH_MAKE_CHECK_NULL(Author_p->messages_pp)
+
+    for (int i = 0, j = 0; i < Node_p->children; ++i) {
+        if (Node_p->Children_pp[i]->type == NH_MAKE_CHANGES_NODE_AUTHOR_MESSAGE) {
+            Author_p->messages_pp[j++] = Node_p->Children_pp[i]->text_p;
+        }
+    }
+
+    Author_p->messages = messages;
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
+static NH_MAKE_RESULT nh_make_getWorkload(
+    nh_make_Workload *Workload_p, nh_make_ChangesNode *Node_p)
+{
+NH_MAKE_BEGIN()
+
+    Workload_p->bins_pp = NULL;
+    Workload_p->bins = 0;
+    Workload_p->libs_pp = NULL;
+    Workload_p->libs = 0;
+    Workload_p->scope_p = NULL;
+    Workload_p->Authors_p = NULL;
+    Workload_p->authors = 0;
+
+    int authors = 0, bins = 0, libs = 0;
+
+    for (int i = 0; i < Node_p->children; ++i) {
+        nh_make_ChangesNode *Child_p = Node_p->Children_pp[i];
+        switch (Child_p->type) {
+            case NH_MAKE_CHANGES_NODE_WORKLOAD_BIN :
+                ++bins;
+                break;
+            case NH_MAKE_CHANGES_NODE_WORKLOAD_LIB :
+                ++libs;
+                break;
+            case NH_MAKE_CHANGES_NODE_WORKLOAD_SCOPE :
+                Workload_p->scope_p = Child_p->text_p;
+                break;
+            case NH_MAKE_CHANGES_NODE_AUTHOR :
+                ++authors;
+                break;
+        }
+    }
+
+    if (bins)
+    {
+        Workload_p->bins_pp = malloc(sizeof(NH_BYTE*)*bins);
+        NH_MAKE_CHECK_NULL(Workload_p->bins_pp)
+        for (int i = 0, j = 0; i < Node_p->children; ++i) {
+            if (Node_p->Children_pp[i]->type == NH_MAKE_CHANGES_NODE_WORKLOAD_BIN) {
+                Workload_p->bins_pp[j++] = Node_p->Children_pp[i]->text_p;
+            }
+        }
+        Workload_p->bins = bins;
+    }
+
+    if (libs)
+    {
+        Workload_p->libs_pp = malloc(sizeof(NH_BYTE*)*libs);
+        NH_MAKE_CHECK_NULL(Workload_p->libs_pp)
+        for (int i = 0, j = 0; i < Node_p->children; ++i) {
+            if (Node_p->Children_pp[i]->type == NH_MAKE_CHANGES_NODE_WORKLOAD_LIB) {
+                Workload_p->libs_pp[j++] = Node_p->Children_pp[i]->text_p;
+            }
+        }
+        Workload_p->libs = libs;
+    }
+
+    if (authors)
+    {
+        Workload_p->Authors_p = malloc(sizeof(nh_make_Author)*authors);
+        NH_MAKE_CHECK_NULL(Workload_p->Authors_p)
+        for (int i = 0, j = 0; i < Node_p->children; ++i) {
+            if (Node_p->Children_pp[i]->type == NH_MAKE_CHANGES_NODE_AUTHOR) {
+                nh_make_getChangesAuthor(Workload_p->Authors_p+j, Node_p->Children_pp[i]);
+                j++;
+            }
+        }
+        Workload_p->authors = authors;
+    }
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
+static void nh_make_initChanges(
+    nh_make_Changes *Changes_p)
+{
+NH_MAKE_BEGIN()
+
+    Changes_p->date_p = NULL;
+    Changes_p->id_p = NULL;
+    Changes_p->summary_p = NULL;
+    Changes_p->workloads = 0;
+    Changes_p->Workloads_p = NULL;
+
+NH_MAKE_SILENT_END()
+}
+
+static NH_MAKE_RESULT nh_make_parseChangesNode(
+    nh_make_ChangesNode *Root_p, nh_make_Changes *Changes_p)
+{
+NH_MAKE_BEGIN()
+
+    nh_make_initChanges(Changes_p);
+
+    nh_make_ChangesNodeArray Array = nh_make_initChangesNodeArray();
+    NH_MAKE_CHECK(nh_make_getChangesNode(&Array, Root_p, NH_MAKE_CHANGES_NODE_SUMMARY))
+
+    if (Array.nodes != 1) {NH_MAKE_END(NH_MAKE_ERROR_BAD_STATE)}
+
+    Changes_p->summary_p = Array.Nodes_pp[0]->text_p;
+
+    nh_make_freeChangesNodeArray(&Array);
+
+    Array = nh_make_initChangesNodeArray();
+    NH_MAKE_CHECK(nh_make_getChangesNode(&Array, Root_p, NH_MAKE_CHANGES_NODE_WORKLOAD))
+
+    if (Array.nodes == 0) {
+        NH_MAKE_END(NH_MAKE_ERROR_BAD_STATE)
+    }
+
+    Changes_p->Workloads_p = malloc(sizeof(nh_make_Workload)*Array.nodes);
+    NH_MAKE_CHECK_NULL(Changes_p->Workloads_p)
+
+    for (int i = 0; i < Array.nodes; ++i) {
+        NH_MAKE_CHECK(nh_make_getWorkload(Changes_p->Workloads_p+i, Array.Nodes_pp[i]))
+    } 
+
+    Changes_p->workloads = Array.nodes;
+
+    nh_make_freeChangesNodeArray(&Array);
+
+NH_MAKE_END(NH_MAKE_SUCCESS)
+}
+
+nh_make_Changes *nh_make_getChanges(
+    nh_make_ChangesNode *Root_p, int *changes_p)
+{
+NH_MAKE_BEGIN()
+
+#include NH_MAKE_CUSTOM_CHECK
+
+    if (changes_p) {*changes_p = 0;}
+
+    nh_make_ChangesNodeArray Array = nh_make_initChangesNodeArray();
+    NH_MAKE_CHECK(NULL, nh_make_getChangesNode(&Array, Root_p, NH_MAKE_CHANGES_NODE_ROOT))
+
+    if (Array.nodes <= 0) {NH_MAKE_END(NULL)}
+
+    nh_make_Changes *Changes_p = malloc(sizeof(nh_make_Changes)*Array.nodes);
+    NH_MAKE_CHECK_NULL(NULL, Changes_p)
+
+    for (int i = 0; i < Array.nodes; ++i) {
+        NH_MAKE_CHECK(NULL, nh_make_parseChangesNode(Array.Nodes_pp[i], Changes_p+i))
+    } 
+    if (changes_p) {*changes_p = Array.nodes;}
+
+    nh_make_freeChangesNodeArray(&Array);
+
+#include NH_MAKE_DEFAULT_CHECK
+
+NH_MAKE_END(Changes_p)
+}
+
+// MESSAGE =========================================================================================
+
+static nh_make_SourceContext *nh_make_getSourceContextForChangesMessage(
+    nh_make_Runtime *Runtime_p, NH_BYTE *name_p, NH_BOOL bin)
+{
+NH_MAKE_BEGIN()
+
+    nh_make_SourceContextArray *Array_p = nh_make_getSourceContextArray(Runtime_p);
+
+    for (int i = 0; i < Array_p->length; ++i) {
+        if ((bin && Array_p->SourceContexts_p[i].type == NH_MAKE_SOURCE_CONTEXT_BINARY)
+        || (!bin && Array_p->SourceContexts_p[i].type != NH_MAKE_SOURCE_CONTEXT_BINARY)) {
+            if (!strcmp(Array_p->SourceContexts_p[i].name_p, name_p)) {
+                NH_MAKE_END(Array_p->SourceContexts_p+i);
+            }
+        }
+    }
+
+NH_MAKE_END(NULL)
+}
+
+static NH_MAKE_RESULT nh_make_printChangesGit(
+    nh_make_Runtime *Runtime_p, nh_make_Changes *Changes_p)
+{
+NH_MAKE_BEGIN()
+
+//    NH_BYTE message_p[2048];
+//    memset(message_p, 0, 2048);
+//
+//    strcpy(message_p, "git commit -m \"");
+//    strcpy(message_p+strlen(message_p), Changes_p->summary_p);
+//    strcpy(message_p+strlen(message_p), "\"");
+//   
+//    for (int i = 0; i < Changes_p->workloads; ++i) 
+//    {
+//        nh_make_Workload *Workload_p = Changes_p->Workloads_p+i;
+//        strcpy(message_p+strlen(message_p), " -m \"");
+//
+//        for (int j = 0; j < Workload_p->libs; ++j) {
+//            if (j) {
+//                strcpy(message_p+strlen(message_p), ", ");
+//            }
+//            sprintf(message_p+strlen(message_p), "%s (lib) ", Workload_p->libs_pp[j]);
+//            nh_make_addScopeToMessage(Runtime_p, Workload_p->libs_pp[j], Workload_p->scope_p, NH_FALSE, message_p);
+//        }
+//
+//        for (int j = 0; j < Workload_p->bins; ++j) {
+//            if (j || Workload_p->libs) {
+//                strcpy(message_p+strlen(message_p), ", ");
+//            }
+//            sprintf(message_p+strlen(message_p), "%s (bin) ", Workload_p->bins_pp[j]);
+//            nh_make_addScopeToMessage(Runtime_p, Workload_p->bins_pp[j], Workload_p->scope_p, NH_TRUE, message_p);
+//        }
+//
+//        strcpy(message_p+strlen(message_p), "\" -m \"");
+//
+//        for (int j = 0; j < Workload_p->authors; ++j) {
+//            if (j) {
+//                strcpy(message_p+strlen(message_p), " ");
+//            }
+//            NH_BYTE name_p[255];
+//            memset(name_p, 0, 255);
+//            sprintf(name_p, "[%s] ", Workload_p->Authors_p[j].name_p);
+//            strcpy(message_p+strlen(message_p), name_p);
+//            for (int k = 0; k < Workload_p->Authors_p[j].messages; ++k) {
+//                if (k) {
+//                    strcpy(message_p+strlen(message_p), " ");
+//                }
+//                strcpy(message_p+strlen(message_p), Workload_p->Authors_p[j].messages_pp[k]);
+//            }
+//        }
+//
+//        strcpy(message_p+strlen(message_p), "\"");
+//    }
+//
+//    puts(message_p);
+
+NH_MAKE_END(NH_MAKE_SUCCESS)
+}
+
+NH_MAKE_RESULT nh_make_printChangesDefault(
+    nh_make_Runtime *Runtime_p, nh_make_Changes *Changes_p)
+{
+NH_MAKE_BEGIN()
+
+    nh_make_messagef("%s", Changes_p->summary_p);
+   
+    for (int i = 0; i < Changes_p->workloads; ++i) 
+    {
+        nh_make_Workload *Workload_p = Changes_p->Workloads_p+i;
+        nh_make_messagef("  [%s update]", Workload_p->scope_p);
+
+        for (int j = 0; j < Workload_p->libs; ++j) {
+            nh_make_messagef("  lib: %s", Workload_p->libs_pp[j]);
+        }
+
+        for (int j = 0; j < Workload_p->bins; ++j) {
+            nh_make_messagef("  bin: %s", Workload_p->bins_pp[j]);
+        }
+
+        for (int j = 0; j < Workload_p->authors; ++j) {
+            nh_make_messagef("    author: %s", Workload_p->Authors_p[j].name_p);
+            for (int k = 0; k < Workload_p->Authors_p[j].messages; ++k) {
+                nh_make_messagef("      message %d: %s", k, Workload_p->Authors_p[j].messages_pp[k]);
+            }
+        }
+    }
+
+NH_MAKE_END(NH_MAKE_SUCCESS)
+}
+
+NH_MAKE_RESULT nh_make_printChanges(
+    nh_make_Runtime *Runtime_p, nh_make_Changes *Changes_p, NH_MAKE_PRINT_CHANGES type)
+{
+NH_MAKE_BEGIN()
+
+    switch (type) 
+    {
+        case NH_MAKE_PRINT_CHANGES_GIT :
+            NH_MAKE_DIAGNOSTIC_END(nh_make_printChangesGit(Runtime_p, Changes_p))
+        default :
+            NH_MAKE_DIAGNOSTIC_END(nh_make_printChangesDefault(Runtime_p, Changes_p))
+    }
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_ERROR_BAD_STATE)
+}
+
+// NORMALIZE =======================================================================================
+
+static NH_MAKE_RESULT nh_make_normalizeAuthor(
+    nh_make_Author *Author_p, NH_BYTE *changes_p)
+{
+NH_MAKE_BEGIN()
+
+    sprintf(changes_p+strlen(changes_p), "author{name:\"%s\"contact:\"%s\"",
+        Author_p->name_p, Author_p->contact_p);
+
+    for (int i = 0; i < Author_p->messages; ++i) {
+        if (i) {strcpy(changes_p+strlen(changes_p), ",");}
+        else {strcpy(changes_p+strlen(changes_p), "message:");}
+        sprintf(changes_p+strlen(changes_p), "\"%s\"", Author_p->messages_pp[i]);
+    }
+
+    strcpy(changes_p+strlen(changes_p), "}");
+ 
+NH_MAKE_END(NH_MAKE_SUCCESS)
+}
+
+static NH_MAKE_RESULT nh_make_normalizeWorkload(
+    nh_make_Workload *Workload_p, NH_BYTE *changes_p)
+{
+NH_MAKE_BEGIN()
+
+    sprintf(changes_p+strlen(changes_p), "workload{scope:\"%s\"", Workload_p->scope_p);
+
+    for (int i = 0; i < Workload_p->libs; ++i) {
+        if (i) {strcpy(changes_p+strlen(changes_p), ",");}
+        else {strcpy(changes_p+strlen(changes_p), "lib:");}
+        sprintf(changes_p+strlen(changes_p), "\"%s\"", Workload_p->libs_pp[i]);
+    }
+
+    for (int i = 0; i < Workload_p->bins; ++i) {
+        if (i) {strcpy(changes_p+strlen(changes_p), ",");}
+        else {strcpy(changes_p+strlen(changes_p), "bin:");}
+        sprintf(changes_p+strlen(changes_p), "\"%s\"", Workload_p->bins_pp[i]);
+    }
+    for (int i = 0; i < Workload_p->authors; ++i) {
+        NH_MAKE_CHECK(nh_make_normalizeAuthor(Workload_p->Authors_p+i, changes_p))
+    }
+ 
+    strcpy(changes_p+strlen(changes_p), "}");
+
+NH_MAKE_END(NH_MAKE_SUCCESS)
+}
+
+NH_MAKE_RESULT nh_make_normalizeChanges(
+    nh_make_Changes *Changes_p, NH_BYTE *changes_p, int length)
+{
+NH_MAKE_BEGIN()
+
+    memset(changes_p, 0, length);
+
+    sprintf(changes_p, "changes{date:\"%s\"id:\"%s\"summary:\"%s\"",
+        Changes_p->date_p, Changes_p->id_p, Changes_p->summary_p);
+
+    for (int i = 0; i < Changes_p->workloads; ++i) {
+        NH_MAKE_CHECK(nh_make_normalizeWorkload(Changes_p->Workloads_p+i, changes_p))
+    }
+ 
+    strcpy(changes_p+strlen(changes_p), "}");
+
+NH_MAKE_END(NH_MAKE_SUCCESS)
+}
+
+// OTHER ===========================================================================================
+
+// TODO Fix memory leak.
+NH_MAKE_RESULT nh_make_addDateAndIdToChanges(
+    nh_make_Changes *Changes_p)
+{
+NH_MAKE_BEGIN()
+
+    time_t t = time(NULL);
+    struct tm tm = *localtime(&t);
+    NH_BYTE time_p[255];
+    memset(time_p, 0, 255);
+    sprintf(time_p, "%d-%02d-%02d,%02d:%02d:%02d", tm.tm_year+1900, tm.tm_mon+1, tm.tm_mday, tm.tm_hour, tm.tm_min, tm.tm_sec);
+
+    Changes_p->date_p = malloc(sizeof(NH_BYTE) * (strlen(time_p) + 1));
+    NH_MAKE_CHECK_NULL(Changes_p->date_p)
+    strcpy(Changes_p->date_p, time_p);
+
+    int length = 2047;
+    NH_BYTE normalized_p[length];
+    memset(normalized_p, 0, length);
+    nh_make_normalizeChanges(Changes_p, normalized_p, length);
+
+    NH_BYTE command_p[length];
+    memset(command_p, 0, length);
+    sprintf(command_p, "echo %s | sha1sum -z | head -c 40", normalized_p);
+
+    char id_p[1035];
+    FILE *Out_p = popen(command_p, "r");
+    NH_MAKE_CHECK_NULL(Out_p)
+
+    while (fgets(id_p, sizeof(id_p), Out_p) != NULL) {}
+    pclose(Out_p);
+
+    Changes_p->id_p = malloc(sizeof(NH_BYTE) * (strlen(id_p) + 1));
+    NH_MAKE_CHECK_NULL(Changes_p->id_p)
+    strcpy(Changes_p->id_p, id_p);
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
diff --git a/src/lib/nhmake/Core/Changes.h b/src/lib/nhmake/Core/Changes.h
new file mode 100644
index 0000000..edc5b2d
--- /dev/null
+++ b/src/lib/nhmake/Core/Changes.h
@@ -0,0 +1,71 @@
+#ifndef NH_MAKE_CHANGES_H
+#define NH_MAKE_CHANGES_H
+
+#ifndef DOXYGEN_SHOULD_SKIP_THIS
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+#include "../Common/Types/Private.h"
+
+#endif
+
+/** @addtogroup lib_nhmake_structs
+ *  @{
+ */
+
+    typedef struct nh_make_ChangesNode {
+        NH_MAKE_CHANGES_NODE type;
+        NH_BYTE *text_p;
+        int length;
+        struct nh_make_ChangesNode *Parent_p;
+        struct nh_make_ChangesNode **Children_pp;
+        int children; 
+    } nh_make_ChangesNode;
+
+/** @} */
+
+/** @addtogroup lib_nhmake_typedefs
+ *  @{
+ */
+
+    typedef nh_make_ChangesNode *(*nh_make_parseChangesFile_f)(
+        NH_BYTE *path_p 
+    );
+
+    typedef nh_make_Changes *(*nh_make_getChanges_f)(
+        nh_make_ChangesNode *Root_p, int *changes_p
+    );
+
+    typedef NH_MAKE_RESULT (*nh_make_printChanges_f)(
+        nh_make_Runtime *Runtime_p, nh_make_Changes *Changes_p, NH_MAKE_PRINT_CHANGES type
+    );
+
+    typedef NH_MAKE_RESULT (*nh_make_normalizeChanges_f)(
+        nh_make_Changes *Changes_p, NH_BYTE *changes_p, int length
+    );
+
+    typedef NH_MAKE_RESULT (*nh_make_addDateAndIdToChanges_f)(
+        nh_make_Changes *Changes_p
+    );
+
+/** @} */
+
+/** @addtogroup lib_nhmake_functions
+ *  @{
+ */
+
+    nh_make_ChangesNode *nh_make_parseChangesFile(
+        NH_BYTE *path_p
+    );
+
+    nh_make_Changes *nh_make_getChanges(
+        nh_make_ChangesNode *Root_p, int *changes_p
+    );
+
+/** @} */
+
+#endif
diff --git a/src/lib/nhmake/Core/Configure.c b/src/lib/nhmake/Core/Configure.c
new file mode 100644
index 0000000..0306839
--- /dev/null
+++ b/src/lib/nhmake/Core/Configure.c
@@ -0,0 +1,149 @@
+// LICENSE NOTICE ==================================================================================
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+// INCLUDE =========================================================================================
+
+#include "Configure.h"
+#include "Thread.h"
+#include "File.h"
+#include "../Parser/Functions.h"
+#include "../Parser/Variables.h"
+
+#include "../Common/Macros/Macros.h"
+#include NH_MAKE_FLOW
+#include NH_MAKE_DEFAULT_CHECK
+
+#include <stdio.h>
+#include <string.h>
+#include <stdlib.h>
+#include <ctype.h>
+#include <unistd.h>
+
+// ADD =============================================================================================
+
+NH_MAKE_RESULT nh_make_addFile(
+    nh_make_Runtime *Runtime_p, NH_BYTE *path_p)
+{
+NH_MAKE_BEGIN()
+
+    NH_MAKE_CHECK_NULL(Runtime_p)
+    NH_MAKE_CHECK_NULL(path_p)
+
+    NH_MAKE_CHECK(nh_make_appendFile(&Runtime_p->FileArray, path_p))
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
+// SET =============================================================================================
+
+void nh_make_setFunctionCallback(
+    nh_make_Runtime *Runtime_p, nh_make_functionCallback_f functionCallback_f)
+{
+NH_MAKE_BEGIN()
+
+    Runtime_p->functionCallback_f = functionCallback_f;
+
+NH_MAKE_SILENT_END()
+}
+
+void nh_make_setSourceContextCallback(
+    nh_make_Runtime *Runtime_p, nh_make_sourceContextCallback_f sourceContextCallback_f)
+{
+NH_MAKE_BEGIN()
+
+    Runtime_p->sourceContextCallback_f = sourceContextCallback_f;
+
+NH_MAKE_SILENT_END()
+}
+
+void nh_make_setBeforeBuildCallback(
+    nh_make_Runtime *Runtime_p, nh_make_sourceContextCallback_f sourceContextCallback_f)
+{
+NH_MAKE_BEGIN()
+
+    Runtime_p->beforeBuildCallback_f = sourceContextCallback_f;
+
+NH_MAKE_SILENT_END()
+}
+
+void nh_make_setAfterBuildCallback(
+    nh_make_Runtime *Runtime_p, nh_make_sourceContextCallback_f sourceContextCallback_f)
+{
+NH_MAKE_BEGIN()
+
+    Runtime_p->afterBuildCallback_f = sourceContextCallback_f;
+
+NH_MAKE_SILENT_END()
+}
+
+nh_make_SourceContextArray *nh_make_getSourceContextArray(
+    nh_make_Runtime *Runtime_p)
+{
+NH_MAKE_BEGIN()
+NH_MAKE_END(&Runtime_p->SourceContextArray)
+}
+
+nh_make_SourceContext *nh_make_getSourceContext(
+    nh_make_Runtime *Runtime_p, NH_BYTE *name_p)
+{
+NH_MAKE_BEGIN()
+
+    for (int i = 0; i < Runtime_p->SourceContextArray.length; ++i) {
+        nh_make_SourceContext *Context_p = &Runtime_p->SourceContextArray.SourceContexts_p[i];
+        if (!strcmp(Context_p->name_p, name_p)) {NH_MAKE_END(Context_p)}
+    }
+
+NH_MAKE_END(NULL)
+}
+
+void nh_make_setQuiet(
+    nh_make_Runtime *Runtime_p, NH_MAKE_BOOL quiet)
+{
+NH_MAKE_BEGIN()
+
+    Runtime_p->quiet = quiet;
+
+NH_MAKE_SILENT_END()
+}
+
+void nh_make_setShowParseTree(
+    nh_make_Runtime *Runtime_p, NH_MAKE_BOOL showParseTree)
+{
+NH_MAKE_BEGIN()
+
+    Runtime_p->showParseTree = showParseTree;
+
+NH_MAKE_SILENT_END()
+}
+
+NH_MAKE_RESULT nh_make_setVariable(
+    nh_make_Runtime *Runtime_p, NH_BYTE *variable_p, NH_BYTE **values_pp, int valueCount)
+{
+NH_MAKE_BEGIN()
+NH_MAKE_END(nh_make_updateVariable(&Runtime_p->VariableArray, variable_p, values_pp, valueCount))
+}
+
+nh_make_ValueArray nh_make_getVariableValues(
+    nh_make_Runtime *Runtime_p, NH_BYTE *variable_p)
+{
+NH_MAKE_BEGIN()
+
+    nh_make_Variable *Variable_p = nh_make_getVariable(&Runtime_p->VariableArray, variable_p);
+
+    nh_make_ValueArray Values;
+    Values.values_pp = NULL;
+    Values.length = 0;
+
+    if (Variable_p) {
+        Values.values_pp = Variable_p->values_pp;
+        Values.length = Variable_p->valueCount;
+    }
+
+NH_MAKE_END(Values)
+}
+
diff --git a/src/lib/nhmake/Core/Configure.h b/src/lib/nhmake/Core/Configure.h
new file mode 100644
index 0000000..24b6173
--- /dev/null
+++ b/src/lib/nhmake/Core/Configure.h
@@ -0,0 +1,81 @@
+#ifndef NH_MAKE_CONFIGURE_H
+#define NH_MAKE_CONFIGURE_H
+
+#ifndef DOXYGEN_SHOULD_SKIP_THIS
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+#include "Source.h"
+
+#include "../Common/Types/Private.h"
+
+#include "../Parser/Parser.h"
+#include "../Parser/Variables.h"
+
+#endif
+
+/** @addtogroup lib_nhmake_typedefs
+ *  @{
+ */
+
+    typedef NH_MAKE_RESULT (*nh_make_addFile_f)(
+        nh_make_Runtime *Runtime_p, NH_BYTE *path_p
+    );
+
+    typedef void (*nh_make_setFunctionCallback_f)(
+        nh_make_Runtime *Runtime_p, nh_make_functionCallback_f functionCallback_f
+    );
+    
+    typedef void (*nh_make_setSourceContextCallback_f)(
+        nh_make_Runtime *Runtime_p, nh_make_sourceContextCallback_f sourceContextCallback_f
+    );
+    
+    typedef void (*nh_make_setBeforeBuildCallback_f)(
+        nh_make_Runtime *Runtime_p, nh_make_sourceContextCallback_f sourceContextCallback_f
+    );
+    
+    typedef void (*nh_make_setAfterBuildCallback_f)(
+        nh_make_Runtime *Runtime_p, nh_make_sourceContextCallback_f sourceContextCallback_f
+    );
+    
+    typedef nh_make_SourceContextArray *(*nh_make_getSourceContextArray_f)(
+        nh_make_Runtime *Runtime_p
+    );
+    
+    typedef nh_make_SourceContext *(*nh_make_getSourceContext_f)(
+        nh_make_Runtime *Runtime_p, NH_BYTE *name_p
+    );
+    
+    typedef void (*nh_make_setQuiet_f)(
+        nh_make_Runtime *Runtime_p, NH_MAKE_BOOL quiet
+    );
+    
+    typedef void (*nh_make_setShowParseTree_f)(
+        nh_make_Runtime *Runtime_p, NH_MAKE_BOOL showParseTree
+    );
+    
+    typedef NH_MAKE_RESULT (*nh_make_setVariable_f)(
+        nh_make_Runtime *Runtime_p, NH_BYTE *variable_p, NH_BYTE **values_pp, int valueCount
+    );
+    
+    typedef nh_make_ValueArray (*nh_make_getVariableValues_f)(
+        nh_make_Runtime *Runtime_p, NH_BYTE *variable_p
+    );
+
+/** @} */
+
+/** @addtogroup lib_nhmake_typedefs
+ *  @{
+ */
+
+    nh_make_SourceContextArray *nh_make_getSourceContextArray(
+        nh_make_Runtime *Runtime_p
+    );
+
+/** @} */
+
+#endif
diff --git a/src/lib/nhmake/Core/File.c b/src/lib/nhmake/Core/File.c
new file mode 100644
index 0000000..46994c8
--- /dev/null
+++ b/src/lib/nhmake/Core/File.c
@@ -0,0 +1,236 @@
+// LICENSE NOTICE ==================================================================================
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+// INCLUDE =========================================================================================
+
+#include "File.h"
+#include "Utils.h"
+
+#include "../UI/Message.h"
+#include "../Common/Macros/Macros.h"
+
+#include NH_MAKE_FLOW
+#include NH_MAKE_DEFAULT_CHECK
+
+#include <unistd.h>
+#include <string.h>
+#include <stdlib.h>
+#include <dlfcn.h>
+#include <stdio.h>
+#include <pwd.h>
+
+#if defined(__linux__) || defined(__APPLE__)
+    #include <sys/stat.h>
+    #include <sys/types.h>
+#endif
+
+// GENERAL FILE RELATED OPERATIONS =================================================================
+
+NH_MAKE_BOOL nh_make_canFindSharedLib(
+    const NH_BYTE *lib_p)
+{
+NH_MAKE_BEGIN()
+
+    NH_BYTE path_p[1024] = {'\0'};
+    sprintf(path_p, "/usr/lib/lib%s.so", lib_p);
+
+    if(access(path_p, F_OK) != -1) {NH_MAKE_DIAGNOSTIC_END(NH_MAKE_TRUE)}
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_FALSE)
+}
+
+NH_MAKE_RESULT nh_make_copy(
+    nh_make_VariableArray *Array_p, NH_BYTE *in_p, NH_BYTE *out_p, NH_MAKE_BOOL recursive, NH_MAKE_BOOL sudo)
+{
+NH_MAKE_BEGIN()
+
+    NH_BYTE realin_p[1024] = {'\0'}, realout_p[1024] = {'\0'};
+    realpath(out_p, realout_p);
+    realpath(in_p, realin_p);
+    nh_make_messagef(sudo ? "COPY %s TO %s \e[1;31mSUDO PREPENDED\e[0m" : "COPY %s TO %s", realin_p, realout_p);
+
+    if (!nh_make_canRunCommand("cp")) {NH_MAKE_DIAGNOSTIC_END(NH_MAKE_ERROR_CP_NOT_FOUND)}
+
+#if defined(__linux__) || defined(__APPLE__)
+
+    NH_BYTE command_p[32] = {'\0'};
+    sprintf(command_p, sudo ? "sudo cp" : "cp");
+    NH_BYTE fullCommand_p[1024] = {'\0'};
+
+    if (out_p[0] != '/') {
+        sprintf(fullCommand_p, recursive ? "%s -rp %s %s" : "%s -p %s %s", command_p, in_p, out_p);
+    }
+    else {
+        sprintf(fullCommand_p, recursive ? "%s -rp %s %s" : "%s -p %s %s", command_p, in_p, out_p);
+    }
+
+    int status = system(fullCommand_p);
+    if (WEXITSTATUS(status) || WIFSIGNALED(status)) {NH_MAKE_DIAGNOSTIC_END(NH_MAKE_ERROR_CP_EXECUTION_FAILED)}
+
+#elif defined(WIN_32)
+
+#endif
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
+NH_MAKE_RESULT nh_make_createSymLink(
+    NH_BYTE *filePath_p, NH_BYTE *symLinkPath_p, NH_MAKE_BOOL sudo)
+{
+NH_MAKE_BEGIN()
+
+#if defined(__linux__) || defined(__APPLE__)
+
+    if (!nh_make_canRunCommand("ln")) {NH_MAKE_DIAGNOSTIC_END(NH_MAKE_ERROR_CP_NOT_FOUND)}
+
+    NH_BYTE command_p[64] = {'\0'};
+    sprintf(command_p, sudo ? "sudo ln -s" : "ln -s");
+
+    NH_BYTE fullCommand_p[1024] = {'\0'};
+    sprintf(fullCommand_p, "%s %s %s", command_p, filePath_p, symLinkPath_p);
+
+    int status = system(fullCommand_p);
+    if (WEXITSTATUS(status) || WIFSIGNALED(status)) {NH_MAKE_DIAGNOSTIC_END(NH_MAKE_ERROR_CP_EXECUTION_FAILED)}
+
+#elif defined(WIN_32)
+
+#endif
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
+NH_MAKE_BOOL nh_make_fileExists(
+    NH_BYTE *filename_p)
+{
+NH_MAKE_BEGIN()
+NH_MAKE_END(access(filename_p, F_OK) != -1 ? NH_MAKE_TRUE : NH_MAKE_FALSE)
+}
+
+NH_MAKE_RESULT nh_make_writeBytesToFile(
+    NH_BYTE *filename_p, NH_BYTE *bytes_p)
+{
+NH_MAKE_BEGIN()
+
+    NH_MAKE_CHECK_NULL(bytes_p)
+    NH_MAKE_CHECK_NULL(filename_p)
+
+    FILE *f = fopen(filename_p, "w");
+    NH_MAKE_CHECK_NULL(f)    
+    
+    fprintf(f, "%s", bytes_p);
+    fclose(f);
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
+// FILE STRUCTURE ==================================================================================
+
+nh_make_File nh_make_initFile()
+{
+NH_MAKE_BEGIN()
+
+    nh_make_File File;
+    File.path_p = NULL;
+    File.data_p = NULL;
+
+NH_MAKE_END(File)
+}
+
+void nh_make_freeFileData(
+    nh_make_File *File_p)
+{
+NH_MAKE_BEGIN()
+
+    free(File_p->path_p);
+    free(File_p->data_p);
+
+NH_MAKE_SILENT_END()
+}
+
+NH_BYTE *nh_make_getFileData(
+    const NH_BYTE* path_p, long *size_p)
+{
+NH_MAKE_BEGIN()
+
+    FILE *fh = fopen(path_p, "rb");
+    if (fh == NULL) {NH_MAKE_END(NULL)}
+    
+    if (fseek(fh, 0, SEEK_END) != 0) {NH_MAKE_END(NULL)}
+    long size = ftell(fh);
+    rewind(fh);
+
+    if(size <= 0) {
+        fclose(fh);
+        NH_MAKE_END(NULL)
+    }
+
+    NH_BYTE *data_p = malloc(size+1); 
+    if (data_p == NULL) {NH_MAKE_END(NULL)}
+    
+    memset(data_p, 0, size+1);
+    fread(data_p, 1, size, fh);
+    fclose(fh);
+
+    data_p[size] = 0;
+    if (size_p != NULL) {*size_p = size;}
+
+NH_MAKE_END(data_p)
+}
+
+NH_MAKE_RESULT nh_make_setFileData(
+    nh_make_File *File_p, NH_BYTE *path_p)
+{
+NH_MAKE_BEGIN()
+
+    if (!File_p || !path_p) {NH_MAKE_DIAGNOSTIC_END(NH_MAKE_ERROR_BAD_STATE)}
+
+    File_p->data_p = nh_make_getFileData(path_p, NULL);
+    NH_MAKE_CHECK_NULL(File_p->data_p)
+
+    File_p->path_p = malloc(strlen(path_p) + 1);
+    NH_MAKE_CHECK_NULL(File_p->path_p)
+
+    strcpy(File_p->path_p, path_p);
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
+// FILE STRUCTURE ARRAY ============================================================================
+
+void nh_make_initFileArray(
+    nh_make_FileArray *Array_p)
+{
+NH_MAKE_BEGIN()
+
+    Array_p->length = 0;
+    Array_p->Files_p = NULL;
+
+NH_MAKE_SILENT_END()
+}
+
+NH_MAKE_RESULT nh_make_appendFile(
+    nh_make_FileArray *Array_p, NH_BYTE *path_p)
+{
+NH_MAKE_BEGIN()
+
+    if (!Array_p->length) {
+        Array_p->Files_p = malloc(sizeof(nh_make_File));
+        NH_MAKE_CHECK_NULL(Array_p->Files_p)       
+    }
+    else {
+        Array_p->Files_p = realloc(Array_p->Files_p, sizeof(nh_make_File) * (Array_p->length + 1));
+        NH_MAKE_CHECK_NULL(Array_p->Files_p)       
+    }
+
+    NH_MAKE_CHECK(nh_make_setFileData(Array_p->Files_p+Array_p->length, path_p))
+
+    Array_p->length++;
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
diff --git a/src/lib/nhmake/Core/File.h b/src/lib/nhmake/Core/File.h
new file mode 100644
index 0000000..2e86e7c
--- /dev/null
+++ b/src/lib/nhmake/Core/File.h
@@ -0,0 +1,91 @@
+#ifndef NH_MAKE_FILE_H
+#define NH_MAKE_FILE_H
+
+#ifndef DOXYGEN_SHOULD_SKIP_THIS
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+#include "../Parser/Variables.h"
+
+#include "../Common/Types/Private.h"
+
+#include <stddef.h>
+
+#endif
+
+/** @addtogroup lib_nhmake_structs
+ *  @{
+ */
+
+    typedef struct nh_make_File {
+        NH_BYTE *path_p;
+        NH_BYTE *data_p;
+    } nh_make_File;
+
+    typedef struct nh_make_FileArray {
+        int length;
+        nh_make_File *Files_p;
+    } nh_make_FileArray;
+
+/** @} */
+
+/** @addtogroup lib_nhmake_typedefs
+ *  @{
+ */
+
+    typedef NH_BYTE *(*nh_make_getFileData_f)(
+        const NH_BYTE* path_p, long *size_p
+    );
+
+    typedef NH_MAKE_RESULT (*nh_make_writeBytesToFile_f)(
+        NH_BYTE *filename_p, NH_BYTE *bytes_p
+    );
+
+/** @} */
+
+/** @addtogroup lib_nhmake_functions
+ *  @{
+ */
+
+    NH_MAKE_BOOL nh_make_canFindSharedLib(
+        const NH_BYTE *lib_p
+    );
+
+    NH_MAKE_RESULT nh_make_copy(
+        nh_make_VariableArray *Array_p, NH_BYTE *in_p, NH_BYTE *out_p, NH_MAKE_BOOL recursive, NH_MAKE_BOOL sudo
+    );
+
+    NH_MAKE_RESULT nh_make_createSymLink(
+        NH_BYTE *filePath_p, NH_BYTE *symLinkPath_p, NH_MAKE_BOOL sudo
+    );
+
+    NH_MAKE_BOOL nh_make_fileExists(
+        NH_BYTE *filename_p
+    );
+
+    void nh_make_initFileArray(
+        nh_make_FileArray *Array_p
+    );
+    
+    NH_MAKE_RESULT nh_make_appendFile(
+        nh_make_FileArray *Array_p, NH_BYTE *path_p
+    );
+
+    nh_make_File nh_make_initFile(
+    );
+
+    NH_MAKE_RESULT nh_make_setFileData(
+        nh_make_File *File_p, NH_BYTE *path_p
+    );
+
+    void nh_make_freeFileData(
+        nh_make_File *File_p
+    );
+
+/** @} */
+
+#endif
diff --git a/src/lib/nhmake/Core/Options.c b/src/lib/nhmake/Core/Options.c
new file mode 100644
index 0000000..a549545
--- /dev/null
+++ b/src/lib/nhmake/Core/Options.c
@@ -0,0 +1,463 @@
+// LICENSE NOTICE ==================================================================================
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+// INCLUDE =========================================================================================
+
+#include "Options.h"
+#include "Thread.h"
+#include "File.h"
+#include "Build.h"
+
+#include "../Parser/Functions.h"
+#include "../Parser/Variables.h"
+
+#include "../Common/Macros/Macros.h"
+#include NH_MAKE_FLOW
+#include NH_MAKE_DEFAULT_CHECK
+
+#include <stdio.h>
+#include <string.h>
+#include <stdlib.h>
+#include <ctype.h>
+
+// HELPER ==========================================================================================
+
+static NH_BYTE *nh_make_offsetBuildArgumentPrefix(
+    nh_make_Runtime *Runtime_p, NH_BYTE *name_p)
+{
+NH_MAKE_BEGIN()
+
+    nh_make_Variable *Prefix_p = nh_make_getVariable(&Runtime_p->VariableArray, "PREFIX");
+
+    if (Prefix_p) {
+        int offset = 0;
+        for (offset = 0; offset < strlen(Prefix_p->values_pp[0]) && offset < strlen(name_p) 
+            && Prefix_p->values_pp[0][offset] == name_p[offset]; ++offset) {};
+        if (offset == strlen(Prefix_p->values_pp[0])) {
+            NH_MAKE_END(name_p + offset)
+        }
+    }
+
+NH_MAKE_END(name_p)
+}
+
+// GET OPTION ======================================================================================
+
+static nh_make_Option *nh_make_getOptionFromBlock(
+    nh_make_Runtime *Runtime_p, nh_make_Block *Block_p, NH_BYTE *name_p, NH_BYTE **argv_pp, int args)
+{
+NH_MAKE_BEGIN()
+
+    for (int d = 0; d < Block_p->definitions; ++d) 
+    {
+        switch (Block_p->Definitions_p[d].type)
+        {
+            case NH_MAKE_DEFINITION_IF :
+                if (nh_make_compareIf(Runtime_p, &Block_p->Definitions_p[d].If, NH_MAKE_TRUE)) {
+                    nh_make_Option *Option_p = nh_make_getOptionFromBlock(Runtime_p, &Block_p->Definitions_p[d].If.Block_p->Block, name_p, argv_pp, args);
+                    if (Option_p) {NH_MAKE_END(Option_p)}
+                }
+                break;
+
+            case NH_MAKE_DEFINITION_OPTION :
+                if (!strcmp(Block_p->Definitions_p[d].Option.name_p, name_p)
+                &&  Block_p->Definitions_p[d].Option.arguments == args) {
+                    NH_MAKE_BOOL sameArguments = NH_MAKE_TRUE;
+                    for (int i = 0; i < args; ++i) {
+                        NH_BYTE *argument_p = Block_p->Definitions_p[d].Option.arguments_pp[i];
+                        NH_BYTE *offsetArgument_p = argument_p;
+                        if (Block_p->Definitions_p[d].Option.name_p[0] == 'b' || Block_p->Definitions_p[d].Option.name_p[0] == 't') {
+                            offsetArgument_p = nh_make_offsetBuildArgumentPrefix(Runtime_p, argument_p);
+                        }
+                        if (strcmp(argument_p, argv_pp[i]) && strcmp(offsetArgument_p, argv_pp[i])) {
+                            sameArguments = NH_MAKE_FALSE; 
+                            break;
+                        }
+                    }
+                    if (sameArguments) {
+                        NH_MAKE_END(&Block_p->Definitions_p[d].Option)
+                    }
+                }
+                break;
+        }
+    }
+
+NH_MAKE_END(NULL)
+}
+
+static nh_make_Option *nh_make_getOptionFromParser(
+    nh_make_Runtime *Runtime_p, nh_make_Parser *Parser_p, NH_BYTE *name_p, NH_BYTE **argv_pp, int args)
+{
+NH_MAKE_BEGIN()
+
+    nh_make_Block Block;
+    Block.definitions = Parser_p->definitions;
+    Block.Definitions_p = Parser_p->Definitions_p;
+
+NH_MAKE_END(nh_make_getOptionFromBlock(Runtime_p, &Block, name_p, argv_pp, args))
+}
+
+static nh_make_Option *nh_make_getShortOptions(
+    nh_make_Runtime *Runtime_p, NH_BYTE *name_p, NH_BYTE **argv_pp, int args, int *options_p)
+{
+NH_MAKE_BEGIN()
+
+    *options_p = 0;
+
+    nh_make_Option *Options_p = NULL;
+    NH_BYTE c = 0;
+
+    for (int i = 0; i < strlen(name_p); ++i) 
+    {
+        if (i + 1 < strlen(name_p)) {
+            c = name_p[i+1];
+            name_p[i+1] = 0;
+        }
+
+        nh_make_Option *Option_p = NULL;
+        for (int j = 0; j < Runtime_p->ParserArray.length; ++j) {
+            nh_make_Parser *Parser_p = &Runtime_p->ParserArray.Parsers_p[j];
+            Option_p = nh_make_getOptionFromParser(Runtime_p, Parser_p, name_p+i, argv_pp, args);
+            if (Option_p) {break;}
+        }
+
+        if (Option_p) {
+            if (*options_p == 0) {
+                Options_p = Option_p;
+            }
+            else if (*options_p == 1) {
+                nh_make_Option *Tmp_p = malloc(sizeof(nh_make_Option)*2);
+                Tmp_p[0] = *Options_p;
+                Tmp_p[1] = *Option_p;
+                Options_p = Tmp_p;
+            }
+            else {
+                Options_p = realloc(Options_p, sizeof(nh_make_Option)*(*options_p+1));
+                Options_p[*options_p] = *Option_p;
+            }
+            *options_p += 1;
+        }
+
+        if (c != 0) {
+            name_p[i+1] = c;
+            c = 0;
+        }
+    }
+
+NH_MAKE_END(Options_p)
+}
+
+static nh_make_Option *nh_make_getOption(
+    nh_make_Runtime *Runtime_p, NH_BYTE *name_p, int args, NH_BYTE **argv_pp)
+{
+NH_MAKE_BEGIN()
+
+    nh_make_Option *Option_p = NULL;
+
+    for (int j = 0; j < Runtime_p->ParserArray.length; ++j) {
+        nh_make_Parser *Parser_p = &Runtime_p->ParserArray.Parsers_p[j];
+        Option_p = nh_make_getOptionFromParser(Runtime_p, Parser_p, name_p, argv_pp, args);
+        if (Option_p) {break;}
+    }
+
+NH_MAKE_END(Option_p)
+}
+
+// OPTION NAME =====================================================================================
+
+static NH_MAKE_BOOL nh_make_optionNameExistsInBlock(
+    nh_make_Runtime *Runtime_p, nh_make_Block *Block_p, NH_BYTE *name_p)
+{
+NH_MAKE_BEGIN()
+
+    for (int d = 0; d < Block_p->definitions; ++d) {
+        switch (Block_p->Definitions_p[d].type) {
+            case NH_MAKE_DEFINITION_OPTION :
+                if (!strcmp(Block_p->Definitions_p[d].Option.name_p, name_p)) {
+                    NH_MAKE_END(NH_MAKE_TRUE)
+                }
+                break;
+            case NH_MAKE_DEFINITION_IF :
+                if (nh_make_compareIf(Runtime_p, &Block_p->Definitions_p[d].If, NH_MAKE_TRUE)) {
+                    if (nh_make_optionNameExistsInBlock(Runtime_p, &Block_p->Definitions_p[d].If.Block_p->Block, name_p)) {
+                        NH_MAKE_END(NH_MAKE_TRUE)
+                    }
+                }
+                break;
+        }
+          
+    } 
+
+NH_MAKE_END(NH_MAKE_FALSE)
+}
+
+static NH_MAKE_BOOL nh_make_optionNameExists(
+    nh_make_Runtime *Runtime_p, NH_BYTE *name_p)
+{
+NH_MAKE_BEGIN()
+
+    for (int i = 0; i < Runtime_p->ParserArray.length; ++i) {
+        nh_make_Parser *Parser_p = &Runtime_p->ParserArray.Parsers_p[i];
+        nh_make_Block Block;
+        Block.definitions = Parser_p->definitions;
+        Block.Definitions_p = Parser_p->Definitions_p;
+        if (nh_make_optionNameExistsInBlock(Runtime_p, &Block, name_p)) {
+            NH_MAKE_END(NH_MAKE_TRUE)
+        } 
+    }
+
+NH_MAKE_END(NH_MAKE_FALSE)
+}
+
+// EXECUTE OPTION ==================================================================================
+
+static NH_MAKE_RESULT nh_make_printOption(
+    nh_make_Option *Option_p)
+{
+NH_MAKE_BEGIN()
+
+    NH_BYTE args_p[1024]; // TODO malloc
+    memset(args_p, 0, 1024);
+    for (int i = 0; i < Option_p->arguments; ++i) {
+        sprintf(args_p + strlen(args_p), "%s ", Option_p->arguments_pp[i]); 
+    }
+
+    nh_make_operationf(Option_p->longOption ? "--%s %s'%s'" : "-%s %s'%s'", Option_p->name_p, args_p, Option_p->description_p);
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
+static NH_MAKE_RESULT nh_make_executeOption(
+    nh_make_Runtime *Runtime_p, nh_make_Option *Option_p)
+{
+NH_MAKE_BEGIN()
+
+    NH_MAKE_CHECK(nh_make_printOption(Option_p))
+
+    if (!Option_p->Block_p) {
+        if (!strcmp(Option_p->name_p, "b")) {
+            NH_MAKE_CHECK(nh_make_build(Runtime_p, Option_p->arguments_pp[0]))
+        }
+        else if (!strcmp(Option_p->name_p, "i")) {
+        }
+        else if (!strcmp(Option_p->name_p, "t")) {
+            NH_MAKE_CHECK(nh_make_test(Runtime_p, Option_p->arguments_pp[0]))
+        }
+        else {NH_MAKE_DIAGNOSTIC_END(NH_MAKE_ERROR_BAD_STATE)}
+    }
+    else {
+        NH_MAKE_CHECK(nh_make_executeBlock(Runtime_p, &Option_p->Block_p->Block))
+    }
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
+// BUILD OPTIONS ===================================================================================
+
+static NH_MAKE_BOOL nh_make_buildOptionOverride(
+    nh_make_Runtime *Runtime_p, NH_BYTE *name_p)
+{
+NH_MAKE_BEGIN()
+
+    for (int j = 0; j < Runtime_p->ParserArray.length; ++j)
+    {
+        nh_make_Parser *Parser_p = &Runtime_p->ParserArray.Parsers_p[j];
+
+        for (int i = 0; i < Parser_p->definitions; ++i) 
+        {
+            nh_make_Definition *Definition_p = &Parser_p->Definitions_p[i];
+
+            if (Definition_p->type == NH_MAKE_DEFINITION_OPTION 
+            &&  !Definition_p->Option.longOption
+            &&  !strcmp(Definition_p->Option.name_p, "b") 
+            &&  Definition_p->Option.arguments == 1 
+            &&  (!strcmp(Definition_p->Option.arguments_pp[0], name_p) || !strcmp(nh_make_offsetBuildArgumentPrefix(Runtime_p, Definition_p->Option.arguments_pp[0]), name_p))) {
+                NH_MAKE_END(NH_MAKE_TRUE)
+            }
+        }
+    }
+
+NH_MAKE_END(NH_MAKE_FALSE)
+}
+
+NH_MAKE_RESULT nh_make_addBuildOption(
+    nh_make_Runtime *Runtime_p, NH_BYTE *name_p)
+{
+NH_MAKE_BEGIN()
+
+    if (nh_make_buildOptionOverride(Runtime_p, name_p)) {NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)}
+
+    static NH_BYTE *option_p = "b";
+
+    nh_make_Parser *Parser_p = &Runtime_p->ParserArray.Parsers_p[0];
+
+    Parser_p->Definitions_p = realloc(Parser_p->Definitions_p, sizeof(nh_make_Definition) * (Parser_p->definitions + 1));
+    NH_MAKE_CHECK_NULL(Parser_p->Definitions_p)
+
+    nh_make_Definition *Definition_p = &Parser_p->Definitions_p[Parser_p->definitions++];
+
+    NH_BYTE *description_p = malloc(strlen(name_p) + 7);
+    NH_MAKE_CHECK_NULL(description_p)
+    sprintf(description_p, "build %s", name_p);
+
+    NH_BYTE *argument_p = malloc(strlen(name_p) + 1);
+    NH_MAKE_CHECK_NULL(argument_p)
+    strcpy(argument_p, name_p);
+
+    NH_BYTE **arguments_pp = malloc(sizeof(NH_BYTE*));
+    NH_MAKE_CHECK_NULL(arguments_pp)
+    arguments_pp[0] = argument_p;
+
+    Definition_p->type = NH_MAKE_DEFINITION_OPTION;
+    Definition_p->Option.arguments     = 1;
+    Definition_p->Option.arguments_pp  = arguments_pp;
+    Definition_p->Option.longOption    = NH_MAKE_FALSE;
+    Definition_p->Option.name_p        = option_p;
+    Definition_p->Option.description_p = description_p;
+    Definition_p->Option.Block_p       = NULL;
+
+    nh_make_messagef("Generate Option '-b %s'", name_p);
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
+NH_MAKE_RESULT nh_make_addTestOption(
+    nh_make_Runtime *Runtime_p, NH_BYTE *name_p)
+{
+NH_MAKE_BEGIN()
+
+    static NH_BYTE *option_p = "t";
+
+    nh_make_Parser *Parser_p = &Runtime_p->ParserArray.Parsers_p[0];
+
+    Parser_p->Definitions_p = realloc(Parser_p->Definitions_p, sizeof(nh_make_Definition) * (Parser_p->definitions + 1));
+    NH_MAKE_CHECK_NULL(Parser_p->Definitions_p)
+
+    nh_make_Definition *Definition_p = &Parser_p->Definitions_p[Parser_p->definitions++];
+
+    NH_BYTE *description_p = malloc(strlen(name_p) + 7);
+    NH_MAKE_CHECK_NULL(description_p)
+    sprintf(description_p, "test %s", name_p);
+
+    NH_BYTE *argument_p = malloc(strlen(name_p) + 1);
+    NH_MAKE_CHECK_NULL(argument_p)
+    strcpy(argument_p, name_p);
+
+    NH_BYTE **arguments_pp = malloc(sizeof(NH_BYTE*));
+    NH_MAKE_CHECK_NULL(arguments_pp)
+    arguments_pp[0] = argument_p;
+
+    Definition_p->type = NH_MAKE_DEFINITION_OPTION;
+    Definition_p->Option.arguments     = 1;
+    Definition_p->Option.arguments_pp  = arguments_pp;
+    Definition_p->Option.longOption    = NH_MAKE_FALSE;
+    Definition_p->Option.name_p        = option_p;
+    Definition_p->Option.description_p = description_p;
+    Definition_p->Option.Block_p       = NULL;
+
+    nh_make_messagef("Generate Option '-t %s'", name_p);
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
+// PARSE ===========================================================================================
+
+static NH_MAKE_RESULT nh_make_parseShortOption(
+    nh_make_Runtime *Runtime_p, NH_BYTE *name_p, int optArgsCount, NH_BYTE **optArgs_pp, int *parsedOptArgs_p)
+{
+NH_MAKE_BEGIN()
+
+    for (int i = 0; i < optArgsCount; ++i) 
+    {
+        int options = 0;
+        nh_make_Option *Options_p = nh_make_getShortOptions(Runtime_p, name_p, &optArgs_pp[i], 1, &options);
+        if (Options_p) {
+            for (int j = 0; j < options; ++j) {
+                NH_MAKE_CHECK(nh_make_executeOption(Runtime_p, Options_p+j))
+            }
+            if (options > 1) {free(Options_p);}
+        }
+        *parsedOptArgs_p += 1;
+    }
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
+static NH_MAKE_RESULT nh_make_parseLongOption(
+    nh_make_Runtime *Runtime_p, NH_BYTE *name_p, int optArgsCount, NH_BYTE **optArgs_pp, int *parsedOptArgs_p)
+{
+NH_MAKE_BEGIN()
+
+    nh_make_Option *Option_p = NULL;
+
+    // Get trivial option.
+    if (optArgsCount == 0) {
+        Option_p = nh_make_getOption(Runtime_p, name_p, 0, NULL);
+        if (!Option_p) {
+            NH_MAKE_END(NH_MAKE_ERROR_INVALID_OPTION)
+        }
+        *parsedOptArgs_p = 0;
+    }
+
+    // Get option which matches the most arguments.
+    for (int i = optArgsCount; i > 0; --i) {
+        Option_p = nh_make_getOption(Runtime_p, name_p, i, optArgs_pp);
+        if (Option_p) {
+            *parsedOptArgs_p = i;
+            break;
+        }
+    }
+
+    if (!Option_p) {
+        NH_MAKE_END(NH_MAKE_ERROR_INVALID_OPTION)
+    }
+
+    NH_MAKE_CHECK(nh_make_executeOption(Runtime_p, Option_p))
+ 
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
+NH_MAKE_RESULT nh_make_parseOption(
+    nh_make_Runtime *Runtime_p, int optionLength, NH_BYTE **option_pp, int *advance_p)
+{
+NH_MAKE_BEGIN()
+
+    for (int i = 0, advance = 0; i < optionLength; i += advance) 
+    {
+        NH_BYTE **optArgs_pp = NULL;
+        int optArgsCount = 0;
+        if (i == 0) {
+            if (optionLength > 1) {
+                optArgs_pp = option_pp+1;
+                optArgsCount = optionLength-1;
+            }
+        }
+        else {
+            optArgs_pp = option_pp+i;
+            optArgsCount = optionLength - i;
+        } 
+
+        int parsedOptArgs = 0;
+
+        if (option_pp[0][0] == '-' && option_pp[0][1] != '-') {
+            NH_MAKE_CHECK(nh_make_parseShortOption(Runtime_p, option_pp[0]+1, optArgsCount, optArgs_pp, &parsedOptArgs))
+        }
+        else if (option_pp[0][0] == '-' && option_pp[0][1] == '-') {
+            NH_MAKE_CHECK(nh_make_parseLongOption(Runtime_p, option_pp[0]+2, optArgsCount, optArgs_pp, &parsedOptArgs))
+        }
+        else {
+            NH_MAKE_DIAGNOSTIC_END(NH_MAKE_ERROR_INVALID_OPTION)
+        }
+
+        advance = i ? parsedOptArgs : parsedOptArgs + 1;
+        *advance_p += advance;
+    }
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
diff --git a/src/lib/nhmake/Core/Options.h b/src/lib/nhmake/Core/Options.h
new file mode 100644
index 0000000..38f38b6
--- /dev/null
+++ b/src/lib/nhmake/Core/Options.h
@@ -0,0 +1,39 @@
+#ifndef NH_MAKE_OPTIONS_H
+#define NH_MAKE_OPTIONS_H
+
+#ifndef DOXYGEN_SHOULD_SKIP_THIS
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+#include "Source.h"
+
+#include "../Common/Types/Private.h"
+
+#include "../Parser/Parser.h"
+#include "../Parser/Variables.h"
+
+#endif
+
+/** @addtogroup lib_nhmake_functions
+ *  @{
+ */
+
+    NH_MAKE_RESULT nh_make_addBuildOption(
+        nh_make_Runtime *Runtime_p, NH_BYTE *name_p
+    );
+
+    NH_MAKE_RESULT nh_make_addTestOption(
+        nh_make_Runtime *Runtime_p, NH_BYTE *name_p
+    );
+
+    NH_MAKE_RESULT nh_make_parseOption(
+        nh_make_Runtime *Runtime_p, int optionLength, NH_BYTE **argv_pp, int *advance_p
+    );
+
+/** @} */
+
+#endif
diff --git a/src/lib/nhmake/Core/Runtime.c b/src/lib/nhmake/Core/Runtime.c
new file mode 100644
index 0000000..4c25ab0
--- /dev/null
+++ b/src/lib/nhmake/Core/Runtime.c
@@ -0,0 +1,288 @@
+// LICENSE NOTICE ==================================================================================
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+// INCLUDE =========================================================================================
+
+#include "Runtime.h"
+#include "Thread.h"
+#include "File.h"
+#include "Build.h"
+#include "Options.h"
+#include "Utils.h"
+
+#include "../Parser/Functions.h"
+#include "../Parser/Variables.h"
+
+#include "../Common/Macros/Macros.h"
+#include NH_MAKE_FLOW
+#include NH_MAKE_DEFAULT_CHECK
+
+#include <stdio.h>
+#include <string.h>
+#include <stdlib.h>
+#include <ctype.h>
+
+// VARS ============================================================================================
+
+nh_make_Runtime NH_MAKE_DEFAULT_RUNTIME;
+
+// HELPER ==========================================================================================
+
+NH_MAKE_RESULT nh_make_stringifySourceContextNameAndVersion(
+    nh_make_SourceContext *SourceContext_p, NH_BYTE string_p[255])
+{
+NH_MAKE_BEGIN()
+
+    memset(string_p, 0, 255);
+
+    sprintf(
+        string_p, "%s %s v.%d.%d.%d.%d",
+        SourceContext_p->type == NH_MAKE_SOURCE_CONTEXT_BINARY ? "bin" : "lib", 
+        SourceContext_p->name_p,
+        SourceContext_p->Version.api, SourceContext_p->Version.major, SourceContext_p->Version.minor, 
+        SourceContext_p->Version.patch
+    );
+
+NH_MAKE_END(NH_MAKE_SUCCESS)
+}
+
+// PARSE ===========================================================================================
+
+static int nh_make_getOptionLength(
+    int argc, NH_BYTE **argv_pp)
+{
+NH_MAKE_BEGIN()
+
+    int length = 0;
+
+    for (int i = 0; i < argc; ++i) {
+        if (i && argv_pp[i][0] == '-') {break;}
+        length++;
+    }
+
+NH_MAKE_END(length)
+}
+
+static NH_MAKE_RESULT nh_make_parseArguments(
+    nh_make_Runtime *Runtime_p, int argc, NH_BYTE **argv_pp)
+{
+NH_MAKE_BEGIN()
+
+    for (int i = 0; i < argc;) {
+        int advance = 0;
+        int optionLength = nh_make_getOptionLength(argc-i, argv_pp+i);
+        NH_MAKE_CHECK(nh_make_parseOption(Runtime_p, optionLength, &argv_pp[i], &advance))
+        if (optionLength != advance) {
+            NH_MAKE_DIAGNOSTIC_END(NH_MAKE_ERROR_BAD_STATE)
+        }
+        i += advance;
+    }
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
+// RUN =============================================================================================
+
+NH_BYTE **nh_make_processArguments(
+    nh_make_VariableArray *Variables_p, NH_BYTE **args_pp, int args, int *processedArgCount_p)
+{
+NH_MAKE_BEGIN()
+
+#include NH_MAKE_CUSTOM_CHECK
+
+    int processedArgCount = 0;
+    NH_BYTE **processedArgs_pp = malloc(sizeof(NH_BYTE*)); 
+    NH_MAKE_CHECK_NULL(NULL, processedArgs_pp)    
+
+    for (int i = 0; i < args; ++i) 
+    {
+        nh_make_Variable *Variable_p = nh_make_getVariable(Variables_p, args_pp[i]);
+        if (Variable_p) {
+            for (int j = 0; j < Variable_p->valueCount; ++j) {
+                processedArgs_pp[processedArgCount] = malloc(strlen(Variable_p->values_pp[j]) + 1);
+                NH_MAKE_CHECK_NULL(NULL, processedArgs_pp[processedArgCount])
+                strcpy(processedArgs_pp[processedArgCount++], Variable_p->values_pp[j]);
+                processedArgs_pp = realloc(processedArgs_pp, sizeof(NH_BYTE*) * (processedArgCount + 1));
+                NH_MAKE_CHECK_NULL(NULL, processedArgs_pp)
+            } 
+        }
+        else {
+            processedArgs_pp[processedArgCount] = malloc(strlen(args_pp[i]) + 1);
+            NH_MAKE_CHECK_NULL(NULL, processedArgs_pp[processedArgCount])
+            strcpy(processedArgs_pp[processedArgCount++], args_pp[i]);
+            processedArgs_pp = realloc(processedArgs_pp, sizeof(NH_BYTE*) * (processedArgCount + 1));
+            NH_MAKE_CHECK_NULL(NULL, processedArgs_pp)
+        }
+    }
+
+#include NH_MAKE_DEFAULT_CHECK
+
+    *processedArgCount_p = processedArgCount;
+
+NH_MAKE_END(processedArgs_pp)
+}
+
+static NH_MAKE_RESULT nh_make_executeGlobalFunctions(
+    nh_make_Runtime *Runtime_p, nh_make_Parser *Parser_p)
+{
+NH_MAKE_BEGIN()
+
+    if (Parser_p->executed) {NH_MAKE_END(NH_MAKE_SUCCESS)}
+
+    nh_make_Block Block;
+    Block.definitions = Parser_p->definitions;
+    Block.Definitions_p = Parser_p->Definitions_p;
+
+    NH_MAKE_CHECK(nh_make_executeBlock(Runtime_p, &Block))
+
+    Parser_p->executed = NH_MAKE_TRUE;
+
+NH_MAKE_END(NH_MAKE_SUCCESS)
+}
+
+NH_MAKE_RESULT nh_make_executeRuntime(
+    nh_make_Runtime *Runtime_p, NH_BYTE **args_pp, int args)
+{
+NH_MAKE_BEGIN()
+
+    for (int i = 0; i < Runtime_p->FileArray.length; ++i) 
+    {
+        NH_MAKE_CHECK(nh_make_appendParser(
+            &Runtime_p->ParserArray, &Runtime_p->FileArray.Files_p[i], Runtime_p->showParseTree
+        ))
+
+        nh_make_operationf("Execute Global Functions");
+        nh_make_Parser *Parser_p = &Runtime_p->ParserArray.Parsers_p[Runtime_p->ParserArray.length - 1];
+
+        if (Parser_p->executed) {continue;}
+        NH_MAKE_CHECK(nh_make_executeGlobalFunctions(Runtime_p, Parser_p))
+        Parser_p->executed = NH_MAKE_TRUE;
+
+        nh_make_Variable *All_p = nh_make_getVariable(&Runtime_p->VariableArray, "ALL");
+        for (int j = 0; All_p && j < All_p->valueCount; ++j) {
+            NH_MAKE_CHECK(nh_make_addBuildOption(Runtime_p, All_p->values_pp[j]))
+            NH_MAKE_CHECK(nh_make_addTestOption(Runtime_p, All_p->values_pp[j]))
+        }
+    }
+    
+    int processedArgs = 0;
+    NH_BYTE **processedArgs_pp = nh_make_processArguments(&Runtime_p->VariableArray, args_pp, args, &processedArgs);
+    NH_MAKE_CHECK_NULL(processedArgs_pp)
+
+    NH_MAKE_RESULT result = nh_make_parseArguments(Runtime_p, processedArgs, processedArgs_pp);
+
+    for (int i = 0; i < processedArgs; ++i) {
+        free(processedArgs_pp[i]);
+    }
+    free(processedArgs_pp);
+
+    NH_MAKE_CHECK(nh_make_exitMessage(result))
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
+NH_MAKE_RESULT nh_make_run(
+    nh_make_Runtime *Runtime_p, int argc, NH_BYTE **argv_pp)
+{
+NH_MAKE_BEGIN()
+NH_MAKE_DIAGNOSTIC_END(nh_make_runThread(Runtime_p, argv_pp, argc))
+} 
+
+// CREATE ==========================================================================================
+
+static NH_MAKE_RESULT nh_make_initRuntime(
+    nh_make_Runtime *Runtime_p)
+{
+NH_MAKE_BEGIN()
+
+    Runtime_p->showParseTree = NH_MAKE_TRUE;
+    Runtime_p->GUI = NH_MAKE_FALSE;
+    Runtime_p->quiet = NH_MAKE_FALSE;
+
+    Runtime_p->functionCallback_f      = NULL;
+    Runtime_p->sourceContextCallback_f = NULL;
+    Runtime_p->beforeBuildCallback_f   = NULL;
+    Runtime_p->afterBuildCallback_f    = NULL;
+
+    nh_make_initFileArray(&Runtime_p->FileArray);
+    nh_make_initParserArray(&Runtime_p->ParserArray);
+    nh_make_initTestArray(&Runtime_p->TestArray);
+    nh_make_initSourceArray(&Runtime_p->SourceArray);
+    nh_make_initSourceContextArray(&Runtime_p->SourceContextArray);
+    nh_make_initVariableArray(&Runtime_p->VariableArray);
+
+    NH_BYTE *wrk_p = nh_make_getWorkDirectory();
+
+    nh_make_updateVariable(&Runtime_p->VariableArray, "WRK_DIR", &wrk_p, 1);
+    nh_make_updateVariable(&Runtime_p->VariableArray, "PROJ_DIR", &wrk_p, 1);
+    nh_make_updateVariable(&Runtime_p->VariableArray, "LIB_DEST", &wrk_p, 1);
+    nh_make_updateVariable(&Runtime_p->VariableArray, "BIN_DEST", &wrk_p, 1);
+
+    NH_BYTE *true_p = "true";
+
+#ifdef __APPLE__
+    nh_make_updateVariable(&Runtime_p->VariableArray, "MAC", &true_p, 1);
+#elif WIN32 
+    nh_make_updateVariable(&Runtime_p->VariableArray, "WINDOWS", &true_p, 1);
+#elif __linux__
+    nh_make_updateVariable(&Runtime_p->VariableArray, "LINUX", &true_p, 1);
+#endif
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
+nh_make_Runtime *nh_make_createRuntime(
+    NH_BYTE *name_p)
+{
+NH_MAKE_BEGIN()
+
+#include NH_MAKE_CUSTOM_CHECK
+
+    NH_MAKE_CHECK_NULL(NULL, name_p)
+
+    nh_make_Runtime *Runtime_p = malloc(sizeof(nh_make_Runtime));
+    NH_MAKE_CHECK_NULL(NULL, Runtime_p)
+
+    NH_MAKE_CHECK(NULL, nh_make_initRuntime(Runtime_p))
+
+    nh_make_updateVariable(&Runtime_p->VariableArray, "NAME", &name_p, 1);
+
+#include NH_MAKE_DEFAULT_CHECK
+
+NH_MAKE_END(Runtime_p)
+}
+
+void nh_make_destroyRuntime(
+    nh_make_Runtime *Runtime_p)
+{
+NH_MAKE_BEGIN()
+
+    // TODO Implement.
+
+NH_MAKE_SILENT_END()
+}
+
+// INITIALIZE/TERMINATE ============================================================================
+
+NH_MAKE_RESULT nh_make_initialize()
+{
+    nh_make_initThreadPool();
+    NH_MAKE_CHECK(nh_make_initRuntime(&NH_MAKE_DEFAULT_RUNTIME))
+    NH_BYTE *name_p = "selfmake";
+    nh_make_updateVariable(&NH_MAKE_DEFAULT_RUNTIME.VariableArray, "NAME", &name_p, 1);
+}
+
+void nh_make_terminate()
+{
+NH_MAKE_BEGIN()
+
+    // TODO Implement.
+
+NH_MAKE_SILENT_END()
+}
+
diff --git a/src/lib/nhmake/Core/Runtime.h b/src/lib/nhmake/Core/Runtime.h
new file mode 100644
index 0000000..a4ff012
--- /dev/null
+++ b/src/lib/nhmake/Core/Runtime.h
@@ -0,0 +1,92 @@
+#ifndef NH_MAKE_RUNTIME_H
+#define NH_MAKE_RUNTIME_H
+
+#ifndef DOXYGEN_SHOULD_SKIP_THIS
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+#include "Source.h"
+
+#include "../Parser/Parser.h"
+#include "../Parser/Variables.h"
+
+#include "../Test/Test.h"
+
+#include "../Common/Types/Private.h"
+
+#endif
+
+/** @addtogroup lib_nhmake_structs
+ *  @{
+ */
+
+    typedef struct nh_make_Runtime {
+        NH_MAKE_BOOL quiet;
+        NH_MAKE_BOOL GUI;
+        NH_MAKE_BOOL showParseTree;
+        NH_BYTE *prefix_p;
+        nh_make_ParserArray ParserArray;
+        nh_make_SourceArray SourceArray; 
+        nh_make_TestArray TestArray;
+        nh_make_SourceContextArray SourceContextArray; 
+        nh_make_VariableArray VariableArray; 
+        nh_make_FileArray FileArray; 
+        nh_make_functionCallback_f functionCallback_f;
+        nh_make_sourceContextCallback_f sourceContextCallback_f;
+        nh_make_sourceContextCallback_f beforeBuildCallback_f;
+        nh_make_sourceContextCallback_f afterBuildCallback_f;
+    } nh_make_Runtime;
+
+/** @} */
+
+/** @addtogroup lib_nhmake_vars
+ *  @{
+ */
+
+    extern nh_make_Runtime NH_MAKE_DEFAULT_RUNTIME;
+
+/** @} */
+
+/** @addtogroup lib_nhmake_typedefs
+ *  @{
+ */
+
+    typedef NH_MAKE_RESULT (*nh_make_initialize_f)(
+    );
+    
+    typedef void (*nh_make_terminate_f)(
+    );
+
+    typedef nh_make_Runtime *(*nh_make_createRuntime_f)(
+        NH_BYTE *name_p
+    );
+    
+    typedef void (*nh_make_destroyRuntime_f)(
+        nh_make_Runtime *Runtime_p
+    );
+
+    typedef NH_MAKE_RESULT (*nh_make_run_f)(
+        nh_make_Runtime *Runtime_p, int argc, NH_BYTE **argv_pp
+    );
+
+    typedef NH_MAKE_RESULT (*nh_make_stringifySourceContextNameAndVersion_f)(
+        nh_make_SourceContext *SourceContext_p, NH_BYTE string_p[255]
+    );
+
+/** @} */
+
+/** @addtogroup lib_nhmake_functions
+ *  @{
+ */
+
+    NH_MAKE_RESULT nh_make_executeRuntime(
+        nh_make_Runtime *Runtime_p, NH_BYTE **args_pp, int args
+    );
+
+/** @} */
+
+#endif
diff --git a/src/lib/nhmake/Core/Source.c b/src/lib/nhmake/Core/Source.c
new file mode 100644
index 0000000..b3a45ce
--- /dev/null
+++ b/src/lib/nhmake/Core/Source.c
@@ -0,0 +1,313 @@
+// LICENSE NOTICE ==================================================================================
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+// INCLUDE =========================================================================================
+
+#include "Source.h"
+#include "Runtime.h"
+#include "Version.h"
+
+#include "../Common/Macros/Macros.h"
+#include NH_MAKE_FLOW
+#include NH_MAKE_DEFAULT_CHECK
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <ctype.h>
+
+// INIT ============================================================================================
+
+void nh_make_initSourceContextArray(
+    nh_make_SourceContextArray *Array_p)
+{
+NH_MAKE_BEGIN()
+
+    Array_p->length = 0;
+    Array_p->maxNameLength = 0;
+    Array_p->SourceContexts_p = NULL;
+
+NH_MAKE_SILENT_END()
+}
+
+static nh_make_SourceContext nh_make_initSourceContext(
+    NH_MAKE_SOURCE_CONTEXT type)
+{
+NH_MAKE_BEGIN()
+
+    nh_make_SourceContext SourceContext;
+
+    SourceContext.type = type;
+    SourceContext.path_p = NULL;
+    SourceContext.compileArgs_p = NULL;
+    SourceContext.linkArgs_p = NULL;
+    SourceContext.Version = nh_make_initVersion();
+    SourceContext.outputPath_p = NULL;
+
+NH_MAKE_END(SourceContext)
+}
+
+void nh_make_initSourceArray(
+    nh_make_SourceArray *Array_p)
+{
+NH_MAKE_BEGIN()
+
+    Array_p->length = 0;
+    Array_p->Sources_p = NULL;
+
+NH_MAKE_SILENT_END()
+}
+
+static nh_make_Source nh_make_initSource()
+{
+NH_MAKE_BEGIN()
+
+    nh_make_Source Source;
+    Source.Context_p = NULL;
+    Source.path_p = NULL;
+
+NH_MAKE_END(Source)
+}
+
+// INDENT ==========================================================================================
+
+void nh_make_getIndentAfterSourceContext(
+    NH_BYTE *name_p, NH_BYTE *buffer_p, int size, nh_make_SourceContextArray *Array_p)
+{
+NH_MAKE_BEGIN()
+
+    memset(buffer_p, 0, size);
+    int diff = Array_p->maxNameLength - strlen(name_p);
+    for (int i = 0; i < diff; ++i) {buffer_p[i] = ' ';}
+
+NH_MAKE_SILENT_END()
+}
+
+// ADD =============================================================================================
+
+static NH_MAKE_BOOL nh_make_matchSourceContext(
+    nh_make_SourceContext *SourceContext_p, NH_MAKE_SOURCE_CONTEXT type)
+{
+NH_MAKE_BEGIN()
+
+    if (type != NH_MAKE_SOURCE_CONTEXT_UNDEFINED) {
+        if (type == NH_MAKE_SOURCE_CONTEXT_BINARY && SourceContext_p->type != NH_MAKE_SOURCE_CONTEXT_BINARY) {
+            NH_MAKE_END(NH_MAKE_FALSE)
+        }
+        if ((type == NH_MAKE_SOURCE_CONTEXT_SHARED_LIBRARY || type == NH_MAKE_SOURCE_CONTEXT_STATIC_LIBRARY) && SourceContext_p->type == NH_MAKE_SOURCE_CONTEXT_BINARY) {
+            NH_MAKE_END(NH_MAKE_FALSE)
+        }
+    }
+
+NH_MAKE_END(NH_MAKE_TRUE)
+}
+
+NH_MAKE_RESULT nh_make_addSourceContext(
+    nh_make_Runtime *Runtime_p, nh_make_Function *Function_p, NH_MAKE_SOURCE_CONTEXT type, int offset)
+{
+NH_MAKE_BEGIN()
+
+    nh_make_SourceContextArray *Array_p = &Runtime_p->SourceContextArray;
+
+    if (Function_p->arguments < 1) {NH_MAKE_DIAGNOSTIC_END(NH_MAKE_ERROR_BAD_STATE)}
+
+    if (!Array_p->SourceContexts_p) {
+        Array_p->SourceContexts_p = malloc(sizeof(nh_make_SourceContext));
+        NH_MAKE_CHECK_NULL(Array_p->SourceContexts_p)
+    }
+    else {
+        Array_p->SourceContexts_p = realloc(Array_p->SourceContexts_p, sizeof(nh_make_SourceContext) * (Array_p->length + 1));
+        NH_MAKE_CHECK_NULL(Array_p->SourceContexts_p)
+    }
+
+    nh_make_SourceContext *SourceContext_p = &Array_p->SourceContexts_p[Array_p->length];
+    *SourceContext_p = nh_make_initSourceContext(type);
+
+    int index = offset;
+
+    SourceContext_p->name_p = malloc(strlen(Function_p->arguments_pp[index]) + 1);
+    NH_MAKE_CHECK_NULL(SourceContext_p->name_p)
+    strcpy(SourceContext_p->name_p, Function_p->arguments_pp[index++]);
+
+    if (Function_p->arguments > index) {
+        SourceContext_p->path_p = malloc(strlen(Function_p->arguments_pp[index]) + 1);
+        NH_MAKE_CHECK_NULL(SourceContext_p->path_p)
+        strcpy(SourceContext_p->path_p, Function_p->arguments_pp[index++]);
+    }
+
+    if (Function_p->arguments > index) {
+        SourceContext_p->outputPath_p = malloc(strlen(Function_p->arguments_pp[index]) + 1);
+        NH_MAKE_CHECK_NULL(SourceContext_p->outputPath_p)
+        strcpy(SourceContext_p->outputPath_p, Function_p->arguments_pp[index++]);
+    }
+
+    if (Function_p->arguments > index) {
+        SourceContext_p->Version.major = strtol(Function_p->arguments_pp[index++], NULL, 10);
+    }
+
+    if (Function_p->arguments > index) {
+        SourceContext_p->Version.minor = strtol(Function_p->arguments_pp[index++], NULL, 10);
+    }
+
+    if (Function_p->arguments > index) {
+        SourceContext_p->Version.patch = strtol(Function_p->arguments_pp[index++], NULL, 10);
+    }
+
+    if (strlen(SourceContext_p->name_p) > Array_p->maxNameLength) {
+        Array_p->maxNameLength = strlen(SourceContext_p->name_p);
+    }
+
+    Array_p->length++;
+
+    NH_MAKE_CHECK(nh_make_appendToVariable(&Runtime_p->VariableArray, "ALL", &Function_p->arguments_pp[offset], 1))
+
+    if (type == NH_MAKE_SOURCE_CONTEXT_BINARY) {
+        NH_MAKE_CHECK(nh_make_appendToVariable(&Runtime_p->VariableArray, "BINS", &Function_p->arguments_pp[offset], 1))
+    }
+    else {
+        NH_MAKE_CHECK(nh_make_appendToVariable(&Runtime_p->VariableArray, "LIBS", &Function_p->arguments_pp[offset], 1))
+    }
+
+    NH_MAKE_CHECK(nh_make_computeVersion(Runtime_p, SourceContext_p))
+
+    switch (type)
+    {
+        case NH_MAKE_SOURCE_CONTEXT_BINARY :
+            nh_make_messagef("Add binary [%s]", SourceContext_p->name_p);
+            break;
+        case NH_MAKE_SOURCE_CONTEXT_SHARED_LIBRARY :
+            nh_make_messagef("Add shared library [%s]", SourceContext_p->name_p);
+            break;
+        case NH_MAKE_SOURCE_CONTEXT_STATIC_LIBRARY :
+            nh_make_messagef("Add static library [%s]", SourceContext_p->name_p);
+            break;
+    }
+
+NH_MAKE_END(NH_MAKE_SUCCESS)
+}
+
+// ARGUMENTS =======================================================================================
+
+NH_MAKE_RESULT nh_make_addCompileArguments(
+    nh_make_SourceContextArray *ContextArray_p, nh_make_Function *Function_p, NH_MAKE_SOURCE_CONTEXT type)
+{
+NH_MAKE_BEGIN()
+
+    if (Function_p->arguments < 2) {NH_MAKE_DIAGNOSTIC_END(NH_MAKE_ERROR_BAD_STATE)}
+
+    nh_make_SourceContext *Context_p = NULL;
+    for (int j = 0; j < ContextArray_p->length; ++j) {
+        if (!nh_make_matchSourceContext(ContextArray_p->SourceContexts_p+j, type)) {
+            continue;
+        }
+        if (!strcmp(ContextArray_p->SourceContexts_p[j].name_p, Function_p->arguments_pp[0])) {
+            Context_p = &ContextArray_p->SourceContexts_p[j];
+        }
+    }
+
+    if (!Context_p) {NH_MAKE_DIAGNOSTIC_END(NH_MAKE_ERROR_LIBRARY_NOT_FOUND)}
+
+    Context_p->compileArgs_p = malloc(strlen(Function_p->arguments_pp[1]) + 1);
+    NH_MAKE_CHECK_NULL(Context_p->compileArgs_p)
+    sprintf(Context_p->compileArgs_p, Function_p->arguments_pp[1]);
+
+    NH_BYTE offset_p[64];
+    nh_make_getIndentAfterSourceContext(Context_p->name_p, offset_p, 64, ContextArray_p);
+    nh_make_messagef("[%s]%s Set compile arguments \"%s\"", Context_p->name_p, offset_p, Context_p->compileArgs_p);
+
+NH_MAKE_END(NH_MAKE_SUCCESS)
+}
+
+NH_MAKE_RESULT nh_make_addLinkArguments(
+    nh_make_SourceContextArray *ContextArray_p, nh_make_Function *Function_p, NH_MAKE_SOURCE_CONTEXT type)
+{
+NH_MAKE_BEGIN()
+
+    if (Function_p->arguments != 2) {NH_MAKE_DIAGNOSTIC_END(NH_MAKE_ERROR_BAD_STATE)}
+
+    nh_make_SourceContext *Context_p = NULL;
+    for (int j = 0; j < ContextArray_p->length; ++j) {
+        if (!nh_make_matchSourceContext(ContextArray_p->SourceContexts_p+j, type)) {
+            continue;
+        }
+        if (!strcmp(ContextArray_p->SourceContexts_p[j].name_p, Function_p->arguments_pp[0])) {
+            Context_p = &ContextArray_p->SourceContexts_p[j];
+        }
+    }
+
+    if (!Context_p) {NH_MAKE_DIAGNOSTIC_END(NH_MAKE_ERROR_LIBRARY_NOT_FOUND)}
+
+    Context_p->linkArgs_p = malloc(strlen(Function_p->arguments_pp[1]) + 1);
+    NH_MAKE_CHECK_NULL(Context_p->linkArgs_p)
+    sprintf(Context_p->linkArgs_p, Function_p->arguments_pp[1]);
+
+    NH_BYTE offset_p[64];
+    nh_make_getIndentAfterSourceContext(Context_p->name_p, offset_p, 64, ContextArray_p);
+    nh_make_messagef("[%s]%s Set link arguments \"%s\"", Context_p->name_p, offset_p, Context_p->linkArgs_p);
+
+NH_MAKE_END(NH_MAKE_SUCCESS)
+}
+
+// SOURCES =========================================================================================
+
+NH_MAKE_RESULT nh_make_addSource(
+    nh_make_SourceContextArray *ContextArray_p, nh_make_SourceArray *SourceArray_p, nh_make_Function *Function_p, 
+    NH_MAKE_SOURCE_CONTEXT type)
+{
+NH_MAKE_BEGIN()
+
+    nh_make_SourceContext *Context_p = NULL;
+
+    for (int i = 0; i < Function_p->arguments; ++i) 
+    {
+        if (Function_p->argumentTypes_p[i] == NH_MAKE_TOKEN_IDENTIFIER) {
+            for (int j = 0; j < ContextArray_p->length; ++j) {
+                if (!nh_make_matchSourceContext(ContextArray_p->SourceContexts_p+j, type)) {
+                    continue;
+                }
+                if (!strcmp(ContextArray_p->SourceContexts_p[j].name_p, Function_p->arguments_pp[i])) {
+                    Context_p = &ContextArray_p->SourceContexts_p[j];
+                }
+            }
+        }
+        else {
+
+            if (!Context_p) {
+                if (!ContextArray_p->length) {NH_MAKE_DIAGNOSTIC_END(NH_MAKE_ERROR_BAD_STATE)}
+                Context_p = ContextArray_p->SourceContexts_p;
+            }
+
+            if (!SourceArray_p->Sources_p) {
+                SourceArray_p->Sources_p = malloc(sizeof(nh_make_Source));
+                NH_MAKE_CHECK_NULL(SourceArray_p->Sources_p)
+            }
+            else {
+                SourceArray_p->Sources_p = realloc(SourceArray_p->Sources_p, sizeof(nh_make_Source) * (SourceArray_p->length + 1));
+                NH_MAKE_CHECK_NULL(SourceArray_p->Sources_p)
+            }
+        
+            nh_make_Source *Source_p = &SourceArray_p->Sources_p[SourceArray_p->length];
+            *Source_p = nh_make_initSource();
+
+            Source_p->Context_p = Context_p;
+            Source_p->path_p = malloc(strlen(Function_p->arguments_pp[i]) + 1);
+            NH_MAKE_CHECK_NULL(Source_p->path_p)
+            sprintf(Source_p->path_p, Function_p->arguments_pp[i]);
+        
+            SourceArray_p->length++;
+
+            NH_BYTE offset_p[64];
+            nh_make_getIndentAfterSourceContext(Context_p->name_p, offset_p, 64, ContextArray_p);
+            nh_make_messagef("[%s]%s Add source file (%d) \"%s\"", Context_p->name_p, offset_p, Context_p->type, Source_p->path_p);
+        }
+    }
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
diff --git a/src/lib/nhmake/Core/Source.h b/src/lib/nhmake/Core/Source.h
new file mode 100644
index 0000000..8f91e6e
--- /dev/null
+++ b/src/lib/nhmake/Core/Source.h
@@ -0,0 +1,67 @@
+#ifndef NH_MAKE_SOURCE_H
+#define NH_MAKE_SOURCE_H
+
+#ifndef DOXYGEN_SHOULD_SKIP_THIS
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+#include "../Common/Types/Private.h"
+
+#endif
+
+/** @addtogroup lib_nhmake_structs
+ *  @{
+ */
+
+    typedef struct nh_make_Source {
+        nh_make_SourceContext *Context_p;
+        NH_BYTE *path_p;
+    } nh_make_Source;
+
+    typedef struct nh_make_SourceArray {
+        int length;
+        nh_make_Source *Sources_p;
+    } nh_make_SourceArray;
+
+/** @} */
+
+/** @addtogroup lib_nhmake_functions
+ *  @{
+ */
+
+    void nh_make_initSourceArray(
+        nh_make_SourceArray *Array_p
+    );
+
+    NH_MAKE_RESULT nh_make_addSource(
+        nh_make_SourceContextArray *ContextArray_p, nh_make_SourceArray *SourceArray_p, nh_make_Function *Function_p,
+        NH_MAKE_SOURCE_CONTEXT type
+    );
+
+    void nh_make_initSourceContextArray(
+        nh_make_SourceContextArray *Array_p
+    );
+
+    void nh_make_getIndentAfterSourceContext(
+        NH_BYTE *name_p, NH_BYTE *buffer_p, int size, nh_make_SourceContextArray *Array_p
+    );
+
+    NH_MAKE_RESULT nh_make_addSourceContext(
+        nh_make_Runtime *Runtime_p, nh_make_Function *Function_p, NH_MAKE_SOURCE_CONTEXT type, int offset
+    );
+
+    NH_MAKE_RESULT nh_make_addCompileArguments(
+        nh_make_SourceContextArray *ContextArray_p, nh_make_Function *Function_p, NH_MAKE_SOURCE_CONTEXT type
+    );
+    
+    NH_MAKE_RESULT nh_make_addLinkArguments(
+        nh_make_SourceContextArray *Array_p, nh_make_Function *Function_p, NH_MAKE_SOURCE_CONTEXT type
+    );
+
+/** @} */
+
+#endif
diff --git a/external/selfmake/src/lib/Core/Thread.c b/src/lib/nhmake/Core/Thread.c
similarity index 50%
rename from external/selfmake/src/lib/Core/Thread.c
rename to src/lib/nhmake/Core/Thread.c
index 8ec1beb..a72002d 100644
--- a/external/selfmake/src/lib/Core/Thread.c
+++ b/src/lib/nhmake/Core/Thread.c
@@ -1,8 +1,8 @@
 // LICENSE NOTICE ==================================================================================
 
 /**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
  * Published under MIT
  */
 
@@ -11,8 +11,8 @@
 #include "Thread.h"
 
 #include "../Common/Macros/Macros.h"
-#include SM_FLOW
-#include SM_DEFAULT_CHECK
+#include NH_MAKE_FLOW
+#include NH_MAKE_DEFAULT_CHECK
 
 #include <string.h>
 #include <stdio.h>
@@ -31,127 +31,127 @@
 
 // DATA ============================================================================================
 
-typedef struct sm_ThreadPool {
-    sm_Thread Threads_p[SM_MAX_THREADS];
+typedef struct nh_make_ThreadPool {
+    nh_make_Thread Threads_p[NH_MAKE_MAX_THREADS];
     int threadCount;    
-} sm_ThreadPool;
+} nh_make_ThreadPool;
 
-static sm_ThreadPool SM_THREAD_POOL;
+static nh_make_ThreadPool NH_MAKE_THREAD_POOL;
 
 // INIT ============================================================================================
 
-static inline void sm_initThread(
-    sm_Thread *Thread_p)
+static inline void nh_make_initThread(
+    nh_make_Thread *Thread_p)
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
     Thread_p->depth = 0;
     Thread_p->id = 0;
-    Thread_p->running = SM_FALSE;
+    Thread_p->running = NH_MAKE_FALSE;
     Thread_p->Runtime_p = NULL;
 
-SM_SILENT_END()
+NH_MAKE_SILENT_END()
 }
 
-void sm_initThreadPool()
+void nh_make_initThreadPool()
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
-    SM_THREAD_POOL.threadCount = 0;
+    NH_MAKE_THREAD_POOL.threadCount = 0;
 
-    for (int i = 0; i < SM_MAX_THREADS; ++i) {
-        sm_initThread(&SM_THREAD_POOL.Threads_p[i]);
+    for (int i = 0; i < NH_MAKE_MAX_THREADS; ++i) {
+        nh_make_initThread(&NH_MAKE_THREAD_POOL.Threads_p[i]);
     }
 
-SM_SILENT_END()
+NH_MAKE_SILENT_END()
 }
 
 // RUN =============================================================================================
 
-typedef struct sm_ThreadArguments {
-    SM_BYTE **args_pp;
+typedef struct nh_make_ThreadArguments {
+    NH_BYTE **args_pp;
     int args;
-    sm_Runtime *Runtime_p;
-} sm_ThreadArguments;
+    nh_make_Runtime *Runtime_p;
+} nh_make_ThreadArguments;
 
-static void *sm_executeThread(
+static void *nh_make_executeThread(
     void *args_p)
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
-    sm_ThreadArguments *Arguments_p = args_p;
+    nh_make_ThreadArguments *Arguments_p = args_p;
 
-    SM_RESULT result = sm_executeRuntime(Arguments_p->Runtime_p, Arguments_p->args_pp, Arguments_p->args);
+    NH_MAKE_RESULT result = nh_make_executeRuntime(Arguments_p->Runtime_p, Arguments_p->args_pp, Arguments_p->args);
 
-    sm_Thread *Thread_p = _sm_getThread();
-    Thread_p->running = SM_FALSE;
+    nh_make_Thread *Thread_p = _nh_make_getThread();
+    Thread_p->running = NH_MAKE_FALSE;
     Thread_p->Runtime_p = NULL;
 
     free(args_p);
 
-SM_END((void*)result)
+NH_MAKE_END((void*)result)
 }
 
-SM_RESULT sm_runThread(
-    sm_Runtime *Runtime_p, SM_BYTE **args_pp, int args)
+NH_MAKE_RESULT nh_make_runThread(
+    nh_make_Runtime *Runtime_p, NH_BYTE **args_pp, int args)
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
-    sm_Thread *Thread_p = NULL;
-    for (int i = 0; i < SM_MAX_THREADS; ++i) {
-        if (!SM_THREAD_POOL.Threads_p[i].running) {
-            Thread_p = &SM_THREAD_POOL.Threads_p[i];
+    nh_make_Thread *Thread_p = NULL;
+    for (int i = 0; i < NH_MAKE_MAX_THREADS; ++i) {
+        if (!NH_MAKE_THREAD_POOL.Threads_p[i].running) {
+            Thread_p = &NH_MAKE_THREAD_POOL.Threads_p[i];
         }
     } 
 
-    SM_CHECK_NULL(Thread_p)
+    NH_MAKE_CHECK_NULL(Thread_p)
 
-    sm_ThreadArguments *Arguments_p = malloc(sizeof(sm_ThreadArguments));
-    SM_CHECK_NULL(Arguments_p)
+    nh_make_ThreadArguments *Arguments_p = malloc(sizeof(nh_make_ThreadArguments));
+    NH_MAKE_CHECK_NULL(Arguments_p)
 
     Arguments_p->Runtime_p = Runtime_p;
     Arguments_p->args = args;
     Arguments_p->args_pp = args_pp;
 
-    Thread_p->running = SM_TRUE;
+    Thread_p->running = NH_MAKE_TRUE;
     Thread_p->Runtime_p = Runtime_p;
 
 #if defined(__linux__) || defined(__APPLE__)
 
-    pthread_create(&Thread_p->id, NULL, sm_executeThread, (void*)Arguments_p);
+    pthread_create(&Thread_p->id, NULL, nh_make_executeThread, (void*)Arguments_p);
 
 #endif
 
-SM_DIAGNOSTIC_END(SM_SUCCESS)
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
 }
 
 // COUNT ==========================================================================================
 
-int sm_isRunning()
+int nh_make_isRunning()
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
     int count = 0;
-    for (int i = 0; i < SM_MAX_THREADS; ++i) {
-        if (SM_THREAD_POOL.Threads_p[i].running) {count++;}
+    for (int i = 0; i < NH_MAKE_MAX_THREADS; ++i) {
+        if (NH_MAKE_THREAD_POOL.Threads_p[i].running) {count++;}
     }
 
-SM_END(count)
+NH_MAKE_END(count)
 }
 
 // GET =============================================================================================
 
-sm_Thread *_sm_getThread()
+nh_make_Thread *_nh_make_getThread()
 {
-    for (int i = 0; i < SM_MAX_THREADS; ++i) 
+    for (int i = 0; i < NH_MAKE_MAX_THREADS; ++i) 
     {
 #if defined(__linux__) || defined(__APPLE__)
-        if (SM_THREAD_POOL.Threads_p[i].id == pthread_self())
+        if (NH_MAKE_THREAD_POOL.Threads_p[i].id == pthread_self())
 #elif defined(_WIN32) || defined (WIN32)
-        if (SM_THREAD_POOL.Threads_p[i].id == GetCurrentThreadId())
+        if (NH_MAKE_THREAD_POOL.Threads_p[i].id == GetCurrentThreadId())
 #endif
         {
-            return &SM_THREAD_POOL.Threads_p[i];
+            return &NH_MAKE_THREAD_POOL.Threads_p[i];
         }
     }
 
@@ -160,10 +160,10 @@ sm_Thread *_sm_getThread()
 
 // SLEEP ===========================================================================================
 
-SM_RESULT sm_sleepMs(
+NH_MAKE_RESULT nh_make_sleepMs(
     int milliseconds)
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
 #if defined(WIN32)
     Sleep(milliseconds);
@@ -183,6 +183,6 @@ SM_BEGIN()
     nanosleep(&ts, NULL);
 #endif
 
-SM_DIAGNOSTIC_END(SM_SUCCESS)
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
 }
 
diff --git a/src/lib/nhmake/Core/Thread.h b/src/lib/nhmake/Core/Thread.h
new file mode 100644
index 0000000..0e14af8
--- /dev/null
+++ b/src/lib/nhmake/Core/Thread.h
@@ -0,0 +1,82 @@
+#ifndef NH_MAKE_THREAD_H
+#define NH_MAKE_THREAD_H
+
+#ifndef DOXYGEN_SHOULD_SKIP_THIS
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+#include "../Core/Runtime.h"
+
+#include "../Common/Types/Private.h"
+
+#include <stdint.h>
+#include <stdlib.h>
+#include <stdbool.h>
+    
+#if defined(__linux__) || defined(__APPLE__)
+#include <pthread.h>
+#elif defined(_WIN32) || defined(WIN32)
+#include <windows.h>
+#endif
+
+#endif
+
+/** @addtogroup lib_nhmake_macros
+ *  @{
+ */
+
+    #define NH_MAKE_MAX_THREADS 64
+
+/** @} */
+
+/** @addtogroup lib_nhmake_structs
+ *  @{
+ */
+
+    typedef struct nh_make_Thread {
+        int depth;
+        NH_MAKE_BOOL running;
+        nh_make_Runtime *Runtime_p;
+    #if defined(__linux__) || defined(__APPLE__)
+        pthread_t id;              
+    #elif defined(_WIN32) || defined (WIN32)
+        DWORD id;              
+    #endif
+    } nh_make_Thread;
+
+/** @} */
+
+/** @addtogroup lib_nhmake_typedefs
+ *  @{
+ */
+
+    typedef int (*nh_make_isRunning_f)(
+    );
+
+    typedef NH_MAKE_RESULT (*nh_make_sleepMs_f)(
+        int milliseconds
+    );
+
+/** @} */
+
+/** @addtogroup lib_nhmake_functions
+ *  @{
+ */
+
+    void nh_make_initThreadPool(
+    );
+    
+    NH_MAKE_RESULT nh_make_runThread(
+        nh_make_Runtime *Runtime_p, NH_BYTE **args_pp, int args
+    );
+
+    nh_make_Thread *_nh_make_getThread(
+    );
+    
+/** @} */
+
+#endif 
diff --git a/external/selfmake/src/lib/Core/Utils.c b/src/lib/nhmake/Core/Utils.c
similarity index 61%
rename from external/selfmake/src/lib/Core/Utils.c
rename to src/lib/nhmake/Core/Utils.c
index 4558430..58b8ccf 100644
--- a/external/selfmake/src/lib/Core/Utils.c
+++ b/src/lib/nhmake/Core/Utils.c
@@ -1,8 +1,8 @@
 // LICENSE NOTICE ==================================================================================
 
 /**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
  * Published under MIT
  */
 
@@ -13,8 +13,8 @@
 #include "../UI/Message.h"
 #include "../Common/Macros/Macros.h"
 
-#include SM_FLOW
-#include SM_CUSTOM_CHECK
+#include NH_MAKE_FLOW
+#include NH_MAKE_CUSTOM_CHECK
 
 #include <unistd.h>
 #include <string.h>
@@ -34,21 +34,21 @@
 
 // DIRECTORY =======================================================================================
 
-static SM_BYTE *procDir_p = NULL;
-static SM_BYTE *wrkDir_p = NULL;
+static NH_BYTE *procDir_p = NULL;
+static NH_BYTE *wrkDir_p = NULL;
 
-SM_BYTE *sm_getProcessDirectory()
+NH_BYTE *nh_make_getProcessDirectory()
 {
-SM_BEGIN()
-    if (procDir_p) {SM_END(procDir_p)}
+NH_MAKE_BEGIN()
+    if (procDir_p) {NH_MAKE_END(procDir_p)}
 
     int size = 1024;
-    SM_BYTE buffer_p[1024] = {0};
+    NH_BYTE buffer_p[1024] = {0};
 
 #if defined(__linux__)
     if (readlink("/proc/self/exe", buffer_p, size) == -1 
     &&  readlink("/proc/curproc/file", buffer_p, size) == -1
-    &&  readlink("/proc/self/path/a.out", buffer_p, size) == -1) {SM_END(NULL)}
+    &&  readlink("/proc/self/path/a.out", buffer_p, size) == -1) {NH_MAKE_END(NULL)}
 #elif defined(__APPLE__)
     size = 0;
     _NSGetExecutablePath(NULL, &size);
@@ -57,100 +57,100 @@ SM_BEGIN()
 
     int i;
     for (i = strlen(buffer_p); i > -1 && buffer_p[i] != '/'; --i) {}
-    if (i == -1) {SM_END(NULL)}
+    if (i == -1) {NH_MAKE_END(NULL)}
     buffer_p[i] = '\0'; // remove exe name
 
     procDir_p = malloc(strlen(buffer_p) + 1);
-    SM_CHECK_NULL(NULL, procDir_p)
+    NH_MAKE_CHECK_NULL(NULL, procDir_p)
     sprintf(procDir_p, buffer_p);
 
-SM_END(procDir_p)
+NH_MAKE_END(procDir_p)
 }
 
-SM_BYTE *sm_getWorkDirectory()
+NH_BYTE *nh_make_getWorkDirectory()
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
-    if (wrkDir_p) {SM_END(wrkDir_p)}
+    if (wrkDir_p) {NH_MAKE_END(wrkDir_p)}
 
     int size = 1024;
-    SM_BYTE buffer_p[1024] = {0};
+    NH_BYTE buffer_p[1024] = {0};
     getcwd(buffer_p, size);
 
     wrkDir_p = malloc(strlen(buffer_p) + 1);
-    SM_CHECK_NULL(NULL, wrkDir_p)
+    NH_MAKE_CHECK_NULL(NULL, wrkDir_p)
     sprintf(wrkDir_p, buffer_p);
 
-SM_END(wrkDir_p)
+NH_MAKE_END(wrkDir_p)
 }
 
-const SM_BYTE *sm_getHomeDir()
+const NH_BYTE *nh_make_getHomeDir()
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
-    const SM_BYTE *homedir_p = NULL;
+    const NH_BYTE *homedir_p = NULL;
     if ((homedir_p = getenv("HOME")) == NULL) {
         homedir_p = getpwuid(getuid())->pw_dir;
     }
 
-SM_END(homedir_p)
+NH_MAKE_END(homedir_p)
 }
 
-SM_RESULT sm_createDir(
-    SM_BYTE *path_p)
+NH_MAKE_RESULT nh_make_createDir(
+    NH_BYTE *path_p)
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
-    sm_messagef("CREATE DIR %s", path_p);
+    nh_make_messagef("CREATE DIR %s", path_p);
  
     struct stat st = {0};
     if (stat(path_p, &st) == -1) {
         int err = mkdir(path_p, 0755);  // 0755 aka drwxr-xr-x
         if (err) {
-            SM_DIAGNOSTIC_END(SM_ERROR_CANT_CREATE_DIRECTORY)
+            NH_MAKE_DIAGNOSTIC_END(NH_MAKE_ERROR_CANT_CREATE_DIRECTORY)
         }
     }
 
-SM_DIAGNOSTIC_END(SM_SUCCESS)
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
 }
 
-SM_RESULT sm_removeDir(
-    SM_BYTE *path_p)
+NH_MAKE_RESULT nh_make_removeDir(
+    NH_BYTE *path_p)
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
-    sm_messagef("REMOVE DIR %s", path_p);
+    nh_make_messagef("REMOVE DIR %s", path_p);
  
-    SM_BYTE command_p[255];
+    NH_BYTE command_p[255];
     sprintf(command_p, "rm -r %s", path_p);
 
     int status = system(command_p);
-    if (WEXITSTATUS(status) || WIFSIGNALED(status)) {SM_DIAGNOSTIC_END(SM_ERROR_CP_EXECUTION_FAILED)}
+    if (WEXITSTATUS(status) || WIFSIGNALED(status)) {NH_MAKE_DIAGNOSTIC_END(NH_MAKE_ERROR_CP_EXECUTION_FAILED)}
 
-SM_DIAGNOSTIC_END(SM_SUCCESS)
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
 }
 
 // COMMAND =========================================================================================
 
-SM_BOOL sm_canRunCommand(
-    const SM_BYTE *cmd) 
+NH_MAKE_BOOL nh_make_canRunCommand(
+    const NH_BYTE *cmd) 
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
     if(strchr(cmd, '/')) {
         // if cmd includes a slash, no path search must be performed,
         // go straight to checking if it's executable
         return access(cmd, X_OK)==0;
     }
-    const SM_BYTE *path = getenv("PATH");
-    if(!path) {SM_DIAGNOSTIC_END(SM_FALSE)} // something is horribly wrong...
+    const NH_BYTE *path = getenv("PATH");
+    if(!path) {NH_MAKE_DIAGNOSTIC_END(NH_MAKE_FALSE)} // something is horribly wrong...
     // we are sure we won't need a buffer any longer
-    SM_BYTE *buf = malloc(strlen(path)+strlen(cmd)+3);
-    if(!buf) {SM_DIAGNOSTIC_END(SM_FALSE)} // actually useless, see comment
+    NH_BYTE *buf = malloc(strlen(path)+strlen(cmd)+3);
+    if(!buf) {NH_MAKE_DIAGNOSTIC_END(NH_MAKE_FALSE)} // actually useless, see comment
     // loop as long as we have stuff to examine in path
     for(; *path; ++path) {
         // start from the beginning of the buffer
-        SM_BYTE *p = buf;
+        NH_BYTE *p = buf;
         // copy in buf the current path element
         for(; *path && *path!=':'; ++path,++p) {
             *p = *path;
@@ -163,7 +163,7 @@ SM_BEGIN()
         // check if we can execute it
         if(access(buf, X_OK)==0) {
             free(buf);
-            SM_DIAGNOSTIC_END(SM_TRUE)
+            NH_MAKE_DIAGNOSTIC_END(NH_MAKE_TRUE)
         }
         // quit at last cycle
         if(!*path) break;
@@ -171,6 +171,6 @@ SM_BEGIN()
     // not found
     free(buf);
 
-SM_DIAGNOSTIC_END(SM_FALSE)
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_FALSE)
 }
 
diff --git a/src/lib/nhmake/Core/Utils.h b/src/lib/nhmake/Core/Utils.h
new file mode 100644
index 0000000..c00f8ec
--- /dev/null
+++ b/src/lib/nhmake/Core/Utils.h
@@ -0,0 +1,54 @@
+#ifndef NH_MAKE_UTILS_H
+#define NH_MAKE_UTILS_H
+
+#ifndef DOXYGEN_SHOULD_SKIP_THIS
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+#include "../Common/Types/Private.h"
+
+#include <stddef.h>
+
+#endif
+
+/** @addtogroup lib_nhmake_typedefs
+ *  @{
+ */
+
+    typedef NH_BYTE *(*nh_make_getProcessDirectory_f)(
+    );
+    
+    typedef NH_BYTE *(*nh_make_getWorkDirectory_f)(
+    );
+
+/** @} */
+
+/** @addtogroup lib_nhmake_functions
+ *  @{
+ */
+
+    const NH_BYTE *nh_make_getHomeDir(
+    );
+
+    NH_MAKE_RESULT nh_make_createDir(
+        NH_BYTE *path_p
+    );
+    
+    NH_MAKE_RESULT nh_make_removeDir(
+        NH_BYTE *path_p
+    );
+
+    NH_MAKE_BOOL nh_make_canRunCommand(
+        const NH_BYTE *cmd
+    );
+
+    NH_BYTE *nh_make_getWorkDirectory(
+    );
+
+/** @} */
+
+#endif
diff --git a/src/lib/nhmake/Core/Version.c b/src/lib/nhmake/Core/Version.c
new file mode 100644
index 0000000..5feddd6
--- /dev/null
+++ b/src/lib/nhmake/Core/Version.c
@@ -0,0 +1,130 @@
+// LICENSE NOTICE ==================================================================================
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+// INCLUDE =========================================================================================
+
+#include "Version.h"
+#include "Source.h"
+#include "Runtime.h"
+#include "Changes.h"
+
+#include "../Common/Macros/Macros.h"
+#include NH_MAKE_FLOW
+#include NH_MAKE_DEFAULT_CHECK
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <ctype.h>
+
+// INIT ============================================================================================
+
+nh_make_Version nh_make_initVersion()
+{
+NH_MAKE_BEGIN()
+
+    nh_make_Version Version;
+
+    Version.api = 0;
+    Version.major = 0;
+    Version.minor = 0;
+    Version.patch = 0;
+
+    memset(Version.apiDate_p, 0, sizeof(long) * 3);
+    memset(Version.majorDate_p, 0, sizeof(long) * 3);
+    memset(Version.minorDate_p, 0, sizeof(long) * 3);
+    memset(Version.patchDate_p, 0, sizeof(long) * 3);
+
+NH_MAKE_END(Version)
+}
+
+// COMPUTE =========================================================================================
+
+static NH_MAKE_RESULT nh_make_incrementVersion(
+    nh_make_Workload *Workload_p, nh_make_SourceContext *Context_p)
+{
+NH_MAKE_BEGIN()
+
+    if (!Workload_p->scope_p) {
+        NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+    }
+
+    if (!strcmp(Workload_p->scope_p, "api")) {
+        Context_p->Version.api++;
+        Context_p->Version.major = 0;
+        Context_p->Version.minor = 0;
+        Context_p->Version.patch = 0;
+    }
+    else if (!strcmp(Workload_p->scope_p, "major")) {
+        Context_p->Version.major++;
+        Context_p->Version.minor = 0;
+        Context_p->Version.patch = 0;
+    }
+    else if (!strcmp(Workload_p->scope_p, "minor")) {
+        Context_p->Version.minor++;
+        Context_p->Version.patch = 0;
+    }
+    else if (!strcmp(Workload_p->scope_p, "patch")) {
+        Context_p->Version.patch++;
+    }
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
+NH_MAKE_RESULT nh_make_computeVersion(
+    nh_make_Runtime *Runtime_p, nh_make_SourceContext *Context_p)
+{
+NH_MAKE_BEGIN()
+
+    // Reset version.
+    memset(&Context_p->Version, 0, sizeof(nh_make_Version));
+
+    nh_make_Variable *Variable_p = nh_make_getVariable(&Runtime_p->VariableArray, "HISTORY");
+    if (!Variable_p) {NH_MAKE_END(NH_MAKE_SUCCESS)}
+
+    nh_make_ChangesNode *Root_p = nh_make_parseChangesFile(Variable_p->values_pp[0]);
+    int changes = 0;
+    nh_make_Changes *Changes_p = nh_make_getChanges((nh_make_ChangesNode*)Root_p, &changes);
+
+    for (int i = changes-1; i >= 0; --i) {
+        nh_make_Changes *Change_p = Changes_p+i;
+        for (int j = 0; j < Change_p->workloads; ++j) {
+            nh_make_Workload *Workload_p = Change_p->Workloads_p+j;
+            for (int k = 0; k < Workload_p->libs; ++k) {
+                if (!strcmp(Workload_p->libs_pp[k], Context_p->name_p) 
+                &&  Context_p->type != NH_MAKE_SOURCE_CONTEXT_BINARY) {
+                    nh_make_incrementVersion(Workload_p, Context_p);
+                    break;
+                }
+            }
+            for (int k = 0; k < Workload_p->bins; ++k) {
+                if (!strcmp(Workload_p->bins_pp[k], Context_p->name_p)
+                &&  Context_p->type == NH_MAKE_SOURCE_CONTEXT_BINARY) {
+                    nh_make_incrementVersion(Workload_p, Context_p);
+                    break;
+                }
+            }
+        }
+    }
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
+NH_MAKE_RESULT nh_make_updateVersions(
+    nh_make_Runtime *Runtime_p)
+{
+NH_MAKE_BEGIN()
+
+    for (int i = 0; i < Runtime_p->SourceContextArray.length; ++i) {
+        NH_MAKE_CHECK(nh_make_computeVersion(Runtime_p, Runtime_p->SourceContextArray.SourceContexts_p+i))
+    }
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
diff --git a/src/lib/nhmake/Core/Version.h b/src/lib/nhmake/Core/Version.h
new file mode 100644
index 0000000..7846f41
--- /dev/null
+++ b/src/lib/nhmake/Core/Version.h
@@ -0,0 +1,43 @@
+#ifndef NH_MAKE_VERSION_H
+#define NH_MAKE_VERSION_H
+
+#ifndef DOXYGEN_SHOULD_SKIP_THIS
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+#include "../Common/Types/Private.h"
+
+#endif
+
+/** @addtogroup lib_nhmake_typedefs
+ *  @{
+ */
+
+    typedef NH_MAKE_RESULT (*nh_make_updateVersions_f)(
+        nh_make_Runtime *Runtime_p
+    );
+
+/** @} */
+
+/** @addtogroup lib_nhmake_functions
+ *  @{
+ */
+
+    nh_make_Version nh_make_initVersion(
+    );
+
+    NH_MAKE_RESULT nh_make_computeVersion(
+        nh_make_Runtime *Runtime_p, nh_make_SourceContext *Context_p
+    );
+
+    NH_MAKE_RESULT nh_make_updateVersions(
+        nh_make_Runtime *Runtime_p
+    );
+
+/** @} */
+
+#endif
diff --git a/src/lib/nhmake/Parser/Functions.c b/src/lib/nhmake/Parser/Functions.c
new file mode 100644
index 0000000..3041ebc
--- /dev/null
+++ b/src/lib/nhmake/Parser/Functions.c
@@ -0,0 +1,275 @@
+// LICENSE NOTICE ==================================================================================
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+// INCLUDE =========================================================================================
+
+#include "Functions.h"
+#include "Variables.h"
+
+#include "../Core/Build.h"
+#include "../Core/Utils.h"
+#include "../UI/Message.h"
+#include "../Common/Macros/Macros.h"
+#include NH_MAKE_FLOW
+#include NH_MAKE_DEFAULT_CHECK
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <ctype.h>
+
+#include <sys/types.h> 
+#include <sys/stat.h>
+
+// HELPER ==========================================================================================
+
+static NH_MAKE_BOOL nh_make_caseInsensitiveMatch(
+    NH_BYTE *str1_p, NH_BYTE *str2_p)
+{
+NH_MAKE_BEGIN()
+
+    if (strlen(str1_p) != strlen(str2_p)) {NH_MAKE_END(NH_MAKE_FALSE)}
+
+    for (int i = 0; i < strlen(str1_p); ++i) {
+        int d = tolower((unsigned char)str1_p[i]) - tolower((unsigned char)str2_p[i]);
+        if (d != 0) {
+            NH_MAKE_END(NH_MAKE_FALSE)
+        }
+    }
+   
+NH_MAKE_END(NH_MAKE_TRUE)
+}
+
+// EXECUTE =========================================================================================
+
+static NH_MAKE_RESULT nh_make_executeCopyFunction(
+    nh_make_Runtime *Runtime_p, nh_make_Function *Function_p)
+{
+NH_MAKE_BEGIN()
+
+    if (Function_p->arguments <= 0 || Function_p->arguments > 4) {NH_MAKE_DIAGNOSTIC_END(NH_MAKE_ERROR_BAD_STATE)}
+
+    switch(Function_p->arguments)
+    {
+        case 2 :
+            nh_make_copy(&Runtime_p->VariableArray, Function_p->arguments_pp[0], Function_p->arguments_pp[1], NH_MAKE_FALSE, NH_MAKE_FALSE);
+            break;
+        case 3 :
+            nh_make_copy(&Runtime_p->VariableArray, Function_p->arguments_pp[0], Function_p->arguments_pp[1], !strcmp(Function_p->arguments_pp[2], "true") ? NH_MAKE_TRUE : NH_MAKE_FALSE, NH_MAKE_FALSE);
+            break;
+        case 4 :
+            nh_make_copy(&Runtime_p->VariableArray, Function_p->arguments_pp[0], Function_p->arguments_pp[1], !strcmp(Function_p->arguments_pp[2], "true") ? NH_MAKE_TRUE : NH_MAKE_FALSE, !strcmp(Function_p->arguments_pp[3], "true") ? NH_MAKE_TRUE : NH_MAKE_FALSE);
+            break;
+    }
+
+NH_MAKE_END(NH_MAKE_SUCCESS)
+}
+
+static NH_MAKE_RESULT nh_make_executeChdirFunction(
+    nh_make_Runtime *Runtime_p, nh_make_Function *Function_p)
+{
+NH_MAKE_BEGIN()
+
+    if (Function_p->arguments == 0) {
+        nh_make_updateVariable(&Runtime_p->VariableArray, "WRK_DIR", nh_make_getVariable(&Runtime_p->VariableArray, "PROJ_DIR")->values_pp, 1);
+    }
+    else {
+        nh_make_updateVariable(&Runtime_p->VariableArray, "WRK_DIR", Function_p->arguments_pp, 1);
+    }
+
+    nh_make_messagef("chdir %s", nh_make_getVariable(&Runtime_p->VariableArray, "WRK_DIR")->values_pp[0]);
+
+NH_MAKE_END(NH_MAKE_SUCCESS)
+}
+
+static NH_MAKE_RESULT nh_make_executeMkdirFunction(
+    nh_make_Function *Function_p)
+{
+NH_MAKE_BEGIN()
+
+    if (Function_p->arguments != 1) {NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)}
+
+    struct stat st = {0};
+    if (stat(Function_p->arguments_pp[0], &st) == -1) {
+        int err = mkdir(Function_p->arguments_pp[0], 0755);  // 0755 -> drwxr-xr-x
+        if (err != 0) {
+            NH_MAKE_DIAGNOSTIC_END(NH_MAKE_ERROR_CANT_CREATE_DIRECTORY)
+        }
+    }
+
+    nh_make_messagef("mkdir %s", Function_p->arguments_pp[0]);
+
+NH_MAKE_END(NH_MAKE_SUCCESS)
+}
+
+static NH_MAKE_RESULT nh_make_executeSystemFunction(
+    nh_make_Function *Function_p)
+{
+NH_MAKE_BEGIN()
+
+    if (Function_p->arguments != 1) {NH_MAKE_DIAGNOSTIC_END(NH_MAKE_ERROR_BAD_STATE)}
+    nh_make_messagef("system %s", Function_p->arguments_pp[0]);
+    system(Function_p->arguments_pp[0]);
+
+NH_MAKE_END(NH_MAKE_SUCCESS)
+}
+
+NH_MAKE_RESULT nh_make_executeFunction(
+    nh_make_Runtime *Runtime_p, nh_make_Function *Function_p) 
+{
+NH_MAKE_BEGIN()
+
+    NH_BYTE **arguments_pp = malloc(sizeof(NH_BYTE*) * Function_p->arguments);
+    memcpy(arguments_pp, Function_p->arguments_pp, sizeof(NH_BYTE*) * Function_p->arguments);
+
+    for (int i = 0; i < Function_p->arguments; ++i) {
+        Function_p->arguments_pp[i] = nh_make_substituteVariables(&Runtime_p->VariableArray, arguments_pp[i]);
+        NH_MAKE_CHECK_NULL(Function_p->arguments_pp[i])
+    }
+    NH_MAKE_RESULT result = NH_MAKE_SUCCESS;
+
+    if (nh_make_caseInsensitiveMatch(Function_p->name_p, "lib")) {
+        if (!strcmp(Function_p->arguments_pp[0], "SHARED")) {
+            result = nh_make_addSourceContext(Runtime_p, Function_p, NH_MAKE_SOURCE_CONTEXT_SHARED_LIBRARY, 1);
+        }
+        else if (!strcmp(Function_p->arguments_pp[0], "STATIC")) {
+            result = nh_make_addSourceContext(Runtime_p, Function_p, NH_MAKE_SOURCE_CONTEXT_STATIC_LIBRARY, 1);
+        }
+        else {
+            result = nh_make_addSourceContext(Runtime_p, Function_p, NH_MAKE_SOURCE_CONTEXT_SHARED_LIBRARY, 0);
+        }
+        if (!result && Runtime_p->sourceContextCallback_f) {
+            result = Runtime_p->sourceContextCallback_f(
+                Runtime_p, &Runtime_p->SourceContextArray.SourceContexts_p[Runtime_p->SourceContextArray.length - 1]
+            );
+        }
+    }
+    else if (nh_make_caseInsensitiveMatch(Function_p->name_p, "bin")) {
+        result = nh_make_addSourceContext(Runtime_p, Function_p, NH_MAKE_SOURCE_CONTEXT_BINARY, 0);
+        if (!result && Runtime_p->sourceContextCallback_f) {
+            result = Runtime_p->sourceContextCallback_f(
+                Runtime_p, &Runtime_p->SourceContextArray.SourceContexts_p[Runtime_p->SourceContextArray.length - 1]
+            );
+        }
+    }
+    else if (nh_make_caseInsensitiveMatch(Function_p->name_p, "compile")) {
+        result = nh_make_addCompileArguments(&Runtime_p->SourceContextArray, Function_p, NH_MAKE_SOURCE_CONTEXT_UNDEFINED);
+    }
+    else if (nh_make_caseInsensitiveMatch(Function_p->name_p, "compile_lib")) {
+        result = nh_make_addCompileArguments(&Runtime_p->SourceContextArray, Function_p, NH_MAKE_SOURCE_CONTEXT_SHARED_LIBRARY);
+    }
+    else if (nh_make_caseInsensitiveMatch(Function_p->name_p, "compile_bin")) {
+        result = nh_make_addCompileArguments(&Runtime_p->SourceContextArray, Function_p, NH_MAKE_SOURCE_CONTEXT_BINARY);
+    }
+    else if (nh_make_caseInsensitiveMatch(Function_p->name_p, "link")) {
+        result = nh_make_addLinkArguments(&Runtime_p->SourceContextArray, Function_p, NH_MAKE_SOURCE_CONTEXT_UNDEFINED);
+    }
+    else if (nh_make_caseInsensitiveMatch(Function_p->name_p, "link_lib")) {
+        result = nh_make_addLinkArguments(&Runtime_p->SourceContextArray, Function_p, NH_MAKE_SOURCE_CONTEXT_SHARED_LIBRARY);
+    }
+    else if (nh_make_caseInsensitiveMatch(Function_p->name_p, "link_bin")) {
+        result = nh_make_addLinkArguments(&Runtime_p->SourceContextArray, Function_p, NH_MAKE_SOURCE_CONTEXT_BINARY);
+    }
+    else if (nh_make_caseInsensitiveMatch(Function_p->name_p, "source")) { 
+        result = nh_make_addSource(&Runtime_p->SourceContextArray, &Runtime_p->SourceArray, Function_p, NH_MAKE_SOURCE_CONTEXT_UNDEFINED);
+    }
+    else if (nh_make_caseInsensitiveMatch(Function_p->name_p, "source_lib")) {
+        result = nh_make_addSource(&Runtime_p->SourceContextArray, &Runtime_p->SourceArray, Function_p, NH_MAKE_SOURCE_CONTEXT_SHARED_LIBRARY);
+    }
+    else if (nh_make_caseInsensitiveMatch(Function_p->name_p, "source_bin")) {
+        result = nh_make_addSource(&Runtime_p->SourceContextArray, &Runtime_p->SourceArray, Function_p, NH_MAKE_SOURCE_CONTEXT_BINARY);
+    }
+    else if (nh_make_caseInsensitiveMatch(Function_p->name_p, "test")) {
+        result = nh_make_addTest(&Runtime_p->SourceContextArray, &Runtime_p->TestArray, Function_p);
+    }
+    else if (nh_make_caseInsensitiveMatch(Function_p->name_p, "copy")) {
+        result = nh_make_executeCopyFunction(Runtime_p, Function_p);
+    }
+    else if (nh_make_caseInsensitiveMatch(Function_p->name_p, "build")) {
+        result = nh_make_build(Runtime_p, Function_p->arguments_pp[0]);
+    }
+    else if (nh_make_caseInsensitiveMatch(Function_p->name_p, "chdir")) {
+        result = nh_make_executeChdirFunction(Runtime_p, Function_p);
+    }
+    else if (nh_make_caseInsensitiveMatch(Function_p->name_p, "mkdir")) {
+        result = nh_make_executeMkdirFunction(Function_p);
+    }
+    else if (nh_make_caseInsensitiveMatch(Function_p->name_p, "system")) {
+        result = nh_make_executeSystemFunction(Function_p);
+    }
+    else if (nh_make_caseInsensitiveMatch(Function_p->name_p, "system")) {
+        result = nh_make_executeSystemFunction(Function_p);
+    }
+    else if (nh_make_caseInsensitiveMatch(Function_p->name_p, "set")) {
+        result = nh_make_updateVariable(
+            &Runtime_p->VariableArray, Function_p->arguments_pp[0], Function_p->arguments_pp + 1, 
+            Function_p->arguments - 1
+        );
+    }
+
+    if (!result && Runtime_p->functionCallback_f) {
+        result = Runtime_p->functionCallback_f(Runtime_p, Function_p);
+    }
+
+    for (int i = 0; i < Function_p->arguments; ++i) {
+        free(Function_p->arguments_pp[i]);
+    }
+
+    memcpy(Function_p->arguments_pp, arguments_pp, sizeof(NH_BYTE*) * Function_p->arguments);
+    free(arguments_pp);
+
+NH_MAKE_DIAGNOSTIC_END(result)
+}
+
+NH_MAKE_BOOL nh_make_compareIf(
+    nh_make_Runtime *Runtime_p, nh_make_If *If_p, NH_MAKE_BOOL b)
+{
+NH_MAKE_BEGIN()
+
+    nh_make_Variable *Var_p = nh_make_getVariable(&Runtime_p->VariableArray, If_p->string_p);
+    if (Var_p && Var_p->valueCount > 0) {
+        if (!strcmp(*Var_p->values_pp, "true") && b == NH_MAKE_TRUE) {NH_MAKE_END(NH_MAKE_TRUE)}
+        if (!strcmp(*Var_p->values_pp, "false") && b == NH_MAKE_FALSE) {NH_MAKE_END(NH_MAKE_TRUE)}
+    }
+
+NH_MAKE_END(NH_MAKE_FALSE)
+}
+
+NH_MAKE_RESULT nh_make_executeIf(
+    nh_make_Runtime *Runtime_p, nh_make_If *If_p) 
+{
+NH_MAKE_BEGIN()
+
+    nh_make_Variable *Var_p = nh_make_getVariable(&Runtime_p->VariableArray, If_p->string_p);
+    if (Var_p && Var_p->valueCount > 0 && !strcmp(*Var_p->values_pp, "true")) {
+        NH_MAKE_CHECK(nh_make_executeBlock(Runtime_p, &If_p->Block_p->Block))
+    }
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
+// EXECUTE BLOCK ===================================================================================
+
+NH_MAKE_RESULT nh_make_executeBlock(
+    nh_make_Runtime *Runtime_p, nh_make_Block *Block_p)
+{
+NH_MAKE_BEGIN()
+
+    for (int d = 0; d < Block_p->definitions; ++d) {
+        switch (Block_p->Definitions_p[d].type) {
+            case NH_MAKE_DEFINITION_FUNCTION :
+                NH_MAKE_CHECK(nh_make_executeFunction(Runtime_p, &Block_p->Definitions_p[d].Function))
+            case NH_MAKE_DEFINITION_IF :
+                NH_MAKE_CHECK(nh_make_executeIf(Runtime_p, &Block_p->Definitions_p[d].If))
+        }
+    }
+
+NH_MAKE_END(NH_MAKE_SUCCESS)
+}
+
diff --git a/src/lib/nhmake/Parser/Functions.h b/src/lib/nhmake/Parser/Functions.h
new file mode 100644
index 0000000..2ed24a3
--- /dev/null
+++ b/src/lib/nhmake/Parser/Functions.h
@@ -0,0 +1,38 @@
+#ifndef NH_MAKE_FUNCTIONS_H
+#define NH_MAKE_FUNCTIONS_H
+
+#ifndef DOXYGEN_SHOULD_SKIP_THIS
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+#include "Parser.h"
+
+#include "../Core/Runtime.h"
+
+#include "../Common/Types/Private.h"
+
+#endif
+
+/** @addtogroup lib_nhmake_functions
+ *  @{
+ */
+
+    NH_MAKE_RESULT nh_make_executeFunction(
+        nh_make_Runtime *Runtime_p, nh_make_Function *Function_p
+    ); 
+
+    NH_MAKE_RESULT nh_make_executeBlock(
+        nh_make_Runtime *Runtime_p, nh_make_Block *Block_p
+    );
+
+    NH_MAKE_BOOL nh_make_compareIf(
+        nh_make_Runtime *Runtime_p, nh_make_If *If_p, NH_MAKE_BOOL b
+    );
+
+/** @} */
+
+#endif
diff --git a/src/lib/nhmake/Parser/Parser.c b/src/lib/nhmake/Parser/Parser.c
new file mode 100644
index 0000000..e850521
--- /dev/null
+++ b/src/lib/nhmake/Parser/Parser.c
@@ -0,0 +1,369 @@
+// LICENSE NOTICE ==================================================================================
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+// INCLUDE =========================================================================================
+
+#include "Parser.h"
+
+#include "../Common/Macros/Macros.h"
+#include NH_MAKE_FLOW
+#include NH_MAKE_CUSTOM_CHECK
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <ctype.h>
+
+// PARSE ===========================================================================================
+
+static nh_make_Token *nh_make_parseToken(
+    nh_make_Token *Token_p, nh_make_Definition *Definition_p
+); 
+
+static nh_make_Token *nh_make_parseFunction(
+    nh_make_Token *Token_p, nh_make_Definition *Definition_p)
+{
+NH_MAKE_BEGIN()
+
+    Definition_p->type = NH_MAKE_DEFINITION_FUNCTION;
+    Definition_p->Function.name_p = Token_p->string_p;
+    Definition_p->Function.arguments_pp = NULL; 
+    Definition_p->Function.arguments = 0;
+
+    ++Token_p;
+
+    if (Token_p->type != NH_MAKE_TOKEN_ROUND_BRACKET_LEFT) {
+        NH_MAKE_END(Token_p)
+    }
+
+    Definition_p->Function.arguments_pp = malloc(sizeof(NH_BYTE*));
+    NH_MAKE_CHECK_NULL(NULL, Definition_p->Function.arguments_pp)
+
+    Definition_p->Function.argumentTypes_p = malloc(sizeof(NH_MAKE_TOKEN));
+    NH_MAKE_CHECK_NULL(NULL, Definition_p->Function.argumentTypes_p)
+
+    while (Token_p->type != NH_MAKE_TOKEN_ROUND_BRACKET_RIGHT)
+    {
+        switch (Token_p->type)
+        {
+            case NH_MAKE_TOKEN_IDENTIFIER :
+            case NH_MAKE_TOKEN_STRING :
+                Definition_p->Function.argumentTypes_p[Definition_p->Function.arguments] = Token_p->type;
+                Definition_p->Function.arguments_pp[Definition_p->Function.arguments++] = Token_p->string_p;
+                Definition_p->Function.arguments_pp = realloc(Definition_p->Function.arguments_pp, sizeof(NH_BYTE*) * (Definition_p->Function.arguments + 1));
+                Definition_p->Function.argumentTypes_p = realloc(Definition_p->Function.argumentTypes_p, sizeof(NH_MAKE_TOKEN) * (Definition_p->Function.arguments + 1));
+                break;
+        }
+        ++Token_p;
+    }
+
+NH_MAKE_END(++Token_p)
+}
+
+static nh_make_Token *nh_make_parseBlock(
+    nh_make_Token *Token_p, nh_make_Definition *Definition_p)
+{
+NH_MAKE_BEGIN()
+
+    Definition_p->type = NH_MAKE_DEFINITION_BLOCK;
+    Definition_p->Block.Definitions_p = NULL;
+    Definition_p->Block.definitions   = 0;
+
+    if (Token_p->type == NH_MAKE_TOKEN_CURLY_BRACKET_RIGHT) {
+        NH_MAKE_END(Token_p)
+    }
+
+    Definition_p->Block.Definitions_p = malloc(sizeof(nh_make_Definition));
+    NH_MAKE_CHECK_NULL(NULL, Definition_p->Block.Definitions_p)
+
+    while (Token_p->type != NH_MAKE_TOKEN_CURLY_BRACKET_RIGHT) {        
+        Token_p = nh_make_parseToken(Token_p, &Definition_p->Block.Definitions_p[Definition_p->Block.definitions++]);
+        Definition_p->Block.Definitions_p = realloc(Definition_p->Block.Definitions_p, sizeof(nh_make_Definition) * (Definition_p->Block.definitions + 1));
+    }
+
+NH_MAKE_END(Token_p)
+}
+
+static nh_make_Token *nh_make_parseOption(
+    nh_make_Token *Token_p, nh_make_Definition *Definition_p)
+{
+NH_MAKE_BEGIN()
+
+    Definition_p->type = NH_MAKE_DEFINITION_OPTION;
+
+    nh_make_Token *Description_p = Token_p->type == NH_MAKE_TOKEN_STRING ? Token_p : NULL;
+    NH_MAKE_BOOL longOption = NH_MAKE_FALSE;
+
+    if (Token_p->type == NH_MAKE_TOKEN_STRING) {
+        if (Token_p[2].type == NH_MAKE_TOKEN_HYPHEN_MINUS) {
+            longOption = NH_MAKE_TRUE; 
+            Token_p = Token_p + 3;
+        }
+        else {Token_p = Token_p + 2;}
+    }
+    else {
+        if (Token_p[1].type == NH_MAKE_TOKEN_HYPHEN_MINUS) {
+            longOption = NH_MAKE_TRUE;
+            Token_p = Token_p + 2;
+        }
+        else {Token_p = Token_p + 1;}
+    }
+
+    Definition_p->Option.arguments = 0;
+    Definition_p->Option.arguments_pp = NULL;
+    Definition_p->Option.longOption = longOption;
+    Definition_p->Option.name_p = Token_p->string_p;
+    Definition_p->Option.description_p = Description_p ? Description_p->string_p : NULL;
+    Definition_p->Option.Block_p = malloc(sizeof(nh_make_Block));
+    NH_MAKE_CHECK_NULL(NULL, Definition_p->Option.Block_p)
+
+    ++Token_p;
+
+    nh_make_Token *Argument_p = Token_p;
+    int arguments = 0;
+    while (Argument_p->type == NH_MAKE_TOKEN_IDENTIFIER || Argument_p->type == NH_MAKE_TOKEN_STRING) {
+        arguments++;
+        Argument_p++;
+    }
+
+    if (arguments) {
+        Definition_p->Option.arguments = arguments;
+        Definition_p->Option.arguments_pp = malloc(sizeof(NH_BYTE*) * arguments);
+        NH_MAKE_CHECK_NULL(NULL, Definition_p->Option.arguments_pp)
+        for (int i = 0; i < arguments; ++i) {
+            Definition_p->Option.arguments_pp[i] = Token_p->string_p;
+            Token_p++;
+        }
+    }
+
+    if (Token_p->type != NH_MAKE_TOKEN_CURLY_BRACKET_LEFT) {
+        NH_MAKE_END(Token_p)
+    }
+
+NH_MAKE_END(nh_make_parseBlock(++Token_p, Definition_p->Option.Block_p))
+}
+
+static nh_make_Token *nh_make_parseIf(
+    nh_make_Token *Token_p, nh_make_Definition *Definition_p)
+{
+NH_MAKE_BEGIN()
+
+    Definition_p->type = NH_MAKE_DEFINITION_IF;
+    Definition_p->If.string_p = Token_p->string_p;
+    Definition_p->If.Block_p = malloc(sizeof(nh_make_Definition)); 
+    NH_MAKE_CHECK_NULL(NULL, Definition_p->If.Block_p)
+
+    ++Token_p;
+
+    if (Token_p->type != NH_MAKE_TOKEN_CURLY_BRACKET_LEFT) {
+        NH_MAKE_END(Token_p)
+    }
+
+NH_MAKE_END(nh_make_parseBlock(++Token_p, Definition_p->If.Block_p))
+}
+
+static nh_make_Token *nh_make_parseToken(
+    nh_make_Token *Token_p, nh_make_Definition *Definition_p) 
+{
+NH_MAKE_BEGIN()
+
+    Definition_p->type = NH_MAKE_DEFINITION_UNDEFINED;
+
+    switch (Token_p->type)
+    {
+        case NH_MAKE_TOKEN_CURLY_BRACKET_RIGHT :
+        case NH_MAKE_TOKEN_CURLY_BRACKET_LEFT  :
+        case NH_MAKE_TOKEN_ROUND_BRACKET_RIGHT :
+        case NH_MAKE_TOKEN_ROUND_BRACKET_LEFT  :
+        case NH_MAKE_TOKEN_ANGLE_BRACKET_RIGHT :
+        case NH_MAKE_TOKEN_ANGLE_BRACKET_LEFT  :
+        case NH_MAKE_TOKEN_COMMA               :
+            break;
+
+        case NH_MAKE_TOKEN_STRING :
+            if (Token_p[1].type == NH_MAKE_TOKEN_HYPHEN_MINUS) {
+                NH_MAKE_END(nh_make_parseOption(Token_p, Definition_p))
+            }
+            break;
+
+        case NH_MAKE_TOKEN_IDENTIFIER :
+            switch((Token_p+1)->type) {
+                case NH_MAKE_TOKEN_CURLY_BRACKET_LEFT :
+                    NH_MAKE_END(nh_make_parseIf(Token_p, Definition_p))
+                case NH_MAKE_TOKEN_ROUND_BRACKET_LEFT :
+                    NH_MAKE_END(nh_make_parseFunction(Token_p, Definition_p))
+            }
+            break;
+
+        case NH_MAKE_TOKEN_HYPHEN_MINUS :
+            NH_MAKE_END(nh_make_parseOption(Token_p, Definition_p))
+            break;
+    }
+
+NH_MAKE_END(++Token_p)
+}
+
+static NH_MAKE_RESULT nh_make_parseFile(
+    nh_make_Parser *Parser_p, nh_make_File *File_p) 
+{
+NH_MAKE_BEGIN()
+
+#include NH_MAKE_DEFAULT_CHECK
+
+    nh_make_Tokenizer Tokenizer = nh_make_initTokenizer();
+    NH_MAKE_CHECK(nh_make_tokenizeFile(&Tokenizer, File_p))
+
+    nh_make_Token *Token_p = Tokenizer.Tokens_p;
+
+    Parser_p->definitions = 0;
+    Parser_p->Definitions_p = malloc(sizeof(nh_make_Definition));
+    NH_MAKE_CHECK_NULL(Parser_p->Definitions_p)
+
+    while (Token_p->type != NH_MAKE_TOKEN_EOF) {
+        Token_p = nh_make_parseToken(Token_p, &Parser_p->Definitions_p[Parser_p->definitions]);
+        if (Parser_p->Definitions_p[Parser_p->definitions].type != NH_MAKE_DEFINITION_UNDEFINED) {
+            Parser_p->definitions++;
+            Parser_p->Definitions_p = realloc(Parser_p->Definitions_p, sizeof(nh_make_Definition) * (Parser_p->definitions + 1));
+        }
+    }
+
+#include NH_MAKE_CUSTOM_CHECK
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
+// SHOW ============================================================================================
+
+static void nh_make_showParserDefinition(
+    nh_make_Definition *Definition_p, unsigned int depth)
+{
+NH_MAKE_BEGIN()
+
+    NH_BYTE depth_p[255];
+    memset(depth_p, 0, 255);
+
+    for (int i = 0; i < (depth * 2); ++i) {depth_p[i] = ' ';}
+
+    switch (Definition_p->type)
+    {
+        case NH_MAKE_DEFINITION_IF :
+            nh_make_messagef("%s%s", depth_p, Definition_p->If.string_p);
+            nh_make_messagef("%s{", depth_p);
+            for (int j = 0; j < Definition_p->If.Block_p->Block.definitions; ++j) {
+                nh_make_showParserDefinition(&Definition_p->If.Block_p->Block.Definitions_p[j], depth + 1);
+            }
+            nh_make_messagef("%s}", depth_p);
+            break;
+
+        case NH_MAKE_DEFINITION_FUNCTION :
+            nh_make_messagef("%s%s", depth_p, Definition_p->Function.name_p);
+            for (int j = 0; j < Definition_p->Function.arguments; ++j) {
+                nh_make_messagef("%s  %s", depth_p, Definition_p->Function.arguments_pp[j]);
+            }
+            break;
+
+        case NH_MAKE_DEFINITION_BLOCK :
+            nh_make_messagef("%s{", depth_p);
+            for (int j = 0; j < Definition_p->Block.definitions; ++j) {
+                nh_make_showParserDefinition(&Definition_p->Block.Definitions_p[j], depth + 1);
+            }
+            nh_make_messagef("%s}", depth_p);
+            break;
+
+        case NH_MAKE_DEFINITION_OPTION :
+            if (Definition_p->Option.longOption) {
+                nh_make_messagef("%s--%s", depth_p, Definition_p->Option.name_p);
+            }
+            else {
+                nh_make_messagef("%s-%s", depth_p, Definition_p->Option.name_p);
+            }
+            if (Definition_p->Option.description_p) {
+                nh_make_messagef("%s  description: %s", depth_p, Definition_p->Option.description_p);
+            }
+            for (int i = 0; i < Definition_p->Option.arguments; ++i) {
+                nh_make_messagef("%s  argument %d: %s", depth_p, i, Definition_p->Option.arguments_pp[i]);
+            }
+            nh_make_showParserDefinition(Definition_p->Option.Block_p, depth + 1);
+            break;
+    }
+
+NH_MAKE_SILENT_END()
+}
+
+static void nh_make_showParseTree(
+    nh_make_Parser *Parser_p)
+{
+NH_MAKE_BEGIN()
+
+    nh_make_operationf("Show Parse-Tree");
+
+    for (int i = 0; i < Parser_p->definitions; ++i) {
+        nh_make_showParserDefinition(&Parser_p->Definitions_p[i], 0);
+    }
+
+NH_MAKE_SILENT_END()
+}
+
+// PARSER ARRAY ====================================================================================
+
+void nh_make_initParserArray(
+    nh_make_ParserArray *Array_p)
+{
+NH_MAKE_BEGIN()
+
+    Array_p->length = 0;
+    Array_p->Parsers_p = NULL;
+
+NH_MAKE_SILENT_END()
+}
+
+static nh_make_Parser nh_make_initParser()
+{
+NH_MAKE_BEGIN()
+
+    nh_make_Parser Parser;
+    Parser.executed = NH_MAKE_FALSE;
+    Parser.Definitions_p = NULL;
+    Parser.definitions = 0;
+
+NH_MAKE_END(Parser)
+}
+
+NH_MAKE_RESULT nh_make_appendParser(
+    nh_make_ParserArray *Array_p, nh_make_File *File_p, NH_MAKE_BOOL showParseTree)
+{
+NH_MAKE_BEGIN()
+
+#include NH_MAKE_DEFAULT_CHECK
+
+    if (!Array_p->Parsers_p) {
+        Array_p->Parsers_p = malloc(sizeof(nh_make_Parser));
+        NH_MAKE_CHECK_NULL(Array_p->Parsers_p)
+    }
+    else {
+        Array_p->Parsers_p = realloc(Array_p->Parsers_p, sizeof(nh_make_Parser) * (Array_p->length + 1));
+        NH_MAKE_CHECK_NULL(Array_p->Parsers_p)
+    }
+
+    nh_make_Parser *Parser_p = &Array_p->Parsers_p[Array_p->length];
+
+    *Parser_p = nh_make_initParser();
+    NH_MAKE_CHECK(nh_make_parseFile(Parser_p, File_p))
+
+    if (showParseTree) {
+        nh_make_showParseTree(Parser_p);
+    }
+
+    Array_p->length++;
+
+#include NH_MAKE_CUSTOM_CHECK
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
diff --git a/src/lib/nhmake/Parser/Parser.h b/src/lib/nhmake/Parser/Parser.h
new file mode 100644
index 0000000..84c75c1
--- /dev/null
+++ b/src/lib/nhmake/Parser/Parser.h
@@ -0,0 +1,84 @@
+#ifndef NH_MAKE_PARSER_H
+#define NH_MAKE_PARSER_H
+
+#ifndef DOXYGEN_SHOULD_SKIP_THIS
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+#include "Tokenizer.h"
+
+#include "../Common/Types/Private.h"
+
+#include "../Core/File.h"
+
+#endif
+
+/** @addtogroup lib_nhmake_structs
+ *  @{
+ */
+
+    typedef union nh_make_Definition nh_make_Definition;
+
+    typedef struct nh_make_Block {
+        NH_MAKE_DEFINITION type;
+        unsigned int definitions;
+        nh_make_Definition *Definitions_p;
+    } nh_make_Block;
+
+    typedef struct nh_make_Option {
+        NH_MAKE_DEFINITION type;
+        NH_MAKE_BOOL longOption;
+        int arguments;
+        NH_BYTE **arguments_pp;
+        NH_BYTE *name_p;
+        NH_BYTE *description_p;
+        nh_make_Definition *Block_p;
+    } nh_make_Option;
+
+    typedef struct nh_make_If {
+        NH_MAKE_DEFINITION type;
+        NH_BYTE *string_p;
+        nh_make_Definition *Block_p;
+    } nh_make_If;
+
+    typedef union nh_make_Definition {
+        NH_MAKE_DEFINITION type;
+        nh_make_Option Option;
+        nh_make_Function Function;
+        nh_make_Block Block;
+        nh_make_If If;
+    } nh_make_Definition;
+
+    typedef struct nh_make_Parser {
+        NH_MAKE_BOOL executed;
+        NH_MAKE_BOOL expectExpression;
+        unsigned int definitions;
+        nh_make_Definition *Definitions_p;
+    } nh_make_Parser;
+
+    typedef struct nh_make_ParserArray {
+        int length;
+        nh_make_Parser *Parsers_p;
+    } nh_make_ParserArray;
+
+/** @} */
+
+/** @addtogroup lib_nhmake_functions
+ *  @{
+ */
+
+    void nh_make_initParserArray(
+        nh_make_ParserArray *Array_p
+    );
+
+    NH_MAKE_RESULT nh_make_appendParser(
+        nh_make_ParserArray *Array_p, nh_make_File *File_p, NH_MAKE_BOOL showParseTree
+    ); 
+
+/** @} */
+
+#endif
diff --git a/src/lib/nhmake/Parser/Tokenizer.c b/src/lib/nhmake/Parser/Tokenizer.c
new file mode 100644
index 0000000..21df61a
--- /dev/null
+++ b/src/lib/nhmake/Parser/Tokenizer.c
@@ -0,0 +1,230 @@
+// LICENSE NOTICE ==================================================================================
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+// INCLUDE =========================================================================================
+
+#include "Tokenizer.h"
+
+#include "../Core/Utils.h"
+#include "../Common/Macros/Macros.h"
+#include NH_MAKE_FLOW
+#include NH_MAKE_DEFAULT_CHECK
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <ctype.h>
+
+// HELPER ==========================================================================================
+
+static NH_MAKE_BOOL nh_make_isASCIIUpperAlpha(
+    NH_BYTE codepoint)
+{
+NH_MAKE_BEGIN()
+NH_MAKE_END(codepoint >= 0x41 && codepoint <= 0x5A)
+}
+
+static NH_MAKE_BOOL nh_make_isASCIILowerAlpha(
+    NH_BYTE codepoint)
+{
+NH_MAKE_BEGIN()
+NH_MAKE_END(codepoint >= 0x61 && codepoint <= 0x7A)
+}
+
+static NH_MAKE_BOOL nh_make_isASCIIAlpha(
+    NH_BYTE codepoint)
+{
+NH_MAKE_BEGIN()
+NH_MAKE_END(nh_make_isASCIIUpperAlpha(codepoint) || nh_make_isASCIILowerAlpha(codepoint))
+}
+
+static NH_MAKE_BOOL nh_make_isBracket(
+    NH_BYTE codepoint)
+{
+NH_MAKE_BEGIN()
+NH_MAKE_END(codepoint == '(' || codepoint == ')' || codepoint == '{' || codepoint == '}' || codepoint == '[' || codepoint == ']')
+}
+
+static NH_MAKE_BOOL nh_make_isTokenBegin(
+    NH_BYTE codepoint)
+{
+NH_MAKE_BEGIN()
+
+    if (nh_make_isASCIIAlpha(codepoint) || nh_make_isBracket(codepoint) 
+    || codepoint == ',' 
+    || codepoint == '"' 
+    || codepoint == ':' 
+    || codepoint == '-') 
+
+    {NH_MAKE_END(NH_MAKE_TRUE)}
+
+NH_MAKE_END(NH_MAKE_FALSE)
+}
+
+// TOKENIZE ========================================================================================
+
+static NH_BYTE *nh_make_tokenizeString(
+    nh_make_Token *Token_p, NH_BYTE *bytes_p)
+{
+NH_MAKE_BEGIN()
+
+    NH_BYTE *string_p = malloc(1);
+    unsigned int stringLength = 0;
+
+    NH_BYTE *stringBegin_p = bytes_p;
+
+    NH_MAKE_BOOL escape = NH_MAKE_FALSE;
+    while (*bytes_p && (*bytes_p != '"' || escape)) {
+        escape = escape ? NH_MAKE_FALSE : *bytes_p == 0x5C;
+        if (!escape) {
+            string_p = realloc(string_p, stringLength + 1);
+            string_p[stringLength++] = *bytes_p;
+        }
+        bytes_p++;
+    }
+    if (!*bytes_p) {NH_MAKE_END(NULL)}
+
+    *bytes_p = 0;
+
+    string_p = realloc(string_p, stringLength + 1);
+    string_p[stringLength] = 0;
+
+    Token_p->string_p = string_p;
+
+    *bytes_p = '"';
+
+NH_MAKE_END(&bytes_p[1])
+}
+
+static NH_BYTE *nh_make_getToken(
+    nh_make_Token *Token_p, NH_BYTE *bytes_p) 
+{
+NH_MAKE_BEGIN()
+
+    if (!*bytes_p) {NH_MAKE_END(NULL)}
+
+    Token_p->type     = NH_MAKE_TOKEN_UNDEFINED;
+    Token_p->string_p = NULL;
+
+    while (*bytes_p && !nh_make_isTokenBegin(*bytes_p)) {
+        if (bytes_p[0] == '/' && bytes_p[1] == '/') {
+            while (*bytes_p && *bytes_p != '\n') {bytes_p++;}
+        }
+        bytes_p++;
+    }
+    if (!*bytes_p) {NH_MAKE_END(NULL)}
+
+    NH_BYTE *tokenBegin_p = bytes_p;
+
+    switch (*tokenBegin_p) 
+    {
+        case '(' : Token_p->type = NH_MAKE_TOKEN_ROUND_BRACKET_LEFT; break;
+        case ')' : Token_p->type = NH_MAKE_TOKEN_ROUND_BRACKET_RIGHT; break;
+        case '{' : Token_p->type = NH_MAKE_TOKEN_CURLY_BRACKET_LEFT; break;
+        case '}' : Token_p->type = NH_MAKE_TOKEN_CURLY_BRACKET_RIGHT; break;
+        case '[' : Token_p->type = NH_MAKE_TOKEN_ANGLE_BRACKET_LEFT; break;
+        case ']' : Token_p->type = NH_MAKE_TOKEN_ANGLE_BRACKET_RIGHT; break;
+        case '-' : Token_p->type = NH_MAKE_TOKEN_HYPHEN_MINUS; break;
+        case ',' : Token_p->type = NH_MAKE_TOKEN_COMMA; break;
+        case ':' : Token_p->type = NH_MAKE_TOKEN_COLON; break;
+        case '"' :
+            Token_p->type = NH_MAKE_TOKEN_STRING;
+            NH_MAKE_END(nh_make_tokenizeString(Token_p, &bytes_p[1]))
+            break;
+    }
+    
+    if (Token_p->type != NH_MAKE_TOKEN_UNDEFINED) {
+        NH_MAKE_END(&bytes_p[1])
+    }
+
+    while (*bytes_p && (nh_make_isASCIIAlpha(*bytes_p) || *bytes_p == '_')) {bytes_p++;}
+    if (!*bytes_p) {NH_MAKE_END(NULL)}
+
+    NH_BYTE tmp = *bytes_p;
+    *bytes_p = 0;    
+
+    Token_p->type = NH_MAKE_TOKEN_IDENTIFIER;
+    Token_p->string_p = malloc(strlen(tokenBegin_p) + 1);
+    strcpy(Token_p->string_p, tokenBegin_p);
+
+    *bytes_p = tmp;
+
+NH_MAKE_END(bytes_p)
+}
+
+static void nh_make_getTokens(
+    nh_make_Token *Tokens_p, NH_BYTE *bytes_p, unsigned int *tokens_p) 
+{
+NH_MAKE_BEGIN()
+
+    unsigned int tokens = 0;
+
+    while (bytes_p)
+    {
+        nh_make_Token Token;
+        bytes_p = nh_make_getToken(&Token, bytes_p);
+        if (Tokens_p) {Tokens_p[tokens] = Token;}
+        tokens++;
+    }
+
+    if (Tokens_p) {
+        Tokens_p[tokens - 1].type = NH_MAKE_TOKEN_EOF;        
+    }
+
+    if (tokens_p) {*tokens_p = tokens;}
+
+NH_MAKE_SILENT_END()
+}
+
+NH_MAKE_RESULT nh_make_tokenizeFile(
+    nh_make_Tokenizer *Tokenizer_p, nh_make_File *File_p) 
+{
+NH_MAKE_BEGIN()
+
+    NH_BYTE *bytes_p = malloc(strlen(File_p->data_p) + 1);
+    NH_MAKE_CHECK_NULL(bytes_p)
+    strcpy(bytes_p, File_p->data_p);
+
+    unsigned int tokens = 0;
+    nh_make_getTokens(NULL, bytes_p, &tokens);
+
+    free(bytes_p);
+    bytes_p = NULL;
+
+    bytes_p = malloc(strlen(File_p->data_p) + 1);
+    NH_MAKE_CHECK_NULL(bytes_p)
+    strcpy(bytes_p, File_p->data_p);
+
+    nh_make_Token *Tokens_p = malloc(sizeof(nh_make_Token) * tokens);
+    for (int i = 0; i < tokens; ++i) {
+        Tokens_p[i].string_p = NULL;
+    }
+    nh_make_getTokens(Tokens_p, bytes_p, NULL);
+
+    free(bytes_p);
+
+    Tokenizer_p->tokens   = tokens;
+    Tokenizer_p->Tokens_p = Tokens_p;
+
+NH_MAKE_END(NH_MAKE_SUCCESS)
+}
+
+// INIT ============================================================================================
+
+nh_make_Tokenizer nh_make_initTokenizer()
+{
+NH_MAKE_BEGIN()
+
+    nh_make_Tokenizer Tokenizer;
+    Tokenizer.tokens = 0;
+    Tokenizer.Tokens_p = NULL;
+
+NH_MAKE_END(Tokenizer)
+}
+
diff --git a/src/lib/nhmake/Parser/Tokenizer.h b/src/lib/nhmake/Parser/Tokenizer.h
new file mode 100644
index 0000000..573f740
--- /dev/null
+++ b/src/lib/nhmake/Parser/Tokenizer.h
@@ -0,0 +1,47 @@
+#ifndef NH_MAKE_TOKENIZER_H
+#define NH_MAKE_TOKENIZER_H
+
+#ifndef DOXYGEN_SHOULD_SKIP_THIS
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+#include "../Common/Types/Private.h"
+
+#include "../Core/File.h"
+
+#endif
+
+/** @addtogroup lib_nhmake_structs
+ *  @{
+ */
+
+    typedef struct nh_make_Token {
+        NH_MAKE_TOKEN type;
+        NH_BYTE *string_p;
+    } nh_make_Token;
+
+    typedef struct nh_make_Tokenizer {
+        unsigned int tokens;
+        nh_make_Token *Tokens_p;
+    } nh_make_Tokenizer;
+
+/** @} */
+
+/** @addtogroup lib_nhmake_functions
+ *  @{
+ */
+
+    nh_make_Tokenizer nh_make_initTokenizer(
+    );
+
+    NH_MAKE_RESULT nh_make_tokenizeFile(
+        nh_make_Tokenizer *Tokenizer_p, nh_make_File *File_p 
+    ); 
+
+/** @} */
+
+#endif
diff --git a/external/selfmake/src/lib/Parser/Variables.c b/src/lib/nhmake/Parser/Variables.c
similarity index 50%
rename from external/selfmake/src/lib/Parser/Variables.c
rename to src/lib/nhmake/Parser/Variables.c
index e232160..613f6b3 100644
--- a/external/selfmake/src/lib/Parser/Variables.c
+++ b/src/lib/nhmake/Parser/Variables.c
@@ -1,8 +1,8 @@
 // LICENSE NOTICE ==================================================================================
 
 /**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
  * Published under MIT
  */
 
@@ -12,8 +12,8 @@
 #include "Tokenizer.h"
 
 #include "../Common/Macros/Macros.h"
-#include SM_FLOW
-#include SM_CUSTOM_CHECK
+#include NH_MAKE_FLOW
+#include NH_MAKE_CUSTOM_CHECK
 
 #include <stdio.h>
 #include <stdlib.h>
@@ -23,102 +23,102 @@
 
 // INIT ============================================================================================
 
-void sm_initVariableArray(
-    sm_VariableArray *Array_p)
+void nh_make_initVariableArray(
+    nh_make_VariableArray *Array_p)
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
     Array_p->length = 0;
     Array_p->Variables_p = NULL;
 
-SM_SILENT_END()
+NH_MAKE_SILENT_END()
 }
 
 // UPDATE ==========================================================================================
 
-sm_Variable *sm_getVariable(
-    sm_VariableArray *Array_p, SM_BYTE *name_p)
+nh_make_Variable *nh_make_getVariable(
+    nh_make_VariableArray *Array_p, NH_BYTE *name_p)
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
     for (int i = 0; i < Array_p->length; ++i) {
         if (!strcmp(name_p, Array_p->Variables_p[i].name_p)) {
-            SM_END(&Array_p->Variables_p[i])
+            NH_MAKE_END(&Array_p->Variables_p[i])
         }
     }
 
-SM_END(NULL)
+NH_MAKE_END(NULL)
 }
 
-static sm_Variable *sm_createVariable(
-    sm_VariableArray *Array_p, SM_BYTE *name_p)
+static nh_make_Variable *nh_make_createVariable(
+    nh_make_VariableArray *Array_p, NH_BYTE *name_p)
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
     if (!Array_p->Variables_p) {
-        Array_p->Variables_p = malloc(sizeof(sm_Variable));
-        SM_CHECK_NULL(NULL, Array_p->Variables_p)
+        Array_p->Variables_p = malloc(sizeof(nh_make_Variable));
+        NH_MAKE_CHECK_NULL(NULL, Array_p->Variables_p)
     }
     else {
-        Array_p->Variables_p = realloc(Array_p->Variables_p, sizeof(sm_Variable) * (Array_p->length + 1));
-        SM_CHECK_NULL(NULL, Array_p->Variables_p)
+        Array_p->Variables_p = realloc(Array_p->Variables_p, sizeof(nh_make_Variable) * (Array_p->length + 1));
+        NH_MAKE_CHECK_NULL(NULL, Array_p->Variables_p)
     }
  
-    sm_Variable *Variable_p = &Array_p->Variables_p[Array_p->length];
+    nh_make_Variable *Variable_p = &Array_p->Variables_p[Array_p->length];
 
     Variable_p->values_pp = NULL;
     Variable_p->valueCount = 0;
 
     Variable_p->name_p = malloc(strlen(name_p) + 1);
-    SM_CHECK_NULL(NULL, Variable_p->name_p)
+    NH_MAKE_CHECK_NULL(NULL, Variable_p->name_p)
     sprintf(Variable_p->name_p, name_p);
 
     Array_p->length++;
 
-SM_END(Variable_p)
+NH_MAKE_END(Variable_p)
 }
 
-SM_RESULT sm_appendToVariable(
-    sm_VariableArray *Array_p, SM_BYTE *variable_p, SM_BYTE **values_pp, int valueCount)
+NH_MAKE_RESULT nh_make_appendToVariable(
+    nh_make_VariableArray *Array_p, NH_BYTE *variable_p, NH_BYTE **values_pp, int valueCount)
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
-#include SM_DEFAULT_CHECK
+#include NH_MAKE_DEFAULT_CHECK
 
-    sm_Variable *Variable_p = sm_getVariable(Array_p, variable_p);
+    nh_make_Variable *Variable_p = nh_make_getVariable(Array_p, variable_p);
     if (!Variable_p) {
-        Variable_p = sm_createVariable(Array_p, variable_p);
+        Variable_p = nh_make_createVariable(Array_p, variable_p);
     }
-    SM_CHECK_NULL(Variable_p)
+    NH_MAKE_CHECK_NULL(Variable_p)
 
-    Variable_p->values_pp = realloc(Variable_p->values_pp, sizeof(SM_BYTE*) * (Variable_p->valueCount + valueCount));
-    SM_CHECK_NULL(Variable_p->values_pp)
+    Variable_p->values_pp = realloc(Variable_p->values_pp, sizeof(NH_BYTE*) * (Variable_p->valueCount + valueCount));
+    NH_MAKE_CHECK_NULL(Variable_p->values_pp)
 
     for (int i = Variable_p->valueCount, j = 0; i < valueCount + Variable_p->valueCount; ++i, ++j) {
         Variable_p->values_pp[i] = malloc(strlen(values_pp[j]) + 1);
-        SM_CHECK_NULL(Variable_p->values_pp[i])
+        NH_MAKE_CHECK_NULL(Variable_p->values_pp[i])
         sprintf(Variable_p->values_pp[i], values_pp[j]);
     }
 
     Variable_p->valueCount += valueCount;
 
-#include SM_CUSTOM_CHECK
+#include NH_MAKE_CUSTOM_CHECK
 
-SM_END(SM_SUCCESS)
+NH_MAKE_END(NH_MAKE_SUCCESS)
 }
 
-SM_RESULT sm_updateVariable(
-    sm_VariableArray *Array_p, SM_BYTE *variable_p, SM_BYTE **values_pp, int valueCount)
+NH_MAKE_RESULT nh_make_updateVariable(
+    nh_make_VariableArray *Array_p, NH_BYTE *variable_p, NH_BYTE **values_pp, int valueCount)
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
-#include SM_DEFAULT_CHECK
+#include NH_MAKE_DEFAULT_CHECK
 
-    sm_Variable *Variable_p = sm_getVariable(Array_p, variable_p);
+    nh_make_Variable *Variable_p = nh_make_getVariable(Array_p, variable_p);
     if (!Variable_p) {
-        Variable_p = sm_createVariable(Array_p, variable_p);
+        Variable_p = nh_make_createVariable(Array_p, variable_p);
     }
-    SM_CHECK_NULL(Variable_p)
+    NH_MAKE_CHECK_NULL(Variable_p)
 
     if (Variable_p->values_pp) {
         for (int i = 0; i < Variable_p->valueCount; ++i) {
@@ -127,12 +127,12 @@ SM_BEGIN()
         free(Variable_p->values_pp);
     }
 
-    Variable_p->values_pp = malloc(sizeof(SM_BYTE*) * valueCount);
-    SM_CHECK_NULL(Variable_p->values_pp)
+    Variable_p->values_pp = malloc(sizeof(NH_BYTE*) * valueCount);
+    NH_MAKE_CHECK_NULL(Variable_p->values_pp)
 
     for (int i = 0; i < valueCount; ++i) {
         Variable_p->values_pp[i] = malloc(strlen(values_pp[i]) + 1);
-        SM_CHECK_NULL(Variable_p->values_pp[i])
+        NH_MAKE_CHECK_NULL(Variable_p->values_pp[i])
         sprintf(Variable_p->values_pp[i], values_pp[i]);
     }
 
@@ -142,19 +142,19 @@ SM_BEGIN()
         chdir(Variable_p->values_pp[0]);
     }
 
-#include SM_CUSTOM_CHECK
+#include NH_MAKE_CUSTOM_CHECK
 
-SM_END(SM_SUCCESS)
+NH_MAKE_END(NH_MAKE_SUCCESS)
 }
 
 // REPLACE =========================================================================================
 
-static SM_BYTE *sm_substituteVariableCallsInString(
-    sm_VariableArray *Array_p, SM_BYTE *string_p)
+static NH_BYTE *nh_make_substituteVariableCallsInString(
+    nh_make_VariableArray *Array_p, NH_BYTE *string_p)
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
-    SM_BYTE *begin_p = NULL;
+    NH_BYTE *begin_p = NULL;
 
     for (int i = 0; i < strlen(string_p); ++i) {
         if (string_p[i] == '$' && i + 1 < strlen(string_p) && string_p[i + 1] == '{') {
@@ -165,18 +165,18 @@ SM_BEGIN()
 
     if (begin_p) 
     {
-        SM_BYTE *end_p = begin_p;
+        NH_BYTE *end_p = begin_p;
         while (*end_p != '}') {++end_p;}
         *end_p = 0;
 
         int nameLength = strlen(begin_p + 2);
-        sm_Variable *Var_p = sm_getVariable(Array_p, begin_p + 2);
+        nh_make_Variable *Var_p = nh_make_getVariable(Array_p, begin_p + 2);
         *end_p = '}';
 
-        if (!Var_p) {SM_END(string_p)}
+        if (!Var_p) {NH_MAKE_END(string_p)}
 
-        SM_BYTE *newString_p = malloc((strlen(string_p) - strlen(Var_p->name_p) - 3) + strlen(Var_p->values_pp[0]) + 1);
-        SM_CHECK_NULL(NULL, newString_p)
+        NH_BYTE *newString_p = malloc((strlen(string_p) - strlen(Var_p->name_p) - 3) + strlen(Var_p->values_pp[0]) + 1);
+        NH_MAKE_CHECK_NULL(NULL, newString_p)
 
         *end_p = 0;
         *begin_p = 0;
@@ -186,22 +186,22 @@ SM_BEGIN()
         sprintf(newString_p + strlen(newString_p), end_p + 1); 
 
         free(string_p);
-        SM_END(sm_substituteVariableCallsInString(Array_p, newString_p))
+        NH_MAKE_END(nh_make_substituteVariableCallsInString(Array_p, newString_p))
     }
 
-SM_END(string_p)
+NH_MAKE_END(string_p)
 }
 
-SM_BYTE *sm_substituteVariables(
-    sm_VariableArray *Array_p, SM_BYTE *string_p)
+NH_BYTE *nh_make_substituteVariables(
+    nh_make_VariableArray *Array_p, NH_BYTE *string_p)
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
-    SM_BYTE *newString_p = malloc(strlen(string_p) + 1);
-    SM_CHECK_NULL(NULL, newString_p)
+    NH_BYTE *newString_p = malloc(strlen(string_p) + 1);
+    NH_MAKE_CHECK_NULL(NULL, newString_p)
 
     sprintf(newString_p, string_p);
 
-SM_END(sm_substituteVariableCallsInString(Array_p, newString_p)) 
+NH_MAKE_END(nh_make_substituteVariableCallsInString(Array_p, newString_p)) 
 }
 
diff --git a/src/lib/nhmake/Parser/Variables.h b/src/lib/nhmake/Parser/Variables.h
new file mode 100644
index 0000000..f43deef
--- /dev/null
+++ b/src/lib/nhmake/Parser/Variables.h
@@ -0,0 +1,59 @@
+#ifndef NH_MAKE_VARIABLES_H
+#define NH_MAKE_VARIABLES_H
+
+#ifndef DOXYGEN_SHOULD_SKIP_THIS
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+#include "../Common/Types/Private.h"
+
+#endif
+
+/** @addtogroup lib_nhmake_structs
+ *  @{
+ */
+
+    typedef struct nh_make_Variable {
+        NH_BYTE *name_p;
+        int valueCount;
+        NH_BYTE **values_pp;
+    } nh_make_Variable;
+
+    typedef struct nh_make_VariableArray {
+        int length;
+        nh_make_Variable *Variables_p;
+    } nh_make_VariableArray;
+
+/** @} */
+
+/** @addtogroup lib_nhmake_functions
+ *  @{
+ */
+
+    void nh_make_initVariableArray(
+        nh_make_VariableArray *Array_p
+    );
+
+    nh_make_Variable *nh_make_getVariable(
+        nh_make_VariableArray *Array_p, NH_BYTE *name_p
+    );
+
+    NH_MAKE_RESULT nh_make_appendToVariable(
+        nh_make_VariableArray *Array_p, NH_BYTE *variable_p, NH_BYTE **values_pp, int valueCount
+    );
+
+    NH_MAKE_RESULT nh_make_updateVariable(
+        nh_make_VariableArray *Array_p, NH_BYTE *variable_p, NH_BYTE **values_pp, int valueCount
+    );
+
+    NH_BYTE *nh_make_substituteVariables(
+        nh_make_VariableArray *Array_p, NH_BYTE *string_p
+    );
+
+/** @} */
+
+#endif
diff --git a/external/selfmake/src/lib/Test/Channel.c b/src/lib/nhmake/Test/Channel.c
similarity index 66%
rename from external/selfmake/src/lib/Test/Channel.c
rename to src/lib/nhmake/Test/Channel.c
index 18ee0d0..4de84a8 100644
--- a/external/selfmake/src/lib/Test/Channel.c
+++ b/src/lib/nhmake/Test/Channel.c
@@ -1,8 +1,8 @@
 // LICENSE NOTICE ==================================================================================
 
 /**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
  * Published under MIT
  */
 
@@ -11,8 +11,8 @@
 #include "Channel.h"
 
 #include "../Common/Macros/Macros.h"
-#include SM_FLOW
-#include SM_DEFAULT_CHECK
+#include NH_MAKE_FLOW
+#include NH_MAKE_DEFAULT_CHECK
 
 #include <sys/time.h>
 #include <unistd.h>
@@ -22,71 +22,71 @@
 
 // INIT ============================================================================================
 
-SM_RESULT sm_initChannel(
-    sm_Channel *Channel_p)
+NH_MAKE_RESULT nh_make_initChannel(
+    nh_make_Channel *Channel_p)
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
 #if defined(__linux__) || defined(__APPLE__)
     Channel_p->rw_p[0] = 0;
     Channel_p->rw_p[1] = 0;
 #endif
 
-SM_DIAGNOSTIC_END(SM_SUCCESS)
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
 }
 
-SM_RESULT sm_openChannel(
-    sm_Channel *Channel_p)
+NH_MAKE_RESULT nh_make_openChannel(
+    nh_make_Channel *Channel_p)
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
 #if defined(__linux__) || defined(__APPLE__)
     pipe(Channel_p->rw_p);
 #endif
 
-SM_DIAGNOSTIC_END(SM_SUCCESS)
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
 }
 
-void sm_closeChannelReadAccess(
-    sm_Channel *Channel_p)
+void nh_make_closeChannelReadAccess(
+    nh_make_Channel *Channel_p)
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
 #if defined(__linux__) || defined(__APPLE__)
     close(Channel_p->rw_p[0]);
 #endif
 
-SM_SILENT_END()
+NH_MAKE_SILENT_END()
 }
 
-void sm_closeChannelWriteAccess(
-    sm_Channel *Channel_p)
+void nh_make_closeChannelWriteAccess(
+    nh_make_Channel *Channel_p)
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
 #if defined(__linux__) || defined(__APPLE__)
     close(Channel_p->rw_p[1]);
 #endif
 
-SM_SILENT_END()
+NH_MAKE_SILENT_END()
 }
 
-int sm_writeToChannel(
-    sm_Channel *Channel_p, char *bytes_p, int byteCount)
+int nh_make_writeToChannel(
+    nh_make_Channel *Channel_p, char *bytes_p, int byteCount)
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
 #if defined(__linux__) || defined(__APPLE__)
     int result = write(Channel_p->rw_p[1], bytes_p, byteCount);
 #endif
 
-SM_END(result)
+NH_MAKE_END(result)
 }
 
-char *sm_readFromChannel(
-    sm_Channel *Channel_p, size_t *size_p)
+char *nh_make_readFromChannel(
+    nh_make_Channel *Channel_p, size_t *size_p)
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
 #if defined(__linux__) || defined(__APPLE__)
 
@@ -114,11 +114,11 @@ SM_BEGIN()
             buff_p = realloc(buff_p, offset + 128);
             memset(buff_p + offset, '\0', 128);
         }
-        SM_END(buff_p);
+        NH_MAKE_END(buff_p);
     }
 
 #endif
 
-SM_END(NULL)
+NH_MAKE_END(NULL)
 }
 
diff --git a/src/lib/nhmake/Test/Channel.h b/src/lib/nhmake/Test/Channel.h
new file mode 100644
index 0000000..973d38b
--- /dev/null
+++ b/src/lib/nhmake/Test/Channel.h
@@ -0,0 +1,61 @@
+#ifndef NH_MAKE_CHANNEL_H
+#define NH_MAKE_CHANNEL_H
+
+#ifndef DOXYGEN_SHOULD_SKIP_THIS
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+#include "../Common/Result.h"
+
+#include <stddef.h>
+
+#endif
+
+/** @addtogroup smcoreStructs
+ *  @{
+ */
+
+    // TODO semaphore etc.
+    typedef struct nh_make_Channel {
+#if defined(__linux__) || defined(__APPLE__)
+        int rw_p[2];
+#endif
+    } nh_make_Channel;
+
+/** @} */
+
+/** @addtogroup smcoreFunctions
+ *  @{
+ */
+
+    NH_MAKE_RESULT nh_make_initChannel(
+        nh_make_Channel *Channel_p
+    );
+    
+    NH_MAKE_RESULT nh_make_openChannel(
+        nh_make_Channel *Channel_p
+    );
+    
+    void nh_make_closeChannelReadAccess(
+        nh_make_Channel *Channel_p
+    );
+    
+    void nh_make_closeChannelWriteAccess(
+        nh_make_Channel *Channel_p
+    );
+    
+    int nh_make_writeToChannel(
+        nh_make_Channel *Channel_p, char *bytes_p, int byteCount
+    );
+    
+    char *nh_make_readFromChannel(
+        nh_make_Channel *Channel_p, size_t *size_p
+    );
+
+/** @} */
+
+#endif 
diff --git a/external/selfmake/src/lib/Test/Library.c b/src/lib/nhmake/Test/Library.c
similarity index 77%
rename from external/selfmake/src/lib/Test/Library.c
rename to src/lib/nhmake/Test/Library.c
index 11576c3..7e7b2e9 100644
--- a/external/selfmake/src/lib/Test/Library.c
+++ b/src/lib/nhmake/Test/Library.c
@@ -1,8 +1,8 @@
 // LICENSE NOTICE ==================================================================================
 
 /**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
  * Published under MIT
  */
 
@@ -10,10 +10,9 @@
 
 #include "Library.h"
 
-#include "../Common/Types.h"
 #include "../Common/Macros/Macros.h"
-#include SM_FLOW
-#include SM_DEFAULT_CHECK
+#include NH_MAKE_FLOW
+#include NH_MAKE_DEFAULT_CHECK
 
 #include <unistd.h>
 #include <dlfcn.h>
@@ -28,12 +27,12 @@
 
 // TEST ============================================================================================
 
-void *sm_openLibrary(
-    SM_BYTE *path_p)
+void *nh_make_openLibrary(
+    NH_BYTE *path_p)
 {
 #if defined(__linux__) || defined(__APPLE__)
 
-    SM_BYTE *error_p;
+    NH_BYTE *error_p;
     dlerror();
 
     void *dl_p = dlopen(path_p, RTLD_NOW | RTLD_GLOBAL);
@@ -48,7 +47,7 @@ void *sm_openLibrary(
 #endif
 }
 
-void sm_closeLibrary(
+void nh_make_closeLibrary(
     void *lib_p)
 {
 #if defined(__linux__) || defined(__APPLE__)
@@ -58,13 +57,13 @@ void sm_closeLibrary(
 #endif
 }
 
-SM_RESULT sm_getExeDir(
-    SM_BYTE *buffer_p, size_t size)
+NH_MAKE_RESULT nh_make_getExeDir(
+    NH_BYTE *buffer_p, size_t size)
 {
 #if defined(__linux__)
     if (readlink("/proc/self/exe", buffer_p, size) == -1 
     &&  readlink("/proc/curproc/file", buffer_p, size) == -1
-    &&  readlink("/proc/self/path/a.out", buffer_p, size) == -1) {SM_END(SM_ERROR_BAD_STATE)}
+    &&  readlink("/proc/self/path/a.out", buffer_p, size) == -1) {NH_MAKE_END(NH_MAKE_ERROR_BAD_STATE)}
 #elif defined(__APPLE__)
     size = 0;
     _NSGetExecutablePath(NULL, &size);
@@ -72,20 +71,20 @@ SM_RESULT sm_getExeDir(
 
     int i;
     for (i = strlen(buffer_p); i > -1 && buffer_p[i] != '/'; --i) {}
-    if (i == -1) {return SM_ERROR_BAD_STATE;}
+    if (i == -1) {return NH_MAKE_ERROR_BAD_STATE;}
 
     buffer_p[i] = '\0'; // remove exe name
-    return SM_SUCCESS;
+    return NH_MAKE_SUCCESS;
 
 #endif
 }
 
-void *sm_loadSymbol(
-    void *lib_p, const SM_BYTE *name_p)
+void *nh_make_loadSymbol(
+    void *lib_p, const NH_BYTE *name_p)
 {
 #if defined(__linux__) || defined(__APPLE__)
 
-    SM_BYTE *error_p;
+    NH_BYTE *error_p;
     dlerror(); // clear any existing error
 
     void *function_p = dlsym(lib_p, name_p); 
diff --git a/src/lib/nhmake/Test/Library.h b/src/lib/nhmake/Test/Library.h
new file mode 100644
index 0000000..93d9334
--- /dev/null
+++ b/src/lib/nhmake/Test/Library.h
@@ -0,0 +1,40 @@
+#ifndef NH_MAKE_LIBRARY_H
+#define NH_MAKE_LIBRARY_H
+
+#ifndef DOXYGEN_SHOULD_SKIP_THIS
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+#include "../Common/Types/Private.h"
+
+#include <stddef.h>
+
+#endif
+
+/** @addtogroup lib_nhmake_functions
+ *  @{
+ */
+
+    void *nh_make_openLibrary(
+        NH_BYTE *path_p
+    );
+    
+    void nh_make_closeLibrary(
+        void *lib_p
+    );
+    
+    NH_MAKE_RESULT nh_make_getExeDir(
+        NH_BYTE *buffer_p, size_t size
+    );
+    
+    void *nh_make_loadSymbol(
+        void *lib_p, const NH_BYTE *name_p
+    );
+
+/** @} */
+
+#endif
diff --git a/src/lib/nhmake/Test/Process.c b/src/lib/nhmake/Test/Process.c
new file mode 100644
index 0000000..8aedee4
--- /dev/null
+++ b/src/lib/nhmake/Test/Process.c
@@ -0,0 +1,157 @@
+// LICENSE NOTICE ==================================================================================
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+// INCLUDE =========================================================================================
+
+#include "Process.h"
+#include "Channel.h"
+
+#include "../Common/Macros/Macros.h"
+#include NH_MAKE_FLOW
+#include NH_MAKE_DEFAULT_CHECK
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <unistd.h>
+#include <errno.h>
+#include <string.h>
+
+#if defined(__linux__) || defined(__APPLE__)
+    #include <sys/wait.h>
+    #include <signal.h>
+#endif
+
+// FORK ============================================================================================
+
+static nh_make_Process nh_make_initProcess()
+{
+NH_MAKE_BEGIN()
+
+    nh_make_Process Process;
+    Process.id = 0;
+
+    nh_make_initChannel(&Process.IPC.In);
+    nh_make_initChannel(&Process.IPC.Out);
+
+NH_MAKE_END(Process)
+}
+
+nh_make_Process nh_make_fork()
+{
+NH_MAKE_BEGIN()
+
+#include NH_MAKE_CUSTOM_CHECK
+
+    nh_make_Process Fork = nh_make_initProcess();
+
+    nh_make_openChannel(&Fork.IPC.In);
+    nh_make_openChannel(&Fork.IPC.Out);
+
+    Fork.id = fork();
+
+    if (Fork.id == 0) { // child
+        nh_make_closeChannelWriteAccess(&Fork.IPC.In);
+        nh_make_closeChannelReadAccess(&Fork.IPC.Out);
+        NH_MAKE_END(Fork)
+    }
+
+    nh_make_closeChannelReadAccess(&Fork.IPC.In);
+    nh_make_closeChannelWriteAccess(&Fork.IPC.Out);
+
+#include NH_MAKE_DEFAULT_CHECK
+
+NH_MAKE_END(Fork)
+}
+
+
+
+
+
+
+
+
+
+
+
+
+// TODO ============================================================================
+
+static NH_MAKE_RESULT nh_make_unregisterFork(
+    nh_make_Process *Fork_p)
+{
+NH_MAKE_BEGIN()
+
+    if (Fork_p->id == 0) {NH_MAKE_DIAGNOSTIC_END(NH_MAKE_ERROR_BAD_STATE)}
+
+    nh_make_closeChannelWriteAccess(&Fork_p->IPC.In);
+    nh_make_closeChannelReadAccess(&Fork_p->IPC.Out);
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
+void nh_make_checkForks()
+{
+NH_MAKE_BEGIN()
+
+//    if (init == NH_MAKE_FALSE) {NH_MAKE_SILENT_END()}
+//
+//    for (int i = 0; i < NH_MAKE_MAX_FORKS; ++i) {
+//        nh_make_Process *Proc_p = &NH_MAKE_PROCESS_POOL.Forks_p[i];
+//        if (Proc_p->id != 0) {
+//            int status;
+//#if defined(__linux__) || defined(__APPLE__)
+//            int result = waitpid(Proc_p->id, &status, WNOHANG);
+//            if (result == -1) {
+//                printf("nh_make_checkForks %s\n", strerror(errno));
+//            }
+//            if (result == -1 || WIFEXITED(status)) {
+//                nh_make_unregisterFork(&NH_MAKE_PROCESS_POOL.Forks_p[i]);
+//            }
+//#endif
+//        }
+//    }
+
+NH_MAKE_SILENT_END()
+}
+
+void nh_make_killFork(
+    nh_make_Process *Fork_p)
+{
+NH_MAKE_BEGIN()
+
+    kill(Fork_p->id, SIGTERM);
+    nh_make_unregisterFork(Fork_p);
+
+NH_MAKE_SILENT_END()
+}
+
+// WRITE ===========================================================================================
+
+NH_BYTE *_nh_make_writeToProcess(
+    nh_make_Process *Proc_p, NH_BYTE *write_p, int writeLen, NH_MAKE_BOOL getResponse)
+{
+    nh_make_writeToChannel(&Proc_p->IPC.In, write_p, writeLen);
+
+    while (getResponse) 
+    {
+        NH_BYTE *response_p = nh_make_readFromChannel(&Proc_p->IPC.Out, NULL);
+        if (response_p != NULL) {
+            return response_p;
+        }
+    }
+
+    return NULL;
+}
+
+NH_BYTE *nh_make_writeToProcess(
+    nh_make_Process *Proc_p, NH_BYTE *write_p, int writeLen, NH_MAKE_BOOL getResponse)
+{
+NH_MAKE_BEGIN()
+NH_MAKE_END(_nh_make_writeToProcess(Proc_p, write_p, writeLen, getResponse))
+}
+
diff --git a/src/lib/nhmake/Test/Process.h b/src/lib/nhmake/Test/Process.h
new file mode 100644
index 0000000..675cc3b
--- /dev/null
+++ b/src/lib/nhmake/Test/Process.h
@@ -0,0 +1,49 @@
+#ifndef NH_MAKE_PROCESS_H
+#define NH_MAKE_PROCESS_H
+
+#ifndef DOXYGEN_SHOULD_SKIP_THIS
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+#include "Channel.h"
+
+#include "../Common/Types/Private.h"
+
+#include <sys/types.h> 
+
+#endif
+
+/** @addtogroup lib_nhmake_structs
+ *  @{
+ */
+
+#if defined(__unix__) || defined(__APPLE__)
+    typedef pid_t NH_MAKE_PROCESS;
+#endif
+
+    typedef struct nh_make_ProcessIPC {
+        nh_make_Channel In;
+        nh_make_Channel Out;
+    } nh_make_ProcessIPC;
+
+    typedef struct nh_make_Process {
+        NH_MAKE_PROCESS id;
+        nh_make_ProcessIPC IPC;
+    } nh_make_Process;
+
+/** @} */
+
+/** @addtogroup lib_nhmake_functions
+ *  @{
+ */
+
+    nh_make_Process nh_make_fork(
+    );
+
+/** @} */
+
+#endif
diff --git a/src/lib/nhmake/Test/Test.c b/src/lib/nhmake/Test/Test.c
new file mode 100644
index 0000000..c46bea0
--- /dev/null
+++ b/src/lib/nhmake/Test/Test.c
@@ -0,0 +1,315 @@
+// LICENSE NOTICE ==================================================================================
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+// INCLUDE =========================================================================================
+
+#include "Test.h"
+#include "Channel.h"
+#include "Process.h"
+#include "Library.h"
+
+#include "../Core/Runtime.h"
+#include "../Parser/Variables.h"
+
+#include "../Common/Macros/Macros.h"
+#include NH_MAKE_FLOW
+#include NH_MAKE_DEFAULT_CHECK
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <unistd.h>
+#include <errno.h>
+#include <string.h>
+
+#if defined(__linux__) || defined(__APPLE__)
+    #include <sys/wait.h>
+#endif
+
+// TEST ============================================================================================
+
+typedef int (*nh_make_initializer_f)();
+typedef void *(*nh_make_customLoader_f)(NH_BYTE *libraryName_p, NH_BYTE *functionName_p);
+typedef int (*nh_make_test_f)(int arguments, nh_make_TestArgument *Arguments_p, NH_BYTE *output_p, int maxOutputLength);
+
+static NH_MAKE_RESULT nh_make_runTests(
+    nh_make_TestEnvironment *TestEnvironment_p)
+{
+NH_MAKE_BEGIN()
+
+    void *initLib_p = NULL;
+    void *loadLib_p = NULL;
+
+    if (TestEnvironment_p->Initializer_p) 
+    {
+        initLib_p = nh_make_openLibrary(TestEnvironment_p->Initializer_p->libraryName_p);
+        NH_MAKE_CHECK_NULL(initLib_p)
+
+        nh_make_initializer_f initializer_f = nh_make_loadSymbol(initLib_p, TestEnvironment_p->Initializer_p->functionName_p);
+        NH_MAKE_CHECK_NULL(initializer_f)
+
+        // run custom initializer
+        if (initializer_f()) {NH_MAKE_END(NH_MAKE_ERROR_BAD_STATE)}
+    }
+
+    nh_make_customLoader_f customLoader_f = NULL;
+
+    if (TestEnvironment_p->Loader_p) 
+    {
+        loadLib_p = nh_make_openLibrary(TestEnvironment_p->Loader_p->libraryName_p);
+        NH_MAKE_CHECK_NULL(loadLib_p)
+
+        customLoader_f = nh_make_loadSymbol(loadLib_p, TestEnvironment_p->Loader_p->functionName_p);
+        NH_MAKE_CHECK_NULL(customLoader_f)
+    }
+
+    NH_MAKE_BOOL match = NH_MAKE_FALSE;
+
+    for (int i = 0; i < TestEnvironment_p->TestArray_p->length; ++i) 
+    {
+        nh_make_Test *Test_p = &TestEnvironment_p->TestArray_p->Tests_p[i];
+        nh_make_test_f test_f = NULL;
+
+        if (strcmp(Test_p->Context_p->name_p, TestEnvironment_p->target_p)) {continue;}
+
+        if (customLoader_f) {
+            test_f = customLoader_f(Test_p->Context_p->name_p, Test_p->name_p);
+        }
+        else {
+            Test_p->dl_p = nh_make_openLibrary(Test_p->Context_p->name_p);
+            NH_MAKE_CHECK_NULL(Test_p->dl_p)
+            test_f = nh_make_loadSymbol(Test_p->dl_p, Test_p->name_p);
+        }
+
+        NH_MAKE_CHECK_NULL(test_f)
+
+        NH_BYTE result_p[1024];
+        memset(result_p, 0, 1024);
+
+        // perform the test
+        int result = test_f(Test_p->arguments, Test_p->Arguments_p, result_p, 1024);
+
+        nh_make_messagef("%d: %s", result, result_p);
+
+        match = NH_MAKE_TRUE;
+    }
+
+    if (match) {
+        nh_make_messagef("");
+    }
+
+NH_MAKE_END(NH_MAKE_SUCCESS)
+}
+
+static nh_make_TestEnvironment nh_make_initializeTestEnvironment(
+    nh_make_Runtime *Runtime_p, nh_make_ExternalFunction *Initializer_p, nh_make_ExternalFunction *Loader_p,
+    NH_BYTE *target_p)
+{
+NH_MAKE_BEGIN()
+
+    nh_make_TestEnvironment TestEnvironment;
+    TestEnvironment.target_p = target_p;
+
+    nh_make_Variable *InitLibrary_p = nh_make_getVariable(&Runtime_p->VariableArray, "TEST_INITIALIZER_SOURCE");
+    nh_make_Variable *InitFunction_p = nh_make_getVariable(&Runtime_p->VariableArray, "TEST_INITIALIZER");
+
+    if (InitLibrary_p && InitFunction_p) {
+        Initializer_p->libraryName_p = InitLibrary_p->values_pp[0];
+        Initializer_p->functionName_p = InitFunction_p->values_pp[0];
+        TestEnvironment.Initializer_p = Initializer_p;
+    }
+    else {TestEnvironment.Initializer_p = NULL;}
+  
+    nh_make_Variable *LoadLibrary_p = nh_make_getVariable(&Runtime_p->VariableArray, "TEST_LOADER_SOURCE");
+    nh_make_Variable *LoadFunction_p = nh_make_getVariable(&Runtime_p->VariableArray, "TEST_LOADER");
+
+    if (LoadLibrary_p && LoadFunction_p) {
+        Loader_p->libraryName_p = LoadLibrary_p->values_pp[0];
+        Loader_p->functionName_p = LoadFunction_p->values_pp[0];
+        TestEnvironment.Loader_p = Loader_p;
+    }
+    else {TestEnvironment.Loader_p = NULL;}
+
+NH_MAKE_END(TestEnvironment)
+}
+
+static NH_MAKE_RESULT nh_make_runTestEnvironment(
+    nh_make_TestEnvironment *TestEnvironment_p, nh_make_TestArray *TestArray_p)
+{
+NH_MAKE_BEGIN()
+
+    TestEnvironment_p->Process = nh_make_fork();
+    TestEnvironment_p->TestArray_p = TestArray_p;
+
+    if (TestEnvironment_p->Process.id == 0) {
+        exit(nh_make_runTests(TestEnvironment_p));
+    }
+
+    pid_t w;
+    int wstatus;
+
+    do {
+        w = waitpid(TestEnvironment_p->Process.id, &wstatus, WUNTRACED | WCONTINUED);
+        if (w == -1) {
+            perror("waitpid");
+            exit(EXIT_FAILURE);
+        }
+//        if (WIFEXITED(wstatus)) {
+//            printf("exited, status=%d\n", WEXITSTATUS(wstatus));
+//        } else if (WIFSIGNALED(wstatus)) {
+//            printf("killed by signal %d\n", WTERMSIG(wstatus));
+//        } else if (WIFSTOPPED(wstatus)) {
+//            printf("stopped by signal %d\n", WSTOPSIG(wstatus));
+//        } else if (WIFCONTINUED(wstatus)) {
+//            printf("continued\n");
+//        }
+    } while (!WIFEXITED(wstatus) && !WIFSIGNALED(wstatus));
+
+NH_MAKE_END(NH_MAKE_SUCCESS)
+}
+
+NH_MAKE_RESULT nh_make_test(
+    nh_make_Runtime *Runtime_p, NH_BYTE *name_p)
+{
+NH_MAKE_BEGIN()
+
+    nh_make_ExternalFunction Initializer;
+    nh_make_ExternalFunction Loader;
+
+    nh_make_TestEnvironment TestEnvironment = 
+        nh_make_initializeTestEnvironment(Runtime_p, &Initializer, &Loader, name_p);
+
+    NH_MAKE_CHECK(nh_make_runTestEnvironment(&TestEnvironment, &Runtime_p->TestArray))
+
+NH_MAKE_END(NH_MAKE_SUCCESS)
+}
+
+//NH_BYTE *nh_make_getTestResult(
+//    nh_make_Process *Fork_p)
+//{
+//NH_MAKE_BEGIN()
+//
+//    if (Fork_p->id != 0) {
+//        NH_BYTE *receive_p = nh_make_readFromChannel(&Fork_p->IPC.Out, NULL);
+//        if (receive_p != NULL) {
+//            NH_MAKE_CHECK(nh_make_handleIPCReceive(receive_p))
+//        }
+//// TODO free?
+//    }
+//
+//NH_MAKE_END(NH_MAKE_SIGNAL_OK)
+//}
+//
+//NH_MAKE_RESULT nh_make_destroyTestEnvironment(
+//    nh_make_TestEnvironment *TestEnvironment_p)
+//{
+//NH_MAKE_BEGIN()
+//
+//NH_MAKE_END(NH_MAKE_SUCCESS)
+//}
+
+
+// TEST ARRAY ======================================================================================
+
+void nh_make_initTestArray(
+    nh_make_TestArray *Array_p)
+{
+NH_MAKE_BEGIN()
+
+    Array_p->length = 0;
+    Array_p->Tests_p = NULL;
+
+NH_MAKE_SILENT_END()
+}
+
+static nh_make_Test nh_make_initTest()
+{
+NH_MAKE_BEGIN()
+
+    nh_make_Test Test;
+    Test.Context_p = NULL;
+    Test.name_p = NULL;
+    Test.dl_p = NULL;
+    Test.arguments = 0;
+    Test.Arguments_p = NULL;
+
+NH_MAKE_END(Test)
+}
+
+NH_MAKE_RESULT nh_make_addTest(
+    nh_make_SourceContextArray *ContextArray_p, nh_make_TestArray *TestArray_p, nh_make_Function *Function_p)
+{
+NH_MAKE_BEGIN()
+
+    nh_make_SourceContext *Context_p = NULL;
+    nh_make_Test *Test_p = NULL;
+
+    for (int i = 0; i < Function_p->arguments; ++i) 
+    {
+        if (Function_p->argumentTypes_p[i] == NH_MAKE_TOKEN_IDENTIFIER) {
+            for (int j = 0; j < ContextArray_p->length; ++j) {
+                if (!strcmp(ContextArray_p->SourceContexts_p[j].name_p, Function_p->arguments_pp[i])) {
+                    Context_p = &ContextArray_p->SourceContexts_p[j];
+                }
+            }
+        }
+        else {
+
+            if (!Context_p) {
+                NH_MAKE_DIAGNOSTIC_END(NH_MAKE_ERROR_BAD_STATE)
+            }
+
+            if (!Test_p)
+            {
+                if (!TestArray_p->Tests_p) {
+                    TestArray_p->Tests_p = malloc(sizeof(nh_make_Test));
+                    NH_MAKE_CHECK_NULL(TestArray_p->Tests_p)
+                }
+                else {
+                    TestArray_p->Tests_p = realloc(TestArray_p->Tests_p, sizeof(nh_make_Test) * (TestArray_p->length + 1));
+                    NH_MAKE_CHECK_NULL(TestArray_p->Tests_p)
+                }
+        
+                Test_p = &TestArray_p->Tests_p[TestArray_p->length];
+                *Test_p = nh_make_initTest();
+
+                Test_p->Context_p = Context_p;
+                Test_p->name_p = malloc(strlen(Function_p->arguments_pp[i]) + 1);
+                NH_MAKE_CHECK_NULL(Test_p->name_p)
+                sprintf(Test_p->name_p, Function_p->arguments_pp[i]);
+        
+                TestArray_p->length++;
+                
+                NH_BYTE offset_p[64];
+                nh_make_getIndentAfterSourceContext(Context_p->name_p, offset_p, 64, ContextArray_p);
+                nh_make_messagef("[%s]%s Add test \"%s\"", Context_p->name_p, offset_p, Test_p->name_p);
+            }
+            else
+            {
+                if (!Test_p->Arguments_p) {
+                    Test_p->Arguments_p = malloc(sizeof(nh_make_TestArgument));
+                    NH_MAKE_CHECK_NULL(Test_p->Arguments_p)
+                }
+                else {
+                    Test_p->Arguments_p = realloc(Test_p->Arguments_p, sizeof(nh_make_TestArgument) * (Test_p->arguments + 1));
+                    NH_MAKE_CHECK_NULL(Test_p->Arguments_p)
+                }
+        
+                nh_make_TestArgument *TestArgument_p = &Test_p->Arguments_p[Test_p->arguments];
+
+                TestArgument_p->p = malloc(strlen(Function_p->arguments_pp[i]) + 1);
+                NH_MAKE_CHECK_NULL(TestArgument_p->p)
+                sprintf(TestArgument_p->p, Function_p->arguments_pp[i]);
+        
+                Test_p->arguments++;
+            }
+        }
+    }
+
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
diff --git a/src/lib/nhmake/Test/Test.h b/src/lib/nhmake/Test/Test.h
new file mode 100644
index 0000000..456e9c6
--- /dev/null
+++ b/src/lib/nhmake/Test/Test.h
@@ -0,0 +1,68 @@
+#ifndef NH_MAKE_TEST_H
+#define NH_MAKE_TEST_H
+
+#ifndef DOXYGEN_SHOULD_SKIP_THIS
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+#include "Process.h"
+
+#include "../Common/Types/Private.h"
+
+#endif
+
+/** @addtogroup lib_nhmake_structs
+ *  @{
+ */
+
+    typedef struct nh_make_ExternalFunction {
+        NH_BYTE *libraryName_p;
+        NH_BYTE *functionName_p;
+    } nh_make_ExternalFunction;
+
+    typedef struct nh_make_Test {
+        nh_make_SourceContext *Context_p;
+        NH_BYTE *name_p;
+        void *dl_p;
+        int arguments;
+        nh_make_TestArgument *Arguments_p;
+    } nh_make_Test;
+
+    typedef struct nh_make_TestArray {
+        int length;
+        nh_make_Test *Tests_p;
+    } nh_make_TestArray;
+
+    typedef struct nh_make_TestEnvironment {
+        nh_make_Process Process;
+        nh_make_ExternalFunction *Initializer_p;
+        nh_make_ExternalFunction *Loader_p;
+        nh_make_TestArray *TestArray_p;
+        NH_BYTE *target_p;
+    } nh_make_TestEnvironment;
+
+/** @} */
+
+/** @addtogroup lib_nhmake_functions
+ *  @{
+ */
+
+    void nh_make_initTestArray(
+        nh_make_TestArray *Array_p
+    );
+    
+    NH_MAKE_RESULT nh_make_addTest(
+        nh_make_SourceContextArray *ContextArray_p, nh_make_TestArray *TestArray_p, nh_make_Function *Function_p
+    );
+
+    NH_MAKE_RESULT nh_make_test(
+        nh_make_Runtime *Runtime_p, NH_BYTE *name_p
+    );
+
+/** @} */
+
+#endif
diff --git a/src/lib/nhmake/UI/GUI.c b/src/lib/nhmake/UI/GUI.c
new file mode 100644
index 0000000..f497a4f
--- /dev/null
+++ b/src/lib/nhmake/UI/GUI.c
@@ -0,0 +1,58 @@
+// LICENSE NOTICE ==================================================================================
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+// INCLUDE =========================================================================================
+
+#include "GUI.h"
+#include "X11.h"
+
+#include "../Common/Macro.h"
+#include "../Common/API.h"
+#include NH_MAKE_FLOW
+#include NH_MAKE_DEFAULT_CHECK
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+// DATA ============================================================================================
+
+NH_MAKE_BOOL NH_MAKE_GUI = NH_MAKE_FALSE;
+static NH_MAKE_BOOL run = NH_MAKE_TRUE;
+
+// BUILD ===========================================================================================
+
+NH_MAKE_RESULT nh_make_runGUI()
+{
+NH_MAKE_BEGIN()
+
+    nh_make_X11_createWindow("netzhaut-Installer", 300, 300);
+    while (run) {nh_make_X11_getInput();}
+    
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
+}
+
+NH_MAKE_RESULT nh_make_handleGUIExpose()
+{
+NH_MAKE_BEGIN()
+
+    nh_make_X11_drawTextLine(5, 5, "Building via GUI is planned, but not implemented yet. Please use the command-line for now.");
+
+NH_MAKE_END(NH_MAKE_SUCCESS)
+}
+
+void nh_make_handleGUIExit()
+{
+NH_MAKE_BEGIN()
+
+    run = NH_MAKE_FALSE;
+
+NH_MAKE_SILENT_END()
+}
+
diff --git a/src/lib/nhmake/UI/GUI.h b/src/lib/nhmake/UI/GUI.h
new file mode 100644
index 0000000..a5244b6
--- /dev/null
+++ b/src/lib/nhmake/UI/GUI.h
@@ -0,0 +1,39 @@
+#ifndef NH_MAKE_GUI_H
+#define NH_MAKE_GUI_H
+
+#ifndef DOXYGEN_SHOULD_SKIP_THIS
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+#include "../Common/Types/Private.h"
+
+#endif
+
+/** @addtogroup lib_nhmake_vars
+ *  @{
+ */
+
+    extern NH_MAKE_BOOL NH_MAKE_GUI;
+
+/** @} */
+
+/** @addtogroup lib_nhmake_functions
+ *  @{
+ */
+
+    NH_MAKE_RESULT nh_make_runGUI(
+    );
+
+    NH_MAKE_RESULT nh_make_handleGUIExpose(
+    );
+
+    void nh_make_handleGUIExit(
+    );
+
+/** @} */
+
+#endif
diff --git a/external/selfmake/src/lib/UI/Message.c b/src/lib/nhmake/UI/Message.c
similarity index 50%
rename from external/selfmake/src/lib/UI/Message.c
rename to src/lib/nhmake/UI/Message.c
index 3fcd55f..1f6e1cb 100644
--- a/external/selfmake/src/lib/UI/Message.c
+++ b/src/lib/nhmake/UI/Message.c
@@ -1,8 +1,8 @@
 // LICENSE NOTICE ==================================================================================
 
 /**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
  * Published under MIT
  */
 
@@ -15,8 +15,8 @@
 #include "../Core/Runtime.h"
 #include "../Core/Utils.h"
 #include "../Common/Macros/Macros.h"
-#include SM_FLOW
-#include SM_DEFAULT_CHECK
+#include NH_MAKE_FLOW
+#include NH_MAKE_DEFAULT_CHECK
 
 #include <stdlib.h>
 #include <stdarg.h>
@@ -29,16 +29,16 @@ static unsigned int messages = 0;
 
 // MESSAGE =========================================================================================
 
-SM_RESULT sm_operationf(
-    SM_BYTE *format_p, ...)
+NH_MAKE_RESULT nh_make_operationf(
+    NH_BYTE *format_p, ...)
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
-    sm_Thread *Thread_p = _sm_getThread();
-    sm_Runtime *Runtime_p = Thread_p && Thread_p->Runtime_p ? Thread_p->Runtime_p : &SM_DEFAULT_RUNTIME;
-    SM_BYTE *name_p = sm_getVariable(&Runtime_p->VariableArray, "NAME")->values_pp[0];
+    nh_make_Thread *Thread_p = _nh_make_getThread();
+    nh_make_Runtime *Runtime_p = Thread_p && Thread_p->Runtime_p ? Thread_p->Runtime_p : &NH_MAKE_DEFAULT_RUNTIME;
+    NH_BYTE *name_p = nh_make_getVariable(&Runtime_p->VariableArray, "NAME")->values_pp[0];
 
-    if (Runtime_p->quiet) {SM_DIAGNOSTIC_END(SM_SUCCESS)}
+    if (Runtime_p->quiet) {NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)}
 
     if (Runtime_p->GUI)
     {
@@ -49,7 +49,7 @@ SM_BEGIN()
         va_list args;
         va_start(args, format_p);
     
-        SM_BYTE message_p[4096] = {'\0'};
+        NH_BYTE message_p[4096] = {'\0'};
         vsprintf(message_p, format_p, args);
     
         va_end(args);
@@ -62,19 +62,19 @@ SM_BEGIN()
         messages = 0;
     }
 
-SM_DIAGNOSTIC_END(SM_SUCCESS)
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
 }
 
-SM_RESULT sm_messagef(
-    SM_BYTE *format_p, ...)
+NH_MAKE_RESULT nh_make_messagef(
+    NH_BYTE *format_p, ...)
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
-    sm_Thread *Thread_p = _sm_getThread();
-    sm_Runtime *Runtime_p = Thread_p && Thread_p->Runtime_p ? Thread_p->Runtime_p : &SM_DEFAULT_RUNTIME;
-    SM_BYTE *name_p = sm_getVariable(&Runtime_p->VariableArray, "NAME")->values_pp[0];
+    nh_make_Thread *Thread_p = _nh_make_getThread();
+    nh_make_Runtime *Runtime_p = Thread_p && Thread_p->Runtime_p ? Thread_p->Runtime_p : &NH_MAKE_DEFAULT_RUNTIME;
+    NH_BYTE *name_p = nh_make_getVariable(&Runtime_p->VariableArray, "NAME")->values_pp[0];
 
-    if (Runtime_p->quiet) {SM_DIAGNOSTIC_END(SM_SUCCESS)}
+    if (Runtime_p->quiet) {NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)}
 
     if (Runtime_p->GUI)
     {
@@ -88,8 +88,8 @@ SM_BEGIN()
         int size = vsnprintf(NULL, 0, format_p, args);
         va_end(args);
 
-        SM_BYTE *message_p = malloc(size + 1);
-        SM_CHECK_NULL(message_p)
+        NH_BYTE *message_p = malloc(size + 1);
+        NH_MAKE_CHECK_NULL(message_p)
         memset(message_p, 0, size + 1);
 
         va_start(args, format_p);
@@ -102,19 +102,19 @@ SM_BEGIN()
         free(message_p);
     }
 
-SM_DIAGNOSTIC_END(SM_SUCCESS)
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
 }
 
-SM_RESULT sm_noticef(
-    SM_BYTE *format_p, ...)
+NH_MAKE_RESULT nh_make_noticef(
+    NH_BYTE *format_p, ...)
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
-    sm_Thread *Thread_p = _sm_getThread();
-    sm_Runtime *Runtime_p = Thread_p && Thread_p->Runtime_p ? Thread_p->Runtime_p : &SM_DEFAULT_RUNTIME;
-    SM_BYTE *name_p = sm_getVariable(&Runtime_p->VariableArray, "NAME")->values_pp[0];
+    nh_make_Thread *Thread_p = _nh_make_getThread();
+    nh_make_Runtime *Runtime_p = Thread_p && Thread_p->Runtime_p ? Thread_p->Runtime_p : &NH_MAKE_DEFAULT_RUNTIME;
+    NH_BYTE *name_p = nh_make_getVariable(&Runtime_p->VariableArray, "NAME")->values_pp[0];
 
-    if (Runtime_p->quiet) {SM_DIAGNOSTIC_END(SM_SUCCESS)}
+    if (Runtime_p->quiet) {NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)}
 
     if (Runtime_p->GUI)
     {
@@ -128,8 +128,8 @@ SM_BEGIN()
         int size = vsnprintf(NULL, 0, format_p, args);
         va_end(args);
 
-        SM_BYTE *message_p = malloc(size + 1);
-        SM_CHECK_NULL(message_p)
+        NH_BYTE *message_p = malloc(size + 1);
+        NH_MAKE_CHECK_NULL(message_p)
         memset(message_p, 0, size + 1);
 
         va_start(args, format_p);
@@ -142,19 +142,19 @@ SM_BEGIN()
         free(message_p);
     }
 
-SM_DIAGNOSTIC_END(SM_SUCCESS)
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
 }
 
-SM_RESULT sm_externalMessage(
-    SM_BYTE *prepend_p, SM_BYTE *message_p)
+NH_MAKE_RESULT nh_make_externalMessage(
+    NH_BYTE *prepend_p, NH_BYTE *message_p)
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
-    sm_Thread *Thread_p = _sm_getThread();
-    sm_Runtime *Runtime_p = Thread_p && Thread_p->Runtime_p ? Thread_p->Runtime_p : &SM_DEFAULT_RUNTIME;
-    SM_BYTE *name_p = sm_getVariable(&Runtime_p->VariableArray, "NAME")->values_pp[0];
+    nh_make_Thread *Thread_p = _nh_make_getThread();
+    nh_make_Runtime *Runtime_p = Thread_p && Thread_p->Runtime_p ? Thread_p->Runtime_p : &NH_MAKE_DEFAULT_RUNTIME;
+    NH_BYTE *name_p = nh_make_getVariable(&Runtime_p->VariableArray, "NAME")->values_pp[0];
 
-    if (Runtime_p->quiet) {SM_DIAGNOSTIC_END(SM_SUCCESS)}
+    if (Runtime_p->quiet) {NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)}
 
     if (Runtime_p->GUI)
     {
@@ -162,14 +162,14 @@ SM_BEGIN()
     }
     else 
     {
-        SM_BYTE *p = message_p;
+        NH_BYTE *p = message_p;
         for (int i = 0; i < strlen(message_p); ++i) 
         {
             if (i + 1 == strlen(message_p)) {i++;}
 
             if (message_p[i] == '\n' || message_p[i] == '\0') 
             {
-                SM_BYTE replace = message_p[i];
+                NH_BYTE replace = message_p[i];
                 message_p[i] = '\0';
                 printf("%s%s\n", prepend_p, p);
                 p = &message_p[i + 1];
@@ -179,19 +179,19 @@ SM_BEGIN()
         }
     }
 
-SM_DIAGNOSTIC_END(SM_SUCCESS)
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
 }
 
-SM_RESULT sm_exitMessage(
-    SM_RESULT result)
+NH_MAKE_RESULT nh_make_exitMessage(
+    NH_MAKE_RESULT result)
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
-    sm_Thread *Thread_p = _sm_getThread();
-    sm_Runtime *Runtime_p = Thread_p && Thread_p->Runtime_p ? Thread_p->Runtime_p : &SM_DEFAULT_RUNTIME;
-    SM_BYTE *name_p = sm_getVariable(&Runtime_p->VariableArray, "NAME")->values_pp[0];
+    nh_make_Thread *Thread_p = _nh_make_getThread();
+    nh_make_Runtime *Runtime_p = Thread_p && Thread_p->Runtime_p ? Thread_p->Runtime_p : &NH_MAKE_DEFAULT_RUNTIME;
+    NH_BYTE *name_p = nh_make_getVariable(&Runtime_p->VariableArray, "NAME")->values_pp[0];
 
-    if (Runtime_p->quiet) {SM_DIAGNOSTIC_END(SM_SUCCESS)}
+    if (Runtime_p->quiet) {NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)}
 
     if (Runtime_p->GUI)
     {
@@ -200,12 +200,12 @@ SM_BEGIN()
     else 
     {
         if (result) {
-            printf("%s: -> \e[1;31mERROR\e[0m %s\n", name_p, SM_RESULTS_PP[result]);
+            printf("%s: -> \e[1;31mERROR\e[0m %s\n", name_p, NH_MAKE_RESULTS_PP[result]);
             printf("%s: -> \e[1;31mEXECUTION ERROR\e[0m -> \e[1;31mEXITING\e[0m\n", name_p);
         }
         else {printf("%s:\n%s: -> \e[1;32mEXECUTION SUCCESS\e[0m -> \e[1;32mEXITING\e[0m\n", name_p, name_p);}
     }
 
-SM_DIAGNOSTIC_END(SM_SUCCESS)
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
 }
 
diff --git a/src/lib/nhmake/UI/Message.h b/src/lib/nhmake/UI/Message.h
new file mode 100644
index 0000000..74b687a
--- /dev/null
+++ b/src/lib/nhmake/UI/Message.h
@@ -0,0 +1,52 @@
+#ifndef NH_MAKE_MESSAGE_H
+#define NH_MAKE_MESSAGE_H
+
+#ifndef DOXYGEN_SHOULD_SKIP_THIS
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
+ * Published under MIT
+ */
+
+#include "../Common/Types/Private.h"
+
+#endif
+
+/** @addtogroup lib_nhmake_typedefs
+ *  @{
+ */
+
+    typedef NH_MAKE_RESULT (*nh_make_messagef_f)(
+        NH_BYTE *format_p, ...
+    );
+
+/** @} */
+
+/** @addtogroup lib_nhmake_functions
+ *  @{
+ */
+
+    NH_MAKE_RESULT nh_make_operationf(
+        NH_BYTE *format_p, ...
+    );
+    
+    NH_MAKE_RESULT nh_make_messagef(
+        NH_BYTE *format_p, ...
+    );
+
+    NH_MAKE_RESULT nh_make_noticef(
+        NH_BYTE *format_p, ...
+    );
+
+    NH_MAKE_RESULT nh_make_externalMessage(
+        NH_BYTE *prepend_p, NH_BYTE *message_p
+    );
+
+    NH_MAKE_RESULT nh_make_exitMessage(
+        NH_MAKE_RESULT result
+    );
+
+/** @} */
+
+#endif
diff --git a/external/selfmake/src/lib/UI/X11.c b/src/lib/nhmake/UI/X11.c
similarity index 86%
rename from external/selfmake/src/lib/UI/X11.c
rename to src/lib/nhmake/UI/X11.c
index f626cba..2ee56e5 100644
--- a/external/selfmake/src/lib/UI/X11.c
+++ b/src/lib/nhmake/UI/X11.c
@@ -1,8 +1,8 @@
 // LICENSE NOTICE ==================================================================================
 
 /**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
  * Published under MIT
  */
 
@@ -14,8 +14,8 @@
 #include "../Main/Util.h"
 #include "../Common/Macro.h"
 
-#include SM_FLOW
-#include SM_DEFAULT_CHECK
+#include NH_MAKE_FLOW
+#include NH_MAKE_DEFAULT_CHECK
 
 #include <stdio.h>
 #include <stdlib.h>
@@ -29,7 +29,7 @@
 
 // DATA ============================================================================================
 
-static sm_X11 Data;
+static nh_make_X11 Data;
 
 // FOR SOFTWARE RENDERING :
 //
@@ -75,24 +75,24 @@ static sm_X11 Data;
 
 // CREATE WINDOW ===================================================================================
 
-static SM_RESULT sm_connectToDisplay()
+static NH_MAKE_RESULT nh_make_connectToDisplay()
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
     Data.Display_p = XOpenDisplay(NULL);
-    SM_CHECK_NULL(Data.Display_p)
+    NH_MAKE_CHECK_NULL(Data.Display_p)
     Data.screen = DefaultScreen(Data.Display_p);
     Data.Root = RootWindow(Data.Display_p, Data.screen);
     Data.white = WhitePixel(Data.Display_p, Data.screen);
     Data.black = BlackPixel(Data.Display_p, Data.screen);
 
-SM_END(SM_SUCCESS)
+NH_MAKE_END(NH_MAKE_SUCCESS)
 }
 
-static SM_RESULT sm_createSimpleWindow(
+static NH_MAKE_RESULT nh_make_createSimpleWindow(
     int width, int height)
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
     Data.Window = XCreateSimpleWindow (
         Data.Display_p, Data.Root, 1, 1, width, height, 0, Data.black, Data.white 
@@ -105,17 +105,17 @@ SM_BEGIN()
 
     XMapWindow(Data.Display_p, Data.Window);
 
-SM_END(SM_SUCCESS)
+NH_MAKE_END(NH_MAKE_SUCCESS)
 }
 
-static void sm_createGraphicsContext()
+static void nh_make_createGraphicsContext()
 {
     Data.Gfx = XCreateGC(Data.Display_p, Data.Window, 0, 0);
     XSetBackground(Data.Display_p, Data.Gfx, Data.white); 
     XSetForeground(Data.Display_p, Data.Gfx, Data.black); 
 }
 
-static void sm_createFont()
+static void nh_make_createFont()
 {
     const char *fontname_p = "-*-helvetica-*-r-*-*-14-*-*-*-*-*-*-*";
     Data.Font_p = XLoadQueryFont(Data.Display_p, fontname_p);
@@ -127,14 +127,14 @@ static void sm_createFont()
     XSetFont(Data.Display_p, Data.Gfx, Data.Font_p->fid);
 }
 
-SM_RESULT sm_X11_createWindow(
+NH_MAKE_RESULT nh_make_X11_createWindow(
     char *title_p, int width, int height)
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
 #ifdef __unix__
 
-    SM_CHECK(sm_connectToDisplay())
+    NH_MAKE_CHECK(nh_make_connectToDisplay())
 
 // keyboard
     Data.Connection_p = XGetXCBConnection(Data.Display_p);
@@ -155,9 +155,9 @@ SM_BEGIN()
     );
 
 // create window
-    sm_createSimpleWindow(width, height);
-    sm_createGraphicsContext();
-    sm_createFont();
+    nh_make_createSimpleWindow(width, height);
+    nh_make_createGraphicsContext();
+    nh_make_createFont();
 
 // window delete protocol
     Data.DeleteAtom = XInternAtom(Data.Display_p, "WM_DELETE_WINDOW", 0);
@@ -179,18 +179,18 @@ SM_BEGIN()
     XMoveWindow(Data.Display_p, Data.Window, (int)(Screen_p->width/2) - (int)(width/2), (int)(Screen_p->height/2) - (int)(height/2));
     XSync(Data.Display_p, 0);
 
-    SM_DIAGNOSTIC_END(SM_SUCCESS)
+    NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
 
 #endif
 
-SM_DIAGNOSTIC_END(SM_ERROR_BAD_STATE)
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_ERROR_BAD_STATE)
 }
 
 // DESTROY WINDOW ==================================================================================
 
-SM_RESULT sm_X11_destroyWindow()
+NH_MAKE_RESULT nh_make_X11_destroyWindow()
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
 #ifdef __unix__
 
@@ -200,18 +200,18 @@ SM_BEGIN()
     xkb_keymap_unref(Data.Keymap_p);
     xkb_context_unref(Data.Context_p);
 
-    SM_DIAGNOSTIC_END(SM_SUCCESS)
+    NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
 
 #endif
 
-SM_DIAGNOSTIC_END(SM_ERROR_BAD_STATE)
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_ERROR_BAD_STATE)
 }
 
 // INPUT ===========================================================================================
 
-SM_RESULT sm_X11_getInput() 
+NH_MAKE_RESULT nh_make_X11_getInput() 
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
 #ifdef __unix__
     
@@ -238,7 +238,7 @@ SM_BEGIN()
         
         if (Event.type == ClientMessage)
         {   
-                 if (Event.xclient.data.l[0] == Data.DeleteAtom) {sm_handleGUIExit();}
+                 if (Event.xclient.data.l[0] == Data.DeleteAtom) {nh_make_handleGUIExit();}
             else if (Event.type == Expose) {}
             else if (Event.xclient.message_type == XdndEnter) 
             {
@@ -308,43 +308,43 @@ SM_BEGIN()
         }
 
         else if (Event.type == Expose) {
-            SM_CHECK(sm_handleGUIExpose())
+            NH_MAKE_CHECK(nh_make_handleGUIExpose())
         }
     }
 
-    SM_DIAGNOSTIC_END(SM_SUCCESS)
+    NH_MAKE_DIAGNOSTIC_END(NH_MAKE_SUCCESS)
 
 #endif
 
-SM_DIAGNOSTIC_END(SM_ERROR_BAD_STATE)
+NH_MAKE_DIAGNOSTIC_END(NH_MAKE_ERROR_BAD_STATE)
 }
 
 // DRAW ============================================================================================
 
-void sm_X11_drawLine(
+void nh_make_X11_drawLine(
     int x1, int y1, int x2, int y2)
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
     XDrawLine(Data.Display_p, Data.Window, Data.Gfx, x1, y1, x2, y2);
 
-SM_SILENT_END()
+NH_MAKE_SILENT_END()
 }
 
-void sm_X11_fillRectangle(
+void nh_make_X11_fillRectangle(
    int x, int y, int width, int height)
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
     XFillRectangle(Data.Display_p, Data.Window, Data.Gfx, x, y, width, height);
 
-SM_SILENT_END()
+NH_MAKE_SILENT_END()
 }
 
-void sm_X11_drawTextLine(
+void nh_make_X11_drawTextLine(
     int x, int y, char *text_p)
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
     int direction;
     int ascent;
@@ -377,17 +377,17 @@ SM_BEGIN()
     y += ascent;
 
     XDrawString(Data.Display_p, Data.Window, Data.Gfx, x, y, text_p, strlen(text_p));
-    if (count != 0) {sm_X11_drawTextLine(x, y + descent, text_p + count);}
+    if (count != 0) {nh_make_X11_drawTextLine(x, y + descent, text_p + count);}
 
-SM_SILENT_END()
+NH_MAKE_SILENT_END()
 }
 
-void sm_X11_clearWindow()
+void nh_make_X11_clearWindow()
 {
-SM_BEGIN()
+NH_MAKE_BEGIN()
 
     XClearWindow(Data.Display_p, Data.Window);
 
-SM_SILENT_END()
+NH_MAKE_SILENT_END()
 }
 
diff --git a/external/selfmake/src/lib/UI/X11.h b/src/lib/nhmake/UI/X11.h
similarity index 66%
rename from external/selfmake/src/lib/UI/X11.h
rename to src/lib/nhmake/UI/X11.h
index 2f4d7da..b4af280 100644
--- a/external/selfmake/src/lib/UI/X11.h
+++ b/src/lib/nhmake/UI/X11.h
@@ -1,11 +1,11 @@
-#ifndef SM_X11_H
-#define SM_X11_H
+#ifndef NH_MAKE_X11_H
+#define NH_MAKE_X11_H
 
 #ifndef DOXYGEN_SHOULD_SKIP_THIS
 
 /**
- * selfmake - Script Language
- * Copyright (C) 2021 The selfmake Authors
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2021 The netzhaut Authors
  * Published under MIT
  */
 
@@ -22,11 +22,11 @@
 
 #endif
 
-/** @addtogroup selfmakeStructs
+/** @addtogroup lib_nhmake_structs
  *  @{
  */
 
-    typedef struct sm_X11 {
+    typedef struct nh_make_X11 {
 
     #ifdef __unix__
         int screen;
@@ -45,37 +45,37 @@
         int width, height;
     #endif
 
-    } sm_X11;
+    } nh_make_X11;
 
 /** @} */
 
-/** @addtogroup selfmakeFunctions
+/** @addtogroup lib_nhmake_functions
  *  @{
  */
 
-    SM_RESULT sm_X11_createWindow(
+    NH_MAKE_RESULT nh_make_X11_createWindow(
         char *title, int width, int heigh
     );
     
-    SM_RESULT sm_X11_destroyWindow(
+    NH_MAKE_RESULT nh_make_X11_destroyWindow(
     );
  
-    SM_RESULT sm_X11_getInput(
+    NH_MAKE_RESULT nh_make_X11_getInput(
     );
 
-    void sm_X11_drawTextLine(
+    void nh_make_X11_drawTextLine(
         int x, int y, char *text_p
     );
 
-    void sm_X11_drawLine(
+    void nh_make_X11_drawLine(
        int x1, int y1, int x2, int y2
     );
  
-    void sm_X11_fillRectangle(
+    void nh_make_X11_fillRectangle(
        int x1, int y1, int x2, int y2
     );
 
-    void sm_X11_clearWindow(
+    void nh_make_X11_clearWindow(
     );
 
 /** @} */
diff --git a/src/lib/nhnetwork/Common/About.h b/src/lib/nhnetwork/Common/About.h
index de4d972..85faeeb 100644
--- a/src/lib/nhnetwork/Common/About.h
+++ b/src/lib/nhnetwork/Common/About.h
@@ -16,7 +16,7 @@
  *  @brief The nhnetwork library implements network routines.
  */
 
-/** @defgroup lib_nhnetwork_changelog Changelog
+/** @defgroup lib_nhnetwork_version Version
  *  @ingroup lib_nhnetwork
  */
 /** @defgroup lib_nhnetwork_macros Macros 
@@ -38,48 +38,33 @@
  *  @ingroup lib_nhnetwork
  */
 
-/** @addtogroup lib_nhnetwork_changelog 
+/** @addtogroup lib_nhnetwork_version
  *  @{
  */
 
     /**
-     * API version.
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
+     * The API version is used for backwards-incompatible API changes. 
      */
     #define NH_NETWORK_API_VERSION 0
 
     /**
-     * Major version.
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
+     * The major version is used for the completion of big functionalities. 
      */
     #define NH_NETWORK_MAJOR_VERSION 0
 
     /**
-     * Minor version.
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
+     * The minor version is used for the addition of small functionalities or consequential changes. 
      */
     #define NH_NETWORK_MINOR_VERSION 0
 
     /**
-     * Patch version.
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
+     * The patch version is used for bugfixes or non-consequential changes. 
      */
     #define NH_NETWORK_PATCH_VERSION 0
 
-/** @} */
-
-/** @addtogroup lib_nhnetwork_vars
- *  @{
- */
-
+    /**
+     * Version array.
+     */
     extern int NH_NETWORK_VERSION_P[4];
 
 /** @} */
diff --git a/src/lib/nhrenderer/Common/About.h b/src/lib/nhrenderer/Common/About.h
index 702a643..8877a2d 100644
--- a/src/lib/nhrenderer/Common/About.h
+++ b/src/lib/nhrenderer/Common/About.h
@@ -16,7 +16,7 @@
  *  @brief The nhrenderer library implements HTML parsing and the HTML event loop.
  */
 
-/** @defgroup lib_nhrenderer_changelog Changelog
+/** @defgroup lib_nhrenderer_version Version
  *  @ingroup lib_nhrenderer
  */
 /** @defgroup lib_nhrenderer_macros Macros 
@@ -38,48 +38,33 @@
  *  @ingroup lib_nhrenderer
  */
 
-/** @addtogroup lib_nhrenderer_changelog 
+/** @addtogroup lib_nhrenderer_version
  *  @{
  */
 
     /**
      * The API version is used for backwards-incompatible API changes. 
-     *
-     * 2021-06-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_RENDERER_API_VERSION 0
 
     /**
      * The major version is used for the completion of big functionalities. 
-     *
-     * 2021-06-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_RENDERER_MAJOR_VERSION 0
 
     /**
      * The minor version is used for the addition of small functionalities or consequential changes. 
-     *
-     * 2021-06-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_RENDERER_MINOR_VERSION 0
 
     /**
      * The patch version is used for bugfixes or non-consequential changes. 
-     *
-     * 2021-06-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_RENDERER_PATCH_VERSION 0
 
-/** @} */
-
-/** @addtogroup lib_nhrenderer_vars
- *  @{
- */
-
+    /**
+     * Version array.
+     */
     extern int NH_RENDERER_VERSION_P[4];
 
 /** @} */
diff --git a/src/lib/nhterm/Common/About.h b/src/lib/nhterm/Common/About.h
index 1605215..ed790c2 100644
--- a/src/lib/nhterm/Common/About.h
+++ b/src/lib/nhterm/Common/About.h
@@ -5,7 +5,7 @@
 
 /**
  * netzhaut - Web Browser Engine
- * Copyright (C) 2020 The netzhaut Authors
+ * Copyright (C) 2022 The netzhaut Authors
  * Published under MIT
  */
 
@@ -16,7 +16,7 @@
  *  @brief The nhterm library implements rendering of nhtty Pseudo Terminals. 
  */
 
-/** @defgroup lib_nhterm_changelog Changelog
+/** @defgroup lib_nhterm_version Version
  *  @ingroup lib_nhterm
  */
 /** @defgroup lib_nhterm_macros Macros 
@@ -38,51 +38,33 @@
  *  @ingroup lib_nhterm
  */
 
-/** @addtogroup lib_nhterm_changelog 
+/** @addtogroup lib_nhterm_version 
  *  @{
  */
 
     /**
      * The API version is used for backwards-incompatible API changes. 
-     *
-     * 2021-06-10 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_TERM_API_VERSION 0
 
     /**
      * The major version is used for the completion of big functionalities. 
-     *
-     * 2021-06-10 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_TERM_MAJOR_VERSION 0
 
     /**
      * The minor version is used for the addition of small functionalities or consequential changes. 
-     *
-     * 2021-06-10 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_TERM_MINOR_VERSION 0
 
     /**
      * The patch version is used for bugfixes or non-consequential changes. 
-     *
-     * 2021-06-15 | v0.0.0.1 <a id="v0.0.0.1"></a> 
-     * - [Dajo Frey](https://github.com/dajofrey): Add background-color variable.
-     *
-     * 2021-06-10 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_TERM_PATCH_VERSION 1
 
-/** @} */
-
-/** @addtogroup lib_nhterm_vars
- *  @{
- */
-
+    /**
+     * Version array.
+     */
     extern int NH_TERM_VERSION_P[4];
 
 /** @} */
diff --git a/src/lib/nhterm/Terminal/Terminal.c b/src/lib/nhterm/Terminal/Terminal.c
index 7f0ceb5..1dee0b9 100644
--- a/src/lib/nhterm/Terminal/Terminal.c
+++ b/src/lib/nhterm/Terminal/Terminal.c
@@ -46,7 +46,7 @@ NH_TERM_BEGIN()
 
     nh_term_Terminal Terminal;
 
-    Terminal.PseudoTerminal_p = Workload_p->args_p;
+    Terminal.TTY_p = Workload_p->args_p;
     Terminal.View_p = nh_tty_createView(Workload_p->args_p, NH_FALSE);
     NH_TERM_CHECK_MEM(NULL, Terminal.View_p)
 
@@ -153,12 +153,12 @@ NH_TERM_END(idle ? NH_SIGNAL_IDLE : NH_SIGNAL_OK)
 // OPEN/GET ========================================================================================
 
 nh_term_Terminal *nh_term_openTerminal(
-    nh_tty_PseudoTerminal *PseudoTerminal_p)
+    nh_tty_TTY *TTY_p)
 {
 NH_TERM_BEGIN()
 
     nh_term_Terminal *Terminal_p = nh_activateWorkload(
-        nh_term_initTerminal, nh_term_runTerminal, PseudoTerminal_p, NH_TRUE
+        nh_term_initTerminal, nh_term_runTerminal, TTY_p, NH_TRUE
     );
 
 NH_TERM_END(Terminal_p)
diff --git a/src/lib/nhterm/Terminal/Terminal.h b/src/lib/nhterm/Terminal/Terminal.h
index 649d26c..59b2d3c 100644
--- a/src/lib/nhterm/Terminal/Terminal.h
+++ b/src/lib/nhterm/Terminal/Terminal.h
@@ -14,7 +14,7 @@
 
 #include "../Common/Types/Private.h"
 
-#include "../../nhtty/PseudoTerminal/View.h"
+#include "../../nhtty/TTY/View.h"
 
 #endif
 
@@ -25,7 +25,7 @@
     typedef struct nh_term_Terminal {
         nh_term_Grid Grid;
         nh_term_Graphics Graphics;
-        nh_tty_PseudoTerminal *PseudoTerminal_p;
+        nh_tty_TTY *TTY_p;
         nh_tty_View *View_p;
         nh_RingBufferMarker InputMarker;
     } nh_term_Terminal;
@@ -37,7 +37,7 @@
  */
 
     typedef nh_term_Terminal *(*nh_term_openTerminal_f)(
-        nh_tty_PseudoTerminal *PseudoTerminal_p
+        nh_tty_TTY *TTY_p
     ); 
 
     typedef NH_TERM_RESULT (*nh_term_setViewport_f)(
@@ -51,7 +51,7 @@
  */
 
     nh_term_Terminal *nh_term_openTerminal(
-        nh_tty_PseudoTerminal *PseudoTerminal_p
+        nh_tty_TTY *TTY_p
     );
 
     NH_TERM_RESULT nh_term_setViewport(
diff --git a/src/lib/nhtty/Common/About.h b/src/lib/nhtty/Common/About.h
index acac8f4..4025a7f 100644
--- a/src/lib/nhtty/Common/About.h
+++ b/src/lib/nhtty/Common/About.h
@@ -5,7 +5,7 @@
 
 /**
  * netzhaut - Web Browser Engine
- * Copyright (C) 2020 The netzhaut Authors
+ * Copyright (C) 2022 The netzhaut Authors
  * Published under MIT
  */
 
@@ -14,10 +14,11 @@
 /** @defgroup lib_nhtty nhtty
  *  @ingroup lib
  *  @brief The nhtty library implements a terminal based interface. 
- *  Linux implementation based on https://viewsourcecode.org/snaptoken/kilo/index.html from Pailey with original code by Salvatore Sanfilippo, also known as antirez.
+ *  Linux implementation based on https://viewsourcecode.org/snaptoken/kilo/index.html from Pailey with 
+ *  original code by Salvatore Sanfilippo, also known as antirez.
  */
 
-/** @defgroup lib_nhtty_changelog Changelog
+/** @defgroup lib_nhtty_version Version
  *  @ingroup lib_nhtty
  */
 /** @defgroup lib_nhtty_macros Macros 
@@ -39,95 +40,33 @@
  *  @ingroup lib_nhtty
  */
 
-/** @addtogroup lib_nhtty_changelog 
+/** @addtogroup lib_nhtty_version
  *  @{
  */
 
     /**
      * The API version is used for backwards-incompatible API changes. 
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_TTY_API_VERSION 0
 
     /**
      * The major version is used for the completion of big functionalities. 
-     *
-     * 2021-06-10 | v0.1.0.0 <a id="v0.1.0.0"></a> 
-     * - [Dajo Frey](https://github.com/dajofrey): Rename names containing 'Terminal' using the more precise name 'PseudoTerminal'. 
-     * - [Dajo Frey](https://github.com/dajofrey): Fix shell program so that it's now usable in a basic manner. 
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_TTY_MAJOR_VERSION 1
 
     /**
      * The minor version is used for the addition of small functionalities or consequential changes. 
-     *
-     * 2021-06-15 | v0.1.2.0 <a id="v0.1.2.0"></a> 
-     * - [Dajo Frey](https://github.com/dajofrey): Improve input handling.
-     *
-     * 2021-06-11 | v0.1.1.0 <a id="v0.1.1.0"></a> 
-     * - [Dajo Frey](https://github.com/dajofrey): Add view callbacks and view data to programs.
-     * - [Dajo Frey](https://github.com/dajofrey): Rewrite various routines for future nhterm integration.
-     *
-     * 2021-06-08 | v0.0.6.0 <a id="v0.0.6.0"></a> 
-     * - [Dajo Frey](https://github.com/dajofrey): Fix drawing issues when disabling tree-listing in editor.
-     * - [Dajo Frey](https://github.com/dajofrey): Improve codepoint deletion in editor.
-     * - [Dajo Frey](https://github.com/dajofrey): Add tab-to-spaces configuration commands.
-     * - [Dajo Frey](https://github.com/dajofrey): Improve logger drawing.
-     * - [Dajo Frey](https://github.com/dajofrey): Fix logger cursor.
-     *
-     * 2021-06-07 | v0.0.5.0 <a id="v0.0.5.0"></a> 
-     * - [Dajo Frey](https://github.com/dajofrey): Improve messages and path handling in editor.
-     * - [Dajo Frey](https://github.com/dajofrey): Add first iteration of text-file search.
-     *
-     * 2021-06-06 | v0.0.4.0 <a id="v0.0.4.0"></a> 
-     * - [Dajo Frey](https://github.com/dajofrey): Improve text-file navigation and internal processing.
-     * - [Dajo Frey](https://github.com/dajofrey): Add copy/paste in editor.
-     * - [Dajo Frey](https://github.com/dajofrey): Improve console.
-     *
-     * 2021-06-03 | v0.0.3.0 <a id="v0.0.3.0"></a> 
-     * - [Dajo Frey](https://github.com/dajofrey): Introduce \ref nh_tty_Status.
-     * - [Dajo Frey](https://github.com/dajofrey): Improve design and runtime behavior.
-     * - [Dajo Frey](https://github.com/dajofrey): Simplify console.
-     *
-     * 2021-05-31 | v0.0.2.0 <a id="v0.0.2.0"></a> 
-     * - [Dajo Frey](https://github.com/dajofrey): Improve design.
-     * - [Dajo Frey](https://github.com/dajofrey): Add new-file functionality. 
-     * - [Dajo Frey](https://github.com/dajofrey): Fix some file-editor bugs.
-     *
-     * 2021-05-29 | v0.0.1.0 <a id="v0.0.1.0"></a> 
-     * - [Dajo Frey](https://github.com/dajofrey): Improve messages.
-     * - [Dajo Frey](https://github.com/dajofrey): Fix some file-editor bugs.
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_TTY_MINOR_VERSION 2
 
     /**
      * The patch version is used for bugfixes or non-consequential changes. 
-     *
-     * 2021-06-23 | v0.1.2.2 <a id="v0.1.2.2"></a> 
-     * - [Dajo Frey](https://github.com/dajofrey): Fix logger update routine constantly setting the refresh flag.
-     *
-     * 2021-06-15 | v0.1.2.1 <a id="v0.1.2.1"></a> 
-     * - [Dajo Frey](https://github.com/dajofrey): Make slight changes to logger visuals.
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_TTY_PATCH_VERSION 2
 
-/** @} */
-
-/** @addtogroup lib_nhtty_vars
- *  @{
- */
-
+    /**
+     * Version array.
+     */
     extern int NH_TTY_VERSION_P[4];
 
 /** @} */
diff --git a/src/lib/nhtty/Common/Log.c b/src/lib/nhtty/Common/Log.c
index cc53691..277d362 100644
--- a/src/lib/nhtty/Common/Log.c
+++ b/src/lib/nhtty/Common/Log.c
@@ -26,7 +26,7 @@ NH_TTY_RESULT nh_tty_logTerminalMode(
 {
 NH_TTY_BEGIN()
 
-    NH_BYTE *description_p = nh_tty_getPseudoTerminalModeDescription(mode);
+    NH_BYTE *description_p = nh_tty_getTTYModeDescription(mode);
 
     NH_BYTE message_p[255];
     sprintf(message_p, "TERM %d %s", mode, description_p ? description_p : "(no description)");
diff --git a/src/lib/nhtty/Common/Types/Private.h b/src/lib/nhtty/Common/Types/Private.h
index 9542d17..0e052f0 100644
--- a/src/lib/nhtty/Common/Types/Private.h
+++ b/src/lib/nhtty/Common/Types/Private.h
@@ -10,6 +10,7 @@
  */
 
 #include "Public.h"
+#include "../../../nhmake/Common/Types/Private.h"
 
 #endif
 
diff --git a/src/lib/nhtty/Common/Types/Public.h b/src/lib/nhtty/Common/Types/Public.h
index 524fb67..cc7c0a1 100644
--- a/src/lib/nhtty/Common/Types/Public.h
+++ b/src/lib/nhtty/Common/Types/Public.h
@@ -33,7 +33,7 @@
  *  @{
  */
 
-    typedef struct nh_tty_PseudoTerminal nh_tty_PseudoTerminal;
+    typedef struct nh_tty_TTY nh_tty_TTY;
     typedef struct nh_tty_Program nh_tty_Program;
 
     typedef void *(*nh_tty_init_f)();
diff --git a/src/lib/nhtty/Editor/ChangesFile.c b/src/lib/nhtty/Editor/ChangesFile.c
new file mode 100644
index 0000000..4c65d51
--- /dev/null
+++ b/src/lib/nhtty/Editor/ChangesFile.c
@@ -0,0 +1,340 @@
+// LICENSE NOTICE ==================================================================================
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2020 The netzhaut Authors
+ * Published under MIT
+ */
+
+// INCLUDE =========================================================================================
+
+#include "ChangesFile.h"
+#include "Editor.h"
+#include "ChangesFileInput.h"
+#include "TreeListing.h"
+#include "SyntaxHighlights.h"
+
+#include "../TTY/TTY.h"
+
+#include "../Common/Macros/Macros.h"
+#include NH_TTY_FLOW
+#include NH_TTY_DEFAULT_CHECK
+
+#include "../../nhcore/System/Process.h"
+#include "../../nhcore/System/Memory.h"
+#include "../../nhcore/Util/File.h"
+#include "../../nhcore/Common/Macros/Macros.h"
+#include NH_FLOW
+#include NH_CUSTOM_CHECK
+
+#include "../../nhcss/Parser/Parser.h"
+#include "../../nhhtml/Parser/Parser.h"
+#include "../../nhwebidl/Runtime/Parser.h"
+
+#include "../../nhencoding/Encodings/UTF32.h"
+#include "../../nhencoding/Encodings/UTF8.h"
+#include "../../nhencoding/Common/Macros/Macros.h"
+#include NH_ENCODING_FLOW
+#include NH_ENCODING_CUSTOM_CHECK
+
+#include "../../netzhaut/nhmake.h"
+
+#include <stddef.h>
+#include <unistd.h>
+#include <stdio.h>
+#include <string.h>
+#include <dirent.h>
+#include <stdlib.h>
+
+#include <sys/types.h>
+#include <sys/stat.h>
+
+// LINES ===========================================================================================
+
+nh_tty_ChangesFile *nh_tty_newChangesFile(
+    nh_tty_ChangesFile *ChangesFile_p, int index)
+{
+NH_TTY_BEGIN()
+
+#include NH_TTY_CUSTOM_CHECK
+
+    nh_tty_ChangesFile *New_p = nh_allocate(sizeof(nh_tty_ChangesFile));
+    NH_TTY_CHECK_MEM(NULL, New_p)
+
+//    nh_make_ChangesNode *Changes_p = malloc(sizeof(nh_make_ChangesNode));
+//    Changes_p->type = NH_MAKE_CHANGES_NODE_ROOT;
+//    Changes_p->text_p = NULL;
+//    Changes_p->length = 0;
+//    Changes_p->Children_p = NULL;
+//    Changes_p->children = 0;
+//    Changes_p->Parent_p = NULL;
+//
+//    New_p->Changes_p = Changes_p;
+//
+//    New_p->Copy = nh_initArray(sizeof(NH_BOOL), 128);
+//    New_p->Unsaved = nh_initArray(sizeof(NH_BOOL), 128);
+//    New_p->Search = nh_initArray(sizeof(NH_BOOL), 128);
+//    New_p->Codepoints = nh_encoding_initUTF32(128);
+//    New_p->RenderCodepoints = nh_encoding_initUTF32(128);
+//    NH_CHECK(NULL, nh_insertIntoList(&ChangesFile_p->Lines, New_p, index))
+
+#include NH_TTY_DEFAULT_CHECK
+
+NH_TTY_END(New_p)
+}
+
+//static NH_TTY_RESULT nh_tty_appendToChangesFileLine(
+//    nh_tty_ChangesFileLine *Line_p, NH_ENCODING_UTF32 *codepoints_p, int length)
+//{
+//NH_TTY_BEGIN()
+//
+//    NH_ENCODING_CHECK(NH_TTY_ERROR_BAD_STATE, nh_encoding_appendUTF32(&Line_p->Codepoints, codepoints_p, length))
+//    NH_BOOL b = NH_FALSE;
+//    for (int i = 0; i < length; ++i) {
+//        nh_appendToArray(&Line_p->Copy, &b, 1);
+//        nh_appendToArray(&Line_p->Unsaved, &b, 1);
+//        nh_appendToArray(&Line_p->Search, &b, 1);
+//    }
+//
+//NH_TTY_END(NH_TTY_SUCCESS)
+//}
+//
+//NH_TTY_RESULT nh_tty_insertIntoChangesFileLine(
+//    nh_tty_ChangesFileLine *Line_p, int index, NH_ENCODING_UTF32 c)
+//{
+//NH_TTY_BEGIN()
+//
+//    NH_ENCODING_CHECK(NH_TTY_ERROR_BAD_STATE, nh_encoding_insertUTF32(&Line_p->Codepoints, index, &c, 1))
+//    NH_BOOL b = NH_FALSE;
+//    nh_insertIntoArray(&Line_p->Copy, index, &b, 1);
+//    nh_insertIntoArray(&Line_p->Search, index, &b, 1);
+//    b = NH_TRUE;
+//    nh_insertIntoArray(&Line_p->Unsaved, index, &b, 1);
+//
+//NH_TTY_END(NH_TTY_SUCCESS)
+//}
+//
+//NH_TTY_RESULT nh_tty_removeFromChangesFileLine(
+//    nh_tty_ChangesFileLine *Line_p, int index, int length)
+//{
+//NH_TTY_BEGIN()
+//
+//    NH_CHECK(NH_TTY_ERROR_BAD_STATE, nh_encoding_removeUTF32(&Line_p->Codepoints, index, length))
+//    nh_removeFromArray(&Line_p->Copy, index, length);
+//
+//NH_TTY_END(NH_TTY_SUCCESS)
+//}
+
+// OPEN ============================================================================================
+
+static nh_tty_ChangesFile *nh_tty_createChangesFile()
+{
+NH_TTY_BEGIN()
+
+#include NH_TTY_CUSTOM_CHECK
+
+    nh_tty_ChangesFile *ChangesFile_p = malloc(sizeof(nh_tty_ChangesFile));
+    NH_TTY_CHECK_MEM(NULL, ChangesFile_p)
+
+NH_TTY_END(ChangesFile_p)
+}
+
+nh_tty_ChangesFile *nh_tty_openChangesFile(
+    nh_encoding_UTF32String *Path_p)
+{
+NH_TTY_BEGIN()
+
+#include NH_TTY_CUSTOM_CHECK
+
+    nh_tty_ChangesFile *File_p = malloc(sizeof(nh_tty_ChangesFile));
+    NH_TTY_CHECK_NULL(NULL, File_p)
+
+    File_p->cursorX = 0;
+    File_p->cursorY = 0;
+    File_p->modules = 0;
+
+    nh_encoding_UTF8String Path = nh_encoding_encodeUTF8(Path_p->p, Path_p->length);
+
+    File_p->Root_p = nh_make_parseChangesFile(Path.p);
+    File_p->summary_p = nh_make_getChangesSummary(File_p->Root_p);
+    File_p->Modules_p = nh_make_getChangesModules(File_p->Root_p, &File_p->modules);
+
+    nh_encoding_freeUTF8String(&Path);
+
+#include NH_TTY_DEFAULT_CHECK
+
+NH_TTY_END(File_p)
+}
+
+// CLOSE ===========================================================================================
+
+NH_TTY_RESULT nh_tty_closeChangesFile(
+    nh_tty_ChangesFile *ChangesFile_p)
+{
+NH_TTY_BEGIN()
+
+NH_TTY_DIAGNOSTIC_END(NH_TTY_SUCCESS)
+}
+
+// WRITE ===========================================================================================
+
+NH_TTY_RESULT nh_tty_writeChangesFile(
+    nh_tty_ChangesFile *File_p, nh_encoding_UTF32String *Path_p)
+{
+NH_TTY_BEGIN()
+
+NH_TTY_DIAGNOSTIC_END(NH_TTY_SUCCESS)
+}
+
+// DRAW ============================================================================================
+
+static int nh_tty_computeChangesNodeDepth(
+    nh_make_ChangesNode *Element_p)
+{
+NH_TTY_BEGIN()
+
+//    int depth = 0;
+//    while (Element_p->Parent_p) {
+//        ++depth;
+//        Element_p = Element_p->Parent_p;
+//    }
+
+NH_TTY_END(1)
+}
+
+typedef enum NH_TTY_CHANGES_INSERT {
+    NH_TTY_CHANGES_INSERT_UNDEFINED,
+    NH_TTY_CHANGES_INSERT_MODULE,
+    NH_TTY_CHANGES_INSERT_AUTHOR,
+} NH_TTY_CHANGES_INSERT;
+
+static NH_TTY_RESULT nh_tty_drawChangesAuthor(
+    nh_make_Author *Author_p, nh_tty_FileView *FileView_p, nh_String *String_p, int *line_p, int *width_p)
+{
+NH_TTY_BEGIN()
+
+//    (*line_p)--;
+//
+//    if (!(*line_p)) {
+//        NH_TTY_END(NH_TTY_SUCCESS)
+//    }
+//
+//    (*line_p)--;
+//
+//    if (!(*line_p)) {
+//        nh_appendToString(String_p, "| name: ", 8);
+//        *width_p += 8;
+//        nh_appendToString(String_p, Author_p->name_p, strlen(Author_p->name_p));
+//        *width_p += strlen(Author_p->name_p);
+//        NH_TTY_END(NH_TTY_SUCCESS)
+//    }
+//
+//    (*line_p)--;
+//
+//    if (!(*line_p)) {
+//        nh_appendToString(String_p, "| contact: ", 11);
+//        *width_p += 11;
+//        nh_appendToString(String_p, Author_p->contact_p, strlen(Author_p->contact_p));
+//        *width_p += strlen(Author_p->contact_p);
+//        NH_TTY_END(NH_TTY_SUCCESS)
+//    }
+//
+//    for (int i = 0; i < Author_p->messages; ++i) {
+//        (*line_p)--;
+//        if (*line_p) {continue;}
+//        nh_appendToString(String_p, "| message: ", 11);
+//        *width_p += 11;
+//        nh_appendToString(String_p, Author_p->messages_pp[i], strlen(Author_p->messages_pp[i]));
+//        *width_p += strlen(Author_p->messages_pp[i]);
+//        break;
+//    }
+//
+//    (*line_p)--;
+//
+//    if (!(*line_p)) {
+//        nh_appendToString(String_p, "[add message]", 13);
+//        *width_p += 13;
+//    }
+
+NH_TTY_END(NH_TTY_SUCCESS)
+}
+
+static NH_TTY_RESULT nh_tty_drawChangesModule(
+    nh_tty_ChangesFile *File_p, nh_tty_FileView *FileView_p, nh_String *String_p, int line, int *width_p)
+{
+NH_TTY_BEGIN()
+
+//    line--;
+//
+//    for (int i = 0; i < File_p->modules && line > 0; ++i) 
+//    {
+//        nh_make_Workload *Module_p = &File_p->Modules_p[i];
+//
+//        if (!line) {
+//            nh_appendToString(String_p, "---", 3);
+//            *width_p += 3;
+//            break;
+//        }
+//
+//        line--;
+//
+//        if (!line) {
+//            nh_appendToString(String_p, "names: ", 7);
+//            *width_p += 7;
+//            for (int j = 0; j < Module_p->names; ++j) {
+//                nh_appendToString(String_p, Module_p->names_pp[j], strlen(Module_p->names_pp[j]));
+//                *width_p += strlen(Module_p->names_pp[j]);
+//            }
+//            break;
+//        }
+//
+//        line--;
+//
+//        if (!line) {
+//            nh_appendToString(String_p, "scope: ", 7);
+//            *width_p += 7;
+//            nh_appendToString(String_p, Module_p->scope_p, strlen(Module_p->scope_p));
+//            *width_p += strlen(Module_p->scope_p);
+//            break;
+//        }
+//
+//        for (int j = 0; j < Module_p->authors; ++j) {
+//            nh_tty_drawChangesAuthor(Module_p->Authors_p+j, FileView_p, String_p, &line, width_p);
+//        }
+//
+//        line--;
+//
+//        if (!line) {
+//            nh_appendToString(String_p, "[add author]", 12);
+//            *width_p += 12;
+//            break;
+//        }
+//    }
+
+NH_TTY_END(NH_TTY_SUCCESS)
+}
+
+NH_TTY_RESULT nh_tty_drawChangesFileLine(
+    nh_tty_ChangesFile *File_p, nh_tty_FileView *FileView_p, nh_String *String_p, int line)
+{
+NH_TTY_BEGIN()
+
+//    int offsetLine = line + FileView_p->ChangesFile.rowOffset;
+    int offsetLine = line;
+    int width = 0;
+
+    if (line == 0) {
+        nh_appendToString(String_p, File_p->summary_p, strlen(File_p->summary_p));
+        width += strlen(File_p->summary_p);
+    }
+    else {
+        nh_tty_drawChangesModule(File_p, FileView_p, String_p, offsetLine, &width);
+    }
+
+    for (int i = 0; i < FileView_p->width - width; ++i) {
+        nh_appendToString(String_p, " ", 1);
+    }
+
+NH_TTY_DIAGNOSTIC_END(NH_TTY_SUCCESS)
+}
+
diff --git a/src/lib/nhtty/Editor/ChangesFile.h b/src/lib/nhtty/Editor/ChangesFile.h
new file mode 100644
index 0000000..3a22676
--- /dev/null
+++ b/src/lib/nhtty/Editor/ChangesFile.h
@@ -0,0 +1,72 @@
+#ifndef NH_TTY_CHANGES_FILE_H
+#define NH_TTY_CHANGES_FILE_H
+
+#ifndef DOXYGEN_SHOULD_SKIP_THIS
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2020 The netzhaut Authors
+ * Published under MIT
+ */
+
+#include "FileEditor.h"
+#include "SyntaxHighlights.h"
+
+#include "../Common/Types/Private.h"
+
+#endif
+
+/** @addtogroup lib_nhtty_structs
+ *  @{
+ */
+
+    typedef struct nh_tty_ChangesFile {
+        nh_make_ChangesNode *Root_p;
+        NH_BYTE *summary_p;
+        nh_make_Workload *Modules_p;
+        int modules;
+        int cursorX;
+        int cursorY;
+    } nh_tty_ChangesFile;
+
+/** @} */
+
+/** @addtogroup lib_nhtty_functions
+ *  @{
+ */
+
+    nh_tty_ChangesFile *nh_tty_newChangesFile(
+        nh_tty_ChangesFile *ChangesFile_p, int index
+    );
+    
+    nh_tty_ChangesFile *nh_tty_openChangesFile(
+        nh_encoding_UTF32String *Path_p 
+    );
+
+    NH_TTY_RESULT nh_tty_closeChangesFile(
+        nh_tty_ChangesFile *File_p
+    );
+
+    NH_TTY_RESULT nh_tty_clearChangesFileSearch(
+        nh_tty_ChangesFile *ChangesFile_p
+    );
+
+    NH_TTY_RESULT nh_tty_searchChangesFile(
+        nh_tty_ChangesFile *ChangesFile_p, NH_ENCODING_UTF32 *str_p, int length
+    );
+
+    NH_TTY_RESULT nh_tty_writeChangesFile(
+        nh_tty_ChangesFile *File_p, nh_encoding_UTF32String *Path_p
+    );
+
+    NH_TTY_RESULT nh_tty_renderChangesFileLine(
+        nh_tty_ChangesFile *ChangesFile_p, int line
+    );
+
+    NH_TTY_RESULT nh_tty_drawChangesFileLine(
+        nh_tty_ChangesFile *File_p, nh_tty_FileView *FileView_p, nh_String *String_p, int line
+    );
+
+/** @} */
+
+#endif 
diff --git a/src/lib/nhtty/Editor/ChangesFileInput.c b/src/lib/nhtty/Editor/ChangesFileInput.c
new file mode 100644
index 0000000..a315960
--- /dev/null
+++ b/src/lib/nhtty/Editor/ChangesFileInput.c
@@ -0,0 +1,554 @@
+// LICENSE NOTICE ==================================================================================
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2020 The netzhaut Authors
+ * Published under MIT
+ */
+
+// INCLUDE =========================================================================================
+
+#include "TextFileInput.h"
+#include "TextFile.h"
+#include "Editor.h"
+#include "TreeListing.h"
+
+#include "../TTY/TTY.h"
+
+#include "../Common/Macros/Macros.h"
+#include NH_TTY_FLOW
+#include NH_TTY_DEFAULT_CHECK
+
+#include "../../nhcore/System/Process.h"
+#include "../../nhcore/System/Memory.h"
+#include "../../nhcore/Util/File.h"
+#include "../../nhcore/Common/Macros/Macros.h"
+#include NH_FLOW
+#include NH_CUSTOM_CHECK
+
+#include "../../nhcss/Parser/Parser.h"
+#include "../../nhhtml/Parser/Parser.h"
+#include "../../nhwebidl/Runtime/Parser.h"
+
+#include "../../nhencoding/Encodings/UTF32.h"
+#include "../../nhencoding/Encodings/UTF8.h"
+#include "../../nhencoding/Common/Macros/Macros.h"
+#include NH_ENCODING_FLOW
+#include NH_ENCODING_CUSTOM_CHECK
+
+#include <stddef.h>
+#include <unistd.h>
+#include <stdio.h>
+#include <string.h>
+#include <dirent.h>
+#include <stdlib.h>
+
+#include <sys/types.h>
+#include <sys/stat.h>
+
+//// CLIPBOARD =======================================================================================
+//
+//static NH_TTY_RESULT nh_tty_setClipboard(
+//    nh_tty_TextFile *TextFile_p, NH_BOOL append, NH_BOOL *refresh_p)
+//{
+//NH_TTY_BEGIN()
+//
+//    if (!append) {nh_tty_resetClipboard(nh_tty_getTTY());}
+//
+//    for (int i = 0; i < TextFile_p->Lines.size; ++i) 
+//    {
+//        nh_tty_TextFileLine *Line_p = TextFile_p->Lines.pp[i];
+//        nh_encoding_UTF32String *Copy_p = NULL;
+//
+//        for (int j = 0; j < Line_p->Copy.length; ++j) {
+//            if (((NH_BOOL*)Line_p->Copy.p)[j]) {
+//                if (!Copy_p) {
+//                    Copy_p = nh_tty_newClipboardLine(nh_tty_getTTY());
+//                    NH_TTY_CHECK_MEM(Copy_p)
+//                }
+//                nh_encoding_appendUTF32(Copy_p, &Line_p->Codepoints.p[j], 1);
+//                ((NH_BOOL*)Line_p->Copy.p)[j] = NH_FALSE;
+//            }
+//        }
+//
+//        if (Copy_p) {
+//            NH_TTY_CHECK(nh_tty_renderTextFileLine(TextFile_p, i))
+//            *refresh_p = NH_TRUE;
+//        }
+//    }
+//
+//NH_TTY_DIAGNOSTIC_END(NH_TTY_SUCCESS)
+//}
+//
+//static NH_TTY_RESULT nh_tty_insertClipboard(
+//    nh_List *Views_p, nh_tty_File *File_p, NH_BOOL *refresh_p)
+//{
+//NH_TTY_BEGIN()
+//
+//    nh_tty_TextFile *TextFile_p = File_p->handle_p;
+//    nh_tty_Clipboard *Clipboard_p = &nh_tty_getTTY()->Clipboard;
+//
+//    if (Clipboard_p->Lines.length > 1) 
+//    {
+//        int fileCursorX = TextFile_p->fileCursorX;
+//        NH_TTY_CHECK(nh_tty_handleTextFileInput(Views_p, File_p, 13, NH_FALSE, refresh_p))
+//        NH_TTY_CHECK(nh_tty_handleTextFileInput(Views_p, File_p, 'k', NH_FALSE, refresh_p))
+//
+//        while (TextFile_p->fileCursorX < fileCursorX) {
+//            NH_TTY_CHECK(nh_tty_handleTextFileInput(Views_p, File_p, 'l', NH_FALSE, refresh_p))
+//        }
+//    }
+//
+//    for (int i = 0; i < Clipboard_p->Lines.length; ++i) 
+//    {
+//        nh_encoding_UTF32String *ClipboardLine_p = &((nh_encoding_UTF32String*)Clipboard_p->Lines.p)[i];
+//
+//        for (int j = 0; j < ClipboardLine_p->length; ++j) {
+//            NH_TTY_CHECK(nh_tty_handleTextFileInput(Views_p, File_p, ClipboardLine_p->p[j], NH_TRUE, refresh_p))
+//        }
+//        if (i + 1 < Clipboard_p->Lines.length) {
+//            NH_TTY_CHECK(nh_tty_handleTextFileInput(Views_p, File_p, 'o', NH_FALSE, refresh_p))
+//        }
+//    }
+//
+//    *refresh_p = NH_TRUE;
+//
+//NH_TTY_DIAGNOSTIC_END(NH_TTY_SUCCESS)
+//}
+//
+//// INPUT ===========================================================================================
+//
+//static NH_TTY_RESULT nh_tty_handleFileCursorXTarget(
+//    nh_List *Views_p, nh_tty_File *File_p, NH_BOOL *refresh_p)
+//{
+//NH_TTY_BEGIN()
+//
+//    nh_tty_TextFile *TextFile_p = File_p->handle_p;
+//    nh_tty_TextFileLine *Line_p = nh_getFromList(&TextFile_p->Lines, TextFile_p->fileCursorY);
+//    NH_TTY_CHECK_NULL(Line_p)
+//
+//    int *colOffsets_p = nh_allocate(sizeof(int) * Views_p->size);
+//    NH_TTY_CHECK_MEM(colOffsets_p)
+//
+//    for (int i = 0; i < Views_p->size; ++i) {
+//        colOffsets_p[i] = ((nh_tty_FileView*)Views_p->pp[i])->TextFile.colOffset;
+//        ((nh_tty_FileView*)Views_p->pp[i])->TextFile.colOffset = 0;
+//        ((nh_tty_FileView*)Views_p->pp[i])->TextFile.screenCursorX = 0;
+//    }
+//
+//    int xTarget = TextFile_p->fileCursorXTarget;
+//    TextFile_p->fileCursorX = 0;
+//
+//    if (xTarget > Line_p->Codepoints.length) {
+//        while (TextFile_p->fileCursorX < Line_p->Codepoints.length) {
+//            NH_TTY_CHECK(nh_tty_handleTextFileInput(Views_p, File_p, 'l', NH_FALSE, refresh_p))
+//        }
+//        TextFile_p->fileCursorXTarget = xTarget;
+//    }
+//    else {
+//        while (xTarget > TextFile_p->fileCursorX) {
+//            NH_TTY_CHECK(nh_tty_handleTextFileInput(Views_p, File_p, 'l', NH_FALSE, refresh_p))
+//        }
+//        TextFile_p->fileCursorXTarget = xTarget;
+//    }
+//
+//    for (int i = 0; i < Views_p->size; ++i) {
+//        if (((nh_tty_FileView*)Views_p->pp[i])->TextFile.colOffset != colOffsets_p[i]) {
+//            *refresh_p = NH_TRUE;
+//        }
+//    }
+//
+//    nh_free(colOffsets_p);
+//
+//NH_TTY_DIAGNOSTIC_END(NH_TTY_SUCCESS)
+//}
+//
+//static NH_TTY_RESULT nh_tty_handleCopySelection(
+//    nh_tty_TextFile *TextFile_p, nh_tty_TextFileLine *Line_p, NH_ENCODING_UTF32 c, NH_BOOL *refresh_p)
+//{
+//NH_TTY_BEGIN()
+//
+//    if (TextFile_p->select < 0) {NH_TTY_DIAGNOSTIC_END(NH_TTY_SUCCESS)}
+//
+//    switch (c)
+//    {
+//        case 'j' :
+//            for (int i = 0; i < Line_p->Copy.length; ++i) { 
+//                ((NH_BOOL*)Line_p->Copy.p)[i] = TextFile_p->select < TextFile_p->fileCursorY;
+//            }
+//            NH_TTY_CHECK(nh_tty_renderTextFileLine(TextFile_p, TextFile_p->fileCursorY - 1))
+//            break;
+//
+//        case 'k' :
+//            for (int i = 0; i < Line_p->Copy.length; ++i) { 
+//                ((NH_BOOL*)Line_p->Copy.p)[i] = TextFile_p->select > TextFile_p->fileCursorY + 1;
+//            }
+//            NH_TTY_CHECK(nh_tty_renderTextFileLine(TextFile_p, TextFile_p->fileCursorY + 1))
+//            break;
+//
+//        case 'l' :
+//            ((NH_BOOL*)Line_p->Copy.p)[TextFile_p->fileCursorX - 1] = NH_TRUE;
+//            NH_TTY_CHECK(nh_tty_renderTextFileLine(TextFile_p, TextFile_p->fileCursorY))
+//            break;
+//
+//        case 'h' :
+//            ((NH_BOOL*)Line_p->Copy.p)[TextFile_p->fileCursorX + 1] = NH_FALSE;
+//            NH_TTY_CHECK(nh_tty_renderTextFileLine(TextFile_p, TextFile_p->fileCursorY))
+//            break;
+//    }
+//
+//    *refresh_p = NH_TRUE;
+//
+//NH_TTY_DIAGNOSTIC_END(NH_TTY_SUCCESS)
+//}
+//
+//// READ ============================================================================================
+//
+//static NH_TTY_RESULT nh_tty_handleTextFileViews(
+//    nh_List *Views_p, nh_tty_TextFile *TextFile_p, NH_ENCODING_UTF32 c, NH_BOOL *refresh_p)
+//{
+//NH_TTY_BEGIN()
+//
+//    switch (c)
+//    {
+//        case 'j' : 
+//            for (int i = 0; i < Views_p->size; ++i) {
+//                nh_tty_FileView *FileView_p = Views_p->pp[i];
+//                if (FileView_p->TextFile.screenCursorY < FileView_p->height) {FileView_p->TextFile.screenCursorY++;}
+//                else {
+//                    FileView_p->TextFile.rowOffset++;
+//                    *refresh_p = NH_TRUE;
+//                }
+//            }
+//            break; 
+//
+//        case 'k' :
+//            for (int i = 0; i < Views_p->size; ++i) {
+//                nh_tty_FileView *FileView_p = Views_p->pp[i];
+//                if (FileView_p->TextFile.screenCursorY > 0) {FileView_p->TextFile.screenCursorY--;}
+//                else if (FileView_p->TextFile.rowOffset > 0) {
+//                    FileView_p->TextFile.rowOffset--;
+//                    *refresh_p = NH_TRUE;
+//                }
+//            }
+//            break; 
+//
+//        case 'l' :
+//            for (int i = 0; i < Views_p->size; ++i) {
+//                nh_tty_FileView *FileView_p = Views_p->pp[i];
+//                if (FileView_p->TextFile.screenCursorX < FileView_p->width - TextFile_p->lineNumberOffset - 1) {FileView_p->TextFile.screenCursorX++;}
+//                else {
+//                    FileView_p->TextFile.colOffset++;
+//                    *refresh_p = NH_TRUE;
+//                }
+//            }
+//            break;
+//
+//        case 'h' :
+//            for (int i = 0; i < Views_p->size; ++i) {
+//                nh_tty_FileView *FileView_p = Views_p->pp[i];
+//                if (FileView_p->TextFile.screenCursorX > 0) {FileView_p->TextFile.screenCursorX--;}
+//                else if (FileView_p->TextFile.colOffset > 0) {
+//                    FileView_p->TextFile.colOffset--;
+//                    *refresh_p = NH_TRUE;
+//                }
+//            }
+//            break;
+//    }
+//
+//NH_TTY_END(NH_TTY_SUCCESS)
+//}
+//
+//NH_TTY_RESULT nh_tty_handleReadOperation(
+//    nh_List *Views_p, nh_tty_File *File_p, NH_ENCODING_UTF32 c, NH_BOOL insertMode, NH_BOOL *refresh_p,
+//    NH_BOOL *read_p)
+//{
+//NH_TTY_BEGIN()
+//
+//    nh_tty_TextFile *TextFile_p = File_p->handle_p;
+//    nh_tty_TextFileLine *Line_p = nh_getFromList(&TextFile_p->Lines, TextFile_p->fileCursorY);
+//    NH_TTY_CHECK_NULL(Line_p)
+//
+//    if (insertMode) {
+//        switch (c) {
+//            case 'j' :
+//            case 'k' :
+//            case 'l' :
+//            case 'h' :
+//            case 'c' : NH_TTY_END(NH_TTY_SUCCESS)
+//        }
+//    }
+//
+//    switch (c)
+//    {
+//        case 'j' : 
+//        case 'k' :
+//        case 'l' :
+//        case 'h' :
+//        case 'c' :
+//        case CTRL_KEY('j') : 
+//        case CTRL_KEY('k') : 
+//        case CTRL_KEY('l') : 
+//        case CTRL_KEY('h') : 
+//        case CTRL_KEY('c') : *read_p = NH_TRUE;
+//    }
+//
+//    switch (c)
+//    {
+//        case 'j' : 
+//        case CTRL_KEY('j') : 
+//
+//            if (TextFile_p->fileCursorY < TextFile_p->Lines.size - 1) 
+//            {
+//                TextFile_p->fileCursorY++;
+//
+//                NH_TTY_CHECK(nh_tty_handleTextFileViews(Views_p, TextFile_p, 'j', refresh_p))
+//                NH_TTY_CHECK(nh_tty_handleFileCursorXTarget(Views_p, File_p, refresh_p))
+//                NH_TTY_CHECK(nh_tty_handleCopySelection(TextFile_p, Line_p, 'j', refresh_p))
+//            }
+//            break; 
+//
+//        case 'k' :
+//        case CTRL_KEY('k') : 
+//
+//            if (TextFile_p->fileCursorY > 0)
+//            {
+//                TextFile_p->fileCursorY--;
+//
+//                NH_TTY_CHECK(nh_tty_handleTextFileViews(Views_p, TextFile_p, 'k', refresh_p))
+//                NH_TTY_CHECK(nh_tty_handleFileCursorXTarget(Views_p, File_p, refresh_p))
+//                NH_TTY_CHECK(nh_tty_handleCopySelection(TextFile_p, Line_p, 'k', refresh_p))
+//            }
+//            break; 
+//
+//        case 'l' :
+//        case CTRL_KEY('l') : 
+//
+//            if (TextFile_p->fileCursorX < Line_p->Codepoints.length) 
+//            {
+//                TextFile_p->fileCursorX++;
+//                TextFile_p->fileCursorXTarget = TextFile_p->fileCursorX;
+//
+//                NH_TTY_CHECK(nh_tty_handleTextFileViews(Views_p, TextFile_p, 'l', refresh_p))
+//                NH_TTY_CHECK(nh_tty_handleCopySelection(TextFile_p, Line_p, 'l', refresh_p))
+//            }
+//            break;
+//
+//        case 'h' :
+//        case CTRL_KEY('h') : 
+//
+//            if (TextFile_p->fileCursorX > 0) 
+//            {
+//                TextFile_p->fileCursorX--;
+//                TextFile_p->fileCursorXTarget = TextFile_p->fileCursorX;
+//
+//                NH_TTY_CHECK(nh_tty_handleTextFileViews(Views_p, TextFile_p, 'h', refresh_p))
+//                NH_TTY_CHECK(nh_tty_handleCopySelection(TextFile_p, Line_p, 'h', refresh_p))
+//            }
+//            break;
+//
+//         case 'c' :
+//         case CTRL_KEY('c') :
+//
+//             if (TextFile_p->select >= 0) {
+//                 NH_TTY_CHECK(nh_tty_setClipboard(TextFile_p, NH_FALSE, refresh_p))
+//                 TextFile_p->select = -1;
+//             }
+//             else {TextFile_p->select = TextFile_p->fileCursorY;}
+//             break;
+//    }
+//
+//NH_TTY_END(NH_TTY_SUCCESS)
+//}
+//
+//// WRITE ===========================================================================================
+//
+//NH_TTY_RESULT nh_tty_handleWriteOperation(
+//    nh_List *Views_p, nh_tty_File *File_p, NH_ENCODING_UTF32 c, NH_BOOL insertMode, NH_BOOL *refresh_p, 
+//    NH_BOOL *write_p)
+//{
+//NH_TTY_BEGIN()
+//
+//    nh_tty_Editor *Editor_p = nh_tty_getCurrentProgram(&nh_tty_getTTY()->Tab_p->Tile_p->Console)->handle_p;
+//    nh_tty_TextFile *TextFile_p = File_p->handle_p;
+//    nh_tty_TextFileLine *Line_p = nh_getFromList(&TextFile_p->Lines, TextFile_p->fileCursorY);
+//    NH_TTY_CHECK_NULL(Line_p)
+//
+//    if (insertMode) {
+//        switch (c) {
+//            case 'o' :
+//            case 'p' :
+//            case 'x' :
+//            case 'u' :
+//            case 'i' :
+//            case 'v' : NH_TTY_END(NH_TTY_SUCCESS)
+//        }
+//    }
+//
+//    switch (c)
+//    {
+//        case 'o' :
+//        case 'p' :
+//        case 'x' :
+//        case 'u' :
+//        case 'i' :
+//        case 'v' :
+//        case 13  : 
+//        case 127 :
+//        case CTRL_KEY('o') :
+//        case CTRL_KEY('p') :
+//        case CTRL_KEY('x') :
+//        case CTRL_KEY('u') :
+//        case CTRL_KEY('i') :
+//        case CTRL_KEY('v') : *write_p = NH_TRUE;
+//    }
+//
+//    if (*write_p) {*refresh_p = NH_TRUE;}
+//
+//    switch (c)
+//    {
+//        case 'o' :
+//        case CTRL_KEY('o') :
+//
+//            NH_TTY_CHECK_MEM(nh_tty_newTextFileLine(TextFile_p, TextFile_p->fileCursorY + 1))
+//            nh_tty_renderTextFileLine(TextFile_p, TextFile_p->fileCursorY + 1);
+//            NH_TTY_CHECK(nh_tty_handleTextFileInput(Views_p, File_p, 'j', NH_FALSE, refresh_p))
+//            break;
+//
+//        case 'p' :
+//        case CTRL_KEY('p') :
+//
+//            NH_TTY_CHECK(nh_tty_removeFromTextFileLine(Line_p, TextFile_p->fileCursorX, 1))
+//            NH_TTY_CHECK(nh_tty_renderTextFileLine(TextFile_p, TextFile_p->fileCursorY))
+//            break;
+//
+//        case 'x' :
+//        case CTRL_KEY('x') :
+//
+//            if (TextFile_p->fileCursorY >= TextFile_p->Lines.size - 1) {
+//                NH_TTY_CHECK(nh_tty_handleTextFileInput(Views_p, File_p, 'k', NH_FALSE, refresh_p))
+//                NH_CHECK(NH_TTY_ERROR_BAD_STATE, nh_removeFromList(&TextFile_p->Lines, NH_TRUE, TextFile_p->fileCursorY + 1))
+//            }
+//            else {
+//                NH_CHECK(NH_TTY_ERROR_BAD_STATE, nh_removeFromList(&TextFile_p->Lines, NH_TRUE, TextFile_p->fileCursorY))
+//            }
+//            break;
+//
+//        case 127 :
+//        case 'u' :
+//        case CTRL_KEY('u') :
+//
+//            if (TextFile_p->fileCursorX > 0) {
+//                NH_TTY_CHECK(nh_tty_removeFromTextFileLine(Line_p, TextFile_p->fileCursorX - 1, 1))
+//                NH_TTY_CHECK(nh_tty_renderTextFileLine(TextFile_p, TextFile_p->fileCursorY))
+//                NH_TTY_CHECK(nh_tty_handleTextFileInput(Views_p, File_p, 'h', NH_FALSE, refresh_p))
+//            }
+//            else {
+//                NH_TTY_CHECK(nh_tty_handleTextFileInput(Views_p, File_p, 'k', NH_FALSE, refresh_p))
+//
+//                nh_tty_TextFileLine *PreviousLine_p = 
+//                    nh_getFromList(&TextFile_p->Lines, TextFile_p->fileCursorY);
+//                int length = PreviousLine_p->Codepoints.length;
+//
+//                while (TextFile_p->fileCursorX < length) {
+//                    NH_TTY_CHECK(nh_tty_handleTextFileInput(Views_p, File_p, 'l', NH_FALSE, refresh_p))
+//                }
+//
+//                for (int i = 0; i < Line_p->Codepoints.length; ++i) {
+//                    NH_TTY_CHECK(nh_tty_handleTextFileInput(
+//                        Views_p, File_p, Line_p->Codepoints.p[i], NH_TRUE, refresh_p
+//                    ))
+//                }
+//
+//                NH_TTY_CHECK(nh_tty_handleTextFileInput(Views_p, File_p, 'j', NH_FALSE, refresh_p))
+//                NH_TTY_CHECK(nh_tty_handleTextFileInput(Views_p, File_p, 'x', NH_FALSE, refresh_p))
+//                NH_TTY_CHECK(nh_tty_handleTextFileInput(Views_p, File_p, 'k', NH_FALSE, refresh_p))
+//
+//                for (int i = 0; i < length; ++i) {
+//                    NH_TTY_CHECK(nh_tty_handleTextFileInput(Views_p, File_p, 'l', NH_FALSE, refresh_p))
+//                }
+//            }
+//            break;
+//
+//        case 'i' :
+//        case CTRL_KEY('i') : // 9 aka 'tab'
+//
+//            if (Editor_p->FileEditor.tabToSpaces) {
+//                for (int i = 0; i < Editor_p->FileEditor.tabSpaces; ++i) {
+//                    NH_TTY_CHECK(nh_tty_handleTextFileInput(Views_p, File_p, 32, NH_TRUE, refresh_p))
+//                }
+//            } else {*write_p = NH_FALSE;}
+//            break;
+//
+//        case 'v' :
+//        case CTRL_KEY('v') :
+//
+//            NH_TTY_CHECK(nh_tty_insertClipboard(Views_p, File_p, refresh_p))
+//            break;
+//
+//        case 13 : // carriage-return aka enter
+//        {
+//            int fileCursorX = TextFile_p->fileCursorX;
+//            NH_TTY_CHECK(nh_tty_handleTextFileInput(Views_p, File_p, 'o', NH_FALSE, refresh_p))
+//
+//            for (int i = fileCursorX; i < Line_p->Codepoints.length; ++i) {
+//                NH_TTY_CHECK(nh_tty_handleTextFileInput(Views_p, File_p, Line_p->Codepoints.p[i], NH_TRUE, refresh_p))
+//            }
+//            while (TextFile_p->fileCursorX > 0) {
+//                NH_TTY_CHECK(nh_tty_handleTextFileInput(Views_p, File_p, 'h', NH_FALSE, refresh_p))
+//            }
+//
+//            NH_TTY_CHECK(nh_tty_handleTextFileInput(Views_p, File_p, 'k', NH_FALSE, refresh_p))
+//
+//            while (TextFile_p->fileCursorX < fileCursorX) {
+//                NH_TTY_CHECK(nh_tty_handleTextFileInput(Views_p, File_p, 'l', NH_FALSE, refresh_p))
+//            }
+//            while (TextFile_p->fileCursorX < Line_p->Codepoints.length) {
+//                NH_TTY_CHECK(nh_tty_handleTextFileInput(Views_p, File_p, 'i', NH_FALSE, refresh_p))
+//            }
+//
+//            NH_TTY_CHECK(nh_tty_handleTextFileInput(Views_p, File_p, 'j', NH_FALSE, refresh_p))
+//            while (TextFile_p->fileCursorX > 0) {
+//                NH_TTY_CHECK(nh_tty_handleTextFileInput(Views_p, File_p, 'h', NH_FALSE, refresh_p))
+//            }
+//
+//            break;
+//        }
+//    }
+// 
+//NH_TTY_END(NH_TTY_SUCCESS)
+//}
+//
+//// HANDLE INPUT ====================================================================================
+
+NH_TTY_RESULT nh_tty_handleChangesFileInput(
+    nh_List *Views_p, nh_tty_File *File_p, NH_ENCODING_UTF32 c, NH_BOOL insertMode, NH_BOOL *refresh_p)
+{
+NH_TTY_BEGIN()
+
+puts("k");
+exit(0);
+
+//    NH_BOOL read = NH_FALSE;
+//    NH_TTY_CHECK(nh_tty_handleReadOperation(Views_p, File_p, c, insertMode, refresh_p, &read))
+//    if (read) {NH_TTY_END(NH_TTY_SUCCESS)}
+//
+//    if (!File_p->readOnly) 
+//    {
+//        NH_BOOL write = NH_FALSE;
+//        NH_TTY_CHECK(nh_tty_handleWriteOperation(Views_p, File_p, c, insertMode, refresh_p, &write))
+//        if (write) {NH_TTY_END(NH_TTY_SUCCESS)}
+//
+//        if (insertMode) {
+//            nh_tty_TextFile *TextFile_p = File_p->handle_p;
+//            nh_tty_TextFileLine *Line_p = nh_getFromList(&TextFile_p->Lines, TextFile_p->fileCursorY);
+//            NH_TTY_CHECK(nh_tty_insertIntoTextFileLine(Line_p, TextFile_p->fileCursorX, c))
+//            NH_TTY_CHECK(nh_tty_handleTextFileInput(Views_p, File_p, 'l', NH_FALSE, refresh_p))
+//            NH_TTY_CHECK(nh_tty_renderTextFileLine(TextFile_p, TextFile_p->fileCursorY))
+//            *refresh_p = NH_TRUE;
+//        }
+//    }
+ 
+NH_TTY_END(NH_TTY_SUCCESS)
+}
+
diff --git a/src/lib/nhtty/Editor/ChangesFileInput.h b/src/lib/nhtty/Editor/ChangesFileInput.h
new file mode 100644
index 0000000..cfaf1d1
--- /dev/null
+++ b/src/lib/nhtty/Editor/ChangesFileInput.h
@@ -0,0 +1,29 @@
+#ifndef NH_TTY_CHANGES_FILE_INPUT_H
+#define NH_TTY_CHANGES_FILE_INPUT_H
+
+#ifndef DOXYGEN_SHOULD_SKIP_THIS
+
+/**
+ * netzhaut - Web Browser Engine
+ * Copyright (C) 2020 The netzhaut Authors
+ * Published under MIT
+ */
+
+#include "FileEditor.h"
+
+#include "../Common/Types/Private.h"
+
+#endif
+
+/** @addtogroup lib_nhtty_functions
+ *  @{
+ */
+
+    NH_TTY_RESULT nh_tty_handleChangesFileInput(
+        nh_List *Views_p, nh_tty_File *File_p, NH_ENCODING_UTF32 c, NH_BOOL insertMode,  
+        NH_BOOL *refresh_p
+    );
+
+/** @} */
+
+#endif 
diff --git a/src/lib/nhtty/Editor/Editor.c b/src/lib/nhtty/Editor/Editor.c
index 8741e56..d8c0835 100644
--- a/src/lib/nhtty/Editor/Editor.c
+++ b/src/lib/nhtty/Editor/Editor.c
@@ -11,7 +11,7 @@
 #include "Editor.h"
 #include "TextFile.h"
 
-#include "../PseudoTerminal/PseudoTerminal.h"
+#include "../TTY/TTY.h"
 #include "../Common/Macros/Macros.h"
 
 #include NH_TTY_FLOW
@@ -262,7 +262,7 @@ NH_TTY_BEGIN()
 
             Editor_p->insertMode = !Editor_p->insertMode; 
             NH_TTY_CHECK(nh_tty_setDefaultMessage(
-                &nh_tty_getPseudoTerminal()->Tab_p->Tile_p->Status,
+                &nh_tty_getTTY()->Tab_p->Tile_p->Status,
                 Editor_p->insertMode ? NH_TTY_MESSAGE_EDITOR_INSERT_ACTIVATED : NH_TTY_MESSAGE_EDITOR_INSERT_DEACTIVATED 
             ))
             Program_p->refresh = NH_TRUE;
@@ -344,13 +344,13 @@ NH_TTY_BEGIN()
         File_p = nh_getFromLinkedList(&Editor_p->FileEditor.Files, i);
         FileView_p = nh_tty_getFileView(View_p, File_p);
         if (i == Editor_p->FileEditor.current) {break;}
-        x += View_p->fileEditorWidth / Editor_p->FileEditor.Files.count;
+        x += FileView_p->width;
     }
 
     if (File_p != NULL && File_p->type == NH_TTY_FILE_TEXT) 
     {
         nh_tty_TextFile *TextFile_p = File_p->handle_p;
-        *x_p = FileView_p->TextFile.screenCursorX + TextFile_p->lineNumberOffset + x + 1;
+        *x_p = FileView_p->TextFile.screenCursorX + TextFile_p->lineNumberOffset + x;
         *y_p = FileView_p->TextFile.screenCursorY + 1;
     }
     else {
@@ -387,7 +387,7 @@ NH_TTY_BEGIN()
 
             Editor_p->TreeListing.preview = !Editor_p->TreeListing.preview; 
             NH_TTY_CHECK(nh_tty_setDefaultMessage(
-               &nh_tty_getPseudoTerminal()->Tab_p->Tile_p->Status,
+               &nh_tty_getTTY()->Tab_p->Tile_p->Status,
                Editor_p->TreeListing.preview ? NH_TTY_MESSAGE_EDITOR_PREVIEW_ENABLED : NH_TTY_MESSAGE_EDITOR_PREVIEW_DISABLED
             ))
             Program_p->refresh = NH_TRUE;
@@ -397,7 +397,7 @@ NH_TTY_BEGIN()
 
             Editor_p->treeListing = !Editor_p->treeListing; 
             NH_TTY_CHECK(nh_tty_setDefaultMessage(
-               &nh_tty_getPseudoTerminal()->Tab_p->Tile_p->Status,
+               &nh_tty_getTTY()->Tab_p->Tile_p->Status,
                Editor_p->treeListing ? NH_TTY_MESSAGE_EDITOR_SHOW_TREE : NH_TTY_MESSAGE_EDITOR_HIDE_TREE 
             ))
             Program_p->refresh = NH_TRUE;
@@ -416,7 +416,7 @@ NH_TTY_BEGIN()
             NH_TTY_CHECK_NULL(File_p)
 
             NH_TTY_CHECK(nh_tty_setDefaultMessage(
-                &nh_tty_getPseudoTerminal()->Tab_p->Tile_p->Status, NH_TTY_MESSAGE_EDITOR_NEW_FILE
+                &nh_tty_getTTY()->Tab_p->Tile_p->Status, NH_TTY_MESSAGE_EDITOR_NEW_FILE
             ))
 
             Program_p->refresh = NH_TRUE;
@@ -456,7 +456,7 @@ NH_TTY_BEGIN()
             nh_encoding_UTF32String TabSpaces = nh_encoding_decodeUTF8(tabSpaces_p, strlen(tabSpaces_p), NULL);
 
             NH_TTY_CHECK(nh_tty_setCustomMessage(
-               &nh_tty_getPseudoTerminal()->Tab_p->Tile_p->Status, NH_TTY_MESSAGE_EDITOR_NUMBER_OF_TAB_SPACES,
+               &nh_tty_getTTY()->Tab_p->Tile_p->Status, NH_TTY_MESSAGE_EDITOR_NUMBER_OF_TAB_SPACES,
                TabSpaces.p, TabSpaces.length
             ))
 
@@ -467,7 +467,7 @@ NH_TTY_BEGIN()
 
             Editor_p->FileEditor.tabToSpaces = !Editor_p->FileEditor.tabToSpaces;
             NH_TTY_CHECK(nh_tty_setDefaultMessage(
-               &nh_tty_getPseudoTerminal()->Tab_p->Tile_p->Status, Editor_p->FileEditor.tabToSpaces ? 
+               &nh_tty_getTTY()->Tab_p->Tile_p->Status, Editor_p->FileEditor.tabToSpaces ? 
                NH_TTY_MESSAGE_EDITOR_TAB_TO_SPACES_ENABLED : NH_TTY_MESSAGE_EDITOR_TAB_TO_SPACES_DISABLED
             ))
             break;
diff --git a/src/lib/nhtty/Editor/Editor.h b/src/lib/nhtty/Editor/Editor.h
index 230364d..14331f0 100644
--- a/src/lib/nhtty/Editor/Editor.h
+++ b/src/lib/nhtty/Editor/Editor.h
@@ -12,7 +12,7 @@
 #include "TreeListing.h"
 #include "FileEditor.h"
 
-#include "../PseudoTerminal/Program.h"
+#include "../TTY/Program.h"
 #include "../Common/Types/Private.h"
 
 #include "../../nhcore/Util/String.h"
diff --git a/src/lib/nhtty/Editor/File.c b/src/lib/nhtty/Editor/File.c
index dbcc7d0..63a7b49 100644
--- a/src/lib/nhtty/Editor/File.c
+++ b/src/lib/nhtty/Editor/File.c
@@ -13,9 +13,11 @@
 #include "TreeListing.h"
 #include "TextFile.h"
 #include "TextFileInput.h"
+#include "ChangesFile.h"
+#include "ChangesFileInput.h"
 #include "SyntaxHighlights.h"
 
-#include "../PseudoTerminal/PseudoTerminal.h"
+#include "../TTY/TTY.h"
 #include "../Common/Macros/Macros.h"
 #include NH_TTY_FLOW
 #include NH_TTY_DEFAULT_CHECK
@@ -26,6 +28,8 @@
 #include NH_FLOW
 #include NH_CUSTOM_CHECK
 
+#include "../../nhencoding/Encodings/UTF8.h"
+
 #include <stddef.h>
 #include <unistd.h>
 #include <stdio.h>
@@ -146,6 +150,25 @@ NH_TTY_BEGIN()
 NH_TTY_SILENT_END()
 }
 
+// TYPE ============================================================================================
+
+NH_TTY_FILE nh_tty_getFileType(
+    nh_encoding_UTF32String *Path_p)
+{
+NH_TTY_BEGIN()
+
+    NH_TTY_FILE type = NH_TTY_FILE_TEXT;
+    nh_encoding_UTF8String Path = nh_encoding_encodeUTF8(Path_p->p, Path_p->length);
+
+    if (strstr(Path.p, "netzhaut/CHANGES")) {
+        type = NH_TTY_FILE_CHANGES;
+    }
+
+    nh_encoding_freeUTF8String(&Path);
+
+NH_TTY_END(type)
+}
+
 // RENDER ==========================================================================================
 
 NH_TTY_RESULT nh_tty_renderFile(
@@ -156,11 +179,15 @@ NH_TTY_BEGIN()
     switch (File_p->type)
     {
         case NH_TTY_FILE_TEXT :
-
             for (int i = 0; i < ((nh_tty_TextFile*)File_p->handle_p)->Lines.size; ++i) {
                 NH_TTY_CHECK(nh_tty_renderTextFileLine(File_p->handle_p, i))
             }
             break;
+        case NH_TTY_FILE_CHANGES :
+//            for (int i = 0; i < ((nh_tty_ChangesFile*)File_p->handle_p)->Lines.size; ++i) {
+//                NH_TTY_CHECK(nh_tty_renderChangesFileLine(File_p->handle_p, i))
+//            }
+            break;
     }
 
 NH_TTY_DIAGNOSTIC_END(NH_TTY_SUCCESS)
@@ -178,10 +205,13 @@ NH_TTY_BEGIN()
         case NH_TTY_FILE_TEXT :
             NH_TTY_CHECK(nh_tty_writeTextFile(File_p->handle_p, &File_p->Node_p->Path))
             break;
+        case NH_TTY_FILE_CHANGES :
+            NH_TTY_CHECK(nh_tty_writeChangesFile(File_p->handle_p, &File_p->Node_p->Path))
+            break;
     }
 
     NH_TTY_CHECK(nh_tty_setCustomMessage(
-        &nh_tty_getPseudoTerminal()->Tab_p->Tile_p->Status, NH_TTY_MESSAGE_EDITOR_FILE_SAVED, 
+        &nh_tty_getTTY()->Tab_p->Tile_p->Status, NH_TTY_MESSAGE_EDITOR_FILE_SAVED, 
         File_p->Node_p->Path.p, File_p->Node_p->Path.length
     ))
 
@@ -231,7 +261,7 @@ NH_TTY_BEGIN()
     if (File_p->readOnly) {
         *refresh_p = NH_TRUE;
         NH_TTY_CHECK(nh_tty_setDefaultMessage(
-            &nh_tty_getPseudoTerminal()->Tab_p->Tile_p->Status, NH_TTY_MESSAGE_EDITOR_READ_ONLY
+            &nh_tty_getTTY()->Tab_p->Tile_p->Status, NH_TTY_MESSAGE_EDITOR_READ_ONLY
         ))
     }
 
@@ -242,6 +272,9 @@ NH_TTY_BEGIN()
         case NH_TTY_FILE_TEXT :
             NH_TTY_CHECK(nh_tty_handleTextFileInput(&FileViews, File_p, c, insertMode, refresh_p))
             break;    
+        case NH_TTY_FILE_CHANGES :
+            NH_TTY_CHECK(nh_tty_handleChangesFileInput(&FileViews, File_p, c, insertMode, refresh_p))
+            break;    
     }
 
     nh_freeList(&FileViews, NH_FALSE);
@@ -261,6 +294,9 @@ NH_TTY_BEGIN()
         case NH_TTY_FILE_TEXT :
             nh_tty_drawTextFileLine(File_p->handle_p, View_p, String_p, row);
             break;
+        case NH_TTY_FILE_CHANGES :
+            nh_tty_drawChangesFileLine(File_p->handle_p, View_p, String_p, row);
+            break;
     }
 
 NH_TTY_DIAGNOSTIC_END(NH_TTY_SUCCESS)
diff --git a/src/lib/nhtty/Editor/File.h b/src/lib/nhtty/Editor/File.h
index 8c84989..83c88ed 100644
--- a/src/lib/nhtty/Editor/File.h
+++ b/src/lib/nhtty/Editor/File.h
@@ -9,7 +9,7 @@
  * Published under MIT
  */
 
-#include "../PseudoTerminal/Program.h"
+#include "../TTY/Program.h"
 #include "../Common/Types/Private.h"
 
 typedef struct nh_tty_TreeListingNode nh_tty_TreeListingNode;
@@ -22,7 +22,9 @@ typedef struct nh_tty_EditorView nh_tty_EditorView;
  */
 
     typedef enum NH_TTY_FILE {
+        NH_TTY_FILE_UNDEFINED,
         NH_TTY_FILE_TEXT,
+        NH_TTY_FILE_CHANGES,
     } NH_TTY_FILE;
 
 /** @} */
@@ -83,6 +85,10 @@ typedef struct nh_tty_EditorView nh_tty_EditorView;
         nh_tty_Program *Program_p
     );
     
+    NH_TTY_FILE nh_tty_getFileType(
+        nh_encoding_UTF32String *Path_p
+    );
+
     NH_TTY_RESULT nh_tty_renderFile(
         nh_tty_File *File_p
     );
diff --git a/src/lib/nhtty/Editor/FileEditor.c b/src/lib/nhtty/Editor/FileEditor.c
index 9910ea6..4ff2422 100644
--- a/src/lib/nhtty/Editor/FileEditor.c
+++ b/src/lib/nhtty/Editor/FileEditor.c
@@ -12,10 +12,11 @@
 #include "TreeListing.h"
 #include "TextFile.h"
 #include "TextFileInput.h"
+#include "ChangesFile.h"
 #include "Editor.h"
 #include "SyntaxHighlights.h"
 
-#include "../PseudoTerminal/PseudoTerminal.h"
+#include "../TTY/TTY.h"
 #include "../Common/Macros/Macros.h"
 #include NH_TTY_FLOW
 #include NH_TTY_DEFAULT_CHECK
@@ -89,6 +90,7 @@ NH_TTY_BEGIN()
 NH_TTY_END(hasFile)
 }
 
+// TODO Fix possible memory leaks.
 nh_tty_File *nh_tty_openFile(
     nh_tty_Program *Program_p, nh_tty_TreeListingNode *Node_p, NH_BOOL readOnly)
 {
@@ -98,17 +100,25 @@ NH_TTY_BEGIN()
 
     nh_tty_FileEditor *FileEditor_p = &((nh_tty_Editor*)Program_p->handle_p)->FileEditor;
 
-    void *handle_p = nh_tty_openTextFile(&Node_p->Path);
-    NH_TTY_CHECK_NULL(NULL, handle_p)
-
     nh_tty_File *File_p = nh_allocate(sizeof(nh_tty_File));
     NH_TTY_CHECK_MEM(NULL, File_p)
 
-    File_p->type      = NH_TTY_FILE_TEXT;
+    File_p->type      = nh_tty_getFileType(&Node_p->Path);
     File_p->Node_p    = Node_p;
-    File_p->handle_p  = handle_p;
+    File_p->handle_p  = NULL;
     File_p->readOnly  = readOnly;
 
+    switch (File_p->type) 
+    {
+        case NH_TTY_FILE_TEXT :
+            File_p->handle_p = nh_tty_openTextFile(&Node_p->Path); 
+            break;
+        case NH_TTY_FILE_CHANGES :
+            File_p->handle_p = nh_tty_openChangesFile(&Node_p->Path); 
+            break;
+    }
+
+    NH_TTY_CHECK_NULL(NULL, File_p->handle_p)
     NH_TTY_CHECK(NULL, nh_tty_createFileViews(Program_p, File_p))
 
     nh_prependToLinkedList(&FileEditor_p->Files, File_p);
@@ -118,7 +128,7 @@ NH_TTY_BEGIN()
     NH_TTY_CHECK(NULL, nh_tty_renderFileEditor(Program_p))
 
     NH_TTY_CHECK(NULL, nh_tty_setCustomMessage(
-        &nh_tty_getPseudoTerminal()->Tab_p->Tile_p->Status, NH_TTY_MESSAGE_EDITOR_FILE_OPENED,
+        &nh_tty_getTTY()->Tab_p->Tile_p->Status, NH_TTY_MESSAGE_EDITOR_FILE_OPENED,
         Node_p->Path.p, Node_p->Path.length
     ))
 
@@ -137,7 +147,7 @@ NH_TTY_BEGIN()
     if (File_p == NULL || !nh_tty_hasFile(Editor_p, File_p)) {NH_TTY_DIAGNOSTIC_END(NH_TTY_ERROR_BAD_STATE)}
 
     NH_TTY_CHECK(nh_tty_setCustomMessage(
-        &nh_tty_getPseudoTerminal()->Tab_p->Tile_p->Status, NH_TTY_MESSAGE_EDITOR_FILE_CLOSED,
+        &nh_tty_getTTY()->Tab_p->Tile_p->Status, NH_TTY_MESSAGE_EDITOR_FILE_CLOSED,
         File_p->Node_p->Path.p, File_p->Node_p->Path.length
     ))
 
diff --git a/src/lib/nhtty/Editor/FileEditor.h b/src/lib/nhtty/Editor/FileEditor.h
index bf5b9f2..71cc0a7 100644
--- a/src/lib/nhtty/Editor/FileEditor.h
+++ b/src/lib/nhtty/Editor/FileEditor.h
@@ -11,8 +11,8 @@
 
 #include "File.h"
 
-#include "../PseudoTerminal/Program.h"
-#include "../PseudoTerminal/Tile.h"
+#include "../TTY/Program.h"
+#include "../TTY/Tile.h"
 
 #include "../Common/Types/Private.h"
 
diff --git a/src/lib/nhtty/Editor/TextFile.c b/src/lib/nhtty/Editor/TextFile.c
index 6f09cda..737f806 100644
--- a/src/lib/nhtty/Editor/TextFile.c
+++ b/src/lib/nhtty/Editor/TextFile.c
@@ -14,7 +14,7 @@
 #include "TreeListing.h"
 #include "SyntaxHighlights.h"
 
-#include "../PseudoTerminal/PseudoTerminal.h"
+#include "../TTY/TTY.h"
 
 #include "../Common/Macros/Macros.h"
 #include NH_TTY_FLOW
@@ -379,7 +379,7 @@ NH_TTY_BEGIN()
         }
 
         if (Line_p->Codepoints.p[i] == 9) {
-            nh_tty_Editor *Editor_p = nh_tty_getCurrentProgram(&nh_tty_getPseudoTerminal()->Tab_p->Tile_p->Console)->handle_p;
+            nh_tty_Editor *Editor_p = nh_tty_getCurrentProgram(&nh_tty_getTTY()->Tab_p->Tile_p->Console)->handle_p;
             for (int j = 0; j < Editor_p->FileEditor.tabSpaces; ++j) {
                 nh_encoding_appendUTF32Codepoint(&Line_p->RenderCodepoints, 32);
             }
@@ -403,7 +403,7 @@ static NH_BOOL nh_tty_offsetTextFile(
 {
 NH_TTY_BEGIN()
 
-    nh_tty_Program *Program_p = nh_tty_getCurrentProgram(&nh_tty_getPseudoTerminal()->Tab_p->Tile_p->Console);
+    nh_tty_Program *Program_p = nh_tty_getCurrentProgram(&nh_tty_getTTY()->Tab_p->Tile_p->Console);
     nh_tty_Editor *Editor_p = Program_p->handle_p;
     NH_BOOL offset = Editor_p->treeListing ||
         ((nh_tty_File*)nh_getFromLinkedList(&Editor_p->FileEditor.Files, 0))->handle_p != TextFile_p;
diff --git a/src/lib/nhtty/Editor/TextFileInput.c b/src/lib/nhtty/Editor/TextFileInput.c
index b729783..605cb70 100644
--- a/src/lib/nhtty/Editor/TextFileInput.c
+++ b/src/lib/nhtty/Editor/TextFileInput.c
@@ -13,7 +13,7 @@
 #include "Editor.h"
 #include "TreeListing.h"
 
-#include "../PseudoTerminal/PseudoTerminal.h"
+#include "../TTY/TTY.h"
 
 #include "../Common/Macros/Macros.h"
 #include NH_TTY_FLOW
@@ -53,7 +53,7 @@ static NH_TTY_RESULT nh_tty_setClipboard(
 {
 NH_TTY_BEGIN()
 
-    if (!append) {nh_tty_resetClipboard(nh_tty_getPseudoTerminal());}
+    if (!append) {nh_tty_resetClipboard(nh_tty_getTTY());}
 
     for (int i = 0; i < TextFile_p->Lines.size; ++i) 
     {
@@ -63,7 +63,7 @@ NH_TTY_BEGIN()
         for (int j = 0; j < Line_p->Copy.length; ++j) {
             if (((NH_BOOL*)Line_p->Copy.p)[j]) {
                 if (!Copy_p) {
-                    Copy_p = nh_tty_newClipboardLine(nh_tty_getPseudoTerminal());
+                    Copy_p = nh_tty_newClipboardLine(nh_tty_getTTY());
                     NH_TTY_CHECK_MEM(Copy_p)
                 }
                 nh_encoding_appendUTF32(Copy_p, &Line_p->Codepoints.p[j], 1);
@@ -86,7 +86,7 @@ static NH_TTY_RESULT nh_tty_insertClipboard(
 NH_TTY_BEGIN()
 
     nh_tty_TextFile *TextFile_p = File_p->handle_p;
-    nh_tty_Clipboard *Clipboard_p = &nh_tty_getPseudoTerminal()->Clipboard;
+    nh_tty_Clipboard *Clipboard_p = &nh_tty_getTTY()->Clipboard;
 
     if (Clipboard_p->Lines.length > 1) 
     {
@@ -369,7 +369,7 @@ NH_TTY_RESULT nh_tty_handleWriteOperation(
 {
 NH_TTY_BEGIN()
 
-    nh_tty_Editor *Editor_p = nh_tty_getCurrentProgram(&nh_tty_getPseudoTerminal()->Tab_p->Tile_p->Console)->handle_p;
+    nh_tty_Editor *Editor_p = nh_tty_getCurrentProgram(&nh_tty_getTTY()->Tab_p->Tile_p->Console)->handle_p;
     nh_tty_TextFile *TextFile_p = File_p->handle_p;
     nh_tty_TextFileLine *Line_p = nh_getFromList(&TextFile_p->Lines, TextFile_p->fileCursorY);
     NH_TTY_CHECK_NULL(Line_p)
@@ -528,22 +528,19 @@ NH_TTY_BEGIN()
 
     NH_BOOL read = NH_FALSE;
     NH_TTY_CHECK(nh_tty_handleReadOperation(Views_p, File_p, c, insertMode, refresh_p, &read))
-    if (read) {NH_TTY_END(NH_TTY_SUCCESS)}
+    if (read || File_p->readOnly) {NH_TTY_END(NH_TTY_SUCCESS)}
 
-    if (!File_p->readOnly) 
-    {
-        NH_BOOL write = NH_FALSE;
-        NH_TTY_CHECK(nh_tty_handleWriteOperation(Views_p, File_p, c, insertMode, refresh_p, &write))
-        if (write) {NH_TTY_END(NH_TTY_SUCCESS)}
-
-        if (insertMode) {
-            nh_tty_TextFile *TextFile_p = File_p->handle_p;
-            nh_tty_TextFileLine *Line_p = nh_getFromList(&TextFile_p->Lines, TextFile_p->fileCursorY);
-            NH_TTY_CHECK(nh_tty_insertIntoTextFileLine(Line_p, TextFile_p->fileCursorX, c))
-            NH_TTY_CHECK(nh_tty_handleTextFileInput(Views_p, File_p, 'l', NH_FALSE, refresh_p))
-            NH_TTY_CHECK(nh_tty_renderTextFileLine(TextFile_p, TextFile_p->fileCursorY))
-            *refresh_p = NH_TRUE;
-        }
+    NH_BOOL write = NH_FALSE;
+    NH_TTY_CHECK(nh_tty_handleWriteOperation(Views_p, File_p, c, insertMode, refresh_p, &write))
+    if (write) {NH_TTY_END(NH_TTY_SUCCESS)}
+
+    if (insertMode) {
+        nh_tty_TextFile *TextFile_p = File_p->handle_p;
+        nh_tty_TextFileLine *Line_p = nh_getFromList(&TextFile_p->Lines, TextFile_p->fileCursorY);
+        NH_TTY_CHECK(nh_tty_insertIntoTextFileLine(Line_p, TextFile_p->fileCursorX, c))
+        NH_TTY_CHECK(nh_tty_handleTextFileInput(Views_p, File_p, 'l', NH_FALSE, refresh_p))
+        NH_TTY_CHECK(nh_tty_renderTextFileLine(TextFile_p, TextFile_p->fileCursorY))
+        *refresh_p = NH_TRUE;
     }
  
 NH_TTY_END(NH_TTY_SUCCESS)
diff --git a/src/lib/nhtty/Editor/TreeListing.c b/src/lib/nhtty/Editor/TreeListing.c
index 25c909f..44d6a04 100644
--- a/src/lib/nhtty/Editor/TreeListing.c
+++ b/src/lib/nhtty/Editor/TreeListing.c
@@ -11,7 +11,7 @@
 #include "TreeListing.h"
 #include "Editor.h"
 
-#include "../PseudoTerminal/PseudoTerminal.h"
+#include "../TTY/TTY.h"
 
 #include "../Common/Macros/Macros.h"
 #include NH_TTY_FLOW
@@ -181,7 +181,7 @@ NH_TTY_BEGIN()
 
     if (Node_p->Children.size == 0) {
         NH_TTY_CHECK(nh_tty_setCustomMessage(
-            &nh_tty_getPseudoTerminal()->Tab_p->Tile_p->Status, NH_TTY_MESSAGE_EDITOR_EMPTY_DIRECTORY, 
+            &nh_tty_getTTY()->Tab_p->Tile_p->Status, NH_TTY_MESSAGE_EDITOR_EMPTY_DIRECTORY, 
             Node_p->Path.p, Node_p->Path.length
         ))
     }
@@ -242,7 +242,7 @@ NH_TTY_BEGIN()
     }
     else {
         NH_TTY_CHECK(NULL, nh_tty_setDefaultMessage(
-            &nh_tty_getPseudoTerminal()->Tab_p->Tile_p->Status, NH_TTY_MESSAGE_EDITOR_FILE_ALREADY_EXISTS
+            &nh_tty_getTTY()->Tab_p->Tile_p->Status, NH_TTY_MESSAGE_EDITOR_FILE_ALREADY_EXISTS
         ))
         nh_encoding_freeUTF32(&Path);
     }
@@ -293,7 +293,7 @@ NH_TTY_BEGIN()
             ))
         }
         if (c == 'y') {
-//            nh_tty_Program *Program_p = nh_tty_getCurrentProgram(&nh_tty_getPseudoTerminal()->Tab_p->Tile_p->Console);
+//            nh_tty_Program *Program_p = nh_tty_getCurrentProgram(&nh_tty_getTTY()->Tab_p->Tile_p->Console);
 //            nh_tty_removeFile(Status_p, Program_p->handle_p);
 //            NH_TTY_CHECK(nh_tty_handleTreeListingInput(
 //                Program_p, ((nh_tty_Editor*)Program_p->handle_p)->height, 'w'
@@ -319,7 +319,7 @@ NH_TTY_BEGIN()
     }
 
     NH_TTY_CHECK(nh_tty_setCustomMessage(
-        &nh_tty_getPseudoTerminal()->Tab_p->Tile_p->Status, NH_TTY_MESSAGE_EDITOR_NEW_ROOT, 
+        &nh_tty_getTTY()->Tab_p->Tile_p->Status, NH_TTY_MESSAGE_EDITOR_NEW_ROOT, 
         Listing_p->Root_p->Path.p, Listing_p->Root_p->Path.length
     ))
 
@@ -366,7 +366,7 @@ NH_TTY_BEGIN()
     }
 
     NH_TTY_CHECK(nh_tty_setCustomMessage(
-        &nh_tty_getPseudoTerminal()->Tab_p->Tile_p->Status, NH_TTY_MESSAGE_EDITOR_NEW_ROOT, 
+        &nh_tty_getTTY()->Tab_p->Tile_p->Status, NH_TTY_MESSAGE_EDITOR_NEW_ROOT, 
         Listing_p->Root_p->Path.p, Listing_p->Root_p->Path.length
     ))
 
diff --git a/src/lib/nhtty/Editor/TreeListing.h b/src/lib/nhtty/Editor/TreeListing.h
index d5c247e..6f89822 100644
--- a/src/lib/nhtty/Editor/TreeListing.h
+++ b/src/lib/nhtty/Editor/TreeListing.h
@@ -13,8 +13,8 @@
 
 #include "../Common/Types/Private.h"
 
-#include "../PseudoTerminal/Program.h"
-#include "../PseudoTerminal/Tile.h"
+#include "../TTY/Program.h"
+#include "../TTY/Tile.h"
 
 #include "../../nhcore/Util/Time.h"
 #include "../../nhcore/Util/List.h"
diff --git a/src/lib/nhtty/Logger/Logger.c b/src/lib/nhtty/Logger/Logger.c
index 2e1bb83..52f18c2 100644
--- a/src/lib/nhtty/Logger/Logger.c
+++ b/src/lib/nhtty/Logger/Logger.c
@@ -10,7 +10,7 @@
 
 #include "Logger.h"
 
-#include "../PseudoTerminal/Tile.h"
+#include "../TTY/Tile.h"
 #include "../Common/Macros/Macros.h"
 #include NH_TTY_FLOW
 #include NH_TTY_DEFAULT_CHECK
diff --git a/src/lib/nhtty/Logger/Logger.h b/src/lib/nhtty/Logger/Logger.h
index 6a1ed1a..e3bb3d3 100644
--- a/src/lib/nhtty/Logger/Logger.h
+++ b/src/lib/nhtty/Logger/Logger.h
@@ -10,7 +10,7 @@
  */
 
 #include "../Common/Types/Private.h"
-#include "../PseudoTerminal/Program.h"
+#include "../TTY/Program.h"
 
 #include "../../nhcore/System/Logger.h"
 #include "../../nhcore/Util/String.h"
diff --git a/src/lib/nhtty/Shell/Output.c b/src/lib/nhtty/Shell/Output.c
index e6ee062..8fd6718 100644
--- a/src/lib/nhtty/Shell/Output.c
+++ b/src/lib/nhtty/Shell/Output.c
@@ -376,7 +376,7 @@ static int nh_tty_handleEsc(
 
 // TERMINAL MODE ===================================================================================
 
-NH_BYTE *nh_tty_getPseudoTerminalModeDescription(
+NH_BYTE *nh_tty_getTTYModeDescription(
     int mode)
 {
 NH_TTY_BEGIN()
@@ -1027,7 +1027,7 @@ NH_TTY_BEGIN()
 //
 //        memmove(&STREscSeq.buf[STREscSeq.len], p, len);
 //        STREscSeq.len += len;
-////        if (nh_tty_getPseudoTerminal()->standalone) {return;}
+////        if (nh_tty_getTTY()->standalone) {return;}
     }
 
 check_control_code:
diff --git a/src/lib/nhtty/Shell/Output.h b/src/lib/nhtty/Shell/Output.h
index e47fdba..8994231 100644
--- a/src/lib/nhtty/Shell/Output.h
+++ b/src/lib/nhtty/Shell/Output.h
@@ -60,7 +60,7 @@
  *  @{
  */
 
-    NH_BYTE *nh_tty_getPseudoTerminalModeDescription(
+    NH_BYTE *nh_tty_getTTYModeDescription(
         int mode
     );
 
diff --git a/src/lib/nhtty/Shell/Shell.c b/src/lib/nhtty/Shell/Shell.c
index dad4430..94cb486 100644
--- a/src/lib/nhtty/Shell/Shell.c
+++ b/src/lib/nhtty/Shell/Shell.c
@@ -516,21 +516,32 @@ NH_TTY_DIAGNOSTIC_END(NH_TTY_SUCCESS)
 
 // DRAW ============================================================================================
 
-static int nh_tty_computeActualLength(
-    nh_encoding_UTF32String *Line_p)
+static void nh_tty_measureLineLengths(
+    nh_encoding_UTF32String *Line_p, int *renderLength_p, int *renderLengthLimit_p, int *rawLength_p)
 {
 NH_TTY_BEGIN()
 
     NH_BOOL esc = NH_FALSE;
-    int length = 0;
+    int renderLength = 0;
+    int rawLength = 0;
 
     for (int i = 0; i < Line_p->length; ++i) {
+        ++rawLength;
         if (Line_p->p[i] == '\x1b') {esc = NH_TRUE;}
-        if (!esc) {++length;}
+        if (!esc) {
+            ++renderLength;
+            if (rawLength_p && renderLengthLimit_p && renderLength == *renderLengthLimit_p) {
+                *rawLength_p = rawLength;
+            } 
+        }
         if (Line_p->p[i] == 'm') {esc = NH_FALSE;}
     }
 
-NH_TTY_END(length)
+    if (renderLength_p) {
+        *renderLength_p = renderLength;
+    }
+
+NH_TTY_SILENT_END()
 }
 
 NH_TTY_RESULT nh_tty_drawShellRow(
@@ -540,21 +551,33 @@ NH_TTY_BEGIN()
 
     nh_tty_Shell *Shell_p = Program_p->handle_p;
 
-    int offset = Shell_p->Lines.size > height ? Shell_p->Lines.size - height : 0;
-    nh_tty_ShellLine *Line_p = nh_getFromList(&Shell_p->Lines, row + offset);
+    int rowOffset = Shell_p->Lines.size > height ? Shell_p->Lines.size - height : 0;
+    nh_tty_ShellLine *Line_p = nh_getFromList(&Shell_p->Lines, row + rowOffset);
 
     if (Line_p) {
-        nh_encoding_UTF8String String = nh_encoding_encodeUTF8(Line_p->Codepoints.p, Line_p->Codepoints.length);
-        nh_appendToString(Row_p, String.p, String.length);
-        for (int i = 0; i < width - nh_tty_computeActualLength(&Line_p->Codepoints); ++i) {
-            nh_appendToString(Row_p, " ", 1);
+        int renderLength = 0;
+        nh_tty_measureLineLengths(&Line_p->Codepoints, &renderLength, NULL, NULL);
+        if (renderLength > width) {
+            int rawLength = 0;
+            nh_tty_measureLineLengths(&Line_p->Codepoints, NULL, &width, &rawLength);
+            nh_encoding_UTF8String ReducedString = nh_encoding_encodeUTF8(Line_p->Codepoints.p, rawLength);
+            nh_appendToString(Row_p, ReducedString.p, ReducedString.length);
+            nh_freeString(&ReducedString);
         }
-        nh_freeString(&String);
-    }
-    else {
-        for (int i = 0; i < width; ++i) {
+        else {
+            nh_encoding_UTF8String String = nh_encoding_encodeUTF8(Line_p->Codepoints.p, Line_p->Codepoints.length);
+            nh_appendToString(Row_p, String.p, String.length);
+            nh_freeString(&String);
+        }
+        for (int i = 0; i < width - renderLength; ++i) {
             nh_appendToString(Row_p, " ", 1);
         }
+        nh_appendToString(Row_p, "\x1b[0m", 4);
+        NH_TTY_DIAGNOSTIC_END(NH_TTY_SUCCESS)
+    }
+
+    for (int i = 0; i < width; ++i) {
+        nh_appendToString(Row_p, " ", 1);
     }
 
 NH_TTY_DIAGNOSTIC_END(NH_TTY_SUCCESS)
@@ -575,3 +598,28 @@ NH_TTY_DIAGNOSTIC_END(NH_TTY_SUCCESS)
 //NH_TTY_END(NH_FALSE)
 //}
 //
+
+// COMMANDS ========================================================================================
+
+NH_BYTE *NH_TTY_SHELL_COMMANDS_PP[] = {
+    "TODO",
+};
+
+int NH_TTY_SHELL_COMMANDS_PP_SIZE = sizeof(NH_TTY_SHELL_COMMANDS_PP)/sizeof(NH_TTY_SHELL_COMMANDS_PP[0]);
+
+NH_TTY_RESULT nh_tty_executeShellCommand(
+    nh_tty_Program *Program_p, nh_List *Arguments_p)
+{
+NH_TTY_BEGIN()
+
+    nh_tty_Shell *Shell_p = Program_p->handle_p;
+
+    switch (Program_p->command)
+    {
+        case NH_TTY_SHELL_COMMAND_TODO:
+            break;
+    }
+
+NH_TTY_DIAGNOSTIC_END(NH_TTY_SUCCESS)
+}
+
diff --git a/src/lib/nhtty/Shell/Shell.h b/src/lib/nhtty/Shell/Shell.h
index dc77df2..d30e219 100644
--- a/src/lib/nhtty/Shell/Shell.h
+++ b/src/lib/nhtty/Shell/Shell.h
@@ -31,6 +31,19 @@
         NH_TTY_ESC_DCS        = 128,
     } NH_TTY_ESC;
 
+    typedef enum NH_TTY_SHELL_COMMAND {
+        NH_TTY_SHELL_COMMAND_TODO,
+    } NH_TTY_SHELL_COMMAND;
+
+/** @} */
+
+/** @addtogroup lib_nhtty_vars
+ *  @{
+ */
+
+    extern NH_BYTE *NH_TTY_SHELL_COMMANDS_PP[];
+    extern int NH_TTY_SHELL_COMMANDS_PP_SIZE;
+
 /** @} */
 
 /** @addtogroup lib_nhtty_structs
diff --git a/src/lib/nhtty/PseudoTerminal/Console.c b/src/lib/nhtty/TTY/Console.c
similarity index 95%
rename from src/lib/nhtty/PseudoTerminal/Console.c
rename to src/lib/nhtty/TTY/Console.c
index a754fa9..6572e1d 100644
--- a/src/lib/nhtty/PseudoTerminal/Console.c
+++ b/src/lib/nhtty/TTY/Console.c
@@ -10,7 +10,7 @@
 
 #include "Console.h"
 #include "Program.h"
-#include "PseudoTerminal.h"
+#include "TTY.h"
 
 #include "../Common/Macros/Macros.h"
 #include NH_TTY_FLOW
@@ -167,7 +167,7 @@ static NH_TTY_RESULT nh_tty_handleInternalCommand(
 NH_TTY_BEGIN()
 
     int program = nh_tty_matchPrograms(
-        &nh_tty_getPseudoTerminal()->Prototypes, &Console_p->Command
+        &nh_tty_getTTY()->Prototypes, &Console_p->Command
     );
 
     if (program >= 0) 
@@ -175,9 +175,9 @@ NH_TTY_BEGIN()
         Console_p->currentProgram = program; 
         NH_TTY_CHECK(nh_tty_resetConsole(Console_p))
 
-        nh_encoding_UTF32String *Name_p = &((nh_tty_ProgramPrototype*)nh_tty_getPseudoTerminal()->Prototypes.pp[program])->Name;
+        nh_encoding_UTF32String *Name_p = &((nh_tty_ProgramPrototype*)nh_tty_getTTY()->Prototypes.pp[program])->Name;
         NH_TTY_CHECK(nh_tty_setCustomMessage(
-            &nh_tty_getPseudoTerminal()->Tab_p->Tile_p->Status, NH_TTY_MESSAGE_MISC_SWITCH_PROGRAM, 
+            &nh_tty_getTTY()->Tab_p->Tile_p->Status, NH_TTY_MESSAGE_MISC_SWITCH_PROGRAM, 
             Name_p->p, Name_p->length
         )) 
     }
@@ -265,12 +265,12 @@ NH_TTY_BEGIN()
         {
             case NH_TTY_ERROR_UNKNOWN_COMMAND :
                 NH_TTY_CHECK(nh_tty_setDefaultMessage(
-                    &nh_tty_getPseudoTerminal()->Tab_p->Tile_p->Status, NH_TTY_MESSAGE_MISC_UNKNOWN_COMMAND
+                    &nh_tty_getTTY()->Tab_p->Tile_p->Status, NH_TTY_MESSAGE_MISC_UNKNOWN_COMMAND
                 ))
                 break;
              case NH_TTY_ERROR_INVALID_ARGUMENT :
                 NH_TTY_CHECK(nh_tty_setDefaultMessage(
-                    &nh_tty_getPseudoTerminal()->Tab_p->Tile_p->Status, NH_TTY_MESSAGE_MISC_INVALID_ARGUMENT
+                    &nh_tty_getTTY()->Tab_p->Tile_p->Status, NH_TTY_MESSAGE_MISC_INVALID_ARGUMENT
                 ))
                 break;
         }
@@ -282,7 +282,7 @@ NH_TTY_BEGIN()
     }
     else {
         NH_TTY_CHECK(nh_tty_setDefaultMessage(
-            &nh_tty_getPseudoTerminal()->Tab_p->Tile_p->Status, NH_TTY_MESSAGE_MISC_UNKNOWN_COMMAND
+            &nh_tty_getTTY()->Tab_p->Tile_p->Status, NH_TTY_MESSAGE_MISC_UNKNOWN_COMMAND
         ))
     }
 
diff --git a/src/lib/nhtty/PseudoTerminal/Console.h b/src/lib/nhtty/TTY/Console.h
similarity index 100%
rename from src/lib/nhtty/PseudoTerminal/Console.h
rename to src/lib/nhtty/TTY/Console.h
diff --git a/src/lib/nhtty/PseudoTerminal/Draw.c b/src/lib/nhtty/TTY/Draw.c
similarity index 82%
rename from src/lib/nhtty/PseudoTerminal/Draw.c
rename to src/lib/nhtty/TTY/Draw.c
index 6f3fa49..18be96a 100644
--- a/src/lib/nhtty/PseudoTerminal/Draw.c
+++ b/src/lib/nhtty/TTY/Draw.c
@@ -97,17 +97,17 @@ NH_TTY_DIAGNOSTIC_END(NH_TTY_SUCCESS)
 }
 
 NH_TTY_RESULT nh_tty_refreshCursors(
-    nh_tty_PseudoTerminal *PseudoTerminal_p) 
+    nh_tty_TTY *TTY_p) 
 {
 NH_TTY_BEGIN()
 
-    for (int i = 0; i < PseudoTerminal_p->Views.size; ++i) {
-        NH_TTY_CHECK(nh_tty_setProgramViews(PseudoTerminal_p, i))
-        NH_TTY_CHECK(nh_tty_refreshCursor(PseudoTerminal_p->Tab_p, PseudoTerminal_p->Views.pp[i]))
+    for (int i = 0; i < TTY_p->Views.size; ++i) {
+        NH_TTY_CHECK(nh_tty_setProgramViews(TTY_p, i))
+        NH_TTY_CHECK(nh_tty_refreshCursor(TTY_p->Tab_p, TTY_p->Views.pp[i]))
     }
 
-    NH_TTY_CHECK(nh_tty_resetProgramViews(PseudoTerminal_p))
-    PseudoTerminal_p->Tab_p->refreshCursor = NH_FALSE;
+    NH_TTY_CHECK(nh_tty_resetProgramViews(TTY_p))
+    TTY_p->Tab_p->refreshCursor = NH_FALSE;
 
 NH_TTY_DIAGNOSTIC_END(NH_TTY_SUCCESS)
 }
@@ -127,8 +127,7 @@ NH_TTY_BEGIN()
     nh_appendFormatToString(&Data, "\x1b[H"); // move cursor to home
     nh_appendFormatToString(&Data, "\x1b[?25l");
 
-    for (int row = 0; row < View_p->rows; ++row) {
-        int col = 0;
+    for (int row = 0, col = 0; row < View_p->rows; ++row, col = 0) {
         while (col < View_p->cols) {
             for (int tile = 0; tile < Tiles.size; ++tile)
             {
@@ -159,17 +158,17 @@ NH_TTY_END(NH_TTY_SUCCESS)
 }
 
 NH_TTY_RESULT nh_tty_refreshScreens(
-    nh_tty_PseudoTerminal *PseudoTerminal_p) 
+    nh_tty_TTY *TTY_p) 
 {
 NH_TTY_BEGIN()
 
-    for (int i = 0; i < PseudoTerminal_p->Views.size; ++i) {
-        NH_TTY_CHECK(nh_tty_setProgramViews(PseudoTerminal_p, i))
-        NH_TTY_CHECK(nh_tty_refreshScreen(PseudoTerminal_p->Tab_p, PseudoTerminal_p->Views.pp[i]))
+    for (int i = 0; i < TTY_p->Views.size; ++i) {
+        NH_TTY_CHECK(nh_tty_setProgramViews(TTY_p, i))
+        NH_TTY_CHECK(nh_tty_refreshScreen(TTY_p->Tab_p, TTY_p->Views.pp[i]))
     }
 
-    NH_TTY_CHECK(nh_tty_resetProgramViews(PseudoTerminal_p))
-    PseudoTerminal_p->Tab_p->refreshScreen = NH_FALSE;
+    NH_TTY_CHECK(nh_tty_resetProgramViews(TTY_p))
+    TTY_p->Tab_p->refreshScreen = NH_FALSE;
 
 NH_TTY_DIAGNOSTIC_END(NH_TTY_SUCCESS)
 }
diff --git a/src/lib/nhtty/PseudoTerminal/Draw.h b/src/lib/nhtty/TTY/Draw.h
similarity index 74%
rename from src/lib/nhtty/PseudoTerminal/Draw.h
rename to src/lib/nhtty/TTY/Draw.h
index 3634d4b..1bd501c 100644
--- a/src/lib/nhtty/PseudoTerminal/Draw.h
+++ b/src/lib/nhtty/TTY/Draw.h
@@ -9,7 +9,7 @@
  * Published under MIT
  */
 
-#include "PseudoTerminal.h"
+#include "TTY.h"
 
 #endif
 
@@ -18,11 +18,11 @@
  */
 
     NH_TTY_RESULT nh_tty_refreshScreens(
-        nh_tty_PseudoTerminal *PseudoTerminal_p
+        nh_tty_TTY *TTY_p
     ); 
 
     NH_TTY_RESULT nh_tty_refreshCursors(
-        nh_tty_PseudoTerminal *PseudoTerminal_p
+        nh_tty_TTY *TTY_p
     ); 
 
 /** @} */
diff --git a/src/lib/nhtty/PseudoTerminal/Messages.c b/src/lib/nhtty/TTY/Messages.c
similarity index 100%
rename from src/lib/nhtty/PseudoTerminal/Messages.c
rename to src/lib/nhtty/TTY/Messages.c
diff --git a/src/lib/nhtty/PseudoTerminal/Messages.h b/src/lib/nhtty/TTY/Messages.h
similarity index 100%
rename from src/lib/nhtty/PseudoTerminal/Messages.h
rename to src/lib/nhtty/TTY/Messages.h
diff --git a/src/lib/nhtty/PseudoTerminal/Program.c b/src/lib/nhtty/TTY/Program.c
similarity index 92%
rename from src/lib/nhtty/PseudoTerminal/Program.c
rename to src/lib/nhtty/TTY/Program.c
index 2e8dedd..6a6ec15 100644
--- a/src/lib/nhtty/PseudoTerminal/Program.c
+++ b/src/lib/nhtty/TTY/Program.c
@@ -9,7 +9,7 @@
 // INCLUDE =========================================================================================
 
 #include "Program.h"
-#include "PseudoTerminal.h"
+#include "TTY.h"
 #include "Tile.h"
 
 #include "../Editor/Editor.h"
@@ -83,7 +83,7 @@ static NH_ENCODING_UTF32 defaultNames_pp[4][6] = {
 };
 
 NH_TTY_RESULT nh_tty_addDefaultProgram(
-    nh_tty_PseudoTerminal *Terminal_p, NH_BYTE *name_p)
+    nh_tty_TTY *Terminal_p, NH_BYTE *name_p)
 {
 NH_TTY_BEGIN()
 
@@ -93,6 +93,7 @@ NH_TTY_BEGIN()
     nh_List *Prototypes_p = &Terminal_p->Prototypes;
 
     if (!strcmp(name_p, "editor")) {
+
         nh_tty_ProgramCallbacks Callbacks;
         Callbacks.init_f              = nh_tty_initEditor; 
         Callbacks.draw_f              = nh_tty_drawEditorRow; 
@@ -102,11 +103,13 @@ NH_TTY_BEGIN()
         Callbacks.handleCommand_f     = nh_tty_executeEditorCommand;
         Callbacks.createView_f        = nh_tty_createEditorView;
         Callbacks.destroyView_f       = nh_tty_destroyEditorView;
+
         NH_CHECK(NH_TTY_ERROR_BAD_STATE, nh_appendToList(Prototypes_p, nh_tty_createProgramPrototype(
             defaultNames_pp[0], 6, NH_TTY_EDITOR_COMMANDS_PP, NH_TTY_EDITOR_COMMANDS_PP_SIZE, Callbacks
         )))
     }
     else if (!strcmp(name_p, "logger")) {
+
         nh_tty_ProgramCallbacks Callbacks;
         Callbacks.init_f              = nh_tty_initLogger; 
         Callbacks.draw_f              = nh_tty_drawLoggerRow; 
@@ -116,11 +119,13 @@ NH_TTY_BEGIN()
         Callbacks.handleCommand_f     = NULL;
         Callbacks.createView_f        = nh_tty_createLoggerView;
         Callbacks.destroyView_f       = nh_tty_destroyLoggerView;
+
         NH_CHECK(NH_TTY_ERROR_BAD_STATE, nh_appendToList(Prototypes_p, nh_tty_createProgramPrototype(
             defaultNames_pp[1], 6, NULL, 0, Callbacks 
         )))
     }
     else if (!strcmp(name_p, "shell")) {
+
         nh_tty_ProgramCallbacks Callbacks;
         Callbacks.init_f              = nh_tty_initShell; 
         Callbacks.draw_f              = nh_tty_drawShellRow; 
@@ -130,13 +135,14 @@ NH_TTY_BEGIN()
         Callbacks.handleCommand_f     = NULL;
         Callbacks.createView_f     = NULL;
         Callbacks.destroyView_f    = NULL;
+
         NH_CHECK(NH_TTY_ERROR_BAD_STATE, nh_appendToList(Prototypes_p, nh_tty_createProgramPrototype(
-            defaultNames_pp[2], 5, NULL, 0, Callbacks 
+            defaultNames_pp[2], 5, NH_TTY_SHELL_COMMANDS_PP, NH_TTY_SHELL_COMMANDS_PP_SIZE, Callbacks 
         )))
     }
     else {NH_TTY_DIAGNOSTIC_END(NH_TTY_ERROR_BAD_STATE)}
 
-    nh_List Tiles = nh_tty_getTiles(((nh_tty_PseudoTerminal*)Terminal_p)->Tab_p->RootTile_p);
+    nh_List Tiles = nh_tty_getTiles(((nh_tty_TTY*)Terminal_p)->Tab_p->RootTile_p);
     for (int i = 0; i < Tiles.size; ++i) {
         nh_tty_Tile *Tile_p = Tiles.pp[i];
         NH_TTY_CHECK(NH_TTY_ERROR_BAD_STATE, nh_tty_appendProgramInstance(
@@ -172,11 +178,11 @@ NH_TTY_END(Programs_p)
 // PROGRAM CONTEXTS ================================================================================
 
 NH_TTY_RESULT nh_tty_incrementProgramViews(
-    nh_tty_PseudoTerminal *PseudoTerminal_p)
+    nh_tty_TTY *TTY_p)
 {
 NH_TTY_BEGIN()
 
-    nh_List Tiles = nh_tty_getTiles(PseudoTerminal_p->Tab_p->RootTile_p);
+    nh_List Tiles = nh_tty_getTiles(TTY_p->Tab_p->RootTile_p);
     for (int i = 0; i < Tiles.size; ++i) {
         nh_tty_Tile *Tile_p = Tiles.pp[i];
         if (!Tile_p->Console.Programs_p) {continue;}
@@ -194,11 +200,11 @@ NH_TTY_END(NH_TTY_SUCCESS)
 }
 
 NH_TTY_RESULT nh_tty_setProgramViews(
-    nh_tty_PseudoTerminal *PseudoTerminal_p, int view)
+    nh_tty_TTY *TTY_p, int view)
 {
 NH_TTY_BEGIN()
 
-    nh_List Tiles = nh_tty_getTiles(PseudoTerminal_p->Tab_p->RootTile_p);
+    nh_List Tiles = nh_tty_getTiles(TTY_p->Tab_p->RootTile_p);
     for (int i = 0; i < Tiles.size; ++i) {
         nh_tty_Tile *Tile_p = Tiles.pp[i];
         if (!Tile_p->Console.Programs_p) {continue;}
@@ -213,11 +219,11 @@ NH_TTY_END(NH_TTY_SUCCESS)
 }
 
 NH_TTY_RESULT nh_tty_resetProgramViews(
-    nh_tty_PseudoTerminal *PseudoTerminal_p)
+    nh_tty_TTY *TTY_p)
 {
 NH_TTY_BEGIN()
 
-    nh_List Tiles = nh_tty_getTiles(PseudoTerminal_p->Tab_p->RootTile_p);
+    nh_List Tiles = nh_tty_getTiles(TTY_p->Tab_p->RootTile_p);
     for (int i = 0; i < Tiles.size; ++i) {
         nh_tty_Tile *Tile_p = Tiles.pp[i];
         if (!Tile_p->Console.Programs_p) {continue;}
diff --git a/src/lib/nhtty/PseudoTerminal/Program.h b/src/lib/nhtty/TTY/Program.h
similarity index 70%
rename from src/lib/nhtty/PseudoTerminal/Program.h
rename to src/lib/nhtty/TTY/Program.h
index 6cb5394..528276c 100644
--- a/src/lib/nhtty/PseudoTerminal/Program.h
+++ b/src/lib/nhtty/TTY/Program.h
@@ -12,7 +12,7 @@
 #include "../Common/Types/Private.h"
 #include "../../nhcore/Util/List.h"
 
-typedef struct nh_tty_PseudoTerminal nh_tty_PseudoTerminal;
+typedef struct nh_tty_TTY nh_tty_TTY;
 
 #endif
 
@@ -21,7 +21,7 @@ typedef struct nh_tty_PseudoTerminal nh_tty_PseudoTerminal;
  */
 
     typedef NH_TTY_RESULT (*nh_tty_addDefaultProgram_f)(
-        nh_tty_PseudoTerminal *Terminal_p, NH_BYTE *name_p
+        nh_tty_TTY *Terminal_p, NH_BYTE *name_p
     );
 
 /** @} */
@@ -31,7 +31,7 @@ typedef struct nh_tty_PseudoTerminal nh_tty_PseudoTerminal;
  */
 
     NH_TTY_RESULT nh_tty_addDefaultProgram(
-        nh_tty_PseudoTerminal *Terminal_p, NH_BYTE *name_p
+        nh_tty_TTY *Terminal_p, NH_BYTE *name_p
     );
 
     nh_Array *nh_tty_createProgramInstances(
@@ -39,15 +39,15 @@ typedef struct nh_tty_PseudoTerminal nh_tty_PseudoTerminal;
     );
 
     NH_TTY_RESULT nh_tty_incrementProgramViews(
-        nh_tty_PseudoTerminal *PseudoTerminal_p
+        nh_tty_TTY *TTY_p
     );
 
     NH_TTY_RESULT nh_tty_setProgramViews(
-        nh_tty_PseudoTerminal *Terminal_p, int view
+        nh_tty_TTY *Terminal_p, int view
     );
     
     NH_TTY_RESULT nh_tty_resetProgramViews(
-        nh_tty_PseudoTerminal *Terminal_p
+        nh_tty_TTY *Terminal_p
     );
 
 /** @} */
diff --git a/src/lib/nhtty/PseudoTerminal/StandardIO.c b/src/lib/nhtty/TTY/StandardIO.c
similarity index 93%
rename from src/lib/nhtty/PseudoTerminal/StandardIO.c
rename to src/lib/nhtty/TTY/StandardIO.c
index f77ac26..07f4540 100644
--- a/src/lib/nhtty/PseudoTerminal/StandardIO.c
+++ b/src/lib/nhtty/TTY/StandardIO.c
@@ -215,18 +215,18 @@ NH_TTY_DIAGNOSTIC_END(NH_TTY_SUCCESS)
 static NH_BOOL claimed = NH_FALSE;
 
 NH_TTY_RESULT nh_tty_claimStandardIO(
-    nh_tty_PseudoTerminal *PseudoTerminal_p)
+    nh_tty_TTY *TTY_p)
 {
 NH_TTY_BEGIN()
 
     if (claimed) {NH_TTY_END(NH_TTY_ERROR_BAD_STATE)}
 
-    nh_tty_View *View_p = nh_tty_createView(PseudoTerminal_p, NH_TRUE);
+    nh_tty_View *View_p = nh_tty_createView(TTY_p, NH_TRUE);
     NH_TTY_CHECK_NULL(View_p)
 
     NH_TTY_RESULT error = nh_tty_enableRawMode(View_p);
     if (error) {
-        nh_tty_destroyView(PseudoTerminal_p, View_p);
+        nh_tty_destroyView(TTY_p, View_p);
         NH_TTY_END(error)
     }
 
@@ -236,15 +236,15 @@ NH_TTY_END(NH_TTY_SUCCESS)
 }
 
 NH_TTY_RESULT nh_tty_unclaimStandardIO(
-    nh_tty_PseudoTerminal *PseudoTerminal_p)
+    nh_tty_TTY *TTY_p)
 {
 NH_TTY_BEGIN()
 
     if (!claimed) {NH_TTY_END(NH_TTY_ERROR_BAD_STATE)}
 
     nh_tty_View *View_p = NULL;
-    for (int i = 0; i < PseudoTerminal_p->Views.size; ++i) {
-        View_p = PseudoTerminal_p->Views.pp[i];
+    for (int i = 0; i < TTY_p->Views.size; ++i) {
+        View_p = TTY_p->Views.pp[i];
         if (View_p->standardIO) {break;}
         View_p = NULL;
     }
@@ -252,7 +252,7 @@ NH_TTY_BEGIN()
     NH_TTY_CHECK_NULL(View_p)
 
     NH_TTY_CHECK(nh_tty_atExit(View_p))
-    nh_tty_destroyView(PseudoTerminal_p, View_p);
+    nh_tty_destroyView(TTY_p, View_p);
 
     claimed = NH_FALSE;
 
diff --git a/src/lib/nhtty/PseudoTerminal/StandardIO.h b/src/lib/nhtty/TTY/StandardIO.h
similarity index 80%
rename from src/lib/nhtty/PseudoTerminal/StandardIO.h
rename to src/lib/nhtty/TTY/StandardIO.h
index fdc7ca9..04638cd 100644
--- a/src/lib/nhtty/PseudoTerminal/StandardIO.h
+++ b/src/lib/nhtty/TTY/StandardIO.h
@@ -9,7 +9,7 @@
  * Published under MIT
  */
 
-#include "PseudoTerminal.h"
+#include "TTY.h"
 #include "View.h"
 
 #include "../Common/Types/Private.h"
@@ -21,11 +21,11 @@
  */
 
     typedef NH_TTY_RESULT (*nh_tty_claimStandardIO_f)(
-        nh_tty_PseudoTerminal *PseudoTerminal_p
+        nh_tty_TTY *TTY_p
     );
     
     typedef NH_TTY_RESULT (*nh_tty_unclaimStandardIO_f)(
-        nh_tty_PseudoTerminal *PseudoTerminal_p
+        nh_tty_TTY *TTY_p
     );
 
 /** @} */
@@ -47,11 +47,11 @@
     );
 
     NH_TTY_RESULT nh_tty_claimStandardIO(
-        nh_tty_PseudoTerminal *PseudoTerminal_p
+        nh_tty_TTY *TTY_p
     );
     
     NH_TTY_RESULT nh_tty_unclaimStandardIO(
-        nh_tty_PseudoTerminal *PseudoTerminal_p
+        nh_tty_TTY *TTY_p
     );
 
 /** @} */
diff --git a/src/lib/nhtty/PseudoTerminal/Status.c b/src/lib/nhtty/TTY/Status.c
similarity index 96%
rename from src/lib/nhtty/PseudoTerminal/Status.c
rename to src/lib/nhtty/TTY/Status.c
index 0a3a451..11d37b2 100644
--- a/src/lib/nhtty/PseudoTerminal/Status.c
+++ b/src/lib/nhtty/TTY/Status.c
@@ -10,7 +10,7 @@
 
 #include "Status.h"
 #include "Program.h"
-#include "PseudoTerminal.h"
+#include "TTY.h"
 
 #include "../Common/Macros/Macros.h"
 #include NH_TTY_FLOW
@@ -51,7 +51,7 @@ void nh_tty_clearMessages()
 {
 NH_TTY_BEGIN()
 
-    nh_List Tiles = nh_tty_getTiles(nh_tty_getPseudoTerminal()->Tab_p->RootTile_p);
+    nh_List Tiles = nh_tty_getTiles(nh_tty_getTTY()->Tab_p->RootTile_p);
 
     for (int i = 0; i < Tiles.size; ++i) {
         nh_tty_Tile *Tile_p = Tiles.pp[i];
@@ -101,7 +101,7 @@ NH_TTY_RESULT nh_tty_setBinaryQueryMessage(
 {
 NH_TTY_BEGIN()
 
-    nh_tty_PseudoTerminal *Terminal_p = nh_tty_getPseudoTerminal();
+    nh_tty_TTY *Terminal_p = nh_tty_getTTY();
     if (Terminal_p == NULL) {NH_TTY_DIAGNOSTIC_END(NH_TTY_ERROR_BAD_STATE)}
 
     nh_tty_Status *Status_p = &Terminal_p->Tab_p->Tile_p->Status;
diff --git a/src/lib/nhtty/PseudoTerminal/Status.h b/src/lib/nhtty/TTY/Status.h
similarity index 100%
rename from src/lib/nhtty/PseudoTerminal/Status.h
rename to src/lib/nhtty/TTY/Status.h
diff --git a/src/lib/nhtty/PseudoTerminal/PseudoTerminal.c b/src/lib/nhtty/TTY/TTY.c
similarity index 58%
rename from src/lib/nhtty/PseudoTerminal/PseudoTerminal.c
rename to src/lib/nhtty/TTY/TTY.c
index b195738..1037e76 100644
--- a/src/lib/nhtty/PseudoTerminal/PseudoTerminal.c
+++ b/src/lib/nhtty/TTY/TTY.c
@@ -14,7 +14,7 @@
 
 // INCLUDE =========================================================================================
 
-#include "PseudoTerminal.h"
+#include "TTY.h"
 #include "View.h"
 #include "StandardIO.h"
 #include "Draw.h"
@@ -40,29 +40,29 @@
 // CLIPBOARD =======================================================================================
 
 NH_TTY_RESULT nh_tty_resetClipboard(
-    nh_tty_PseudoTerminal *PseudoTerminal_p)
+    nh_tty_TTY *TTY_p)
 {
 NH_TTY_BEGIN()
 
-    for (int i = 0; i < PseudoTerminal_p->Clipboard.Lines.length; ++i) {
+    for (int i = 0; i < TTY_p->Clipboard.Lines.length; ++i) {
         nh_encoding_UTF32String *String_p = 
-            &((nh_encoding_UTF32String*)PseudoTerminal_p->Clipboard.Lines.p)[i];
+            &((nh_encoding_UTF32String*)TTY_p->Clipboard.Lines.p)[i];
         nh_encoding_freeUTF32(String_p);
     }
-    nh_freeArray(&PseudoTerminal_p->Clipboard.Lines);
-    PseudoTerminal_p->Clipboard.Lines = nh_initArray(sizeof(nh_encoding_UTF32String), 32);
+    nh_freeArray(&TTY_p->Clipboard.Lines);
+    TTY_p->Clipboard.Lines = nh_initArray(sizeof(nh_encoding_UTF32String), 32);
 
 NH_TTY_END(NH_TTY_SUCCESS)
 }
 
 nh_encoding_UTF32String *nh_tty_newClipboardLine(
-    nh_tty_PseudoTerminal *PseudoTerminal_p)
+    nh_tty_TTY *TTY_p)
 {
 NH_TTY_BEGIN()
 
 #include NH_TTY_CUSTOM_CHECK
 
-    nh_encoding_UTF32String *Line_p = nh_incrementArray(&PseudoTerminal_p->Clipboard.Lines);
+    nh_encoding_UTF32String *Line_p = nh_incrementArray(&TTY_p->Clipboard.Lines);
     NH_TTY_CHECK_NULL(NULL, Line_p)
     *Line_p = nh_encoding_initUTF32(32);
 
@@ -74,13 +74,13 @@ NH_TTY_END(Line_p)
 // INIT ============================================================================================
  
 static NH_TTY_RESULT nh_tty_addTab(
-    nh_tty_PseudoTerminal *PseudoTerminal_p)
+    nh_tty_TTY *TTY_p)
 {
 NH_TTY_BEGIN()
 
-    nh_tty_Tab *Tab_p = nh_tty_initTab(&PseudoTerminal_p->Prototypes, &PseudoTerminal_p->Views);
-    nh_appendToLinkedList(&PseudoTerminal_p->Tabs, Tab_p);
-    PseudoTerminal_p->Tab_p = Tab_p;
+    nh_tty_Tab *Tab_p = nh_tty_initTab(&TTY_p->Prototypes, &TTY_p->Views);
+    nh_appendToLinkedList(&TTY_p->Tabs, Tab_p);
+    TTY_p->Tab_p = Tab_p;
 
 NH_TTY_DIAGNOSTIC_END(NH_TTY_SUCCESS)
 }
@@ -99,7 +99,7 @@ NH_TTY_BEGIN()
 NH_TTY_SILENT_END()
 }
 
-void *nh_tty_initPseudoTerminal(
+void *nh_tty_initTTY(
     nh_Workload *Workload_p)
 {
 NH_TTY_BEGIN()
@@ -111,44 +111,47 @@ NH_TTY_BEGIN()
     Workload_p->path_p = path_p;
     Workload_p->name_p = name_p;
 
-    nh_tty_PseudoTerminal *PseudoTerminal_p = nh_allocate(sizeof(nh_tty_PseudoTerminal));
-    NH_TTY_CHECK_MEM(NULL, PseudoTerminal_p)
+    nh_tty_TTY *TTY_p = nh_allocate(sizeof(nh_tty_TTY));
+    NH_TTY_CHECK_MEM(NULL, TTY_p)
 
-    PseudoTerminal_p->Tab_p = NULL;
-    PseudoTerminal_p->Tabs = nh_initLinkedList();
-    PseudoTerminal_p->Views = nh_initList(8);
-    PseudoTerminal_p->Prototypes = nh_initList(8);
-    PseudoTerminal_p->Clipboard.Lines = nh_initArray(sizeof(nh_encoding_UTF32String), 32);
-    PseudoTerminal_p->close = NH_FALSE;
+    TTY_p->Tab_p = NULL;
+    TTY_p->Tabs = nh_initLinkedList();
+    TTY_p->Views = nh_initList(8);
+    TTY_p->Prototypes = nh_initList(8);
+    TTY_p->Clipboard.Lines = nh_initArray(sizeof(nh_encoding_UTF32String), 32);
+    TTY_p->close = NH_FALSE;
+
+    TTY_p->Borders.on = NH_FALSE;
+    TTY_p->Borders.transparent = NH_FALSE;
 
     NH_TTY_CHECK(NULL, nh_initRingBuffer(
-        &PseudoTerminal_p->Input, 64, sizeof(nh_wsi_Event), nh_tty_initInput
+        &TTY_p->Input, 64, sizeof(nh_wsi_Event), nh_tty_initInput
     ))
-    nh_initRingBufferMarker(&PseudoTerminal_p->InputMarker);
+    nh_initRingBufferMarker(&TTY_p->InputMarker);
 
-    NH_TTY_CHECK(NULL, nh_tty_addTab(PseudoTerminal_p))
+    NH_TTY_CHECK(NULL, nh_tty_addTab(TTY_p))
 
 #include NH_TTY_DEFAULT_CHECK
 
-NH_TTY_END(PseudoTerminal_p)
+NH_TTY_END(TTY_p)
 }
 
 // RUN =============================================================================================
 
 static NH_BOOL nh_tty_claimsStandardIO(
-    nh_tty_PseudoTerminal *PseudoTerminal_p)
+    nh_tty_TTY *TTY_p)
 {
 NH_TTY_BEGIN()
 
-    for (int i = 0; i < PseudoTerminal_p->Views.size; ++i) {
-        if (((nh_tty_View*)PseudoTerminal_p->Views.pp[i])->standardIO) {NH_TTY_END(NH_TRUE)}
+    for (int i = 0; i < TTY_p->Views.size; ++i) {
+        if (((nh_tty_View*)TTY_p->Views.pp[i])->standardIO) {NH_TTY_END(NH_TRUE)}
     }
 
 NH_TTY_END(NH_FALSE)
 }
 
 static NH_TTY_RESULT nh_tty_readInput(
-    nh_tty_PseudoTerminal *PseudoTerminal_p) 
+    nh_tty_TTY *TTY_p) 
 {
 NH_TTY_BEGIN()
 
@@ -159,7 +162,7 @@ NH_TTY_BEGIN()
         NH_TTY_CHECK(nh_tty_readStandardInput(&codepoint))
 
         if (codepoint) {
-            nh_tty_Event *Event_p = nh_advanceRingBuffer(&PseudoTerminal_p->Input);
+            nh_tty_Event *Event_p = nh_advanceRingBuffer(&TTY_p->Input);
             Event_p->codepoint = codepoint;
             Event_p->trigger = NH_WSI_TRIGGER_PRESS;
         }
@@ -170,21 +173,21 @@ NH_TTY_DIAGNOSTIC_END(NH_TTY_SUCCESS)
 }
 
 static NH_TTY_RESULT nh_tty_handleInput(
-    nh_tty_PseudoTerminal *PseudoTerminal_p) 
+    nh_tty_TTY *TTY_p) 
 {
 NH_TTY_BEGIN()
 
-    if (nh_tty_claimsStandardIO(PseudoTerminal_p)) {
-        NH_TTY_CHECK(nh_tty_readInput(PseudoTerminal_p))
+    if (nh_tty_claimsStandardIO(TTY_p)) {
+        NH_TTY_CHECK(nh_tty_readInput(TTY_p))
     }
 
     nh_tty_Event *Event_p = NULL;
 
     do {
-        Event_p = nh_incrementRingBufferMarker(&PseudoTerminal_p->Input, &PseudoTerminal_p->InputMarker);
+        Event_p = nh_incrementRingBufferMarker(&TTY_p->Input, &TTY_p->InputMarker);
         if (Event_p) {
-            PseudoTerminal_p->Tab_p->refreshCursor = NH_TRUE;
-            NH_TTY_CHECK(nh_tty_handleTabInput(PseudoTerminal_p->Tab_p, *Event_p))
+            TTY_p->Tab_p->refreshCursor = NH_TRUE;
+            NH_TTY_CHECK(nh_tty_handleTabInput(TTY_p->Tab_p, *Event_p))
         }
     } while (Event_p);
 
@@ -192,7 +195,7 @@ NH_TTY_DIAGNOSTIC_END(NH_TTY_SUCCESS)
 }
 
 static NH_TTY_RESULT nh_tty_handleWindowResize(
-    nh_tty_PseudoTerminal *PseudoTerminal_p, nh_tty_View *View_p) 
+    nh_tty_TTY *TTY_p, nh_tty_View *View_p) 
 {
 NH_TTY_BEGIN()
 
@@ -200,7 +203,7 @@ NH_TTY_BEGIN()
 
     if (View_p->cols != View_p->previousCols || View_p->rows != View_p->previousRows) 
     {
-        PseudoTerminal_p->Tab_p->refreshScreen = NH_TRUE;
+        TTY_p->Tab_p->refreshScreen = NH_TRUE;
         View_p->previousCols = View_p->cols;
         View_p->previousRows = View_p->rows;
     }
@@ -208,7 +211,7 @@ NH_TTY_BEGIN()
 NH_TTY_DIAGNOSTIC_END(NH_TTY_SUCCESS)
 }
 
-static NH_SIGNAL nh_tty_runPseudoTerminal(
+static NH_SIGNAL nh_tty_runTTY(
     void *args_p) 
 {
 NH_TTY_BEGIN()
@@ -218,28 +221,28 @@ NH_TTY_BEGIN()
     NH_BOOL idle = NH_TRUE;
 
     NH_TTY_CHECK_NULL(NH_SIGNAL_ERROR, args_p)
-    nh_tty_PseudoTerminal *PseudoTerminal_p = args_p;
+    nh_tty_TTY *TTY_p = args_p;
 
-    for (int i = 0; i < PseudoTerminal_p->Views.size; ++i)
+    for (int i = 0; i < TTY_p->Views.size; ++i)
     {
-        nh_tty_View *View_p = PseudoTerminal_p->Views.pp[i];
+        nh_tty_View *View_p = TTY_p->Views.pp[i];
 
-        NH_TTY_CHECK(NH_SIGNAL_ERROR, nh_tty_handleWindowResize(PseudoTerminal_p, View_p))
-        NH_TTY_CHECK(NH_SIGNAL_ERROR, nh_tty_handleInput(PseudoTerminal_p))
+        NH_TTY_CHECK(NH_SIGNAL_ERROR, nh_tty_handleWindowResize(TTY_p, View_p))
+        NH_TTY_CHECK(NH_SIGNAL_ERROR, nh_tty_handleInput(TTY_p))
     }
     
-    NH_TTY_CHECK(NH_SIGNAL_ERROR, nh_tty_updateTab(PseudoTerminal_p->Tab_p))
+    NH_TTY_CHECK(NH_SIGNAL_ERROR, nh_tty_updateTab(TTY_p->Tab_p))
 
-    if (PseudoTerminal_p->Tab_p->refreshScreen) {
+    if (TTY_p->Tab_p->refreshScreen) {
         idle = NH_FALSE; 
-        NH_TTY_CHECK(NH_SIGNAL_ERROR, nh_tty_refreshScreens(PseudoTerminal_p))
+        NH_TTY_CHECK(NH_SIGNAL_ERROR, nh_tty_refreshScreens(TTY_p))
     }
-    if (PseudoTerminal_p->Tab_p->refreshCursor) {
+    if (TTY_p->Tab_p->refreshCursor) {
         idle = NH_FALSE;
-        NH_TTY_CHECK(NH_SIGNAL_ERROR, nh_tty_refreshCursors(PseudoTerminal_p))
+        NH_TTY_CHECK(NH_SIGNAL_ERROR, nh_tty_refreshCursors(TTY_p))
     }
      
-    if (PseudoTerminal_p->Tab_p->close) {
+    if (TTY_p->Tab_p->close) {
         exit(0); // TODO
         NH_TTY_END(NH_SIGNAL_DONE)
     }
@@ -251,19 +254,19 @@ NH_TTY_END(idle ? NH_SIGNAL_IDLE : NH_SIGNAL_OK)
 
 // API =============================================================================================
 
-nh_tty_PseudoTerminal *nh_tty_openPseudoTerminal()
+nh_tty_TTY *nh_tty_openTTY()
 {
 NH_TTY_BEGIN()
 
-    nh_tty_PseudoTerminal *PseudoTerminal_p = nh_activateWorkload(
-        nh_tty_initPseudoTerminal, nh_tty_runPseudoTerminal, NULL, NH_TRUE
+    nh_tty_TTY *TTY_p = nh_activateWorkload(
+        nh_tty_initTTY, nh_tty_runTTY, NULL, NH_TRUE
     );
 
-NH_TTY_END(PseudoTerminal_p)
+NH_TTY_END(TTY_p)
 }
 
 NH_TTY_RESULT nh_tty_sendInput(
-    nh_tty_PseudoTerminal *PseudoTerminal_p, nh_wsi_Event Event)
+    nh_tty_TTY *TTY_p, nh_wsi_Event Event)
 {
 NH_TTY_BEGIN()
 
@@ -273,7 +276,7 @@ NH_TTY_BEGIN()
     {
         case NH_WSI_EVENT_KEYBOARD :
         {
-            nh_tty_Event *Event_p = nh_advanceRingBuffer(&PseudoTerminal_p->Input);
+            nh_tty_Event *Event_p = nh_advanceRingBuffer(&TTY_p->Input);
             Event_p->codepoint = ((nh_wsi_KeyboardEvent*)Event.p)->codepoint;
             Event_p->trigger = ((nh_wsi_KeyboardEvent*)Event.p)->trigger;
             Event_p->special = ((nh_wsi_KeyboardEvent*)Event.p)->special;
@@ -289,7 +292,7 @@ NH_TTY_DIAGNOSTIC_END(NH_TTY_SUCCESS)
 
 // GET =============================================================================================
 
-nh_tty_PseudoTerminal *nh_tty_getPseudoTerminal()
+nh_tty_TTY *nh_tty_getTTY()
 {
 NH_TTY_BEGIN()
 
@@ -298,12 +301,12 @@ NH_TTY_BEGIN()
     nh_Thread *Thread_p = nh_getThread();
     NH_TTY_CHECK_NULL(NULL, Thread_p)
 
-    nh_tty_PseudoTerminal *PseudoTerminal_p = Thread_p->CurrentWorkload_p->args_p;
-    NH_TTY_CHECK_NULL(NULL, PseudoTerminal_p)
+    nh_tty_TTY *TTY_p = Thread_p->CurrentWorkload_p->args_p;
+    NH_TTY_CHECK_NULL(NULL, TTY_p)
 
 #include NH_TTY_DEFAULT_CHECK
 
-NH_TTY_END(PseudoTerminal_p)
+NH_TTY_END(TTY_p)
 }
 
 
diff --git a/src/lib/nhtty/PseudoTerminal/PseudoTerminal.h b/src/lib/nhtty/TTY/TTY.h
similarity index 69%
rename from src/lib/nhtty/PseudoTerminal/PseudoTerminal.h
rename to src/lib/nhtty/TTY/TTY.h
index ad28c25..573c687 100644
--- a/src/lib/nhtty/PseudoTerminal/PseudoTerminal.h
+++ b/src/lib/nhtty/TTY/TTY.h
@@ -24,8 +24,14 @@
         nh_Array Lines;
     } nh_tty_Clipboard;
 
-    typedef struct nh_tty_PseudoTerminal {
+    typedef struct nh_tty_Borders {
+        NH_BOOL on;
+        NH_BOOL transparent;
+    } nh_tty_Borders;
+
+    typedef struct nh_tty_TTY {
         nh_tty_Clipboard Clipboard;
+        nh_tty_Borders Borders;
         nh_List Views;
         nh_List Prototypes;
         nh_LinkedList Tabs;
@@ -33,7 +39,7 @@
         nh_RingBuffer Input;
         nh_RingBufferMarker InputMarker;
         NH_BOOL close;
-    } nh_tty_PseudoTerminal;
+    } nh_tty_TTY;
 
 /** @} */
 
@@ -41,11 +47,11 @@
  *  @{
  */
 
-    typedef nh_tty_PseudoTerminal *(*nh_tty_openPseudoTerminal_f)(
+    typedef nh_tty_TTY *(*nh_tty_openTTY_f)(
     ); 
 
     typedef NH_TTY_RESULT (*nh_tty_sendInput_f)(
-        nh_tty_PseudoTerminal *PseudoTerminal_p, nh_wsi_Event Event
+        nh_tty_TTY *TTY_p, nh_wsi_Event Event
     );
 
 /** @} */
@@ -55,21 +61,21 @@
  */
 
     NH_TTY_RESULT nh_tty_resetClipboard(
-        nh_tty_PseudoTerminal *Terminal_p
+        nh_tty_TTY *Terminal_p
     );
 
     nh_encoding_UTF32String *nh_tty_newClipboardLine(
-        nh_tty_PseudoTerminal *Terminal_p
+        nh_tty_TTY *Terminal_p
     );
 
-    nh_tty_PseudoTerminal *nh_tty_openPseudoTerminal(
+    nh_tty_TTY *nh_tty_openTTY(
     );
 
-    nh_tty_PseudoTerminal *nh_tty_getPseudoTerminal(
+    nh_tty_TTY *nh_tty_getTTY(
     );
 
     NH_TTY_RESULT nh_tty_sendInput(
-        nh_tty_PseudoTerminal *PseudoTerminal_p, nh_wsi_Event Event
+        nh_tty_TTY *TTY_p, nh_wsi_Event Event
     );
 
 /** @} */
diff --git a/src/lib/nhtty/PseudoTerminal/Tab.c b/src/lib/nhtty/TTY/Tab.c
similarity index 93%
rename from src/lib/nhtty/PseudoTerminal/Tab.c
rename to src/lib/nhtty/TTY/Tab.c
index 8cae01b..2dfa05c 100644
--- a/src/lib/nhtty/PseudoTerminal/Tab.c
+++ b/src/lib/nhtty/TTY/Tab.c
@@ -17,7 +17,7 @@
 #include "Tab.h"
 #include "Tile.h"
 #include "Program.h"
-#include "PseudoTerminal.h"
+#include "TTY.h"
 #include "Messages.h"
 
 #include "../Common/Macros/Macros.h"
@@ -50,9 +50,10 @@ NH_TTY_BEGIN()
     struct winsize w;
     ioctl(STDOUT_FILENO, TIOCGWINSZ, &w);
 
-    Tab_p->tilingState   = 0;
+    Tab_p->tilingEditorState   = 0;
     Tab_p->RootTile_p    = nh_tty_initTile(NULL, Programs_p, 0);
     Tab_p->Tile_p        = Tab_p->RootTile_p;
+    Tab_p->LastFocus_p   = Tab_p->RootTile_p;
     Tab_p->refreshScreen = NH_FALSE;
     Tab_p->refreshCursor = NH_FALSE;
     Tab_p->close         = NH_FALSE;
@@ -145,11 +146,11 @@ NH_TTY_RESULT nh_tty_handleTabInput(
 {
 NH_TTY_BEGIN()
 
-    if (Tab_p->tilingState == 0 && (Event.codepoint != NH_TTY_TILING_KEY || Event.trigger != NH_WSI_TRIGGER_PRESS)) {
+    if (Tab_p->tilingEditorState == 0 && (Event.codepoint != NH_TTY_TILING_KEY || Event.trigger != NH_WSI_TRIGGER_PRESS)) {
         NH_TTY_CHECK(nh_tty_handleTileInput(Tab_p->Tile_p, Event))
         Tab_p->refreshScreen = Tab_p->Tile_p->refresh;
     }
-    else {NH_TTY_CHECK(nh_tty_handleTilingInput(Tab_p, Event))}
+    else {NH_TTY_CHECK(nh_tty_handleTilingEditorInput(Tab_p, Event))}
 
 NH_TTY_DIAGNOSTIC_END(NH_TTY_SUCCESS)
 }
diff --git a/src/lib/nhtty/PseudoTerminal/Tab.h b/src/lib/nhtty/TTY/Tab.h
similarity index 91%
rename from src/lib/nhtty/PseudoTerminal/Tab.h
rename to src/lib/nhtty/TTY/Tab.h
index 98c76cd..c42c7d0 100644
--- a/src/lib/nhtty/PseudoTerminal/Tab.h
+++ b/src/lib/nhtty/TTY/Tab.h
@@ -22,8 +22,9 @@
         NH_BOOL refreshScreen;
         NH_BOOL refreshCursor;
         NH_BOOL close;
-        int tilingState;
+        NH_TTY_TILING_EDITOR_STATE tilingEditorState;
         nh_tty_Tile *RootTile_p;
+        nh_tty_Tile *LastFocus_p;
         nh_tty_Tile *Tile_p;
     } nh_tty_Tab;
 
diff --git a/src/lib/nhtty/PseudoTerminal/Tile.c b/src/lib/nhtty/TTY/Tile.c
similarity index 73%
rename from src/lib/nhtty/PseudoTerminal/Tile.c
rename to src/lib/nhtty/TTY/Tile.c
index f45a612..5793eca 100644
--- a/src/lib/nhtty/PseudoTerminal/Tile.c
+++ b/src/lib/nhtty/TTY/Tile.c
@@ -10,7 +10,7 @@
 
 #include "Tile.h"
 #include "Tab.h"
-#include "PseudoTerminal.h"
+#include "TTY.h"
 
 #include "../Common/Macros/Macros.h"
 #include NH_TTY_FLOW
@@ -46,6 +46,7 @@ NH_TTY_BEGIN()
     Tile_p->Parent_p = Parent_p;
     Tile_p->Prev_p   = NULL;
     Tile_p->close    = NH_FALSE;
+    Tile_p->preview  = NH_FALSE;
 
     if (Parent_p != NULL) {
         nh_insertIntoLinkedList(&Parent_p->Children, Tile_p, index);
@@ -149,23 +150,23 @@ NH_TTY_END(-1)
 // COLOR ===========================================================================================
 
 NH_BYTE *NH_TTY_TEXT_COLORS_PP[] = {
-//    "\x1b[1;34m", // BLU
+    "\x1b[1;34m", // BLU
     "\x1b[1;32m", // GRN
     "\x1b[1;33m", // YEL
     "\x1b[1;35m", // MAG
     "\x1b[1;36m", // CYN
     "\x1b[1;31m", // RED
-//    "\x1b[1;37m", // WHT
+    "\x1b[1;37m", // WHT
 };
 
 NH_BYTE *NH_TTY_INVERSE_COLORS_PP[] = {
-//    "\x1b[7;34m", // BLU
+    "\x1b[7;34m", // BLU
     "\x1b[7;32m", // GRN
     "\x1b[7;33m", // YEL
     "\x1b[7;35m", // MAG
     "\x1b[7;36m", // CYN
     "\x1b[7;31m", // RED
-//    "\x1b[7;37m", // WHT
+    "\x1b[7;37m", // WHT
 };
 
 static NH_TTY_TILE_COLOR nh_tty_computeTileColor(
@@ -180,20 +181,20 @@ NH_TTY_TILE_COLOR nh_tty_getTileColor(
 {
 NH_TTY_BEGIN()
 
-    NH_TTY_TILE_COLOR color = NH_TTY_TILE_COLOR_WHITE;
-
-    nh_tty_PseudoTerminal *Terminal_p = nh_tty_getPseudoTerminal();
-    if (Terminal_p == NULL) {NH_TTY_DIAGNOSTIC_END(NH_TTY_ERROR_BAD_STATE)}
-
-    nh_List Tiles = nh_tty_getTiles(Terminal_p->Tab_p->RootTile_p);
-
-    int i = 0;
-    for (i = 0; i < Tiles.size; ++i) {
-        if (Tiles.pp[i] == Tile_p) {break;}
-    }
-
-    color = nh_tty_computeTileColor(i);
-    nh_freeList(&Tiles, NH_FALSE);
+    NH_TTY_TILE_COLOR color = NH_TTY_TILE_COLOR_YELLOW;
+
+//    nh_tty_TTY *Terminal_p = nh_tty_getTTY();
+//    if (Terminal_p == NULL) {NH_TTY_DIAGNOSTIC_END(NH_TTY_ERROR_BAD_STATE)}
+//
+//    nh_List Tiles = nh_tty_getTiles(Terminal_p->Tab_p->RootTile_p);
+//
+//    int i = 0;
+//    for (i = 0; i < Tiles.size; ++i) {
+//        if (Tiles.pp[i] == Tile_p) {break;}
+//    }
+//
+//    color = nh_tty_computeTileColor(i);
+//    nh_freeList(&Tiles, NH_FALSE);
 
 NH_TTY_END(color)
 }
@@ -204,7 +205,7 @@ NH_TTY_TILE_COLOR nh_tty_getTileColorFromProgHandle(
 NH_TTY_BEGIN()
 
     NH_TTY_TILE_COLOR color = NH_TTY_TILE_COLOR_WHITE;
-    nh_tty_PseudoTerminal *Terminal_p = nh_tty_getPseudoTerminal();
+    nh_tty_TTY *Terminal_p = nh_tty_getTTY();
 
     nh_List Tiles = nh_tty_getTiles(Terminal_p->Tab_p->RootTile_p);
 
@@ -232,7 +233,7 @@ NH_TTY_TILE_COLOR nh_tty_getTileColorFromConsole(
 NH_TTY_BEGIN()
 
     NH_TTY_TILE_COLOR color = NH_TTY_TILE_COLOR_WHITE;
-    nh_tty_PseudoTerminal *Terminal_p = nh_tty_getPseudoTerminal();
+    nh_tty_TTY *Terminal_p = nh_tty_getTTY();
 
     nh_List Tiles = nh_tty_getTiles(Terminal_p->Tab_p->RootTile_p);
 
@@ -252,6 +253,12 @@ NH_TTY_END(color)
 
 // DRAW ============================================================================================
 
+static NH_BOOL nh_tty_drawTransparentBorders()
+{
+NH_TTY_BEGIN()
+NH_TTY_END(nh_tty_getTTY() ? nh_tty_getTTY()->Borders.transparent : NH_FALSE)
+}
+
 static NH_TTY_RESULT nh_tty_drawPreviewRow(
     nh_tty_Tile *Tile_p, nh_String *Data_p, int row, int rows, int width)
 {
@@ -260,7 +267,7 @@ NH_TTY_BEGIN()
     nh_appendToString(Data_p, NH_TTY_INVERSE_COLORS_PP[nh_tty_getTileColor(Tile_p)], 7);
     nh_appendToString(Data_p, " ", 1);
 
-    if (row >= 1 && row < rows - 1) {
+    if (row >= 0 && row < rows - 1) {
         nh_appendToString(Data_p, "\x1b[0m", 4);
     }
     for (int i = 0; i < width - 2; ++i) {nh_appendToString(Data_p, " ", 1);}
@@ -273,32 +280,97 @@ NH_TTY_BEGIN()
 NH_TTY_DIAGNOSTIC_END(NH_TTY_SUCCESS)
 }
 
-NH_TTY_RESULT nh_tty_drawTileRow(
-    nh_tty_Tile *Tile_p, nh_String *Row_p, int row)
+static NH_TTY_RESULT nh_tty_drawTileBorderVertical(
+    nh_tty_Tile *Tile_p, nh_String *Row_p)
 {
 NH_TTY_BEGIN()
 
+    if (nh_tty_drawTransparentBorders()) {
+        NH_TTY_DIAGNOSTIC_END(NH_TTY_SUCCESS)
+    }
+
+    if (Tile_p->Tiling.Message.length == 0) {
+        nh_appendToString(Row_p, NH_TTY_INVERSE_COLORS_PP[nh_tty_getTileColor(Tile_p)], 7);
+    }
     nh_appendToString(Row_p, " ", 1);
+    if (Tile_p->Tiling.Message.length == 0) {
+        nh_appendToString(Row_p, "\x1b[0m", 4);
+    }
+
+NH_TTY_DIAGNOSTIC_END(NH_TTY_SUCCESS)
+}
+
+static NH_TTY_RESULT nh_tty_drawTileBorderHorizontal(
+    nh_tty_Tile *Tile_p, nh_String *Row_p, int cols)
+{
+NH_TTY_BEGIN()
+
+    if (nh_tty_drawTransparentBorders()) {
+        NH_TTY_DIAGNOSTIC_END(NH_TTY_SUCCESS)
+    }
+
+    if (Tile_p->Tiling.Message.length == 0) {
+        nh_appendToString(Row_p, NH_TTY_INVERSE_COLORS_PP[nh_tty_getTileColor(Tile_p)], 7);
+    }
+    for (int i = 0; i < cols; ++i) {
+        NH_CHECK(NH_TTY_ERROR_BAD_STATE, nh_appendToString(Row_p, " ", 1))
+    }
+    if (Tile_p->Tiling.Message.length == 0) {
+        nh_appendToString(Row_p, "\x1b[0m", 4);
+    }
+
+NH_TTY_DIAGNOSTIC_END(NH_TTY_SUCCESS)
+}
+
+NH_TTY_RESULT nh_tty_drawTileRow(
+    nh_tty_Tile *Tile_p, nh_String *Row_p, int row)
+{
+NH_TTY_BEGIN()
 
-    int cols = Tile_p->colSize - 2;
+    int cols = Tile_p->colSize;
     int relativeRow = Tile_p->Tiling.Message.length > 0 ? (row - Tile_p->rowPosition) - 1 : row - Tile_p->rowPosition;
-    int height = Tile_p->Tiling.Message.length > 0 ? Tile_p->rowSize - 1 : Tile_p->rowSize;
+    int rows = Tile_p->Tiling.Message.length > 0 ? Tile_p->rowSize - 1 : Tile_p->rowSize;
 
-    if (Tile_p->Tiling.Message.length > 0 && relativeRow == -1) {
-        NH_TTY_CHECK(nh_tty_drawTilingMessageRow(&Tile_p->Tiling, Row_p, relativeRow, cols))
+    if (Tile_p->Tiling.Borders.left) {
+        NH_TTY_CHECK(nh_tty_drawTileBorderVertical(Tile_p, Row_p))
     }
-    else if (Tile_p->Console.hasFocus && relativeRow == height - 1) {
+
+    if (Tile_p->Tiling.Borders.left) {
+        cols--;
+    }
+    if (Tile_p->Tiling.Borders.right) {
+        cols--;
+    }
+    if (Tile_p->Tiling.Borders.top) {
+        rows--;
+        relativeRow--;
+    }
+    if (Tile_p->Tiling.Borders.bottom) {
+        rows--;
+    }
+
+    if (Tile_p->Tiling.Borders.top && relativeRow == -2 || Tile_p->Tiling.Message.length == 0 && relativeRow == -1) {
+        NH_TTY_CHECK(nh_tty_drawTileBorderHorizontal(Tile_p, Row_p, cols))
+    }
+    else if (Tile_p->Tiling.Borders.bottom && relativeRow == rows) {
+        NH_TTY_CHECK(nh_tty_drawTileBorderHorizontal(Tile_p, Row_p, cols))
+    }
+
+    else if (Tile_p->Tiling.Message.length > 0 && relativeRow == -1) {
+        NH_TTY_CHECK(nh_tty_drawTilingMessageRow(Tile_p, Row_p, relativeRow, cols))
+    }
+    else if (Tile_p->Console.hasFocus && relativeRow == rows - 1) {
         NH_TTY_CHECK(nh_tty_drawConsoleRow(&Tile_p->Console, Row_p, cols))
     }
-    else if (Tile_p->Status.Message.length > 0 && relativeRow == height - 1) {
+    else if (Tile_p->Status.Message.length > 0 && relativeRow == rows - 1) {
         NH_TTY_CHECK(nh_tty_drawStatusRow(&Tile_p->Status, Row_p, relativeRow, cols))
     }
     else if (Tile_p->Console.Programs_p == NULL) {
-        NH_TTY_CHECK(nh_tty_drawPreviewRow(Tile_p, Row_p, relativeRow, height, cols))
+        NH_TTY_CHECK(nh_tty_drawPreviewRow(Tile_p, Row_p, relativeRow, rows, cols))
     }
     else if (nh_tty_getCurrentProgram(&Tile_p->Console) != NULL) {
         NH_TTY_CHECK(nh_tty_getCurrentProgram(&Tile_p->Console)->Prototype_p->Callbacks.draw_f(
-            nh_tty_getCurrentProgram(&Tile_p->Console), Row_p, cols, height, relativeRow
+            nh_tty_getCurrentProgram(&Tile_p->Console), Row_p, cols, rows, relativeRow
         ))
     }
     else {
@@ -307,7 +379,9 @@ NH_TTY_BEGIN()
         }
     }
 
-    nh_appendToString(Row_p, " ", 1);
+    if (Tile_p->Tiling.Borders.right) {
+        NH_TTY_CHECK(nh_tty_drawTileBorderVertical(Tile_p, Row_p))
+    }
 
 NH_TTY_DIAGNOSTIC_END(NH_TTY_SUCCESS)
 }
@@ -332,6 +406,7 @@ NH_TTY_BEGIN()
 
     if (Event.codepoint == NH_TTY_QUIT_KEY && Event.trigger == NH_WSI_TRIGGER_PRESS) {
         Tile_p->close = NH_TRUE;
+        Tile_p->refresh = NH_TRUE;
     }
     else if (Event.codepoint == NH_TTY_CONSOLE_KEY && Event.trigger == NH_WSI_TRIGGER_PRESS) {
         nh_tty_toggleConsole(&Tile_p->Console);
@@ -352,7 +427,7 @@ NH_TTY_BEGIN()
     }
     else {
         NH_TTY_CHECK(nh_tty_setDefaultMessage(
-            &nh_tty_getPseudoTerminal()->Tab_p->Tile_p->Status, NH_TTY_MESSAGE_MISC_NO_CURRENT_PROGRAM
+            &nh_tty_getTTY()->Tab_p->Tile_p->Status, NH_TTY_MESSAGE_MISC_NO_CURRENT_PROGRAM
         ))
     }
 
diff --git a/src/lib/nhtty/PseudoTerminal/Tile.h b/src/lib/nhtty/TTY/Tile.h
similarity index 99%
rename from src/lib/nhtty/PseudoTerminal/Tile.h
rename to src/lib/nhtty/TTY/Tile.h
index deb6aba..8a8ba2a 100644
--- a/src/lib/nhtty/PseudoTerminal/Tile.h
+++ b/src/lib/nhtty/TTY/Tile.h
@@ -66,6 +66,7 @@
         int rowSize, colSize;
         NH_BOOL refresh;
         NH_BOOL close;
+        NH_BOOL preview;
         nh_LinkedList Children;
         struct nh_tty_Tile *Parent_p;
         struct nh_tty_Tile *Prev_p;
diff --git a/src/lib/nhtty/PseudoTerminal/Tiling.c b/src/lib/nhtty/TTY/Tiling.c
similarity index 74%
rename from src/lib/nhtty/PseudoTerminal/Tiling.c
rename to src/lib/nhtty/TTY/Tiling.c
index 2afaec1..8b88e4c 100644
--- a/src/lib/nhtty/PseudoTerminal/Tiling.c
+++ b/src/lib/nhtty/TTY/Tiling.c
@@ -10,7 +10,7 @@
 
 #include "Tiling.h"
 #include "Tab.h"
-#include "PseudoTerminal.h"
+#include "TTY.h"
 
 #include "../Common/Macros/Macros.h"
 #include NH_TTY_FLOW
@@ -31,6 +31,20 @@
 
 // INIT ============================================================================================
 
+static nh_tty_TilingBorders nh_tty_initTilingBorders()
+{
+NH_TTY_BEGIN()
+
+    nh_tty_TilingBorders Borders;
+
+    Borders.top    = NH_FALSE;
+    Borders.right  = NH_FALSE;
+    Borders.bottom = NH_FALSE;
+    Borders.left   = NH_FALSE;
+
+NH_TTY_END(Borders)
+}
+
 nh_tty_Tiling nh_tty_initTiling()
 {
 NH_TTY_BEGIN()
@@ -39,17 +53,44 @@ NH_TTY_BEGIN()
 
     Tiling.Message = nh_encoding_initUTF32(32);
     Tiling.orientation = NH_TTY_TILE_ORIENTATION_VERTICAL;
+    Tiling.Borders = nh_tty_initTilingBorders();
 
 NH_TTY_END(Tiling)
 }
 
 // UPDATE ==========================================================================================
 
-void nh_tty_computeTileSize(
+static void nh_tty_computeBorders(
+    nh_tty_Tile *Tile_p)
+{
+NH_TTY_BEGIN()
+
+    if (Tile_p->colPosition == 0) {
+        Tile_p->Tiling.Borders.left = NH_TRUE;
+        Tile_p->Tiling.Borders.right = NH_TRUE;
+    }
+    else {
+        Tile_p->Tiling.Borders.right = NH_TRUE;
+    }
+
+    if (Tile_p->rowPosition == 0) {
+        Tile_p->Tiling.Borders.top = NH_TRUE;
+        Tile_p->Tiling.Borders.bottom = NH_TRUE;
+    }
+    else {
+        Tile_p->Tiling.Borders.bottom = NH_TRUE;
+    }
+
+NH_TTY_SILENT_END()
+}
+
+NH_TTY_RESULT nh_tty_computeTileSize(
     nh_tty_Tile *Tile_p, int screenRows, int screenCols)
 {
 NH_TTY_BEGIN()
 
+    Tile_p->Tiling.Borders = nh_tty_initTilingBorders();
+
     if (Tile_p->Parent_p == NULL) {
         Tile_p->rowPosition = 0;
         Tile_p->colPosition = 0;
@@ -63,6 +104,13 @@ NH_TTY_BEGIN()
         Tile_p->colSize = Tile_p->colSize;
     }
 
+    nh_tty_TTY *Terminal_p = nh_tty_getTTY();
+    NH_TTY_CHECK_NULL(Terminal_p)
+
+    if (Terminal_p->Borders.on) {
+        nh_tty_computeBorders(Tile_p);
+    }
+
 //    if (Tile_p->Console.Programs_p != NULL) {
 //        nh_tty_resizeShell(nh_tty_getProgram(Tile_p->Console.Programs_p, NH_TTY_SHELL_NAME)->handle_p, Tile_p->rowSize, Tile_p->colSize, -1, -1);
 //    }
@@ -93,10 +141,10 @@ NH_TTY_BEGIN()
                 break;
         }
 
-        nh_tty_computeTileSize(Child_p, screenRows, screenCols);
+        NH_TTY_CHECK(nh_tty_computeTileSize(Child_p, screenRows, screenCols))
     }
 
-NH_TTY_SILENT_END()
+NH_TTY_END(NH_TTY_SUCCESS)
 }
 
 // INSERT ==========================================================================================
@@ -190,6 +238,8 @@ NH_TTY_BEGIN()
             break;
     }
 
+    Tile_p->preview = NH_TRUE;
+
 NH_TTY_END(Parent_p)
 }
 
@@ -267,17 +317,17 @@ NH_TTY_BEGIN()
 
         if (Tile_p != Tab_p->Tile_p)
         {
-              nh_encoding_UTF32String FocusOrInsert = nh_encoding_initUTF32(32);
-              NH_ENCODING_UTF32 c = '[';
-              nh_encoding_appendUTF32(&FocusOrInsert, &c, 1);
-              int start = 0;
-              c = nh_tty_getTileNumber(Tab_p->RootTile_p, Tile_p, &start) + 48;
-              nh_encoding_appendUTF32(&FocusOrInsert, &c, 1);
-              int messageLength;
-              NH_ENCODING_UTF32 *message_p = nh_tty_getMessage(Tile_p->Console.Programs_p != NULL ? NH_TTY_MESSAGE_TILING_FOCUS : NH_TTY_MESSAGE_TILING_INSERT, &messageLength);
-              nh_encoding_appendUTF32(&FocusOrInsert, message_p, messageLength);
-              NH_TTY_CHECK(nh_tty_setTilingMessage(Tile_p, FocusOrInsert.p, FocusOrInsert.length))
-              nh_encoding_freeUTF32(&FocusOrInsert);
+            nh_encoding_UTF32String FocusOrInsert = nh_encoding_initUTF32(32);
+            NH_ENCODING_UTF32 c = '[';
+            nh_encoding_appendUTF32(&FocusOrInsert, &c, 1);
+            int start = 0;
+            c = nh_tty_getTileNumber(Tab_p->RootTile_p, Tile_p, &start) + 48;
+            nh_encoding_appendUTF32(&FocusOrInsert, &c, 1);
+            int messageLength;
+            NH_ENCODING_UTF32 *message_p = nh_tty_getMessage(Tile_p->Console.Programs_p != NULL ? NH_TTY_MESSAGE_TILING_FOCUS : NH_TTY_MESSAGE_TILING_INSERT, &messageLength);
+            nh_encoding_appendUTF32(&FocusOrInsert, message_p, messageLength);
+            NH_TTY_CHECK(nh_tty_setTilingMessage(Tile_p, FocusOrInsert.p, FocusOrInsert.length))
+            nh_encoding_freeUTF32(&FocusOrInsert);
         }
         else if (Tile_p->Parent_p == NULL) {
             NH_TTY_CHECK(nh_tty_setDefaultTilingMessage(Tile_p, NH_TTY_MESSAGE_TILING_WASD))
@@ -306,12 +356,12 @@ NH_TTY_BEGIN()
 NH_TTY_END(nh_tty_getTileFromNumber(Tab_p->RootTile_p, atoi(c_p), &start))
 }
 
-static NH_TTY_RESULT nh_tty_leaveTilingMode(
+static NH_TTY_RESULT nh_tty_leaveTilingEditor(
     nh_tty_Tab *Tab_p)
 {
 NH_TTY_BEGIN()
 
-    Tab_p->tilingState = 0;
+    Tab_p->tilingEditorState = NH_TTY_TILING_EDITOR_STATE_OFF;
     Tab_p->refreshScreen = NH_TRUE;
 
     nh_List Tiles = nh_tty_getTiles(Tab_p->RootTile_p);
@@ -333,21 +383,29 @@ static NH_TTY_RESULT nh_tty_focusTile(
 {
 NH_TTY_BEGIN()
 
-    NH_TTY_CHECK(nh_tty_leaveTilingMode(Tab_p))
-
-    if (Tab_p->Tile_p != Focus_p) {
-        NH_TTY_CHECK(nh_tty_setDefaultMessage(&Focus_p->Status, NH_TTY_MESSAGE_TILING_FOCUS_SWITCHED))
-    }
-    else {
-        NH_TTY_CHECK(nh_tty_setDefaultMessage(&Focus_p->Status, NH_TTY_MESSAGE_TILING_ALREADY_FOCUSED))
-    }
+    NH_TTY_CHECK(nh_tty_setDefaultMessage(
+        &Focus_p->Status, 
+        Tab_p->Tile_p != Focus_p ? NH_TTY_MESSAGE_TILING_FOCUS_SWITCHED : NH_TTY_MESSAGE_TILING_ALREADY_FOCUSED
+    ))
 
+    Focus_p->preview = NH_FALSE;
     Tab_p->Tile_p = Focus_p;
 
 NH_TTY_DIAGNOSTIC_END(NH_TTY_SUCCESS)
 }
 
-static NH_TTY_RESULT nh_tty_handleTileInsertion(
+static NH_TTY_RESULT nh_tty_leaveTilingEditorAndFocusTile(
+    nh_tty_Tab *Tab_p, nh_tty_Tile *Focus_p)
+{
+NH_TTY_BEGIN()
+
+    NH_TTY_CHECK(nh_tty_leaveTilingEditor(Tab_p))
+    NH_TTY_CHECK(nh_tty_focusTile(Tab_p, Focus_p))
+
+NH_TTY_DIAGNOSTIC_END(NH_TTY_SUCCESS)
+}
+
+static NH_TTY_RESULT nh_tty_handlePotentialTileInsertion(
     nh_tty_Tab *Tab_p, NH_ENCODING_UTF32 c)
 {
 NH_TTY_BEGIN()
@@ -362,9 +420,9 @@ NH_TTY_BEGIN()
         Select_p = nh_tty_getTileFromCodepoint(Tab_p, c);
         if (Select_p == nh_getFromLinkedList(&Tab_p->Tile_p->Children, index)) {
             Select_p->Console.Programs_p = nh_tty_createProgramInstances(
-                &nh_tty_getPseudoTerminal()->Prototypes, &nh_tty_getPseudoTerminal()->Views
+                &nh_tty_getTTY()->Prototypes, &nh_tty_getTTY()->Views
             ); 
-            NH_TTY_DIAGNOSTIC_END(nh_tty_focusTile(Tab_p, Select_p))
+            NH_TTY_DIAGNOSTIC_END(nh_tty_leaveTilingEditorAndFocusTile(Tab_p, Select_p))
         }
     }
 
@@ -389,54 +447,64 @@ NH_TTY_BEGIN()
             }
             else {nh_removeFromLinkedList(&Tab_p->Tile_p->Children, index, NH_TRUE);}
 
-            if (Select_p != NULL) {NH_TTY_DIAGNOSTIC_END(nh_tty_focusTile(Tab_p, Select_p))}
-            else {NH_TTY_DIAGNOSTIC_END(nh_tty_leaveTilingMode(Tab_p))}
+            if (Select_p != NULL) {
+                NH_TTY_DIAGNOSTIC_END(nh_tty_leaveTilingEditorAndFocusTile(Tab_p, Select_p))
+            }
+
+            NH_TTY_DIAGNOSTIC_END(nh_tty_leaveTilingEditorAndFocusTile(Tab_p, Tab_p->LastFocus_p))
     }
 
 NH_TTY_DIAGNOSTIC_END(nh_tty_updateTilingMessages(Tab_p))
 }
 
-NH_TTY_RESULT nh_tty_handleTilingInput(
+NH_TTY_RESULT nh_tty_handleTilingEditorInput(
     nh_tty_Tab *Tab_p, nh_tty_Event Event)
 {
 NH_TTY_BEGIN()
 
     if (Event.trigger != NH_WSI_TRIGGER_PRESS) {NH_TTY_DIAGNOSTIC_END(NH_TTY_SUCCESS)}
-
     NH_ENCODING_UTF32 c = Event.codepoint;
 
-    switch (Tab_p->tilingState)
+    switch (Tab_p->tilingEditorState)
     {
-        case 0:
+        case NH_TTY_TILING_EDITOR_STATE_OFF :
+
             if (c == NH_TTY_TILING_KEY) {
-                Tab_p->tilingState = 1;
+                Tab_p->LastFocus_p = Tab_p->Tile_p;
+                Tab_p->tilingEditorState = NH_TTY_TILING_EDITOR_STATE_OVERVIEW;
                 NH_TTY_CHECK(nh_tty_updateTilingMessages(Tab_p))
                 nh_tty_clearMessages();
             }
             break;
 
-        case 1:
+        case NH_TTY_TILING_EDITOR_STATE_OVERVIEW :
+
             if (c > 47 && c < 58 && nh_tty_getTileFromCodepoint(Tab_p, c) != NULL) {
-                NH_TTY_CHECK(nh_tty_focusTile(Tab_p, nh_tty_getTileFromCodepoint(Tab_p, c)))
+                NH_TTY_DIAGNOSTIC_END(nh_tty_leaveTilingEditorAndFocusTile(
+                    Tab_p, nh_tty_getTileFromCodepoint(Tab_p, c)
+                ))
             }
             else if (c == 'f' && Tab_p->Tile_p->Parent_p != NULL) {
-                Tab_p->Tile_p        = nh_tty_splitTile(Tab_p->Tile_p, NH_TTY_INSERT_TILE_RIGHT_KEY);
-                Tab_p->tilingState   = 2;
+                Tab_p->Tile_p = nh_tty_splitTile(Tab_p->Tile_p, NH_TTY_INSERT_TILE_RIGHT_KEY);
+                Tab_p->tilingEditorState = NH_TTY_TILING_EDITOR_STATE_INSERT;
                 Tab_p->refreshScreen = NH_TRUE;
                 NH_TTY_CHECK(nh_tty_updateTilingMessages(Tab_p))
             }
             else if (c == NH_TTY_INSERT_TILE_LEFT_KEY || c == NH_TTY_INSERT_TILE_RIGHT_KEY || c == NH_TTY_INSERT_TILE_TOP_KEY || c == NH_TTY_INSERT_TILE_BOTTOM_KEY) {
-                Tab_p->Tile_p        = Tab_p->Tile_p->Parent_p == NULL ? nh_tty_splitTile(Tab_p->Tile_p, c) : nh_tty_addTile(Tab_p->Tile_p, c);
-                Tab_p->tilingState   = 2;
+                Tab_p->Tile_p = Tab_p->Tile_p->Parent_p == NULL ? nh_tty_splitTile(Tab_p->Tile_p, c) : nh_tty_addTile(Tab_p->Tile_p, c);
+                Tab_p->tilingEditorState = NH_TTY_TILING_EDITOR_STATE_INSERT;
                 Tab_p->refreshScreen = NH_TRUE;
                 NH_TTY_CHECK(nh_tty_updateTilingMessages(Tab_p))
             }
-            else {NH_TTY_CHECK(nh_tty_leaveTilingMode(Tab_p))}
+            else {
+                NH_TTY_CHECK(nh_tty_leaveTilingEditorAndFocusTile(Tab_p, Tab_p->LastFocus_p))
+            }
             break;
 
-        case 2:
+        case NH_TTY_TILING_EDITOR_STATE_INSERT :
+
             Tab_p->refreshScreen = NH_TRUE;
-            NH_TTY_CHECK(nh_tty_handleTileInsertion(Tab_p, c))
+            NH_TTY_CHECK(nh_tty_handlePotentialTileInsertion(Tab_p, c))
             break;
     }
 
@@ -446,13 +514,16 @@ NH_TTY_DIAGNOSTIC_END(NH_TTY_SUCCESS)
 // DRAW ============================================================================================
 
 NH_TTY_RESULT nh_tty_drawTilingMessageRow(
-    nh_tty_Tiling *Tiling_p, nh_String *Row_p, int row, int cols)
+    nh_tty_Tile *Tile_p, nh_String *Row_p, int row, int cols)
 {
 NH_TTY_BEGIN()
 
-    if (Tiling_p->Message.length > 0) {
-        int length = Tiling_p->Message.length > cols ? cols : Tiling_p->Message.length;
-        nh_encoding_UTF8String UTF8 = nh_encoding_encodeUTF8(Tiling_p->Message.p, length);
+    nh_appendToString(Row_p, NH_TTY_INVERSE_COLORS_PP[nh_tty_getTileColor(Tile_p)], 7);
+
+    if (Tile_p->Tiling.Message.length > 0) 
+    {
+        int length = Tile_p->Tiling.Message.length > cols ? cols : Tile_p->Tiling.Message.length;
+        nh_encoding_UTF8String UTF8 = nh_encoding_encodeUTF8(Tile_p->Tiling.Message.p, length);
         nh_appendToString(Row_p, UTF8.p, UTF8.length);
         for (int i = 0; i < cols - length; ++i) {
             nh_appendToString(Row_p, " ", 1); 
diff --git a/src/lib/nhtty/PseudoTerminal/Tiling.h b/src/lib/nhtty/TTY/Tiling.h
similarity index 65%
rename from src/lib/nhtty/PseudoTerminal/Tiling.h
rename to src/lib/nhtty/TTY/Tiling.h
index 193d618..3c3c047 100644
--- a/src/lib/nhtty/PseudoTerminal/Tiling.h
+++ b/src/lib/nhtty/TTY/Tiling.h
@@ -23,6 +23,12 @@ typedef struct nh_tty_Tab nh_tty_Tab;
  *  @{
  */
 
+    typedef enum NH_TTY_TILING_EDITOR_STATE { 
+        NH_TTY_TILING_EDITOR_STATE_OFF,
+        NH_TTY_TILING_EDITOR_STATE_OVERVIEW,
+        NH_TTY_TILING_EDITOR_STATE_INSERT,
+    } NH_TTY_TILING_EDITOR_STATE;
+
     typedef enum NH_TTY_TILE_ORIENTATION { 
         NH_TTY_TILE_ORIENTATION_VERTICAL,
         NH_TTY_TILE_ORIENTATION_HORIZONTAL,
@@ -34,7 +40,15 @@ typedef struct nh_tty_Tab nh_tty_Tab;
  *  @{
  */
 
+    typedef struct nh_tty_TilingBorders {
+        NH_BOOL top;
+        NH_BOOL right;
+        NH_BOOL bottom;
+        NH_BOOL left;
+    } nh_tty_TilingBorders;
+
     typedef struct nh_tty_Tiling {
+        nh_tty_TilingBorders Borders;
         NH_TTY_TILE_ORIENTATION orientation;
         nh_encoding_UTF32String Message;
     } nh_tty_Tiling;
@@ -48,16 +62,16 @@ typedef struct nh_tty_Tab nh_tty_Tab;
     nh_tty_Tiling nh_tty_initTiling(
     );
 
-    void nh_tty_computeTileSize(
+    NH_TTY_RESULT nh_tty_computeTileSize(
         nh_tty_Tile *Tile_p, int screenRows, int screenCols
     );
     
-    NH_TTY_RESULT nh_tty_handleTilingInput(
+    NH_TTY_RESULT nh_tty_handleTilingEditorInput(
         nh_tty_Tab *Tab_p, nh_tty_Event Event 
     );
 
     NH_TTY_RESULT nh_tty_drawTilingMessageRow(
-        nh_tty_Tiling *Tiling_p, nh_String *Row_p, int row, int cols
+        nh_tty_Tile *Tile_p, nh_String *Row_p, int row, int cols
     );
 
 /** @} */
diff --git a/src/lib/nhtty/PseudoTerminal/View.c b/src/lib/nhtty/TTY/View.c
similarity index 88%
rename from src/lib/nhtty/PseudoTerminal/View.c
rename to src/lib/nhtty/TTY/View.c
index a502acc..154d897 100644
--- a/src/lib/nhtty/PseudoTerminal/View.c
+++ b/src/lib/nhtty/TTY/View.c
@@ -15,7 +15,7 @@
 // INCLUDE =========================================================================================
 
 #include "View.h"
-#include "PseudoTerminal.h"
+#include "TTY.h"
 #include "StandardIO.h"
 #include "Program.h"
 
@@ -63,7 +63,7 @@ NH_TTY_SILENT_END()
 }
 
 nh_tty_View *nh_tty_createView(
-    nh_tty_PseudoTerminal *PseudoTerminal_p, NH_BOOL standardIO)
+    nh_tty_TTY *TTY_p, NH_BOOL standardIO)
 {
 NH_TTY_BEGIN()
 
@@ -81,13 +81,13 @@ NH_TTY_BEGIN()
         &View.Output, 64, sizeof(nh_String), nh_tty_initOutput
     ))
 
-    NH_TTY_CHECK(NULL, nh_tty_incrementProgramViews(PseudoTerminal_p))
+    NH_TTY_CHECK(NULL, nh_tty_incrementProgramViews(TTY_p))
 
     nh_tty_View *View_p = nh_allocate(sizeof(nh_tty_View));
     NH_TTY_CHECK_MEM(NULL, View_p)
 
     *View_p = View;
-    nh_appendToList(&PseudoTerminal_p->Views, View_p);
+    nh_appendToList(&TTY_p->Views, View_p);
 
 #include NH_TTY_DEFAULT_CHECK
 
@@ -95,12 +95,12 @@ NH_TTY_END(View_p)
 }
 
 NH_TTY_RESULT nh_tty_destroyView(
-    nh_tty_PseudoTerminal *PseudoTerminal_p, nh_tty_View *View_p)
+    nh_tty_TTY *TTY_p, nh_tty_View *View_p)
 {
 NH_TTY_BEGIN()
 
     nh_freeRingBuffer(&View_p->Output);
-    nh_removeFromList2(&PseudoTerminal_p->Views, NH_TRUE, View_p);
+    nh_removeFromList2(&TTY_p->Views, NH_TRUE, View_p);
 
 NH_TTY_END(NH_TTY_SUCCESS)
 }
diff --git a/src/lib/nhtty/PseudoTerminal/View.h b/src/lib/nhtty/TTY/View.h
similarity index 86%
rename from src/lib/nhtty/PseudoTerminal/View.h
rename to src/lib/nhtty/TTY/View.h
index c091596..ecbd485 100644
--- a/src/lib/nhtty/PseudoTerminal/View.h
+++ b/src/lib/nhtty/TTY/View.h
@@ -42,11 +42,11 @@
     ); 
     
     nh_tty_View *nh_tty_createView(
-        nh_tty_PseudoTerminal *PseudoTerminal_p, NH_BOOL standardIO
+        nh_tty_TTY *TTY_p, NH_BOOL standardIO
     );
     
     NH_TTY_RESULT nh_tty_destroyView(
-        nh_tty_PseudoTerminal *PseudoTerminal_p, nh_tty_View *View_p
+        nh_tty_TTY *TTY_p, nh_tty_View *View_p
     );
 
     NH_TTY_RESULT nh_tty_writeToView(
diff --git a/src/lib/nhurl/Common/About.h b/src/lib/nhurl/Common/About.h
index 389c7e9..0d7813b 100644
--- a/src/lib/nhurl/Common/About.h
+++ b/src/lib/nhurl/Common/About.h
@@ -16,7 +16,7 @@
  *  @brief The nhurl library implements the WHATWG URL standard.
  */
 
-/** @defgroup lib_nhurl_changelog Changelog
+/** @defgroup lib_nhurl_version Version
  *  @ingroup lib_nhurl
  */
 /** @defgroup lib_nhurl_macros Macros 
@@ -38,52 +38,33 @@
  *  @ingroup lib_nhurl
  */
 
-/** @addtogroup lib_nhurl_changelog 
+/** @addtogroup lib_nhurl_version
  *  @{
  */
 
     /**
      * The API version is used for backwards-incompatible API changes. 
-     *
-     * 2021-07-22 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_URL_API_VERSION 0
 
     /**
      * The major version is used for the completion of big functionalities. 
-     *
-     * 2021-07-22 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_URL_MAJOR_VERSION 0
 
     /**
      * The minor version is used for the addition of small functionalities or consequential changes. 
-     *
-     * 2021-08-12 | v0.0.1.0 <a id="v0.0.1.0"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Improve testing.
-     * - [Dajo Frey](https://github.com/dajofrey): Improve parsing.
-     *
-     * 2021-07-22 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_URL_MINOR_VERSION 1
 
     /**
      * The patch version is used for bugfixes or non-consequential changes. 
-     *
-     * 2021-07-22 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_URL_PATCH_VERSION 0
 
-/** @} */
-
-/** @addtogroup lib_nhurl_vars
- *  @{
- */
-
+    /**
+     * Version array.
+     */
     extern int NH_URL_VERSION_P[4];
 
 /** @} */
diff --git a/src/lib/nhurl/Common/Test.c b/src/lib/nhurl/Common/Test.c
index e1fa4e0..097473c 100644
--- a/src/lib/nhurl/Common/Test.c
+++ b/src/lib/nhurl/Common/Test.c
@@ -27,7 +27,7 @@
 // TEST =============================================================================================
 
 static void nh_url_printHost(
-    nh_url_Host *Host_p, SM_BYTE *output_p)
+    nh_url_Host *Host_p, NH_BYTE *output_p)
 {
     sprintf(output_p+strlen(output_p), "HOST("); 
 
@@ -56,7 +56,7 @@ static void nh_url_printHost(
 }
 
 int nh_url_testHostParser(
-    int arguments, sm_TestArgument *Arguments_p, SM_BYTE *output_p, int maxOutputLength)
+    int arguments, nh_make_TestArgument *Arguments_p, NH_BYTE *output_p, int maxOutputLength)
 {
     nh_encoding_UTF32String String = nh_encoding_decodeUTF8(Arguments_p->p, strlen(Arguments_p->p), NULL);
 
@@ -69,7 +69,7 @@ int nh_url_testHostParser(
 }
 
 int nh_url_testURLParser(
-    int arguments, sm_TestArgument *Arguments_p, SM_BYTE *output_p, int maxOutputLength)
+    int arguments, nh_make_TestArgument *Arguments_p, NH_BYTE *output_p, int maxOutputLength)
 {
     nh_encoding_UTF32String String = nh_encoding_decodeUTF8(Arguments_p->p, strlen(Arguments_p->p), NULL);
 
diff --git a/src/lib/nhurl/Common/Test.h b/src/lib/nhurl/Common/Test.h
index 9464a68..8b24782 100644
--- a/src/lib/nhurl/Common/Test.h
+++ b/src/lib/nhurl/Common/Test.h
@@ -12,8 +12,6 @@
 #include "Types/Private.h"
 #include "Result.h"
 
-#include "../../../../external/selfmake/include/selfmake/selfmake.h"
-
 #endif
 
 /** @addtogroup lib_nhurl_functions
@@ -21,11 +19,11 @@
  */
 
     int nh_url_testHostParser(
-        int arguments, sm_TestArgument *Arguments_p, SM_BYTE *output_p, int maxOutputLength
+        int arguments, nh_make_TestArgument *Arguments_p, NH_BYTE *output_p, int maxOutputLength
     );
 
     int nh_url_testURLParser(
-        int arguments, sm_TestArgument *Arguments_p, SM_BYTE *output_p, int maxOutputLength
+        int arguments, nh_make_TestArgument *Arguments_p, NH_BYTE *output_p, int maxOutputLength
     );
 
 /** @} */
diff --git a/src/lib/nhurl/Common/Types/Private.h b/src/lib/nhurl/Common/Types/Private.h
index 8fa8a15..6ab69fe 100644
--- a/src/lib/nhurl/Common/Types/Private.h
+++ b/src/lib/nhurl/Common/Types/Private.h
@@ -10,6 +10,7 @@
  */
 
 #include "Public.h"
+#include "../../../nhmake/Common/Types/Public.h"
 
 #endif
 
diff --git a/src/lib/nhwebidl/Common/About.h b/src/lib/nhwebidl/Common/About.h
index c6f139c..aff6653 100644
--- a/src/lib/nhwebidl/Common/About.h
+++ b/src/lib/nhwebidl/Common/About.h
@@ -16,7 +16,7 @@
  *  @brief The nhwebidl library implements the ECMA-262 engine.
  */
 
-/** @defgroup lib_nhwebidl_changelog Changelog
+/** @defgroup lib_nhwebidl_version Version
  *  @ingroup lib_nhwebidl
  */
 /** @defgroup lib_nhwebidl_macros Macros 
@@ -38,58 +38,33 @@
  *  @ingroup lib_nhwebidl
  */
 
-/** @addtogroup lib_nhwebidl_changelog 
+/** @addtogroup lib_nhwebidl_version
  *  @{
  */
 
     /**
      * The API version is used for backwards-incompatible API changes. 
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_WEBIDL_API_VERSION 0
 
     /**
      * The major version is used for the completion of big functionalities. 
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_WEBIDL_MAJOR_VERSION 0
 
     /**
      * The minor version is used for the addition of small functionalities or consequential changes. 
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_WEBIDL_MINOR_VERSION 0
 
     /**
      * The patch version is used for bugfixes or non-consequential changes. 
-     *
-     * 2021-06-21 | v0.0.0.3 <a id="v0.0.0.3"></a> 
-     * - [Dajo Frey](https://github.com/dajofrey): Change loading function of initializer routines.
-     *
-     * 2021-05-27 | v0.0.0.2 <a id="v0.0.0.2"></a> 
-     * - [Dajo Frey](https://github.com/dajofrey): Fix Promise<> type parsing.
-     *
-     * 2021-04-25 | v0.0.0.1 <a id="v0.0.0.1"></a> 
-     * - [Dajo Frey](https://github.com/dajofrey): Move specifications to build/.idl.
-     * - [Dajo Frey](https://github.com/dajofrey): Rename generated files extension from .idl.h to .idl.inc.
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_WEBIDL_PATCH_VERSION 3
 
-/** @} */
-
-/** @addtogroup lib_nhwebidl_vars
- *  @{
- */
-
+    /**
+     * Version array.
+     */
     extern int NH_WEBIDL_VERSION_P[4];
 
 /** @} */
diff --git a/src/lib/nhwsi/Common/About.h b/src/lib/nhwsi/Common/About.h
index c8cce83..025492d 100644
--- a/src/lib/nhwsi/Common/About.h
+++ b/src/lib/nhwsi/Common/About.h
@@ -16,7 +16,7 @@
  *  @brief The nhwsi library implements window system related routines.
  */
 
-/** @defgroup lib_nhwsi_changelog Changelog
+/** @defgroup lib_nhwsi_version Version
  *  @ingroup lib_nhwsi
  */
 /** @defgroup lib_nhwsi_macros Macros 
@@ -38,56 +38,33 @@
  *  @ingroup lib_nhwsi
  */
 
-/** @addtogroup lib_nhwsi_changelog 
+/** @addtogroup lib_nhwsi_version
  *  @{
  */
 
     /**
      * The API version is used for backwards-incompatible API changes. 
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_WSI_API_VERSION 0
 
     /**
      * The major version is used for the completion of big functionalities. 
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_WSI_MAJOR_VERSION 0
 
     /**
      * The minor version is used for the addition of small functionalities or consequential changes. 
-     *
-     * 2021-06-14 | v0.0.1.0 <a id="v0.0.1.0"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Rewrite event-handling structures.
-     * - [Dajo Frey](https://github.com/dajofrey): Simplify keyboard handling. 
-     * - [Dajo Frey](https://github.com/dajofrey): Add event callback. 
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_WSI_MINOR_VERSION 1
 
     /**
      * The patch version is used for bugfixes or non-consequential changes. 
-     *
-     * 2021-05-28 | v0.0.0.1 <a id="v0.0.0.1"></a>
-     * - [Dajo Frey](https://github.com/dajofrey): Reorganize files.
-     *
-     * 2021-02-23 | v0.0.0.0
-     * - [Dajo Frey](https://github.com/dajofrey): Initial version.
      */
     #define NH_WSI_PATCH_VERSION 0
 
-/** @} */
-
-/** @addtogroup lib_nhwsi_vars
- *  @{
- */
-
+    /**
+     * Version array.
+     */
     extern int NH_WSI_VERSION_P[4];
 
 /** @} */

</pre>
\endhtmlonly