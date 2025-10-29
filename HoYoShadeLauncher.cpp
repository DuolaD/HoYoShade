#include <iostream>
#include <fstream>
#include <string>
#include <map>
#include <limits>
#include <vector>
#include <filesystem>
#include <windows.h>
#include <shlobj.h>
#include <cstdio>

#pragma comment(lib, "shell32.lib")
#pragma comment(lib, "advapi32.lib")

class HoYoShadeLauncher {
private:
    std::map<std::string, std::string> languageStrings;
    std::string currentLanguage;
    std::string launcherPath;
    std::string languageDir;
    std::string settingsFile;
    
    void openURL(const std::string& url) {
        ShellExecuteA(NULL, "open", url.c_str(), NULL, NULL, SW_SHOWNORMAL);
    }
    
    // Helper function to convert UTF-8 string to wide string
    std::wstring utf8ToWide(const std::string& utf8str) {
        if (utf8str.empty()) return std::wstring();
        
        int size_needed = MultiByteToWideChar(CP_UTF8, 0, &utf8str[0], (int)utf8str.size(), NULL, 0);
        std::wstring wstrTo(size_needed, 0);
        MultiByteToWideChar(CP_UTF8, 0, &utf8str[0], (int)utf8str.size(), &wstrTo[0], size_needed);
        return wstrTo;
    }
    
    // Helper function to set console title with UTF-8 support
    void setConsoleTitle(const std::string& title) {
        std::wstring wideTitle = utf8ToWide(title);
        SetConsoleTitleW(wideTitle.c_str());
    }
    
public:
    HoYoShadeLauncher() {
        // 设置控制台编码为UTF-8
        SetConsoleOutputCP(CP_UTF8);
        SetConsoleCP(CP_UTF8);
        
        char buffer[MAX_PATH];
        GetModuleFileNameA(NULL, buffer, MAX_PATH);
        launcherPath = std::filesystem::path(buffer).parent_path().string();
        languageDir = launcherPath + "\\LauncherResource\\Language";
        settingsFile = languageDir + "\\settings.txt";
        
        std::filesystem::create_directories(languageDir);
        initializeLanguage();
    }
    
    void initializeLanguage() {
        if (loadLanguageSettings()) {
            loadLanguageFile(currentLanguage);
        } else {
            detectSystemLanguageAndPrompt();
        }
    }
    
    bool loadLanguageSettings() {
        std::ifstream file(settingsFile);
        if (file.is_open()) {
            std::getline(file, currentLanguage);
            file.close();
            return !currentLanguage.empty();
        }
        return false;
    }
    
    void saveLanguageSettings(const std::string& language) {
        std::ofstream file(settingsFile);
        if (file.is_open()) {
            file << language;
            file.close();
            currentLanguage = language;
        }
    }
    
    void detectSystemLanguageAndPrompt() {
        LANGID langId = GetSystemDefaultUILanguage();
        WORD primaryLang = PRIMARYLANGID(langId);
        
        std::string detectedLang = "English";
        if (primaryLang == LANG_CHINESE) {
            WORD subLang = SUBLANGID(langId);
            if (subLang == SUBLANG_CHINESE_TRADITIONAL || 
                subLang == SUBLANG_CHINESE_HONGKONG || 
                subLang == SUBLANG_CHINESE_MACAU) {
                detectedLang = "zh-Hant";
            } else {
                detectedLang = "zh-Hans";
            }
        }
        
        loadLanguageFile(detectedLang);
        
        system("cls");
        std::cout << getString("SYSTEM_LANGUAGE_DETECTED") << ": " << detectedLang << std::endl;
        std::cout << getString("SELECT_PREFERRED_LANGUAGE") << std::endl;
        std::cout << getString("LANGUAGE_OPTION_1") << std::endl;
        std::cout << getString("LANGUAGE_OPTION_2") << std::endl;
        std::cout << getString("LANGUAGE_OPTION_3") << std::endl;
        
        int choice;
        std::cin >> choice;
        
        switch (choice) {
            case 1:
                currentLanguage = "zh-Hans";
                break;
            case 2:
                currentLanguage = "zh-Hant";
                break;
            case 3:
                currentLanguage = "English";
                break;
            default:
                currentLanguage = detectedLang;
                break;
        }
        
        saveLanguageSettings(currentLanguage);
        loadLanguageFile(currentLanguage);
        
        std::cout << getString("LANGUAGE_SAVED") << std::endl;
        system("pause");
    }
    
