@echo off

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
    echo Welcome to use HoYoShade injector!
    echo\
    echo Mod Version:V2.013.0 Stable
    echo Developer:DuolaDStudio X °¢Ïò¾úAXBro X Ex_M
    echo\
    echo We detected that this is your first time using this mod. Reshade.ini has been generated in the mod's root directory.
    echo You need to copy Reshade.ini to the game process root directory before you can use this mod.
    echo Do you want to check the game's root directory now? This way, 
	echo you can easily find the game process root directory path to copy files.
    echo\
    echo [1]Alright, now running the game process root directory path detection.
    echo [2]No, I know how to operate it.
    echo\
    set /p "tmp=Type the number here:"
    if "%tmp%" == "1" (
        goto PatchCheck
    ) else if "%tmp%" == "2" (
        goto menu
    ) else (
        echo\
        echo Input error.
        timeout /t 2
        goto FileCheck
    )
)

:menu
title HoYoShade Starter
cls
echo Welcome to use HoYoShade injector!
echo\
echo Mod Version:V2.013.0 Stable
echo Developer:DuolaDStudio X °¢Ïò¾úAXBro X Ex_M
echo\
echo Please note that you need to copy Reshade.ini to the root directory of the game process before you can use this mod.
echo\
echo This mod is only used for adjusting the game screen color, please follow the relevant rules of the game.
echo When using the mod to take footage for video release,
echo please note: "This video is rendered with support provided by GitHub@DuolaD/HoYoShade".
echo\
echo If you are unable to make a note for some special reason,
echo please contact the developer through the contact information in the "Other options" to explain.
echo\
echo [1]check the game's root directory
echo [2]Reset the ReShade.ini in the mod's root directory.
echo [3]Genshin Impact (Chinese server)
echo [4]Genshin Impact (BiliBili server)
echo [5]Genshin Impact (Global server/Epic Games Store Version)
echo [6]Honkai Impact 3 (Universal)
echo [7]Honkai: Star Rail  (Universal)
echo [8]Other options
echo [9]Exit

echo\
set /p "content=Type the number here:"

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
    echo Input error.
    timeout /t 2
    goto menu
    )
exit

:other
title HoYoShade Starter
cls
echo Welcome to use HoYoShade injector!
echo\
echo Mod Version:V2.013.0 Stable
echo Developer:DuolaDStudio X °¢Ïò¾úAXBro X Ex_M
echo\
echo If you need to check for version updates, you can visit our repository to see if there are any new released versions.
echo The developer options are only used for debugging/testing purposes, 
echo unless the developer specifically asks you to do so, please do not use it casually.
echo\
echo In addition to providing downloads for this mod, 
echo CYteam Netdisk also offers free mirror download services for global server Genshin Impact/HSR/HoYoLAB installation package files in mainland China.
echo heck it if you want~
echo Thank you to CYteam for providing the cloud storage service.
echo\
echo [1]Visit our main repository on GitHub.
echo [2]Access the cloud storage service provided by CYteam.
echo [3]Sponsor me on afdian(supports WeChat Pay and Alipay).
echo [4]Sponsor me on Patreon (supporting Visa,mastercard,PayPal,Etc).
echo [5]Join our official QQ group for the mod.
echo [6]Join our CYTeam resource QQ group.
echo [7]About
echo [8]developer options
echo [9]Back to menu
echo [10]Exit

echo\
set /p "content=Type the number here:"

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
    echo Input error.
    timeout /t 2
    goto other
)
goto other

:develop
title HoYoShade Starter (You have entered developer options!!!)
cls
echo Welcome to use HoYoShade injector!
echo\
echo Mod Version:V2.013.0 Stable
echo Developer:DuolaDStudio X °¢Ïò¾úAXBro X Ex_M
echo\
echo The developer options are only used for debugging/testing purposes, 
echo unless the developer specifically asks you to do so, please do not use it casually.
echo\
echo [1]Custom injection.
echo [2]Back to menu
echo [3]Back to Other options pages
echo [4]Exit

echo\
set /p "content=Type the number here:"

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
    echo Input error.
    timeout /t 2
    goto develop
)
goto develop@echo off


