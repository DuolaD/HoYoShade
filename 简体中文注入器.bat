@echo off

:menu
title Reshade_For_HoYoVerse_Games Starter(Powered By DuolaD)
cls
echo 欢迎使用Reshade_For_HoYoVerse_Games注入器！
echo Gitee镜像仓库名：Reshade_For_MiHoYo_Games
echo\
echo 模组版本：V1.3.0 Stable
echo\
echo 如果你发现你想玩的游戏并没有出现在注入列表里，那么说明它暂时还不支持使用。
echo 对于私服玩家，请自行判断你所使用的是哪一个平台的客户端，选择对应客户端启动注入器即可
echo 如果你在官方服务器启动这个模组并被米哈游封号，本人不会承担任何责任，请三思！
echo\
echo [1]原神（中国大陆服客户端）
echo [2]原神（哔哩哔哩服客户端）
echo [3]原神（国际服客户端/Epic客户端）
echo [4]崩坏：星穹铁道(国服客户端/国际服客户端/Epic客户端)
echo [5]其它设置选项
echo [6]退出程序

echo\
set /p "content=在此输入选项前面的数字："

powershell -command Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted
if "%content%" == "1" (
    goto YuanShen_inject
) else if "%content%" == "2" (
    goto BiliBili_Warning
) else if "%content%" == "3" (
    powershell -command Start-Process -FilePath inject.exe GenshinImpact.exe -Verb RunAs
    powershell -command Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Restricted
    exit
) else if "%content%" == "4" (
    powershell -command Start-Process -FilePath inject.exe StarRail.exe -Verb RunAs
    powershell -command Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Restricted
    exit
) else if "%content%" == "5" (
    goto other
) else if "%content%" == "6" (
    exit
) else (
    echo\
    echo 输入错误。
    timeout /t 2
    goto menu
    )
exit

:other
title Reshade_For_HoYoVerse_Games Starter(Powered By DuolaD)
cls
echo 欢迎使用Reshade_For_HoYoVerse_Games注入器！
echo Gitee镜像仓库名：Reshade_For_MiHoYo_Games
echo\
echo 模组版本：V1.3.0 Stable
echo\
echo 如果你需要检查版本更新，可以去访问我们的仓库查看是否有发行更新版本
echo 开发者选项仅用于调试/检测错误需要，除非开发者明确要求你这样做，否则请勿轻易使用
echo\
echo [1]访问我们的GitHub主仓库
echo [2]访问我们的Gitee国内镜像仓库
echo [3]开发者选项
echo [4]返回主界面
echo [5]退出程序

echo\
set /p "content=在此输入选项前面的数字："

if "%content%" == "1" (
    start "" "https://github.com/DuolaD/Reshade_For_HoyoVerse_Games/"
    goto other
) else if "%content%" == "2" (
    start "" "https://gitee.com/DuolaD/Reshade_For_MiHoYo_Games"
    goto other
) else if "%content%" == "3" (
    goto develop
) else if "%content%" == "4" (
    goto menu
) else if "%content%" == "5" (
    exit
) else (
    echo\
    echo 输入错误。
    timeout /t 2
    goto other
)
goto other

:develop
title Reshade_For_HoYoVerse_Games Starter(你已进入开发者选项！！！)
cls
echo 欢迎使用Reshade_For_HoYoVerse_Games注入器！
echo Gitee镜像仓库名：Reshade_For_MiHoYo_Games
echo\
echo 模组版本：V1.3.0 Stable
echo\
echo 注意！开发者选项仅用于调试/检测错误需要，除非开发者明确要求你这样做，否则请勿轻易使用！
echo\
echo [1]查看当前PowerShell组策略状态
echo [2]解锁PowerShell组策略
echo [3]回锁PowerShell组策略
echo [4]返回主界面
echo [5]返回其它设置选项
echo [6]退出程序

echo\
set /p "content=在此输入选项前面的数字："

if "%content%" == "1" (
    powershell -Command "Get-ExecutionPolicy"
    pause
    goto develop
) else if "%content%" == "2" (
    powershell -command Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted
    powershell -Command "Get-ExecutionPolicy"
    echo 成功！
    pause
    goto develop
) else if "%content%" == "3" (
    powershell -command Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Restricted
    powershell -Command "Get-ExecutionPolicy"
    echo 成功！
    pause
    goto develop
) else if "%content%" == "4" (
    goto menu
) else if "%content%" == "5" (
    goto other
) else if "%content%" == "6" (
    exit
) else (
    echo\
    echo 输入错误。
    timeout /t 2
    goto develop
)
goto develop@echo off


:BiliBili_Warning
title Reshade_For_HoYoVerse_Games Starter(哔哩哔哩客户端启动前警告！)
cls
echo 欢迎使用Reshade_For_HoYoVerse_Games注入器！
echo Gitee镜像仓库名：Reshade_For_MiHoYo_Games
echo\
echo 模组版本：V1.3.0 Stable
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
powershell -command Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Restricted
exit