    void loadLanguageFile(const std::string& language) {
        languageStrings.clear();
        std::string filePath = languageDir + "\\" + language + ".txt";
        
        std::ifstream file(filePath, std::ios::binary);
        if (!file.is_open()) {
            filePath = languageDir + "\\English.txt";
            file.open(filePath, std::ios::binary);
        }
        
        if (file.is_open()) {
            std::string line;
            while (std::getline(file, line)) {
                // 移除可能的BOM标记
                if (!line.empty() && line[0] == '\xEF' && line.size() >= 3) {
                    if (line[1] == '\xBB' && line[2] == '\xBF') {
                        line = line.substr(3);
                    }
                }
                
                // 移除行尾的回车符
                if (!line.empty() && line.back() == '\r') {
                    line.pop_back();
                }
                
                if (line.empty() || line[0] == '#') continue;
                
                size_t pos = line.find('=');
                if (pos != std::string::npos) {
                    std::string key = line.substr(0, pos);
                    std::string value = line.substr(pos + 1);
                    languageStrings[key] = value;
                }
            }
            file.close();
        }
    }
    
    std::string getString(const std::string& key) {
        auto it = languageStrings.find(key);
        if (it != languageStrings.end()) {
            return it->second;
        }
        return key;
    }
    
    bool checkAdminPrivileges() {
        BOOL isAdmin = FALSE;
        PSID adminGroup = NULL;
        
        SID_IDENTIFIER_AUTHORITY ntAuthority = SECURITY_NT_AUTHORITY;
        if (AllocateAndInitializeSid(&ntAuthority, 2, SECURITY_BUILTIN_DOMAIN_RID,
                                   DOMAIN_ALIAS_RID_ADMINS, 0, 0, 0, 0, 0, 0, &adminGroup)) {
            CheckTokenMembership(NULL, adminGroup, &isAdmin);
            FreeSid(adminGroup);
        }
        
        return isAdmin == TRUE;
    }
    
    void requestAdminPrivileges() {
        char exePath[MAX_PATH];
        GetModuleFileNameA(NULL, exePath, MAX_PATH);
        
        SHELLEXECUTEINFOA sei = { sizeof(sei) };
        sei.lpVerb = "runas";
        sei.lpFile = exePath;
        sei.hwnd = NULL;
        sei.nShow = SW_NORMAL;
        
        if (ShellExecuteExA(&sei)) {
            exit(0);
        }
    }
    
    bool checkRequiredFiles() {
        std::vector<std::string> requiredFiles = {
            "inject.exe",
            "ReShade64.dll",
            "InjectResource",
            "LauncherResource",
            "reshade-shaders",
            "Presets",
            "LauncherResource\\INIBuild.exe",
            "InjectResource\\Fonts\\MiSans-Bold.ttf"
        };
        
        for (const auto& file : requiredFiles) {
            std::string fullPath = launcherPath + "\\" + file;
            if (!std::filesystem::exists(fullPath)) {
                return false;
            }
        }
        return true;
    }
    
