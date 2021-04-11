\page SystemArchitecture System Architecture

<div style="width:700px;">

This document explains the current state of the system architecture. It defines components and interconnections between components. This is the highest abstraction level of the project.

\section Notation Notation 

<img alt="Component Types" src="../Architecture/ComponentTypes.svg"/>

**Component Types**  
In order to differentiate and group components, the above notation is used in the following sections. A component therefore is defined by its name and box-style.

\section SystemLayers System Layers 

<img alt="System Layers" src="../Architecture/SystemLayers.svg"/>

**Layers**  
At the top-level, the system architecture for Netzhaut is comprised of 3 layers: The API layer, the Application layer and the Support layer.  
<br>

**API Layer**  
The API layer exposes Netzhaut to the user.  
<br>

**Application Layer**  
The Application layer contains most of the implementation. It is controlled by the API layer.  
<br>

**Support Layer**  
The Support layer contains external components that are developed independently and may not be part of the project. This layer is used by the application layer.  
<br>

\section SystemLayerComponents System Layer Components

<img alt="System Layer Components" src="../Architecture/SystemLayerComponents.svg"/>

**Netzhaut library**  
The Netzhaut library is the only component that users need to directly include or link to. In the initialization phase, the Netzhaut library acts as a bootstrap for the NhLoader library and other essential components. Apart from that, it dispatches function calls to the appropriate components using the NhLoader library.  
<br>

**NhLoader Library**   
The NhLoader library implements loading, unloading and updating of engine components as well as calling engine functions. The distinction between Netzhaut library and NhLoader library allows for components to be updated at runtime except the Netzhaut library, which doesn't need this capability anyway.  
<br>

**Engine Group**  
The engine is a group of different libraries which implement various system features. The group is explained in the [Engine Architecture](EngineArchitecture.html) document.   
<br>

**External Group**  
The external group is a mix of different libraries providing external functionality not implemented by Netzhaut Authors. Standard libraries are exempt from being represented in the architecture and thus, are not included in the external group.  
<br>

**NhInstaller Binary**  
The NhInstaller binary builds the project, generates documentation and executes other development routines.
<br>

\section SystemFlow System Flow

<img alt="System Flow" src="../Architecture/SystemFlow.svg"/>

**API**  
The user calls functions from the Netzhaut library. Initially, the Netzhaut library loads the NhLoader library. After that, every function call to the Netzhaut library involves the NhLoader library loading a corresponding function pointer from an engine library, which the Netzhaut library then calls directly, returning the result thus giving feedback to the user.   
<br>

**Loader**  
When loading or unloading an engine library, the NhLoader library automatically calls the initialization or termination function of that library. When issuing an update request, the NhLoader library builds the corresponding library using the NhInstaller binary. After that, it issues a reload request to related threads and replaces the library with the newly build library object.  
<br>

**Engine**  
The engine receives calls from the NhLoader library or the Netzhaut library. It has complex inner workings which sometimes involves calling the NhLoader library to load function pointers of other engine components. Also, the engine frequently makes use of external components from the External group.  
<br>

</div>
