@echo off

echo\
echo 原神[国服\哔哩哔哩服]由于共用注册表路径和文件
echo 只能检测到最近一次安装\更新过启动器的原神
echo\
echo 崩坏三[韩国服]由于字符问题，不支持检测，但HoYoShade仍然支持注入。
echo\

set regPath=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\原神
set regValue=InstallPath

reg query "%regPath%" > nul 2>&1
if %errorlevel% neq 0 (
    echo 原神[国服\哔哩哔哩服]:[未发现]
    goto Genshin_Impact_Globel_Game_Check
)

reg query "%regPath%" /v "%regValue%" > nul 2>&1
if %errorlevel% neq 0 (
    echo 原神[国服\哔哩哔哩服]:[未发现（注册表被篡改）]
    goto Genshin_Impact_Globel_Game_Check
)

for /f "tokens=2*" %%a in ('reg query "%regPath%" /v "%regValue%" ^| findstr /i "%regValue%"') do (
    set "regData=%%b"
)

if exist "%regData%\Genshin Impact game" (
    echo 原神[国服\哔哩哔哩服]进程所在目录:%regData%\Genshin Impact game
) else (
    echo 原神[国服\哔哩哔哩服]:[你似乎只安装了启动器，并没有安装游戏本体]
)

:Genshin_Impact_Globel_Game_Check
set regPath=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Genshin Impact
set regValue=InstallPath

reg query "%regPath%" > nul 2>&1
if %errorlevel% neq 0 (
    echo 原神[国际服]:[未发现]
    goto Honkai_3rd_CN_Game_Check
)

reg query "%regPath%" /v "%regValue%" > nul 2>&1
if %errorlevel% neq 0 (
    echo 原神[国际服]:[未发现（注册表被篡改）]
    goto Honkai_3rd_CN_Game_Check
)

for /f "tokens=2*" %%a in ('reg query "%regPath%" /v "%regValue%" ^| findstr /i "%regValue%"') do (
    set "regData=%%b"
)

if exist "%regData%\Genshin Impact game" (
    echo 原神[国际服]进程所在目录:%regData%\Genshin Impact game
) else (
    echo 原神[国际服]:[你似乎只安装了启动器，并没有安装游戏本体]
)

:Honkai_3rd_CN_Game_Check
set regPath=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\崩坏3
set regValue=InstallPath

reg query "%regPath%" > nul 2>&1
if %errorlevel% neq 0 (
    echo 崩坏三[国服]:[未发现]
    goto Honkai_3rd_TC_Game_Check
)

reg query "%regPath%" /v "%regValue%" > nul 2>&1
if %errorlevel% neq 0 (
    echo 崩坏三[国服]:[未发现（注册表被篡改）]
    goto Honkai_3rd_TC_Game_Check
)

for /f "tokens=2*" %%a in ('reg query "%regPath%" /v "%regValue%" ^| findstr /i "%regValue%"') do (
    set "regData=%%b"
)

if exist "%regData%\Games" (
    echo 崩坏三[国服]进程所在目录:%regData%\Games
) else (
    echo 崩坏三[国服]:[你似乎只安装了启动器，并没有安装游戏本体]
)

:Honkai_3rd_TC_Game_Check
set regPath=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\崩壞3rd
set regValue=InstallPath

reg query "%regPath%" > nul 2>&1
if %errorlevel% neq 0 (
    echo 崩坏三[繁中服]:[未发现]
    goto Honkai_3rd_Asia_Game_Check
)

reg query "%regPath%" /v "%regValue%" > nul 2>&1
if %errorlevel% neq 0 (
    echo 崩坏三[繁中服]:[未发现（注册表被篡改）]
    goto Honkai_3rd_Asia_Game_Check
)

for /f "tokens=2*" %%a in ('reg query "%regPath%" /v "%regValue%" ^| findstr /i "%regValue%"') do (
    set "regData=%%b"
)

if exist "%regData%\Games" (
    echo 崩坏三[繁中服]进程所在目录:%regData%\Games
) else (
    echo 崩坏三[繁中服]:[你似乎只安装了启动器，并没有安装游戏本体]
)

