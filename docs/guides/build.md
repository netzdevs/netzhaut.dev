\page build Build Instructions

<div style="max-width:700px;">

\section about Build Instructions 

This document contains information on how to build netzhaut.

\section Setup
Building netzhaut requires a few setup procedures to be executed beforehand. 
1. The source code must be downloaded. 
2. The <b>nhmake</b> build-tool (consisting of <b>src/bin/nhmake</b> and <b>src/lib/nhmake</b> source code) must be build. 
3. The <b>nhmake</b> build-tool must be used to initialize the project. Initializing the project means that the <b>nhmake</b> build-tool will download external resources, copy files around etc.. After initialization, netzhaut can be build using the <b>nhmake</b> build-tool.

\subsection SetupLinux Setup on Linux
<pre style="white-space: pre-wrap; word-wrap: break-word;text-align: justify;">
git clone https://github.com/netzdevs/netzhaut.git
cd netzhaut && ./build/nhmake.sh && ./build/nhmake --init
</pre>

\subsection SetupWindows Setup on Windows
<pre style="white-space: pre-wrap; word-wrap: break-word;text-align: justify;">
TODO
</pre>

\section Building
Before building, please make sure that relevant dependencies are installed. Building is done exclusively using the nhmake tool, which was build during setup. 

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
./build/nhmake -b ALL  # build library code + binary code
./build/nhmake -b LIBS # build library code 
./build/nhmake -b BINS # build binary code 
</pre>

</div>

