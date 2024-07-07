project "AppWindows"
    kind "WindowedApp"
    language "C++"
    cppdialect "C++20"
    staticruntime "on"
    location "../%{prj.name}"

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

    links
    {
    }

    targetdir ("../Binaries/" .. OutputDir .. "/%{prj.name}")
    objdir ("../Binaries/Intermediate/" .. OutputDir .. "/%{prj.name}")


    --Visual studio libraries
    filter "action:vs*" --Visual Studio
        libdirs { "../SFML/libsVS" }
        links{
            "SFML-Graphics",
            "SFML-Window",
            "SFML-System",
            "SFML-Audio",
            "opengl32.lib", --Graphics
            "freetype.lib", --Graphics
            "winmm.lib", --System and Window
            "gdi32.lib", --Window
            "openal32.lib", --Audio
            "ogg.lib", --Audio
            "flac.lib", --Audio
            "vorbisenc.lib", --Audio
            "vorbisfile.lib", --Audio
            "vorbis.lib", --Audio
        }

        postbuildcommands { 
            ("{MKDIR} %{cfg.targetdir}/Data"), -- Create the Data directory at the target location (.exe location).
            ("{COPY}  %{prj.location}/../%{prj.name}/Data %{cfg.targetdir}/Data"), -- Copy the Data directory into the target directory.
            ("{COPY}  %{prj.location}/../SFML/extlibs/bin/x64/openal32.dll %{cfg.targetdir}") -- Copy the openal32.dll file into the target directory. Needed for audio to work.
        }
    
    --minGW libraries
    filter "action:gmake2" --MinGW
        libdirs { "../SFML/libsMINGW" }
        links{
            "SFML-Graphics",
            "SFML-Window",
            "SFML-Audio",
            "SFML-System",
            "openal32", --Audio
            "FLAC", --Audio
            "vorbisenc", --Audio
            "vorbisfile", --Audio
            "vorbis", --Audio
            "ogg", --Audio
            "freetype", --Graphics
            "opengl32", --Graphics
            "winmm", --System and Window
            "gdi32", --Window
        }

        postbuildcommands { 
            "cp -r %{prj.location}/../%{prj.name}/Data %{cfg.targetdir}/Data", -- Copy the Data directory into the target directory.
            "cp %{prj.location}/../SFML/extlibs/bin/x64/openal32.dll %{cfg.targetdir}" -- Copy the openal32.dll file into the target directory. Needed for audio to work.
        }
        
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
        
    filter "configurations:Dist"
        defines { "DIST" }
        optimize "on"