:Honkai_3rd_Asia_Game_Check
set regPath=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Honkai Impact 3
set regValue=InstallPath

reg query "%regPath%" > nul 2>&1
if %errorlevel% neq 0 (
    echo 崩坏三[东南亚服]:[未发现]
    goto Honkai_3rd_GLB_Game_Check
)

reg query "%regPath%" /v "%regValue%" > nul 2>&1
if %errorlevel% neq 0 (
    echo 崩坏三[东南亚服]:[未发现（注册表被篡改）]
    goto Honkai_3rd_GLB_Game_Check
)

for /f "tokens=2*" %%a in ('reg query "%regPath%" /v "%regValue%" ^| findstr /i "%regValue%"') do (
    set "regData=%%b"
)

if exist "%regData%\Games" (
    echo 崩坏三[东南亚服]进程所在目录:%regData%\Games
) else (
    echo 崩坏三[东南亚服]:[你似乎只安装了启动器，并没有安装游戏本体]
)

:Honkai_3rd_GLB_Game_Check
set regPath=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Honkai Impact 3rd
set regValue=InstallPath

reg query "%regPath%" > nul 2>&1
if %errorlevel% neq 0 (
    echo 崩坏三[欧美服]:[未发现]
    goto Honkai_StarRail_CN_Game_Check
)

reg query "%regPath%" /v "%regValue%" > nul 2>&1
if %errorlevel% neq 0 (
    echo 崩坏三[欧美服]:[未发现（注册表被篡改）]
    goto Honkai_StarRail_CN_Game_Check
)

for /f "tokens=2*" %%a in ('reg query "%regPath%" /v "%regValue%" ^| findstr /i "%regValue%"') do (
    set "regData=%%b"
)

if exist "%regData%\Games" (
    echo 崩坏三[欧美服]进程所在目录:%regData%\Games
) else (
    echo 崩坏三[欧美服]:[你似乎只安装了启动器，并没有安装游戏本体]
)

:Honkai_StarRail_CN_Game_Check
set regPath=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\崩坏：星穹铁道
set regValue=InstallPath

reg query "%regPath%" > nul 2>&1
if %errorlevel% neq 0 (
    echo 崩坏：星穹铁道[国服]:[未发现]
    goto Honkai_StarRail_Globel_Game_Check
)

reg query "%regPath%" /v "%regValue%" > nul 2>&1
if %errorlevel% neq 0 (
    echo 崩坏：星穹铁道[国服]:[未发现（注册表被篡改）]
    goto Honkai_StarRail_Globel_Game_Check
)

for /f "tokens=2*" %%a in ('reg query "%regPath%" /v "%regValue%" ^| findstr /i "%regValue%"') do (
    set "regData=%%b"
)

if exist "%regData%\Games" (
    echo 崩坏：星穹铁道[国服]进程所在目录:%regData%\Games
) else (
    echo 崩坏：星穹铁道[国服]:[你似乎只安装了启动器，并没有安装游戏本体]
)

:Honkai_StarRail_Globel_Game_Check
set regPath=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Star Rail
set regValue=InstallPath

reg query "%regPath%" > nul 2>&1
if %errorlevel% neq 0 (
    echo 崩坏：星穹铁道[国际服]:[未发现]
    pause
    goto ini_menu
)

reg query "%regPath%" /v "%regValue%" > nul 2>&1
if %errorlevel% neq 0 (
    echo 崩坏：星穹铁道[国际服]:[未发现（注册表被篡改）]
    pause
    goto ini_menu
)

for /f "tokens=2*" %%a in ('reg query "%regPath%" /v "%regValue%" ^| findstr /i "%regValue%"') do (
    set "regData=%%b"
)

if exist "%regData%\Games" (
    echo 崩坏：星穹铁道[国际服]进程所在目录:%regData%\Games
) else (
    echo 崩坏：星穹铁道[国际服]:[你似乎只安装了启动器，并没有安装游戏本体]
)


echo 检测完毕，请复制路径或在资源管理器里根据路径打开文件夹，将模组根目录的Reshade.ini复制到根目录里。
pause