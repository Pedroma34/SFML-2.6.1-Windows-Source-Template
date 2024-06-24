#include <windows.h>
#include "SFML/Graphics.hpp"

int WINAPI wWinMain(_In_ HINSTANCE hInst, _In_opt_ HINSTANCE hInstPrev,	_In_ PWSTR cmdline,	_In_ int cmdshow){

	/* IF YOU WANT TO GET THE CONSOLE TO SHOW UP
	AllocConsole();
    FILE* file = nullptr;
    freopen_s(&file, "CONOUT$", "w", stdout);
    freopen_s(&file, "CONOUT$", "w", stderr);
    freopen_s(&file, "CONIN$", "r", stdin);
    */

    sf::RenderWindow window(sf::VideoMode(sf::Vector2u(800, 600)), "SFML works!");

    sf::CircleShape shape(100.f);
    shape.setFillColor(sf::Color::Green);

    while (window.isOpen()){
        while (const auto event = window.pollEvent()) {
            if (event->is<sf::Event::Closed>())
                window.close();
        }

        window.clear();
        window.draw(shape);
        window.display();
    }

    return 0;

}

