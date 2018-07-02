
dofile (path.join(os.getenv("DIR_SCRIPTS_ROOT"),"premake5_common.lua"))

workspace "NgoLibxml2" 

    SolutionConfiguration()
    defines {
        "NGOLIBXML2_USE_DYN"
    }
    local _exportSymbol = "NGOLIBXML2_MAKE_DLL"
    links { 
    }
    
    -- PROTECTED REGION ID(NgoLibxml2.premake.solution) ENABLED START
    -- Insert here user code
       if (os.istarget("windows")) then
          defines {"HAVE_WIN32_THREADS","HAVE_COMPILER_TLS"}
       else
          defines {"HAVE_PTHREAD_H","LIBXML_THREAD_ENABLED"}
       end
       if (os.istarget("windows")) then
          links { "ws2_32", "kernel32"}
       end
       includedirs {convertPath("include/libxml2")}
    -- End of user code
    -- PROTECTED REGION END

project "NgoLibxml2"

    PrefilterSharedLibBuildOptions("NgoLibxml2")
    defines {_exportSymbol}
    
   -- PROTECTED REGION ID(NgoLibxml2.premake.sharedlib) ENABLED START
   -- Insert here user code

   -- End of user code
   -- PROTECTED REGION END

    FilterSharedLibBuildOptions("NgoLibxml2")


    
