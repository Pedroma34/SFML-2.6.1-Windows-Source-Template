
workspace "SFML-Windows-2.6.1"
    architecture "x64"

    configurations {"Debug", "Release"}
    
    defines { "SFML_STATIC" } --builds the static version of SFML
    
    -- Visual Studio
    filter "action:vs*"
        location "../VS2022" -- Location of the solution/project files
    
    -- mingw
    filter "action:gmake2"
        defines { "UNICODE", "_UNICODE" } -- Needs to be defined for the Unicode build 
        defines {"OPENAL_STATIC"}         --builds the static version of OpenAL
    
    filter "system:windows"
        systemversion "latest"
    filter {}

        
OutputDir = "%{cfg.buildcfg}"
WorkspaceDir = os.getcwd() .. "/../" --Absolute path to the Workspace folder
BinariesDir = WorkspaceDir .. "_Binaries/" .. OutputDir
IntermediateDir = WorkspaceDir .. "_Intermediate/" .. OutputDir .. "/%{prj.name}"
SFML_DIR = WorkspaceDir .. "Projects/SFML"
AppWindows_DIR = WorkspaceDir .. "Projects/AppWindows"

include "SFML/Build-SFML-Graphics.lua"
include "SFML/Build-SFML-System.lua"
include "SFML/Build-SFML-Window.lua"
include "SFML/Build-SFML-Audio.lua"
include "AppWindows/Build-AppWindows.lua"