    void showMissingFilesError() {
        system("cls");
        setConsoleTitle(getString("MISSING_FILES_TITLE"));
        
        std::cout << getString("MISSING_FILES_DETECTED") << std::endl << std::endl;
        std::cout << getString("POSSIBLE_REASONS") << std::endl;
        std::cout << getString("REASON_1") << std::endl;
        std::cout << getString("REASON_2") << std::endl;
        std::cout << getString("REASON_3") << std::endl;
        std::cout << getString("REASON_4") << std::endl << std::endl;
        std::cout << getString("EXIT_MESSAGE") << std::endl;
        std::cout << getString("REDOWNLOAD_MESSAGE") << std::endl;
        
        system("pause");
        exit(1);
    }
    
    void checkAndCreateReshadeIni() {
        std::string iniPath = launcherPath + "\\ReShade.ini";
        if (!std::filesystem::exists(iniPath)) {
            std::string command = "\"" + launcherPath + "\\LauncherResource\\INIBuild.exe\"";
            system(command.c_str());
            showFirstTimeMessage();
        }
    }
    
    void showFirstTimeMessage() {
        system("cls");
        setConsoleTitle(getString("FIRST_TIME_TITLE"));
        
        std::cout << getString("CONGRATULATIONS") << std::endl << std::endl;
        std::cout << getString("FIRST_TIME_DETECTED") << std::endl << std::endl;
        std::cout << getString("FIRST_TIME_INFO") << std::endl;
        std::cout << getString("AUTO_COPY_INFO") << std::endl << std::endl;
        std::cout << getString("PREVIOUS_USE_WARNING") << std::endl;
        std::cout << getString("DELETE_FILES_INFO") << std::endl << std::endl;
        std::cout << getString("EXAMPLES") << std::endl;
        std::cout << getString("EXAMPLE_1") << std::endl;
        std::cout << getString("EXAMPLE_2") << std::endl << std::endl;
        std::cout << getString("FIND_DIRECTORY") << std::endl;
        std::cout << getString("HOYOPLAY_INFO") << std::endl;
        std::cout << getString("OPEN_DIRECTORY") << std::endl;
        std::cout << getString("STARWARD_INFO") << std::endl;
        std::cout << getString("CLICK_DIRECTORY") << std::endl << std::endl;
        std::cout << getString("CONFUSED_INFO") << std::endl;
        
        system("pause");
    }
    
    void showMainMenu() {
        system("cls");
        setConsoleTitle(getString("TITLE"));
        
        std::cout << getString("WELCOME") << std::endl;
        std::cout << getString("VERSION") << std::endl;
        std::cout << getString("DEVELOPER") << std::endl;
        std::cout << getString("POWERED_BY") << std::endl << std::endl;
        
        std::cout << getString("CURRENT_INJECTION_LIST") << std::endl;
        std::cout << getString("BETA_SUPPORT_NOTE") << std::endl << std::endl;
        
        std::cout << getString("MOD_PURPOSE") << std::endl;
        std::cout << getString("USER_AGREEMENT_LINK") << std::endl << std::endl;
        
        std::cout << getString("BETA_INJECTION_NOTE") << std::endl << std::endl;
        
        std::cout << "1. " << getString("OPTION_1") << std::endl;
        std::cout << "2. " << getString("OPTION_2") << std::endl;
        std::cout << "3. " << getString("OPTION_3") << std::endl;
        std::cout << "4. " << getString("OPTION_4") << std::endl;
        std::cout << "5. " << getString("OPTION_5") << std::endl;
        std::cout << "6. " << getString("OPTION_6") << std::endl;
        std::cout << "7. " << getString("OPTION_7") << std::endl;
        std::cout << "8. " << getString("OPTION_8") << std::endl;
        std::cout << "9. " << getString("OPTION_9") << std::endl;
        std::cout << "10. " << getString("OPTION_10") << std::endl;
        std::cout << "11. " << getString("OPTION_11") << std::endl;
    }

