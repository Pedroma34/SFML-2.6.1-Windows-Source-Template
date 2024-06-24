# SFML-2.6.1-Windows-Source-Template
 Generate Visual Studio 2022 project and Make files for SFML 2.6.1. I use this template so I can attach my personal project to this workspace and debug SFML from source. I've added an App project which links to SFML. You can see for yourself and debug it to see how SFML works.

 # How to build (Visual Studio 2022)
 Simply execute batch file to generate a VS2022 project. 
 # How to build (Make files) (NEEDS WORK!)
 You can also generate Make files as well if you don't want to use VS2022, but you'd have to do some adjustments. I THINK it doesn't work because the libraries that I added for SFML to use were made for the Visual Studio compiler. I believe these are the freetype and openal32 libs (located in SFML/libs.) I tried compiling it with g++ and got linking errors related to these libs. I might be wrong.
