project "SFML-System"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    staticruntime "on"
    
    location (SFML_DIR)
    
    files 
    {     
        SFML_DIR .. "/include/SFML/System/*.h",
        SFML_DIR .. "/include/SFML/System/*.hpp",
        SFML_DIR .. "/src/SFML/System/*.cpp",
        SFML_DIR .. "/src/SFML/System/*.hpp",
    }

    includedirs 
    {
        SFML_DIR .. "/include",
        SFML_DIR .. "/src",
    }

    targetdir (BinariesDir .. "/%{prj.name}")
    objdir (IntermediateDir .. "/%{prj.name}")

    filter "system:windows"
        files 
        {
            SFML_DIR .. "/src/SFML/System/Win32/*.cpp",
            SFML_DIR .. "/src/SFML/System/Win32/*.hpp",
        }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "on"
        runtime "Debug"

    filter "configurations:Release"
        defines { "RELEASE" }
        optimize "on"