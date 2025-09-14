/*
 * Copyright (C) 2014 Patrick Mours
 * SPDX-License-Identifier: BSD-3-Clause
 */

/*
 * Modify by GitHub@DuolaD
 * Copyright (C) 2025 DuolaD
 * SPDX-License-Identifier: BSD-3-Clause
 */

/*
* This source code is modded version. If you want to use the original version, please visit: https://github.com/crosire/reshade/blob/main/tools/injector.cpp
*/

/*
* Project:The butterfly of Hong Kong
*/

/*
* ⌈The butterfly of Hong Kong⌋ is a official ReShade injector-based injector. Depth development for all miHoYo/HoYoverse Corporation public/non-public game client.
* Developers: DuolaDStudio X ZelbertYQ X Ex_M
* Based on BSD-3-Clause license. 
* 
* Re-distribution in the name of the original author without the written consent of the main contributor, or failure to comply with the BSD-3 open source agreement,
* may result in the relevant person receiving a warning under the US DMCA or applicable laws in other countries and regions.
*/

#include <stdio.h>
#include <Windows.h>
#include <sddl.h>
#include <AclAPI.h>
#include <TlHelp32.h>
#include <fcntl.h>
#include <io.h>
#include <conio.h>

#define RESHADE_LOADING_THREAD_FUNC 1
#pragma comment(lib, "Advapi32.lib")
#pragma comment(lib, "User32.lib")

// Structure for multilingual support
struct language_strings
{
    const wchar_t* usage;
    const wchar_t* waiting;
    const wchar_t* found;
    const wchar_t* injecting;
    const wchar_t* success;
    const wchar_t* failed_open;
    const wchar_t* arch_mismatch;
    const wchar_t* failed_find;
    const wchar_t* failed_allocate;
    const wchar_t* failed_execute;
    const wchar_t* failed_load;
    const wchar_t* process_dir;
    const wchar_t* copy_ini_success;
    const wchar_t* copy_ini_fail;
    const wchar_t* ini_exists;
    const wchar_t* invalid_param;
    const wchar_t* missing_exe_suffix;
};

// Language string table
static const language_strings english_strings = {
    L"usage: %s <exe name>\n",
    L"Waiting for a '%s' process to start ...\n",
    L"Found a matching process with PID %lu! Injecting HoYoShade ... ",
    L"Injecting HoYoShade ... ",
    L"Succeeded!\n",
    L"\nFailed to open target application process!",
    L"\nProcess architecture does not match injection tool! Cannot continue.",
    L"\nFailed to find ReShade at \"%s\"!\n",
    L"\nFailed to allocate and write 'LoadLibrary' argument in target application!\n",
    L"\nFailed to execute 'LoadLibrary' in target application!\n",
    L"\nFailed to load ReShade in target application! Error code is 0x%x.\n",
    L"\nTarget process root directory: %s\n",
    L"\nReShade.ini copied to target process directory.\n",
    L"\nWarning: Failed to copy ReShade.ini (error code: %lu).\n",
    L"\nReShade.ini already exists in target process directory, no need to copy.\n",
    L"\nError: Invalid parameter! Please use a valid shortcut or specify a process name ending with .exe.\n",
    L"\nError: Custom process name must end with .exe!\n"
};

static const language_strings simplified_chinese_strings = {
    L"用法: %s <可执行文件名>\n",
    L"正在等待 '%s' 进程启动...\n",
    L"找到匹配的进程 PID %lu! 正在注入 HoYoShade ... ",
    L"正在注入 HoYoShade ... ",
    L"成功!\n",
    L"\n无法打开目标应用程序进程!",
    L"\n进程架构与注入工具不匹配! 无法继续。",
    L"\n无法在 \"%s\" 找到 ReShade!\n",
    L"\n无法在目标应用程序中分配和写入'LoadLibrary'参数!\n",
    L"\n无法在目标应用程序中执行'LoadLibrary'!\n",
    L"\n无法在目标应用程序中加载 ReShade! 错误代码: 0x%x。\n",
    L"\n目标进程根目录: %s\n",
    L"\n已自动复制 ReShade.ini 到目标进程目录。\n",
    L"\n警告: 无法复制 ReShade.ini（错误码: %lu）。\n",
    L"\n目标进程目录已存在 ReShade.ini，无需复制。\n",
    L"\n错误：参数无效！请使用有效的快捷方式或指定以.exe结尾的进程名。\n",
    L"\n错误：自定义进程名必须以.exe结尾！\n"
};

