\page Roadmap Roadmap

<div style="width:700px;">

The roadmap documents previous, current and future development stages. Early development is divided into <b>initial development</b>, <b>pre-alpha-1</b> and <b>pre-alpha-2</b>. 

\section pre-alpha-1 pre-alpha-1 

<pre>Q1 2021 - Q1 2022</pre>

This stage focuses on rendering HTML documents. This means that most work is put into CSS conforming processing, formatting and rendering. However, work on other emerging and pressing matters may require time as well.  
<br>

<div style="margin-left:50px;">
    **Improved Build-Tool**   
    The script language from the internal build-tool used by netzhaut is now a separate project at https://selfmake.netzwerkz.org. The language has improved a lot and the separation allows for development to target wider audiences.  
    <br>

    **[TODO] Advanced Layout Engine**  
    Implement CSS Display module, CSS Inline Layout module, ...
    <br>
</div>

\section initial initial development

<pre>Q2 2020 - Q1 2021</pre>

This stage focused on design, architecture and implementing a stable foundation for later development. As a result, every core component of the engine has a functioning initial implementation that is able to interconnect with related components. Also, a degree of project stability has been achieved that allows for iterative development to take place at faster pace.  
<br>

<div style="margin-left:50px;">
    **Component Design**   
    The implementation is divided into multiple libraries, managed by a loader-library which handles loading requests/dependencies at runtime. The architecture is designed to be able to handle installing/updating/reloading of libraries at runtime.  
    <br>
    
    **Object Oriented Design**  
    WebIDL interfaces are parsed at runtime in order to provide OOP-like routines and facilitate ECMAScript bindings. In the implementation, objects such as Document, HTMLElement, etc. are represented as linked structs. Each struct has an associated interface which is used to generate an attribute list. Object attributes are placed into this list according to the position in the interface allowing for easy bindings in combination with a universially applied type system. Operation bindings are essentially created by calling functions in a standardized, interface based way using function pointers. Inheritance is imitated by creating structs for each inherited interface and linking them together. All in all, this system is easy to work with since it's based on a lot of automatic mechanisms.  
    <br>
    
    **First iteration of specification conforming parsers**  
    This includes implementation of the ECMAScript parser, CSS/Selectors parser, HTML parser and WebIDL parser. The parsers are hand-written and while far from finished, a good chunk of implementation work has been completed.  
    <br>
    
    **Threading Design**  
    The threading architecture is based on workloads. Each workload is assigned to a thread and executed once every thread cycle. netzhaut can be configured to use 0 to unlimited threads. When using 0 threads, the host program needs to call the workload execution routine manually since netzhaut relies purely on the host program thread in that case.  
    <br>
    
    **Rendering**  
    Basic rendering routines have been written, establishing the foundation of the rendering engine developed during pre-alpha-1.  
    <br>
    
    **Initial API**  
    API principles have been established and core routines such as creating windows, creating viewports and creating document-contexts are operational enough to provide a good foundation.  
    <br>
    
    **Logging Interface**  
    During initial/pre-alpha development, logging is mostly done by using a build-in TTY interface which will be expanded later on but is already functional during this stage. Logging messages are stored in a tree structure which makes managing huge amounts of traffic possible by using qualified node identifiers.  
    <br>
    
    **First Installer iteration**  
    A custom installer has been written to facilitate development/building/installing in the most simplistic way possible. Later on, it could also be used to execute test routines etc.  
    <br>
    
    **Other**  
    Standard utilities for handling data using Arrays, Lists, etc. have been written. Unicode and the UTF-8 encoding are handled adequately. Work on Networking and URL libraries has started. Work on the ECMAScript engine has begun.  
    <br>
    
    **Initial Documentation**  
    Finally, basic documentation structures/methods have been designed and a road-map has been established.  
    <br>
</div>

</div>

