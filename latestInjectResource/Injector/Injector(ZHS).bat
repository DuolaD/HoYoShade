@echo off

chcp 936

title HoYoShade Starter
cls

set "filepath=%~dp0Reshade.ini"

if exist "%filepath%" (
    goto menu
) else (
    cls
    start "" /wait ".\InjectResource\INIBuild.exe"
    start "" "convert_encoding.bat"
    :FileCheck
    cls
    echo 欢迎使用HoYoShade注入器！
    echo\
    echo 模组版本：V2.012.2 Stable
    echo 开发者：DuolaDStudio X 阿向菌AXBro X Ex_M
    echo\
    echo 我们检测到你是第一次使用本模组，Reshade.ini现已生成至模组根目录中。
    echo 你需要将Reshade.ini复制到游戏进程根目录，然后才能使用本模组。
    echo 你想要现在运行游戏根目录检测吗？这样你可以很方便就找到游戏进程根目录路径去复制文件。
    echo\
    echo [1]好的，现在运行游戏进程根目录路径检测。
    echo [2]不了，我知道该如何操作。
    echo\
    set /p "tmp=在此输入选项前面的数字："
    if "%tmp%" == "1" (
        goto PatchCheck
    ) else if "%tmp%" == "2" (
        goto menu
    ) else (
        echo\
        echo 输入错误。
        timeout /t 2
        goto FileCheck
    )
)

:menu
title HoYoShade Starter
cls
echo 欢迎使用HoYoShade注入器！
echo\
echo 模组版本：V2.012.2 Stable
echo 开发者：DuolaDStudio X 阿向菌AXBro X Ex_M
echo\
echo 请注意，你需要将Reshade.ini复制到游戏进程根目录，然后才能使用本模组。
echo\
echo 本模组仅用于游戏画面调色使用，请遵守游戏相关条例。
echo 使用模组拍摄素材发布视频时，请备注:"该视频由GitHub@DuolaD/HoYoShade提供渲染支持"。
echo 如因特殊原因无法备注，请通过"其它选项"中的联系方式联系开发者进行说明。
echo\
echo [1]游戏进程路径检测
echo [2]重置模组根目录中的ReShade.ini
echo [3]原神（中国大陆服客户端）
echo [4]原神（哔哩哔哩服客户端）
echo [5]原神（国际服客户端/Epic客户端）
echo [6]崩坏三(通用客户端)
echo [7]崩坏：星穹铁道(通用客户端)
echo [8]其它选项
echo [9]退出程序

echo\
set /p "content=在此输入选项前面的数字："

if "%content%" == "1" (
    goto PatchCheck
) else if "%content%" == "2" (
    goto ini_Reset
) else if "%content%" == "3" (
    goto YuanShen_inject
) else if "%content%" == "4" (
    goto BiliBili_Warning
) else if "%content%" == "5" (
    powershell -command Start-Process -FilePath inject.exe GenshinImpact.exe -Verb RunAs
    exit
) else if "%content%" == "6" (
    powershell -command Start-Process -FilePath inject.exe BH3.exe -Verb RunAs
    exit
) else if "%content%" == "7" (
    powershell -command Start-Process -FilePath inject.exe StarRail.exe -Verb RunAs
    exit
) else if "%content%" == "8" (
    goto other
) else if "%content%" == "9" (
    exit
) else (
    echo\
    echo 输入错误。
    timeout /t 2
    goto menu
    )
exit

:other
title HoYoShade Starter
cls
echo 欢迎使用HoYoShade注入器！
echo\
echo 模组版本：V2.012.2 Stable
echo 开发者：DuolaDStudio X 阿向菌AXBro X Ex_M
echo\
echo 如果你需要检查版本更新，可以去访问我们的仓库查看是否有发行更新版本
echo 开发者选项仅用于调试/检测错误需要，除非开发者明确要求你这样做，否则请勿轻易使用
echo\
echo 注：CYteam网盘除了提供本模组的下载之外，还免费提供国际服原神/崩铁/HoYoLAB安装包。
echo 除此之外，CYteam还提供一些安卓的搞机资源。感兴趣的可以去看一看~
echo 感谢CYteam提供的网盘服务
echo\
echo [1]访问我们的GitHub主仓库
echo [2]访问由CYteam提供的网盘服务
echo [3]在爱发电上赞助我（支持微信和支付宝）
echo [4]在Patreon上赞助我（支持海外支付方式）
echo [5]加入我们模组的官方QQ群
echo [6]加入我和CYTeam的资源QQ群
echo [7]关于HoYoShade
echo [8]开发者选项
echo [9]返回主界面
echo [10]退出程序

