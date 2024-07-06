project "AppWindows"
    kind "WindowedApp"
    language "C++"
    cppdialect "C++20"
    staticruntime "on"
    

    postbuildcommands { 
		("{MKDIR} %{cfg.targetdir}/Data"), -- Create the Data directory at the target location (.exe location).
        ("{COPY}  %{prj.location}/../%{prj.name}/Data %{cfg.targetdir}/Data"), -- Copy the Data directory into the target directory.
		("{COPY}  %{prj.location}/../SFML/extlibs/bin/x64/openal32.dll %{cfg.targetdir}") -- Copy the openal32.dll file into the target directory. Needed for audio to work.
	}

    files 
    {     
        "src/**.h",
        "src/**.cpp",
        "include/**.h",
    }

    includedirs 
    { 
        "include/",
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
        "SFML-Audio",
        "opengl32.lib", --Graphics
        "freetype.lib", --Graphics
        "winmm.lib", --System and Window
        "gdi32.lib", --Window
        "openal32.lib", --Audio
        "flac.lib", --Audio
        "vorbisenc.lib", --Audio
        "vorbisfile.lib", --Audio
        "vorbis.lib", --Audio
        "ogg.lib" --Audio
    }

    targetdir ("../Binaries/" .. OutputDir .. "/%{prj.name}")
    objdir ("../Binaries/Intermediate/" .. OutputDir .. "/%{prj.name}")

    filter "system:windows"
        systemversion "latest"
        defines { "PLATFORM_WINDOWS" }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "on"
        runtime "Debug"
        links{
            
        }

    filter "configurations:Release"
        defines { "RELEASE" }
        optimize "on"        