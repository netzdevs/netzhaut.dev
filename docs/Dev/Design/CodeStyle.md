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

* For code residing in __src/lib__, declarations are prefixed with the library prefix (__nh__), followed by an underscore (_), followed by the library suffix, followed by an underscore (_). 
* For code residing in __src/bin__, declarations are prefixed with the binary prefix (__Nh__), followed by an underscore (_), followed by the binary suffix, followed by an underscore (_). 
* Function suffixes use the __camelCase__ notation.
<pre>
    // e.g. for 'src/lib/nhexamplelibrary':

    void nh_examplelibrary_fooBar(
    );
    void nh_examplelibrary_fooBar(
        int value1, int value2
    );
    void nh_examplelibrary_fooBar()
    {
        return;
    }
    void nh_examplelibrary_fooBar(
        int value1, int value2)
    {
        return;
    }

    // e.g. for 'src/bin/NhExampleBinary':

    void Nh_ExampleBinary_fooBar(
    );
    void Nh_ExampleBinary_fooBar(
        int value1, int value2
    );
    void Nh_ExampleBinary_fooBar()
    {
        return;
    }
    void Nh_ExampleBinary_fooBar(
        int value1, int value2)
    {
        return;
    }
</pre>
* Struct suffixes use the __CamelCase__ notation.
<pre>
    // e.g. for 'src/lib/nhexamplelibrary':

    typedef struct nh_examplelibrary_FooBar {
        int value;
    } nh_example_Foo;

    // e.g. for 'src/bin/NhExampleBinary':

    typedef struct Nh_ExampleBinary_FooBar {
        int value;
    } Nh_Example_Foo;
</pre>
* Enums are completely __uppercased__.
* Enum values have the enum declaration name as prefix.
<pre>
    typedef enum NH_EXAMPLE_FOO {
        NH_EXAMPLE_FOO_BAR1,
        NH_EXAMPLE_FOO_BAR2,
    } NH_EXAMPLE_FOO;
</pre>
* Global variables and types are notated similarly to enum values.
* Local variables are generally written using the __camelCase__ notation.
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
* Use CamelCase (first letter MUST be uppercase).
<pre>
    Foo.h
    FooBar.c
    FooBarGen.inc
</pre>

\section LibraryHeader Library Header Format

**Skeleton**  

<pre>
    #ifndef NH_SKELETON_H
    #define NH_SKELETON_H
    
    #ifndef DOXYGEN_SHOULD_SKIP_THIS
    
    /**
     * netzhaut - Web Browser Engine
     * Copyright (C) 2020 The netzhaut Authors
     * Published under LGPLv3
     */
    
    // Includes go here
    
    #endif
    
    /** \@addtogroup nhexampleEnums
     *  \@{
     */
    
        // Enums go here
    
    /** \@} */
    
    /** \@addtogroup nhexampleStructs
     *  \@{
     */
    
        // Structs go here
    
    /** \@} */
    
    /** \@addtogroup nhexampleTypedefs
     *  \@{
     */
    
        // Typedefs go here
    
    /** \@} */
    
    /** \@addtogroup nhexampleVars
     *  \@{
     */
    
        // Global Vars go here
    
    /** \@} */
    
    /** \@addtogroup nhexampleFunctions
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

\section BinaryHeader Binary Header Format

**Skeleton**  

<pre>
    #ifndef NH_SKELETON_H
    #define NH_SKELETON_H
    
    #ifndef DOXYGEN_SHOULD_SKIP_THIS
    
    /**
     * netzhaut - Web Browser Engine
     * Copyright (C) 2020 The netzhaut Authors
     * Published under MIT 
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

* Same practice as for the library header format. 

\section LibrarySource Library Source Format

**Skeleton**  

<pre>
    // LICENSE NOTICE ==================================================================================
    
    /**
     * netzhaut - Web Browser Engine
     * Copyright (C) 2020 The netzhaut Authors
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

\section BinarySource Binary Source Format

**Skeleton**  

<pre>
    // LICENSE NOTICE ==================================================================================
    
    /**
     * netzhaut - Web Browser Engine
     * Copyright (C) 2020 The netzhaut Authors
     * Published under MIT
     */
    
    // INCLUDE =========================================================================================
    
    // Includes go here
    
    // IMPLEMENT =======================================================================================
    
    // Functions etc. go here
</pre>

**Practice**  

* Same practice as for the library source format. 

</div>