static const language_strings traditional_chinese_strings = {
    L"用法: %s <可執行文件名>\n",
    L"正在等待 '%s' 進程啓動...\n",
    L"找到匹配的進程 PID %lu! 正在注入 HoYoShade ... ",
    L"正在注入 HoYoShade ... ",
    L"成功!\n",
    L"\n無法打開目標應用程序進程!",
    L"\n進程架構與注入工具不匹配! 無法繼續。",
    L"\n無法在 \"%s\" 找到 ReShade!\n",
    L"\n無法在目標應用程序中分配和寫入'LoadLibrary'參數!\n",
    L"\n無法在目標應用程序中執行'LoadLibrary'!\n",
    L"\n無法在目標應用程序中加載 ReShade! 錯誤代碼: 0x%x。\n",
    L"\n目標進程根目錄: %s\n",
    L"\n已自動複製 ReShade.ini 到目標進程目錄。\n",
    L"\n警告: 無法複製 ReShade.ini（錯誤碼: %lu）。\n",
    L"\n目標進程目錄已存在 ReShade.ini，無需複製。\n",
    L"\n錯誤：參數無效！請使用有效的快捷方式或指定以.exe結尾的進程名。\n",
    L"\n錯誤：自定義進程名必須以.exe結尾！\n"
};

// Get the language strings corresponding to current system language settings
static const language_strings* get_language_strings()
{
    LANGID langID = GetUserDefaultUILanguage();
    if (PRIMARYLANGID(langID) == LANG_CHINESE)
    {
        if (SUBLANGID(langID) == SUBLANG_CHINESE_SIMPLIFIED)
        {
            return &simplified_chinese_strings;
        }
        else
        {
            return &traditional_chinese_strings;
        }
    }
    return &english_strings; // Default to English
}

struct loading_data
{
    WCHAR load_path[MAX_PATH] = L"";
    decltype(&GetLastError) GetLastError = nullptr;
    decltype(&LoadLibraryW) LoadLibraryW = nullptr;
    const WCHAR env_var_name[30] = L"RESHADE_DISABLE_LOADING_CHECK";
    const WCHAR env_var_value[2] = L"1";
    decltype(&SetEnvironmentVariableW) SetEnvironmentVariableW = nullptr;
};

struct scoped_handle
{
    HANDLE handle;

    scoped_handle() :
        handle(INVALID_HANDLE_VALUE) {}
    scoped_handle(HANDLE handle) :
        handle(handle) {}
    scoped_handle(scoped_handle&& other) :
        handle(other.handle) {
        other.handle = NULL;
    }
    ~scoped_handle() { if (handle != NULL && handle != INVALID_HANDLE_VALUE) CloseHandle(handle); }

    operator HANDLE() const { return handle; }

    HANDLE* operator&() { return &handle; }
    const HANDLE* operator&() const { return &handle; }
};

static void update_acl_for_uwp(LPWSTR path)
{
    OSVERSIONINFOEX verinfo_windows7 = { sizeof(OSVERSIONINFOEX), 6, 1 };
    const bool is_windows7 = VerifyVersionInfo(&verinfo_windows7, VER_MAJORVERSION | VER_MINORVERSION,
        VerSetConditionMask(VerSetConditionMask(0, VER_MAJORVERSION, VER_EQUAL), VER_MINORVERSION, VER_EQUAL)) != FALSE;
    if (is_windows7)
        return; // There is no UWP on Windows 7, so no need to update DACL

    PACL old_acl = nullptr, new_acl = nullptr;
    PSECURITY_DESCRIPTOR sd = nullptr;
    SECURITY_INFORMATION siInfo = DACL_SECURITY_INFORMATION;

    // Get the existing DACL for the file
    if (GetNamedSecurityInfoW(path, SE_FILE_OBJECT, DACL_SECURITY_INFORMATION, nullptr, nullptr, &old_acl, nullptr, &sd) != ERROR_SUCCESS)
        return;

    // Get the SID for 'ALL_APPLICATION_PACKAGES'
    PSID sid = nullptr;
    if (ConvertStringSidToSid(TEXT("S-1-15-2-1"), &sid))
    {
        EXPLICIT_ACCESS access = {};
        access.grfAccessPermissions = GENERIC_READ | GENERIC_EXECUTE;
        access.grfAccessMode = SET_ACCESS;
        access.grfInheritance = SUB_CONTAINERS_AND_OBJECTS_INHERIT;
        access.Trustee.TrusteeForm = TRUSTEE_IS_SID;
        access.Trustee.TrusteeType = TRUSTEE_IS_WELL_KNOWN_GROUP;
        access.Trustee.ptstrName = reinterpret_cast<LPTCH>(sid);

        // Update the DACL with the new entry
        if (SetEntriesInAcl(1, &access, old_acl, &new_acl) == ERROR_SUCCESS)
        {
            SetNamedSecurityInfoW(path, SE_FILE_OBJECT, siInfo, NULL, NULL, new_acl, NULL);
            LocalFree(new_acl);
        }

        LocalFree(sid);
    }

    LocalFree(sd);
}

