@echo off

chcp 936

title HoYoShade Starter
cls

net session >nul 2>&1
if %errorLevel% neq 0 (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
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
    title HoYoShade Starter
    cls
    echo Welcome to use HoYoShade starter!
    echo\
    echo Mod Version:V2.X.X Stable - NextVersion
    echo Developer:DuolaDStudio X ZelbertYQ X Ex_M
    echo\
    echo We have detected that the necessary files for £¨Open£©HoYoShade framework injection are missing.
    echo\
    echo Possible reasons for this message include:
    echo 1:You did not extract all files from the compressed package.
    echo 2:You did not paste all files during an update operation.
    echo 3:Your antivirus software/other programs mistakenly identified £¨Open£©HoYoShade as a virus and deleted some files.
    echo 4:You accidentally or intentionally renamed some critical files.
    echo\
    echo After pressing any key, the launcher will exit.
    echo If you want to continue running £¨Open£©HoYoShade, please visit our GitHub repository £¨https://github.com/DuolaD/HoYoShade£© to re-download the latest compressed package from the Releases page and extract all files.
    pause
    exit
)

set "filepath=%~dp0Reshade.ini"

if exist "%filepath%" ( 
    goto menu
) else (
    cls
    start "" /wait /b ".\LauncherResource\INIBuild.exe"
    :FileCheck
    cls
    echo Welcome to use HoYoShade starter!
    echo\
    echo Mod Version:V2.X.X Stable - NextVersion
    echo Developer:DuolaDStudio X ZelbertYQ X Ex_M
    echo\
    echo Congratulations£¡You have successfully installed HoYoShade£¡
    echo We have detected that this is your first time using this mod. Reshade.ini has been generated in the root directory of the mod.
    echo\
    echo If this is your first time using ReShade in a miHoYo / HoYoverse game, you can now continue.
    echo The injector will automatically detect and copy the configuration file £¨ReShade.ini£© to the game process root directory.
    echo\
    echo But if you have used ReShade in miHoYo / HoYoverse games before, you may need to delete ReShade.ini £¨required£© and ReShade.log £¨optional, but recommended£© first.
    echo For example:
    echo - You have used HoYoShade V2.5.1 Stable or below.
    echo - You have used ReShade developed by others/yourself based on the official ReShade/HoYoShade.
    echo\
    echo How to find the root directory of the game process?
    echo For HoYoPlay £¨HoYoVerse official new launcher£©:
    echo Click the "More" icon next to the Start button - Game Settings to view the root directory of the game process.
    echo Click 'Open Directory' to open the root directory of the game process using the file explorer.
    echo\
    echo For StarWard: Click the gear icon next to the Start button to view the root directory of the game process.
    echo Click the game process root directory to open it using the file explorer.
    echo\
    echo Still not sure how to proceed?
    echo You can check the user agreement and illustrated/video installation guide in the 'Tutorial' folder within the root directory of the mod.
    echo\
    pause
    goto menu
)

:menu
title HoYoShade Starter
cls
echo Welcome to use HoYoShade starter!
echo\
echo Mod Version:V2.X.X Stable - NextVersion
echo Developer:DuolaDStudio X ZelbertYQ X Ex_M
echo\
echo Current injection list: Public client injection list
echo\
echo This mod is only for color grading in-game scenes.  
echo Please comply with the user agreement of this Mod and the relevant regulations of the game and its developers/publishers.
echo You can check the user agreement and illustrated installation guide in the Tutorial folder located in the mod root directory.  
REM I still prefer to be a person who pays silently behind the scenes XD.
echo\
echo *: This injection option is applicable to the Beta/Creator Experience server, 
echo but you may need to obtain a patch from the developers for injection.
echo\
echo [1]Reset the ReShade.ini in the mod's root directory.
echo [2]Inject into Genshin Impact £¨CN/BiliBil Public£¨REL£©/Devkit/Beta/Creator Experience Client£©*
echo [3]Inject into Genshin Impact £¨Global/Epic Games Store Public£¨REL£©/Beta/Creator Experience Client£©*
echo [4]Inject into Honkai Impact 3 £¨Universal Public£¨REL£©/Beta Client£©*
echo [5]Inject into Honkai: Star Rail £¨Universal Public£¨REL£©/Beta/Creator Experience Client£©*
echo [6]Inject into Zenless Zone Zero £¨Universal Public£¨REL£© Client£©
echo [7]Switch to the test server client injection list.
echo [8]Other options
echo [9]Exit

