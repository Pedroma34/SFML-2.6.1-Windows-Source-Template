workspace "SFML-Windows-2.6.1"
    architecture "x64"
    configurations {"Debug", "Release", "Dist"}
    startproject "System"
    startproject "App"
    startproject "AppWindows"
    defines { "SFML_STATIC" } --builds the static version of SFML
    --If action is for vs:
    filter "action:vs*"
        location "../VS2022" -- Location of the solution/project files
    filter "action:gmake2"
        defines { "UNICODE", "_UNICODE" } 
        defines {"OPENAL_STATIC"}
    filter "system:windows"
        systemversion "latest"

OutputDir = "%{cfg.buildcfg}"

include "../SFML/src/SFML/Graphics/Build-SFML-Graphics.lua"
include "../SFML/src/SFML/System/Build-SFML-System.lua"
include "../SFML/src/SFML/Window/Build-SFML-Window.lua"
include "../SFML/src/SFML/Audio/Build-SFML-Audio.lua"
include "../AppWindows/Build-AppWindows.lua"