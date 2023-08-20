@echo off

:menu
title Reshade_For_HoYoVerse_Games Starter(Powered By DuolaD)
cls
echo Welcome to DuolaD's ToolBox
echo GitHub Repositories Name:Reshade_For_HoYoVerse_Games
echo Gitee Mirror Repositories Name:Reshade_For_MiHoYo_Games
echo\
echo Mod Version£ºV1.3.0 Stable
echo\
echo If you find that the game you want to play is not listed for injection,
echo it means that it is currently not supported for use.
echo\
echo For private server players,
echo please determine which platform client you are using and choose the corresponding client to start the injector.
echo\
echo If you start this mod on the official server and get banned by HoYoVerse,
echo I will not be responsible for any consequences.
echo\
echo [1]Genshin Impact(CN Server)
echo [2]Genshin Impact(BiliBili)
echo [3]Genshin Impact(Globel Server/Epic)
echo [4]Honkai: Star Rail(CN Server/Globel Server/Epic)
echo [5]Other Setting Options Pages
echo [6]Exit

echo\
set /p "content=Please input the number before the option you choose£º"

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
    echo Input Error.
    timeout /t 2
    goto menu
    )
exit

:other
title Reshade_For_HoYoVerse_Games Starter(Powered By DuolaD)
cls
echo Welcome to DuolaD's ToolBox
echo GitHub Repositories Name:Reshade_For_HoYoVerse_Games
echo Gitee Mirror Repositories Name:Reshade_For_MiHoYo_Games
echo\
echo Mod Version£ºV1.3.0 Stable
echo\
echo If you need to check for version updates, you can visit our repository to see if there are any released updates.
echo\
echo The developer options are only intended for debugging/diagnostic purposes,
echo and should not be used unless specifically requested by a developer.
echo\
echo [1]Visit Our Main Repositories on Github
echo [2]Visit Our Mirror Repositories on Gitee(Use this If You Can't Open Github)
echo [3]Developer Mode Page
echo [4]Back Menu Page
echo [5]EXIT

echo\
set /p "content=Please input the number before the option you choose£º"

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
    echo Input Error.
    timeout /t 2
    goto other
)
goto other

:develop
title Reshade_For_HoYoVerse_Games Starter(Developer Mode On!!!)
cls
echo Welcome to DuolaD's ToolBox
echo GitHub Repositories Name:Reshade_For_HoYoVerse_Games
echo Gitee Mirror Repositories Name:Reshade_For_MiHoYo_Games
echo\
echo Mod Version£ºV1.3.0 Stable
echo\
echo Remember!The developer options are only intended for debugging/diagnostic purposes
echo and should not be used unless specifically requested by a developer.
echo\
echo [1]View current PowerShell Group Policy status
echo [2]Unlock PowerShell Group Policy
echo [3]lock PowerShell Group Policy
echo [4]Back Menu Page
echo [5]Back Other Setting Options Page
echo [6]EXIT

echo\
set /p "content=Please input the number before the option you choose£º"

if "%content%" == "1" (
    powershell -Command "Get-ExecutionPolicy"
    pause
    goto develop
) else if "%content%" == "2" (
    powershell -command Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted
    powershell -Command "Get-ExecutionPolicy"
    echo Success£¡
    pause
    goto develop
) else if "%content%" == "3" (
    powershell -command Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Restricted
    powershell -Command "Get-ExecutionPolicy"
    echo Success£¡
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
    echo Input Error.
    timeout /t 2
    goto develop
)
goto develop

:BiliBili_Warning
title Reshade_For_HoYoVerse_Games Starter(Warning!!!)
cls
echo Welcome to DuolaD's ToolBox
echo GitHub Repositories Name:Reshade_For_HoYoVerse_Games
echo Gitee Mirror Repositories Name:Reshade_For_MiHoYo_Games
echo\
echo Mod Version£ºV1.3.0 Stable
echo\
echo Warning!!!
echo Genshin Impact[BiliBili] are use outside sortware to login the account.
echo So you make sure you login account success before you press 'Home' to open Reshade console
echo\
echo If you open Reshade console before game login account success,the game will no response after it open the outside login software.
echo If you accidentally don't notice this and this happens, just open task manager and close the game and game related processes.
echo Then restart this mod injector to waiting game start interface and use Genshin Impact[BiliBili] offical starter to start the game.
timeout /t 5
pause
goto YuanShen_inject

:YuanShen_inject
powershell -command Start-Process -FilePath inject.exe YuanShen.exe -Verb RunAs
powershell -command Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Restricted
exit