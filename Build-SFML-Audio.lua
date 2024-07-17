project "SFML-Audio"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    architecture "x64"
    staticruntime "on"
    
    location "./" 
    configurations {"Debug", "Release"}
    
    defines { "SFML_STATIC" } --builds the static version of SFML
    defines { "FLAC__NO_DLL"} -- This is needed to avoid linking to the FLAC DLL

    files 
    {     
        "include/SFML/Audio/*.h",
        "include/SFML/Audio/*.hpp",
        "src/SFML/Audio/*.cpp",
        "src/SFML/Audio/*.hpp",
    }

    includedirs 
    {
        "include",
        "src",
        "extlibs/headers",
        "extlibs/headers/AL",
        "extlibs/headers/minimp3"
    }

    targetdir ("Libs/%{cfg.buildcfg}/%{prj.name}")
    objdir ("Int/%{cfg.buildcfg}/%{prj.name}")

    --mingw
    filter "action:gmake2"
        defines { "UNICODE", "_UNICODE" } -- Needs to be defined for the Unicode build 
        defines {"OPENAL_STATIC"}         --builds the static version of OpenAL

    filter "system:windows"
        systemversion "latest"
    
    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "on"
        runtime "Debug"

    filter "configurations:Release"
        defines { "RELEASE" }
        optimize "on"