#if RESHADE_LOADING_THREAD_FUNC
static DWORD WINAPI loading_thread_func(loading_data* arg)
{
    arg->SetEnvironmentVariableW(arg->env_var_name, arg->env_var_value);
    if (arg->LoadLibraryW(arg->load_path) == NULL)
        return arg->GetLastError();
    return ERROR_SUCCESS;
}
#endif

int wmain(int argc, wchar_t* argv[])
{
    if (GetConsoleWindow() == NULL) {
        AllocConsole();
        FILE* fp;
        freopen_s(&fp, "CONOUT$", "w", stdout);
        freopen_s(&fp, "CONOUT$", "w", stderr);
        freopen_s(&fp, "CONIN$", "r", stdin);
    }
    ShowWindow(GetConsoleWindow(), SW_SHOW);

    // Set console output to Unicode mode
    _setmode(_fileno(stdout), _O_U16TEXT);
    _setmode(_fileno(stderr), _O_U16TEXT);

    // Get the string table for current language
    const language_strings* lang = get_language_strings();


    const wchar_t* name = nullptr;
    bool is_shortcut = false;
    bool valid_param = false;
    if (argc != 2)
    {
        wprintf(lang->usage, argv[0]);
        return 0;
    }
    // Parameter self-check: shortcut or custom process name
    if (_wcsicmp(argv[1], L"-YS") == 0) { name = L"YuanShen.exe"; is_shortcut = true; valid_param = true; }
    else if (_wcsicmp(argv[1], L"-GI") == 0) { name = L"GenshinImpact.exe"; is_shortcut = true; valid_param = true; }
    else if (_wcsicmp(argv[1], L"-HSR") == 0) { name = L"StarRail.exe"; is_shortcut = true; valid_param = true; }
    else if (_wcsicmp(argv[1], L"-ZZZ") == 0) { name = L"ZenlessZoneZero.exe"; is_shortcut = true; valid_param = true; }
    else if (_wcsicmp(argv[1], L"-BH3") == 0) { name = L"BH3.exe"; is_shortcut = true; valid_param = true; }
    else {
        const wchar_t* temp = wcsrchr(argv[1], L'\\');
        if (temp)
            name = temp + 1;
        else
            name = argv[1];
        // Check if the custom process name ends with .exe
        size_t len = wcslen(name);
        if (len > 4 && _wcsicmp(name + len - 4, L".exe") == 0)
            valid_param = true;
        else {
            wprintf(lang->missing_exe_suffix);
            return 0;
        }
    }
    // Check whether the parameters are legal
    if (!valid_param) {
        wprintf(lang->invalid_param);
        return 0;
    }

    // Blacklist of forbidden process names
    const wchar_t* process_blacklist[] = {
        L"explorer.exe",
        L"cmd.exe",
        L"powershell.exe",
        L"conhost.exe",
        L"taskmgr.exe",
        L"svchost.exe",
        L"lsass.exe",
        L"csrss.exe",
        L"wininit.exe",
        L"winlogon.exe",
        L"Client-Win64-Shipping.exe"
    };
    const int blacklist_count = sizeof(process_blacklist) / sizeof(process_blacklist[0]);
    for (int i = 0; i < blacklist_count; ++i) {
        if (_wcsicmp(name, process_blacklist[i]) == 0) {
            LANGID langID = GetUserDefaultUILanguage();
            if (PRIMARYLANGID(langID) == LANG_CHINESE) {
                if (SUBLANGID(langID) == SUBLANG_CHINESE_SIMPLIFIED) {
                    wprintf(L"[错误] 此进程名为黑名单进程名，请更换其它目标进程名后再试。\n\n按下任意键退出。\n", name);
                } else {
                    wprintf(L"[錯誤] 此進程名爲黑名單進程名，請更換其它目標進程名後再試。\n\n按下任意鍵退出。\n", name);
                }
            } else {
                wprintf(L"[Error] This process name is a blacklisted process name. Please change the target process name and try again. \n\nPress any key to exit. \n", name);
            }
            _getwch();
            return 0;
        }
    }


    while (true) {
        bool found = false;
        DWORD found_pid = 0;
        const scoped_handle snapshot = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
        PROCESSENTRY32W process = { sizeof(process) };
        for (BOOL next = Process32FirstW(snapshot, &process); next; next = Process32NextW(snapshot, &process)) {
            if (_wcsicmp(process.szExeFile, name) == 0) {
                found = true;
                found_pid = process.th32ProcessID;
                break;
            }
        }
        if (!found) break;
        // Try to kill process
        HANDLE hProc = OpenProcess(PROCESS_TERMINATE, FALSE, found_pid);
        if (hProc) {
            TerminateProcess(hProc, 0);
            CloseHandle(hProc);
        }
        Sleep(1); // Sleep a bit to not overburden the CPU
    }

    // Quick parameter integrity check
    if (is_shortcut)
    {
        WCHAR root_dir[MAX_PATH] = {0};
        GetModuleFileNameW(nullptr, root_dir, MAX_PATH);
        WCHAR* last_slash = wcsrchr(root_dir, L'\\');
        if (last_slash) *last_slash = L'\0';
        const wchar_t* check_files[] = {
            L"inject.exe",
            L"ReShade64.dll",
            L"InjectResource",
            L"LauncherResource",
            L"reshade-shaders",
            L"Presets",
            L"LauncherResource\\INIBuild.exe",
            L"InjectResource\\Fonts\\MiSans-Bold.ttf"
        };
        bool missing = false;
        for (int i = 0; i < sizeof(check_files)/sizeof(check_files[0]); ++i)
        {
            WCHAR full_path[MAX_PATH*2] = {0};
            swprintf_s(full_path, L"%s\\%s", root_dir, check_files[i]);
            if (GetFileAttributesW(full_path) == INVALID_FILE_ATTRIBUTES)
            {
                missing = true;
                break;
            }
        }
        if (missing)
        {
            LANGID langID = GetUserDefaultUILanguage();
            if (PRIMARYLANGID(langID) == LANG_CHINESE)
            {
                if (SUBLANGID(langID) == SUBLANG_CHINESE_SIMPLIFIED)
                {
                    wprintf(L"欢迎使用HoYoShade注入器！\n\n开发者：DuolaDStudio X ZelbertYQ X Ex_M\n\n我们检测到（Open）HoYoShade框架注入所需的必要文件不存在。\n\n出现这个提示的原因可能有：\n1:你在解压压缩包时没有解压全部文件。\n2:你在进行覆盖更新操作的时候没有粘贴全部文件。\n3:你系统上的杀毒软件/其它程序误将（Open）HoYoShade识别为病毒，然后删除了某些文件。\n4:你无意/有意重命名了部分关键文件。\n\n按下任意键后注入器将会退出运行。\n如果你想继续运行（Open）HoYoShade，请访问我们的GitHub仓库（https://github.com/DuolaD/HoYoShade）重新下载最新版Releases界面中提供的压缩包，并解压全部文件。\n\n");
                }
                else
                {
                    wprintf(L"歡迎使用HoYoShade注入器！\n\n開發者：DuolaDStudio X ZelbertYQ X Ex_M\n\n我們檢測到（Open）HoYoShade框架注入所需的必要文件不存在。\n\n出現這個提示的原因可能有：\n1:你在解壓壓縮包時沒有解壓全部文件。\n2:你在進行覆蓋更新操作的時候沒有粘貼全部文件。\n3:你系統上的殺毒軟件/其它程序誤將（Open）HoYoShade識別為病毒，然後刪除了某些文件。\n4:你無意/有意重命名了部分關鍵文件。\n\n按下任意鍵後注入器將會退出運行。\n如果你想繼續運行（Open）HoYoShade，請訪問我們的GitHub倉庫（https://github.com/DuolaD/HoYoShade）重新下載最新版Releases界面中提供的壓缩包，並解壓全部文件。\n\n");
                }
            }
            else
            {
                wprintf(L"Welcome to HoYoShade Injector!\n\nDevelopers: DuolaDStudio X ZelbertYQ X Ex_M\n\nWe detected that some required files for (Open)HoYoShade injection are missing.\n\nPossible reasons for this message:\n1: You did not extract all files from the zip package.\n2: You did not copy all files when updating/overwriting.\n3: Your antivirus/other software mistakenly deleted some files.\n4: You accidentally or intentionally renamed some key files.\n\nPress any key to exit.\nIf you want to continue using (Open)HoYoShade, please visit our GitHub (https://github.com/DuolaD/HoYoShade) and download the latest release zip, then extract all files.\n\n");
            }
            _getwch();
            return 0;
        }
    }

    wprintf(lang->waiting, name);

    DWORD pid = 0;

    // Wait for a process with the target name to spawn
    while (!pid)
    {
        const scoped_handle snapshot = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);

        PROCESSENTRY32W process = { sizeof(process) };
        for (BOOL next = Process32FirstW(snapshot, &process); next; next = Process32NextW(snapshot, &process))
        {
            if (_wcsicmp(process.szExeFile, name) == 0)
            {
                pid = process.th32ProcessID;
                break;
            }
        }

        Sleep(1); // Sleep a bit to not overburden the CPU
    }

    wprintf(lang->found, pid);

    // Get the target process root directory
    WCHAR process_path[MAX_PATH] = { 0 };
    WCHAR process_dir[MAX_PATH] = { 0 };
    HANDLE hProcess = OpenProcess(PROCESS_QUERY_LIMITED_INFORMATION, FALSE, pid);
    if (hProcess) {
        DWORD size = MAX_PATH;
        if (QueryFullProcessImageNameW(hProcess, 0, process_path, &size)) {
            wcscpy_s(process_dir, process_path);
            WCHAR* last_slash = wcsrchr(process_dir, L'\\');
            if (last_slash) *last_slash = L'\0';
            wprintf(lang->process_dir, process_dir);
        }
        CloseHandle(hProcess);
    }

    // Check and automatically copy ReShade.ini
    WCHAR target_ini[MAX_PATH] = { 0 };
    WCHAR source_ini[MAX_PATH] = { 0 };
    swprintf_s(target_ini, L"%s\\ReShade.ini", process_dir);

    // Get the injector root directory
    WCHAR injector_dir[MAX_PATH] = { 0 };
    GetModuleFileNameW(nullptr, injector_dir, MAX_PATH);
    WCHAR* last_slash = wcsrchr(injector_dir, L'\\');
    if (last_slash) *last_slash = L'\0';
    swprintf_s(source_ini, L"%s\\ReShade.ini", injector_dir);

    // Check if both tool files exist
    WCHAR inibuild_path[MAX_PATH] = { 0 };
    swprintf_s(inibuild_path, L"%s\\LauncherResource\\INIBuild.exe", injector_dir);
    bool skip_ini_gen = false;
    if (GetFileAttributesW(inibuild_path) == INVALID_FILE_ATTRIBUTES) {
        skip_ini_gen = true;
    }

    if (!skip_ini_gen && GetFileAttributesW(target_ini) == INVALID_FILE_ATTRIBUTES) {
        // ReShade.ini does not exist, run two programs to generate it first
        const wchar_t* tools[] = {
            L"LauncherResource\\INIBuild.exe",
        };

        for (int i = 0; i < 2; ++i) {
            WCHAR tool_path[MAX_PATH] = { 0 };
            swprintf_s(tool_path, L"%s\\%s", injector_dir, tools[i]);

            STARTUPINFOW si = { sizeof(si) };
            PROCESS_INFORMATION pi = {};

            // Start the program
            if (CreateProcessW(tool_path, nullptr, nullptr, nullptr, FALSE, 0, nullptr, nullptr, &si, &pi)) {
                WaitForSingleObject(pi.hProcess, INFINITE);
                CloseHandle(pi.hProcess);
                CloseHandle(pi.hThread);
            }
        }

        // Try copying ReShade.ini again
        if (CopyFileW(source_ini, target_ini, FALSE)) {
            wprintf(lang->copy_ini_success);
        } else {
            wprintf(lang->copy_ini_fail, GetLastError());
        }
    } else if (!skip_ini_gen) {
        wprintf(lang->ini_exists);
    }

    // Wait just a little bit for the application to initialize
    Sleep(50);

    // Open target application process
    const scoped_handle remote_process = OpenProcess(PROCESS_CREATE_THREAD | PROCESS_VM_OPERATION | PROCESS_VM_READ | PROCESS_VM_WRITE | PROCESS_QUERY_INFORMATION, FALSE, pid);
    if (remote_process == nullptr)
    {
        wprintf(lang->failed_open);
        wprintf(L"\nDebug: GetLastError: %lu\n", GetLastError());
        return GetLastError();
    }

    // Check process architecture
    BOOL remote_is_wow64 = FALSE;
    IsWow64Process(remote_process, &remote_is_wow64);
