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
    echo ��ӭʹ��HoYoShadeע������
    echo\
    echo ģ��汾��V2.012.2 Stable
    echo �����ߣ�DuolaDStudio X �����AXBro X Ex_M
    echo\
    echo ���Ǽ�⵽���ǵ�һ��ʹ�ñ�ģ�飬Reshade.ini����������ģ���Ŀ¼�С�
    echo ����Ҫ��Reshade.ini���Ƶ���Ϸ���̸�Ŀ¼��Ȼ�����ʹ�ñ�ģ�顣
    echo ����Ҫ����������Ϸ��Ŀ¼�������������Ժܷ�����ҵ���Ϸ���̸�Ŀ¼·��ȥ�����ļ���
    echo\
    echo [1]�õģ�����������Ϸ���̸�Ŀ¼·����⡣
    echo [2]���ˣ���֪������β�����
    echo\
    set /p "tmp=�ڴ�����ѡ��ǰ������֣�"
    if "%tmp%" == "1" (
        goto PatchCheck
    ) else if "%tmp%" == "2" (
        goto menu
    ) else (
        echo\
        echo �������
        timeout /t 2
        goto FileCheck
    )
)

:menu
title HoYoShade Starter
cls
echo ��ӭʹ��HoYoShadeע������
echo\
echo ģ��汾��V2.012.2 Stable
echo �����ߣ�DuolaDStudio X �����AXBro X Ex_M
echo\
echo ��ע�⣬����Ҫ��Reshade.ini���Ƶ���Ϸ���̸�Ŀ¼��Ȼ�����ʹ�ñ�ģ�顣
echo\
echo ��ģ���������Ϸ�����ɫʹ�ã���������Ϸ���������
echo ʹ��ģ�������زķ�����Ƶʱ���뱸ע:"����Ƶ��GitHub@DuolaD/HoYoShade�ṩ��Ⱦ֧��"��
echo ��������ԭ���޷���ע����ͨ��"����ѡ��"�е���ϵ��ʽ��ϵ�����߽���˵����
echo\
echo [1]��Ϸ����·�����
echo [2]����ģ���Ŀ¼�е�ReShade.ini
echo [3]ԭ���й���½���ͻ��ˣ�
echo [4]ԭ�������������ͻ��ˣ�
echo [5]ԭ�񣨹��ʷ��ͻ���/Epic�ͻ��ˣ�
echo [6]������(ͨ�ÿͻ���)
echo [7]�������������(ͨ�ÿͻ���)
echo [8]����ѡ��
echo [9]�˳�����

echo\
set /p "content=�ڴ�����ѡ��ǰ������֣�"

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
    echo �������
    timeout /t 2
    goto menu
    )
exit

:other
title HoYoShade Starter
cls
echo ��ӭʹ��HoYoShadeע������
echo\
echo ģ��汾��V2.012.2 Stable
echo �����ߣ�DuolaDStudio X �����AXBro X Ex_M
echo\
echo �������Ҫ���汾���£�����ȥ�������ǵĲֿ�鿴�Ƿ��з��и��°汾
echo ������ѡ������ڵ���/��������Ҫ�����ǿ�������ȷҪ������������������������ʹ��
echo\
echo ע��CYteam���̳����ṩ��ģ�������֮�⣬������ṩ���ʷ�ԭ��/����/HoYoLAB��װ����
echo ����֮�⣬CYteam���ṩһЩ��׿�ĸ����Դ������Ȥ�Ŀ���ȥ��һ��~
echo ��лCYteam�ṩ�����̷���
echo\
echo [1]�������ǵ�GitHub���ֿ�
echo [2]������CYteam�ṩ�����̷���
echo [3]�ڰ������������ң�֧��΢�ź�֧������
echo [4]��Patreon�������ң�֧�ֺ���֧����ʽ��
echo [5]��������ģ��Ĺٷ�QQȺ
echo [6]�����Һ�CYTeam����ԴQQȺ
echo [7]����HoYoShade
echo [8]������ѡ��
echo [9]����������
echo [10]�˳�����

echo\
set /p "content=�ڴ�����ѡ��ǰ������֣�"

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
    echo �������
    timeout /t 2
    goto other
)
goto other

:develop
title HoYoShade Starter(���ѽ��뿪����ѡ�����)
cls
echo ��ӭʹ��HoYoShadeע������
echo\
echo ģ��汾��V2.012.2 Stable
echo �����ߣ�DuolaDStudio X �����AXBro X Ex_M
echo\
echo ע�⣡������ѡ������ڵ���/��������Ҫ�����ǿ�������ȷҪ������������������������ʹ�ã�
echo\
echo [1]�Զ���ע��
echo [2]����������
echo [3]��������ѡ��
echo [4]�˳�����

