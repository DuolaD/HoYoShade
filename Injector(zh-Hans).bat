@echo off

chcp 936

title HoYoShade������
cls

mkdir %SystemRoot%\temp\admin_check >nul 2>&1

if exist %SystemRoot%\temp\admin_check (
	rmdir %SystemRoot%\temp\admin_check
	title HoYoShade������
	cls
	echo ��ӭʹ��HoYoShade��������
	echo\
	echo ģ��汾��V2.3.1 Stable
	echo �����ߣ�DuolaDStudio X �����AXBro X Ex_M
	echo\
    echo ���Ǽ�⵽�����������Թ���Ա������У���ᵼ��ע���������������⡣
	echo ����������������������˳����С�����������������������������ͨģʽ���У�ֱ��˫�����м��ɣ���
	pause
	exit
)

set files_to_check=("inject.exe" "ReShade64.dll" "InjectResource" "convert_encoding.bat" "InjectResource\INIBuild.exe" "InjectResource\msyhbd.ttc")

setlocal enabledelayedexpansion
cd /d "%~dp0"

set missing_file=0
for %%f in %files_to_check% do (
    if not exist %%~f (
        set missing_file=1
    )
)

if %missing_file% equ 1 (
    title HoYoShade������
	cls
	echo ��ӭʹ��HoYoShade��������
	echo\
	echo ģ��汾��V2.3.1 Stable
	echo �����ߣ�DuolaDStudio X �����AXBro X Ex_M
	echo\
    echo ���Ǽ�⵽��Open��HoYoShade���ע������ı�Ҫ�ļ������ڡ�
	echo\
	echo ���������ʾ��ԭ������У�
	echo 1:���ڽ�ѹѹ����ʱû�н�ѹȫ���ļ���
	echo 2:���ڽ��и��Ǹ��²�����ʱ��û��ճ��ȫ���ļ���
	echo 3:��ϵͳ�ϵ�ɱ�����/���������󽫣�Open��HoYoShadeʶ��Ϊ������Ȼ��ɾ����ĳЩ�ļ���
	echo 4:������/�����������˲��ֹؼ��ļ���
	echo\
	echo ����������������������˳����С�
	echo �������������У�Open��HoYoShade����������ǵ�GitHub�ֿ⣨https://github.com/DuolaD/HoYoShade�������������°�Releases�������ṩ��ѹ����������ѹȫ���ļ���
	pause
	exit
)

set "filepath=%~dp0Reshade.ini"

if exist "%filepath%" (
    goto menu
) else (
    cls
    start "" /wait ".\InjectResource\INIBuild.exe"
    start "" "convert_encoding.bat"
    :FileCheck
    cls
    echo ��ӭʹ��HoYoShade��������
    echo\
    echo ģ��汾��V2.3.1 Stable
    echo �����ߣ�DuolaDStudio X �����AXBro X Ex_M
    echo\
    echo ���Ǽ�⵽���ǵ�һ��ʹ�ñ�ģ�飬Reshade.ini����������ģ���Ŀ¼�С�
    echo ����Ҫ��Reshade.ini���Ƶ���Ϸ���̸�Ŀ¼��Ȼ�����ʹ�ñ�ģ�顣
    echo\
	echo ����ҵ���Ϸ���̸�Ŀ¼��  
	echo ����HoYoPlay���׹�����������:�����ʼ������ť�Աߵĸ���ͼ��-��Ϸ���ü��ɲ鿴��Ϸ���̸�Ŀ¼��  
	echo ���'������Ŀ¼'����ʹ����Դ����������Ϸ���̸�Ŀ¼��  
	echo\
	echo ����StarWard:�����ʼ������ť�Աߵĳ���ͼ�꼴�ɲ鿴��Ϸ���̸�Ŀ¼��  
	echo �����Ϸ���̸�Ŀ¼����ʹ����Դ����������Ϸ���̸�Ŀ¼��  
	echo\
	echo ��Ȼ������β������������ģ���Ŀ¼/Tutorial�ļ����в鿴�û�Э���ͼ�İ�װ˵����
	echo\
    pause
	goto menu
)