:BiliBili_Warning
title HoYoShade Starter(BiliBili server Start warning!)
cls
echo Welcome to use HoYoShade injector!
echo\
echo Mod Version:V2.013.0 Stable
echo Developer:DuolaDStudio X °¢Ïò¾úAXBro X Ex_M
echo\
echo Attention!!!
echo The Bilibili client uses external software to log into gaming accounts.
echo it's not like the way of logging into the game account in the game with Chinese server/global/Epic version.
echo Therefore, please make sure the game has successfully logged into the game account 
echo before pressing the 'Home' key to open the Reshade control panel for further operations.
echo\
echo If you open the Reshade console before successfully logging into the game account, the game will freeze after the login window pops up.
echo If you happened to not notice this, simply open the task manager and close the game and restart processes.
echo Restart the HoYoShade injector to the waiting for injection game interface, and reopen the game.
timeout /t 5
pause
goto YuanShen_inject

:YuanShen_inject
powershell -command Start-Process -FilePath inject.exe YuanShen.exe -Verb RunAs
exit

:customize_inject
title HoYoShade Starter(You have entered the custom injection interface!!!)
cls
echo Welcome to use HoYoShade injector!
echo\
echo Mod Version:V2.013.0 Stable
echo Developer:DuolaDStudio X °¢Ïò¾úAXBro X Ex_M
echo\
echo Caution! This function is only for developers to test new games. This means there may be unknown risks/bugs.
echo Unless you are a second developer or under developer guidance,
echo please do not inject this Reshade function into other games.
echo\
echo Usage: Enter the name of the target program file, without adding the '.exe' extension, 
echo and press enter to confirm.
echo After the injection window interface pops up, you can start the target program.
echo "/exit" can be entered to return to the development interface.
echo\
set /p "content=Type here:"
if "%content%" == "/exit" (
    goto develop
) else (
    powershell -command Start-Process -FilePath inject.exe %content%.exe -Verb RunAs
    exit
)

:PatchCheck


echo\
echo Genshin Impact [CN server\Bilibili server] due to sharing the registration path and file.
echo It can only detect the most recent installation or update of Genshin Impact's launcher.
echo\
echo Honkai Impact 3 [Korean Server] does not support detection due to character issues, 
echo but HoYoShade still supports injection.
echo\

set regPath=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Ô­Éñ
set regValue=InstallPath

reg query "%regPath%" > nul 2>&1
if %errorlevel% neq 0 (
    echo Genshin Impact[CN server\Bilibili server]:[Not Found]
    goto Genshin_Impact_Globel_Game_Check
)

reg query "%regPath%" /v "%regValue%" > nul 2>&1
if %errorlevel% neq 0 (
    echo Genshin Impact[CN server\Bilibili server]:[Not Found£¨The registry has been tampered with.£©]
    goto Genshin_Impact_Globel_Game_Check
)

for /f "tokens=2*" %%a in ('reg query "%regPath%" /v "%regValue%" ^| findstr /i "%regValue%"') do (
    set "regData=%%b"
)

if exist "%regData%\Genshin Impact game" (
    echo Genshin Impact[CN server\Bilibili server]'s root directory:%regData%\Genshin Impact game
) else (
    echo Genshin Impact[CN server\Bilibili server]:[It seems that you have only installed the launcher and not the actual game.]
)

:Genshin_Impact_Globel_Game_Check
set regPath=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Genshin Impact
set regValue=InstallPath

reg query "%regPath%" > nul 2>&1
if %errorlevel% neq 0 (
    echo Genshin Impact[Global Server]:[Not Found]
    goto Honkai_3rd_CN_Game_Check
)

reg query "%regPath%" /v "%regValue%" > nul 2>&1
if %errorlevel% neq 0 (
    echo Genshin Impact[Global Server]:[Not Found£¨The registry has been tampered with.£©]
    goto Honkai_3rd_CN_Game_Check
)

for /f "tokens=2*" %%a in ('reg query "%regPath%" /v "%regValue%" ^| findstr /i "%regValue%"') do (
    set "regData=%%b"
)

if exist "%regData%\Genshin Impact game" (
    echo Genshin Impact[Global Server]'s root directory:%regData%\Genshin Impact game
) else (
    echo Genshin Impact[Global Server]:[It seems that you have only installed the launcher and not the actual game.]
)

:Honkai_3rd_CN_Game_Check
set regPath=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\±À»µ3
set regValue=InstallPath

reg query "%regPath%" > nul 2>&1
if %errorlevel% neq 0 (
    echo Honkai Impact 3rd[CN server]:[Not Found]
    goto Honkai_3rd_TC_Game_Check
)

reg query "%regPath%" /v "%regValue%" > nul 2>&1
if %errorlevel% neq 0 (
    echo Honkai Impact 3rd[CN server]:[Not Found£¨The registry has been tampered with.£©]
    goto Honkai_3rd_TC_Game_Check
)

