
dofile (path.join(os.getenv("DirScriptsRoot"),"premake_common.lua"))

-- solution NgoLibxml2 --
solution "NgoLibxml2"

    SolutionConfiguration()

    -- COMMON CONFIGURATION MODIFICATION - START --
    configuration {}
        -- common defines (adapt if necessary) --
       defines {"HAVE_WIN32_THREADS"
			   ,"DHAVE_COMPILER_TLS"
               ,"NGO_ERR_USE_DYN"
               }           
       -- for shared libs, export statement
       local _exportSymbol = ""
       -- suffix to use for library versionning
       local _version = ""
       -- common libs  --
       links { "wsock32", "kernel32"
          }
       includedirs {convertPath("include/libxml2")}
    -- COMMON CONFIGURATION MODIFICATION - END --

project "NgoLibxml2"
    -- PROJECT MODIFICATIONS START--
    local _targetname = "NgoLibxml2"
    -- additional defines --
    defines {_exportSymbol}
    -- PROJECT MODIFICATIONS END--

    AppendSharedLibBuildOptions(_targetname.._version)