echo\
set /p "content=在此输入选项前面的数字："

if "%content%" == "1" (
    start "" "https://github.com/DuolaD/HoYoShade/"
    goto other
) else if "%content%" == "2" (
    start "" "https://d.cyteam.cn/"
    goto other
) else if "%content%" == "3" (
    start "" "https://afdian.net/a/DuolaD?tab=home"
    goto other
) else if "%content%" == "4" (
    start "" "https://www.patreon.com/DuolaD"
    goto other
) else if "%content%" == "5" (
    start "" "http://qm.qq.com/cgi-bin/qm/qr?_wv=1027&k=7_mbCbSi2lGorijmwdZyvKuhU0mYs3Kv&authKey=w9%2FBFjNTtDOyk%2FsyLmGuKowkZO5vq9hSN5ksu6y7MGDBcvY2uqFkldR%2Fmx%2FypRo%2F&noverify=0&group_code=377103253"
    goto other
) else if "%content%" == "6" (
    start "" "http://qm.qq.com/cgi-bin/qm/qr?_wv=1027&k=eO0na7JXAPFeIQEdsYlS5OqYdQVTp-7k&authKey=6gnSrN3ej1ukrHYDGTW6pXNs7l1%2B1zO2qhoW9lYeE%2F8yl9ubm6xuyfnJa34gda4Q&noverify=0&group_code=627378873"
    goto other
) else if "%content%" == "7" (
    goto about_HoYoShade
) else if "%content%" == "8" (
    goto develop
) else if "%content%" == "9" (
    goto menu
) else if "%content%" == "10" (
    exit
) else (
    echo\
    echo 输入错误。
    timeout /t 2
    goto other
)
goto other

:develop
title HoYoShade Starter(你已进入开发者选项！！！)
cls
echo 欢迎使用HoYoShade注入器！
echo\
echo 模组版本：V2.012.2 Stable
echo 开发者：DuolaDStudio X 阿向菌AXBro X Ex_M
echo\
echo 注意！开发者选项仅用于调试/检测错误需要，除非开发者明确要求你这样做，否则请勿轻易使用！
echo\
echo [1]自定义注入
echo [2]返回主界面
echo [3]返回其它选项
echo [4]退出程序

echo\
set /p "content=在此输入选项前面的数字："

if "%content%" == "1" (
    goto customize_inject
) else if "%content%" == "2" (
    goto menu
) else if "%content%" == "3" (
    goto other
) else if "%content%" == "4" (
    exit
) else (
    echo\
    echo 输入错误。
    timeout /t 2
    goto develop
)
goto develop@echo off


:BiliBili_Warning
title HoYoShade Starter(哔哩哔哩客户端启动前警告！)
cls
echo 欢迎使用HoYoShade注入器！
echo\
echo 模组版本：V2.012.2 Stable
echo 开发者：DuolaDStudio X 阿向菌AXBro X Ex_M
echo\
echo 注意！！！
echo 由于哔哩哔哩客户端使用的是外置软件登录游戏账号
echo 而并非类似官服/国际服/Epic客户端的游戏内登录游戏账号
echo 因此，请先确保游戏已成功登录游戏账号后再按'Home'键打开Reshade控制台进行后续操作
echo\
echo 如果你在游戏没有成功登录游戏账户前打开Reshade控制台，游戏在弹出登录窗口后会卡死
echo 如果你不小心没有注意到这点并发生了这种情况，只需打开任务管理器关闭游戏和与游戏相关的进程
echo 然后重新启动本模组注入器至等待注入游戏界面，并重新使用官方启动器打开游戏即可。
timeout /t 5
pause
goto YuanShen_inject

:YuanShen_inject
powershell -command Start-Process -FilePath inject.exe YuanShen.exe -Verb RunAs
exit

:customize_inject
title HoYoShade Starter(你已进入自定义注入界面！！！)
cls
echo 欢迎使用HoYoShade注入器！
echo\
echo 模组版本：V2.012.2 Stable
echo 开发者：DuolaDStudio X 阿向菌AXBro X Ex_M
echo\
echo 注意！此功能仅供开发者测试新游戏使用。这意味着可能会存在未知风险/Bug。
echo 除非你是二次开发者/你受开发者指导，否则请不要擅自使用此功能注入本Reshade至其它游戏内。
echo\
echo 使用方法：输入目标程序文件名即可，无需添加'.exe'后缀，按回车确定。
echo 等待注入窗口界面弹出后启动目标程序即可。
echo 输入'/exit'即可返回开发界面。
echo\
set /p "content=在此输入："
if "%content%" == "/exit" (
    goto develop
) else (
    powershell -command Start-Process -FilePath inject.exe %content%.exe -Verb RunAs
    exit
)

