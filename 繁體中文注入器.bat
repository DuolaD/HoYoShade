@echo off

:menu
title Reshade_For_HoYoVerse_Games Starter(Powered By DuolaD)
cls
echo �gӭʹ��Reshade_For_HoYoVerse_Gamesע������
echo Gitee�R��}������Reshade_For_MiHoYo_Games
echo\
echo ģ�M�汾��V1.3.0 Stable
echo\
echo �����l�F��������[��K�]�г��F���]���б��e�����N�f�������r߀��֧��ʹ�á�
echo ���˽����ң�Ո�����Д�����ʹ�õ�����һ��ƽ̨�Ŀ͑��ˣ��x�񌦑��͑��ˆ���ע��������
echo ������ڹٷ������������@��ģ�M�K���׹��[��̖�����˲����Г��κ�؟�Σ�Ո��˼��
echo\
echo [1]ԭ���Ї���ꑷ��͑��ˣ�
echo [2]ԭ�񣨆����������͑��ˣ�
echo [3]ԭ�񣨇��H���͑���/Epic�͑��ˣ�
echo [4]���ģ�����F��(�����͑���/���H���͑���/Epic�͑���)
echo [5]�����O���x�
echo [6]�˳�����

echo\
set /p "content=�ڴ�ݔ���x�ǰ��Ĕ��֣�"

powershell -command Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted
if "%content%" == "1" (
    goto YuanShen_inject
) else if "%content%" == "2" (
    goto BiliBili_Warning
) else if "%content%" == "3" (
    powershell -command Start-Process -FilePath inject.exe GenshinImpact.exe -Verb RunAs
    powershell -command Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Restricted
    exit
) else if "%content%" == "4" (
    powershell -command Start-Process -FilePath inject.exe StarRail.exe -Verb RunAs
    powershell -command Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Restricted
    exit
) else if "%content%" == "5" (
    goto other
) else if "%content%" == "6" (
    exit
) else (
    echo\
    echo ݔ���e�`��
    timeout /t 2
    goto menu
    )
exit

:other
title Reshade_For_HoYoVerse_Games Starter(Powered By DuolaD)
cls
echo �gӭʹ��Reshade_For_HoYoVerse_Gamesע������
echo Gitee�R��}������Reshade_For_MiHoYo_Games
echo\
echo ģ�M�汾��V1.3.0 Stable
echo\
echo �������Ҫ�z��汾���£�����ȥ�L���҂��Ă}��鿴�Ƿ��аl�и��°汾
echo �_�l���x헃H����{ԇ/�z�y�e�`��Ҫ�������_�l�����_Ҫ�����@��������tՈ���p��ʹ��
echo\
echo [1]�L���҂���GitHub���}��
echo [2]�L���҂���Gitee�ϵ��Ї�����R��}��
echo [3]�_�l���x�
echo [4]����������
echo [5]�˳�����

echo\
set /p "content=�ڴ�ݔ���x�ǰ��Ĕ��֣�"

if "%content%" == "1" (
    start "" "https://github.com/DuolaD/Reshade_For_HoyoVerse_Games/"
    goto other
) else if "%content%" == "2" (
    start "" "https://gitee.com/DuolaD/Reshade_For_MiHoYo_Games"
    goto other
) else if "%content%" == "3" (
    goto develop
) else if "%content%" == "4" (
    goto menu
) else if "%content%" == "5" (
    exit
) else (
    echo\
    echo ݔ���e�`��
    timeout /t 2
    goto other
)
goto other

:develop
title Reshade_For_HoYoVerse_Games Starter(�����M���_�l���x헣� �� ��)
cls
echo �gӭʹ��Reshade_For_HoYoVerse_Gamesע������
echo Gitee�R��}������Reshade_For_MiHoYo_Games
echo\
echo ģ�M�汾��V1.3.0 Stable
echo\
echo ע�⣡�_�l���x헃H����{ԇ/�z�y�e�`��Ҫ�������_�l�����_Ҫ�����@��������tՈ���p��ʹ�ã�
echo\
echo [1]�鿴��ǰPowerShell�M���Ԡ�B
echo [2]���iPowerShell�M����
echo [3]���iPowerShell�M����
echo [4]����������
echo [5]���������O���x�
echo [6]�˳�����

echo\
set /p "content=�ڴ�ݔ���x�ǰ��Ĕ��֣�"

if "%content%" == "1" (
    powershell -Command "Get-ExecutionPolicy"
    pause
    goto develop
) else if "%content%" == "2" (
    powershell -command Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted
    powershell -Command "Get-ExecutionPolicy"
    echo �ɹ���
    pause
    goto develop
) else if "%content%" == "3" (
    powershell -command Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Restricted
    powershell -Command "Get-ExecutionPolicy"
    echo �ɹ���
    pause
    goto develop
) else if "%content%" == "4" (
    goto menu
) else if "%content%" == "5" (
    goto other
) else if "%content%" == "6" (
    exit
) else (
    echo\
    echo ݔ���e�`��
    timeout /t 2
    goto develop
)
goto develop

:BiliBili_Warning
title Reshade_For_HoYoVerse_Games Starter(���������͑��ˆ���ǰ���棡)
cls
echo �gӭʹ��Reshade_For_HoYoVerse_Gamesע������
echo Gitee�R��}������Reshade_For_MiHoYo_Games
echo\
echo ģ�M�汾��V1.3.0 Stable
echo\
echo ע�⣡����
echo ��춆��������͑���ʹ�õ�������ܛ������[���~̖
echo ���K����ƹٷ�/���H��/Epic�͑��˵��[��ȵ���[���~̖
echo ��ˣ�Ո�ȴ_���[���ѳɹ�����[���~̖���ٰ�'Home'�I���_Reshade����̨�M�����m����
echo\
echo ��������[��]�гɹ�����[���~��ǰ���_Reshade����̨���[���ڏ�����䛴����������
echo ����㲻С�ě]���]�⵽�@�c�K�l�����@�N��r��ֻ����_�΄չ������P�]�[����c�[�����P���M��
echo Ȼ�������ӱ�ģ�Mע�������ȴ�ע���[����棬�K����ʹ�ùٷ����������_�[�򼴿ɡ�
timeout /t 5
pause
goto YuanShen_inject

:YuanShen_inject
powershell -command Start-Process -FilePath inject.exe YuanShen.exe -Verb RunAs
powershell -command Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Restricted
exit