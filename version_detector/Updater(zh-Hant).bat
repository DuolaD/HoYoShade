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
echo �gӭʹ��HoYoShadeע������
echo\
echo ģ�M�汾��V2.0131.0 Stable
echo �_�l�ߣ�DuolaDStudio X �����AXBro X Ex_M
echo\
echo Ոע�⣺���ִ���ܛ�����[��������е�̓�M�W�P���ܿ��ܕ����z�y������o������ʹ�á�
echo ������d�İ�ֻ�Ў�KB���f��΢ܛ������API�ڶ̕r�g��Ո��Δ��^�࣬Ո������ԇ��
echo\
echo [1]�z�yHoYoShade���°汾��Ϣ
echo [2]���dHoYoShade����������
echo [3]���dHoYoShade���¸��w���°�
echo [4]���dOpenHoYoShade����������
echo [5]����������
echo [6]�˳�����
echo\

set /p "content=�ڴ�ݔ���x�ǰ��Ĕ��֣�"

if "%content%" == "1" (
    echo ���ګ@ȡ���°汾��Ϣ......
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
					echo ���HoYoShade�ѽ������°汾!
					pause
					goto updater
                )
                
            ) else (
                echo �e�`��δ���R�e�汾̖��
            )
            if "!PROMPT_STATUS!"=="1" (
                echo �Ƿ�֧�ָ��w���£���
				if !AFTPROMPT_STATUS! EQU 0 (
					echo ����ǰ�ø��w�汾̖���� V!afterversion! Stable
				)
				if !AFTPROMPT_STATUS! EQU 1 (
					echo ����ǰ�ø��w�汾̖���� V!afterversion! Beta
				)
				if not !afterversion! == !CURRENT_VERSION! (
					echo ��ǰ�汾��HoYoShade�����ϸ��w����ǰ�ð汾Ҫ��
                ) else (
                    echo ��ǰ�汾��HoYoShade���ϸ��w����ǰ�ð汾Ҫ��
                )
            ) else if "!PROMPT_STATUS!"=="0" (
                echo �Ƿ�֧�ָ��w���£���
            ) else (
                echo �e�`���ļ���ʽ���`
            )
            del /f %FILENAME%
        ) else (
            echo �e�`��δ�ܳɹ��@ȡ�汾��Ϣ
        )
    ) else (
        echo �e�`����춾W�j���r����Ո��ʧ��������δ�ܫ@ȡ��ǰ���°汾��Ϣ��
    )
    pause
    goto updater
    echo\
) else if "%content%" == "2" (
    echo ���ګ@ȡ���°汾��Ϣ......
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
			   echo �_ʼ���d......
			   aria2c.exe -x10 --console-log-level=warn "!link!" -o "!output!"
			   if %errorlevel% equ 0 (
			       echo ���d�ɹ���
				   pause
				   goto updater
			   ) else (
			       echo �e�`�����dʧ����
				   pause
				   goto updater
			   )
			) else (
			   echo �e�`��δ���R�e���d朽ӡ�
			)
		) else (
			echo �e�`��δ���R�e���d朽ӡ�
		)
    ) else (
        echo �e�`����춾W�j���r����Ո��ʧ��������δ�ܫ@ȡ���°汾���d朽ӡ�
    )
    pause
    goto updater
    echo\
) else if "%content%" == "3" (
    echo ���ګ@ȡ���°汾��Ϣ......
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
					  echo ��ʾ��ԓ�汾��֧�ָ��w������
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
				echo ��ǰHoYoShade�汾�K�Ǡ����w���°���Ҫ��Ļ��A�汾����˟o�����w���¡�
				echo �Ƿ���Ȼ�^�m���d
				echo [1]��
				echo [2]�񣨷��������ˆΣ�
				echo\
				set /p "content=�ڴ�ݔ���x�ǰ��Ĕ��֣�"
				if "%content%" == "1" (
					goto updater_hdiff_next
				) else if "%content%" == "2" (
					goto updater
				) else (
					echo ݔ���e�`��
					timeout /t 2
					goto updater_hdiff_ask
				)
			)
			:updater_hdiff_next
            if not "!link!"=="" (
			   echo �_ʼ���d......
			   aria2c.exe -x10 --console-log-level=warn "!link!" -o "!output!"
			   if %errorlevel% equ 0 (
			       echo ���d�ɹ���
				   pause
				   goto updater
			   ) else (
			       echo �e�`�����dʧ����
				   pause
				   goto updater
			   )
			) else (
			   echo �e�`��δ���R�e���d朽ӡ�
			)
		) else (
			echo �e�`��δ���R�e���d朽ӡ�
		)
    ) else (
        echo �e�`����춾W�j���r����Ո��ʧ��������δ�ܫ@ȡ���°汾���d朽ӡ�
    )
    pause
    goto updater
    echo\
) else if "%content%" == "4" (
	echo ���ګ@ȡ���°汾��Ϣ......
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
			   echo �_ʼ���d......
			   aria2c.exe -x10 --console-log-level=warn "!link!" -o "!output!"
			   if %errorlevel% equ 0 (
			       echo ���d�ɹ���
				   pause
				   goto updater
			   ) else (
			       echo �e�`�����dʧ����
				   pause
				   goto updater
			   )
			) else (
			   echo �e�`��δ���R�e���d朽ӡ�
			)
		) else (
			echo �e�`��δ���R�e���d朽ӡ�
		)
    ) else (
        echo �e�`����춾W�j���r����Ո��ʧ��������δ�ܫ@ȡ���°汾���d朽ӡ�
    )
    pause
    goto updater
    echo\
) else if "%content%" == "5" (
	goto menu
) else if "%content%" == "6" (
	exit
) else (
    echo ݔ���e�`��
    timeout /t 2
    goto updater
)