:PatchCheck


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
	goto checkend
)

reg query "%regPath%" /v "%regValue%" > nul 2>&1
if %errorlevel% neq 0 (
    echo 崩坏：星穹铁道[国际服]:[未发现（注册表被篡改）]
	goto checkend
)

for /f "tokens=2*" %%a in ('reg query "%regPath%" /v "%regValue%" ^| findstr /i "%regValue%"') do (
    set "regData=%%b"
)

if exist "%regData%\Games" (
    echo 崩坏：星穹铁道[国际服]进程所在目录:%regData%\Games
) else (
    echo 崩坏：星穹铁道[国际服]:[你似乎只安装了启动器，并没有安装游戏本体]
)

:checkend
echo\
echo 检测完毕，请复制路径或在资源管理器里根据路径打开文件夹，将模组根目录的Reshade.ini复制到根目录里。
pause
goto menu

:about_HoYoShade
title HoYoShade
cls
echo HoYoShade
echo HoYo it,Great it.
echo 使ReShade支持米哈游旗下所有可在PC端运行的游戏。
echo 然后，彼此成就，彼此闪耀。
echo\
echo DuolaDStudio X 阿向菌AXBro x Ex_M
echo 联合巨献
echo\
echo 模组版本：V2.012.2 Stable
echo\
echo HoYoShade基于ReShade二次开发，除效果库/Presets之外的所有文件均遵守BSL-3开源协议在GitHub上开源。
echo 你可以在Reshade.me网站中查看ReShade官方信息。
echo Modify By DuolaDStudio Hong Kong Ltd,All rights reserved.
echo\
echo 详细开发名单：
echo -DuolaDStudio Hong Kong Ltd.
echo   ——哆啦D夢DuolaD[RE适配/大版本更新开发/注入器/预设]
echo   ——琳妮特LynetteNotFound[HoYoShade小版本更新开发/维护]
echo -Ex_M[技术支持/指导/GUI制作]
echo -阿向菌AXBro[付费效果库/宣传/面向技术支持]
echo\
echo 感谢有你！HoYoShade明天会更好！
pause
goto other

:ini_Reset
title HoYoShade Starter
cls
echo 欢迎使用HoYoShade注入器！
echo\
echo 模组版本：V2.012.2 Stable
echo 开发者：DuolaDStudio X 阿向菌AXBro X Ex_M
echo\
echo 请注意：你只需要在模组目录移动后才需要重置ReShade.ini
echo 除此之外，一般情况下你都不需要进行重置操作。
echo\
echo 重置完毕后,你需要重新复制ReShade.ini至游戏进程根目录
echo 是否继续重置操作？
echo\
echo [1]是
echo [2]否(返回注入器主菜单)
echo\
set /p "content=在此输入选项前面的数字："

if "%content%" == "1" (
	start "" /wait ".\InjectResource\INIBuild.exe"
    start "" "convert_encoding.bat"
	:File_Reset
	cls
	echo 欢迎使用HoYoShade注入器！
	echo\
	echo 模组版本：V2.012.2 Stable
	echo 开发者：DuolaDStudio X 阿向菌AXBro X Ex_M
	echo\
    echo 重置成功！重置后的ReShade.ini现已替换模组根目录中的旧版ReShade.ini。
    echo 你需要将重置后的ReShade.ini替换游戏进程根目录原有的ReShade.ini，然后才能使用本模组。
    echo 你想要现在运行游戏根目录检测吗？这样你可以很方便就找到游戏进程根目录路径去复制文件。
    echo\
    echo [1]好的，现在运行游戏进程根目录路径检测。
    echo [2]不了，我知道该如何操作。
    echo\
	set /p "tmp=在此输入选项前面的数字："
    if "%tmp%" == "1" (
        goto PatchCheck
    ) else if "%tmp%" == "2" (
        goto menu
    ) else (
        echo\
        echo 输入错误。
        timeout /t 2
        goto File_Reset
    )
) else if "%content%" == "2" (
    goto menu
) else (
    echo\
    echo 输入错误。
    timeout /t 2
    goto ini_Reset
)