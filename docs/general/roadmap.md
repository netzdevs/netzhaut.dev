\page roadmap Roadmap

<div style="max-width:700px;">

\section roadmapabout Roadmap

The roadmap documents previous, current and future development-stages. Each stage sets out general directions/tasks of development. Milestones are declared as "In Progress" or "Completed". Once all milestones are declared "Completed", development moves on to a new stage.  
<br>
Generally, milestones are defined at the start of a stage. However, work on other emerging and pressing matters may require time as well and might be added to the roadmap later on.  
<br>
Early development is done using evolutionary prototyping.

<br>
\section inprogress In Progress

<pre>
Advanced CSS Layout Engine (prototype.1)
Implement inline/block layout. Implement margin-collapsing.

CSS Values (prototype.1)
Improve value filtering. Implement simple inheritance.
</pre>

<br>
\section prototype1 prototype.1 
- - -
<pre>Q1 2021 - Q4 2022</pre>

This stage focuses on rendering HTML documents. This means that most work is put into CSS conforming processing, formatting and rendering. 

\subsection prototype1build Improved Build Tool
The script language from the internal build-tool used by netzhaut is now a separate project at https://selfmake.netzwerkz.org. The language has improved a lot and the separation allows for development to target wider audiences.  

\subsection prototype1text Improved Text Processing 
The text-processing pipeline is now based on the common combination FreeType + HarfBuzz and should allow for stable font-handling across platforms (for now).  

\subsection prototype1term Improved TTY Interface
The TTY interface can now be displayed directly or externally using standard output. To facilitate this, the nhtty module was greatly overhauled and expanded. For direct display, the nhterm module was introduced. Also, internal tty-based programs such as the logger, editor etc. have been improved.

\subsection prototype1url URL Processing
The nhurl library finally provides initial routines for processing urls internally based on the WHATWG URL standard.  

<br>
\section prototype0 prototype.0
- - -
<pre>Q2 2020 - Q1 2021</pre>

This stage focused on design, architecture and implementing a stable foundation for later development. As a result, every core component of the engine has a functioning initial implementation that is able to interconnect with related components. Also, a degree of project stability has been achieved that allows for iterative development to take place at faster pace.  

\subsection initialcomponents Component Design
The implementation is divided into multiple libraries, managed by a loader-library which handles loading requests/dependencies at runtime. The architecture is designed to be able to handle installing/updating/reloading of libraries at runtime.  

\subsection initialoop Object Oriented Design
WebIDL interfaces are parsed at runtime in order to provide OOP-like routines and facilitate ECMAScript bindings. In the implementation, objects such as Document, HTMLElement, etc. are represented as linked structs. Each struct has an associated interface which is used to generate an attribute list. Object attributes are placed into this list according to the position in the interface allowing for easy bindings in combination with a universially applied type system. Operation bindings are essentially created by calling functions in a standardized, interface based way using function pointers. Inheritance is imitated by creating structs for each inherited interface and linking them together. All in all, this system is easy to work with since it's based on a lot of automatic mechanisms.  

\subsection initialparsers First Iteration Of Specification Conforming Parsers
This includes implementation of the ECMAScript parser, CSS/Selectors parser, HTML parser and WebIDL parser. The parsers are hand-written and while far from finished, a good chunk of implementation work has been completed.  

\subsection initialthreading Threading Design
The threading architecture is based on workloads. Each workload is assigned to a thread and executed once every thread cycle. netzhaut can be configured to use 0 to unlimited threads. When using 0 threads, the host program needs to call the workload execution routine manually since netzhaut relies purely on the host program thread in that case.  

\subsection initialrendering Rendering
Basic rendering routines have been written, establishing the foundation of the rendering engine developed during pre-alpha-1.  

\subsection initialapi Initial API
API principles have been established and core routines such as creating windows, creating viewports and creating document-contexts are operational enough to provide a good foundation.  

\subsection initiallogging Logging Interface
During initial/pre-alpha development, logging is mostly done by using a build-in TTY interface which will be expanded later on but is already functional during this stage. Logging messages are stored in a tree structure which makes managing huge amounts of traffic possible by using qualified node identifiers.  

\subsection initialinstaller First Installer Iteration
A custom installer has been written to facilitate development/building/installing in the most simplistic way possible. Later on, it could also be used to execute test routines etc.  

\subsection initialdocumentation Initial Documentation
Finally, basic documentation structures/methods have been designed and a road-map has been established.  

\subsection initialother Other
Standard utilities for handling data using Arrays, Lists, etc. have been written. Unicode and the UTF-8 encoding are handled adequately. Work on Networking and URL libraries has started. Work on the ECMAScript engine has begun.  

<br>

</div>