    void showAboutHoYoShade() {
        system("cls");
        setConsoleTitle(getString("TITLE"));
        std::cout << getString("WELCOME") << std::endl << std::endl;
        std::cout << getString("VERSION") << std::endl;
        std::cout << getString("DEVELOPER") << std::endl;
        std::cout << getString("POWERED_BY") << std::endl << std::endl;

        std::cout << getString("ABOUT_SLOGAN") << std::endl << std::endl;
        std::cout << getString("ABOUT_DESC_1") << std::endl;
        std::cout << getString("ABOUT_DESC_2") << std::endl << std::endl;
        std::cout << getString("ABOUT_WARNING_BUY") << std::endl << std::endl;
        std::cout << getString("ABOUT_THANKS_CYTEAM") << std::endl;
        std::cout << getString("ABOUT_THANKS_CLOUDFLARE") << std::endl << std::endl;
        std::cout << getString("PRESS_ANY_KEY") << std::endl;
        system("pause");
    }

    void showDeveloperOptions() {
        system("cls");
        setConsoleTitle(getString("TITLE"));
        std::cout << getString("WELCOME") << std::endl;
        std::cout << std::endl << getString("VERSION") << std::endl;
        std::cout << getString("DEVELOPER") << std::endl;
        std::cout << getString("POWERED_BY") << std::endl << std::endl;

        std::cout << getString("OTHER_DEV_WARNING_1") << std::endl;
        std::cout << getString("OTHER_DEV_WARNING_2") << std::endl << std::endl;

        std::cout << "1. " << getString("DEV_OPTION_1") << std::endl;
        std::cout << "2. " << getString("DEV_OPTION_2") << std::endl;
        std::cout << "3. " << getString("DEV_OPTION_3") << std::endl;
        std::cout << "4. " << getString("DEV_OPTION_4") << std::endl;

        std::cout << std::endl << getString("INPUT_CHOICE") << std::endl;
        int choice;
        std::cin >> choice;
        switch (choice) {
            case 1:
                showCustomizeInject();
                break;
            case 2:
                return; // 回主菜单
            case 3:
                showOtherInterfaces();
                break;
            case 4:
                exit(0);
            default:
                std::cout << std::endl << getString("INPUT_ERROR") << std::endl;
                Sleep(1500);
                showDeveloperOptions();
                break;
        }
    }

    void showCustomizeInject() {
        system("cls");
        setConsoleTitle(getString("TITLE"));
        std::cout << getString("WELCOME") << std::endl;
        std::cout << std::endl << getString("VERSION") << std::endl;
        std::cout << getString("DEVELOPER") << std::endl;
        std::cout << getString("POWERED_BY") << std::endl << std::endl;

        std::cout << getString("CUSTOMIZE_TITLE") << std::endl << std::endl;
        std::cout << getString("CUSTOMIZE_WARN_1") << std::endl;
        std::cout << getString("CUSTOMIZE_WARN_2") << std::endl << std::endl;
        std::cout << getString("CUSTOMIZE_USAGE_1") << std::endl;
        std::cout << getString("CUSTOMIZE_USAGE_2") << std::endl;
        std::cout << getString("CUSTOMIZE_USAGE_3") << std::endl << std::endl;

        std::cout << getString("CUSTOMIZE_PROMPT");
        std::string content;
        std::cout << getString("CUSTOMIZE_PROMPT");
        std::getline(std::cin, content);
        std::getline(std::cin, content);
        std::cout << std::endl;
        if (content == "\\exit") {
            showDeveloperOptions();
            return;
        }

        std::cout << getString("CUSTOMIZE_SELECTED") << content << ".exe" << std::endl;
        std::cout << getString("CUSTOMIZE_ADMON_1") << std::endl;
        std::cout << getString("CUSTOMIZE_ADMON_2") << std::endl << std::endl;

        std::string command = "start \"\" /wait /b \"" + launcherPath + "\\inject.exe\" " + content + ".exe";
        system(command.c_str());
        exit(0);
    }

