workspace "SFML-Windows"
    architecture "x64"
    configurations {"Debug", "Release"}
    startproject "System"
    startproject "App"
    defines { "SFML_STATIC" } --builds the static version of SFML
    startproject "AppWindows"
    --If action is for vs:
    filter "action:vs*"
        location "../VS2022" -- Location of the solution/project files
    filter "system:windows"
        systemversion "latest"

OutputDir = "%{cfg.buildcfg}"

include "../AppWindows/Build-AppWindows.lua"
include "../SFML/src/SFML/Graphics/Build-SFML-Graphics.lua"
include "../SFML/src/SFML/System/Build-SFML-System.lua"
include "../SFML/src/SFML/window/Build-SFML-Window.lua"