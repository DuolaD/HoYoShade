@echo off

:menu
title Reshade_For_HoYoVerse_Games Starter(Powered By DuolaD)
cls
echo 歡迎使用Reshade_For_HoYoVerse_Games注入器！
echo Gitee鏡像倉庫名：Reshade_For_MiHoYo_Games
echo\
echo 模組版本：V1.3.0 Stable
echo\
echo 如果你發現你想玩的遊戲並沒有出現在註入列表裡，那麼說明它暫時還不支持使用。
echo 對於私服玩家，請自行判斷你所使用的是哪一個平台的客戶端，選擇對應客戶端啟動注入器即可
echo 如果你在官方服務器啟動這個模組並被米哈遊封號，本人不會承擔任何責任，請三思！
echo\
echo [1]原神（中國大陸服客戶端）
echo [2]原神（嗶哩嗶哩服客戶端）
echo [3]原神（國際服客戶端/Epic客戶端）
echo [4]崩壞：星穹鐵道(國服客戶端/國際服客戶端/Epic客戶端)
echo [5]其它設置選項
echo [6]退出程序

echo\
set /p "content=在此輸入選項前面的數字："

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
    echo 輸入錯誤。
    timeout /t 2
    goto menu
    )
exit

:other
title Reshade_For_HoYoVerse_Games Starter(Powered By DuolaD)
cls
echo 歡迎使用Reshade_For_HoYoVerse_Games注入器！
echo Gitee鏡像倉庫名：Reshade_For_MiHoYo_Games
echo\
echo 模組版本：V1.3.0 Stable
echo\
echo 如果你需要檢查版本更新，可以去訪問我們的倉庫查看是否有發行更新版本
echo 開發者選項僅用於調試/檢測錯誤需要，除非開發者明確要求你這樣做，否則請勿輕易使用
echo\
echo [1]訪問我們的GitHub主倉庫
echo [2]訪問我們在Gitee上的中國大陸鏡像倉庫
echo [3]開發者選項
echo [4]返回主界面
echo [5]退出程序

echo\
set /p "content=在此輸入選項前面的數字："

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
    echo 輸入錯誤。
    timeout /t 2
    goto other
)
goto other

:develop
title Reshade_For_HoYoVerse_Games Starter(你已進入開發者選項！ ！ ！)
cls
echo 歡迎使用Reshade_For_HoYoVerse_Games注入器！
echo Gitee鏡像倉庫名：Reshade_For_MiHoYo_Games
echo\
echo 模組版本：V1.3.0 Stable
echo\
echo 注意！開發者選項僅用於調試/檢測錯誤需要，除非開發者明確要求你這樣做，否則請勿輕易使用！
echo\
echo [1]查看當前PowerShell組策略狀態
echo [2]解鎖PowerShell組策略
echo [3]回鎖PowerShell組策略
echo [4]返回主界面
echo [5]返回其它設置選項
echo [6]退出程序

echo\
set /p "content=在此輸入選項前面的數字："

if "%content%" == "1" (
    powershell -Command "Get-ExecutionPolicy"
    pause
    goto develop
) else if "%content%" == "2" (
    powershell -command Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted
    powershell -Command "Get-ExecutionPolicy"
    echo 成功！
    pause
    goto develop
) else if "%content%" == "3" (
    powershell -command Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Restricted
    powershell -Command "Get-ExecutionPolicy"
    echo 成功！
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
    echo 輸入錯誤。
    timeout /t 2
    goto develop
)
goto develop

:BiliBili_Warning
title Reshade_For_HoYoVerse_Games Starter(嗶哩嗶哩客戶端啟動前警告！)
cls
echo 歡迎使用Reshade_For_HoYoVerse_Games注入器！
echo Gitee鏡像倉庫名：Reshade_For_MiHoYo_Games
echo\
echo 模組版本：V1.3.0 Stable
echo\
echo 注意！！！
echo 由於嗶哩嗶哩客戶端使用的是外置軟件登錄遊戲賬號
echo 而並非類似官服/國際服/Epic客戶端的遊戲內登錄遊戲賬號
echo 因此，請先確保遊戲已成功登錄遊戲賬號後再按'Home'鍵打開Reshade控制台進行後續操作
echo\
echo 如果你在遊戲沒有成功登錄遊戲賬戶前打開Reshade控制台，遊戲在彈出登錄窗口後會卡死
echo 如果你不小心沒有註意到這點並發生了這種情況，只需打開任務管理器關閉遊戲和與遊戲相關的進程
echo 然後重新啟動本模組注入器至等待注入遊戲界面，並重新使用官方啟動器打開遊戲即可。
timeout /t 5
pause
goto YuanShen_inject

:YuanShen_inject
powershell -command Start-Process -FilePath inject.exe YuanShen.exe -Verb RunAs
powershell -command Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Restricted
exit