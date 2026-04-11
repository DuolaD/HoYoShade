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

// Get the directory where the executable file is located
std::string get_selfpath() {
    char buff[FILENAME_MAX];
#ifdef _WIN32
    GetModuleFileNameA(NULL, buff, FILENAME_MAX);
#else
    ssize_t len = ::readlink("/proc/self/exe", buff, sizeof(buff)-1);
    if (len != -1) {
        buff[len] = '\0';
    }
#endif
    std::string::size_type pos = std::string(buff).find_last_of("\\/");
    return std::string(buff).substr(0, pos);
}

// GB2312 to UTF-8
bool ConvertGB2312ToUTF8(const std::string& gb2312Str, std::string& utf8Str) {
#ifdef _WIN32
    int wideLen = MultiByteToWideChar(936, 0, gb2312Str.c_str(), -1, NULL, 0);
    if (wideLen <= 0) return false;
    std::vector<wchar_t> wideStr(wideLen);
    MultiByteToWideChar(936, 0, gb2312Str.c_str(), -1, wideStr.data(), wideLen);

    int utf8Len = WideCharToMultiByte(CP_UTF8, 0, wideStr.data(), -1, NULL, 0, NULL, NULL);
    if (utf8Len <= 0) return false;
    std::vector<char> utf8Buffer(utf8Len);
    WideCharToMultiByte(CP_UTF8, 0, wideStr.data(), -1, utf8Buffer.data(), utf8Len, NULL, NULL);

    utf8Str = std::string(utf8Buffer.data());
    return true;
#else
    // Non-Windows platforms are not currently supported
    utf8Str = gb2312Str;
    return true;
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

bool try_copy_cstr_seh(const char* src, char* dst, const size_t dstSize, size_t& outLen) {
    if (src == nullptr || dst == nullptr || dstSize == 0) {
        return false;
    }

    __try {
        for (size_t i = 0; i + 1 < dstSize; ++i) {
            const unsigned char c = static_cast<unsigned char>(src[i]);
            dst[i] = static_cast<char>(c);
            if (c == '\0') {
                outLen = i;
                return true;
            }
        }
    }
    __except (EXCEPTION_EXECUTE_HANDLER) {
        return false;
    }

    dst[dstSize - 1] = '\0';
    outLen = dstSize - 1;
    return true;
}

bool looks_like_text(const char* s, const size_t len) {
    if (s == nullptr || len == 0) {
        return false;
    }

    size_t printable = 0;
    for (size_t i = 0; i < len; ++i) {
        const unsigned char c = static_cast<unsigned char>(s[i]);
        if (c == '\t' || c == '\r' || c == '\n' || (c >= 0x20 && c < 0x7F)) {
            ++printable;
        }
    }

    return printable * 100 >= len * 80;
}

bool get_exported_string(const std::filesystem::path& addonPath, const char* exportName, std::string& outValue) {
    const HMODULE module = LoadLibraryExW(addonPath.wstring().c_str(), nullptr, DONT_RESOLVE_DLL_REFERENCES);
    if (module == nullptr) {
        return false;
    }

    bool ok = false;
    const FARPROC symbol = GetProcAddress(module, exportName);
    if (symbol != nullptr) {
        char buffer[2048] = {};
        size_t length = 0;

        // 1) ReShade/common form: export is 'const char *NAME' so symbol points to a pointer.
        const char* value = try_read_exported_cstr_ptr(symbol);
        if (value != nullptr && try_copy_cstr_seh(value, buffer, sizeof(buffer), length) && looks_like_text(buffer, length)) {
            const std::string trimmed = trim_copy(std::string(buffer, length));
            if (!trimmed.empty()) {
                outValue = trimmed;
                ok = true;
            }
        }

        // 2) Compatibility form: export may be 'const char NAME[]', so symbol itself is c-string address.
        if (!ok) {
            const char* direct = reinterpret_cast<const char*>(symbol);
            if (try_copy_cstr_seh(direct, buffer, sizeof(buffer), length) && looks_like_text(buffer, length)) {
                const std::string trimmed = trim_copy(std::string(buffer, length));
                if (!trimmed.empty()) {
                    outValue = trimmed;
                    ok = true;
                }
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

    LangAndCodePage* translation = nullptr;
    UINT translationSize = 0;
    std::wstring query;

    if (VerQueryValueW(buffer.data(), L"\\VarFileInfo\\Translation", reinterpret_cast<LPVOID*>(&translation), &translationSize) &&
        translationSize >= sizeof(LangAndCodePage)) {
        wchar_t subBlock[128] = {};
        swprintf_s(subBlock, L"\\StringFileInfo\\%04x%04x\\%s", translation[0].language, translation[0].codePage, fieldName);
        query = subBlock;
    } else {
        wchar_t subBlock[128] = {};
        swprintf_s(subBlock, L"\\StringFileInfo\\040904b0\\%s", fieldName);
        query = subBlock;
    }

    LPWSTR versionText = nullptr;
    UINT versionTextSize = 0;
    if (!VerQueryValueW(buffer.data(), query.c_str(), reinterpret_cast<LPVOID*>(&versionText), &versionTextSize) ||
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

bool get_file_version_string(const std::filesystem::path& addonPath, std::string& outValue) {
    return get_file_info_string(addonPath, L"ProductVersion", outValue);
}
#endif

std::string resolve_addon_label(const std::filesystem::path& addonPath) {
    std::string label;

#ifdef _WIN32
    if (get_exported_string(addonPath, "NAME", label)) {
        return label;
    }

    // ReShade uses ProductName as initial display name before export overrides.
    if (get_file_product_name(addonPath, label)) {
        return label;
    }

    if (get_exported_string(addonPath, "VERSION", label)) {
        return label;
    }

    if (get_file_version_string(addonPath, label)) {
        return label;
    }
#endif

    const std::string stem = trim_copy(addonPath.stem().u8string());
    return stem.empty() ? addonPath.filename().u8string() : stem;
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
    std::string a = launcherResourceDir;
    a = a.substr(0, a.find_last_of("\\/"));
    std::string filepath = a + "/ReShade.ini";
    std::filesystem::path addonsDir = std::filesystem::path(a) / "reshade-shaders" / "Addons";
    std::filesystem::path whitelistPath = std::filesystem::path(launcherResourceDir) / "AddonWhitelist.txt";
    const std::unordered_set<std::string> whitelist = load_addon_whitelist(whitelistPath);
    const std::string disabledAddonsValue = build_disabled_addons_value(addonsDir, whitelist);
    std::ofstream outfile(filepath);
    outfile << "# This is the ReShade configuration that generated by HoYoShade V3." << std::endl;
    outfile << "# You can check more information at https://github.com/DuolaD/HoYoShade" << std::endl;
    outfile << "" << std::endl;
    outfile << "[ADDON]" << std::endl;
    outfile << "AddonPath=" << a << "\\reshade-shaders\\Addons\\" << std::endl;
    outfile << "DisabledAddons=" << disabledAddonsValue << std::endl;
    outfile << "" << std::endl;
    outfile << "[DEPTH]" << std::endl;
    outfile << "DepthCopyAtClearIndex=0" << std::endl;
    outfile << "DepthCopyBeforeClears=0" << std::endl;
    outfile << "UseAspectRatioHeuristics=1" << std::endl;
    outfile << "OverlayCollapsed=" << std::endl;
    outfile << "[GENERAL]" << std::endl;
    outfile << "EffectSearchPaths=" << a << "\\reshade-shaders\\Shaders\\**" << std::endl;
    outfile << "PerformanceMode=0" << std::endl;
    outfile << "PreprocessorDefinitions=RESHADE_DEPTH_LINEARIZATION_FAR_PLANE=1000.0,RESHADE_DEPTH_INPUT_IS_UPSIDE_DOWN=1,RESHADE_DEPTH_INPUT_IS_REVERSED=1,RESHADE_DEPTH_INPUT_IS_LOGARITHMIC=0" << std::endl;
    outfile << "PresetPath=" << a << "\\Presets\\Mod OFF.ini" << std::endl;
    outfile << "PresetTransitionDelay=995" << std::endl;
    outfile << "SkipLoadingDisabledEffects=0" << std::endl;
    outfile << "TextureSearchPaths=" << a << "\\reshade-shaders\\Textures\\**" << std::endl;
    outfile << "" << std::endl;
    outfile << "[INPUT]" << std::endl;
    outfile << "ForceShortcutModifiers=1" << std::endl;
    outfile << "InputProcessing=2" << std::endl;
    outfile << "KeyEffects=189,0,0,0" << std::endl;
    outfile << "KeyNextPreset=0,0,0,0" << std::endl;
    outfile << "KeyOverlay=36,0,0,0" << std::endl;
    outfile << "KeyPerformanceMode=80,0,0,0" << std::endl;
    outfile << "KeyPreviousPreset=0,0,0,0" << std::endl;
    outfile << "KeyReload=187,0,0,0" << std::endl;
    outfile << "KeyScreenshot=44,0,0,0" << std::endl;
    outfile << "" << std::endl;
    outfile << "[OVERLAY]" << std::endl;
    outfile << "ClockFormat=0" << std::endl;
    outfile << "FPSPosition=1" << std::endl;
    outfile << "NoFontScaling=0" << std::endl;
    outfile << "SaveWindowState=0" << std::endl;
    outfile << "ShowClock=2" << std::endl;
    outfile << "ShowForceLoadEffectsButton=1" << std::endl;
    outfile << "ShowFPS=2" << std::endl;
    outfile << "ShowFrameTime=2" << std::endl;
    outfile << "ShowPresetName = 2" << std::endl;
    outfile << "ShowPresetTransitionMessage=1" << std::endl;
    outfile << "ShowScreenshotMessage=1" << std::endl;
    outfile << "TutorialProgress=0" << std::endl;
    outfile << "VariableListHeight=300.000000" << std::endl;
    outfile << "VariableListUseTabs=0" << std::endl;
    outfile << "Window=[Window][###home],Pos=8,,8,Size=447,,704,Collapsed=0,DockId=0x00000001,,0,[Window][###addons],Pos=8,,8,Size=447,,704,Collapsed=0,DockId=0x00000001,,2,[Window][###settings],Pos=8,,8,Size=447,,704,Collapsed=0,DockId=0x00000001,,3,[Window][###statistics],Pos=8,,8,Size=447,,704,Collapsed=0,DockId=0x00000001,,4,[Window][###log],Pos=8,,8,Size=447,,704,Collapsed=0,DockId=0x00000001,,5,[Window][###about],Pos=8,,8,Size=447,,704,Collapsed=0,DockId=0x00000001,,6,[Window][###editor],Collapsed=0,DockId=0x00000002,[Window][Viewport],Pos=0,,0,Size=1280,,720,Collapsed=0,[Window][ReGrade+],Pos=8,,8,Size=447,,704,Collapsed=0,DockId=0x00000001,,1,[Window][Debug##Default],Pos=60,,60,Size=400,,400,Collapsed=0" << std::endl;
    outfile << "" << std::endl;
    outfile << "[SCREENSHOT]" << std::endl;
    outfile << "ClearAlpha=1" << std::endl;
    outfile << "FileFormat=1" << std::endl;
    outfile << "FileNamingFormat=0" << std::endl;
    outfile << "JPEGQuality=100" << std::endl;
    outfile << "SaveBeforeShot=1" << std::endl;
    outfile << "SaveOverlayShot=1" << std::endl;
    outfile << "SavePath=" << a << "\\ScreenShot\\" << std::endl;
    outfile << "SavePresetFile=0" << std::endl;
    outfile << "" << std::endl;
    outfile << "[STYLE]" << std::endl;
    outfile << "Alpha=1.000000" << std::endl;
    outfile << "ChildRounding=0.000000" << std::endl;
    outfile << "ColFPSText=1.000000,1.000000,0.784314,1.000000" << std::endl;
    outfile << "EditorFont=" << a << "\\InjectResource\\Fonts\\MiSans-Bold.ttf" << std::endl;
    outfile << "EditorFontSize=17" << std::endl;
    outfile << "EditorStyleIndex=0" << std::endl;
    outfile << "Font=" << a << "\\InjectResource\\Fonts\\MiSans-Bold.ttf" << std::endl;
    outfile << "FontSize=17" << std::endl;
    outfile << "FPSScale=1.000000" << std::endl;
    outfile << "FrameRounding=0.000000" << std::endl;
    outfile << "GrabRounding=0.000000" << std::endl;
    outfile << "LatinFont=" << a << "\\InjectResource\\Fonts\\MiSans-Bold.ttf" << std::endl;
    outfile << "PopupRounding=0.000000" << std::endl;
    outfile << "ScrollbarRounding=0.000000" << std::endl;
    outfile << "StyleIndex=2" << std::endl;
    outfile << "TabRounding=4.000000" << std::endl;
    outfile << "WindowRounding=0.000000" << std::endl;
    outfile.close();

    // Perform encoding conversion
    std::ifstream input(filepath, std::ios::binary);
    if (input) {
        std::string gb2312Content((std::istreambuf_iterator<char>(input)), std::istreambuf_iterator<char>());
        input.close();
        std::string utf8Content;
        if (ConvertGB2312ToUTF8(gb2312Content, utf8Content)) {
            std::ofstream output(filepath, std::ios::binary | std::ios::trunc);
            if (output) {
                output.write(utf8Content.c_str(), utf8Content.size());
                output.close();
            }
        }
    }
    return 0;
}