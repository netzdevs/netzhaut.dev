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

* __Code residing in src/bin is exempt from the next rule.__
* For code residing in __src/lib__, type declarations are prefixed with the library prefix (__nh__), followed by an underscore (_), followed by the library suffix, followed by an underscore (_). 
* Functions use the __camelCase__ notation. Function declarations also use specific formatting based on parameters.
<pre>
    // e.g. for 'src/lib/nhexamplelib':

    void nh_examplelib_fooBar(
    );
    void nh_examplelib_fooBar(
        int value1, int value2
    );
    void nh_examplelib_fooBar()
    {
        return;
    }
    void nh_examplelib_fooBar(
        int value1, int value2)
    {
        return;
    }
</pre>
* Structs use the __CamelCase__ notation.
<pre>
    // e.g. for 'src/lib/nhexamplelib':

    typedef struct nh_examplelib_FooBar {
        int value;
    } nh_examplelib_FooBar;
</pre>
* Enums are completely __uppercased__.
* Enum values have the enum declaration name as prefix.
<pre>
    // e.g. for 'src/lib/nhexamplelib':

    typedef enum NH_EXAMPLELIB_FOO {
        NH_EXAMPLELIB_FOO_BAR1,
        NH_EXAMPLELIB_FOO_BAR2,
    } NH_EXAMPLELIB_FOO;
</pre>
* Global variables, types and macros are also completely __uppercased__.
<pre>
    // e.g. for 'src/lib/nhexamplelib':

    typedef char NH_EXAMPLELIB_CHAR;
    extern int NH_EXAMPLELIB_GLOBAL_VAR;
</pre>
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

\section HeaderFormat Header Format

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

* The format applies to all header-files inside __src/lib__.
* Blocks must be omitted If they contain no declarations.  
* Includes are not indented unless they are part of defines.  
* Declarations must be indented by 4 whitespace.  

\section SourceFormat Source Format

**Skeleton**  

<pre>
    // LICENSE NOTICE ==================================================================================
    
    /**
     * netzhaut - Web Browser Engine
     * Copyright (C) 2021 The netzhaut Authors
     * Published under MIT 
     */
    
    // INCLUDE =========================================================================================
    
    // Includes go here
    
    // IMPLEMENT =======================================================================================
    
    // Functions etc. go here
</pre>

**Practice**  

* The format applies to all source-files in __src/lib__.
* Developers are encouraged to logically group code by using segmentation comments. At a minimum, a source file must begin with code-segments similiar to the ones from the skeleton.
* License notice and include code-segments are mandatory.

</div>
