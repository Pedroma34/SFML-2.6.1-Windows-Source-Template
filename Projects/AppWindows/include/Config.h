#pragma once

#ifdef DEBUG

#include <iostream>

#define ALLOCATE_CSL() {\
        AllocConsole(); \
        FILE* file = nullptr; \
        freopen_s(&file, "CONOUT$", "w", stdout); \
        freopen_s(&file, "CONOUT$", "w", stderr); \
        freopen_s(&file, "CONIN$", "r", stdin); } \

#define DEBUG_MSG(x) \
        std::cout << x << "\n"; \

#else

#define DEBUG_MSG(x)
#define ALLOCATE_CSL()

#endif

