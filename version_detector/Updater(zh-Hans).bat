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
echo 欢迎使用HoYoShade注入器！
echo\
echo 模组版本：V2.0131.0 Stable
echo 开发者：DuolaDStudio X 阿向菌AXBro X Ex_M
echo\
echo 请注意：部分代理软件和游戏加速器中的虚拟网关功能可能会导致检测缓慢或无法正常使用。
echo 如果下载的包只有几KB，说明微软服务器API在短时间内请求次数过多，请稍后再试。
echo\
echo [1]检测HoYoShade最新版本信息
echo [2]下载HoYoShade最新完整包
echo [3]下载HoYoShade最新覆盖更新包
echo [4]下载OpenHoYoShade最新完整包
echo [5]返回主界面
echo [6]退出程序
echo\

set /p "content=在此输入选项前面的数字："

if "%content%" == "1" (
    echo 正在获取最新版本信息......
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
					echo 你的HoYoShade已经是最新版本!
					pause
					goto updater
                )
                
            ) else (
                echo 错误：未能识别版本号。
            )
            if "!PROMPT_STATUS!"=="1" (
                echo 是否支持覆盖更新：是
				if !AFTPROMPT_STATUS! EQU 0 (
					echo 所需前置覆盖版本号为： V!afterversion! Stable
				)
				if !AFTPROMPT_STATUS! EQU 1 (
					echo 所需前置覆盖版本号为： V!afterversion! Beta
				)
				if not !afterversion! == !CURRENT_VERSION! (
					echo 当前版本的HoYoShade不符合覆盖更新前置版本要求。
                ) else (
                    echo 当前版本的HoYoShade符合覆盖更新前置版本要求。
                )
            ) else if "!PROMPT_STATUS!"=="0" (
                echo 是否支持覆盖更新：否
            ) else (
                echo 错误：文件格式有误
            )
            del /f %FILENAME%
        ) else (
            echo 错误：未能成功获取版本信息
        )
    ) else (
        echo 错误：由于网络超时或者请求失败，程序未能获取当前最新版本信息。
    )
    pause
    goto updater
    echo\
) else if "%content%" == "2" (
    echo 正在获取最新版本信息......
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
			   echo 开始下载......
			   aria2c.exe -x10 --console-log-level=warn "!link!" -o "!output!"
			   if %errorlevel% equ 0 (
			       echo 下载成功！
				   pause
				   goto updater
			   ) else (
			       echo 错误：下载失败！
				   pause
				   goto updater
			   )
			) else (
			   echo 错误：未能识别下载链接。
			)
		) else (
			echo 错误：未能识别下载链接。
		)
    ) else (
        echo 错误：由于网络超时或者请求失败，程序未能获取最新版本下载链接。
    )
    pause
    goto updater
    echo\
) else if "%content%" == "3" (
    echo 正在获取最新版本信息......
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
					  echo 提示：该版本不支持覆盖升级。
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
				echo 当前HoYoShade版本并非为覆盖更新包所要求的基础版本，因此无法覆盖更新。
				echo 是否仍然继续下载
				echo [1]是
				echo [2]否（返回升级菜单）
				echo\
				set /p "content=在此输入选项前面的数字："
				if "%content%" == "1" (
					goto updater_hdiff_next
				) else if "%content%" == "2" (
					goto updater
				) else (
					echo 输入错误。
					timeout /t 2
					goto updater_hdiff_ask
				)
			)
			:updater_hdiff_next
            if not "!link!"=="" (
			   echo 开始下载......
			   aria2c.exe -x10 --console-log-level=warn "!link!" -o "!output!"
			   if %errorlevel% equ 0 (
			       echo 下载成功！
				   pause
				   goto updater
			   ) else (
			       echo 错误：下载失败！
				   pause
				   goto updater
			   )
			) else (
			   echo 错误：未能识别下载链接。
			)
		) else (
			echo 错误：未能识别下载链接。
		)
    ) else (
        echo 错误：由于网络超时或者请求失败，程序未能获取最新版本下载链接。
    )
    pause
    goto updater
    echo\
) else if "%content%" == "4" (
	echo 正在获取最新版本信息......
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
			   echo 开始下载......
			   aria2c.exe -x10 --console-log-level=warn "!link!" -o "!output!"
			   if %errorlevel% equ 0 (
			       echo 下载成功！
				   pause
				   goto updater
			   ) else (
			       echo 错误：下载失败！
				   pause
				   goto updater
			   )
			) else (
			   echo 错误：未能识别下载链接。
			)
		) else (
			echo 错误：未能识别下载链接。
		)
    ) else (
        echo 错误：由于网络超时或者请求失败，程序未能获取最新版本下载链接。
    )
    pause
    goto updater
    echo\
) else if "%content%" == "5" (
	goto menu
) else if "%content%" == "6" (
	exit
) else (
    echo 输入错误。
    timeout /t 2
    goto updater
)