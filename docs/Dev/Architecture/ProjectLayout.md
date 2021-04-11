\page ProjectLayout Project Layout

<div style="width:700px;">

This document explains current directory layouts and, in some places, defines layouts and rules which must be consistently implemented. This is necessary in order to maintain a streamlined structural foundation in which development takes place.

\section RootLayout Root Layout 

<img alt="Root Layout" src="../Architecture/RootLayout.svg"/>

**bin**  
The bin directory contains executables that were created by building project source code. The only exeption to this is the NhInstaller executable, which is located in the build directory.  
<br>

**build**   
The build directory contains resources regarding the build process. This is where build scripts and the NhInstaller executable are located.   
<br>

\section SourceLayout Source Layout 

<img alt="Source Layout" src="../Architecture/SourceLayout.svg"/>

**lib**   
The engine source code is comprised of library source code inside the lib directory. The directory name of a library must be the full library name, including the 'Nh' prefix. The 'Netzhaut' library is exempt from this rule. Generally, all directories/files inside the lib directory must begin with an uppercase letter.   
<br>

**bin**  
The bin directory holds the source code of smaller projects which can be compiled as executables. This is the directory where example source code and the installer source code is located. Generally, all directories/files inside the bin directory must begin with an uppercase letter.  
<br>

\section LibraryLayout Library Layout 

<img alt="Library Layout" src="../Architecture/LibraryLayout.svg"/>

**Common**  
A library directory must contain a Common directory. Some files inside the Common directory are optional (OPT) or required (REQ).   
<br>

**About.h**  
About.h files configure doxygen and contain general documentation about libraries. They also contain the library changelog.  
<br>

**API.h**  
API.h files may include other API.h files. Generally they contain library structs/typedefs/enums that are also used by other libraries. This means that header files only need to include the corresponding API.h file, thus minimizing include clutter.  
<br>

**Initialize.h/c and Terminate.h/c**   
The loader tries to call initialize/terminate functions while loading or closing a library. These files contain the code for these functions.  

\section Binary Binary Layout 

**TODO**  

</div>