echo\
set /p "content=�ڴ�����ѡ��ǰ������֣�"

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
    echo �������
    timeout /t 2
    goto develop
)
goto develop@echo off


:BiliBili_Warning
title HoYoShade Starter(���������ͻ�������ǰ���棡)
cls
echo ��ӭʹ��HoYoShadeע������
echo\
echo ģ��汾��V2.012.2 Stable
echo �����ߣ�DuolaDStudio X �����AXBro X Ex_M
echo\
echo ע�⣡����
echo �������������ͻ���ʹ�õ������������¼��Ϸ�˺�
echo ���������ƹٷ�/���ʷ�/Epic�ͻ��˵���Ϸ�ڵ�¼��Ϸ�˺�
echo ��ˣ�����ȷ����Ϸ�ѳɹ���¼��Ϸ�˺ź��ٰ�'Home'����Reshade����̨���к�������
echo\
echo ���������Ϸû�гɹ���¼��Ϸ�˻�ǰ��Reshade����̨����Ϸ�ڵ�����¼���ں�Ῠ��
echo ����㲻С��û��ע�⵽��㲢���������������ֻ�������������ر���Ϸ������Ϸ��صĽ���
echo Ȼ������������ģ��ע�������ȴ�ע����Ϸ���棬������ʹ�ùٷ�����������Ϸ���ɡ�
timeout /t 5
pause
goto YuanShen_inject

:YuanShen_inject
powershell -command Start-Process -FilePath inject.exe YuanShen.exe -Verb RunAs
exit

:customize_inject
title HoYoShade Starter(���ѽ����Զ���ע����棡����)
cls
echo ��ӭʹ��HoYoShadeע������
echo\
echo ģ��汾��V2.012.2 Stable
echo �����ߣ�DuolaDStudio X �����AXBro X Ex_M
echo\
echo ע�⣡�˹��ܽ��������߲�������Ϸʹ�á�����ζ�ſ��ܻ����δ֪����/Bug��
echo �������Ƕ��ο�����/���ܿ�����ָ���������벻Ҫ����ʹ�ô˹���ע�뱾Reshade��������Ϸ�ڡ�
echo\
echo ʹ�÷���������Ŀ������ļ������ɣ��������'.exe'��׺�����س�ȷ����
echo �ȴ�ע�봰�ڽ��浯��������Ŀ����򼴿ɡ�
echo ����'/exit'���ɷ��ؿ������档
echo\
set /p "content=�ڴ����룺"
if "%content%" == "/exit" (
    goto develop
) else (
    powershell -command Start-Process -FilePath inject.exe %content%.exe -Verb RunAs
    exit
)

:PatchCheck


echo\
echo ԭ��[����\����������]���ڹ���ע���·�����ļ�
echo ֻ�ܼ�⵽���һ�ΰ�װ\���¹���������ԭ��
echo\
echo ������[������]�����ַ����⣬��֧�ּ�⣬��HoYoShade��Ȼ֧��ע�롣
echo\

set regPath=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\ԭ��
set regValue=InstallPath

reg query "%regPath%" > nul 2>&1
if %errorlevel% neq 0 (
    echo ԭ��[����\����������]:[δ����]
    goto Genshin_Impact_Globel_Game_Check
)

reg query "%regPath%" /v "%regValue%" > nul 2>&1
if %errorlevel% neq 0 (
    echo ԭ��[����\����������]:[δ���֣�ע����۸ģ�]
    goto Genshin_Impact_Globel_Game_Check
)

for /f "tokens=2*" %%a in ('reg query "%regPath%" /v "%regValue%" ^| findstr /i "%regValue%"') do (
    set "regData=%%b"
)

if exist "%regData%\Genshin Impact game" (
    echo ԭ��[����\����������]��������Ŀ¼:%regData%\Genshin Impact game
) else (
    echo ԭ��[����\����������]:[���ƺ�ֻ��װ������������û�а�װ��Ϸ����]
)

:Genshin_Impact_Globel_Game_Check
set regPath=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Genshin Impact
set regValue=InstallPath

reg query "%regPath%" > nul 2>&1
if %errorlevel% neq 0 (
    echo ԭ��[���ʷ�]:[δ����]
    goto Honkai_3rd_CN_Game_Check
)

reg query "%regPath%" /v "%regValue%" > nul 2>&1
if %errorlevel% neq 0 (
    echo ԭ��[���ʷ�]:[δ���֣�ע����۸ģ�]
    goto Honkai_3rd_CN_Game_Check
)

for /f "tokens=2*" %%a in ('reg query "%regPath%" /v "%regValue%" ^| findstr /i "%regValue%"') do (
    set "regData=%%b"
)