    void showOtherInterfaces() {
        system("cls");
        setConsoleTitle(getString("TITLE"));
        
        std::cout << getString("WELCOME") << std::endl;
        std::cout << std::endl << getString("VERSION") << std::endl;
        std::cout << getString("DEVELOPER") << std::endl;
        std::cout << getString("POWERED_BY") << std::endl << std::endl;

        std::cout << getString("OTHER_INFO_UPDATE") << std::endl;
        std::cout << getString("OTHER_DEV_WARNING_1") << std::endl;
        std::cout << getString("OTHER_DEV_WARNING_2") << std::endl << std::endl;
        std::cout << getString("CYTEAM_NOTE") << std::endl;
        std::cout << getString("CYTEAM_THANKS") << std::endl << std::endl;

        std::cout << "[1]" << getString("OTHER_OPTION_1") << std::endl;
        std::cout << "[2]" << getString("OTHER_OPTION_2") << std::endl;
        std::cout << "[3]" << getString("OTHER_OPTION_3") << std::endl;
        std::cout << "[4]" << getString("OTHER_OPTION_4") << std::endl;
        std::cout << "[5]" << getString("OTHER_OPTION_5") << std::endl;
        std::cout << "[6]" << getString("OTHER_OPTION_6") << std::endl;
        std::cout << "[7]" << getString("OTHER_OPTION_7") << std::endl;
        std::cout << "[8]" << getString("OTHER_OPTION_8") << std::endl;

        std::cout << std::endl << getString("OTHER_PROMPT") << std::endl;
        int choice;
        std::cin >> choice;
        if (choice == 1) {
            openURL("https://github.com/DuolaD/HoYoShade/");
            showOtherInterfaces();
        } else if (choice == 2) {
            openURL("https://d.cyteam.cn/");
            showOtherInterfaces();
        } else if (choice == 3) {
            if (currentLanguage == "zh-Hans") {
                openURL("https://github.com/DuolaD/HoYoShade/blob/V2.X.X-Stable/Readme.Chinese_Simplified.md#%E3%80%A2-%E8%B5%9E%E5%8A%A9");
            } else if (currentLanguage == "zh-Hant") {
                openURL("https://github.com/DuolaD/HoYoShade/blob/V2.X.X-Stable/Readme.Chinese_Traditional.md#%E3%80%A2-%E8%B4%8A%E5%8A%A9");
            } else {
                openURL("https://github.com/DuolaD/HoYoShade/blob/V2.X.X-Stable/Readme.md#%E3%80%A2-Donate");
            }
            showOtherInterfaces();
        } else if (choice == 4) {
            if (currentLanguage == "zh-Hans") {
                openURL("https://github.com/DuolaD/HoYoShade/blob/V2.X.X-Stable/Readme.Chinese_Simplified.md#%E3%80%A2-%E8%81%94%E7%B3%BB%E6%88%91");
            } else if (currentLanguage == "zh-Hant") {
                openURL("https://github.com/DuolaD/HoYoShade/blob/V2.X.X-Stable/Readme.Chinese_Traditional.md#%E3%80%A2-%E8%81%AF%E7%B9%AB%E6%88%91");
            } else {
                openURL("https://github.com/DuolaD/HoYoShade/blob/V2.X.X-Stable/Readme.md#%E3%80%A2-Contant-Me");
            }
            showOtherInterfaces();
        } else if (choice == 5) {
            showAboutHoYoShade();
            showOtherInterfaces();
        } else if (choice == 6) {
            showDeveloperOptions();
        } else if (choice == 7) {
            return; // 返回主菜单
        } else if (choice == 8) {
            exit(0);
        } else {
            std::cout << std::endl << getString("INPUT_ERROR") << std::endl;
            Sleep(1500);
            showOtherInterfaces();
        }
    }
    
