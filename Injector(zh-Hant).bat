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
    echo �gӭʹ��HoYoShadeע������
    echo\
    echo ģ�M�汾��V2.111.0 Stable
    echo �_�l�ߣ�DuolaDStudio X �����AXBro X Ex_M
    echo\
    echo �҂��z�y�����ǵ�һ��ʹ�ñ�ģ�M��Reshade.ini�F��������ģ�M��Ŀ��С�
    echo ����Ҫ��Reshade.ini�}�u���[���M�̸�Ŀ䛣�Ȼ�����ʹ�ñ�ģ�M��
    echo\
	echo ����ҵ��[���M�̸�Ŀ䛣�  
	echo ���HoYoPlay���׹��[��������:�c���_ʼ���Ӱ��o�Եĸ����D��-�[���O�����ɲ鿴�[���M�̸�Ŀ䛡�  
	echo �c�x'�_������Ŀ�'����ʹ���YԴ�������_���[���M�̸�Ŀ䛡�  
	echo\
	echo ���StarWard:�c���_ʼ���Ӱ��o�Ե��X݆�D�˼��ɲ鿴�[���M�̸�Ŀ䛡�  
	echo �c�x�[���M�̸�Ŀ䛼���ʹ���YԴ�������_���[���M�̸�Ŀ䛡�  
	echo\
	echo ��Ȼ������β������������ģ�M��Ŀ�/Tutorial�Y�ϊA�в鿴�Ñ�f�h�͈D�İ��b�f����
	echo\
    pause
	goto menu
)

:menu
title HoYoShade Starter
cls
echo �gӭʹ��HoYoShadeע������
echo\
echo ģ�M�汾��V2.111.0 Stable
echo �_�l�ߣ�DuolaDStudio X �����AXBro X Ex_M
echo\
echo Ոע�⣬����Ҫ��Reshade.ini�}�u���[���M�̸�Ŀ䛣�Ȼ�����ʹ�ñ�ģ�M��
echo\
echo ��ģ�M�H����[�����{ɫʹ�ã�Ո���ر�Mod���Ñ�f�h���[�����_�l/�l�������P�l����
echo �������ģ�M��Ŀ�/Tutorial�Y�ϊA�в鿴ʹ���߅f���͈D�İ��b�f����
echo ʹ��ģ�M�Ĕz�زİl��ҕ�l�r��Ո���]:"ԓҕ�l��GitHub@DuolaD/HoYoShade�ṩ��Ⱦ֧��"��
echo ��������ԭ��o�����]��Ոͨ�^"�����x�"�е��M��ʽ�M�_�l���M���f����
echo\
echo [1]����ģ�M��Ŀ��е�ReShade.ini
echo [2]ע����ԭ���Ї���ꑷ��͑��ˣ�
echo [3]ע����ԭ�񣨆����������͑��ˣ�
echo [4]ע����ԭ�񣨇��H���͑���/Epic�͑��ˣ�
echo [5]ע����������(ͨ�ÿ͑���)
echo [6]ע�������ģ�����F��(ͨ�ÿ͑���)
echo [7]ע�����^�^��(ͨ�ÿ͑���)
echo [8]�����x�
echo [9]�˳�����

echo\
set /p "content=�ڴ�ݔ���x�ǰ��Ĕ��֣�"

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
    echo ݔ���e�`��
    timeout /t 2
    goto menu
    )
exit

:other
title HoYoShade Starter
cls
echo �gӭʹ��HoYoShadeע������
echo\
echo ģ�M�汾��V2.111.0 Stable
echo �_�l�ߣ�DuolaDStudio X �����AXBro X Ex_M
echo\
echo �������Ҫ�z��汾���£�����ȥ�L���҂��Ă}��鿴�Ƿ��аl�и��°汾
echo �_�l���x헃H����{ԇ/�z�y�e�`��Ҫ�������_�l�����_Ҫ�����@��������tՈ���p��ʹ��
echo\
echo ע��CYteam�W�P�����ṩ��ģ�M�����d֮�⣬߀���M�ṩ���H��ԭ��/���F/HoYoLAB���b����
echo ����֮�⣬CYteam߀�ṩһЩ��׿�ĸ�C�YԴ�����dȤ�Ŀ���ȥ��һ��~
echo ���xCYteam�ṩ�ľW�P����
echo\
echo [1]�L���҂���GitHub���}��
echo [2]��ȡ��CYteam�ṩ�ľW�P����
echo [3]�ڐ۰l���ٝ���ң�֧��΢�ź�֧������
echo [4]��Patreon��ٝ���ң�֧�ֺ���֧����ʽ��
echo [5]�����҂�ģ�M�Ĺٷ�QQ�t
echo [6]�����Һ�CYTeam���YԴQQ�t
echo [7]�P�HoYoShade
echo [8]�_�l���x�
echo [9]����������
echo [10]�˳�����

echo\
set /p "content=�ڴ�ݔ���x�ǰ��Ĕ��֣�"

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
    echo ݔ���e�`��
    timeout /t 2
    goto other
)
goto other

:develop
title HoYoShade Starter(�����M���_�l���x헣�����)
cls
echo �gӭʹ��HoYoShadeע������
echo\
echo ģ�M�汾��V2.111.0 Stable
echo �_�l�ߣ�DuolaDStudio X �����AXBro X Ex_M
echo\
echo ע�⣡�_�l���x헃H����{ԇ/�z�y�e�`��Ҫ�������_�l�����_Ҫ�����@��������tՈ���p��ʹ�ã�
echo\
echo [1]�Զ��xע��
echo [2]����������
echo [3]���������x�
echo [4]�˳�����

echo\
set /p "content=�ڴ�ݔ���x�ǰ��Ĕ��֣�"

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
    echo ݔ���e�`��
    timeout /t 2
    goto develop
)
goto develop@echo off


:BiliBili_Warning
title HoYoShade Starter(���������͑��ˆ���ǰ���棡)
cls
echo �gӭʹ��HoYoShadeע������
echo\
echo ģ�M�汾��V2.111.0 Stable
echo �_�l�ߣ�DuolaDStudio X �����AXBro X Ex_M
echo\
echo ע�⣡����
echo ��춆��������͑���ʹ�õ�������ܛ������[���~̖
echo ���K����ƹٷ�/���H��/Epic�͑��˵��[��ȵ���[���~̖
echo ��ˣ�Ո�ȴ_���[���ѳɹ�����[���~̖���ٰ�'Home'�I���_Reshade���ƙ��M�����m����
echo\
echo ��������[��]�гɹ�����[���~��ǰ���_Reshade���ƙ����[���ڏ�����䛴����������
echo ����㲻С�ě]��ע�⵽�@�c��l�����@�N��r��ֻ����_�΄չ������P�]�[����c�[�����P���M��
echo Ȼ�������ӱ�ģ�Mע�������ȴ�ע���[����棬�K����ʹ�ùٷ����������_�[�򼴿ɡ�
timeout /t 5
pause
goto YuanShen_inject

:YuanShen_inject
powershell -command Start-Process -FilePath inject.exe YuanShen.exe -Verb RunAs
exit

:customize_inject
title HoYoShade Starter(�����M���Զ��xע����棡����)
cls
echo �gӭʹ��HoYoShadeע������
echo\
echo ģ�M�汾��V2.111.0 Stable
echo �_�l�ߣ�DuolaDStudio X �����AXBro X Ex_M
echo\
echo ע�⣡�˹��܃H���_�l�ߜyԇ���[��ʹ�á��@��ζ�ſ��ܕ�����δ֪�L�U/Bug��
echo �������Ƕ����_�l��/�����_�l��ָ������tՈ��Ҫ����ʹ�ô˹���ע�뱾Reshade�������[��ȡ�
echo\
echo ʹ�÷�����ݔ��Ŀ�˳����ļ������ɣ��o�����'.exe'��Y������܇�_����
echo �ȴ�ע�봰�ڽ��揗���ᆙ��Ŀ�˳��򼴿ɡ�
echo ݔ��'/exit'���ɷ����_�l���档
echo\
set /p "content=�ڴ�ݔ�룺"
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
echo ʹReShade֧���׹��[�������п���PC���\�е��[��
echo Ȼ�ᣬ�˴˳ɾͣ��˴��Wҫ��
echo\
echo DuolaDStudio X �����AXBro x Ex_M
echo ��⠫I
echo\
echo ģ�M�汾��V2.111.0 Stable
echo\
echo HoYoShade���ReShade�ٷ�Ԫ����OpenHoYoShade��ܶ����_�l����Ч����/�A�O֮��������ļ�������BSL-3�_Դ�f����GitHub���_Դ��
echo �������Reshade.me�Wվ�в鿴ReShade�ٷ��YӍ��
echo Modify By DuolaDStudio Hong Kong Ltd,All rights reserved.
echo\
echo Ոע�⣺HoYoShade�����M�_ԴMod��ReShade�����M�_Դ�����OpenHoYoShade�����M�_Դ��ܡ�
echo ����ԭʼ�a��������GitHub�ϫ@ȡ��������Ǹ��Mُ�I��δ���޸�/�����_�l��(Open)HoYoShade
echo Ո�����˿�̼��Р��������_�l�ߟo�P��
echo\
echo Ԕ���_�l���Σ�
echo -DuolaDStudio Hong Kong Ltd.
echo   ��������D��DuolaD[RE�m����/��汾�����_�l/ע����/�A�O]
echo   ����������LynetteNotFound[HoYoShadeС�汾�����_�l/�S�o]
echo -Ex_M[���g֧Ԯ/ָ��/GUI�u��]
echo -�����AXBro[���MЧ����/����/�����g֧��]
echo\
echo �Q�x��
echo -CYTeam[HoYoShade�������/΢ܛ��I����Ӌ���ṩ/�ӑB�D�o�B�B�Y��Q����]
echo -Cloudflare, Inc.[�W��Ӛ���c����]
echo -Aira2[�Ǐ��ư汾�z�y���z�y�c���d]
echo\
echo ���x���㣡HoYoShade��������ã�
pause
goto other

:ini_Reset
title HoYoShade Starter
cls
echo �gӭʹ��HoYoShadeע������
echo\
echo ģ�M�汾��V2.111.0 Stable
echo �_�l�ߣ�DuolaDStudio X �����AXBro X Ex_M
echo\
echo Ոע�⣺��ֻ��Ҫ��ģ�MĿ��Ƅ������Ҫ����ReShade.ini
echo ����֮�⣬һ����r���㶼����Ҫ�M�����ò�����
echo\
echo �����ꮅ�ᣬ����Ҫ�����}�uReShade.ini���[���M�̸�Ŀ�
echo �Ƿ��^�m���ò�����
echo\
echo [1]��
echo [2]��(����ע�������ˆ�)
echo\
set /p "content=�ڴ�ݔ���x�ǰ��Ĕ��֣�"

if "%content%" == "1" (
    start "" /wait ".\InjectResource\INIBuild.exe"
    start "" "convert_encoding.bat"
	:File_Reset
	cls
	echo �gӭʹ��HoYoShadeע������
	echo\
	echo ģ�M�汾��V2.111.0 Stable
	echo �_�l�ߣ�DuolaDStudio X �����AXBro X Ex_M
	echo\
    echo ���óɹ����������ReShade.ini�F����Qģ�M��Ŀ��е��f��ReShade.ini��
    echo ����Ҫ���������ReShade.ini��Q�[���M�̸�Ŀ�ԭ�е�ReShade.ini��Ȼ�����ʹ�ñ�ģ�M��
    echo\
	echo ����ҵ��[���M�̸�Ŀ䛣�  
	echo ���HoYoPlay���׹��[��������:�c���_ʼ���Ӱ��o�Եĸ����D��-�[���O�����ɲ鿴�[���M�̸�Ŀ䛡�  
	echo �c�x'�_������Ŀ�'����ʹ���YԴ�������_���[���M�̸�Ŀ䛡�  
	echo\
	echo ���StarWard:�c���_ʼ���Ӱ��o�Ե��X݆�D�˼��ɲ鿴�[���M�̸�Ŀ䛡�  
	echo �c�x�[���M�̸�Ŀ䛼���ʹ���YԴ�������_���[���M�̸�Ŀ䛡�  
	echo\
	echo ��Ȼ������β������������ģ�M��Ŀ�/Tutorial�Y�ϊA�в鿴�Ñ�f�h�͈D�İ��b�f����
	echo\
    pause
	goto menu
) else if "%content%" == "2" (
    goto menu
) else (
    echo\
    echo ݔ���e�`��
    timeout /t 2
    goto ini_Reset
)