#include <iostream>
#include <fstream>
#include <string>
#include <map>
#include <vector>
#include <filesystem>
#include <windows.h>
#include <shlobj.h>

#pragma comment(lib, "shell32.lib")
#pragma comment(lib, "advapi32.lib")

class HoYoShadeLauncher {
private:
    std::map<std::string, std::string> languageStrings;
    std::string currentLanguage;
    std::string launcherPath;
    std::string languageDir;
    std::string settingsFile;
    
public:
    HoYoShadeLauncher() {
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
        
        std::ifstream file(filePath);
        if (!file.is_open()) {
            filePath = languageDir + "\\English.txt";
            file.open(filePath);
        }
        
        if (file.is_open()) {
            std::string line;
            while (std::getline(file, line)) {
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
        SetConsoleTitleA(getString("MISSING_FILES_TITLE").c_str());
        
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
        SetConsoleTitleA(getString("FIRST_TIME_TITLE").c_str());
        
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
        SetConsoleTitleA(getString("TITLE").c_str());
        
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
    
    void performInjection(const std::string& target) {
        system("cls");
        std::cout << getString("INJECTION_TARGET") << " " << target << std::endl << std::endl;
        std::cout << getString("INJECTOR_STARTED") << std::endl;
        std::cout << getString("WRONG_TARGET_INFO") << std::endl << std::endl;
        std::cout << getString("IMPORTANT_LAUNCHER") << std::endl;
        std::cout << getString("NO_DIRECT_LAUNCH") << std::endl << std::endl;
        
        std::string command = "start \"\" /wait /b \"" + launcherPath + "\\inject.exe\" " + target;
        system(command.c_str());
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
                    std::filesystem::remove(iniPath);
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
                    std::cout << "Beta client injection list - Not implemented yet" << std::endl;
                    system("pause");
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
                    showLanguageSettings();
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