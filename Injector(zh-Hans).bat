@echo off

chcp 936

title HoYoShade Starter
cls

REM For Reshade.ini check
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
    echo ģ��汾��V2.111.0 Stable
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
title HoYoShade Starter
cls
echo ��ӭʹ��HoYoShadeע������
echo\
echo ģ��汾��V2.111.0 Stable
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
echo [2]ע����ԭ���й���½���ͻ��ˣ�
echo [3]ע����ԭ�������������ͻ��ˣ�
echo [4]ע����ԭ�񣨹��ʷ��ͻ���/Epic�ͻ��ˣ�
echo [5]ע����������(ͨ�ÿͻ���)
echo [6]ע�����������������(ͨ�ÿͻ���)
echo [7]ע����������(ͨ�ÿͻ���)
echo [8]����ѡ��
echo [9]�˳�����

echo\
set /p "content=�ڴ�����ѡ��ǰ������֣�"

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
echo ģ��汾��V2.111.0 Stable
echo �����ߣ�DuolaDStudio X �����AXBro X Ex_M
echo\
echo �������Ҫ���汾���£�����ȥ�������ǵĲֿ�鿴�Ƿ��з��и��°汾
echo ������ѡ������ڵ���/��������Ҫ�����ǿ�������ȷҪ������������������������ʹ��
echo\
echo ע��CYteam����վ�����ṩ��ģ��ľ�������֮�⣬�����й���½�����ṩ��ѵĹ��ʷ�ԭ��/����/HoYoLAB��װ����˽����Դ��
echo ����֮�⣬CYteam���ṩһЩ��׿�ĸ����Դ������Ȥ�Ŀ���ȥ��һ��~
echo ��лCYteam�ṩ������վ����
echo\
echo [1]�������ǵ�GitHub�ֿ�
echo [2]������CYteam�ṩ������վ����
echo [3]������Mod��֧��΢�ź�֧������
echo [4]��������ģ��Ĺٷ�QQȺ
echo [5]�����Һ�CYTeam����ԴQQȺ
echo [6]����HoYoShade
echo [7]������ѡ��
echo [8]����������
echo [9]�˳�����

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
    start "" "http://qm.qq.com/cgi-bin/qm/qr?_wv=1027&k=7_mbCbSi2lGorijmwdZyvKuhU0mYs3Kv&authKey=w9%2FBFjNTtDOyk%2FsyLmGuKowkZO5vq9hSN5ksu6y7MGDBcvY2uqFkldR%2Fmx%2FypRo%2F&noverify=0&group_code=377103253"
    goto other
) else if "%content%" == "5" (
    start "" "http://qm.qq.com/cgi-bin/qm/qr?_wv=1027&k=eO0na7JXAPFeIQEdsYlS5OqYdQVTp-7k&authKey=6gnSrN3ej1ukrHYDGTW6pXNs7l1%2B1zO2qhoW9lYeE%2F8yl9ubm6xuyfnJa34gda4Q&noverify=0&group_code=627378873"
    goto other
) else if "%content%" == "6" (
    goto about_HoYoShade
) else if "%content%" == "7" (
    goto develop
) else if "%content%" == "8" (
    goto menu
) else if "%content%" == "9" (
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
echo ģ��汾��V2.111.0 Stable
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
echo ģ��汾��V2.111.0 Stable
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
echo ģ��汾��V2.111.0 Stable
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
echo ģ��汾��V2.111.0 Stable
echo\
echo HoYoShade����ReShade�ٷ�Ԫ����OpenHoYoShade��ܶ��ο�������Ч����/Ԥ��֮��������ļ�������BSL-3��ԴЭ����GitHub�Ͽ�Դ��
echo �������Reshade.me��վ�в鿴ReShade�ٷ���Ѷ��
echo Modify By DuolaDStudio Hong Kong Ltd,All rights reserved.
echo\
echo ��ע�⣺HoYoShadeΪ��ѿ�ԴMod��ReShadeΪ��ѿ�Դ�����OpenHoYoShadeΪ��ѿ�Դ��ܡ�
echo ����Դ�붼������GitHub�ϻ�ȡ��������Ǹ��ѹ�����δ���޸�/���ο�����(Open)HoYoShade
echo �������˿�̼���Ϊ�����п������޹أ�
echo\
echo ��ϸ����������
echo -DuolaDStudio Hong Kong Ltd.
echo   ��������D��DuolaD[RE������/��汾���¿���/ע����/Ԥ��]
echo   ����������LynetteNotFound[HoYoShadeС�汾���¿���/ά��]
echo -Ex_M[����֧Ԯ/ָ��/GUI����]
echo -�����AXBro[����Ч����/����/������֧��]
echo\
echo ��л��
echo -CYTeam[HoYoShade�������/΢����ҵ����ƻ��ṩ/��̬ת��̬����������]
echo -Cloudflare, Inc.[�����й������]
echo -Aira2[��ǿ�ư汾��������������]
echo\
echo ��л���㣡HoYoShade�������ã�
pause
goto other

:ini_Reset
title HoYoShade Starter
cls
echo ��ӭʹ��HoYoShadeע������
echo\
echo ģ��汾��V2.111.0 Stable
echo �����ߣ�DuolaDStudio X �����AXBro X Ex_M
echo\
echo ��ע�⣺��ֻ��Ҫ��ģ��Ŀ¼�ƶ������Ҫ����ReShade.ini
echo ����֮�⣬һ��������㶼����Ҫ�������ò�����
echo\
echo ������Ϻ�����Ҫ���¸���ReShade.ini����Ϸ���̸�Ŀ¼
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
	echo ģ��汾��V2.111.0 Stable
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