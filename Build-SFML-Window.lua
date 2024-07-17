project "SFML-Window"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    architecture "x64"
    staticruntime "on"
    
    location "./" 
    configurations {"Debug", "Release"}
    
    defines { "SFML_STATIC" } --builds the static version of SFML
    
    files 
    {     
        "include/SFML/Window/*.h",
        "include/SFML/Window/*.hpp",
        "src/SFML/Window/*.cpp",
        "src/SFML/Window/*.hpp",
    }

    includedirs 
    {
        "include",
        "src",
        "extlibs/headers/glad/include",
        "extlibs/headers/vulkan"
    }

    targetdir ("Libs/%{cfg.buildcfg}/%{prj.name}")
    objdir ("Int/%{cfg.buildcfg}/%{prj.name}")

    --mingw
    filter "action:gmake2"
        defines { "UNICODE", "_UNICODE" } -- Needs to be defined for the Unicode build 
        defines {"OPENAL_STATIC"}         --builds the static version of OpenAL

    filter "system:windows"
        systemversion "latest"
        files 
        {
            "src/SFML/Window/Win32/*.cpp",
            "src/SFML/Window/Win32/*.hpp",
        }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "on"
        runtime "Debug"

    filter "configurations:Release"
        defines { "RELEASE" }
        optimize "on"