    void performInjection(const std::string& target) {
        system("cls");
        std::cout << getString("INJECTION_TARGET") << " " << target << std::endl << std::endl;
        
        // 显示特定客户端的详细提示信息
        if (target == "YuanShen.exe") {
            std::cout << getString("DEVKIT_CLIENT_WARNING") << std::endl << std::endl;
            std::cout << getString("BETA_CLIENT_LAUNCHER_REQUIRED") << std::endl;
            std::cout << getString("BETA_CLIENT_NO_DIRECT_LAUNCH") << std::endl;
            std::cout << getString("BETA_CLIENT_NO_LAUNCHER_WARNING") << std::endl;
            std::cout << getString("BETA_CLIENT_CLOSED_SOURCE") << std::endl;
            std::cout << getString("BETA_CLIENT_CONTACT_DEV") << std::endl << std::endl;
        } else if (target == "GenshinImpact.exe") {
            std::cout << getString("GENSHIN_GLOBAL_CLIENT_WARNING") << std::endl << std::endl;
            std::cout << getString("BETA_CLIENT_LAUNCHER_REQUIRED") << std::endl;
            std::cout << getString("BETA_CLIENT_NO_DIRECT_LAUNCH") << std::endl;
            std::cout << getString("BETA_CLIENT_NO_LAUNCHER_WARNING") << std::endl;
            std::cout << getString("BETA_CLIENT_CLOSED_SOURCE") << std::endl;
            std::cout << getString("BETA_CLIENT_CONTACT_DEV") << std::endl << std::endl;
        } else if (target == "BH3.exe") {
            std::cout << getString("BH3_CLIENT_WARNING") << std::endl << std::endl;
            std::cout << getString("BETA_CLIENT_LAUNCHER_REQUIRED") << std::endl;
            std::cout << getString("BETA_CLIENT_NO_DIRECT_LAUNCH") << std::endl;
            std::cout << getString("BETA_CLIENT_CLOSED_SOURCE") << std::endl;
            std::cout << getString("BETA_CLIENT_CONTACT_DEV") << std::endl << std::endl;
        } else if (target == "StarRail.exe") {
            std::cout << getString("STARRAIL_CLIENT_WARNING") << std::endl << std::endl;
            std::cout << getString("BETA_CLIENT_LAUNCHER_REQUIRED") << std::endl;
            std::cout << getString("BETA_CLIENT_NO_DIRECT_LAUNCH") << std::endl;
            std::cout << getString("BETA_CLIENT_NO_LAUNCHER_WARNING") << std::endl;
            std::cout << getString("BETA_CLIENT_CLOSED_SOURCE") << std::endl;
            std::cout << getString("BETA_CLIENT_CONTACT_DEV") << std::endl << std::endl;
        } else if (target == "ZenlessZoneZero.exe") {
            std::cout << getString("ZZZ_PUBLIC_CLIENT_WARNING") << std::endl << std::endl;
            std::cout << getString("BETA_CLIENT_LAUNCHER_REQUIRED") << std::endl;
            std::cout << getString("BETA_CLIENT_NO_DIRECT_LAUNCH") << std::endl << std::endl;
            std::cout << getString("ZZZ_PUBLIC_CLIENT_NOTE") << std::endl;
            std::cout << getString("ZZZ_PUBLIC_CLIENT_REDIRECT") << std::endl << std::endl;
        }
        
        std::cout << getString("INJECTOR_STARTED") << std::endl;
        std::cout << getString("WRONG_TARGET_INFO") << std::endl << std::endl;
        std::cout << getString("IMPORTANT_LAUNCHER") << std::endl;
        std::cout << getString("NO_DIRECT_LAUNCH") << std::endl << std::endl;
        
        std::string command = "start \"\" /wait /b \"" + launcherPath + "\\inject.exe\" " + target;
        system(command.c_str());
    }
    
