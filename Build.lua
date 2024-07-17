
workspace "SFML-2.6.1"
    configurations { "Debug", "Release" }
    platforms { "x64" }
    location "./"
    startproject "SFML-Test"
    cppdialect "C++20"
    
include "Build-SFML-Graphics.lua"
include "Build-SFML-System.lua"
include "Build-SFML-Window.lua"
include "Build-SFML-Audio.lua"