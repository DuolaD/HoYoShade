@echo off
setlocal enabledelayedexpansion

chcp 936

title HoYoShade启动器
cls

fltmc >nul 2>&1
if errorlevel 1 (
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

set files_to_check=("inject.exe" "ReShade64.dll" "InjectResource" "LauncherResource" "reshade-shaders" "Presets" "LauncherResource\INIBuild.exe" "InjectResource\Fonts\MiSans-Bold.ttf")

setlocal enabledelayedexpansion
cd /d "%~dp0"

set missing_file=0
for %%f in %files_to_check% do (
    if not exist %%~f (
        set missing_file=1
    )
)

if %missing_file% equ 1 (
    title HoYoShade启动器
    cls
    echo 欢迎使用HoYoShade启动器！
    echo\
    echo 模组版本：V3.0.0-Beta.1
    echo 开发者：DuolaDStudio X ZelbertYQ X Ex_M
    echo 由[幻港之蝶]注入内核驱动
    echo\
    echo 我们检测到（Open）HoYoShade框架注入所需的必要文件不存在。
    echo\
    echo 出现这个提示的原因可能有：
    echo 1:你在解压压缩包时没有解压全部文件。
    echo 2:你在进行覆盖更新操作的时候没有粘贴全部文件。
    echo 3:你系统上的杀毒软件/其它程序误将（Open）HoYoShade识别为病毒，然后删除了某些文件。
    echo 4:你无意/有意重命名了部分关键文件。
    echo\
    echo 按下任意键后启动器将会退出运行。
    echo 如果你想继续运行（Open）HoYoShade，请访问我们的GitHub仓库（https://github.com/DuolaD/HoYoShade）重新下载最新版Releases界面中提供的压缩包，并解压全部文件。
    pause
    exit
)

set "filepath=%~dp0ReShade.ini"
set "missing_reshade_config=0"
if not exist "%filepath%" (
    set "missing_reshade_config=1"
)

start "" /wait /b ".\LauncherResource\INIBuild.exe"

if "%missing_reshade_config%"=="1" (
    cls
    :FileCheck
    cls
    echo 欢迎使用HoYoShade启动器！
    echo\
    echo 模组版本：V3.0.0-Beta.1
    echo 开发者：DuolaDStudio X ZelbertYQ X Ex_M
    echo 由[幻港之蝶]注入内核驱动
    echo\
    echo 恭喜！你已成功安装HoYoShade！
    echo 我们检测到你是第一次使用本模组，Reshade.ini现已生成至模组根目录中。
    echo\
    echo 如果这是你第一次在 miHoYo（米哈游）/ HoYoverse 游戏中使用ReShade，你现在可以继续了。
    echo 注入器会自动检测并复制配置文件（ReShade.ini）到游戏进程根目录。
    echo\
    echo 但如果你曾经在 miHoYo（米哈游）/ HoYoverse 游戏中使用过ReShade，
    echo 你可能需要先删除ReShade.ini（必须）和 ReShade.log（非必须，但建议删除）。
    echo 例如：
    echo ·你曾经使用过 HoYoShade V2 及以下的版本。
    echo ·你曾经使用过其他人/自行基于官方ReShade/HoYoShade二次开发的ReShade。
    echo\
    echo 如何找到游戏进程根目录？  
    echo 对于HoYoPlay（米哈游启动器）:点击开始启动按钮旁边的更多图标-游戏设置即可查看游戏进程根目录。  
    echo 点击'打开所在目录'即可使用资源管理器打开游戏进程根目录。  
    echo\
    echo 对于StarWard:点击开始启动按钮旁边的齿轮图标即可查看游戏进程根目录。  
    echo 点击游戏进程根目录即可使用资源管理器打开游戏进程根目录。  
    echo\
    echo 仍然不懂如何操作？你可以在 https://hoyosha.de 中查看用户协议和图文/视频安装说明。
    echo 位于中国大陆？ https://cn.hoyosha.de 可以提供更佳的访问体验。
    echo\
    pause
    goto menu
)

:menu
title HoYoShade启动器
cls
echo 欢迎使用HoYoShade启动器！
echo\
echo 模组版本：V3.0.0-Beta.1
echo 开发者：DuolaDStudio X ZelbertYQ X Ex_M
echo 由[幻港之蝶]注入内核驱动
echo\
echo 当前注入列表：公开客户端注入列表
echo 注意：支持部分Beta/创作者体验服/Devkit等非公开客户端
echo\
echo 本模组仅用于游戏画面调色使用，请遵守本Mod的用户协议和游戏及其开发/发行商相关条例。
echo 你可以在 https://hoyosha.de 中查看用户协议和图文/视频安装说明。
echo 位于中国大陆？ https://cn.hoyosha.de 可以提供更佳的访问体验。
REM 我还是更愿意当一个在背后默默付出的人 XD
echo\
echo *:该注入选项适用于Beta/创作者体验服，但你可能需要向开发者获取补丁方可注入。
echo\
echo [1] 重置模组根目录中的ReShade.ini
echo [2] 注入至 原神（中国大陆/哔哩哔哩 公开/Devkit/Beta/创作者体验服客户端）*
echo [3] 注入至 原神（国际服/Epic 公开/Beta/创作者体验服客户端）*
echo [4] 注入至 崩坏三（通用 公开/Beta客户端）*
echo [5] 注入至 崩坏：星穹铁道（通用 公开/Beta/创作者体验服客户端）*
echo [6] 注入至 绝区零（通用 公开客户端）
echo [7] 切换至测试服客户端注入列表
echo [8] 联动Blender/留影机插件注入至原神/绝区零（公开客户端）
echo [9] 联动Starward启动器注入HoYoShade
echo [10] 其它选项
echo [11] 退出程序

echo\
set /p "content=在此输入选项前面的数字："

echo\

if "%content%" == "1" (
    goto ini_Reset
) else if "%content%" == "2" (
    cls
    echo 你选择的注入目标为:原神（中国大陆/哔哩哔哩 公开/Devkit/Beta/创作者体验服客户端）
    echo 注入器现已启动，你现在可以使用启动器启动游戏了。注入器会一并注入。
    echo 如果你选择了错误的注入目标，只需关闭此窗口后重新运行启动器重新选择即可。
    echo\
    echo 重要：你必须要使用一个游戏启动器来启动游戏（无论是官方启动器还是第三方启动器），
    echo 不能直接双击运行进程/进程快捷方式以启动游戏。否则会注入失败。
    echo\
    echo\
    echo 此注入选项支持注入HoYoShade至原神（中国大陆/哔哩哔哩 Devkit/Beta/创作者体验服客户端）。
    echo\
    echo 在注入此类客户端时，你必须要使用官方向你提供的游戏启动器来启动游戏，
    echo 你不能直接双击运行进程/进程快捷方式以启动游戏，否则可能会导致注入失败。
    echo 但如果官方未向你提供启动器/你没有启动器且注入失败，你可能需要向开发者获取补丁方可注入。
    echo 此补丁为闭源补丁且并不内置于HoYoShade中，你无法通过更改HoYoShade源代码来实现注入功能。
    echo 有关更多信息，请联系开发者 哆啦D夢DuolaD （https://github.com/DuolaD） 以获取更多信息。
    echo\
    start "" /wait /b inject.exe YuanShen.exe
    exit
) else if "%content%" == "3" (
    cls
    echo 你选择的注入目标为:原神（国际服/Epic 公开/Beta/创作者体验服客户端）
    echo 注入器现已启动，你现在可以使用启动器启动游戏了。注入器会一并注入。
    echo 如果你选择了错误的注入目标，只需关闭此窗口后重新运行启动器重新选择即可。
    echo\
    echo 重要：你必须要使用一个游戏启动器来启动游戏（无论是官方启动器还是第三方启动器），
    echo 不能直接双击运行进程/进程快捷方式以启动游戏。否则会注入失败。
    echo\
    echo\
    echo 此注入选项支持注入HoYoShade至原神（国际服 Beta/创作者体验服客户端）。
    echo\
    echo 在注入此类客户端时，你必须要使用官方向你提供的游戏启动器来启动游戏，
    echo 你不能直接双击运行进程/进程快捷方式以启动游戏，否则可能会导致注入失败。
    echo 但如果官方未向你提供启动器/你没有启动器且注入失败，你可能需要向开发者获取补丁方可注入。
    echo 此补丁为闭源补丁且并不内置于HoYoShade中，你无法通过更改HoYoShade源代码来实现注入功能。
    echo 有关更多信息，请联系开发者 哆啦D夢DuolaD （https://github.com/DuolaD） 以获取更多信息。
    echo\
    start "" /wait /b inject.exe GenshinImpact.exe
    exit
) else if "%content%" == "4" (
    cls
    echo 你选择的注入目标为:崩坏三（通用 公开/Beta客户端）
    echo 注入器现已启动，你现在可以使用启动器启动游戏了。注入器会一并注入。
    echo 如果你选择了错误的注入目标，只需关闭此窗口后重新运行启动器重新选择即可。
    echo\
    echo 重要：你必须要使用一个游戏启动器来启动游戏（无论是官方启动器还是第三方启动器），
    echo 不能直接双击运行进程/进程快捷方式以启动游戏。否则会注入失败。
    echo\
    echo\
    echo 此注入选项支持注入HoYoShade至崩坏三（通用 Beta客户端）。
    echo\
    echo 在注入此类客户端时，你必须要使用官方向你提供的游戏启动器来启动游戏，
    echo 你不能直接双击运行进程/进程快捷方式以启动游戏，否则可能会导致注入失败。
    echo 此补丁为闭源补丁且并不内置于HoYoShade中，你无法通过更改HoYoShade源代码来实现注入功能。
    echo 有关更多信息，请联系开发者 哆啦D夢DuolaD （https://github.com/DuolaD） 以获取更多信息。
    echo\
    echo\
    start "" /wait /b inject.exe BH3.exe
    exit
) else if "%content%" == "5" (
    cls
    echo 你选择的注入目标为:崩坏：星穹铁道（通用 公开/Beta/创作者体验服客户端）
    echo 注入器现已启动，你现在可以使用启动器启动游戏了。注入器会一并注入。
    echo 如果你选择了错误的注入目标，只需关闭此窗口后重新运行启动器重新选择即可。
    echo\
    echo 重要：你必须要使用一个游戏启动器来启动游戏（无论是官方启动器还是第三方启动器），
    echo 不能直接双击运行进程/进程快捷方式以启动游戏。否则会注入失败。
    echo\
    echo\
    echo 此注入选项支持注入HoYoShade至崩坏：星穹铁道（通用 Beta/创作者体验服客户端）。
    echo\
    echo 在注入此类客户端时，你必须要使用官方向你提供的游戏启动器来启动游戏，
    echo 你不能直接双击运行进程/进程快捷方式以启动游戏，否则可能会导致注入失败。
    echo 但如果官方未向你提供启动器/你没有启动器，你可能需要向开发者获取补丁方可注入。
    echo 此补丁为闭源补丁且并不内置于HoYoShade中，你无法通过更改HoYoShade源代码来实现注入功能。
    echo 有关更多信息，请联系开发者 哆啦D夢DuolaD （https://github.com/DuolaD） 以获取更多信息。
    echo\
    start "" /wait /b inject.exe StarRail.exe
    exit
) else if "%content%" == "6" (
    echo 你选择的注入目标为:绝区零（通用 公开客户端）
    echo 注入器现已启动，你现在可以使用启动器启动游戏了。注入器会一并注入。
    echo 如果你选择了错误的注入目标，只需关闭此窗口后重新运行启动器重新选择即可。
    echo\
    echo 重要：你必须要使用一个游戏启动器来启动游戏（无论是官方启动器还是第三方启动器），
    echo 不能直接双击运行进程/进程快捷方式以启动游戏。否则会注入失败。
    echo\
    echo 注意：此注入选项不适用于任何 绝区零（公测前/后内测（Beta））客户端，
    echo 如需注入至此类客户端，请关闭窗口并重新启动HoYoShade启动器，并在公开客户端注入列表选择对应的客户端。
    echo\
    start "" /wait /b inject.exe ZenlessZoneZero.exe
    exit
) else if "%content%" == "7" (
    goto beta_client_inject_choice_menu
) else if "%content%" == "8" (
    goto blender_hook_check
) else if "%content%" == "9" (
    reg query "HKEY_CLASSES_ROOT\starward" >nul 2>&1
    if %errorlevel%==0 (
        goto starward_menu
    ) else (
        echo 未检测到Starward URL协议，这是联动Starward启动器的必要条件。
        echo 请先在Starward启动器 - 应用设置 - 高级 - URL协议界面中，将“注册URL协议”开关设置为开启。
        pause
        goto menu
    )
    pause
    goto menu
) else if "%content%" == "10" (
    goto other
) else if "%content%" == "11" (
    exit
) else (
    echo 输入错误。
    timeout /t 2
    goto menu
    )
exit

:other
title HoYoShade启动器
cls
echo 欢迎使用HoYoShade启动器！
echo\
echo 模组版本：V3.0.0-Beta.1
echo 开发者：DuolaDStudio X ZelbertYQ X Ex_M
echo 由[幻港之蝶]注入内核驱动
echo\
echo 如果你需要检查版本更新，可以去访问我们的仓库查看是否有发行更新版本
echo 注意！开发者选项仅用于调试/检测错误需要。除非开发者明确要求你这样做，或者你很清楚知道自己在做什么，否则请勿轻易使用！
echo\
echo [1] 访问我们的GitHub仓库
echo [2] 赞助本Mod
echo [3] 联系我们
echo [4] 关于HoYoShade
echo [5] 开发者选项
echo [6] 返回主界面
echo [7] 退出程序

echo\
set /p "content=在此输入选项前面的数字："

if "%content%" == "1" (
    start "" "https://github.com/DuolaD/HoYoShade/"
    goto other
) else if "%content%" == "2" (
    start "" "https://github.com/DuolaD/HoYoShade/blob/V2.X.X-Stable/Readme.Chinese_Simplified.md#%E3%80%A2-%E8%B5%9E%E5%8A%A9"
    goto other
) else if "%content%" == "3" (
    start "" "https://github.com/DuolaD/HoYoShade/blob/V2.X.X-Stable/Readme.Chinese_Simplified.md#%E3%80%A2-%E8%81%94%E7%B3%BB%E6%88%91"
    goto other
) else if "%content%" == "4" (
    goto about_HoYoShade
) else if "%content%" == "5" (
    goto develop
) else if "%content%" == "6" (
    goto menu
) else if "%content%" == "7" (
    exit
) else (
    echo\
    echo 输入错误。
    timeout /t 2
    goto other
)
goto other

:develop
title HoYoShade启动器(你已进入开发者选项！！！)
cls
echo 欢迎使用HoYoShade启动器！
echo\
echo 模组版本：V3.0.0-Beta.1
echo 开发者：DuolaDStudio X ZelbertYQ X Ex_M
echo 由[幻港之蝶]注入内核驱动
echo\
echo 注意！开发者选项仅用于调试/检测错误需要。除非开发者明确要求你这样做，或者你很清楚知道自己在做什么，否则请勿轻易使用！
echo\
echo [1] 自定义注入
echo [2] 返回主界面
echo [3] 返回其它选项
echo [4] 退出程序

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

:customize_inject
title HoYoShade启动器(你已进入自定义注入界面！！！)
cls
echo 欢迎使用HoYoShade启动器！
echo\
echo 模组版本：V3.0.0-Beta.1
echo 开发者：DuolaDStudio X ZelbertYQ X Ex_M
echo 由[幻港之蝶]注入内核驱动
echo\
echo 注意！此功能仅供开发者测试新游戏使用。这意味着可能会存在未知风险/Bug。
echo 除非开发者明确要求你这样做，或者你很清楚知道自己在做什么，否则请不要擅自使用此功能注入Reshade至其它游戏内。
echo\
echo 使用方法：输入目标程序文件名即可，无需添加'.exe'后缀，按回车确定。
echo 等待注入窗口界面弹出后启动目标程序即可。
echo 输入'\exit'即可返回开发界面。
echo\
set /p "content=在此输入："
echo\
if "%content%" == "\exit" (
    goto develop
) else (
    echo 你选择的注入目标为:%content%.exe
    echo 注入器现已启动，你现在可以使用启动器启动游戏了。注入器会一并注入。
    echo 如果你选择了错误的注入目标，只需关闭此窗口后重新运行启动器重新选择即可。
    echo\
    start "" /wait /b inject.exe %content%.exe
    exit
)

:about_HoYoShade
title HoYoShade
cls
echo HoYoShade
echo HoYo it,Great it.
echo 使ReShade支持米哈游旗下所有可在PC端运行的游戏。
echo 然后，彼此成就，彼此闪耀。
echo\
echo DuolaDStudio X ZelbertYQ x Ex_M
echo 联合巨献
echo\
echo 模组版本：V3.0.0-Beta.1
echo\
echo HoYoShade基于ReShade官方插件和OpenHoYoShade框架二次开发，除效果库/预设之外的所有文件均遵守BSL-3开源协议在GitHub上开源。
echo 你可以在Reshade.me网站中查看ReShade官方资讯。
echo Modify By DuolaDStudio Hong Kong Ltd,All rights reserved.
echo\
echo 请注意：HoYoShade为免费开源Mod，ReShade为免费开源插件，OpenHoYoShade为免费开源框架。
echo 所有源码都可以在GitHub上获取，如果你是付费购买了未经修改/二次开发的(Open)HoYoShade
echo 请立即退款！商家行为和所有开发者无关！
echo\
echo 详细开发名单：
echo -DuolaDStudio Hong Kong Ltd.
echo   ——哆啦D梦DuolaD[RE适配/大版本更新开发/启动器/预设] 
echo   ——琳妮特LynetteNotFound[HoYoShade小版本更新开发/维护] 
echo -Ex_M[技术支持/指导/GUI制作] 
echo -ZelbertYQ[文档站技术支持] 
echo\
echo 鸣谢：
echo -CYTeam[HoYoShade合作伙伴/微软企业储存计划提供/动态转静态链接解决方案] 
echo -Cloudflare, Inc.[域名托管与管理] 
echo\
echo 感谢有你！HoYoShade明天会更好！
pause
goto other

:ini_Reset
title HoYoShade启动器
cls
echo 欢迎使用HoYoShade启动器！
echo\
echo 模组版本：V3.0.0-Beta.1
echo 开发者：DuolaDStudio X ZelbertYQ X Ex_M
echo 由[幻港之蝶]注入内核驱动
echo\
echo 注意：在HoYoShade V3中，重置ReShade.ini的操作是全自动检测并后台运行的。
echo 也就是说，通常情况下你都不需要再手动进行重置ReShade.ini。
echo
echo 一般只有以下两种情况，你才需要重置ReShade.ini配置文件：
echo ·仓库Releases界面中明确写明了建议/必须重置ReShade.ini配置文件，以此开启新功能/修复Bug。
echo ·HoYoShade开发者/贡献者明确要求你进行这个操作。
echo\
echo 除此之外，一般情况下你都不需要进行重置ReShade.ini操作。
echo\
echo 重置完毕后，你需要重新删除已经复制到游戏进程根目录下的ReShade.ini配置文件，否则HoYoShade将无法按照预期正常工作。
echo 是否继续重置操作？
echo\
echo [1] 是
echo [2] 否(返回启动器主菜单)
echo\
set /p "content=在此输入选项前面的数字："

if "%content%" == "1" (
    start "" /wait ".\LauncherResource\INIBuild.exe"
    :File_Reset
    cls
    echo 欢迎使用HoYoShade启动器！
    echo\
    echo 模组版本：V3.0.0-Beta.1
    echo 开发者：DuolaDStudio X ZelbertYQ X Ex_M
    echo 由[幻港之蝶]注入内核驱动
    echo\
    echo 重置成功！重置后的ReShade.ini现已替换模组根目录中的旧版ReShade.ini。
    echo 你需要重新删除已经复制到游戏进程根目录下的ReShade.ini配置文件，否则HoYoShade将无法按照预期正常工作。
    echo\
    echo 如何找到游戏进程根目录？  
    echo 对于HoYoPlay（米哈游启动器）:点击开始启动按钮旁边的更多图标-游戏设置即可查看游戏进程根目录。  
    echo 点击'打开所在目录'即可使用资源管理器打开游戏进程根目录。  
    echo\
    echo 对于StarWard:点击开始启动按钮旁边的齿轮图标即可查看游戏进程根目录。  
    echo 点击游戏进程根目录即可使用资源管理器打开游戏进程根目录。  
    echo\
    echo 仍然不懂如何操作？你可以在 https://hoyosha.de 中查看用户协议和图文/视频安装说明。
    echo 位于中国大陆？ https://cn.hoyosha.de 可以提供更佳的访问体验。
    echo\
    pause
    goto menu
) else if "%content%" == "2" (
    goto menu
) else (
    echo\
    echo 输入错误。
    timeout /t 2
    goto ini_Reset
)

:beta_client_inject_choice_menu
title HoYoShade启动器
cls
echo 欢迎使用HoYoShade启动器！
echo\
echo 模组版本：V3.0.0-Beta.1
echo 开发者：DuolaDStudio X ZelbertYQ X Ex_M
echo 由[幻港之蝶]注入内核驱动
echo\
echo 当前注入列表：测试服客户端注入列表
echo 注意：当前注入列表仅支持部分Beta/创作者体验服/Devkit等非公开客户端，不支持任何公开客户端
echo\
echo 本模组仅用于游戏画面调色使用，请遵守本Mod的用户协议和游戏及其开发/发行商相关条例。
echo 你可以在 https://hoyosha.de 中查看用户协议和图文/视频安装说明。
echo 位于中国大陆？ https://cn.hoyosha.de 可以提供更佳的访问体验。
echo\
echo 以下客户端注入选项均只能用于注入至测试服客户端。
echo\
echo 如果你想使用的测试服客户端不在此列表，或者注入器未对游戏启动做出响应，则说明:
echo 1:你想使用的测试服客户端注入选项与公开客户端注入选项通用，请先尝试使用公开客户端注入列表尝试注入。
echo 2:HoYoShade暂未适配你目前正在使用的测试服客户端。
echo 如需适配，请在我们的访问我们的GitHub仓库（https://github.com/DuolaD/HoYoShade）提交issues。
echo\
echo [1] 重置模组根目录中的ReShade.ini
echo [2] 注入至 原神（通用 国际服 DevKit/公测前内测（Beta）客户端）
echo [3] 注入至 绝区零（通用 公测前内测（Beta）客户端）
echo [4] 注入至 绝区零（通用 公测后内测（Beta）/创作者体验服客户端）
echo [5] 注入至 崩坏：因缘精灵（通用 中国大陆/国际服 CBT1 客户端）
echo [6] 注入至 星布谷地（通用 中国大陆/国际服 CBT1/Devkit 客户端）
echo [7] 切换至公开客户端注入列表
echo [8] 其它选项
echo [9] 退出程序

echo\
set /p "content=在此输入选项前面的数字："

echo\

if "%content%" == "1" (
    goto ini_Reset
) else if "%content%" == "2" (
    cls
    echo 你选择的注入目标为:原神（通用 国际服 DevKit/公测前内测（Beta）客户端）
    echo 注入器现已启动，你现在可以使用启动器启动游戏了。注入器会一并注入。
    echo 如果你选择了错误的注入目标，只需关闭此窗口后重新运行启动器重新选择即可。
    echo\
    echo 注意：此注入选项不适用于任何 原神（公开/公测后内测（Beta））客户端，
    echo 如需注入至此类客户端，请关闭窗口并重新启动HoYoShade启动器，并在公开客户端注入列表选择对应的客户端。
    echo\
    echo 重要：你必须要使用官方向你提供的游戏启动器来启动游戏，
    echo 不能直接双击运行进程/进程快捷方式以启动游戏。否则可能会导致注入失败。
    echo 如果官方未向你提供启动器/你没有启动器，你可能需要向开发者获取补丁方可注入。
    echo 此补丁为闭源补丁且并不内置于HoYoShade中，你无法通过更改HoYoShade源代码来实现注入功能。
    echo 有关更多信息，请联系开发者 哆啦D夢DuolaD （https://github.com/DuolaD） 以获取更多信息。
    echo\
    start "" /wait /b inject.exe Genshin.exe
    exit
) else if "%content%" == "3" (
    cls
    echo 你选择的注入目标为:绝区零（通用 公测前内测（Beta）客户端）
    echo 注入器现已启动，你现在可以使用启动器启动游戏了。注入器会一并注入。
    echo 如果你选择了错误的注入目标，只需关闭此窗口后重新运行启动器重新选择即可。
    echo\
    echo 注意：此注入选项不适用于任何 绝区零（通用 公开/公测后内测/创作者体验服）客户端，
    echo 如需注入至此类客户端，请关闭窗口并重新启动HoYoShade启动器，并选择对应的客户端注入选项。
    echo\
    echo 重要：你必须要使用官方向你提供的游戏启动器来启动游戏，
    echo 不能直接双击运行进程/进程快捷方式以启动游戏。否则可能会导致注入失败。
    echo 如果官方未向你提供启动器/你没有启动器，你可能需要向开发者获取补丁方可注入。
    echo 此补丁为闭源补丁且并不内置于HoYoShade中，你无法通过更改HoYoShade源代码来实现注入功能。
    echo 有关更多信息，请联系开发者 哆啦D夢DuolaD （https://github.com/DuolaD） 以获取更多信息。
    echo\
    start "" /wait /b inject.exe ZZZ.exe
    exit
) else if "%content%" == "4" (
    cls
    echo 你选择的注入目标为:绝区零（通用 公测后内测/创作者体验服客户端）
    echo 注入器现已启动，你现在可以使用启动器启动游戏了。注入器会一并注入。
    echo 如果你选择了错误的注入目标，只需关闭此窗口后重新运行启动器重新选择即可。
    echo\
    echo 注意：此注入选项不适用于任何 绝区零（通用 公开/公测前内测）客户端，
    echo 如需注入至此类客户端，请关闭窗口并重新启动HoYoShade启动器，并选择对应的客户端注入选项。
    echo\
    echo 重要：你必须要使用官方向你提供的游戏启动器来启动游戏，
    echo 不能直接双击运行进程/进程快捷方式以启动游戏。否则可能会导致注入失败。
    echo 如果官方未向你提供启动器/你没有启动器，你可能需要向开发者获取补丁方可注入。
    echo 此补丁为闭源补丁且并不内置于HoYoShade中，你无法通过更改HoYoShade源代码来实现注入功能。
    echo 有关更多信息，请联系开发者 哆啦D夢DuolaD （https://github.com/DuolaD） 以获取更多信息。
    echo\
    start "" /wait /b inject.exe ZenlessZoneZeroBeta.exe
    exit
) else if "%content%" == "5" (
    cls
    echo 你选择的注入目标为:崩坏：因缘精灵（通用 中国大陆/国际服 CB1 客户端）
    echo 注入器现已启动，你现在可以使用启动器启动游戏了。注入器会一并注入。
    echo 如果你选择了错误的注入目标，只需关闭此窗口后重新运行启动器重新选择即可。
    echo\
    echo 重要：你必须要使用官方向你提供的游戏启动器来启动游戏，
    echo 不能直接双击运行进程/进程快捷方式以启动游戏。否则可能会导致注入失败。
    echo 如果官方未向你提供启动器/你没有启动器，你可能需要向开发者获取补丁方可注入。
    echo 此补丁为闭源补丁且并不内置于HoYoShade中，你无法通过更改HoYoShade源代码来实现注入功能。
    echo 有关更多信息，请联系开发者 哆啦D夢DuolaD （https://github.com/DuolaD） 以获取更多信息。
    echo\
    start "" /wait /b inject.exe NexusAnima.exe
    exit
) else if "%content%" == "6" (
    cls
    echo 你选择的注入目标为:星布谷地（通用 中国大陆/国际服 CBT1/Devkit 客户端）
    echo 注入器现已启动，你现在可以使用启动器启动游戏了。注入器会一并注入。
    echo 如果你选择了错误的注入目标，只需关闭此窗口后重新运行启动器重新选择即可。
    echo\
    echo 重要：你必须要使用官方向你提供的游戏启动器来启动游戏，
    echo 不能直接双击运行进程/进程快捷方式以启动游戏。否则可能会导致注入失败。
    echo 如果官方未向你提供启动器/你没有启动器，你可能需要向开发者获取补丁方可注入。
    echo 此补丁为闭源补丁且并不内置于HoYoShade中，你无法通过更改HoYoShade源代码来实现注入功能。
    echo 有关更多信息，请联系开发者 哆啦D夢DuolaD （https://github.com/DuolaD） 以获取更多信息。
    echo\
    start "" /wait /b inject.exe PetitPlanet.exe
    exit
) else if "%content%" == "7" (
    goto menu
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

:blender_hook_check

setlocal enabledelayedexpansion

set ys_client_exist=0
set zzz_loader_exist=0

if exist "%~dp0ys_client.exe.lnk" (
    set ys_client_exist=1
)

if exist "%~dp0zzz_loader.exe.lnk" (
    set zzz_loader_exist=1
)

if "!ys_client_exist!"=="0" (
    if "!zzz_loader_exist!"=="0" (
        set blender_recheck=0
        echo 自检未通过，模组根目录下并没有找到名为 ys_client.exe.lnk 和/或 zzz_loader.exe.lnk 的快捷方式。
        echo 请在模组根目录下创建指向 loader.exe 的快捷方式，命名为 ys_client.exe.lnk 和/或 zzz_loader.exe.lnk，然后再试一次。
        pause
        goto menu
    )
)

if "!blender_recheck!"=="1" (
    goto blender_hook_menu
)

set missing_curl=0

set "current_dir=%~dp0"
set "shortcut=%current_dir%ys_client.exe.lnk"
set "target="
for /f "delims=" %%i in ('powershell -noprofile -command "(New-Object -ComObject WScript.Shell).CreateShortcut(\"%shortcut%\").TargetPath"') do (
    set "target=%%i"
)

for %%i in ("!target!") do set "target_dir=%%~dpi"

curl --version >nul 2>&1
if errorlevel 1 (
    set missing_curl=1
    goto blender_hook_menu
)

set "country_code="

for /f "usebackq delims=" %%A in (`curl -s https://www.canva.cn/cdn-cgi/trace`) do (
    set "line=%%A"
    echo !line! | findstr /b "loc=" >nul
    if !errorlevel! == 0 (
        set "country_code=!line:~4!"
    )
)

if /i "%country_code%"=="CN" goto :blender_hook_menu
if /i "%country_code%"=="HK" goto :blender_hook_menu
if /i "%country_code%"=="MO" goto :blender_hook_menu
if /i "%country_code%"=="TW" goto :blender_hook_menu
if /i "%country_code%"=="SG" goto :blender_hook_menu

:blender_hook_not_in_cn
cls
title HoYoShade启动器
cls
echo 欢迎使用HoYoShade启动器！
echo\
echo 模组版本：V3.0.0-Beta.1
echo 开发者：DuolaDStudio X ZelbertYQ X Ex_M
echo 由[幻港之蝶]注入内核驱动
echo\
echo 我们检测到当前你可能不在中国大陆/港澳台/新加坡地区，
echo 当前我们检测到你的所在国家/地区为：%country_code% 。
echo 这可能会导致本Mod的联动注入功能和Blender/留影机插件无法在你所在的国家及地区获得完整技术支持,或不予对你提供任何技术支持。
echo\
echo 是否确认尝试继续操作？
echo\
echo [1] 是
echo [2] 否（返回启动器主菜单）
echo\
set /p "content=在此输入选项前面的数字："
if "%content%" == "1" (
    goto blender_hook_menu
) else if "%content%" == "2" (
    goto menu
) else (
    echo\
    echo 输入错误。
    timeout /t 2
    goto blender_hook_not_in_cn
)

:blender_hook_menu
cls
title HoYoShade启动器
set blender_recheck=0
cls
echo 欢迎使用HoYoShade启动器！
echo\
echo 模组版本：V3.0.0-Beta.1
echo 开发者：DuolaDStudio X ZelbertYQ X Ex_M
echo 由[幻港之蝶]注入内核驱动
echo\
if "%missing_curl%" == "1" (
    echo 我们检测到当前操作系统中并不包含curl组件，这会导致地区检测功能无法工作。
    echo\
    echo 你仍然可以继续使用此Mod的联动注入功能。
    echo 但如果你并不处于中国大陆/港澳台/新加坡地区，可能会导致本Mod的联动注入功能和Blender/留影机插件无法在你所在的国家及地区获得完整技术支持,或不予对你提供任何技术支持。
    echo\
)
echo 当前 Blender/留影机插件 注入器检测信息如下：
if "!ys_client_exist!"=="1" (
    echo [原神版 Blender/留影机插件] ：已加载
) else (
    echo [原神版 Blender/留影机插件] ：未找到
)
if "!zzz_loader_exist!"=="1" (
    echo [绝区零版 Blender/留影机插件] ：已加载
) else (
    echo [绝区零版 Blender/留影机插件] ：未找到
)
echo\
echo 当前我们检测到你的所在国家/地区为：%country_code% 。
echo\
echo 注意：如果你使用联动注入功能，需要选择你在Blender/留影机插件中绑定的对应服务器的客户端，否则ReShade无法正常注入。
echo 如果这是你第一次启动Blender/留影机插件，请确保在此处选择的目标客户端和你接下来在Blender/留影机插件中绑定的目标客户端一致，否则ReShade无法正常注入。
echo\
echo 注意：选项[9] 仅付费版/作者版无人机可用。
echo\
echo 在当前HoYoShade版本中：
echo 原神版 Blender/留影机插件 仅支持V2版本。
echo 绝区零版 Blender/留影机插件 仅支持V1版本。
echo 其他版本的 Blender/留影机插件 将不受支持。
echo\
echo [1] 重置模组根目录中的ReShade.ini
echo [2] 联动 原神版 Blender/留影机插件 注入至 原神（通用 中国大陆/哔哩哔哩 公开客户端）
echo [3] 联动 原神版 Blender/留影机插件 注入至 原神（通用 国际服/Epic 公开 客户端）
echo [4] 联动 绝区零版 Blender/留影机插件 注入至 绝区零（通用 公开客户端）
echo [5] 仅启动 原神版 Blender/留影机插件
echo [6] 仅启动 绝区零版 Blender/留影机插件
echo [7] 同步当前系统时间以修复系统时间不同步的提示
echo [8] 删除 config 文件以重新指向其它客户端
echo [9] 删除 cookies.json/cookie.txt 文件以修复注入时“账号未登录”的报错提示
echo [10] 刷新 Blender/留影机插件 注入器检测信息
echo [11] 返回主界面
echo [12] 退出程序
echo\
set /p "choice=在此输入选项前面的数字："
echo\
if "%choice%"=="1" (
    goto ini_Reset
) else if "%choice%"=="2" (
    if "!ys_client_exist!"=="0" (
        echo 自检未通过，模组根目录下并没有找到名为 ys_client.lnk 的快捷方式。
        echo 请在模组根目录下创建指向 loader.exe 的快捷方式，命名为 ys_client.lnk ，然后选择 [10] 刷新 Blender/留影机插件 注入器检测信息，再试一次。
        pause
        goto blender_hook_menu
    )
    echo 你选择的注入目标为:原神（通用 中国大陆/哔哩哔哩 公开客户端）
    echo\
    echo ReShade和Blender/留影机插件注入器现已启动。请不要关闭本窗口。
    echo Blender/留影机插件注入器启动游戏后，ReShade将会自动注入并关闭该窗口。
    echo 如果ReShade.ini复制到了正确的游戏进程根目录，那么ReShade将会正确设置并启动。
    echo\
    echo 如果你选择了错误的注入目标，只需关闭此窗口和Blender/留影机插件注入器窗口后重新运行启动器重新选择即可。
    echo\
    start "" "%~dp0ys_client.exe.lnk"
    start "" /wait /b inject.exe YuanShen.exe
    exit
) else if "%choice%"=="3" (
    if "!ys_client_exist!"=="0" (
        echo 自检未通过，模组根目录下并没有找到名为 ys_client.lnk 的快捷方式。
        echo 请在模组根目录下创建指向 loader.exe 的快捷方式，命名为 ys_client.lnk ，然后选择 [10] 刷新 Blender/留影机插件 注入器检测信息，再试一次。
        pause
        goto blender_hook_menu
    )
    echo 你选择的注入目标为:原神（通用 国际服/Epic 公开 客户端）
    echo\
    echo ReShade和Blender/留影机插件注入器现已启动。请不要关闭本窗口。
    echo Blender/留影机插件注入器启动游戏后，ReShade将会自动注入并关闭该窗口。
    echo 如果ReShade.ini复制到了正确的游戏进程根目录，那么ReShade将会正确设置并启动。
    echo\
    echo 如果你选择了错误的注入目标，只需关闭此窗口和Blender/留影机插件注入器窗口后重新运行启动器重新选择即可。
    echo\
    start "" "%~dp0ys_client.exe.lnk"
    start "" /wait /b inject.exe GenshinImpact.exe
    exit
) else if "%choice%"=="4" (
    if "!zzz_loader_exist!"=="0" (
        echo 自检未通过，模组根目录下并没有找到名为 zzz_loader.lnk 的快捷方式。
        echo 请在模组根目录下创建指向 loader.exe 的快捷方式，命名为 zzz_loader.lnk ，然后选择 [10] 刷新 Blender/留影机插件 注入器检测信息，再试一次。
        pause
        goto blender_hook_menu
    )
    echo 你选择的注入目标为:绝区零（通用 公开客户端）
    echo\
    echo ReShade和Blender/留影机插件注入器现已启动。请不要关闭本窗口。
    echo Blender/留影机插件注入器启动游戏后，ReShade将会自动注入并关闭该窗口。
    echo 如果ReShade.ini复制到了正确的游戏进程根目录，那么ReShade将会正确设置并启动。
    echo\
    echo 如果你选择了错误的注入目标，只需关闭此窗口和Blender/留影机插件注入器窗口后重新运行启动器重新选择即可。
    echo\
    start "" "%~dp0zzz_loader.exe.lnk"
    start "" /wait /b inject.exe ZenlessZoneZero.exe
    exit
) else if "%choice%"=="5" (
    start "" "%~dp0ys_client.exe.lnk"
    goto blender_hook_menu
) else if "%choice%"=="6" (
    start "" "%~dp0zzz_loader.exe.lnk"
    goto blender_hook_menu
) else if "%choice%"=="7" (
    cls
    echo 同步系统时间的耗时取决于你当前的网络情况。
    echo 如果当前网络较差，耗时可能会比预期较长。请耐心等待。
    echo\
    echo 正在检查并启动 Windows Time 服务...
    net start w32time >nul 2>&1
    echo\
    if /i "%country_code%"=="CN" (
        w32tm /config /manualpeerlist:"ntp.ntsc.ac.cn" /syncfromflags:manual /reliable:YES /update >nul 2>&1
        net stop w32time >nul 2>&1
        net start w32time >nul 2>&1
        echo 检测到你当前位于中国大陆，可能难以访问微软官方时间源同步服务器。
        echo 当前你的操作系统同步时间源已更改为中国大陆科学院国家授时中心官方时间源同步服务器，以方便链接服务器同步时间。
        echo\
    )
    echo 正在尝试同步时间...
    echo\
    w32tm /resync >nul 2>&1
    if !errorlevel! == 0 (
        echo 时间同步成功！可访问 https://time.is 以检测时间是否已同步，然后重新尝试运行Blender/留影机插件。
    ) else (
        echo 时间同步失败，可能是因为没有正确配置NTP时间服务器或其他错误。
        echo 请确保NTP时间服务器设置正确，并且网络连接正常。
        echo 你可以尝试稍后再试，或访问系统设置-时间和语言-日期和时间进行手动设置。
    )
    echo\
    echo ========================
    echo\
    echo 注意：如果日后在使用过程中，Blender/留影机插件仍然经常性报错系统时间不同步的提示/你需要经常性使用本功能来修复报错/系统时间和现实时间经常性不符。
    echo 你可以在下次出现提示前先前往 https://time.is 以检测是否为误报，然后再使用本功能进行修复。
    echo\
    echo 如果这并不是误报，那么说明当前设备的时钟电路极有可能未能在断电/关机/休眠/睡眠的情况下正常工作。
    echo 你可以优先检查设备主板BIOS的电池电量（通常为CR2032，电压低于2V说明电池电量耗尽）。
    echo 如果电压过低，请尝试更换全新的电池，并在BIOS中设置正确的时间，然后使用本功能同步系统时间。
    echo\
    echo 如果更换电池后故障依旧/当前设备因相关条款无法自行更换，请联系Blender/留影机插件开发者/你的设备制造商/第三方维修机构寻求帮助。
    echo\
    echo ========================
    echo\
    pause
    goto blender_hook_menu
) else if "%choice%"=="8" (
    :blender_select_config_target
    cls
    echo 请选择要操作的插件版本：
    echo [1]  原神版 Blender/留影机插件
    echo [2]  绝区零版 Blender/留影机插件
    echo [3]  返回主菜单
    echo\
    set /p "blver=在此输入选项前面的数字："
    if "!blver!"=="1" (
        if "!ys_client_exist!"=="0" (
            echo 自检未通过，模组根目录下并没有找到名为 ys_client.lnk 的快捷方式。
            echo 请在模组根目录下创建指向 loader.exe 的快捷方式，命名为 ys_client.lnk ，然后选择 [10] 刷新 Blender/留影机插件 注入器检测信息，再试一次。
            pause
            goto blender_hook_menu
        )
        set "shortcut=%~dp0ys_client.exe.lnk"
    ) else if "!blver!"=="2" (
        if "!zzz_loader_exist!"=="0" (
            echo 自检未通过，模组根目录下并没有找到名为 zzz_loader.lnk 的快捷方式。
            echo 请在模组根目录下创建指向 loader.exe 的快捷方式，命名为 zzz_loader.lnk ，然后选择 [10] 刷新 Blender/留影机插件 注入器检测信息，再试一次。
            pause
            goto blender_hook_menu
        )
        set "shortcut=%~dp0zzz_loader.exe.lnk"
    ) else if "!blver!"=="3" (
        goto blender_hook_menu
    ) else (
        echo\
        echo 输入错误。
        timeout /t 2
        goto blender_select_config_target
    )
    set "target="
    for /f "delims=" %%i in ('powershell -noprofile -command "(New-Object -ComObject WScript.Shell).CreateShortcut(\"!shortcut!\").TargetPath"') do (
        set "target=%%i"
    )
    for %%i in ("!target!") do set "target_dir=%%~dpi"
    set "fileToDelete=config"
    set "target_dir=!target_dir!\"
    set "target_dir=!target_dir:~0,-1!"
    set "filePath=!target_dir!\config"
    if not exist "!filePath!" (
      echo 自检失败，config文件不存在于无人机模组目录下。
      echo 这可能是因为你暂未使用无人机绑定游戏客户端，或者你指向了一个错误的loader.exe文件。
      echo\
      echo 按下任意键后返回主菜单。
      pause
      goto blender_hook_menu
    ) else (
      :blender_delete_config
      cls
      echo 你确定你要继续删除config文件吗？
      echo 删除后你需要重新启动一次客户端以此让无人机重新获取游戏进程根目录。
      echo\
      echo [1] 是
      echo [2] 否（返回主菜单）
      echo\
      set /p "content=在此输入选项前面的数字："
      if "!content!" == "1" (
          echo\
          echo\
          del "!filePath!"
          if exist "!filePath!" (
              echo 删除失败，可能是文件被占用或路径错误。
          ) else (
              echo 已成功删除config文件。
          )
          echo\
          echo 按下任意键后返回主菜单。
          pause
          goto blender_hook_menu
      ) else if "!content!" == "2" (
          goto blender_hook_menu
      ) else (
          echo\
          echo 输入错误。
          timeout /t 2
          goto blender_delete_config
      )
    )
) else if "%choice%"=="9" ( 
    :blender_select_cookies_target
    cls
    echo 请选择要操作的插件版本：
    echo [1]  原神版 Blender/留影机插件
    echo [2]  绝区零版 Blender/留影机插件
    echo [3]  返回主菜单
    echo\
    set /p "blver=在此输入选项前面的数字："
    if "!blver!"=="1" (
        if "!ys_client_exist!"=="0" (
            echo 自检未通过，模组根目录下并没有找到名为 ys_client.lnk 的快捷方式。
            echo 请在模组根目录下创建指向 loader.exe 的快捷方式，命名为 ys_client.lnk ，然后选择 [10] 刷新 Blender/留影机插件 注入器检测信息，再试一次。
            pause
            goto blender_hook_menu
        )
        set "shortcut=%~dp0ys_client.exe.lnk"
        set "cookie_filename=cookie.txt"
    ) else if "!blver!"=="2" (
        if "!zzz_loader_exist!"=="0" (
            echo 自检未通过，模组根目录下并没有找到名为 zzz_loader.lnk 的快捷方式。
            echo 请在模组根目录下创建指向 loader.exe 的快捷方式，命名为 zzz_loader.lnk ，然后选择 [10] 刷新 Blender/留影机插件 注入器检测信息，再试一次。
            pause
            goto blender_hook_menu
        )
        set "shortcut=%~dp0zzz_loader.exe.lnk"
        set "cookie_filename=cookies.json"
    ) else if "!blver!"=="3" (
        goto blender_hook_menu
    ) else (
        echo\
        echo 输入错误。
        timeout /t 2
        goto blender_select_cookies_target
    )
    set "target="
    for /f "delims=" %%i in ('powershell -noprofile -command "(New-Object -ComObject WScript.Shell).CreateShortcut(\"!shortcut!\").TargetPath"') do (
        set "target=%%i"
    )
    for %%i in ("!target!") do set "target_dir=%%~dpi"
    set "fileToDelete=!cookie_filename!"
    set "target_dir=!target_dir!\"
    set "target_dir=!target_dir:~0,-1!"
    set "filePath=!target_dir!\!cookie_filename!"
    if not exist "!filePath!" (
      echo 自检失败，!cookie_filename! 文件不存在于无人机模组目录下。
      echo 这可能是因为你使用的是免费版无人机，或者你指向了一个错误的loader.exe文件。
      echo\
      echo 按下任意键后返回主菜单。
      pause
      goto blender_hook_menu
    ) else (
      :blender_delete_cookiesjson
      cls
      echo 你确定你要继续删除 !cookie_filename! 文件吗？
      echo 删除后你需要重新扫码以登录哔哩哔哩账号。
      echo\
      echo [1] 是
      echo [2] 否（返回主菜单）
      echo\
      set /p "content=在此输入选项前面的数字："
      if "!content!" == "1" (
          echo\
          echo\
          del "!filePath!"
          if exist "!filePath!" (
              echo 删除失败，可能是文件被占用或路径错误。
          ) else (
              echo 已成功删除 !cookie_filename! 文件。
          )
          echo\
          echo 按下任意键后返回主菜单。
          pause
          goto blender_hook_menu
      ) else if "!content!" == "2" (
          goto blender_hook_menu
      ) else (
          echo\
          echo 输入错误。
          timeout /t 2
          goto blender_delete_cookiesjson
      )
    )

) else if "%choice%"=="10" (
    set blender_recheck=1
    goto blender_hook_check
) else if "%choice%"=="11" (
    goto menu
) else if "%choice%"=="2" (
    exit
) else (
    echo 输入错误。
    timeout /t 2
    goto blender_hook_menu
)

:starward_menu
title HoYoShade启动器
cls
echo 欢迎使用HoYoShade启动器！
echo\
echo 模组版本：V3.0.0-Beta.1
echo 开发者：DuolaDStudio X ZelbertYQ X Ex_M
echo 由[幻港之蝶]注入内核驱动
echo\
echo 当前注入列表：联动Starward启动器注入列表
echo 注意：当前注入列表不支持任何Beta/创作者体验服/Devkit/私服等非公开客户端
echo 使用前，请先确保你已Starward启动器安装游戏/已在Starward启动器中绑定游戏客户端路径。
echo 并保持应用设置 - 高级 - URL协议 - 注册URL协议开关保持开启状态。
echo\
echo 本模组仅用于游戏画面调色使用，请遵守本Mod的用户协议和游戏及其开发/发行商相关条例。
echo 你可以在 https://hoyosha.de 中查看用户协议和图文/视频安装说明。
echo 位于中国大陆？ https://cn.hoyosha.de 可以提供更佳的访问体验。
REM 我还是更愿意当一个在背后默默付出的人 XD
echo\
echo [1] 重置模组根目录中的ReShade.ini
echo [2] 启动游戏并注入至 原神（中国大陆 公开客户端）
echo [3] 启动游戏并注入至 原神（哔哩哔哩 公开客户端）
echo [4] 启动游戏并注入至 原神（国际服 公开客户端）
echo [5] 启动游戏并注入至 崩坏三（中国大陆 公开客户端）
echo [6] 启动游戏并注入至 崩坏三（国际服 公开客户端）
echo [7] 启动游戏并注入至 崩坏：星穹铁道（中国大陆 公开客户端）
echo [8] 启动游戏并注入至 崩坏：星穹铁道（哔哩哔哩 公开客户端）
echo [9] 启动游戏并注入至 崩坏：星穹铁道（国际服 公开客户端）
echo [10] 启动游戏并注入至 绝区零（中国大陆 公开客户端）
echo [11] 启动游戏并注入至 绝区零（哔哩哔哩 公开客户端）
echo [12] 启动游戏并注入至 绝区零（国际服 公开客户端）
echo [13] 返回主界面
echo [14] 其它选项
echo [15] 退出程序

echo\
set /p "content=在此输入选项前面的数字："

echo\

if "%content%" == "1" (
    goto ini_Reset
) else if "%content%" == "2" (
    cls
    echo 你选择的注入目标为:原神（中国大陆 公开客户端）
    echo 注入器现已启动。如果Starward的游戏客户端设置无误，HoYoShade将会拉起Starward启动游戏，并注入ReShade至客户端中。
    echo 如果你选择了错误的注入目标，只需关闭此窗口/游戏窗口后重新运行启动器，重新选择即可。
    echo\
    start "" /b inject.exe YuanShen.exe
    start starward://startgame/hk4e_cn
    exit
) else if "%content%" == "3" (
    cls
    echo 你选择的注入目标为:原神（哔哩哔哩 公开客户端）
    echo 注入器现已启动。如果Starward的游戏客户端设置无误，HoYoShade将会拉起Starward启动游戏，并注入ReShade至客户端中。
    echo 如果你选择了错误的注入目标，只需关闭此窗口/游戏窗口后重新运行启动器，重新选择即可。
    echo\
    start "" /b inject.exe YuanShen.exe
    start starward://startgame/hk4e_bilibili
    exit
) else if "%content%" == "4" (
    cls
    echo 你选择的注入目标为:原神（国际服 公开客户端）
    echo 注入器现已启动。如果Starward的游戏客户端设置无误，HoYoShade将会拉起Starward启动游戏，并注入ReShade至客户端中。
    echo 如果你选择了错误的注入目标，只需关闭此窗口/游戏窗口后重新运行启动器，重新选择即可。
    echo\
    start "" /b inject.exe GenshinImpact.exe
    start starward://startgame/hk4e_global
    exit
) else if "%content%" == "5" (
    cls
    echo 你选择的注入目标为:崩坏三（中国大陆 公开客户端）
    echo 注入器现已启动。如果Starward的游戏客户端设置无误，HoYoShade将会拉起Starward启动游戏，并注入ReShade至客户端中。
    echo 如果你选择了错误的注入目标，只需关闭此窗口/游戏窗口后重新运行启动器，重新选择即可。
    echo\
    start "" /b inject.exe BH3.exe
    start starward://startgame/bh3_cn
    exit
) else if "%content%" == "6" (
    cls
    echo 你选择的注入目标为:崩坏三（国际服 公开客户端）
    echo 注入器现已启动。如果Starward的游戏客户端设置无误，HoYoShade将会拉起Starward启动游戏，并注入ReShade至客户端中。
    echo 如果你选择了错误的注入目标，只需关闭此窗口/游戏窗口后重新运行启动器，重新选择即可。
    echo\
    start "" /b inject.exe BH3.exe
    start starward://startgame/bh3_global
    exit
) else if "%content%" == "7" (
    cls
    echo 你选择的注入目标为:崩坏：星穹铁道（中国大陆 公开客户端）
    echo 注入器现已启动。如果Starward的游戏客户端设置无误，HoYoShade将会拉起Starward启动游戏，并注入ReShade至客户端中。
    echo 如果你选择了错误的注入目标，只需关闭此窗口/游戏窗口后重新运行启动器，重新选择即可。
    echo\
    start "" /b inject.exe StarRail.exe
    start starward://startgame/hkrpg_cn
    exit
) else if "%content%" == "8" (
    cls
    echo 你选择的注入目标为:崩坏：星穹铁道（哔哩哔哩 公开客户端）
    echo 注入器现已启动。如果Starward的游戏客户端设置无误，HoYoShade将会拉起Starward启动游戏，并注入ReShade至客户端中。
    echo 如果你选择了错误的注入目标，只需关闭此窗口/游戏窗口后重新运行启动器，重新选择即可。
    echo\
    start "" /b inject.exe StarRail.exe
    start starward://startgame/hkrpg_bilibili
    exit
) else if "%content%" == "9" (
    cls
    echo 你选择的注入目标为:崩坏：星穹铁道（国际服 公开客户端）
    echo 注入器现已启动。如果Starward的游戏客户端设置无误，HoYoShade将会拉起Starward启动游戏，并注入ReShade至客户端中。
    echo 如果你选择了错误的注入目标，只需关闭此窗口/游戏窗口后重新运行启动器，重新选择即可。
    echo\
    start "" /b inject.exe StarRail.exe
    start starward://startgame/hkrpg_global
    exit
) else if "%content%" == "10" (
    cls
    echo 你选择的注入目标为:绝区零（中国大陆 公开客户端）
    echo 注入器现已启动。如果Starward的游戏客户端设置无误，HoYoShade将会拉起Starward启动游戏，并注入ReShade至客户端中。
    echo 如果你选择了错误的注入目标，只需关闭此窗口/游戏窗口后重新运行启动器，重新选择即可。
    echo\
    start "" /b inject.exe ZenlessZoneZero.exe
    start starward://startgame/nap_cn
    exit
) else if "%content%" == "11" (
    cls
    echo 你选择的注入目标为:绝区零（哔哩哔哩 公开客户端）
    echo 注入器现已启动。如果Starward的游戏客户端设置无误，HoYoShade将会拉起Starward启动游戏，并注入ReShade至客户端中。
    echo 如果你选择了错误的注入目标，只需关闭此窗口/游戏窗口后重新运行启动器，重新选择即可。
    echo\
    start "" /b inject.exe ZenlessZoneZero.exe
    start starward://startgame/nap_bilibili
    exit
) else if "%content%" == "12" (
    cls
    echo 你选择的注入目标为:绝区零（国际服 公开客户端）
    echo 注入器现已启动。如果Starward的游戏客户端设置无误，HoYoShade将会拉起Starward启动游戏，并注入ReShade至客户端中。
    echo 如果你选择了错误的注入目标，只需关闭此窗口/游戏窗口后重新运行启动器，重新选择即可。
    echo\
    start "" /b inject.exe ZenlessZoneZero.exe
    start starward://startgame/nap_global
    exit
) else if "%content%" == "13" (
    goto menu
) else if "%content%" == "14" (
    goto other
) else if "%content%" == "15" (
    exit
) else (
    echo 输入错误。
    timeout /t 2
    goto starward_menu
    )
exit
