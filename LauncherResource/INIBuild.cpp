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
#include <sstream>
#include <map>
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

bool build_root_reshade_ini(const std::filesystem::path& rootDir, const std::filesystem::path& launcherDir) {
    std::string a = rootDir.u8string();
#ifdef _WIN32
    std::replace(a.begin(), a.end(), '/', '\\');
#endif

    std::filesystem::path filepath = rootDir / "ReShade.ini";
    std::filesystem::path samplePath = launcherDir / "Sample.ini";
    std::filesystem::path addonsDir = rootDir / "reshade-shaders" / "Addons";
    std::filesystem::path whitelistPath = launcherDir / "AddonWhitelist.txt";

    // Read template configuration
    std::ifstream sampleFile(samplePath, std::ios::binary);
    if (!sampleFile.is_open()) {
        std::cerr << "Error: Unable to open template file: " << samplePath.u8string() << std::endl;
        return false;
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
        return false;
    }

    outfile.write(content.data(), content.size());
    outfile.close();

    return true;
}

static bool ends_with(const std::string& str, const std::string& suffix) {
    if (str.length() < suffix.length()) return false;
    return str.compare(str.length() - suffix.length(), suffix.length(), suffix) == 0;
}

static std::string update_preprocessor_definitions(const std::string& line) {
    const std::string prefix = "PreprocessorDefinitions=";
    if (line.find(prefix) != 0) return line;

    std::string content = line.substr(prefix.length());
    // Remove trailing newline for processing
    std::string newline_suffix;
    while (!content.empty() && (content.back() == '\r' || content.back() == '\n')) {
        newline_suffix.insert(0, 1, content.back());
        content.pop_back();
    }

    std::vector<std::string> definitions;
    std::stringstream ss(content);
    std::string item;
    while (std::getline(ss, item, ',')) {
        definitions.push_back(item);
    }

    // Map to store key-value pairs and keep track of keys order
    std::vector<std::string> keys_order;
    std::map<std::string, std::string> def_map;

    for (const auto& def : definitions) {
        size_t eq_pos = def.find('=');
        std::string key, val;
        if (eq_pos != std::string::npos) {
            key = def.substr(0, eq_pos);
            val = def.substr(eq_pos + 1);
        } else {
            key = def;
        }

        if (def_map.find(key) == def_map.end()) {
            keys_order.push_back(key);
            def_map[key] = val;
        }
    }

    // Required updates
    struct ReqDef { std::string key; std::string val; };
    std::vector<ReqDef> requirements = {
        {"RESHADE_DEPTH_INPUT_IS_UPSIDE_DOWN", "1"},
        {"RESHADE_DEPTH_INPUT_IS_REVERSED", "1"},
        {"RESHADE_DEPTH_INPUT_IS_LOGARITHMIC", "0"}
    };

    bool modified = false;
    for (const auto& req : requirements) {
        if (def_map.find(req.key) == def_map.end()) {
            keys_order.push_back(req.key);
            def_map[req.key] = req.val;
            modified = true;
        } else {
            if (def_map[req.key] != req.val) {
                def_map[req.key] = req.val;
                modified = true;
            }
        }
    }

    if (!modified) return line;

    std::stringstream out;
    out << prefix;
    for (size_t i = 0; i < keys_order.size(); ++i) {
        out << keys_order[i];
        if (!def_map[keys_order[i]].empty()) {
            out << "=" << def_map[keys_order[i]];
        }
        if (i < keys_order.size() - 1) {
            out << ",";
        }
    }
    out << newline_suffix;
    return out.str();
}

