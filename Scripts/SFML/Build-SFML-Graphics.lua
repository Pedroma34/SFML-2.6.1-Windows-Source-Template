project "SFML-Graphics"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    staticruntime "on"
    
    location (SFML_DIR)
    
    files 
    {     
        SFML_DIR .. "/include/SFML/Graphics/*.h",
        SFML_DIR .. "/include/SFML/Graphics/*.hpp",
        SFML_DIR .. "/src/SFML/Graphics/*.cpp",
        SFML_DIR .. "/src/SFML/Graphics/*.hpp",
    }

    includedirs 
    {
        SFML_DIR .. "/include",
        SFML_DIR .. "/src",
        SFML_DIR .. "/extlibs/headers/glad/include",
        SFML_DIR .. "/extlibs/headers/freetype2",
        SFML_DIR .. "/extlibs/headers/stb_image"
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