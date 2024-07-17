project "SFML-Window"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    staticruntime "on"

    location (SFML_DIR)
    
    files 
    {     
        SFML_DIR .. "/include/SFML/Window/*.h",
        SFML_DIR .. "/include/SFML/Window/*.hpp",
        SFML_DIR .. "/src/SFML/Window/*.cpp",
        SFML_DIR .. "/src/SFML/Window/*.hpp",
    }

    includedirs 
    {
        SFML_DIR .. "/include",
        SFML_DIR .. "/src",
        SFML_DIR .. "/extlibs/headers/glad/include",
        SFML_DIR .. "/extlibs/headers/vulkan"
    }

    targetdir (BinariesDir .. "/%{prj.name}")
    objdir (IntermediateDir .. "/%{prj.name}")

    filter "system:windows"
        files 
        {
            SFML_DIR .. "/src/SFML/Window/Win32/*.cpp",
            SFML_DIR .. "/src/SFML/Window/Win32/*.hpp",
        }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "on"
        runtime "Debug"

    filter "configurations:Release"
        defines { "RELEASE" }
        optimize "on"