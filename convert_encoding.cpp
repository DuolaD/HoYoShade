/*
 * Copyright (C) 2025 DuolaD
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include <windows.h>
#include <iostream>
#include <fstream>
#include <vector>
#include <string>

std::wstring GetExecutableDirectory() {
    wchar_t path[MAX_PATH];
    GetModuleFileNameW(NULL, path, MAX_PATH);
    std::wstring fullPath(path);
    size_t pos = fullPath.find_last_of(L"\\/");
    return fullPath.substr(0, pos);
}

bool ConvertGB2312ToUTF8(const std::string& gb2312Str, std::string& utf8Str) {
    // Step 1: Convert GB2312 to Unicode (Wide string)
    int wideLen = MultiByteToWideChar(936, 0, gb2312Str.c_str(), -1, NULL, 0);
    if (wideLen <= 0) return false;
    std::vector<wchar_t> wideStr(wideLen);
    MultiByteToWideChar(936, 0, gb2312Str.c_str(), -1, wideStr.data(), wideLen);

    // Step 2: Convert Unicode to UTF-8
    int utf8Len = WideCharToMultiByte(CP_UTF8, 0, wideStr.data(), -1, NULL, 0, NULL, NULL);
    if (utf8Len <= 0) return false;
    std::vector<char> utf8Buffer(utf8Len);
    WideCharToMultiByte(CP_UTF8, 0, wideStr.data(), -1, utf8Buffer.data(), utf8Len, NULL, NULL);

    utf8Str = std::string(utf8Buffer.data());
    return true;
}

int main() {
    std::wstring dir = GetExecutableDirectory();
    std::wstring filePath = dir + L"\\ReShade.ini";

    std::ifstream input(filePath, std::ios::binary);
    if (!input) {
        return 1;
    }

    std::string gb2312Content((std::istreambuf_iterator<char>(input)),
                              std::istreambuf_iterator<char>());
    input.close();

    std::string utf8Content;
    if (!ConvertGB2312ToUTF8(gb2312Content, utf8Content)) {
        return 1;
    }

    std::ofstream output(filePath, std::ios::binary | std::ios::trunc);
    if (!output) {
        return 1;
    }

    output.write(utf8Content.c_str(), utf8Content.size());
    output.close();

    return 0;
}