#ifndef _WIN64
    if (remote_is_wow64 == FALSE)
#else
    if (remote_is_wow64 != FALSE)
#endif
    {
        wprintf(lang->arch_mismatch);
        return ERROR_IMAGE_MACHINE_TYPE_MISMATCH;
    }

    loading_data arg;
#if 0
    GetCurrentDirectoryW(MAX_PATH, arg.load_path);
#else
    // Use module directory, since current directory points to target executable directory when drag'n'dropping a target executable onto the injector
    GetModuleFileNameW(nullptr, arg.load_path, MAX_PATH);
    if (wchar_t* const load_path_filename = wcsrchr(arg.load_path, L'\\'))
        *load_path_filename = '\0';
#endif
    wcscat_s(arg.load_path, L"\\");
    wcscat_s(arg.load_path, remote_is_wow64 ? L"ReShade32.dll" : L"ReShade64.dll");

    if (GetFileAttributesW(arg.load_path) == INVALID_FILE_ATTRIBUTES)
    {
        wprintf(lang->failed_find, arg.load_path);
        return ERROR_FILE_NOT_FOUND;
    }

    // Make sure the DLL has permissions set up for 'ALL_APPLICATION_PACKAGES'
    update_acl_for_uwp(arg.load_path);

    // This happens to work because kernel32.dll is always loaded to the same base address, so the address of 'LoadLibrary' is the same in the target application and the current one
    arg.GetLastError = GetLastError;
    arg.LoadLibraryW = LoadLibraryW;
    arg.SetEnvironmentVariableW = SetEnvironmentVariableW;