for /f "tokens=2*" %%a in ('reg query "%regPath%" /v "%regValue%" ^| findstr /i "%regValue%"') do (
    set "regData=%%b"
)

if exist "%regData%\Games" (
    echo Honkai Impact 3rd[CN server]'s root directory:%regData%\Games
) else (
    echo Honkai Impact 3rd[CN server]:[It seems that you have only installed the launcher and not the actual game.]
)

:Honkai_3rd_TC_Game_Check
set regPath=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\±À‰Ä3rd
set regValue=InstallPath

reg query "%regPath%" > nul 2>&1
if %errorlevel% neq 0 (
    echo Honkai Impact 3rd[Traditional Chinese Server]:[Not Found]
    goto Honkai_3rd_Asia_Game_Check
)

reg query "%regPath%" /v "%regValue%" > nul 2>&1
if %errorlevel% neq 0 (
    echo Honkai Impact 3rd[Traditional Chinese Server]:[Not Found£¨The registry has been tampered with.£©]
    goto Honkai_3rd_Asia_Game_Check
)

for /f "tokens=2*" %%a in ('reg query "%regPath%" /v "%regValue%" ^| findstr /i "%regValue%"') do (
    set "regData=%%b"
)

if exist "%regData%\Games" (
    echo Honkai Impact 3rd[Traditional Chinese Server]'s root directory:%regData%\Games
) else (
    echo Honkai Impact 3rd[Traditional Chinese Server]:[It seems that you have only installed the launcher and not the actual game.]
)

:Honkai_3rd_Asia_Game_Check
set regPath=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Honkai Impact 3
set regValue=InstallPath

reg query "%regPath%" > nul 2>&1
if %errorlevel% neq 0 (
    echo Honkai Impact 3rd[Southeast Asia server]:[Not Found]
    goto Honkai_3rd_GLB_Game_Check
)

reg query "%regPath%" /v "%regValue%" > nul 2>&1
if %errorlevel% neq 0 (
    echo Honkai Impact 3rd[Southeast Asia server]:[Not Found£¨The registry has been tampered with.£©]
    goto Honkai_3rd_GLB_Game_Check
)

for /f "tokens=2*" %%a in ('reg query "%regPath%" /v "%regValue%" ^| findstr /i "%regValue%"') do (
    set "regData=%%b"
)

if exist "%regData%\Games" (
    echo Honkai Impact 3rd[Southeast Asia server]'s root directory:%regData%\Games
) else (
    echo Honkai Impact 3rd[Southeast Asia server]:[It seems that you have only installed the launcher and not the actual game.]
)

:Honkai_3rd_GLB_Game_Check
set regPath=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Honkai Impact 3rd
set regValue=InstallPath

reg query "%regPath%" > nul 2>&1
if %errorlevel% neq 0 (
    echo Honkai Impact 3rd[Europe and Americas Servers]:[Not Found]
    goto Honkai_StarRail_CN_Game_Check
)

reg query "%regPath%" /v "%regValue%" > nul 2>&1
if %errorlevel% neq 0 (
    echo Honkai Impact 3rd[Europe and Americas Servers]:[Not Found£¨The registry has been tampered with.£©]
    goto Honkai_StarRail_CN_Game_Check
)

for /f "tokens=2*" %%a in ('reg query "%regPath%" /v "%regValue%" ^| findstr /i "%regValue%"') do (
    set "regData=%%b"
)

if exist "%regData%\Games" (
    echo Honkai Impact 3rd[Europe and Americas Servers]'s root directory:%regData%\Games
) else (
    echo Honkai Impact 3rd[Europe and Americas Servers]:[It seems that you have only installed the launcher and not the actual game.]
)

:Honkai_StarRail_CN_Game_Check
set regPath=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\±À»µ£ºÐÇñ·ÌúµÀ
set regValue=InstallPath

reg query "%regPath%" > nul 2>&1
if %errorlevel% neq 0 (
    echo Honkai: Star Rail[CN server]:[Not Found]
    goto Honkai_StarRail_Globel_Game_Check
)

reg query "%regPath%" /v "%regValue%" > nul 2>&1
if %errorlevel% neq 0 (
    echo Honkai: Star Rail[CN server]:[Not Found£¨The registry has been tampered with.£©]
    goto Honkai_StarRail_Globel_Game_Check
)

for /f "tokens=2*" %%a in ('reg query "%regPath%" /v "%regValue%" ^| findstr /i "%regValue%"') do (
    set "regData=%%b"
)

