\page build Build Instructions

<div style="max-width:700px;">

This document contains information on how to build netzhaut.

\section Setup
\subsection SetupLinux Linux
<pre style="white-space: pre-wrap; word-wrap: break-word;text-align: justify;">
git clone https://github.com/netzwerkz/netzhaut.git
cd netzhaut && ./build/nhmake.sh && ./build/nhmake --init
</pre>

\section Building

\subsection Dependencies 
For rendering, netzhaut requires <a href="https://www.khronos.org/vulkan/">Vulkan</a> drivers to be present at runtime.</p>
\subsubsection DepsLinux Linux
- GCC
- X11
- OpenSSL
- FreeType
- HarfBuzz

\subsection Build1 Simple Building
<pre style="white-space: pre-wrap; word-wrap: break-word;text-align: justify;">
./build/nhmake -b ALL  # build netzhaut + examples
./build/nhmake -b LIBS # build netzhaut
./build/nhmake -b BINS # build examples
</pre>

</div>

