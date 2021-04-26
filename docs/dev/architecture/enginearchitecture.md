\page enginearchitecture Engine Architecture

<div style="width:700px;">

This document explains the current state of the engine architecture. It defines components and interconnections between components.

\section Notation Notation 

<img alt="Component Types" src="../Architecture/ComponentTypes.svg"/>

**Component Types**  
In order to differentiate and group components, the above notation is used in the following sections. A component therefore is defined by its name and box-style.

\section EngineComponents Engine Components

<img alt="Engine Components" src="../Architecture/EngineComponents.svg"/>

**WebCore Group**  
The WebCore group contains the implementation of fundamental web-technologies.  
<br>

**WebDiverse Group**  
The WebDiverse group is used for smaller web-technologies.  
<br>

**Platform Group**  
The Platform group contains fundamental routines, but also platform abstractions and other libraries that aren't necessarily associated with web-technologies.  
<br>

**NhTTY Library**  
The NhTTY library implements an independent presentation layer which allows Netzhaut to be controlled using text-only surfaces.
<br>

\section EngineFlow Engine Flow

<img alt="Engine Flow" src="../Architecture/EngineFlow.svg"/>

**Flow**  
The engine flow is based on the platform group, which is used by all components. The WebCore and WebDiverse groups stand in close relation to each other. Together they implement web-technologies that a web-browser-engine is expected to support. The NhTTY library can call all other components because of its controlling capabilities.  

\section WebCoreComponents WebCore Components

<img alt="WebCore Components" src="../Architecture/EngineWebCoreComponents.svg"/>

**NhDOM Library**  
The DOM implementation is contained inside the NhDOM library. The implementation is based on the following specification: 
- [DOM](https://dom.spec.whatwg.org/)
<br>

**NhECMAScript Library**  
The ECMAScript implementation executes scripts. It is contained inside the NhECMAScript library and based on the following specification:
- [ECMA-262](https://www.ecma-international.org/ecma-262/)
<br>

**NhHTML Library**  
Containing the event-loop and forming the starting point for all web computations, the NhHTML library is an integral part of the engine. The implementation is based on the following specification:
- [HTML](https://html.spec.whatwg.org/multipage/)
<br>

**NhCSS Library**  
The NhCSS library implements CSS defined methods for presenting HTML documents. The implementation is guided by following CSS specifications:  
- [CSS Backgrounds and Borders Module Level 3](https://www.w3.org/TR/css-backgrounds-3/)
- [CSS Box Model Module Level 4](https://www.w3.org/TR/css-box-4/)
- [CSS Box Sizing Module Level 3](https://www.w3.org/TR/css-sizing-3/)
- [CSS Cascading and Inheritance Level 5](https://www.w3.org/TR/css-cascade-5/)
- [CSS Color Module 4](https://www.w3.org/TR/css-color-4/)
- [CSS Display Module Level 3](https://www.w3.org/TR/css-display-3/)
- [CSS Fragmentation Module Level 4](https://www.w3.org/TR/css-break-4/)
- [CSS Fonts Module Level 4](https://www.w3.org/TR/css-fonts-4/)
- [CSS Inline Layout Module Level 3](https://www.w3.org/TR/css-inline-3)
- [CSS Logical Properties and Values Level 1](https://www.w3.org/TR/css-logical-1)
- [CSS Object Model (CSSOM)](https://www.w3.org/TR/cssom-1/)
- [CSS Style Attributes](https://www.w3.org/TR/css-style-attr/)
- [CSS Syntax Module Level 3](https://www.w3.org/TR/css-syntax-3/)
- [CSS Values and Units Module Level 4](https://www.w3.org/TR/css-values-4/)
- [Selectors Level 4](https://www.w3.org/TR/selectors-4/)
<br>

**NhWebIDL Library**  
The NhWebIDL library provides the backbone for all scripting related web-technology implementations. The implementation is based on the following specification:
- [WebIDL](https://heycam.github.io/webidl/)  
<br>

\section WebCoreFlow WebCore Flow

<img alt="WebCore Flow" src="../Architecture/EngineWebCoreFlow.svg"/>

**Flow**  
The NhHTML library calls the NhCSS library for presenting HTML documents. Both libraries rely on the NhDOM library for access and manipulation of DOM tree nodes. The NhWebIDL library implements the interface between the scripting engine in form of the NhECMAScript library and all other web-technology implementing libraries.  

\section WebDiverseComponents WebDiverse Components

TODO

\section WebPlatformComponents WebPlatform Components

TODO

</div>

