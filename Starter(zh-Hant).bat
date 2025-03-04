@echo off

chcp 936

title HoYoShade Starter
cls

net session >nul 2>&1
if %errorLevel% neq 0 (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
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
    echo �gӭʹ��HoYoShade��������
    echo\
    echo ģ�M�汾��V2.4.1 Stable
    echo �_�l�ߣ�DuolaDStudio X �����AXBro X Ex_M
    echo\
    echo �҂��z�y����Open��HoYoShade���ע������ı�Ҫ�ļ������ڡ�
    echo\
    echo ���F�@����ʾ��ԭ������У�
    echo 1:���ڽ≺���s���r�]�н≺ȫ���ļ���
    echo 2:�����M�и��w���²����ĕr��]��ճ�Nȫ���ļ���
    echo 3:��S�y�ϵĚ���ܛ��/���������`����Open��HoYoShade�R�e��������Ȼ��h����ĳЩ�ļ���
    echo 4:��o��/�����������˲����P�I�ļ���
    echo\
    echo ���������I�ᆙ���������˳��\�С�
    echo ��������^�m�\�У�Open��HoYoShade��Ո�L���҂���GitHub�}�죨https://github.com/DuolaD/HoYoShade���������d���°�Releases�������ṩ�ĉ��s�����K�≺ȫ���ļ���
    pause
    exit
)

set "filepath=%~dp0Reshade.ini"

if exist "%filepath%" (
    goto menu
) else (
    cls
    start "" /wait /b ".\InjectResource\INIBuild.exe"
    start "" "convert_encoding.bat"
    :FileCheck
    cls
    echo �gӭʹ��HoYoShade��������
    echo\
    echo ģ�M�汾��V2.4.1 Stable
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
echo �gӭʹ��HoYoShade��������
echo\
echo ģ�M�汾��V2.4.1 Stable
echo �_�l�ߣ�DuolaDStudio X �����AXBro X Ex_M
echo\
echo Ոע�⣬����Ҫ��Reshade.ini�}�u���[���M�̸�Ŀ䛣�Ȼ�����ʹ�ñ�ģ�M��
echo\
echo ��ģ�M�H����[�����{ɫʹ�ã�Ո���ر�Mod���Ñ�f�h���[�����_�l/�l�������P�l����
echo �������ģ�M��Ŀ�/Tutorial�Y�ϊA�в鿴ʹ���߅f���͈D�İ��b�f����
REM ��߀�Ǹ�Ը�⮔һ���ڱ���ĬĬ�������� XD
echo\
echo [1]����ģ�M��Ŀ��е�ReShade.ini
echo [2]ע����ԭ���Ї���ꑷ�/�����������͑��ˣ�
echo [3]ע����ԭ�񣨇��H���͑���/Epic�͑��ˣ�
echo [4]ע������������ͨ�ÿ͑��ˣ�
echo [5]ע�������ģ�����F����ͨ�ÿ͑��ˣ�
echo [6]ע�����^�^�㣨ͨ�ÿ͑��ˣ�
echo [7]�ГQ���yԇ���͑���ע���б�
echo [8]��Blender/��Ӱ�C���ע����ԭ��
echo [9]�����x�
echo [10]�˳�����

echo\
set /p "content=�ڴ�ݔ���x�ǰ��Ĕ��֣�"

echo\

if "%content%" == "1" (
    goto ini_Reset
) else if "%content%" == "2" (
    :YS_CheckProcess
    tasklist /FI "IMAGENAME eq YuanShen.exe" | find /i "YuanShen.exe" >nul
    if not errorlevel 1 (
        taskkill /IM YuanShen.exe /F >nul 2>&1
        goto YS_CheckProcess
    )
    echo �����x���ע��Ŀ�˞�:ԭ���Ї���ꑷ�/�����������͑��ˣ�
    echo ע�����F�ц��ӡ��_��ReShade.ini�}�u�����_���[���M�̸�Ŀ�֮�ᣬ��F�ڿ���ʹ�Æ����������[���ˡ�ע������һ��ע�롣
    echo ������x�����e�`��ע��Ŀ�ˣ�ֻ���P�]��ҕ���������\�І����������x�񼴿ɡ�
    echo\
    start "" /wait /b inject.exe YuanShen.exe
    exit
) else if "%content%" == "3" (
    :GI_CheckProcess
    tasklist /FI "IMAGENAME eq GenshinImpact.exe" | find /i "GenshinImpact.exe" >nul
    if not errorlevel 1 (
        taskkill /IM GenshinImpact.exe /F >nul 2>&1
        goto GI_CheckProcess
    )
    echo �����x���ע��Ŀ�˞�:ԭ�񣨇��H���͑���/Epic�͑��ˣ�
    echo ע�����F�ц��ӡ��_��ReShade.ini�}�u�����_���[���M�̸�Ŀ�֮�ᣬ��F�ڿ���ʹ�Æ����������[���ˡ�ע������һ��ע�롣
    echo ������x�����e�`��ע��Ŀ�ˣ�ֻ���P�]��ҕ���������\�І����������x�񼴿ɡ�
    echo\
    start "" /wait /b inject.exe GenshinImpact.exe
    exit
) else if "%content%" == "4" (
    echo �����x���ע��Ŀ�˞�:��������ͨ�ÿ͑��ˣ�
    echo ע�����F�ц��ӡ��_��ReShade.ini�}�u�����_���[���M�̸�Ŀ�֮�ᣬ��F�ڿ���ʹ�Æ����������[���ˡ�ע������һ��ע�롣
    echo ������x�����e�`��ע��Ŀ�ˣ�ֻ���P�]��ҕ���������\�І����������x�񼴿ɡ�
    echo\
    start "" /wait /b inject.exe BH3.exe
    exit
) else if "%content%" == "5" (
    echo �����x���ע��Ŀ�˞�:���ģ�����F����ͨ�ÿ͑��ˣ�
    echo ע�����F�ц��ӡ��_��ReShade.ini�}�u�����_���[���M�̸�Ŀ�֮�ᣬ��F�ڿ���ʹ�Æ����������[���ˡ�ע������һ��ע�롣
    echo ������x�����e�`��ע��Ŀ�ˣ�ֻ���P�]��ҕ���������\�І����������x�񼴿ɡ�
    echo\
    start "" /wait /b inject.exe StarRail.exe
    exit
) else if "%content%" == "6" (
    echo �����x���ע��Ŀ�˞�:�^�^�㣨ͨ�ÿ͑��ˣ�
    echo ע�����F�ц��ӡ��_��ReShade.ini�}�u�����_���[���M�̸�Ŀ�֮�ᣬ��F�ڿ���ʹ�Æ����������[���ˡ�ע������һ��ע�롣
    echo ������x�����e�`��ע��Ŀ�ˣ�ֻ���P�]��ҕ���������\�І����������x�񼴿ɡ�
    echo\
    start "" /wait /b inject.exe ZenlessZoneZero.exe
    exit
) else if "%content%" == "7" (
    goto beta_client_inject_choice_menu
) else if "%content%" == "8" (
    goto blender_hook_check
) else if "%content%" == "9" (
    goto other
) else if "%content%" == "10" (
    exit
) else (
    echo ݔ���e�`��
    timeout /t 2
    goto menu
    )
exit

:other
title HoYoShade Starter
cls
echo �gӭʹ��HoYoShade��������
echo\
echo ģ�M�汾��V2.4.1 Stable
echo �_�l�ߣ�DuolaDStudio X �����AXBro X Ex_M
echo\
echo �������Ҫ�z��汾���£�����ȥ�L���҂��Ă}��鿴�Ƿ��аl�и��°汾
echo ע�⣡�_�l���x헃H����{ԇ/�z�y�e�`���󡣳����_�l�����_Ҫ�����@����������������֪���Լ�����ʲ�N����tՈ���p��ʹ�ã�
echo\
echo �]��CYteam���dվ�����ṩ��ģ�M���R�����d֮�⣬߀���Ї���ꑵ؅^�ṩ���M�ć��H��ԭ��/���F/HoYoLAB���b����˽���YԴ��
echo ����֮�⣬CYteamҲ�ṩһЩ��׿�ĸ�C�YԴ�����dȤ�Ŀ���ȥ��һ��~
echo ���xCYteam�ṩ�����dվ����
echo\
echo [1]�L���҂���GitHub�}��
echo [2]�L����CYteam�ṩ�����dվ����
echo [3]ٝ����Mod
echo [4]�S�҂�
echo [5]�P�HoYoShade
echo [6]�_�l���x�
echo [7]����������
echo [8]�˳�����

echo\
set /p "content=�ڴ�ݔ���x�ǰ��Ĕ��֣�"

if "%content%" == "1" (
    start "" "https://github.com/DuolaD/HoYoShade/"
    goto other
) else if "%content%" == "2" (
    start "" "https://d.cyteam.cn/"
    goto other
) else if "%content%" == "3" (
    start "" "https://github.com/DuolaD/HoYoShade/blob/V2.X.X-Stable/Readme.Chinese_Traditional.md#%E3%80%A2-%E8%B4%8A%E5%8A%A9"
    goto other
) else if "%content%" == "4" (
    start "" "https://github.com/DuolaD/HoYoShade/blob/V2.X.X-Stable/Readme.Chinese_Traditional.md#%E3%80%A2-%E8%81%AF%E7%B9%AB%E6%88%91"
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
    echo ݔ���e�`��
    timeout /t 2
    goto other
)
goto other

:develop
title HoYoShade Starter(�����M���_�l���x헣�����)
cls
echo �gӭʹ��HoYoShade��������
echo\
echo ģ�M�汾��V2.4.1 Stable
echo �_�l�ߣ�DuolaDStudio X �����AXBro X Ex_M
echo\
echo ע�⣡�_�l���x헃H����{ԇ/�z�y�e�`���󡣳����_�l�����_Ҫ�����@����������������֪���Լ�����ʲ�N����tՈ���p��ʹ�ã�
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

:customize_inject
title HoYoShade Starter(�����M���Զ��xע����棡����)
cls
echo �gӭʹ��HoYoShade��������
echo\
echo ģ�M�汾��V2.4.1 Stable
echo �_�l�ߣ�DuolaDStudio X �����AXBro X Ex_M
echo\
echo ע�⣡�˹��܃H���_�l�ߜyԇ���[��ʹ�á��@��ζ�ſ��ܕ�����δ֪�L�U/Bug��
echo �����_�l�����_Ҫ�����@����������������֪���Լ�����ʲ�N����tՈ��Ҫ����ʹ�ô˹���ע��Reshade�������[��ȡ�
echo\
echo ʹ�÷�����ݔ��Ŀ�˳����ļ������ɣ��o�����'.exe'��Y������܇�_����
echo �ȴ�ע�봰�ڽ��揗���ᆙ��Ŀ�˳��򼴿ɡ�
echo ݔ��'\exit'���ɷ����_�l���档
echo\
set /p "content=�ڴ�ݔ�룺"
if "%content%" == "\exit" (
    goto develop
) else (
    echo �����x���ע��Ŀ�˞�:%content%.exe
    echo ע�����F�ц��ӡ��_��ReShade.ini�}�u�����_���[���M�̸�Ŀ�֮�ᣬ��F�ڿ���ʹ�Æ����������[���ˡ�ע������һ��ע�롣
    echo ������x�����e�`��ע��Ŀ�ˣ�ֻ���P�]��ҕ���������\�І����������x�񼴿ɡ�
    echo\
    start "" /wait /b inject.exe %content%.exe
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
echo ģ�M�汾��V2.4.1 Stable
echo\
echo HoYoShade���ReShade�ٷ��M����OpenHoYoShade��ܶ����_�l����Ч����/�A�O֮��������ļ�������BSL-3�_Դ�f����GitHub���_Դ��
echo �������Reshade.me�Wվ�в鿴ReShade�ٷ��YӍ��
echo Modify By DuolaDStudio Hong Kong Ltd,All rights reserved.
echo\
echo Ոע�⣺HoYoShade�����M�_ԴMod��ReShade�����M�_Դ�����OpenHoYoShade�����M�_Դ��ܡ�
echo ����ԭʼ�a��������GitHub�ϫ@ȡ��������Ǹ��Mُ�I��δ���޸�/�����_�l��(Open)HoYoShade
echo Ո�����˿�̼��Р��������_�l�ߟo�P��
echo\
echo Ԕ���_�l���Σ�
echo -DuolaDStudio Hong Kong Ltd.
echo   ��������D��DuolaD[RE�m��/��汾�����_�l/������/�A�O]
echo   ����������LynetteNotFound[HoYoShadeС�汾�����_�l/�S�o]
echo -Ex_M[���g֧Ԯ/ָ��/GUI�u��]
echo -�����AXBro[����/�����g֧��]
echo\
echo �Q�x��
echo -CYTeam[HoYoShade�������/΢ܛ��I����Ӌ���ṩ/�ӑB�D�o�B�B�Y��Q����]
echo -Cloudflare, Inc.[�W��Ӛ���c����]
echo\
echo ���x���㣡HoYoShade��������ã�
pause
goto other

:ini_Reset
title HoYoShade Starter
cls
echo �gӭʹ��HoYoShade��������
echo\
echo ģ�M�汾��V2.4.1 Stable
echo �_�l�ߣ�DuolaDStudio X �����AXBro X Ex_M
echo\
echo Ոע�⣺��ֻ��Ҫ��ģ�MĿ��Ƅ������Ҫ����ReShade.ini
echo ����֮�⣬һ����r���㶼����Ҫ�M�����ò�����
echo\
echo �����ꮅ�ᣬ����Ҫ�����}�uReShade.ini���[���M�̸�Ŀ�
echo �Ƿ��^�m���ò�����
echo\
echo [1]��
echo [2]��(���؆��������ˆ�)
echo\
set /p "content=�ڴ�ݔ���x�ǰ��Ĕ��֣�"

if "%content%" == "1" (
    start "" /wait ".\InjectResource\INIBuild.exe"
    start "" "convert_encoding.bat"
    :File_Reset
    cls
    echo �gӭʹ��HoYoShade��������
    echo\
    echo ģ�M�汾��V2.4.1 Stable
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

:beta_client_inject_choice_menu
title HoYoShade������
cls
echo �gӭʹ��HoYoShade��������
echo\
echo ģ�M�汾��V2.4.1 Stable
echo �_�l�ߣ�DuolaDStudio X �����AXBro X Ex_M
echo\
echo Ոע�⣬����Ҫ��Reshade.ini�}�u���[���M�̸�Ŀ䛣�Ȼ�����ʹ�ñ�ģ�M��
echo\
echo ��ģ�M�H����[�����{ɫʹ�ã�Ո���ر�Mod���Ñ�f�h���[�����_�l/�l�������P�l����
echo �������ģ�M��Ŀ�/Tutorial�ļ��A�в鿴�Ñ�f�h�͈D�İ��b�f����
echo ʹ��ģ�M�Ĕz�زİl��ҕ�l�r��Ո���]:"ԓҕ�l��GitHub@DuolaD/HoYoShade�ṩ��Ⱦ֧��"��
echo ��������ԭ��o�����]��Ոͨ�^"�����x�"�е��M��ʽ�M�_�l���M���f����
echo\
echo ���¿͑���ע���x헾�ֻ�����ע�����yԇ���͑��ˡ�
echo\
echo �������ʹ�õĜyԇ���͑��˲��ڴ��б�����ע����δ���[�򆙄�����푑����t�f��:
echo 1:����ʹ�õĜyԇ���͑���ע���x��c���_�͑���ע���x�ͨ�ã�Ո�ȇ�ԇʹ�ù��_�͑���ע���б�Lԇע�롣
echo 2:HoYoShade��δ�m����Ŀǰ����ʹ�õĜyԇ���͑��ˡ�
echo �����m�䣬Ո���҂����L���҂���GitHub�}�죨https://github.com/DuolaD/HoYoShade���ύissues��
echo\
echo [1]����ģ�M��Ŀ��е�ReShade.ini
echo [2]ע����ԭ�񣨲��ֹ��yǰ����Ȝy�͑��ˣ�
echo [3]ע�����^�^�㣨ͨ�ù��yǰ�Ȝy�͑��ˣ�
echo [4]ע�����^�^�㣨ͨ�ù��y��Ȝy�͑��ˣ�
echo [5]�ГQ�����_�͑���ע���б�
echo [6]�����x�
echo [7]�˳�����

echo\
set /p "content=�ڴ�ݔ���x�ǰ��Ĕ��֣�"

echo\

if "%content%" == "1" (
    goto ini_Reset
) else if "%content%" == "2" (
    :GICBT_CheckProcess
    tasklist /FI "IMAGENAME eq Genshin.exe" | find /i "Genshin.exe" >nul
    if not errorlevel 1 (
        taskkill /IM Genshin.exe /F >nul 2>&1
        goto GICBT_CheckProcess
    )
    echo �����x���ע��Ŀ�˞�:ԭ�񣨲��ֹ��yǰ����Ȝy�͑��ˣ�
    echo ע�����F�ц��ӡ��_��ReShade.ini�}�u�����_���[���M�̸�Ŀ�֮�ᣬ��F�ڿ���ʹ�Æ����������[���ˡ�ע������һ��ע�롣
    echo ������x�����e�`��ע��Ŀ�ˣ�ֻ���P�]��ҕ���������\�І����������x�񼴿ɡ�
    echo\
    start "" /wait /b inject.exe Genshin.exe
    exit
) else if "%content%" == "3" (
    echo �����x���ע��Ŀ�˞�:�����㣨ͨ�ù���ǰ�ڲ�ͻ��ˣ�
    echo ע�����F�ц��ӡ��_��ReShade.ini�}�u�����_���[���M�̸�Ŀ�֮�ᣬ��F�ڿ���ʹ�Æ����������[���ˡ�ע������һ��ע�롣
    echo ������x�����e�`��ע��Ŀ�ˣ�ֻ���P�]��ҕ���������\�І����������x�񼴿ɡ�
    echo\
    start "" /wait /b inject.exe ZZZ.exe
    exit
) else if "%content%" == "4" (
    echo �����x���ע��Ŀ�˞�:�����㣨ͨ�ù�����ڲ�ͻ��ˣ�
    echo ע�����F�ц��ӡ��_��ReShade.ini�}�u�����_���[���M�̸�Ŀ�֮�ᣬ��F�ڿ���ʹ�Æ����������[���ˡ�ע������һ��ע�롣
    echo ������x�����e�`��ע��Ŀ�ˣ�ֻ���P�]��ҕ���������\�І����������x�񼴿ɡ�
    echo\
    start "" /wait /b inject.exe ZenlessZoneZeroBeta.exe
    exit
) else if "%content%" == "5" (
    goto menu
) else if "%content%" == "6" (
    goto other
) else if "%content%" == "7" (
    exit
) else (
    echo\
    echo ݔ���e�`��
    timeout /t 2
    goto menu
    )
exit


:blender_hook_check

if not exist "%~dp0loader.exe.lnk" (
    echo\
    echo �ԙzδͨ�^��ģ�M��Ŀ��K�]���ҵ�����loader.exe�Ŀ�ݷ�ʽ��
    echo Ո��ģ�M��Ŀ�����һ��ָ��Blender/��Ӱ�C���ע�����loader.exe���Ŀ�ݷ�ʽ��Ȼ�ጢ��������loader.exe��Ȼ����ԇһ�Ρ�
    pause
    goto menu
)

curl --version >nul 2>&1
if errorlevel 1 (
    set missing_curl="1"
    goto blender_hook_menu
)

set "apiUrl=fromcnornot.165683.xyz"
for /f "tokens=* delims=" %%i in ('curl -s -o nul -w "%%{http_code}" %apiUrl%') do (
    set "statusCode=%%i"
)

if "%statusCode%"=="403" (
    :blender_hook_not_in_cn
    cls
    title HoYoShade������
    cls
    echo �gӭʹ��HoYoShade��������
    echo\
    echo ģ�M�汾��V2.4.1 Stable
    echo �_�l�ߣ�DuolaDStudio X �����AXBro X Ex_M
    echo\
    echo �҂��z�y����ǰ����ܲ����Ї����/�۰��_�؅^��
    echo �@���ܕ����±�Mod����ע�빦�ܺ�Blender/��Ӱ�C����o���������ڵć��Ҽ��؅^�@���������g֧��,���茦���ṩ�κμ��g֧�֡�
    echo\
    echo �Ƿ�_�J�Lԇ�^�m������
    echo\
    echo [1]��
    echo [2]�񣨷��؆��������ˆΣ�
    echo\
    set /p "content=�ڴ�ݔ���x�ǰ��Ĕ��֣�"
    if "%content%" == "1" (
        goto blender_hook_menu
    ) else if "%content%" == "2" (
        goto menu
    ) else (
        echo\
        echo ݔ���e�`��
        timeout /t 2
        goto blender_hook_not_in_cn
    )
)

:blender_hook_menu
cls
title HoYoShade������
cls
echo �gӭʹ��HoYoShade��������
echo\
echo ģ�M�汾��V2.4.1 Stable
echo �_�l�ߣ�DuolaDStudio X �����AXBro X Ex_M
echo\
if "%missing_curl%"=="1" (
    echo �҂��z�y����ǰ����ϵ�y�ЁK������curl�M�����@�����µ؅^�z�y���ܟo��������
    echo\
    echo ����Ȼ�����^�mʹ�ô�Mod����ע�빦�ܡ�
    echo �������K��̎��Ї����/�۰��_�؅^�����ܕ����±�Mod����ע�빦�ܺ�Blender/��Ӱ�C����o���������ڵć��Ҽ��؅^�@���������g֧��,���茦���ṩ�κμ��g֧�֡�
    echo\
)
echo ע�⣺�����ʹ����ע�빦�ܣ���Ҫ�x������Blender/��Ӱ�C����н����Č����������Ŀ͑��ˣ���tReShade�o������ע�롣
echo ����@�����һ�Ά���Blender/��Ӱ�C�����Ո�_���ڴ�̎�x���Ŀ�˿͑��˺��������Blender/��Ӱ�C����н�����Ŀ�˿͑���һ�£���tReShade�o������ע�롣
echo\
echo [1]����ģ�M��Ŀ��е�ReShade.ini
echo [2]��Blender/��Ӱ�C���ע����ԭ���Ї����/���������͑��ˣ�
echo [3]��Blender/��Ӱ�C���ע����ԭ�񣨇��H���͑���/Epic�͑��ˣ�
echo [4]�H����Blender/��Ӱ�C���
echo [5]ͬ����ǰϵ�y�r�g���ޏ�ϵ�y�r�g��ͬ������ʾ
echo [6]����������
echo [7]�˳�����
echo\
set /p "choice=�ڴ�ݔ���x�ǰ��Ĕ��֣�"
echo\
if "%choice%"=="1" (
    goto ini_Reset
) else if "%choice%"=="2" (
    :YSBL_CheckProcess
    tasklist /FI "IMAGENAME eq YuanShen.exe" | find /i "YuanShen.exe" >nul
    if not errorlevel 1 (
        taskkill /IM YuanShen.exe /F >nul 2>&1
        goto YSBL_CheckProcess
    )
    echo ���x���ע��Ŀ�ˠ�:ԭ���Ї����/���������͑��ˣ�
    echo\
    echo ReShade��Blender/��Ӱ�C���ע�����F�ц��ӡ�Ո��Ҫ�P�]�����ڡ�
    echo Blender/��Ӱ�C���ע���������[���ᣬReShade�����Ԅ�ע��K�P�]ԓ���ڡ�
    echo ���ReShade.ini�}�u�������_���[���M�̸�Ŀ䛣����NReShade�������_�O�ÁK���ӡ�
    echo\
    echo ������x�����e�`��ע��Ŀ�ˣ�ֻ���P�]�˴��ں�Blender/��Ӱ�C���ע���������������\�І����������x�񼴿ɡ�
    echo\
    start "" "%~dp0loader.exe.lnk"
    start "" /wait /b inject.exe YuanShen.exe
    exit
) else if "%choice%"=="3" (
    :GIBL_CheckProcess
    tasklist /FI "IMAGENAME eq GenshinImpact.exe" | find /i "GenshinImpact.exe" >nul
    if not errorlevel 1 (
        taskkill /IM GenshinImpact.exe /F >nul 2>&1
        goto GIBL_CheckProcess
    )
    echo ���x���ע��Ŀ�ˠ�:ԭ�񣨇��H���͑���/Epic �͑��ˣ�
    echo\
    echo ReShade��Blender/��Ӱ�C���ע�����F�ц��ӡ�Ո��Ҫ�P�]�����ڡ�
    echo Blender/��Ӱ�C���ע���������[���ᣬReShade�����Ԅ�ע��K�P�]ԓ���ڡ�
    echo ���ReShade.ini�}�u�������_���[���M�̸�Ŀ䛣����NReShade�������_�O�ÁK���ӡ�
    echo\
    echo ������x�����e�`��ע��Ŀ�ˣ�ֻ���P�]�˴��ں�Blender/��Ӱ�C���ע���������������\�І����������x�񼴿ɡ�
    echo\
    start "" "%~dp0loader.exe.lnk"
    start "" /wait /b inject.exe GenshinImpact.exe
    exit
) else if "%choice%"=="4" (
    start "" "%~dp0loader.exe.lnk"
    exit
) else if "%choice%"=="5" (
    cls
    echo ͬ��ϵ�y�r�g�ĺĕrȡ�Q��㮔ǰ�ľW�j��r��
    echo �����ǰ�W�j�^��ĕr���ܕ����A���^�L��Ո���ĵȴ���
    echo\
    echo ���ڙz��K���� Windows Time ����...
    net start w32time >nul 2>&1
    echo\
    for /f "tokens=* delims=" %%i in ('curl -s -o nul -w "%%{http_code}" %apiUrl%') do (
        set "statusCode=%%i"
    )
    if "%statusCode%"=="201" (
        w32tm /config /manualpeerlist:"ntp.ntsc.ac.cn" /syncfromflags:manual /reliable:YES /update >nul 2>&1
        net stop w32time >nul 2>&1
        net start w32time >nul 2>&1
        echo �z�y���㮔ǰλ��Ї���ꑣ������y���L��΢ܛ�ٷ��r�gԴͬ����������
        echo ��ǰ��Ĳ���ϵ�yͬ���r�gԴ�Ѹ��Ġ��Ї���ꑿƌWԺ�����ڕr���Ĺٷ��r�gԴͬ�����������Է���朽ӷ�����ͬ���r�g��
        echo\
    )
    echo ���ڇLԇͬ���r�g...
    echo\
    w32tm /resync >nul 2>&1
    if %errorlevel% == 0 (
        echo �r�gͬ���ɹ������L�� https://time.is �ԙz�y�r�g�Ƿ���ͬ����Ȼ�����Lԇ�\��Blender/��Ӱ�C�����
    ) else (
        echo �r�gͬ��ʧ�����������򠑛]�����_����NTP�r�g�������������e�`��
        echo Ո�_��NTP�r�g�������O�����_���K�ҾW�j�B��������
        echo ����ԇLԇ������ԇ�����L��ϵ�y�O��-�r�g���Z��-���ں͕r�g�M���ք��O�á�
    )
    echo\
    echo ========================
    echo\
    echo ע�⣺���������ʹ���^���У�Blender/��Ӱ�C�����Ȼ�����Ԉ��eϵ�y�r�g��ͬ������ʾ/����Ҫ������ʹ�ñ����܁��ޏ͈��e/ϵ�y�r�g�ͬF���r�g�����Բ�����
    echo ��������´γ��F��ʾǰ��ǰ�� https://time.is �ԙz�y�Ƿ��`��Ȼ����ʹ�ñ������M���ޏ͡�
    echo\
    echo ����@�K�����`�����N�f����ǰ�O��ĕr��·�O�п���δ���ڔ��/�P�C/����/˯�ߵ���r������������
    echo ����ԃ��șz���O������BIOS��늳������ͨ����CR2032��늉����2V�f��늳�����ıM����
    echo ���늉��^�ͣ�Ո�Lԇ���Qȫ�µ�늳أ��K��BIOS���O�����_�ĕr�g��Ȼ��ʹ�ñ�����ͬ��ϵ�y�r�g��
    echo\
    echo ������Q늳���������f/��ǰ�O�������P�l��o�����и��Q��Ո�M����O���u����/�������S�ޙC�����������
    echo\
    echo ========================
    echo\
    pause
    goto blender_hook_menu
) else if "%choice%"=="6" (
    goto menu
) else if "%choice%"=="7" (
    exit
) else (
    echo ݔ���e�`��
    timeout /t 2
    goto blender_hook_menu
)