bool maintain_target_reshade_ini(const std::filesystem::path& rootDir, const std::filesystem::path& targetDir, const std::filesystem::path& launcherDir) {
    std::error_code ec;
    if (!std::filesystem::exists(targetDir, ec) || !std::filesystem::is_directory(targetDir, ec)) {
        std::cerr << "Error: Target directory does not exist or is not a directory: " << targetDir.u8string() << std::endl;
        return false;
    }

    std::filesystem::path targetIni = targetDir / "ReShade.ini";
    std::filesystem::path rootIni = rootDir / "ReShade.ini";

    // Ensure root ReShade.ini is built
    if (!std::filesystem::exists(rootIni, ec)) {
        if (!build_root_reshade_ini(rootDir, launcherDir)) {
            std::cerr << "Error: Failed to build root ReShade.ini" << std::endl;
            return false;
        }
    }

    // If target ReShade.ini does not exist, copy root ReShade.ini to target
    if (!std::filesystem::exists(targetIni, ec)) {
        std::filesystem::copy_file(rootIni, targetIni, std::filesystem::copy_options::overwrite_existing, ec);
        if (ec) {
            std::cerr << "Error: Failed to copy ReShade.ini to target directory: " << ec.message() << std::endl;
            return false;
        }
        std::cout << "ReShade.ini successfully copied to target directory." << std::endl;
        return true;
    }

    // Target ReShade.ini exists, inspect and maintain it
    std::ifstream infile(targetIni, std::ios::binary);
    if (!infile.is_open()) {
        std::cerr << "Error: Unable to open target ReShade.ini for reading: " << targetIni.u8string() << std::endl;
        return false;
    }

    std::vector<std::string> lines;
    std::string line;
    bool bypass_effect_check = false;
    bool bypass_depth_check = false;

    while (std::getline(infile, line)) {
        if (!line.empty() && line.back() == '\r') {
            line.pop_back();
        }
        if (line.find("HoYoShade_BypassEffectCheck=1") != std::string::npos) {
            bypass_effect_check = true;
        }
        if (line.find("HoYoShade_BypassDepthCheck=1") != std::string::npos) {
            bypass_depth_check = true;
        }
        lines.push_back(line);
    }
    infile.close();

    std::string rootDirStr = rootDir.u8string();
#ifdef _WIN32
    std::replace(rootDirStr.begin(), rootDirStr.end(), '/', '\\');
    if (!rootDirStr.empty() && rootDirStr.back() != '\\') {
        rootDirStr += '\\';
    }
    const std::string sep = "\\";
#else
    std::replace(rootDirStr.begin(), rootDirStr.end(), '\\', '/');
    if (!rootDirStr.empty() && rootDirStr.back() != '/') {
        rootDirStr += '/';
    }
    const std::string sep = "/";
#endif

    const std::string keys[] = {
        "AddonPath=",
        "EffectSearchPaths=",
        "TextureSearchPaths=",
        "PresetPath=",
        "SavePath=",
        "EditorFont=",
        "Font=",
        "LatinFont="
    };

    const std::string default_rel_paths[] = {
        "reshade-shaders" + sep + "Addons" + sep,
        "reshade-shaders" + sep + "Shaders" + sep + "**",
        "reshade-shaders" + sep + "Textures" + sep + "**",
        "Presets" + sep + "Mod OFF.ini",
        "ScreenShot" + sep,
        "InjectResource" + sep + "Fonts" + sep + "MiSans-Bold.ttf",
        "InjectResource" + sep + "Fonts" + sep + "MiSans-Bold.ttf",
        "InjectResource" + sep + "Fonts" + sep + "MiSans-Bold.ttf"
    };

    const int key_count = sizeof(keys) / sizeof(keys[0]);
    bool changed = false;

    for (auto& l : lines) {
        // 1. Path fixing logic (EffectSearchPaths, TextureSearchPaths, etc.)
        if (!bypass_effect_check) {
            for (int i = 0; i < key_count; ++i) {
                if (l.find(keys[i]) == 0) {
                    std::string val = l.substr(keys[i].length());
                    std::string val_trimmed = trim_copy(val);

                    bool need_fix = false;
                    if (val.find(rootDirStr) != 0) {
                        need_fix = true;
                    } else if (i == 1 || i == 2) {
                        const std::string wild = sep + "**";
                        if (!ends_with(val_trimmed, wild)) {
                            need_fix = true;
                        }
                    }

                    if (need_fix) {
                        l = keys[i] + rootDirStr + default_rel_paths[i];
                        changed = true;
                    }
                    break;
                }
            }
        }

        // 2. Depth check fixing logic (PreprocessorDefinitions)
        if (!bypass_depth_check) {
            if (l.find("PreprocessorDefinitions=") == 0) {
                std::string updated = update_preprocessor_definitions(l);
                if (updated != l) {
                    l = updated;
                    changed = true;
                }
            }
        }
    }

    if (changed) {
        std::ofstream outfile(targetIni, std::ios::binary | std::ios::trunc);
        if (!outfile.is_open()) {
            std::cerr << "Error: Unable to open target ReShade.ini for writing: " << targetIni.u8string() << std::endl;
            return false;
        }

        for (const auto& l : lines) {
#ifdef _WIN32
            outfile << l << "\r\n";
#else
            outfile << l << "\n";
#endif
        }
        outfile.close();
        std::cout << "ReShade.ini in target directory updated." << std::endl;
    } else {
        std::cout << "ReShade.ini in target directory is already up-to-date." << std::endl;
    }

    return true;
}

#ifdef _WIN32
int wmain(int argc, wchar_t* argv[]) {
#else
int main(int argc, char* argv[]) {
#endif
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

    if (argc >= 2) {
        // Mode 2: Target process root directory parameter provided
        std::filesystem::path targetDir(argv[1]);
        if (!maintain_target_reshade_ini(rootDir, targetDir, launcherDir)) {
            return 1;
        }
        return 0;
    } else {
        // Mode 1: Default to maintaining root ReShade.ini
        if (!build_root_reshade_ini(rootDir, launcherDir)) {
            return 1;
        }
        return 0;
    }
}