echo\
set /p "content=Type the number here:"

if "%content%" == "1" (
    goto ini_Reset
) else if "%content%" == "2" (
    :YS_CheckProcess
    tasklist /FI "IMAGENAME eq YuanShen.exe" | find /i "YuanShen.exe" >nul
    if not errorlevel 1 (
        taskkill /IM YuanShen.exe /F >nul 2>&1
        goto YS_CheckProcess
    )
    echo The injection target you selected is:Genshin Impact £¨CN/BiliBil Public£¨REL£©/Devkit/Beta/Creator Experience Client£©
    echo The injector has now started.
    echo You can now use the launcher to start the game. The injector will be injected simultaneously.
    echo If you selected the wrong injection target, simply close this window and restart the starter to choose again.
    echo\
    echo Important: You must use a game launcher to start the game £¨whether it is the official launcher or a third-party launcher£©,
    echo You cannot directly double-click the process/process shortcut to start the game. Otherwise, the injection will fail.
    echo\
    echo\
    echo This injection option supports injecting HoYoShade into Genshin Impact £¨CN/BiliBil Devkit/Beta/Creator Experience Client£©.
    echo\
    echo When injecting into such clients, you must use the game launcher provided to you by the official source to start the game.
    echo You cannot directly double-click the process/process shortcut to start the game, otherwise it may lead to injection failure.
    echo However, if the official source has not provided you with a launcher/you do not have a launcher and the injection fails, 
    echo you may need to obtain a patch from the developers for injection.
    echo This patch is a closed-source patch and is not built into HoYoShade. You cannot achieve the injection function by modifying the HoYoShade source code.
    echo For more information, please contact the developer DuolaD £¨https://github.com/DuolaD£© to get more information.
    echo\
    start "" /wait /b inject.exe YuanShen.exe
    exit
) else if "%content%" == "3" (
    :GI_CheckProcess
    tasklist /FI "IMAGENAME eq GenshinImpact.exe" | find /i "GenshinImpact.exe" >nul
    if not errorlevel 1 (
        taskkill /IM GenshinImpact.exe /F >nul 2>&1
        goto GI_CheckProcess
    )
    cls
    echo The injection target you selected is:Genshin Impact £¨Global/Epic Games Store Public£¨REL£©/Beta/Creator Experience Client£©
    echo The injector has now started.
    echo You can now use the launcher to start the game. The injector will be injected simultaneously.
    echo If you selected the wrong injection target, simply close this window and restart the starter to choose again.
    echo\
    echo Important: You must use a game launcher to start the game £¨whether it is the official launcher or a third-party launcher£©,
    echo You cannot directly double-click the process/process shortcut to start the game. Otherwise, the injection will fail.
    echo\
    echo\
    echo This injection option supports injecting HoYoShade into Genshin Impact £¨Global Beta/Creator Experience Client£©.
    echo\
    echo When injecting into such clients, you must use the game launcher provided to you by the official source to start the game.
    echo You cannot directly double-click the process/process shortcut to start the game, otherwise it may lead to injection failure.
    echo However, if the official source has not provided you with a launcher/you do not have a launcher and the injection fails, 
    echo you may need to obtain a patch from the developers for injection.
    echo This patch is a closed-source patch and is not built into HoYoShade. You cannot achieve the injection function by modifying the HoYoShade source code.
    echo For more information, please contact the developer DuolaD £¨https://github.com/DuolaD£© to get more information.
    echo\
    start "" /wait /b inject.exe GenshinImpact.exe
    exit
) else if "%content%" == "4" (
    cls
    echo The injection target you selected is:Honkai Impact 3 £¨Universal Public£¨REL£©/Beta Client£©
    echo The injector has now started.
    echo You can now use the launcher to start the game. The injector will be injected simultaneously.
    echo If you selected the wrong injection target, simply close this window and restart the starter to choose again.
    echo\
    echo Important: You must use a game launcher to start the game £¨whether it is the official launcher or a third-party launcher£©,
    echo You cannot directly double-click the process/process shortcut to start the game. Otherwise, the injection will fail.
    echo\
    echo\
    echo This injection option supports injecting HoYoShade into Honkai Impact 3 £¨Universal Beta Client£©
    echo\
    echo When injecting into such clients, you must use the game launcher provided to you by the official source to start the game.
    echo You cannot directly double-click the process/process shortcut to start the game, otherwise it may lead to injection failure.
    echo However, if the official source has not provided you with a launcher/you do not have a launcher and the injection fails, 
    echo you may need to obtain a patch from the developers for injection.
    echo This patch is a closed-source patch and is not built into HoYoShade. You cannot achieve the injection function by modifying the HoYoShade source code.
    echo For more information, please contact the developer DuolaD £¨https://github.com/DuolaD£© to get more information.
    echo\
    start "" /wait /b inject.exe BH3.exe
    exit
) else if "%content%" == "5" (
    cls
    echo The injection target you selected is:Honkai: Star Rail £¨Universal Public£¨REL£©/Beta/Creator Experience Client£©
    echo The injector has now started.
    echo You can now use the launcher to start the game. The injector will be injected simultaneously.
    echo If you selected the wrong injection target, simply close this window and restart the starter to choose again.
    echo\
    echo Important: You must use a game launcher to start the game £¨whether it is the official launcher or a third-party launcher£©,
    echo You cannot directly double-click the process/process shortcut to start the game. Otherwise, the injection will fail.
    echo\
    echo\
    echo This injection option supports injecting HoYoShade into Honkai: Star Rail £¨Universal Beta/Creator Experience Client£©
    echo\
    echo When injecting into such clients, you must use the game launcher provided to you by the official source to start the game.
    echo You cannot directly double-click the process/process shortcut to start the game, otherwise it may lead to injection failure.
    echo However, if the official source has not provided you with a launcher/you do not have a launcher and the injection fails, 
    echo you may need to obtain a patch from the developers for injection.
    echo This patch is a closed-source patch and is not built into HoYoShade. You cannot achieve the injection function by modifying the HoYoShade source code.
    echo For more information, please contact the developer DuolaD £¨https://github.com/DuolaD£© to get more information.
    echo\
    start "" /wait /b inject.exe StarRail.exe
    exit
) else if "%content%" == "6" (
    echo The injection target you selected is:Zenless Zone Zero £¨Universal Public£¨REL£© Client£©
    echo The injector has now started.
    echo You can now use the launcher to start the game. The injector will be injected simultaneously.
    echo If you selected the wrong injection target, simply close this window and restart the starter to choose again.
    echo\
    echo Important: You must use a game launcher to start the game £¨whether it is the official launcher or a third-party launcher£©,
    echo You cannot directly double-click the process/process shortcut to start the game. Otherwise, the injection will fail.
    echo\
    echo Note: This injection option is not applicable to any Zenless Zone Zero £¨pre-public test £¨Beta£©/internal test £¨Beta£©£© clients.
    echo If you need to inject into such clients, please close the window and restart the HoYoShade launcher, 
    echo and select the corresponding client in the public client injection list.
    echo
    start "" /wait /b inject.exe ZenlessZoneZero.exe
    exit
) else if "%content%" == "7" (
    goto beta_client_inject_choice_menu
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
echo Welcome to use HoYoShade starter!
echo\
echo Mod Version:V2.X.X Stable - NextVersion
echo Developer:DuolaDStudio X ZelbertYQ X Ex_M
echo\
echo If you need to check for version updates, you can visit our repository to see if there are any new released versions.
echo Note! Developer options are only for debugging/error checking purposes. 
echo Unless developers explicitly ask you to do so, or you are very clear about what you are doing, please do not use it lightly!
echo\
echo Note: CYteam Download Station provides free installation packages for the international version of Genshin Impact/Honkai: Star Rail/HoYoLAB and private server resources in mainland China.
echo Thanks to CYteam for providing the download station service.
echo\
echo [1]Visit our repository on GitHub
echo [2]Visit the download station service provided by CYteam
echo [3]Sponsor this project
echo [4]Contact us
echo [5]About HoYoShade
echo [6]developer options
echo [7]Back to menu
echo [8]Exit

echo\
set /p "content=Type the number here:"

if "%content%" == "1" (
    start "" "https://github.com/DuolaD/HoYoShade/"
    goto other
) else if "%content%" == "2" (
    start "" "https://d.cyteam.cn/"
    goto other
) else if "%content%" == "3" (
    start "" "https://github.com/DuolaD/HoYoShade/blob/V2.X.X-Stable/Readme.md#%E3%80%A2-Donate"
    goto other
) else if "%content%" == "4" (
    start "" "https://github.com/DuolaD/HoYoShade/blob/V2.X.X-Stable/Readme.md#%E3%80%A2-Contant-Me"
    goto other
) else if "%content%" == "5" (
    goto about_HoYoShade
) else if "%content%" == "6" (
    goto develop
) else if "%content%" == "7" (
    goto menu
) else if "%content%" == "8" (
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
echo Welcome to use HoYoShade starter!
echo\
echo Mod Version:V2.X.X Stable - NextVersion
echo Developer:DuolaDStudio X ZelbertYQ X Ex_M
echo\
echo Note! Developer options are only for debugging/error checking purposes. 
echo Unless developers explicitly ask you to do so, or you are very clear about what you are doing, please do not use it lightly!
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

:customize_inject
title HoYoShade Starter(You have entered the custom injection interface!!!)
cls
echo Welcome to use HoYoShade starter!
echo\
echo Mod Version:V2.X.X Stable - NextVersion
echo Developer:DuolaDStudio X ZelbertYQ X Ex_M
echo\
echo Note! This function is only for developers to test new games. This means there may be unknown risks/Bugs.
echo Unless developers explicitly ask you to do so, or you are very clear about what you are doing, 
echo please do not inject Reshade into other games without authorization.
echo\
echo Usage: Simply enter the target program file name, without adding the '.exe' extension, and press Enter to confirm.
echo Wait for the injection window interface to pop up, then start the target program.
echo Enter '\exit' to return to the development interface.
echo\
set /p "content=Type here:"
if "%content%" == "\exit" (
    goto develop
) else (
    echo The injection target you selected is:%content%.exe
    echo The injector has now started.
    echo You can now use the launcher to start the game. The injector will be injected simultaneously.
    echo If you selected the wrong injection target, simply close this window and restart the starter to choose again.
    echo\
    start "" /wait /b inject.exe %content%.exe
    exit
)

:about_HoYoShade
title HoYoShade
cls
echo HoYoShade
echo HoYo it,Great it.
echo\
echo DuolaDStudio X ZelbertYQ x Ex_M
echo Joint contributions.
echo\
echo Mod Version:V2.X.X Stable - NextVersion
echo\
echo HoYoShade is based on the official ReShade plugins and the OpenHoYoShade framework for secondary development. 
echo All files except for effect libraries/presets are open-sourced on GitHub under the BSL-3 open-source license.
echo Modify By DuolaDStudio Hong Kong Ltd,All rights reserved.
echo\
echo Please note: HoYoShade is a free open-source mod, ReShade is a free open-source plugin, and OpenHoYoShade is a free open-source framework. 
echo All source code can be obtained on GitHub. If you have purchased (Open)HoYoShade without modifications/secondary development, 
echo please request a refund immediately! The actions of the merchants are unrelated to all developers!
echo\
echo Developer list:
echo -DuolaDStudio Hong Kong Ltd.
echo   ¡ª¡ªDuolaD[RE adaptation/major version update development/launcher/presets]
echo   ¡ª¡ªÁÕÄÝÌØLynetteNotFound[HoYoShade minor version update development/maintenance.]
echo Ex_M[Technical support/guidance/GUI develop]
echo ZelbertYQ[Documentation Website Technical Support]
echo\
echo Thanks£º
echo -CYTeam[HoYoShade partners/Microsoft enterprise storage plan provision/dynamic to static linking solutions]
echo -Cloudflare, Inc.[Domain hosting and management]
echo\
echo Thank you for having you! HoYoShade will be even better tomorrow!
pause
goto other

:ini_Reset
title HoYoShade Starter
cls
echo Welcome to use HoYoShade starter!
echo\
echo Mod Version:V2.X.X Stable - NextVersion
echo Developer:DuolaDStudio X ZelbertYQ X Ex_M
echo\
echo Note! Generally, you only need to reset the ReShade.ini configuration file in the following two situations:
echo - You moved the mod directory, or you renamed a folder within it.
echo - The Releases interface of the repository clearly states that it is recommended/required to reset the ReShade.ini configuration file in order to enable new features/fix bugs.
echo\
echo Apart from this, you generally don't need to reset ReShade.ini.
echo\
echo After the reset is complete, you will need to delete the ReShade.ini configuration file that you copied to the game process root directory,
echo otherwise HoYoShade will not work as expected.
echo\
echo Do you want to continue with the reset operation?
echo\
echo [1]Yes
echo [2]No(Back to menu)
echo\
set /p "content=Type the number here:"

if "%content%" == "1" (
    start "" /wait ".\LauncherResource\INIBuild.exe"
    :File_Reset
    cls
    echo Welcome to use HoYoShade starter!
    echo\
    echo Mod Version:V2.X.X Stable - NextVersion
    echo Developer:DuolaDStudio X ZelbertYQ X Ex_M
    echo\
    echo Reset successful! The replaced ReShade.ini after the reset is now in the mod's root directory, replacing the old version of ReShade.ini.
    echo After the reset is complete, you will need to delete the ReShade.ini configuration file that you copied to the game process root directory,
    echo otherwise HoYoShade will not work as expected.
    echo\
    echo How to find the root directory of the game process?
    echo For HoYoPlay £¨HoYoVerse official new launcher£©:
    echo Click the "More" icon next to the Start button - Game Settings to view the root directory of the game process.
    echo Click 'Open Directory' to open the root directory of the game process using the file explorer.
    echo\
    echo For StarWard: Click the gear icon next to the Start button to view the root directory of the game process.
    echo Click the game process root directory to open it using the file explorer.
    echo\
    echo Still not sure how to proceed?
    echo You can check the user agreement and illustrated/video installation guide in the 'Tutorial' folder within the root directory of the mod.
    echo\
    pause
    goto menu
)

:beta_client_inject_choice_menu
title HoYoShade Starter
cls
echo Welcome to use HoYoShade starter!
echo\
echo Mod Version:V2.X.X Stable - NextVersion
echo Developer:DuolaDStudio X ZelbertYQ X Ex_M
echo\
echo Please note that you need to copy Reshade.ini to the root directory of the game process before you can use this mod.
echo\
echo Current injection list: Test server client injection list
echo\
echo This mod is only for color grading in-game scenes.  
echo Please comply with the user agreement of this Mod and the relevant regulations of the game and its developers/publishers.
echo You can check the user agreement and illustrated installation guide in the Tutorial folder located in the mod root directory.  
echo\
echo The following client injection options can only be used for injecting into the test server client.
echo\
echo If the test server client you want to use is not on this list, or if the injector does not respond to game launch, it means that:
echo 1:The test server client injection option you want to use is shared with the public client injection option. 
echo Please try using the public client injection list to attempt injection first.
echo 2:HoYoShade has not yet been adapted to the test server client you are currently using.
echo For adaptation, please visit our GitHub repository (https://github.com/DuolaD/HoYoShade) to submit issues.
echo\
echo [1]Reset the ReShade.ini in the mod's root directory.
echo [2]Inject into Genshin Impact £¨Universal Global Devkit/Beta Client Before Public£¨REL£©£©
echo [3]Inject into Zenless Zone Zero £¨Universal Beta Client Before Public£¨REL£©£©
echo [4]Inject into Zenless Zone Zero £¨Universal Beta Client After Public£¨REL£©£©
echo [5]Switch to the public client injection list
echo [6]Other options
echo [7]Exit

echo\
set /p "content=Type the number here:"

if "%content%" == "1" (
    goto ini_Reset
) else if "%content%" == "2" (
    :GICBT_CheckProcess
    tasklist /FI "IMAGENAME eq Genshin.exe" | find /i "Genshin.exe" >nul
    if not errorlevel 1 (
        taskkill /IM Genshin.exe /F >nul 2>&1
        goto GICBT_CheckProcess
    )
    cls
    echo The injection target you selected is:Genshin Impact £¨Universal Global Devkit/Beta Client Before Public£¨REL£©£©
    echo The injector has now started.
    echo You can now use the launcher to start the game. The injector will be injected simultaneously.
    echo If you selected the wrong injection target, simply close this window and restart the starter to choose again.
    echo\
    echo Note: This injection option is not applicable to any Genshin Impact £¨Public£¨REL£©/Beta after Public£¨REL£©£© clients.
    echo If you need to inject into such clients, please close the window and restart the HoYoShade launcher, 
    echo and select the corresponding client in the public client injection list.
    echo\
    echo Important: You must use the game launcher provided to you by the official source to start the game.
    echo Do not directly double-click the process/process shortcut to start the game. Otherwise, it may lead to injection failure.
    echo If the official source has not provided you with a launcher/you do not have a launcher,
    echo you may need to obtain a patch from the developers for injection.
    echo This patch is a closed-source patch and is not built into HoYoShade.
    echo You cannot achieve the injection function by modifying the HoYoShade source code.
    echo For more information, please contact the developer DuolaD £¨https://github.com/DuolaD£© to get more information.
    echo\
    start "" /wait /b inject.exe Genshin.exe
    exit
) else if "%content%" == "3" (
    cls
    echo The injection target you selected is:Zenless Zone Zero £¨Universal Beta Client Before Public£¨REL£©£©
    echo The injector has now started.
    echo You can now use the launcher to start the game. The injector will be injected simultaneously.
    echo If you selected the wrong injection target, simply close this window and restart the starter to choose again.
    echo\
    echo Note: This injection option is not applicable to any Zenless Zone Zero £¨Universal Beta Client After Public£¨REL£©£©.
    echo If you need to inject into such clients, please close the window and restart the HoYoShade launcher, 
    echo and select the corresponding client in the public client injection list.
    echo\
    echo Important: You must use the game launcher provided to you by the official source to start the game.
    echo Do not directly double-click the process/process shortcut to start the game. Otherwise, it may lead to injection failure.
    echo If the official source has not provided you with a launcher/you do not have a launcher,
    echo you may need to obtain a patch from the developers for injection.
    echo This patch is a closed-source patch and is not built into HoYoShade.
    echo You cannot achieve the injection function by modifying the HoYoShade source code.
    echo For more information, please contact the developer DuolaD £¨https://github.com/DuolaD£© to get more information.
    echo\
    start "" /wait /b inject.exe ZZZ.exe
    exit
) else if "%content%" == "4" (
    cls
    echo The injection target you selected is:Zenless Zone Zero £¨Universal Beta Client After Public£¨REL£©£©
    echo The injector has now started.
    echo You can now use the launcher to start the game. The injector will be injected simultaneously.
    echo If you selected the wrong injection target, simply close this window and restart the starter to choose again.
    echo\
    echo Note: This injection option is not applicable to any Zenless Zone Zero £¨Universal Beta Client Before Public£¨REL£©£©.
    echo If you need to inject into such clients, please close the window and restart the HoYoShade launcher, 
    echo and select the corresponding client in the public client injection list.
    echo\
    echo Important: You must use the game launcher provided to you by the official source to start the game.
    echo Do not directly double-click the process/process shortcut to start the game. Otherwise, it may lead to injection failure.
    echo If the official source has not provided you with a launcher/you do not have a launcher,
    echo you may need to obtain a patch from the developers for injection.
    echo This patch is a closed-source patch and is not built into HoYoShade.
    echo You cannot achieve the injection function by modifying the HoYoShade source code.
    echo For more information, please contact the developer DuolaD £¨https://github.com/DuolaD£© to get more information.
    echo\
    start "" /wait /b inject.exe ZenlessZoneZeroBeta.exe
    exit
) else if "%content%" == "5" (
    goto menu
) else if "%content%" == "6" (
    goto other
) else if "%content%" == "7" (
    exit
) else (
    echo\
    echo Input error.
    timeout /t 2
    goto menu
    )
exit