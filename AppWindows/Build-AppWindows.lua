project "AppWindows"
    kind "WindowedApp"
    language "C++"
    cppdialect "C++20"
    staticruntime "on"
    
    files 
    {     
        "src/**.h",
        "src/**.cpp"
    }

    includedirs 
    { 
        "../SFML/include"
    }

    libdirs 
    {
        "../SFML/libs"
    }
    links
    {
        "SFML-Graphics",
        "SFML-Window",
        "SFML-System",
        "opengl32",
        "winmm",
        "freetype"
    }

    targetdir ("../../Binaries/" .. OutputDir .. "/%{prj.name}")
    objdir ("../../Binaries/Intermediate/" .. OutputDir .. "/%{prj.name}")

    filter "system:windows"
        systemversion "latest"
        defines { "PLATFORM_WINDOWS" }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "on"
        runtime "Debug"

    filter "configurations:Release"
        defines { "RELEASE" }
        optimize "on"        