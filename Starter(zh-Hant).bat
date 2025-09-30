@echo off
setlocal enabledelayedexpansion

chcp 936

title HoYoShade������
cls

net session >nul 2>&1
if %errorLevel% neq 0 (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

set files_to_check=("inject.exe" "ReShade64.dll" "InjectResource" "LauncherResource" "reshade-shaders" "Presets" "LauncherResource\INIBuild.exe" "InjectResource\Fonts\MiSans-Bold.ttf")

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
    echo ģ�M�汾��V2.X.X Stable - NextVersion
    echo �_�l�ߣ�DuolaDStudio X ZelbertYQ X Ex_M
    echo ��[�ø�֮��]ע��Ⱥ���
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

if not exist "%filepath%" ( 
    set missing_reshade_config=1
)

start "" /wait /b ".\LauncherResource\INIBuild.exe"

if %missing_reshade_config% equ 1(
    cls
    :FileCheck
    cls
    echo �gӭʹ��HoYoShade��������
    echo\
    echo ģ�M�汾��V2.X.X Stable - NextVersion
    echo �_�l�ߣ�DuolaDStudio X ZelbertYQ X Ex_M
    echo ��[�ø�֮��]ע��Ⱥ���
    echo\
    echo ��ϲ�����ѳɹ����bHoYoShade��
    echo �҂��z�y�����ǵ�һ��ʹ�ñ�ģ�M��Reshade.ini�F��������ģ�M��Ŀ��С�
    echo\
    echo ����@�����һ���� miHoYo���׹��[��/ HoYoverse �[����ʹ��ReShade����F�ڿ����^�m�ˡ�
    echo ע�������Ԅәz�y�K�}�u�����ļ���ReShade.ini�����[���M�̸�Ŀ䛡�
    echo\
    echo ������������� miHoYo���׹��[��/ HoYoverse �[����ʹ���^ReShade
    echo �������Ҫ�Ȅh��ReShade.ini����횣��� ReShade.log���Ǳ�횣������h�h������
    echo ���磺
    echo ��������ʹ���^ HoYoShade V2.5.1 Stable �����µİ汾��
    echo ��������ʹ���^������/���л�춹ٷ�ReShade/HoYoShade�����_�l��ReShade��
    echo\
    echo ����ҵ��[���M�̸�Ŀ䛣�  
    echo ���HoYoPlay���׹��[��������:�c���_ʼ���Ӱ��o��߅�ĸ����D��-�[���O�ü��ɲ鿴�[���M�̸�Ŀ䛡�  
    echo �c��'���_����Ŀ�'����ʹ���YԴ���������_�[���M�̸�Ŀ䛡�  
    echo\
    echo ���StarWard:�c���_ʼ���Ӱ��o��߅���X݆�D�˼��ɲ鿴�[���M�̸�Ŀ䛡�  
    echo �c���[���M�̸�Ŀ䛼���ʹ���YԴ���������_�[���M�̸�Ŀ䛡�  
    echo\
    echo ��Ȼ������β������������ģ�M��Ŀ�/Tutorial�ļ��A�в鿴�Ñ�f�h�͈D�İ��b�f����
    echo\
    pause
    goto menu
)

:menu
title HoYoShade������
cls
echo �gӭʹ��HoYoShade��������
echo\
echo ģ�M�汾��V2.X.X Stable - NextVersion
echo �_�l�ߣ�DuolaDStudio X ZelbertYQ X Ex_M
echo ��[�ø�֮��]ע��Ⱥ���
echo\
echo\
echo ��ǰע���б����_�͑���ע���б�
echo\
echo ��ģ�M�H����[�����{ɫʹ�ã�Ո���ر�Mod���Ñ�f�h���[�����_�l/�l�������P�l����
echo �������ģ�M��Ŀ�/Tutorial�ļ��A�в鿴�Ñ�f�h�͈D�İ��b�f����
REM ��߀�Ǹ���⮔һ���ڱ���ĬĬ�������� XD
echo\
echo *:ԓע���x��m���Beta/�������w�������������Ҫ���_�l�߫@ȡ�a������ע�롣
echo\
echo [1]����ģ�M��Ŀ��е�ReShade.ini
echo [2]ע����ԭ���Ї����/�������� ���_/Devkit/Beta/�������w���͑��ˣ�*
echo [3]ע����ԭ�񣨇��H��/Epic ���_/Beta/�������w���͑��ˣ�*
echo [4]ע������������ͨ�� ���_/Beta�͑��ˣ�*
echo [5]ע�������ģ�����F����ͨ�� ���_/Beta/�������w���͑��ˣ�*
echo [6]ע�����^�^�㣨ͨ�� ���_�͑��ˣ�
echo [7]�ГQ���yԇ���͑���ע���б�
echo [8]��Blender/��Ӱ�C���ע����ԭ��/�^�^�㣨���_�͑��ˣ�
echo [9]�����x�
echo [10]�˳�����

echo\
set /p "content=�ڴ�ݔ���x�ǰ��Ĕ��֣�"

echo\

if "%content%" == "1" (
    goto ini_Reset
) else if "%content%" == "2" (
    cls
    echo ���x���ע��Ŀ�ˠ�:ԭ���Ї����/�������� ���_/Devkit/Beta/�������w���͑��ˣ�
    echo ע�����F�ц��ӣ���F�ڿ���ʹ�Æ����������[���ˡ�ע������һ��ע�롣
    echo ������x�����e�`��ע��Ŀ�ˣ�ֻ���P�]�˴����������\�І����������x�񼴿ɡ�
    echo\
    echo ��Ҫ������Ҫʹ��һ���[�򆙄����톙���[�򣨟oՓ�ǹٷ�������߀�ǵ���������������
    echo ����ֱ���p���\���M��/�M�̿�ݷ�ʽ�Ԇ����[�򡣷�t��ע��ʧ����
    echo\
    echo\
    echo ��ע���x�֧��ע��HoYoShade��ԭ���Ї����/�������� Devkit/Beta/�������w���͑��ˣ���
    echo\
    echo ��ע���͑��˕r������Ҫʹ�ùٷ������ṩ���[�򆙄����톙���[��
    echo �㲻��ֱ���p���\���M��/�M�̿�ݷ�ʽ�Ԇ����[�򣬷�t���ܕ�����ע��ʧ����
    echo ������ٷ�δ�����ṩ������/��]�І�������ע��ʧ�����������Ҫ���_�l�߫@ȡ�a������ע�롣
    echo ���a�����]Դ�a���ҁK�������HoYoShade�У���o��ͨ�^����HoYoShadeԴ���a�팍�Fע�빦�ܡ�
    echo ���P������Ϣ��Ո�M�_�l�� ����D��DuolaD ��https://github.com/DuolaD�� �ԫ@ȡ������Ϣ��
    echo\
    start "" /wait /b inject.exe YuanShen.exe
    exit
) else if "%content%" == "3" (
    cls
    echo ���x���ע��Ŀ�ˠ�:ԭ�񣨇��H��/Epic ���_/Beta/�������w���͑��ˣ�
    echo ע�����F�ц��ӣ���F�ڿ���ʹ�Æ����������[���ˡ�ע������һ��ע�롣
    echo ������x�����e�`��ע��Ŀ�ˣ�ֻ���P�]�˴����������\�І����������x�񼴿ɡ�
    echo\
    echo ��Ҫ������Ҫʹ��һ���[�򆙄����톙���[�򣨟oՓ�ǹٷ�������߀�ǵ���������������
    echo ����ֱ���p���\���M��/�M�̿�ݷ�ʽ�Ԇ����[�򡣷�t��ע��ʧ����
    echo\
    echo\
    echo ��ע���x�֧��ע��HoYoShade��ԭ�񣨇��H�� Beta/�������w���͑��ˣ���
    echo\
    echo ��ע���͑��˕r������Ҫʹ�ùٷ������ṩ���[�򆙄����톙���[��
    echo �㲻��ֱ���p���\���M��/�M�̿�ݷ�ʽ�Ԇ����[�򣬷�t���ܕ�����ע��ʧ����
    echo ������ٷ�δ�����ṩ������/��]�І�������ע��ʧ�����������Ҫ���_�l�߫@ȡ�a������ע�롣
    echo ���a�����]Դ�a���ҁK�������HoYoShade�У���o��ͨ�^����HoYoShadeԴ���a�팍�Fע�빦�ܡ�
    echo ���P������Ϣ��Ո�M�_�l�� ����D��DuolaD ��https://github.com/DuolaD�� �ԫ@ȡ������Ϣ��
    echo\
    start "" /wait /b inject.exe GenshinImpact.exe
    exit
) else if "%content%" == "4" (
    cls
    echo ���x���ע��Ŀ�ˠ�:��������ͨ�� ���_/Beta�͑��ˣ�
    echo ע�����F�ц��ӣ���F�ڿ���ʹ�Æ����������[���ˡ�ע������һ��ע�롣
    echo ������x�����e�`��ע��Ŀ�ˣ�ֻ���P�]�˴����������\�І����������x�񼴿ɡ�
    echo\
    echo ��Ҫ������Ҫʹ��һ���[�򆙄����톙���[�򣨟oՓ�ǹٷ�������߀�ǵ���������������
    echo ����ֱ���p���\���M��/�M�̿�ݷ�ʽ�Ԇ����[�򡣷�t��ע��ʧ����
    echo\
    echo\
    echo ��ע���x�֧��ע��HoYoShade����������ͨ�� Beta�͑��ˣ���
    echo\
    echo ��ע���͑��˕r������Ҫʹ�ùٷ������ṩ���[�򆙄����톙���[��
    echo �㲻��ֱ���p���\���M��/�M�̿�ݷ�ʽ�Ԇ����[�򣬷�t���ܕ�����ע��ʧ����
    echo ���a�����]Դ�a���ҁK�������HoYoShade�У���o��ͨ�^����HoYoShadeԴ���a�팍�Fע�빦�ܡ�
    echo ���P������Ϣ��Ո�M�_�l�� ����D��DuolaD ��https://github.com/DuolaD�� �ԫ@ȡ������Ϣ��
    echo\
    echo\
    start "" /wait /b inject.exe BH3.exe
    exit
) else if "%content%" == "5" (
    cls
    echo ���x���ע��Ŀ�ˠ�:���ģ�����F����ͨ�� ���_/Beta/�������w���͑��ˣ�
    echo ע�����F�ц��ӣ���F�ڿ���ʹ�Æ����������[���ˡ�ע������һ��ע�롣
    echo ������x�����e�`��ע��Ŀ�ˣ�ֻ���P�]�˴����������\�І����������x�񼴿ɡ�
    echo\
    echo ��Ҫ������Ҫʹ��һ���[�򆙄����톙���[�򣨟oՓ�ǹٷ�������߀�ǵ���������������
    echo ����ֱ���p���\���M��/�M�̿�ݷ�ʽ�Ԇ����[�򡣷�t��ע��ʧ����
    echo\
    echo\
    echo ��ע���x�֧��ע��HoYoShade�����ģ�����F����ͨ�� Beta/�������w���͑��ˣ���
    echo\
    echo ��ע���͑��˕r������Ҫʹ�ùٷ������ṩ���[�򆙄����톙���[��
    echo �㲻��ֱ���p���\���M��/�M�̿�ݷ�ʽ�Ԇ����[�򣬷�t���ܕ�����ע��ʧ����
    echo ������ٷ�δ�����ṩ������/��]�І��������������Ҫ���_�l�߫@ȡ�a������ע�롣
    echo ���a�����]Դ�a���ҁK�������HoYoShade�У���o��ͨ�^����HoYoShadeԴ���a�팍�Fע�빦�ܡ�
    echo ���P������Ϣ��Ո�M�_�l�� ����D��DuolaD ��https://github.com/DuolaD�� �ԫ@ȡ������Ϣ��
    echo\
    start "" /wait /b inject.exe StarRail.exe
    exit
) else if "%content%" == "6" (
    echo ���x���ע��Ŀ�ˠ�:�^�^�㣨ͨ�� ���_�͑��ˣ�
    echo ע�����F�ц��ӣ���F�ڿ���ʹ�Æ����������[���ˡ�ע������һ��ע�롣
    echo ������x�����e�`��ע��Ŀ�ˣ�ֻ���P�]�˴����������\�І����������x�񼴿ɡ�
    echo\
    echo ��Ҫ������Ҫʹ��һ���[�򆙄����톙���[�򣨟oՓ�ǹٷ�������߀�ǵ���������������
    echo ����ֱ���p���\���M��/�M�̿�ݷ�ʽ�Ԇ����[�򡣷�t��ע��ʧ����
    echo\
    echo ע�⣺��ע���x헲��m����κ� �^�^�㣨���yǰ/��Ȝy��Beta�����͑��ˣ�
    echo ����ע������͑��ˣ�Ո�P�]���ځK������HoYoShade���������K�ڹ��_�͑���ע���б��x�񌦑��Ŀ͑��ˡ�
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
title HoYoShade������
cls
echo �gӭʹ��HoYoShade��������
echo\
echo ģ�M�汾��V2.X.X Stable - NextVersion
echo �_�l�ߣ�DuolaDStudio X ZelbertYQ X Ex_M
echo ��[�ø�֮��]ע��Ⱥ���
echo\
echo �������Ҫ�z��汾���£�����ȥ�L���҂��Ă}��鿴�Ƿ��аl�и��°汾
echo ע�⣡�_�l���x헃H����{ԇ/�z�y�e�`��Ҫ�������_�l�����_Ҫ�����@����������������֪���Լ�����ʲ�N����tՈ���p��ʹ�ã�
echo\
echo ע��CYteam���dվ�����ṩ��ģ�M���R�����d֮�⣬߀���Ї���ꑵ؅^�ṩ���M�ć��H��ԭ��/���F/HoYoLAB���b����˽���YԴ��
echo ����֮�⣬CYteam߀�ṩһЩ��׿�ĸ�C�YԴ�����dȤ�Ŀ���ȥ��һ��~
echo ���xCYteam�ṩ�����dվ����
echo\
echo [1]�L���҂���GitHub�}��
echo [2]�L����CYteam�ṩ�����dվ����
echo [3]ٝ����Mod
echo [4]�M�҂�
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
title HoYoShade������(�����M���_�l���x헣�����)
cls
echo �gӭʹ��HoYoShade��������
echo\
echo ģ�M�汾��V2.X.X Stable - NextVersion
echo �_�l�ߣ�DuolaDStudio X ZelbertYQ X Ex_M
echo ��[�ø�֮��]ע��Ⱥ���
echo\
echo ע�⣡�_�l���x헃H����{ԇ/�z�y�e�`��Ҫ�������_�l�����_Ҫ�����@����������������֪���Լ�����ʲ�N����tՈ���p��ʹ�ã�
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
title HoYoShade������(�����M���Զ��xע����棡����)
cls
echo �gӭʹ��HoYoShade��������
echo\
echo ģ�M�汾��V2.X.X Stable - NextVersion
echo �_�l�ߣ�DuolaDStudio X ZelbertYQ X Ex_M
echo ��[�ø�֮��]ע��Ⱥ���
echo\
echo ע�⣡�˹��܃H���_�l�ߜyԇ���[��ʹ�á��@��ζ�ſ��ܕ�����δ֪�L�U/Bug��
echo �����_�l�����_Ҫ�����@����������������֪���Լ�����ʲ�N����tՈ��Ҫ����ʹ�ô˹���ע��Reshade�������[��ȡ�
echo\
echo ʹ�÷�����ݔ��Ŀ�˳����ļ������ɣ��o�����'.exe'��Y������܇�_����
echo �ȴ�ע�봰�ڽ��揗���ᆙ��Ŀ�˳��򼴿ɡ�
echo ݔ��'\exit'���ɷ����_�l���档
echo\
set /p "content=�ڴ�ݔ�룺"
echo\
if "%content%" == "\exit" (
    goto develop
) else (
    echo ���x���ע��Ŀ�ˠ�:%content%.exe
    echo ע�����F�ц��ӣ���F�ڿ���ʹ�Æ����������[���ˡ�ע������һ��ע�롣
    echo ������x�����e�`��ע��Ŀ�ˣ�ֻ���P�]�˴����������\�І����������x�񼴿ɡ�
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
echo DuolaDStudio X ZelbertYQ x Ex_M
echo ��⠫I
echo\
echo ģ�M�汾��V2.X.X Stable - NextVersion
echo\
echo HoYoShade���ReShade�ٷ������OpenHoYoShade��ܶ����_�l����Ч����/�A�O֮��������ļ�������BSL-3�_Դ�f�h��GitHub���_Դ��
echo �������Reshade.me�Wվ�в鿴ReShade�ٷ��YӍ��
echo Modify By DuolaDStudio Hong Kong Ltd,All rights reserved.
echo\
echo Ոע�⣺HoYoShade�����M�_ԴMod��ReShade�����M�_Դ�����OpenHoYoShade�����M�_Դ��ܡ�
echo ����Դ�a��������GitHub�ϫ@ȡ��������Ǹ��Mُ�I��δ���޸�/�����_�l��(Open)HoYoShade
echo Ո�����˿�̼��Р��������_�l�ߟo�P��
echo\
echo Ԕ���_�l���Σ�
echo -DuolaDStudio Hong Kong Ltd.
echo   ��������D��DuolaD[RE�m��/��汾�����_�l/������/�A�O]
echo   ����������LynetteNotFound[HoYoShadeС�汾�����_�l/�S�o]
echo -Ex_M[���g֧��/ָ��/GUI�u��]
echo -ZelbertYQ[�ęnվ���g֧��]
echo\
echo �Q�x��
echo -CYTeam[HoYoShade�������/΢ܛ��I����Ӌ���ṩ/�ӑB�D�o�B朽ӽ�Q����]
echo -Cloudflare, Inc.[����Ӛ���c����]
echo\
echo ���x���㣡HoYoShade��������ã�
pause
goto other

:ini_Reset
title HoYoShade������
cls
echo �gӭʹ��HoYoShade��������
echo\
echo ģ�M�汾��V2.X.X Stable - NextVersion
echo �_�l�ߣ�DuolaDStudio X ZelbertYQ X Ex_M
echo ��[�ø�֮��]ע��Ⱥ���
echo\
echo ע�⣡һ��ֻ�����ɷN��r�������Ҫ����ReShade.ini�����ļ���
echo �����Ƅ���ģ�MĿ䛣������㌦Ŀ��е��ļ��A�M����������������
echo ���}��Releases���������_�����t���h/�������ReShade.ini�����ļ����Դ��_���¹���/�ޏ�Bug��
echo\
echo ����֮�⣬һ����r���㶼����Ҫ�M������ReShade.ini������
echo\
echo �����ꮅ�ᣬ����Ҫ���h���ѽ��}�u���[���M�̸�Ŀ��µ�ReShade.ini�����ļ�����tHoYoShade���o�������A������������
echo �Ƿ��^�m���ò�����
echo\
echo [1]��
echo [2]��(���؆��������ˆ�)
echo\
set /p "content=�ڴ�ݔ���x�ǰ��Ĕ��֣�"

if "%content%" == "1" (
    start "" /wait ".\LauncherResource\INIBuild.exe"
    :File_Reset
    cls
    echo �gӭʹ��HoYoShade��������
    echo\
    echo ģ�M�汾��V2.X.X Stable - NextVersion
    echo �_�l�ߣ�DuolaDStudio X ZelbertYQ X Ex_M
    echo ��[�ø�֮��]ע��Ⱥ���
    echo\
    echo ���óɹ����������ReShade.ini�F����Qģ�M��Ŀ��е��f��ReShade.ini��
    echo ����Ҫ���h���ѽ��}�u���[���M�̸�Ŀ��µ�ReShade.ini�����ļ�����tHoYoShade���o�������A������������
    echo\
    echo ����ҵ��[���M�̸�Ŀ䛣�  
    echo ���HoYoPlay���׹��[��������:�c���_ʼ���Ӱ��o��߅�ĸ����D��-�[���O�ü��ɲ鿴�[���M�̸�Ŀ䛡�  
    echo �c��'���_����Ŀ�'����ʹ���YԴ���������_�[���M�̸�Ŀ䛡�  
    echo\
    echo ���StarWard:�c���_ʼ���Ӱ��o��߅���X݆�D�˼��ɲ鿴�[���M�̸�Ŀ䛡�  
    echo �c���[���M�̸�Ŀ䛼���ʹ���YԴ���������_�[���M�̸�Ŀ䛡�  
    echo\
    echo ��Ȼ������β������������ģ�M��Ŀ�/Tutorial�ļ��A�в鿴�Ñ�f�h�͈D�İ��b�f����
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
echo ģ�M�汾��V2.X.X Stable - NextVersion
echo �_�l�ߣ�DuolaDStudio X ZelbertYQ X Ex_M
echo ��[�ø�֮��]ע��Ⱥ���
echo\
echo ��ǰע���б��yԇ���͑���ע���б�
echo\
echo ��ģ�M�H����[�����{ɫʹ�ã�Ո���ر�Mod���Ñ�f�h���[�����_�l/�l�������P�l����
echo �������ģ�M��Ŀ�/Tutorial�ļ��A�в鿴�Ñ�f�h�͈D�İ��b�f����
echo\
echo ���¿͑���ע���x헾�ֻ�����ע�����yԇ���͑��ˡ�
echo\
echo �������ʹ�õĜyԇ���͑��˲��ڴ��б�����ע����δ���[�򆙄�����푑����t�f��:
echo 1:����ʹ�õĜyԇ���͑���ע���x��c���_�͑���ע���x�ͨ�ã�Ո�ȇ�ԇʹ�ù��_�͑���ע���б�Lԇע�롣
echo 2:HoYoShade��δ�m����Ŀǰ����ʹ�õĜyԇ���͑��ˡ�
echo �����m�䣬Ո���҂����L���҂���GitHub�}�죨https://github.com/DuolaD/HoYoShade���ύissues��
echo\
echo [1]����ģ�M��Ŀ��е�ReShade.ini
echo [2]ע����ԭ��ͨ�� ���H�� DevKit/���yǰ�Ȝy��Beta���͑��ˣ�
echo [3]ע�����^�^�㣨ͨ�� ���yǰ�Ȝy��Beta���͑��ˣ�
echo [4]ע�����^�^�㣨ͨ�� ���y��Ȝy��Beta��/�������w���͑��ˣ�
echo [5]ע�������ģ��򾉾��`��ͨ�� �Ї����/���H�� CB1 �͑��ˣ�
echo [6]�ГQ�����_�͑���ע���б�
echo [7]�����x�
echo [8]�˳�����

echo\
set /p "content=�ڴ�ݔ���x�ǰ��Ĕ��֣�"

echo\

if "%content%" == "1" (
    goto ini_Reset
) else if "%content%" == "2" (
    cls
    echo ���x���ע��Ŀ�ˠ�:ԭ��ͨ�� ���H�� DevKit/���yǰ�Ȝy��Beta���͑��ˣ�
    echo ע�����F�ц��ӣ���F�ڿ���ʹ�Æ����������[���ˡ�ע������һ��ע�롣
    echo ������x�����e�`��ע��Ŀ�ˣ�ֻ���P�]�˴����������\�І����������x�񼴿ɡ�
    echo\
    echo ע�⣺��ע���x헲��m����κ� ԭ�񣨹��_/���y��Ȝy��Beta�����͑��ˣ�
    echo ����ע������͑��ˣ�Ո�P�]���ځK������HoYoShade���������K�ڹ��_�͑���ע���б��x�񌦑��Ŀ͑��ˡ�
    echo\
    echo ��Ҫ������Ҫʹ�ùٷ������ṩ���[�򆙄����톙���[��
    echo ����ֱ���p���\���M��/�M�̿�ݷ�ʽ�Ԇ����[�򡣷�t���ܕ�����ע��ʧ����
    echo ����ٷ�δ�����ṩ������/��]�І��������������Ҫ���_�l�߫@ȡ�a������ע�롣
    echo ���a�����]Դ�a���ҁK�������HoYoShade�У���o��ͨ�^����HoYoShadeԴ���a�팍�Fע�빦�ܡ�
    echo ���P������Ϣ��Ո�M�_�l�� ����D��DuolaD ��https://github.com/DuolaD�� �ԫ@ȡ������Ϣ��
    echo\
    start "" /wait /b inject.exe Genshin.exe
    exit
) else if "%content%" == "3" (
    cls
    echo ���x���ע��Ŀ�ˠ�:�^�^�㣨ͨ�� ���yǰ�Ȝy��Beta���͑��ˣ�
    echo ע�����F�ц��ӣ���F�ڿ���ʹ�Æ����������[���ˡ�ע������һ��ע�롣
    echo ������x�����e�`��ע��Ŀ�ˣ�ֻ���P�]�˴����������\�І����������x�񼴿ɡ�
    echo\
    echo ע�⣺��ע���x헲��m����κ� �^�^�㣨ͨ�� ���_/���y��Ȝy/�������w�����͑��ˣ�
    echo ����ע������͑��ˣ�Ո�P�]���ځK������HoYoShade���������K�x�񌦑��Ŀ͑���ע���x헡�
    echo\
    echo ��Ҫ������Ҫʹ�ùٷ������ṩ���[�򆙄����톙���[��
    echo ����ֱ���p���\���M��/�M�̿�ݷ�ʽ�Ԇ����[�򡣷�t���ܕ�����ע��ʧ����
    echo ����ٷ�δ�����ṩ������/��]�І��������������Ҫ���_�l�߫@ȡ�a������ע�롣
    echo ���a�����]Դ�a���ҁK�������HoYoShade�У���o��ͨ�^����HoYoShadeԴ���a�팍�Fע�빦�ܡ�
    echo ���P������Ϣ��Ո�M�_�l�� ����D��DuolaD ��https://github.com/DuolaD�� �ԫ@ȡ������Ϣ��
    echo\
    start "" /wait /b inject.exe ZZZ.exe
    exit
) else if "%content%" == "4" (
    cls
    echo ���x���ע��Ŀ�ˠ�:�^�^�㣨ͨ�� ���y��Ȝy/�������w���͑��ˣ�
    echo ע�����F�ц��ӣ���F�ڿ���ʹ�Æ����������[���ˡ�ע������һ��ע�롣
    echo ������x�����e�`��ע��Ŀ�ˣ�ֻ���P�]�˴����������\�І����������x�񼴿ɡ�
    echo\
    echo ע�⣺��ע���x헲��m����κ� �^�^�㣨ͨ�� ���_/���yǰ�Ȝy���͑��ˣ�
    echo ����ע������͑��ˣ�Ո�P�]���ځK������HoYoShade���������K�x�񌦑��Ŀ͑���ע���x헡�
    echo\
    echo ��Ҫ������Ҫʹ�ùٷ������ṩ���[�򆙄����톙���[��
    echo ����ֱ���p���\���M��/�M�̿�ݷ�ʽ�Ԇ����[�򡣷�t���ܕ�����ע��ʧ����
    echo ����ٷ�δ�����ṩ������/��]�І��������������Ҫ���_�l�߫@ȡ�a������ע�롣
    echo ���a�����]Դ�a���ҁK�������HoYoShade�У���o��ͨ�^����HoYoShadeԴ���a�팍�Fע�빦�ܡ�
    echo ���P������Ϣ��Ո�M�_�l�� ����D��DuolaD ��https://github.com/DuolaD�� �ԫ@ȡ������Ϣ��
    echo\
    start "" /wait /b inject.exe ZenlessZoneZeroBeta.exe
    exit
) else if "%content%" == "5" (
    cls
    echo ���x���ע��Ŀ�ˠ�:���ģ��򾉾��`��ͨ�� �Ї����/���H�� CB1 �͑��ˣ�
    echo ע�����F�ц��ӣ���F�ڿ���ʹ�Æ����������[���ˡ�ע������һ��ע�롣
    echo ������x�����e�`��ע��Ŀ�ˣ�ֻ���P�]�˴����������\�І����������x�񼴿ɡ�
    echo\
    echo ��Ҫ������Ҫʹ�ùٷ������ṩ���[�򆙄����톙���[��
    echo ����ֱ���p���\���M��/�M�̿�ݷ�ʽ�Ԇ����[�򡣷�t���ܕ�����ע��ʧ����
    echo ����ٷ�δ�����ṩ������/��]�І��������������Ҫ���_�l�߫@ȡ�a������ע�롣
    echo ���a�����]Դ�a���ҁK�������HoYoShade�У���o��ͨ�^����HoYoShadeԴ���a�팍�Fע�빦�ܡ�
    echo ���P������Ϣ��Ո�M�_�l�� ����D��DuolaD ��https://github.com/DuolaD�� �ԫ@ȡ������Ϣ��
    echo\
    start "" /wait /b inject.exe NexusAnima.exe
    exit
) else if "%content%" == "6" (
    goto menu
) else if "%content%" == "7" (
    goto other
) else if "%content%" == "8" (
    exit
) else (
    echo\
    echo ݔ���e�`��
    timeout /t 2
    goto menu
    )
exit

:blender_hook_check

setlocal enabledelayedexpansion

set ys_client_exist=0
set zzz_loader_exist=0

if exist "%~dp0ys_client.exe.lnk" (
    set ys_client_exist=1
)

if exist "%~dp0zzz_loader.exe.lnk" (
    set zzz_loader_exist=1
)

if "!ys_client_exist!"=="0" (
    if "!zzz_loader_exist!"=="0" (
        set blender_recheck=0
        echo �ԙzδͨ�^��ģ�M��Ŀ��K�]���ҵ����� ys_client.exe.lnk ��/�� zzz_loader.exe.lnk �Ŀ�ݷ�ʽ��
        echo Ո��ģ�M��Ŀ�����ָ�� loader.exe �Ŀ�ݷ�ʽ�������� ys_client.exe.lnk ��/�� zzz_loader.exe.lnk��Ȼ����ԇһ�Ρ�
        pause
        goto menu
    )
)

if "!blender_recheck!"=="1" (
    goto blender_hook_menu
)

set missing_curl=0

set "current_dir=%~dp0"
set "shortcut=%current_dir%ys_client.exe.lnk"
set "target="
for /f "delims=" %%i in ('powershell -noprofile -command "(New-Object -ComObject WScript.Shell).CreateShortcut(\"%shortcut%\").TargetPath"') do (
    set "target=%%i"
)

for %%i in ("!target!") do set "target_dir=%%~dpi"

curl --version >nul 2>&1
if errorlevel 1 (
    set missing_curl=1
    goto blender_hook_menu
)

set "country_code="

for /f "usebackq delims=" %%A in (`curl -s https://www.canva.cn/cdn-cgi/trace`) do (
    set "line=%%A"
    echo !line! | findstr /b "loc=" >nul
    if !errorlevel! == 0 (
        set "country_code=!line:~4!"
    )
)

if /i "%country_code%"=="CN" goto :blender_hook_menu
if /i "%country_code%"=="HK" goto :blender_hook_menu
if /i "%country_code%"=="MO" goto :blender_hook_menu
if /i "%country_code%"=="TW" goto :blender_hook_menu
if /i "%country_code%"=="SG" goto :blender_hook_menu

:blender_hook_not_in_cn
cls
title HoYoShade������
cls
echo �gӭʹ��HoYoShade��������
echo\
echo ģ�M�汾��V2.X.X Stable - NextVersion
echo �_�l�ߣ�DuolaDStudio X ZelbertYQ X Ex_M
echo ��[�ø�֮��]ע��Ⱥ���
echo\
echo �҂��z�y����ǰ����ܲ����й���½/�۰�̨/�¼��µ؅^��
echo ��ǰ�҂��z�y��������ڇ���/�؅^����%country_code% ��
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

:blender_hook_menu
cls
title HoYoShade������
set blender_recheck=0
cls
echo �gӭʹ��HoYoShade��������
echo\
echo ģ�M�汾��V2.X.X Stable - NextVersion
echo �_�l�ߣ�DuolaDStudio X ZelbertYQ X Ex_M
echo ��[�ø�֮��]ע��Ⱥ���
echo\
if "%missing_curl%" == "1" (
    echo �҂��z�y����ǰ����ϵ�y�ЁK������curl�M�����@�����µ؅^�z�y���ܟo��������
    echo\
    echo ����Ȼ�����^�mʹ�ô�Mod����ע�빦�ܡ�
    echo �������K��̎��й���½/�۰�̨/�¼��µ؅^�����ܕ����±�Mod����ע�빦�ܺ�Blender/��Ӱ�C����o���������ڵć��Ҽ��؅^�@���������g֧��,���茦���ṩ�κμ��g֧�֡�
    echo\
)
echo ��ǰ Blender/��Ӱ�C��� ע���������Ϣ���£�
if "!ys_client_exist!"=="1" (
    echo [ԭ��� Blender/��Ӱ�C���]���Ѽ��d
) else (
    echo [ԭ��� Blender/��Ӱ�C���]��δ�ҵ�
)
if "!zzz_loader_exist!"=="1" (
    echo [�^�^��� Blender/��Ӱ�C���]���Ѽ��d
) else (
    echo [�^�^��� Blender/��Ӱ�C���]��δ�ҵ�
)
echo\
echo ��ǰ�҂��z�y��������ڇ���/�؅^����%country_code% ��
echo\
echo ע�⣺�����ʹ����ע�빦�ܣ���Ҫ�x������Blender/��Ӱ�C����н����Č����������Ŀ͑��ˣ���tReShade�o������ע�롣
echo ����@�����һ�Ά���Blender/��Ӱ�C�����Ո�_���ڴ�̎�x���Ŀ�˿͑��˺��������Blender/��Ӱ�C����н�����Ŀ�˿͑���һ�£���tReShade�o������ע�롣
echo\
echo ע�⣺�x�[9]�H���M��/���߰�o�˙C���á�
echo\
echo [1]����ģ�M��Ŀ��е�ReShade.ini
echo [2]�� ԭ��� Blender/��Ӱ�C��� ע���� ԭ��ͨ�� �Ї����/�������� ���_�͑��ˣ�
echo [3]�� ԭ��� Blender/��Ӱ�C��� ע���� ԭ��ͨ�� ���H��/Epic ���_ �͑��ˣ�
echo [4]�� �^�^��� Blender/��Ӱ�C��� ע���� �^�^�㣨ͨ�� ���_�͑��ˣ�
echo [5]�H���� ԭ��� Blender/��Ӱ�C���
echo [6]�H���� �^�^��� Blender/��Ӱ�C���
echo [7]ͬ����ǰϵ�y�r�g���ޏ�ϵ�y�r�g��ͬ������ʾ
echo [8]�h��config�ļ�������ָ�������͑��ˣ����r�H֧�֌� ԭ��� Blender/��Ӱ�C��� �M�в�����
echo [9]�h��cookies.json�ļ����ޏ�ע��r���~̖δ��䛡��Ĉ��e��ʾ�����r�H֧�֌� ԭ��� Blender/��Ӱ�C��� �M�в�����
echo [10]ˢ�� Blender/��Ӱ�C��� ע�����z�y��Ϣ
echo [11]����������
echo [12]�˳�����
echo\
set /p "choice=�ڴ�ݔ���x�ǰ��Ĕ��֣�"
echo\
if "%choice%"=="1" (
    goto ini_Reset
) else if "%choice%"=="2" (
    echo ���x���ע��Ŀ�ˠ�:ԭ��ͨ�� �Ї����/�������� ���_�͑��ˣ�
    echo\
    echo ReShade��Blender/��Ӱ�C���ע�����F�ц��ӡ�Ո��Ҫ�P�]�����ڡ�
    echo Blender/��Ӱ�C���ע���������[���ᣬReShade�����Ԅ�ע��K�P�]ԓ���ڡ�
    echo ���ReShade.ini�}�u�������_���[���M�̸�Ŀ䛣����NReShade�������_�O�ÁK���ӡ�
    echo\
    echo ������x�����e�`��ע��Ŀ�ˣ�ֻ���P�]�˴��ں�Blender/��Ӱ�C���ע���������������\�І����������x�񼴿ɡ�
    echo\
    start "" "%~dp0ys_client.exe.lnk"
    start "" /wait /b inject.exe YuanShen.exe
    exit
) else if "%choice%"=="3" (
    echo ���x���ע��Ŀ�ˠ�:ԭ��ͨ�� ���H��/Epic ���_ �͑��ˣ�
    echo\
    echo ReShade��Blender/��Ӱ�C���ע�����F�ц��ӡ�Ո��Ҫ�P�]�����ڡ�
    echo Blender/��Ӱ�C���ע���������[���ᣬReShade�����Ԅ�ע��K�P�]ԓ���ڡ�
    echo ���ReShade.ini�}�u�������_���[���M�̸�Ŀ䛣����NReShade�������_�O�ÁK���ӡ�
    echo\
    echo ������x�����e�`��ע��Ŀ�ˣ�ֻ���P�]�˴��ں�Blender/��Ӱ�C���ע���������������\�І����������x�񼴿ɡ�
    echo\
    start "" "%~dp0ys_client.exe.lnk"
    start "" /wait /b inject.exe GenshinImpact.exe
    exit
) else if "%choice%"=="4" (
    if "!zzz_loader_exist!"=="0" (
        echo �ԙzδͨ�^��ģ�M��Ŀ��K�]���ҵ����� zzz_loader.lnk �Ŀ�ݷ�ʽ��
        echo Ո��ģ�M��Ŀ�����ָ�� loader.exe �Ŀ�ݷ�ʽ�������� zzz_loader.lnk ��Ȼ���˳��K�����M��˽��棬��ԇһ�Ρ�
        pause
        goto blender_hook_menu
    )
    echo ���x���ע��Ŀ�ˠ�:�^�^�㣨ͨ�� ���_�͑��ˣ�
    echo\
    echo ReShade��Blender/��Ӱ�C���ע�����F�ц��ӡ�Ո��Ҫ�P�]�����ڡ�
    echo Blender/��Ӱ�C���ע���������[���ᣬReShade�����Ԅ�ע��K�P�]ԓ���ڡ�
    echo ���ReShade.ini�}�u�������_���[���M�̸�Ŀ䛣����NReShade�������_�O�ÁK���ӡ�
    echo\
    echo ������x�����e�`��ע��Ŀ�ˣ�ֻ���P�]�˴��ں�Blender/��Ӱ�C���ע���������������\�І����������x�񼴿ɡ�
    echo\
    start "" "%~dp0zzz_loader.exe.lnk"
    start "" /wait /b inject.exe ZenlessZoneZero.exe
    exit
) else if "%choice%"=="5" (
    start "" "%~dp0ys_client.exe.lnk"
    goto blender_hook_menu
) else if "%choice%"=="6" (
    start "" "%~dp0zzz_loader.exe.lnk"
    goto blender_hook_menu
) else if "%choice%"=="7" (
    cls
    echo ͬ��ϵ�y�r�g�ĺĕrȡ�Q��㮔ǰ�ľW�j��r��
    echo �����ǰ�W�j�^��ĕr���ܕ����A���^�L��Ո���ĵȴ���
    echo\
    echo ���ڙz��K���� Windows Time ����...
    net start w32time >nul 2>&1
    echo\
    if /i "%country_code%"=="CN" (
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
    if !errorlevel! == 0 (
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
) else if "%choice%"=="8" (
    set "fileToDelete=config"
    set "target_dir=!target_dir!\"
    set "target_dir=!target_dir:~0,-1!"
    set "filePath=!target_dir!\config"
    if not exist "!filePath!" (
      echo �ԙzʧ����config�ļ�������춟o�˙Cģ�MĿ��¡�
      echo �@���������㕺δʹ�ßo�˙C�����[��͑��ˣ�������ָ����һ���e�`��loader.exe�ļ���
      echo\
      echo ���������I�᷵�����ˆΡ�
      pause
      goto blender_hook_menu
    ) else (
      :blender_delete_config
      cls
      echo ��_����Ҫ�^�m�h��config�ļ��᣿
      echo �h��������Ҫ������һ�ο͑����Դ�׌�o�˙C���«@ȡ�[���M�̸�Ŀ䛡�
      echo\
      echo [1]��
      echo [2]�񣨷������ˆΣ�
      echo\
      set /p "content=�ڴ�ݔ���x�ǰ��Ĕ��֣�"
      if "!content!" == "1" (
          echo\
          echo\
          del "!filePath!"
          if exist "!filePath!" (
              echo �h��ʧ�����������ļ������û�·���e�`��
          ) else (
              echo �ѳɹ��h��config�ļ���
          )
          echo\
          echo ���������I�᷵�����ˆΡ�
          pause
          goto blender_hook_menu
      ) else if "!content!" == "2" (
          goto blender_hook_menu
      ) else (
          echo\
          echo ݔ���e�`��
          timeout /t 2
          goto blender_delete_config
      )
    )
) else if "%choice%"=="9" ( 
    set "fileToDelete=cookies.json"
    set "target_dir=!target_dir!\"
    set "target_dir=!target_dir:~0,-1!"
    set "filePath=!target_dir!\cookies.json"
    if not exist "!filePath!" (
      echo �ԙzʧ����cookies.json�ļ�������춟o�˙Cģ�MĿ��¡�
      echo �@����������ʹ�õ������M��o�˙C��������ָ����һ���e�`��loader.exe�ļ���
      echo\
      echo ���������I�᷵�����ˆΡ�
      pause
      goto blender_hook_menu
    ) else (
      :blender_delete_cookiesjson
      cls
      echo ��_����Ҫ�^�m�h��cookies.json�ļ��᣿
      echo �h��������Ҫ���ߴa�Ե�䛆��������~̖��
      echo\
      echo [1]��
      echo [2]�񣨷������ˆΣ�
      echo\
      set /p "content=�ڴ�ݔ���x�ǰ��Ĕ��֣�"
      if "!content!" == "1" (
          echo\
          echo\
          del "!filePath!"
          if exist "!filePath!" (
              echo �h��ʧ�����������ļ������û�·���e�`��
          ) else (
              echo �ѳɹ��h��cookies.json�ļ���
          )
          echo\
          echo ���������I�᷵�����ˆΡ�
          pause
          goto blender_hook_menu
      ) else if "!content!" == "2" (
          goto blender_hook_menu
      ) else (
          echo\
          echo ݔ���e�`��
          timeout /t 2
          goto blender_delete_cookiesjson
      )
    )

) else if "%choice%"=="10" (
    set blender_recheck=1
    goto blender_hook_check
) else if "%choice%"=="11" (
    goto menu
) else if "%choice%"=="12" (
    exit
) else (
    echo ݔ���e�`��
    timeout /t 2
    goto blender_hook_menu
)

