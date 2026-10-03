/*
* Copyright (C) 2025 DuolaD
* SPDX-License-Identifier: BSD-3-Clause
*/

#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <cstdlib>
#include <filesystem>
#include <algorithm>
#include <cctype>
#include <unordered_set>
#ifdef _WIN32
    #include <windows.h>
    #include <winver.h>
    #pragma comment(lib, "Version.lib")
#else
    #include <limits.h>
    #include <unistd.h>
#endif

// Get the directory where the executable file is located (UTF-8 encoded)
std::string get_selfpath() {
#ifdef _WIN32
    std::vector<wchar_t> buff(MAX_PATH);
    DWORD len = GetModuleFileNameW(NULL, buff.data(), static_cast<DWORD>(buff.size()));
    while (len == buff.size()) {
        buff.resize(buff.size() * 2);
        len = GetModuleFileNameW(NULL, buff.data(), static_cast<DWORD>(buff.size()));
    }
    if (len == 0) {
        return "";
    }
    int utf8Len = WideCharToMultiByte(CP_UTF8, 0, buff.data(), len, NULL, 0, NULL, NULL);
    if (utf8Len <= 0) {
        return "";
    }
    std::string utf8Buff(utf8Len, '\0');
    WideCharToMultiByte(CP_UTF8, 0, buff.data(), len, &utf8Buff[0], utf8Len, NULL, NULL);
    std::string::size_type pos = utf8Buff.find_last_of("\\/");
    return (pos == std::string::npos) ? utf8Buff : utf8Buff.substr(0, pos);
#else
    char buff[PATH_MAX];
    ssize_t len = ::readlink("/proc/self/exe", buff, sizeof(buff) - 1);
    if (len != -1) {
        buff[len] = '\0';
        std::string s(buff);
        std::string::size_type pos = s.find_last_of("\\/");
        return (pos == std::string::npos) ? s : s.substr(0, pos);
    }
    return "";
#endif
}

std::string trim_copy(const std::string& s) {
    size_t start = 0;
    while (start < s.size() && std::isspace(static_cast<unsigned char>(s[start]))) {
        ++start;
    }

    size_t end = s.size();
    while (end > start && std::isspace(static_cast<unsigned char>(s[end - 1]))) {
        --end;
    }

    return s.substr(start, end - start);
}

std::string to_lower_copy(std::string s) {
    std::transform(s.begin(), s.end(), s.begin(), [](unsigned char c) {
        return static_cast<char>(std::tolower(c));
    });
    return s;
}

void replace_all(std::string& str, const std::string& from, const std::string& to) {
    if (from.empty()) return;
    size_t start_pos = 0;
    while ((start_pos = str.find(from, start_pos)) != std::string::npos) {
        str.replace(start_pos, from.length(), to);
        start_pos += to.length();
    }
}

bool has_addon_extension(const std::filesystem::path& addonPath) {
    const std::string ext = to_lower_copy(addonPath.extension().string());
    return ext == ".addon" || ext == ".addon32" || ext == ".addon64";
}

std::unordered_set<std::string> load_addon_whitelist(const std::filesystem::path& whitelistPath) {
    std::unordered_set<std::string> whitelist;

    std::ifstream input(whitelistPath);
    if (!input) {
        return whitelist;
    }

    std::string line;
    while (std::getline(input, line)) {
        const std::string trimmed = trim_copy(line);
        if (trimmed.empty()) {
            continue;
        }

        if (trimmed[0] == '#' || trimmed[0] == ';') {
            continue;
        }

        whitelist.insert(to_lower_copy(trimmed));
    }

    return whitelist;
}

#ifdef _WIN32
const char* try_read_exported_cstr_ptr(const FARPROC symbol) {
    const char* value = nullptr;
    __try {
        value = *reinterpret_cast<const char* const*>(symbol);
    }
    __except (EXCEPTION_EXECUTE_HANDLER) {
        value = nullptr;
    }
    return value;
}

bool get_exported_string(const std::filesystem::path& addonPath, const char* exportName, std::string& outValue) {
    const HMODULE module = LoadLibraryExW(addonPath.wstring().c_str(), nullptr, DONT_RESOLVE_DLL_REFERENCES);
    if (module == nullptr) {
        return false;
    }

    bool ok = false;
    const FARPROC symbol = GetProcAddress(module, exportName);
    if (symbol != nullptr) {
        const char* value = try_read_exported_cstr_ptr(symbol);
        if (value != nullptr) {
            const std::string trimmed = trim_copy(value);
            if (!trimmed.empty()) {
                outValue = trimmed;
                ok = true;
            }
        }
    }

    FreeLibrary(module);
    return ok;
}