:menu
title HoYoShade������
cls
echo ��ӭʹ��HoYoShade��������
echo\
echo ģ��汾��V2.3.1 Stable
echo �����ߣ�DuolaDStudio X �����AXBro X Ex_M
echo\
echo ��ע�⣬����Ҫ��Reshade.ini���Ƶ���Ϸ���̸�Ŀ¼��Ȼ�����ʹ�ñ�ģ�顣
echo\
echo ��ģ���������Ϸ�����ɫʹ�ã������ر�Mod���û�Э�����Ϸ���俪��/���������������
echo �������ģ���Ŀ¼/Tutorial�ļ����в鿴�û�Э���ͼ�İ�װ˵����
echo ʹ��ģ�������زķ�����Ƶʱ���뱸ע:"����Ƶ��GitHub@DuolaD/HoYoShade�ṩ��Ⱦ֧��"��
echo ��������ԭ���޷���ע����ͨ��"����ѡ��"�е���ϵ��ʽ��ϵ�����߽���˵����
echo\
echo [1]����ģ���Ŀ¼�е�ReShade.ini
echo [2]ע����ԭ���й���½/���������ͻ��ˣ�
echo [3]ע����ԭ�񣨹��ʿͻ���/Epic�ͻ��ˣ�
echo [4]ע����������(ͨ�ÿͻ���)
echo [5]ע�����������������(ͨ�ÿͻ���)
echo [6]ע����������(ͨ�ÿͻ���)
echo [7]�л������Է��ͻ���ע���б�
echo [8]����ѡ��
echo [9]�˳�����

echo\
set /p "content=�ڴ�����ѡ��ǰ������֣�"

