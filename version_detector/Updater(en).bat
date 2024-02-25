@echo off

title HoYoShade Starter
cls

REM For Updater
set CURRENT_VERSION=2.0131.0
setlocal enabledelayedexpansion
set URL=http://hoyoshadelatestversion.duoladstudio.xyz/version.json
set FILENAME=version.json

:updater
title HoYoShade Starter
cls
echo Welcome to use HoYoShade injector!
echo\
echo Mod Version:V2.0131.0 Stable
echo Developer:DuolaDStudio X °¢Ïò¾úAXBro X Ex_M
echo\
echo Please note that the virtual gateway feature in some proxy software and game accelerators may cause slow detection or inability to function properly.
echo If the downloaded package is only a few KB in size, it indicates that the Microsoft server API has been requested too many times within a short period. Please try again later.
echo\
echo [1]Detect the latest version information of HoYoShade.
echo [2]Download the latest full package of HoYoShade.
echo [3]Download the latest patch for updating HoYoShade.
echo [4]Download the latest full package of OpenHoYoShade.
echo [5]Back to menu
echo [6]Exit
echo\

set /p "content=Type the number here:"

if "%content%" == "1" (
    echo Fetching the latest version information...
	aria2c.exe -x10 --quiet %URL% -o %FILENAME%
    if %errorlevel% equ 0 (
        if exist %FILENAME% (
            set /A LINE_COUNTER=0
            for /F "tokens=* delims=" %%A in (%FILENAME%) do (
                set /A LINE_COUNTER+=1
                if !LINE_COUNTER! EQU 1 (
                    set VERSION=%%A
                )
                if !LINE_COUNTER! EQU 2 (
                    set VERSION_STATUS=%%A
                )
                if !LINE_COUNTER! EQU 3 (
                    set PROMPT_STATUS=%%A
                )
				if !LINE_COUNTER! EQU 10 (
                    set afterversion=%%A
                )
				if !LINE_COUNTER! EQU 11 (
                    set AFTPROMPT_STATUS=%%A
                )
            )
            del /f %FILENAME%
            if not "!VERSION!"=="" (
                if !VERSION! gtr !CURRENT_VERSION! (
					if !VERSION_STATUS! EQU 0 (
						echo There is a new version of HoYoShade available: V!VERSION! Stable
					)
					if !VERSION_STATUS! EQU 1 (
						echo There is a new version of HoYoShade available: V!VERSION! Beta
					)
                ) else (
					echo Your HoYoShade is already up to date!
					pause
					goto updater
                )
                
            ) else (
                echo Error: Failed to recognize version number.
            )
            if "!PROMPT_STATUS!"=="1" (
                echo Override updates Support:Yes
				if !AFTPROMPT_STATUS! EQU 0 (
					echo The required prerequisite override version number is: V!afterversion! Stable
				)
				if !AFTPROMPT_STATUS! EQU 1 (
					echo The required prerequisite override version number is: V!afterversion! Beta
				)
				if not !afterversion! == !CURRENT_VERSION! (
					echo The current version of HoYoShade does not meet the prerequisite version requirement for override updates.
                ) else (
                    echo The current version of HoYoShade meets the prerequisite version requirement for override updates.
                )
            ) else if "!PROMPT_STATUS!"=="0" (
                echo Override updates Support:No
            ) else (
                echo Error: File format is incorrect.
            )
            del /f %FILENAME%
        ) else (
            echo Error: Failed to retrieve version information successfully.
        )
    ) else (
        echo Error: Due to network timeout or request failure, the program was unable to retrieve the latest version information.
    )
    pause
    goto updater
    echo\
) else if "%content%" == "2" (
    echo Fetching the latest version information...
    aria2c.exe -x10 --quiet %URL% -o %FILENAME%
    if %errorlevel% equ 0 (
        if exist %FILENAME% (
            set /A LINE_COUNTER=0
            for /F "tokens=* delims=" %%A in (%FILENAME%) do (
                set /A LINE_COUNTER+=1
                if !LINE_COUNTER! EQU 4 (
                    set output=%%A
                )
				if !LINE_COUNTER! EQU 7 (
                    set link=%%A
                )
            )
			del /f %FILENAME%
            if not "!link!"=="" (
			   echo Downloading...
			   aria2c.exe -x10 --console-log-level=warn "!link!" -o "!output!"
			   if %errorlevel% equ 0 (
			       echo Download successful!
				   pause
				   goto updater
			   ) else (
			       echo Error: Download failed!
				   pause
				   goto updater
			   )
			) else (
			   echo Error: Failed to recognize the download link.
			)
		) else (
			echo Error: Failed to recognize the download link.
		)
    ) else (
        echo Due to network timeout or request failure, the program failed to obtain the download link for the latest version.
    )
    pause
    goto updater
    echo\
) else if "%content%" == "3" (
    echo Fetching the latest version information...
    aria2c.exe -x10 --quiet %URL% -o %FILENAME%
    if %errorlevel% equ 0 (
        if exist %FILENAME% (
            set /A LINE_COUNTER=0
            for /F "tokens=* delims=" %%A in (%FILENAME%) do (
                set /A LINE_COUNTER+=1
				if !LINE_COUNTER! EQU 3 (
					set PROMPT_STATUS=%%A
                    if "!PROMPT_STATUS!"=="0" (
					  del /f %FILENAME%
					  echo Note: This version does not support override upgrades.
					  pause
					  goto updater
					) 
                )
                if !LINE_COUNTER! EQU 5 (
                    set output=%%A
                )
				if !LINE_COUNTER! EQU 8 (
                    set link=%%A
                )
				if !LINE_COUNTER! EQU 10 (
                    set afterversion=%%A
                )
            )
			del /f %FILENAME%
			if not "%afterversion%"=="%CURRENT_VERSION%" (
				:updater_hdiff_ask
				cls
				echo The current version of HoYoShade is not the required base version for the override update package, so it cannot be updated by overwriting.
				echo Do you still want to continue the download?
				echo [1]Yes
				echo [2]No£¨Back to Updater Menu£©
				echo\
				set /p "content=Type the number here:"
				if "%content%" == "1" (
					goto updater_hdiff_next
				) else if "%content%" == "2" (
					goto updater
				) else (
					echo Input error.
					timeout /t 2
					goto updater_hdiff_ask
				)
			)
			:updater_hdiff_next
            if not "!link!"=="" (
			   echo Downloading...
			   aria2c.exe -x10 --console-log-level=warn "!link!" -o "!output!"
			   if %errorlevel% equ 0 (
			       echo Download successful!
				   pause
				   goto updater
			   ) else (
			       echo Error: Download failed!
				   pause
				   goto updater
			   )
			) else (
			   echo Error: Failed to recognize the download link.
			)
		) else (
			echo Error: Failed to recognize the download link.
		)
    ) else (
        echo Error: Due to network timeout or request failure, the program failed to obtain the download link for the latest version.
    )
    pause
    goto updater
    echo\
) else if "%content%" == "4" (
	echo Fetching the latest version information...
    aria2c.exe -x10 --quiet %URL% -o %FILENAME%
    if %errorlevel% equ 0 (
        if exist %FILENAME% (
            set /A LINE_COUNTER=0
            for /F "tokens=* delims=" %%A in (%FILENAME%) do (
                set /A LINE_COUNTER+=1
                if !LINE_COUNTER! EQU 6 (
                    set output=%%A
                )
				if !LINE_COUNTER! EQU 9 (
                    set link=%%A
                )
            )
			del /f %FILENAME%
            if not "!link!"=="" (
			   echo Downloading...
			   aria2c.exe -x10 --console-log-level=warn "!link!" -o "!output!"
			   if %errorlevel% equ 0 (
			       echo Download successful!
				   pause
				   goto updater
			   ) else (
			       echo Error: Download failed!
				   pause
				   goto updater
			   )
			) else (
			   echo Error: Failed to recognize the download link.
			)
		) else (
			echo Error: Failed to recognize the download link.
		)
    ) else (
        echo Error: Due to network timeout or request failure, the program failed to obtain the download link for the latest version.
    )
    pause
    goto updater
    echo\
) else if "%content%" == "5" (
	goto menu
) else if "%content%" == "6" (
	exit
) else (
    echo Input error.
    timeout /t 2
    goto updater
)