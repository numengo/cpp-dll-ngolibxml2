
dofile (path.join(os.getenv("DIRSCRIPTSROOT"),"premake5_common.lua"))

-- solution NgoLibxml2 --
solution "NgoLibxml2"

    SolutionConfiguration()

    -- COMMON CONFIGURATION MODIFICATION - START --
    filter {}
        -- common defines (adapt if necessary) --
       defines {"HAVE_COMPILER_TLS"
               ,"NGO_ERR_USE_DYN"
               }
       if (os.istarget("windows")) then
          defines {"HAVE_WIN32_THREADS"}
       end
       -- for shared libs, export statement
       local _exportSymbol = ""
       -- suffix to use for library versionning
       local _version = ""
       -- common libs  --
       if (os.istarget("windows")) then
          links { "wsock32", "kernel32"}
       end
       includedirs {convertPath("include/libxml2")}
    -- COMMON CONFIGURATION MODIFICATION - END --

project "NgoLibxml2"
    -- PROJECT MODIFICATIONS START--
    local _targetname = "NgoLibxml2"
    -- additional defines --
    --defines {_exportSymbol}
    -- PROJECT MODIFICATIONS END--

    AppendSharedLibBuildOptions(_targetname.._version)
