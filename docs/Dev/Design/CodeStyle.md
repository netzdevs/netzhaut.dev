\page CodeStyle Code Style 

<div style="width:700px;">

Netzhaut uses a custom code-style focused on clean and expressive formatting. Styling not mentioned in this document can be freely chosen, but must be conforming to the general guidelines and the overall styling formula.  
<br> 
General guidelines:
* Use your own judgement.
* Break the rules if it makes sense e.g.: it improves readability substantially.
* Use the formatting of the file you're in, even if it breaks the rules.

\section General General
 
* 4 spaces indent.
* 100 columns.

\section Code Code

* Use camel case whenever it makes sense.
* Generally, declarations must begin with the library prefix (Nh), followed by an underscore (_), followed by the library suffix, followed by an underscore (_), followed by the declaration name. 
* Functions:
<pre>
    void Nh_Example_foo(
    );
    void Nh_Example_foo(
        int value1, int value2
    );
    void Nh_Example_foo()
    {
        return;
    }
    void Nh_Example_foo(
        int value1, int value2)
    {
        return;
    }
</pre>
* Structs:
<pre>
    typedef struct Nh_Example_Foo {
        int value;
    } Nh_Example_Foo;
</pre>
* Enums:
<pre>
    typedef enum NH_EXAMPLE_FOO {
        NH_EXAMPLE_FOO_BAR1,
        NH_EXAMPLE_FOO_BAR2,
    } NH_EXAMPLE_FOO;
</pre>
* Global vars and types follow the same scheme, but uppercased similar to enums.
* Pointer variables must have a suffix consisting of an underscore (_) followed by as many p characters as the pointer is deep:
<pre>
    int *p;
    int *foo_p;
    int **foo_pp;
</pre>

\section Naming File Naming

* Headers use the .h extension.
* Implementation files use the .c extension.
* Include files use the .inc extension.
* No spaces in file names.
* First letter in file names must be uppercase.
<pre>
    Foo.h
    FooBar.c
    FooBarGen.inc
</pre>

\section Header Header Format

**Skeleton**  

<pre>
    #ifndef NH_SKELETON_H
    #define NH_SKELETON_H
    
    #ifndef DOXYGEN_SHOULD_SKIP_THIS
    
    /**
     * Netzhaut - Web Browser Engine
     * Copyright (C) 2020 The Netzhaut Authors
     * Published under LGPLv3
     */
    
    // Includes go here
    
    #endif
    
    /** \@addtogroup NhExampleEnums
     *  \@{
     */
    
        // Enums go here
    
    /** \@} */
    
    /** \@addtogroup NhExampleStructs
     *  \@{
     */
    
        // Structs go here
    
    /** \@} */
    
    /** \@addtogroup NhExampleTypedefs
     *  \@{
     */
    
        // Typedefs go here
    
    /** \@} */
    
    /** \@addtogroup NhExampleVars
     *  \@{
     */
    
        // Global Vars go here
    
    /** \@} */
    
    /** \@addtogroup NhExampleFunctions
     *  \@{
     */
    
        // Function Declarations go here
    
    /** \@} */
    
    #endif
</pre>

**Practice**  

* Header files must use the above skeleton.
* Blocks must be omitted If they contain no declarations.  
* Includes are not indented unless they are part of defines.  
* Declarations must be indented by 4 whitespace.  

\section Source Source Format

**Skeleton**  

<pre>
    // LICENSE NOTICE ==================================================================================
    
    /**
     * Netzhaut - Web Browser Engine
     * Copyright (C) 2020 The Netzhaut Authors
     * Published under LGPLv3
     */
    
    // INCLUDE =========================================================================================
    
    // Includes go here
    
    // IMPLEMENT =======================================================================================
    
    // Functions etc. go here
</pre>

**Practice**  

* Developers are encouraged to logically group code by using segmentation comments. At a minimum, a source file must begin with code-segments similiar to the ones from the skeleton.
* License notice and include code-segments are mandatory.

</div>