if "%content%" == "1" (
    goto ini_Reset
) else if "%content%" == "2" (
    powershell -command Start-Process -FilePath inject.exe YuanShen.exe -Verb RunAs
	exit
) else if "%content%" == "3" (
    powershell -command Start-Process -FilePath inject.exe GenshinImpact.exe -Verb RunAs
    exit
) else if "%content%" == "4" (
    powershell -command Start-Process -FilePath inject.exe BH3.exe -Verb RunAs
    exit
) else if "%content%" == "5" (
    powershell -command Start-Process -FilePath inject.exe StarRail.exe -Verb RunAs
    exit
) else if "%content%" == "6" (
    powershell -command Start-Process -FilePath inject.exe ZenlessZoneZero.exe -Verb RunAs
) else if "%content%" == "7" (
    goto beta_client_inject_choice_menu
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
title HoYoShade������
cls
echo ��ӭʹ��HoYoShade��������
echo\
echo ģ��汾��V2.3.1 Stable
echo �����ߣ�DuolaDStudio X �����AXBro X Ex_M
echo\
echo �������Ҫ���汾���£�����ȥ�������ǵĲֿ�鿴�Ƿ��з��и��°汾
echo ע�⣡������ѡ������ڵ���/��������Ҫ�����ǿ�������ȷҪ����������������������֪���Լ�����ʲô��������������ʹ�ã�
echo\
echo ע��CYteam����վ�����ṩ��ģ��ľ�������֮�⣬�����й���½�����ṩ��ѵĹ��ʷ�ԭ��/����/HoYoLAB��װ����˽����Դ��
echo ����֮�⣬CYteam���ṩһЩ��׿�ĸ����Դ������Ȥ�Ŀ���ȥ��һ��~
echo ��лCYteam�ṩ������վ����
echo\
echo [1]�������ǵ�GitHub�ֿ�
echo [2]������CYteam�ṩ������վ����
echo [3]������Mod
echo [4]��ϵ����
echo [5]����HoYoShade
echo [6]������ѡ��
echo [7]����������
echo [8]�˳�����

echo\
set /p "content=�ڴ�����ѡ��ǰ������֣�"

if "%content%" == "1" (
    start "" "https://github.com/DuolaD/HoYoShade/"
    goto other
) else if "%content%" == "2" (
    start "" "https://d.cyteam.cn/"
    goto other
) else if "%content%" == "3" (
    start "" "https://github.com/DuolaD/HoYoShade/blob/V2.X.X-Stable/Readme.Chinese_Simplified.md#%E3%80%A2-%E8%B5%9E%E5%8A%A9"
    goto other
) else if "%content%" == "4" (
    start "" "https://github.com/DuolaD/HoYoShade/blob/V2.X.X-Stable/Readme.Chinese_Simplified.md#%E3%80%A2-%E8%81%94%E7%B3%BB%E6%88%91"
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
    echo �������
    timeout /t 2
    goto other
)
goto other

:develop
title HoYoShade������(���ѽ��뿪����ѡ�����)
cls
echo ��ӭʹ��HoYoShade��������
echo\
echo ģ��汾��V2.3.1 Stable
echo �����ߣ�DuolaDStudio X �����AXBro X Ex_M
echo\
echo ע�⣡������ѡ������ڵ���/��������Ҫ�����ǿ�������ȷҪ����������������������֪���Լ�����ʲô��������������ʹ�ã�
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

:customize_inject
title HoYoShade������(���ѽ����Զ���ע����棡����)
cls
echo ��ӭʹ��HoYoShade��������
echo\
echo ģ��汾��V2.3.1 Stable
echo �����ߣ�DuolaDStudio X �����AXBro X Ex_M
echo\
echo ע�⣡�˹��ܽ��������߲�������Ϸʹ�á�����ζ�ſ��ܻ����δ֪����/Bug��
echo ���ǿ�������ȷҪ����������������������֪���Լ�����ʲô�������벻Ҫ����ʹ�ô˹���ע��Reshade��������Ϸ�ڡ�
echo\
echo ʹ�÷���������Ŀ������ļ������ɣ��������'.exe'��׺�����س�ȷ����
echo �ȴ�ע�봰�ڽ��浯��������Ŀ����򼴿ɡ�
echo ����'\exit'���ɷ��ؿ������档
echo\
set /p "content=�ڴ����룺"
if "%content%" == "\exit" (
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
echo ʹReShade֧���׹����������п���PC�����е���Ϸ��
echo Ȼ�󣬱˴˳ɾͣ��˴���ҫ��
echo\
echo DuolaDStudio X �����AXBro x Ex_M
echo ���Ͼ���
echo\
echo ģ��汾��V2.3.1 Stable
echo\
echo HoYoShade����ReShade�ٷ������OpenHoYoShade��ܶ��ο�������Ч����/Ԥ��֮��������ļ�������BSL-3��ԴЭ����GitHub�Ͽ�Դ��
echo �������Reshade.me��վ�в鿴ReShade�ٷ���Ѷ��
echo Modify By DuolaDStudio Hong Kong Ltd,All rights reserved.
echo\
echo ��ע�⣺HoYoShadeΪ��ѿ�ԴMod��ReShadeΪ��ѿ�Դ�����OpenHoYoShadeΪ��ѿ�Դ��ܡ�
echo ����Դ�붼������GitHub�ϻ�ȡ��������Ǹ��ѹ�����δ���޸�/���ο�����(Open)HoYoShade
echo �������˿�̼���Ϊ�����п������޹أ�
echo\
echo ��ϸ����������
echo -DuolaDStudio Hong Kong Ltd.
echo   ��������D��DuolaD[RE����/��汾���¿���/������/Ԥ��]
echo   ����������LynetteNotFound[HoYoShadeС�汾���¿���/ά��]
echo -Ex_M[����֧��/ָ��/GUI����]
echo -�����AXBro[����/������֧��]
echo\
echo ��л��
echo -CYTeam[HoYoShade�������/΢����ҵ����ƻ��ṩ/��̬ת��̬���ӽ������]
echo -Cloudflare, Inc.[�����й������]
echo\
echo ��л���㣡HoYoShade�������ã�
pause
goto other

:ini_Reset
title HoYoShade������
cls
echo ��ӭʹ��HoYoShade��������
echo\
echo ģ��汾��V2.3.1 Stable
echo �����ߣ�DuolaDStudio X �����AXBro X Ex_M
echo\
echo ��ע�⣺��ֻ��Ҫ��ģ��Ŀ¼�ƶ������Ҫ����ReShade.ini
echo ����֮�⣬һ��������㶼����Ҫ�������ò�����
echo\
echo ������Ϻ�����Ҫ���¸���ReShade.ini����Ϸ���̸�Ŀ¼
echo �Ƿ�������ò�����
echo\
echo [1]��
echo [2]��(�������������˵�)
echo\
set /p "content=�ڴ�����ѡ��ǰ������֣�"

if "%content%" == "1" (
    start "" /wait ".\InjectResource\INIBuild.exe"
    start "" "convert_encoding.bat"
	:File_Reset
	cls
	echo ��ӭʹ��HoYoShade��������
	echo\
	echo ģ��汾��V2.3.1 Stable
	echo �����ߣ�DuolaDStudio X �����AXBro X Ex_M
	echo\
    echo ���óɹ������ú��ReShade.ini�����滻ģ���Ŀ¼�еľɰ�ReShade.ini��
    echo ����Ҫ�����ú��ReShade.ini�滻��Ϸ���̸�Ŀ¼ԭ�е�ReShade.ini��Ȼ�����ʹ�ñ�ģ�顣
    echo\
	echo ����ҵ���Ϸ���̸�Ŀ¼��  
	echo ����HoYoPlay���׹�����������:�����ʼ������ť�Աߵĸ���ͼ��-��Ϸ���ü��ɲ鿴��Ϸ���̸�Ŀ¼��  
	echo ���'������Ŀ¼'����ʹ����Դ����������Ϸ���̸�Ŀ¼��  
	echo\
	echo ����StarWard:�����ʼ������ť�Աߵĳ���ͼ�꼴�ɲ鿴��Ϸ���̸�Ŀ¼��  
	echo �����Ϸ���̸�Ŀ¼����ʹ����Դ����������Ϸ���̸�Ŀ¼��  
	echo\
	echo ��Ȼ������β������������ģ���Ŀ¼/Tutorial�ļ����в鿴�û�Э���ͼ�İ�װ˵����
	echo\
    pause
	goto menu
) else if "%content%" == "2" (
    goto menu
) else (
    echo\
    echo �������
    timeout /t 2
    goto ini_Reset
)

:beta_client_inject_choice_menu
title HoYoShade������
cls
echo ��ӭʹ��HoYoShade��������
echo\
echo ģ��汾��V2.3.1 Stable
echo �����ߣ�DuolaDStudio X �����AXBro X Ex_M
echo\
echo ��ע�⣬����Ҫ��Reshade.ini���Ƶ���Ϸ���̸�Ŀ¼��Ȼ�����ʹ�ñ�ģ�顣
echo\
echo ��ģ���������Ϸ�����ɫʹ�ã������ر�Mod���û�Э�����Ϸ���俪��/���������������
echo �������ģ���Ŀ¼/Tutorial�ļ����в鿴�û�Э���ͼ�İ�װ˵����
echo ʹ��ģ�������زķ�����Ƶʱ���뱸ע:"����Ƶ��GitHub@DuolaD/HoYoShade�ṩ��Ⱦ֧��"��
echo ��������ԭ���޷���ע����ͨ��"����ѡ��"�е���ϵ��ʽ��ϵ�����߽���˵����
echo\
echo ���¿ͻ���ע��ѡ���ֻ������ע�������Է��ͻ��ˡ�
echo\
echo �������ʹ�õĲ��Է��ͻ��˲��ڴ��б�����ע����δ����Ϸ����������Ӧ����˵��:
echo 1:����ʹ�õĲ��Է��ͻ���ע��ѡ���빫���ͻ���ע��ѡ��ͨ�ã����ȳ���ʹ�ù����ͻ���ע���б���ע�롣
echo 2:HoYoShade��δ������Ŀǰ����ʹ�õĲ��Է��ͻ��ˡ�
echo �������䣬�������ǵķ������ǵ�GitHub�ֿ⣨https://github.com/DuolaD/HoYoShade���ύissues��
echo\
echo [1]����ģ���Ŀ¼�е�ReShade.ini
echo [2]ע����������(ͨ�ù���ǰ�ڲ�ͻ���)
echo [3]ע����������(ͨ�ù�����ڲ�ͻ���)
echo [4]�л��������ͻ���ע���б�
echo [5]����ѡ��
echo [6]�˳�����

echo\
set /p "content=�ڴ�����ѡ��ǰ������֣�"

if "%content%" == "1" (
    goto ini_Reset
) else if "%content%" == "2" (
    powershell -command Start-Process -FilePath inject.exe ZZZ.exe -Verb RunAs
	exit
) else if "%content%" == "3" (
    powershell -command Start-Process -FilePath inject.exe ZenlessZoneZeroBeta.exe -Verb RunAs
    exit
) else if "%content%" == "4" (
    goto menu
) else if "%content%" == "5" (
    goto other
) else if "%content%" == "6" (
	exit
) else (
    echo\
    echo �������
    timeout /t 2
    goto menu
    )
exit