if exist "%regData%\Games" (
    echo Honkai: Star Rail[CN server]'s root directory:%regData%\Games
) else (
    echo Honkai: Star Rail[CN server]:[It seems that you have only installed the launcher and not the actual game.]
)

:Honkai_StarRail_Globel_Game_Check
set regPath=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Star Rail
set regValue=InstallPath

reg query "%regPath%" > nul 2>&1
if %errorlevel% neq 0 (
    echo Honkai: Star Rail[Global Server]:[Not Found]
	goto checkend
)

reg query "%regPath%" /v "%regValue%" > nul 2>&1
if %errorlevel% neq 0 (
    echo Honkai: Star Rail[Global Server]:[Not Found£¨The registry has been tampered with.£©]
	goto checkend
)

for /f "tokens=2*" %%a in ('reg query "%regPath%" /v "%regValue%" ^| findstr /i "%regValue%"') do (
    set "regData=%%b"
)

if exist "%regData%\Games" (
    echo Honkai: Star Rail[Global Server]'s root directory:%regData%\Games
) else (
    echo Honkai: Star Rail[Global Server]:[It seems that you have only installed the launcher and not the actual game.]
)

:checkend
echo\
echo The detection is complete, please copy the path or open the folder in File Explorer according to the path,
echo and copy the Reshade.ini in the root directory of the mod to the root directory.
pause
goto menu

:about_HoYoShade
title HoYoShade
cls
echo HoYoShade
echo HoYo it,Great it.
echo\
echo DuolaDStudio X °¢Ïò¾úAXBro x Ex_M
echo Joint contributions.
echo\
echo Mod Version:V2.013.0 Stable
echo\
echo HoYoShade is based on the secondary development of ReShade, 
echo and all files except effect libraries/Presets are open source on GitHub in accordance with the BSL-3 open source license.
echo You can check the official ReShade information on the Reshade.me
echo Modify By DuolaDStudio Hong Kong Ltd,All rights reserved.
echo\
echo Developer list:
echo -DuolaDStudio Hong Kong Ltd.
echo   ¡ª¡ª¶ßÀ²D‰ôDuolaD[Reshade Modify/major version develop/injecter/Presets]
echo   ¡ª¡ªÁÕÄÝÌØLynetteNotFound[HoYoShade minor version and patch version develop]
echo DuolaDStudio[Reshade Modify/Starter/Presets]
echo Ex_M[Support/guide/GUI build]
echo °¢Ïò¾úAXBro[paid effect shader/Promotion/guide]
echo\
echo Thank you everyone for being here! HoYoShade will be better tomorrow!
pause
goto other

:ini_Reset
title HoYoShade Starter
cls
echo Welcome to use HoYoShade injector!
echo\
echo Mod Version:V2.013.0 Stable
echo Developer:DuolaDStudio X °¢Ïò¾úAXBro X Ex_M
echo\
echo Please note: You only need to reset ReShade.ini after moving the mod directory.
echo Apart from this, you generally don't need to perform a reset operation.
echo\
echo After reset, you need to recopy ReShade.ini to the game process root directory.
echo Continue Process?
echo\
echo [1]Yes
echo [2]No(Back to menu)
echo\
set /p "content=Type the number here:"

if "%content%" == "1" (
    start "" /wait ".\InjectResource\INIBuild.exe"
    start "" "convert_encoding.bat"
	:File_Reset
	cls
	echo Welcome to use HoYoShade injector!
	echo\
	echo Mod Version:V2.013.0 Stable
	echo Developer:DuolaDStudio X °¢Ïò¾úAXBro X Ex_M
	echo\
    echo Reset successful! The reset ReShade.ini has now replaced the old ReShade.ini in the mod directory.
    echo You need to replace the original ReShade.ini in the game's root directory with the reset ReShade.ini to use this mod.
    echo Do you want to check the game's root directory now? This way, you can easily find the game process root directory path to copy files.
    echo\
    echo [1]Alright, now running the game process root directory path detection.
    echo [2]No, I know how to operate it.
    echo\
	set /p "tmp=Type the number here:"
    if "%tmp%" == "1" (
        goto PatchCheck
    ) else if "%tmp%" == "2" (
        goto menu
    ) else (
        echo\
        echo Input error.
        timeout /t 2
        goto File_Reset
    )
) else if "%content%" == "2" (
    goto menu
) else (
    echo\
    echo Input error.
    timeout /t 2
    goto ini_Reset
)
