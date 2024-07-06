#include "Directory.h"
#include "Windows.h"

const char* Directory::GetExeDirectory() {
	static char path[MAX_PATH];
	GetModuleFileNameA(NULL, path, MAX_PATH);
	char* lastSlash = strrchr(path, '\\');
	if (lastSlash)
		*(lastSlash + 1) = '\0';
	return path;
}

Directory::~Directory() {}

const wchar_t* Directory::GetExeDirectoryW() {
	static wchar_t path[MAX_PATH];
	GetModuleFileNameW(NULL, path, MAX_PATH);
	wchar_t* lastSlash = wcsrchr(path, L'\\');
	if (lastSlash)
		*(lastSlash + 1) = '\0';
	return path;
}

Directory::Directory() {}

Directory& Directory::GetInstance() {
	static Directory instance;
	return instance;
}
