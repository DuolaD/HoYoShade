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
echo ��ӭʹ��HoYoShadeע������
echo\
echo ģ��汾��V2.0131.0 Stable
echo �����ߣ�DuolaDStudio X �����AXBro X Ex_M
echo\
echo ��ע�⣺���ִ����������Ϸ�������е��������ع��ܿ��ܻᵼ�¼�⻺�����޷�����ʹ�á�
echo ������صİ�ֻ�м�KB��˵��΢�������API�ڶ�ʱ��������������࣬���Ժ����ԡ�
echo\
echo [1]���HoYoShade���°汾��Ϣ
echo [2]����HoYoShade����������
echo [3]����HoYoShade���¸��Ǹ��°�
echo [4]����OpenHoYoShade����������
echo [5]����������
echo [6]�˳�����
echo\

set /p "content=�ڴ�����ѡ��ǰ������֣�"

if "%content%" == "1" (
    echo ���ڻ�ȡ���°汾��Ϣ......
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
						echo ���µ�HoYoShade�汾����: V!VERSION! Stable
					)
					if !VERSION_STATUS! EQU 1 (
						echo ���µ�HoYoShade�汾����: V!VERSION! Beta
					)
                ) else (
					echo ���HoYoShade�Ѿ������°汾!
					pause
					goto updater
                )
                
            ) else (
                echo ����δ��ʶ��汾�š�
            )
            if "!PROMPT_STATUS!"=="1" (
                echo �Ƿ�֧�ָ��Ǹ��£���
				if !AFTPROMPT_STATUS! EQU 0 (
					echo ����ǰ�ø��ǰ汾��Ϊ�� V!afterversion! Stable
				)
				if !AFTPROMPT_STATUS! EQU 1 (
					echo ����ǰ�ø��ǰ汾��Ϊ�� V!afterversion! Beta
				)
				if not !afterversion! == !CURRENT_VERSION! (
					echo ��ǰ�汾��HoYoShade�����ϸ��Ǹ���ǰ�ð汾Ҫ��
                ) else (
                    echo ��ǰ�汾��HoYoShade���ϸ��Ǹ���ǰ�ð汾Ҫ��
                )
            ) else if "!PROMPT_STATUS!"=="0" (
                echo �Ƿ�֧�ָ��Ǹ��£���
            ) else (
                echo �����ļ���ʽ����
            )
            del /f %FILENAME%
        ) else (
            echo ����δ�ܳɹ���ȡ�汾��Ϣ
        )
    ) else (
        echo �����������糬ʱ��������ʧ�ܣ�����δ�ܻ�ȡ��ǰ���°汾��Ϣ��
    )
    pause
    goto updater
    echo\
) else if "%content%" == "2" (
    echo ���ڻ�ȡ���°汾��Ϣ......
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
			   echo ��ʼ����......
			   aria2c.exe -x10 --console-log-level=warn "!link!" -o "!output!"
			   if %errorlevel% equ 0 (
			       echo ���سɹ���
				   pause
				   goto updater
			   ) else (
			       echo ��������ʧ�ܣ�
				   pause
				   goto updater
			   )
			) else (
			   echo ����δ��ʶ���������ӡ�
			)
		) else (
			echo ����δ��ʶ���������ӡ�
		)
    ) else (
        echo �����������糬ʱ��������ʧ�ܣ�����δ�ܻ�ȡ���°汾�������ӡ�
    )
    pause
    goto updater
    echo\
) else if "%content%" == "3" (
    echo ���ڻ�ȡ���°汾��Ϣ......
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
					  echo ��ʾ���ð汾��֧�ָ���������
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
				echo ��ǰHoYoShade�汾����Ϊ���Ǹ��°���Ҫ��Ļ����汾������޷����Ǹ��¡�
				echo �Ƿ���Ȼ��������
				echo [1]��
				echo [2]�񣨷��������˵���
				echo\
				set /p "content=�ڴ�����ѡ��ǰ������֣�"
				if "%content%" == "1" (
					goto updater_hdiff_next
				) else if "%content%" == "2" (
					goto updater
				) else (
					echo �������
					timeout /t 2
					goto updater_hdiff_ask
				)
			)
			:updater_hdiff_next
            if not "!link!"=="" (
			   echo ��ʼ����......
			   aria2c.exe -x10 --console-log-level=warn "!link!" -o "!output!"
			   if %errorlevel% equ 0 (
			       echo ���سɹ���
				   pause
				   goto updater
			   ) else (
			       echo ��������ʧ�ܣ�
				   pause
				   goto updater
			   )
			) else (
			   echo ����δ��ʶ���������ӡ�
			)
		) else (
			echo ����δ��ʶ���������ӡ�
		)
    ) else (
        echo �����������糬ʱ��������ʧ�ܣ�����δ�ܻ�ȡ���°汾�������ӡ�
    )
    pause
    goto updater
    echo\
) else if "%content%" == "4" (
	echo ���ڻ�ȡ���°汾��Ϣ......
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
			   echo ��ʼ����......
			   aria2c.exe -x10 --console-log-level=warn "!link!" -o "!output!"
			   if %errorlevel% equ 0 (
			       echo ���سɹ���
				   pause
				   goto updater
			   ) else (
			       echo ��������ʧ�ܣ�
				   pause
				   goto updater
			   )
			) else (
			   echo ����δ��ʶ���������ӡ�
			)
		) else (
			echo ����δ��ʶ���������ӡ�
		)
    ) else (
        echo �����������糬ʱ��������ʧ�ܣ�����δ�ܻ�ȡ���°汾�������ӡ�
    )
    pause
    goto updater
    echo\
) else if "%content%" == "5" (
	goto menu
) else if "%content%" == "6" (
	exit
) else (
    echo �������
    timeout /t 2
    goto updater
)