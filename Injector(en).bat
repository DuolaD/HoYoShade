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
    echo Welcome to use HoYoShade starter!
    echo\
    echo Mod Version:V2.111.0 Stable
    echo Developer:DuolaDStudio X °¢Ïò¾úAXBro X Ex_M
    echo\
    echo We have detected that this is your first time using this mod. Reshade.ini has now been generated in the root directory of the mod.
    echo You need to copy Reshade.ini to the root directory of the game process before you can use this mod.
    echo\
	echo How to find the root directory of the game process?
	echo For HoYoPlay£¨HoYoVerse official new launcher£©:
	echo Click the more icon next to the start button - Game Settings to view the root directory of the game process.
	echo\
	echo For StarWard: Click the gear icon next to the start launch button to view the game's root directory.
	echo Clicking the game's root directory will open the game¡¯s root directory using File Explorer.
	echo\
	echo Still not sure how to proceed?  
	echo You can check the user agreement and illustrated installation guide in the Tutorial folder located in the mod root directory.  
	echo\
    pause
	goto menu
)

:menu
title HoYoShade Starter
cls
echo Welcome to use HoYoShade starter!
echo\
echo Mod Version:V2.111.0 Stable
echo Developer:DuolaDStudio X °¢Ïò¾úAXBro X Ex_M
echo\
echo Please note that you need to copy Reshade.ini to the root directory of the game process before you can use this mod.
echo\
echo This mod is only for color grading in-game scenes.  
echo Please comply with the user agreement of this Mod and the relevant regulations of the game and its developers/publishers.
echo You can check the user agreement and illustrated installation guide in the Tutorial folder located in the mod root directory.  
echo When publishing videos using the mod to shoot footage, please note: "This video is rendered with support from GitHub@DuolaD/HoYoShade."
echo If you are unable to add the note due to special reasons,  
echo please contact the developer through the contact information in the "Other Options" section for an explanation.
echo\
echo [1]Reset the ReShade.ini file in the mod root directory.
echo [2]Inject to Genshin Impact (CN server)
echo [3]Inject to Genshin Impact (BiliBili server)
echo [4]Inject to Genshin Impact (Global server/Epic Games Store Version)
echo [5]Inject to Honkai Impact 3 (Universal)
echo [6]Inject to Honkai: Star Rail (Universal)
echo [7]Inject to Zenless Zone Zero (Universal)
echo [8]Other options
echo [9]Exit

echo\
set /p "content=Type the number here:"

if "%content%" == "1" (
    goto ini_Reset
) else if "%content%" == "2" (
    goto YuanShen_inject
) else if "%content%" == "3" (
    goto BiliBili_Warning
) else if "%content%" == "4" (
    powershell -command Start-Process -FilePath inject.exe GenshinImpact.exe -Verb RunAs
    exit
) else if "%content%" == "5" (
    powershell -command Start-Process -FilePath inject.exe BH3.exe -Verb RunAs
    exit
) else if "%content%" == "6" (
    powershell -command Start-Process -FilePath inject.exe StarRail.exe -Verb RunAs
    exit
) else if "%content%" == "7" (
    powershell -command Start-Process -FilePath inject.exe ZZZ.exe -Verb RunAs
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
echo Mod Version:V2.111.0 Stable
echo Developer:DuolaDStudio X °¢Ïò¾úAXBro X Ex_M
echo\
echo If you need to check for version updates, you can visit our repository to see if there are any new releases.
echo The developer options are only for debugging/error detection purposes.  
echo Unless explicitly instructed by a developer, please do not use them lightly.
echo\
echo Note: In addition to providing mirror downloads for this mod,  
echo CYteam Download Station also offers free installation packages and private server resources for the international versions of Genshin Impact, Honkai: Star Rail, and HoYoLAB in mainland China.
echo Additionally, CYteam provides some Android modding resources. Feel free to check them out if you're interested.
echo Thanks to CYteam for providing the download station service.
echo\
echo [1]Visit our repository on GitHub.
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
echo Welcome to use HoYoShade starter!
echo\
echo Mod Version:V2.111.0 Stable
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
echo Welcome to use HoYoShade starter!
echo\
echo Mod Version:V2.111.0 Stable
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
echo Restart the HoYoShade starter to the waiting for injection game interface, and reopen the game.
timeout /t 5
pause
goto YuanShen_inject

:YuanShen_inject
powershell -command Start-Process -FilePath inject.exe YuanShen.exe -Verb RunAs
exit

:customize_inject
title HoYoShade Starter(You have entered the custom injection interface!!!)
cls
echo Welcome to use HoYoShade starter!
echo\
echo Mod Version:V2.111.0 Stable
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

:about_HoYoShade
title HoYoShade
cls
echo HoYoShade
echo HoYo it,Great it.
echo\
echo DuolaDStudio X °¢Ïò¾úAXBro x Ex_M
echo Joint contributions.
echo\
echo Mod Version:V2.111.0 Stable
echo\
echo HoYoShade is based on the secondary development of ReShade, 
echo and all files except effect libraries/Presets are open source on GitHub in accordance with the BSL-3 open source license.You can check the official ReShade information on the Reshade.me.
echo Modify By DuolaDStudio Hong Kong Ltd,All rights reserved.
echo\
echo Please note:
echo HoYoShade is a free open-source mod, 
echo ReShade is a free open-source plugin,
echo and OpenHoYoShade is a free open-source framework.
echo All source code can be obtained on GitHub. If you have purchased (Open)HoYoShade without any modifications or secondary development,please request a refund immediately! The actions of the seller are independent of the developers.
echo\
echo Developer list:
echo -DuolaDStudio Hong Kong Ltd.
echo   ¡ª¡ª¶ßÀ²D‰ôDuolaD[Reshade Modify/major version develop/injecter/Presets]
echo   ¡ª¡ªÁÕÄÝÌØLynetteNotFound[HoYoShade minor version and patch version develop]
echo DuolaDStudio[Reshade Modify/Starter/Presets]
echo Ex_M[Support/guide/GUI build]
echo °¢Ïò¾úAXBro[paid effect shader/Promotion/guide]
echo\
echo Thanks£º
echo -CYTeam[HoYoShade partner/Microsoft Enterprise Storage Plan provides/dynamic links into static links solution provide]
echo -Cloudflare, Inc.[Domain hosting and management.]
echo -Aira2[For the non-compulsory version detector to download version information and the latest Mod packages]
echo\
echo Thank you everyone for being here! HoYoShade will be better and better!
pause
goto other

:ini_Reset
title HoYoShade Starter
cls
echo Welcome to use HoYoShade starter!
echo\
echo Mod Version:V2.111.0 Stable
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
	echo Welcome to use HoYoShade starter!
	echo\
	echo Mod Version:V2.111.0 Stable
	echo Developer:DuolaDStudio X °¢Ïò¾úAXBro X Ex_M
	echo\
    echo Reset successful! The reset ReShade.ini has now replaced the old ReShade.ini in the mod directory.
    echo You need to replace the original ReShade.ini in the game's root directory with the reset ReShade.ini to use this mod.
    echo\
	echo How to find the root directory of the game process?
	echo For HoYoPlay£¨HoYoVerse official new launcher£©:
	echo Click the more icon next to the start button - Game Settings to view the root directory of the game process.
	echo\
	echo For StarWard: Click the gear icon next to the start launch button to view the game's root directory.
	echo Clicking the game's root directory will open the game¡¯s root directory using File Explorer.
	echo\
	echo Still not sure how to proceed?  
	echo You can check the user agreement and illustrated installation guide in the Tutorial folder located in the mod root directory.  
	echo\
    pause
	goto menu
)