    void showBetaClientMenu() {
        system("cls");
        setConsoleTitle(getString("TITLE"));
        
        std::cout << getString("WELCOME") << std::endl;
        std::cout << getString("VERSION") << std::endl;
        std::cout << getString("DEVELOPER") << std::endl;
        std::cout << getString("POWERED_BY") << std::endl << std::endl;
        
        std::cout << getString("BETA_INJECTION_LIST_TITLE") << std::endl;
        std::cout << getString("BETA_INJECTION_LIST_NOTE") << std::endl << std::endl;
        
        std::cout << getString("MOD_PURPOSE") << std::endl;
        std::cout << getString("USER_AGREEMENT_LINK") << std::endl << std::endl;
        
        std::cout << getString("BETA_CLIENT_ONLY_NOTE") << std::endl << std::endl;
        
        std::cout << getString("BETA_CLIENT_NOT_LISTED_INFO") << std::endl;
        std::cout << getString("BETA_CLIENT_REASON_1") << std::endl;
        std::cout << getString("BETA_CLIENT_REASON_2") << std::endl;
        std::cout << getString("BETA_CLIENT_CONTACT_INFO") << std::endl << std::endl;
        
        std::cout << getString("BETA_OPTION_1") << std::endl;
        std::cout << getString("BETA_OPTION_2") << std::endl;
        std::cout << getString("BETA_OPTION_3") << std::endl;
        std::cout << getString("BETA_OPTION_4") << std::endl;
        std::cout << getString("BETA_OPTION_5") << std::endl;
        std::cout << getString("BETA_OPTION_6") << std::endl;
        std::cout << getString("BETA_OPTION_7") << std::endl;
        std::cout << getString("BETA_OPTION_8") << std::endl << std::endl;
        
        std::cout << getString("INPUT_CHOICE") << std::endl;
        
        int choice;
        std::cin >> choice;
        
        switch (choice) {
            case 1: {
                std::string iniPath = launcherPath + "\\ReShade.ini";
                remove(iniPath.c_str());
                std::string command = "\"" + launcherPath + "\\LauncherResource\\INIBuild.exe\"";
                system(command.c_str());
                break;
            }
            case 2:
                performBetaInjection("Genshin.exe", "DEVKIT_CLIENT_WARNING");
                break;
            case 3:
                performBetaInjection("ZZZ.exe", "ZZZ_BETA_CLIENT_WARNING");
                break;
            case 4:
                performBetaInjection("ZenlessZoneZeroBeta.exe", "ZZZ_BETA_CLIENT_WARNING");
                break;
            case 5:
                performBetaInjection("NexusAnima.exe", "");
                break;
            case 6:
                return; // 返回主菜单
            case 7:
                std::cout << "更多选项 - 尚未实现" << std::endl;
                system("pause");
                break;
            case 8:
                exit(0);
                break;
            default:
                std::cout << "输入错误" << std::endl;
                system("pause");
                break;
        }
    }
    
    void performBetaInjection(const std::string& target, const std::string& warningKey) {
        system("cls");
        
        std::cout << getString("INJECTION_TARGET_SELECTED") << target << std::endl;
        std::cout << getString("INJECTOR_STARTED") << std::endl;
        std::cout << getString("USE_LAUNCHER_TO_START") << std::endl;
        std::cout << getString("WRONG_TARGET_INSTRUCTION") << std::endl << std::endl;
        
        if (!warningKey.empty()) {
            std::cout << getString(warningKey) << std::endl << std::endl;
        }
        
        std::cout << getString("BETA_CLIENT_LAUNCHER_REQUIRED") << std::endl;
        std::cout << getString("BETA_CLIENT_NO_DIRECT_LAUNCH") << std::endl;
        std::cout << getString("BETA_CLIENT_NO_LAUNCHER_WARNING") << std::endl;
        std::cout << getString("BETA_CLIENT_PATCH_REQUIRED") << std::endl;
        std::cout << getString("BETA_CLIENT_CLOSED_SOURCE") << std::endl;
        std::cout << getString("BETA_CLIENT_CONTACT_DEV") << std::endl << std::endl;
        
        std::string command = "start \"\" /wait /b \"" + launcherPath + "\\inject.exe\" " + target;
        system(command.c_str());
        exit(0);
    }
    
