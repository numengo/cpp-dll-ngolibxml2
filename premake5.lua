dofile (path.join(os.getenv("DIR_SCRIPTS_ROOT"),"premake5_common.lua"))

workspace "NgoLibxml2"

    SolutionConfiguration()
    defines {
                "HAVE_WIN32_THREADS"
			   ,"DHAVE_COMPILER_TLS"
               ,"NGO_ERR_USE_DYN"
    }
    local _exportSymbol = ""
    links { "wsock32", "kernel32"
    }
    
    -- PROTECTED REGION ID(NgoLibxml2.premake.solution) ENABLED START
       includedirs {convertPath("include/libxml2")}
    -- PROTECTED REGION END


project "NgoLibxml2"

    PrefilterSharedLibBuildOptions("NgoLibxml2")
    defines {_exportSymbol}
    
    -- PROTECTED REGION ID(NgoLibxml2.premake.sharedlib) ENABLED START

    -- PROTECTED REGION END

    FilterSharedLibBuildOptions("NgoLibxml2")

