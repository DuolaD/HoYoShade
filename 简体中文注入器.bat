@echo off

:menu
title Reshade_For_HoYoVerse_Games Starter(Powered By DuolaD)
cls
echo ��ӭʹ��Reshade_For_HoYoVerse_Gamesע������
echo Gitee����ֿ�����Reshade_For_MiHoYo_Games
echo\
echo ģ��汾��V1.3.0 Stable
echo\
echo ����㷢�����������Ϸ��û�г�����ע���б����ô˵������ʱ����֧��ʹ�á�
echo ����˽����ң��������ж�����ʹ�õ�����һ��ƽ̨�Ŀͻ��ˣ�ѡ���Ӧ�ͻ�������ע��������
echo ������ڹٷ��������������ģ�鲢���׹��η�ţ����˲���е��κ����Σ�����˼��
echo\
echo [1]ԭ���й���½���ͻ��ˣ�
echo [2]ԭ�������������ͻ��ˣ�
echo [3]ԭ�񣨹��ʷ��ͻ���/Epic�ͻ��ˣ�
echo [4]�������������(�����ͻ���/���ʷ��ͻ���/Epic�ͻ���)
echo [5]��������ѡ��
echo [6]�˳�����

echo\
set /p "content=�ڴ�����ѡ��ǰ������֣�"

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
    echo �������
    timeout /t 2
    goto menu
    )
exit

:other
title Reshade_For_HoYoVerse_Games Starter(Powered By DuolaD)
cls
echo ��ӭʹ��Reshade_For_HoYoVerse_Gamesע������
echo Gitee����ֿ�����Reshade_For_MiHoYo_Games
echo\
echo ģ��汾��V1.3.0 Stable
echo\
echo �������Ҫ���汾���£�����ȥ�������ǵĲֿ�鿴�Ƿ��з��и��°汾
echo ������ѡ������ڵ���/��������Ҫ�����ǿ�������ȷҪ������������������������ʹ��
echo\
echo [1]�������ǵ�GitHub���ֿ�
echo [2]�������ǵ�Gitee���ھ���ֿ�
echo [3]������ѡ��
echo [4]����������
echo [5]�˳�����

echo\
set /p "content=�ڴ�����ѡ��ǰ������֣�"

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
    echo �������
    timeout /t 2
    goto other
)
goto other

:develop
title Reshade_For_HoYoVerse_Games Starter(���ѽ��뿪����ѡ�����)
cls
echo ��ӭʹ��Reshade_For_HoYoVerse_Gamesע������
echo Gitee����ֿ�����Reshade_For_MiHoYo_Games
echo\
echo ģ��汾��V1.3.0 Stable
echo\
echo ע�⣡������ѡ������ڵ���/��������Ҫ�����ǿ�������ȷҪ������������������������ʹ�ã�
echo\
echo [1]�鿴��ǰPowerShell�����״̬
echo [2]����PowerShell�����
echo [3]����PowerShell�����
echo [4]����������
echo [5]������������ѡ��
echo [6]�˳�����

echo\
set /p "content=�ڴ�����ѡ��ǰ������֣�"

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
    echo �������
    timeout /t 2
    goto develop
)
goto develop@echo off


:BiliBili_Warning
title Reshade_For_HoYoVerse_Games Starter(���������ͻ�������ǰ���棡)
cls
echo ��ӭʹ��Reshade_For_HoYoVerse_Gamesע������
echo Gitee����ֿ�����Reshade_For_MiHoYo_Games
echo\
echo ģ��汾��V1.3.0 Stable
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
powershell -command Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Restricted
exit