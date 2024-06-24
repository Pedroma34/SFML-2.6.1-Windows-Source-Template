project "SFML-Graphics"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    staticruntime "on"
    
    files 
    {     
        "../../../include/SFML/Graphics/**.h",
        "../../../include/SFML/Graphics/**.hpp",
        "**.cpp",
        "**.hpp"
    }

    includedirs 
    { 
        "../../../include",
        "../../../extlibs/headers/glad/include",
        "../../../extlibs/headers/freetype2",
        "../../../extlibs/headers/stb_image",
        "../.."
    }

    links
    {
    }

    targetdir ("../../../../Binaries/" .. OutputDir .. "/%{prj.name}")
    objdir ("../../../../Binaries/Intermediate/" .. OutputDir .. "/%{prj.name}")

    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "on"
        runtime "Debug"
        -- buildoptions "/MTd"

    filter "configurations:Release"
        defines { "RELEASE" }
        optimize "on"
        -- buildoptions "/MT"