if exist "%regData%\Genshin Impact game" (
    echo ԭ��[���ʷ�]��������Ŀ¼:%regData%\Genshin Impact game
) else (
    echo ԭ��[���ʷ�]:[���ƺ�ֻ��װ������������û�а�װ��Ϸ����]
)

:Honkai_3rd_CN_Game_Check
set regPath=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\����3
set regValue=InstallPath

reg query "%regPath%" > nul 2>&1
if %errorlevel% neq 0 (
    echo ������[����]:[δ����]
    goto Honkai_3rd_TC_Game_Check
)

reg query "%regPath%" /v "%regValue%" > nul 2>&1
if %errorlevel% neq 0 (
    echo ������[����]:[δ���֣�ע����۸ģ�]
    goto Honkai_3rd_TC_Game_Check
)

for /f "tokens=2*" %%a in ('reg query "%regPath%" /v "%regValue%" ^| findstr /i "%regValue%"') do (
    set "regData=%%b"
)

if exist "%regData%\Games" (
    echo ������[����]��������Ŀ¼:%regData%\Games
) else (
    echo ������[����]:[���ƺ�ֻ��װ������������û�а�װ��Ϸ����]
)

:Honkai_3rd_TC_Game_Check
set regPath=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\����3rd
set regValue=InstallPath

reg query "%regPath%" > nul 2>&1
if %errorlevel% neq 0 (
    echo ������[���з�]:[δ����]
    goto Honkai_3rd_Asia_Game_Check
)

reg query "%regPath%" /v "%regValue%" > nul 2>&1
if %errorlevel% neq 0 (
    echo ������[���з�]:[δ���֣�ע����۸ģ�]
    goto Honkai_3rd_Asia_Game_Check
)

for /f "tokens=2*" %%a in ('reg query "%regPath%" /v "%regValue%" ^| findstr /i "%regValue%"') do (
    set "regData=%%b"
)

if exist "%regData%\Games" (
    echo ������[���з�]��������Ŀ¼:%regData%\Games
) else (
    echo ������[���з�]:[���ƺ�ֻ��װ������������û�а�װ��Ϸ����]
)

:Honkai_3rd_Asia_Game_Check
set regPath=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Honkai Impact 3
set regValue=InstallPath

reg query "%regPath%" > nul 2>&1
if %errorlevel% neq 0 (
    echo ������[�����Ƿ�]:[δ����]
    goto Honkai_3rd_GLB_Game_Check
)

reg query "%regPath%" /v "%regValue%" > nul 2>&1
if %errorlevel% neq 0 (
    echo ������[�����Ƿ�]:[δ���֣�ע����۸ģ�]
    goto Honkai_3rd_GLB_Game_Check
)

for /f "tokens=2*" %%a in ('reg query "%regPath%" /v "%regValue%" ^| findstr /i "%regValue%"') do (
    set "regData=%%b"
)

if exist "%regData%\Games" (
    echo ������[�����Ƿ�]��������Ŀ¼:%regData%\Games
) else (
    echo ������[�����Ƿ�]:[���ƺ�ֻ��װ������������û�а�װ��Ϸ����]
)

:Honkai_3rd_GLB_Game_Check
set regPath=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Honkai Impact 3rd
set regValue=InstallPath

reg query "%regPath%" > nul 2>&1
if %errorlevel% neq 0 (
    echo ������[ŷ����]:[δ����]
    goto Honkai_StarRail_CN_Game_Check
)

reg query "%regPath%" /v "%regValue%" > nul 2>&1
if %errorlevel% neq 0 (
    echo ������[ŷ����]:[δ���֣�ע����۸ģ�]
    goto Honkai_StarRail_CN_Game_Check
)

for /f "tokens=2*" %%a in ('reg query "%regPath%" /v "%regValue%" ^| findstr /i "%regValue%"') do (
    set "regData=%%b"
)

if exist "%regData%\Games" (
    echo ������[ŷ����]��������Ŀ¼:%regData%\Games
) else (
    echo ������[ŷ����]:[���ƺ�ֻ��װ������������û�а�װ��Ϸ����]
)

:Honkai_StarRail_CN_Game_Check
set regPath=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\�������������
set regValue=InstallPath

reg query "%regPath%" > nul 2>&1
if %errorlevel% neq 0 (
    echo �������������[����]:[δ����]
    goto Honkai_StarRail_Globel_Game_Check
)

reg query "%regPath%" /v "%regValue%" > nul 2>&1
if %errorlevel% neq 0 (
    echo �������������[����]:[δ���֣�ע����۸ģ�]
    goto Honkai_StarRail_Globel_Game_Check
)

for /f "tokens=2*" %%a in ('reg query "%regPath%" /v "%regValue%" ^| findstr /i "%regValue%"') do (
    set "regData=%%b"
)

