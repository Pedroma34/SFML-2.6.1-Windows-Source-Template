#include "SFML/Graphics.hpp" //Has to be included first, otherwise rect.inl will not compile.
#include "SFML/Audio.hpp"
#include "Config.h"
#include <windows.h>
#include <Directory.h>

int WINAPI WinMain(_In_ HINSTANCE hInst, _In_opt_ HINSTANCE hInstPrev,	_In_ PWSTR cmdline,	_In_ int cmdshow){
    
    //Debug console
    ALLOCATE_CSL();
	DEBUG_MSG("SFML Application - 2.6.1");

    //Window
	sf::RenderWindow window(sf::VideoMode(800, 600), "SFML works!");

    //Sound
	sf::SoundBuffer buffer;
	std::string soundPath = Directory::GetExeDirectory() + std::string("Data/Audio/gunshot.wav");
	if (!buffer.loadFromFile(soundPath)) {
        MessageBoxA(NULL, std::string("Can't load: " + soundPath).c_str(), "Error", MB_ICONERROR);
		return 1;
    }
	sf::Sound sound;
	sound.setBuffer(buffer);

    //Shape
    sf::CircleShape shape(100.f);
    shape.setFillColor(sf::Color::Green);

    while (window.isOpen()){
		sf::Event event;
        while (window.pollEvent(event)) {
            if (event.type == sf::Event::Closed)
                window.close();
            else if (event.type == sf::Event::KeyPressed) {
				if (event.key.code == sf::Keyboard::Space)
					sound.play();
            }
        }

        window.clear();
        window.draw(shape);
        window.display();
    }

    return 0;

}