    void showLanguageSettings() {
        system("cls");
        std::cout << getString("LANGUAGE_SETTINGS") << std::endl << std::endl;
        std::cout << getString("CURRENT_LANGUAGE") << std::endl << std::endl;
        std::cout << getString("SELECT_LANGUAGE") << std::endl;
        std::cout << "1. " << getString("LANGUAGE_OPTION_1") << std::endl;
        std::cout << "2. " << getString("LANGUAGE_OPTION_2") << std::endl;
        std::cout << "3. " << getString("LANGUAGE_OPTION_3") << std::endl;
        std::cout << "4. " << getString("BACK_TO_MENU") << std::endl;
        
        int choice;
        std::cin >> choice;
        
        switch (choice) {
            case 1:
                saveLanguageSettings("zh-Hans");
                loadLanguageFile("zh-Hans");
                std::cout << getString("LANGUAGE_CHANGED") << std::endl;
                break;
            case 2:
                saveLanguageSettings("zh-Hant");
                loadLanguageFile("zh-Hant");
                std::cout << getString("LANGUAGE_CHANGED") << std::endl;
                break;
            case 3:
                saveLanguageSettings("English");
                loadLanguageFile("English");
                std::cout << getString("LANGUAGE_CHANGED") << std::endl;
                break;
            case 4:
                return;
        }
        
        if (choice >= 1 && choice <= 3) {
            std::cout << getString("RESTART_REQUIRED") << std::endl;
            system("pause");
        }
    }
    
    void run() {
        // 设置控制台编码为UTF-8以支持中文字符显示
        SetConsoleCP(CP_UTF8);
        SetConsoleOutputCP(CP_UTF8);
        
        // 设置控制台模式以支持UTF-8输出
        HANDLE hOut = GetStdHandle(STD_OUTPUT_HANDLE);
        DWORD dwMode = 0;
        GetConsoleMode(hOut, &dwMode);
        dwMode |= ENABLE_VIRTUAL_TERMINAL_PROCESSING;
        SetConsoleMode(hOut, dwMode);
        
        if (!checkAdminPrivileges()) {
            requestAdminPrivileges();
            return;
        }
        
        if (!checkRequiredFiles()) {
            showMissingFilesError();
            return;
        }
        
        checkAndCreateReshadeIni();
        
        while (true) {
            showMainMenu();
            
            int choice;
            std::cin >> choice;
            
            switch (choice) {
                case 1: {
                    std::string iniPath = launcherPath + "\\ReShade.ini";
                    remove(iniPath.c_str());
                    std::string command = "\"" + launcherPath + "\\LauncherResource\\INIBuild.exe\"";
                    system(command.c_str());
                    break;
                }
                case 2:
                    performInjection("YuanShen.exe");
                    break;
                case 3:
                    performInjection("GenshinImpact.exe");
                    break;
                case 4:
                    performInjection("BH3.exe");
                    break;
                case 5:
                    performInjection("StarRail.exe");
                    break;
                case 6:
                    performInjection("ZenlessZoneZero.exe");
                    break;
                case 7:
                    showBetaClientMenu();
                    break;
                case 8:
                    std::cout << "Link other programs - Not implemented yet" << std::endl;
                    system("pause");
                    break;
                case 9:
                    std::cout << "Link Starward launcher - Not implemented yet" << std::endl;
                    system("pause");
                    break;
                case 10:
                    showOtherInterfaces();
                    break;
                case 11:
                    exit(0);
                    break;
                default:
                    std::cout << getString("INPUT_ERROR") << std::endl;
                    system("pause");
                    break;
            }
        }
    }
};

int main() {
    HoYoShadeLauncher launcher;
    launcher.run();
    return 0;
}
