@echo off

chcp 936

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
echo 歡迎使用HoYoShade注入器！
echo\
echo 模組版本：V2.0131.0 Stable
echo 開發者：DuolaDStudio X 阿向菌AXBro X Ex_M
echo\
echo 請注意：部分代理軟件和遊戲加速器中的虛擬網關功能可能會導致檢測緩慢或無法正常使用。
echo 如果下載的包只有幾KB，說明微軟服務器API在短時間內請求次數過多，請稍後再試。
echo\
echo [1]檢測HoYoShade最新版本信息
echo [2]下載HoYoShade最新完整包
echo [3]下載HoYoShade最新覆蓋更新包
echo [4]下載OpenHoYoShade最新完整包
echo [5]返回主界面
echo [6]退出程序
echo\

set /p "content=在此輸入選項前面的數字："

if "%content%" == "1" (
    echo 正在獲取最新版本信息......
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
						echo 有新的HoYoShade版本可用: V!VERSION! Stable
					)
					if !VERSION_STATUS! EQU 1 (
						echo 有新的HoYoShade版本可用: V!VERSION! Beta
					)
                ) else (
					echo 你的HoYoShade已經是最新版本!
					pause
					goto updater
                )
                
            ) else (
                echo 錯誤：未能識別版本號。
            )
            if "!PROMPT_STATUS!"=="1" (
                echo 是否支持覆蓋更新：是
				if !AFTPROMPT_STATUS! EQU 0 (
					echo 所需前置覆蓋版本號爲： V!afterversion! Stable
				)
				if !AFTPROMPT_STATUS! EQU 1 (
					echo 所需前置覆蓋版本號爲： V!afterversion! Beta
				)
				if not !afterversion! == !CURRENT_VERSION! (
					echo 當前版本的HoYoShade不符合覆蓋更新前置版本要求。
                ) else (
                    echo 當前版本的HoYoShade符合覆蓋更新前置版本要求。
                )
            ) else if "!PROMPT_STATUS!"=="0" (
                echo 是否支持覆蓋更新：否
            ) else (
                echo 錯誤：文件格式有誤
            )
            del /f %FILENAME%
        ) else (
            echo 錯誤：未能成功獲取版本信息
        )
    ) else (
        echo 錯誤：由於網絡超時或者請求失敗，程序未能獲取當前最新版本信息。
    )
    pause
    goto updater
    echo\
) else if "%content%" == "2" (
    echo 正在獲取最新版本信息......
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
			   echo 開始下載......
			   aria2c.exe -x10 --console-log-level=warn "!link!" -o "!output!"
			   if %errorlevel% equ 0 (
			       echo 下載成功！
				   pause
				   goto updater
			   ) else (
			       echo 錯誤：下載失敗！
				   pause
				   goto updater
			   )
			) else (
			   echo 錯誤：未能識別下載鏈接。
			)
		) else (
			echo 錯誤：未能識別下載鏈接。
		)
    ) else (
        echo 錯誤：由於網絡超時或者請求失敗，程序未能獲取最新版本下載鏈接。
    )
    pause
    goto updater
    echo\
) else if "%content%" == "3" (
    echo 正在獲取最新版本信息......
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
					  echo 提示：該版本不支持覆蓋升級。
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
				echo 當前HoYoShade版本並非爲覆蓋更新包所要求的基礎版本，因此無法覆蓋更新。
				echo 是否仍然繼續下載
				echo [1]是
				echo [2]否（返回升級菜單）
				echo\
				set /p "content=在此輸入選項前面的數字："
				if "%content%" == "1" (
					goto updater_hdiff_next
				) else if "%content%" == "2" (
					goto updater
				) else (
					echo 輸入錯誤。
					timeout /t 2
					goto updater_hdiff_ask
				)
			)
			:updater_hdiff_next
            if not "!link!"=="" (
			   echo 開始下載......
			   aria2c.exe -x10 --console-log-level=warn "!link!" -o "!output!"
			   if %errorlevel% equ 0 (
			       echo 下載成功！
				   pause
				   goto updater
			   ) else (
			       echo 錯誤：下載失敗！
				   pause
				   goto updater
			   )
			) else (
			   echo 錯誤：未能識別下載鏈接。
			)
		) else (
			echo 錯誤：未能識別下載鏈接。
		)
    ) else (
        echo 錯誤：由於網絡超時或者請求失敗，程序未能獲取最新版本下載鏈接。
    )
    pause
    goto updater
    echo\
) else if "%content%" == "4" (
	echo 正在獲取最新版本信息......
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
			   echo 開始下載......
			   aria2c.exe -x10 --console-log-level=warn "!link!" -o "!output!"
			   if %errorlevel% equ 0 (
			       echo 下載成功！
				   pause
				   goto updater
			   ) else (
			       echo 錯誤：下載失敗！
				   pause
				   goto updater
			   )
			) else (
			   echo 錯誤：未能識別下載鏈接。
			)
		) else (
			echo 錯誤：未能識別下載鏈接。
		)
    ) else (
        echo 錯誤：由於網絡超時或者請求失敗，程序未能獲取最新版本下載鏈接。
    )
    pause
    goto updater
    echo\
) else if "%content%" == "5" (
	goto menu
) else if "%content%" == "6" (
	exit
) else (
    echo 輸入錯誤。
    timeout /t 2
    goto updater
)