#if RESHADE_LOADING_THREAD_FUNC
    const auto loading_thread_func_size = 256; // An estimate of the size of the 'loading_thread_func' function
#else
    const auto loading_thread_func_size = 0;
#endif
    const auto load_param = VirtualAllocEx(remote_process, nullptr, loading_thread_func_size + sizeof(arg), MEM_COMMIT | MEM_RESERVE, PAGE_EXECUTE_READWRITE);
#if RESHADE_LOADING_THREAD_FUNC
    const auto loading_thread_func_address = static_cast<LPBYTE>(load_param) + sizeof(arg);
#else
    const auto loading_thread_func_address = arg.LoadLibraryW;
#endif

    // Write thread entry point function and 'LoadLibrary' call argument to target application
    if (load_param == nullptr
        || !WriteProcessMemory(remote_process, load_param, &arg, sizeof(arg), nullptr)
#if RESHADE_LOADING_THREAD_FUNC
        || !WriteProcessMemory(remote_process, loading_thread_func_address, loading_thread_func, loading_thread_func_size, nullptr)
#endif
        )
    {
        wprintf(lang->failed_allocate);
        return GetLastError();
    }

    // Execute 'LoadLibrary' in target application
    const scoped_handle load_thread = CreateRemoteThread(remote_process, nullptr, 0, reinterpret_cast<LPTHREAD_START_ROUTINE>(loading_thread_func_address), load_param, 0, nullptr);
    if (load_thread == nullptr)
    {
        wprintf(lang->failed_execute);
        return GetLastError();
    }

    // Wait for loading to finish and clean up parameter memory afterwards
    WaitForSingleObject(load_thread, INFINITE);
    VirtualFreeEx(remote_process, load_param, 0, MEM_RELEASE);

    // Thread thread exit code will contain the module handle
    if (DWORD exit_code;
        GetExitCodeThread(load_thread, &exit_code) &&
#if RESHADE_LOADING_THREAD_FUNC
        exit_code == ERROR_SUCCESS)
#else
        exit_code != NULL)
#endif
    {
        wprintf(lang->success);
        return 0;
    }
    else
    {
#if RESHADE_LOADING_THREAD_FUNC
        wprintf(lang->failed_load, exit_code);
        return exit_code;
#else
        wprintf(lang->failed_load, 0);
        return ERROR_MOD_NOT_FOUND;
#endif
    }
}