project "SFML-Audio"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    staticruntime "on"
    
    location (SFML_DIR)
    
    defines { "FLAC__NO_DLL"} -- This is needed to avoid linking to the FLAC DLL

    files 
    {     
        SFML_DIR .. "/include/SFML/Audio/*.h",
        SFML_DIR .. "/include/SFML/Audio/*.hpp",
        SFML_DIR .. "/src/SFML/Audio/*.cpp",
        SFML_DIR .. "/src/SFML/Audio/*.hpp",
    }

    includedirs 
    {
        SFML_DIR .. "/include",
        SFML_DIR .. "/src",
        SFML_DIR .. "/extlibs/headers",
        SFML_DIR .. "/extlibs/headers/AL",
        SFML_DIR .. "/extlibs/headers/minimp3"
    }

    targetdir (BinariesDir .. "/%{prj.name}")
    objdir (IntermediateDir .. "/%{prj.name}")


    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "on"
        runtime "Debug"

    filter "configurations:Release"
        defines { "RELEASE" }
        optimize "on"