if exist "%regData%\Games" (
    echo �������������[����]��������Ŀ¼:%regData%\Games
) else (
    echo �������������[����]:[���ƺ�ֻ��װ������������û�а�װ��Ϸ����]
)

:Honkai_StarRail_Globel_Game_Check
set regPath=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Star Rail
set regValue=InstallPath

reg query "%regPath%" > nul 2>&1
if %errorlevel% neq 0 (
    echo �������������[���ʷ�]:[δ����]
	goto checkend
)

reg query "%regPath%" /v "%regValue%" > nul 2>&1
if %errorlevel% neq 0 (
    echo �������������[���ʷ�]:[δ���֣�ע����۸ģ�]
	goto checkend
)

for /f "tokens=2*" %%a in ('reg query "%regPath%" /v "%regValue%" ^| findstr /i "%regValue%"') do (
    set "regData=%%b"
)

if exist "%regData%\Games" (
    echo �������������[���ʷ�]��������Ŀ¼:%regData%\Games
) else (
    echo �������������[���ʷ�]:[���ƺ�ֻ��װ������������û�а�װ��Ϸ����]
)

:checkend
echo\
echo �����ϣ��븴��·��������Դ�����������·�����ļ��У���ģ���Ŀ¼��Reshade.ini���Ƶ���Ŀ¼�
pause
goto menu

:about_HoYoShade
title HoYoShade
cls
echo HoYoShade
echo HoYo it,Great it.
echo ʹReShade֧���׹����������п���PC�����е���Ϸ��
echo Ȼ�󣬱˴˳ɾͣ��˴���ҫ��
echo\
echo DuolaDStudio X �����AXBro x Ex_M
echo ���Ͼ���
echo\
echo ģ��汾��V2.012.2 Stable
echo\
echo HoYoShade����ReShade���ο�������Ч����/Presets֮��������ļ�������BSL-3��ԴЭ����GitHub�Ͽ�Դ��
echo �������Reshade.me��վ�в鿴ReShade�ٷ���Ϣ��
echo Modify By DuolaDStudio Hong Kong Ltd,All rights reserved.
echo\
echo ��ϸ����������
echo -DuolaDStudio Hong Kong Ltd.
echo   ��������D��DuolaD[RE����/��汾���¿���/ע����/Ԥ��]
echo   ����������LynetteNotFound[HoYoShadeС�汾���¿���/ά��]
echo -Ex_M[����֧��/ָ��/GUI����]
echo -�����AXBro[����Ч����/����/������֧��]
echo\
echo ��л���㣡HoYoShade�������ã�
pause
goto other

:ini_Reset
title HoYoShade Starter
cls
echo ��ӭʹ��HoYoShadeע������
echo\
echo ģ��汾��V2.012.2 Stable
echo �����ߣ�DuolaDStudio X �����AXBro X Ex_M
echo\
echo ��ע�⣺��ֻ��Ҫ��ģ��Ŀ¼�ƶ������Ҫ����ReShade.ini
echo ����֮�⣬һ��������㶼����Ҫ�������ò�����
echo\
echo ������Ϻ�,����Ҫ���¸���ReShade.ini����Ϸ���̸�Ŀ¼
echo �Ƿ�������ò�����
echo\
echo [1]��
echo [2]��(����ע�������˵�)
echo\
set /p "content=�ڴ�����ѡ��ǰ������֣�"

if "%content%" == "1" (
	start "" /wait ".\InjectResource\INIBuild.exe"
    start "" "convert_encoding.bat"
	:File_Reset
	cls
	echo ��ӭʹ��HoYoShadeע������
	echo\
	echo ģ��汾��V2.012.2 Stable
	echo �����ߣ�DuolaDStudio X �����AXBro X Ex_M
	echo\
    echo ���óɹ������ú��ReShade.ini�����滻ģ���Ŀ¼�еľɰ�ReShade.ini��
    echo ����Ҫ�����ú��ReShade.ini�滻��Ϸ���̸�Ŀ¼ԭ�е�ReShade.ini��Ȼ�����ʹ�ñ�ģ�顣
    echo ����Ҫ����������Ϸ��Ŀ¼�������������Ժܷ�����ҵ���Ϸ���̸�Ŀ¼·��ȥ�����ļ���
    echo\
    echo [1]�õģ�����������Ϸ���̸�Ŀ¼·����⡣
    echo [2]���ˣ���֪������β�����
    echo\
	set /p "tmp=�ڴ�����ѡ��ǰ������֣�"
    if "%tmp%" == "1" (
        goto PatchCheck
    ) else if "%tmp%" == "2" (
        goto menu
    ) else (
        echo\
        echo �������
        timeout /t 2
        goto File_Reset
    )
) else if "%content%" == "2" (
    goto menu
) else (
    echo\
    echo �������
    timeout /t 2
    goto ini_Reset
)