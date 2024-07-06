#pragma once

/*
	* Directory class is a singleton class that provides the path to the directory where the executable is located.
*/
class Directory {
public:

	static const char* GetExeDirectory();
	static const wchar_t* GetExeDirectoryW();

public:
	Directory(const Directory&) = delete;
	Directory& operator=(const Directory&) = delete;
	~Directory();
private:
	Directory();

	static Directory& GetInstance();
};