bool get_file_info_string(const std::filesystem::path& addonPath, const wchar_t* fieldName, std::string& outValue) {
    DWORD handle = 0;
    const std::wstring filePath = addonPath.wstring();
    const DWORD infoSize = GetFileVersionInfoSizeW(filePath.c_str(), &handle);
    if (infoSize == 0) {
        return false;
    }

    std::vector<BYTE> buffer(infoSize);
    if (!GetFileVersionInfoW(filePath.c_str(), 0, infoSize, buffer.data())) {
        return false;
    }

    struct LangAndCodePage {
        WORD language;
        WORD codePage;
    };

    WORD language = 0x0400;
    WORD codePage = 0x04b0;

    LangAndCodePage* translation = nullptr;
    UINT translationSize = 0;
    if (VerQueryValueW(buffer.data(), L"\\VarFileInfo\\Translation", reinterpret_cast<LPVOID*>(&translation), &translationSize) &&
        translationSize >= sizeof(LangAndCodePage)) {
        // Follow ReShade behavior and use the first translation available.
        language = translation[0].language;
        codePage = translation[0].codePage;
    }

    wchar_t subBlock[128] = {};
    swprintf_s(subBlock, L"\\StringFileInfo\\%04x%04x\\%s", language, codePage, fieldName);

    LPWSTR versionText = nullptr;
    UINT versionTextSize = 0;
    if (!VerQueryValueW(buffer.data(), subBlock, reinterpret_cast<LPVOID*>(&versionText), &versionTextSize) ||
        versionText == nullptr || versionTextSize == 0) {
        return false;
    }

    int utf8Len = WideCharToMultiByte(CP_UTF8, 0, versionText, -1, nullptr, 0, nullptr, nullptr);
    if (utf8Len <= 0) {
        return false;
    }

    std::vector<char> utf8Buffer(static_cast<size_t>(utf8Len));
    WideCharToMultiByte(CP_UTF8, 0, versionText, -1, utf8Buffer.data(), utf8Len, nullptr, nullptr);

    const std::string trimmed = trim_copy(std::string(utf8Buffer.data()));
    if (trimmed.empty()) {
        return false;
    }

    outValue = trimmed;
    return true;
}

bool get_file_product_name(const std::filesystem::path& addonPath, std::string& outValue) {
    return get_file_info_string(addonPath, L"ProductName", outValue);
}
#endif

std::string resolve_addon_label(const std::filesystem::path& addonPath) {
    std::string label = trim_copy(addonPath.stem().u8string());

#ifdef _WIN32
    std::string overrideValue;
    if (get_file_product_name(addonPath, overrideValue)) {
        label = overrideValue;
    }

    if (get_exported_string(addonPath, "NAME", overrideValue)) {
        label = overrideValue;
    }
#endif

    return label.empty() ? addonPath.filename().u8string() : label;
}

std::string build_disabled_addons_value(const std::filesystem::path& addonsDir, const std::unordered_set<std::string>& whitelist) {
    std::vector<std::filesystem::path> addonFiles;
    std::error_code ec;
    for (const auto& entry : std::filesystem::directory_iterator(addonsDir, std::filesystem::directory_options::skip_permission_denied, ec)) {
        if (!entry.is_regular_file(ec)) {
            continue;
        }

        const std::filesystem::path addonPath = entry.path();
        if (has_addon_extension(addonPath)) {
            addonFiles.push_back(addonPath);
        }
    }

    std::sort(addonFiles.begin(), addonFiles.end(), [](const std::filesystem::path& a, const std::filesystem::path& b) {
        return to_lower_copy(a.filename().u8string()) < to_lower_copy(b.filename().u8string());
    });

    std::string result;
    for (size_t i = 0; i < addonFiles.size(); ++i) {
        const std::string fileName = addonFiles[i].filename().u8string();
        if (whitelist.find(to_lower_copy(fileName)) != whitelist.end()) {
            continue;
        }

        const std::string label = resolve_addon_label(addonFiles[i]);

        if (!result.empty()) {
            result += ',';
        }
        result += label;
        result += '@';
        result += fileName;
    }

    return result;
}

int main() {
    const std::string launcherResourceDir = get_selfpath();
    if (launcherResourceDir.empty()) {
        std::cerr << "Error: Failed to obtain executable directory." << std::endl;
        return 1;
    }

    std::string a = launcherResourceDir;
    std::string::size_type pos = a.find_last_of("\\/");
    if (pos != std::string::npos) {
        a = a.substr(0, pos);
    }

#ifdef _WIN32
    // Ensure Windows-style backslashes for path consistency
    std::replace(a.begin(), a.end(), '/', '\\');
#endif

    std::filesystem::path rootDir = std::filesystem::u8path(a);
    std::filesystem::path launcherDir = std::filesystem::u8path(launcherResourceDir);

    std::filesystem::path filepath = rootDir / "ReShade.ini";
    std::filesystem::path samplePath = launcherDir / "Sample.ini";
    std::filesystem::path addonsDir = rootDir / "reshade-shaders" / "Addons";
    std::filesystem::path whitelistPath = launcherDir / "AddonWhitelist.txt";

    // Read template configuration
    std::ifstream sampleFile(samplePath, std::ios::binary);
    if (!sampleFile.is_open()) {
        std::cerr << "Error: Unable to open template file: " << samplePath.u8string() << std::endl;
        return 1;
    }

    std::string content((std::istreambuf_iterator<char>(sampleFile)), std::istreambuf_iterator<char>());
    sampleFile.close();

    const std::unordered_set<std::string> whitelist = load_addon_whitelist(whitelistPath);
    const std::string disabledAddonsValue = build_disabled_addons_value(addonsDir, whitelist);

#ifndef _WIN32
    // On POSIX platforms, normalize path separators in template
    std::replace(content.begin(), content.end(), '\\', '/');
#endif

    replace_all(content, "{{ROOT_PATH}}", a);
    replace_all(content, "{{DISABLED_ADDONS}}", disabledAddonsValue);

    std::ofstream outfile(filepath, std::ios::binary | std::ios::trunc);
    if (!outfile.is_open()) {
        std::cerr << "Error: Unable to write configuration file: " << filepath.u8string() << std::endl;
        return 1;
    }

    outfile.write(content.data(), content.size());
    outfile.close();

    return 0;
}
