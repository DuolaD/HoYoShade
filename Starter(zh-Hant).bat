@echo off
setlocal enabledelayedexpansion

chcp 936

title HoYoShade啓動器
cls

fltmc >nul 2>&1
if errorlevel 1 (
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
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
    title HoYoShade啓動器
    cls
    echo 歡迎使用HoYoShade啓動器！
    echo\
    echo 模組版本：V3.0.0-Beta.1
    echo 開發者：DuolaDStudio X ZelbertYQ X Ex_M
    echo 由[幻港之蝶]注入內核驅動
    echo\
    echo 我們檢測到（Open）HoYoShade框架注入所需的必要文件不存在。
    echo\
    echo 出現這個提示的原因可能有：
    echo 1:你在解壓壓縮包時沒有解壓全部文件。
    echo 2:你在進行覆蓋更新操作的時候沒有粘貼全部文件。
    echo 3:你係統上的殺毒軟件/其它程序誤將（Open）HoYoShade識別爲病毒，然後刪除了某些文件。
    echo 4:你無意/有意重命名了部分關鍵文件。
    echo\
    echo 按下任意鍵後啓動器將會退出運行。
    echo 如果你想繼續運行（Open）HoYoShade，請訪問我們的GitHub倉庫（https://github.com/DuolaD/HoYoShade）重新下載最新版Releases界面中提供的壓縮包，並解壓全部文件。
    pause
    exit
)

set "filepath=%~dp0ReShade.ini"
set "missing_reshade_config=0"
if not exist "%filepath%" (
    set "missing_reshade_config=1"
)

start "" /wait /b ".\LauncherResource\INIBuild.exe"

if "%missing_reshade_config%"=="1" (
    cls
    :FileCheck
    cls
    echo 歡迎使用HoYoShade啓動器！
    echo\
    echo 模組版本：V3.0.0-Beta.1
    echo 開發者：DuolaDStudio X ZelbertYQ X Ex_M
    echo 由[幻港之蝶]注入內核驅動
    echo\
    echo 恭喜！你已成功安裝HoYoShade！
    echo 我們檢測到你是第一次使用本模組，Reshade.ini現已生成至模組根目錄中。
    echo\
    echo 如果這是你第一次在 miHoYo（米哈遊）/ HoYoverse 遊戲中使用ReShade，你現在可以繼續了。
    echo 注入器會自動檢測並複製配置文件（ReShade.ini）到遊戲進程根目錄。
    echo\
    echo 但如果你曾經在 miHoYo（米哈遊）/ HoYoverse 遊戲中使用過ReShade
    echo 你可能需要先刪除ReShade.ini（必須）和 ReShade.log（非必須，但建議刪除）。
    echo 例如：
    echo ·你曾經使用過 HoYoShade V2 及以下的版本。
    echo ·你曾經使用過其他人/自行基於官方ReShade/HoYoShade二次開發的ReShade。
    echo\
    echo 如何找到遊戲進程根目錄？  
    echo 對於HoYoPlay（米哈遊啓動器）:點擊開始啓動按鈕旁邊的更多圖標-遊戲設置即可查看遊戲進程根目錄。  
    echo 點擊'打開所在目錄'即可使用資源管理器打開遊戲進程根目錄。  
    echo\
    echo 對於StarWard:點擊開始啓動按鈕旁邊的齒輪圖標即可查看遊戲進程根目錄。  
    echo 點擊遊戲進程根目錄即可使用資源管理器打開遊戲進程根目錄。  
    echo\
    echo 仍然不懂如何操作？你可以在 https://hoyosha.de 中查看用戶協議和圖文安裝說明。
    echo 位於中國大陸？ https://cn.hoyosha.de 可以提供更佳的訪問體驗。
    echo\
    pause
    goto menu
)

:menu
title HoYoShade啓動器
cls
echo 歡迎使用HoYoShade啓動器！
echo\
echo 模組版本：V3.0.0-Beta.1
echo 開發者：DuolaDStudio X ZelbertYQ X Ex_M
echo 由[幻港之蝶]注入內核驅動
echo\
echo\
echo 當前注入列表：公開客戶端注入列表
echo 注意：支持部分Beta/創作者體驗服/Devkit等非公開客戶端
echo\
echo 本模組僅用於遊戲畫面調色使用，請遵守本Mod的用戶協議和遊戲及其開發/發行商相關條例。
echo 你可以在 https://hoyosha.de 中查看用戶協議和圖文安裝說明。
echo 位於中國大陸？ https://cn.hoyosha.de 可以提供更佳的訪問體驗。
REM 我還是更願意當一個在背後默默付出的人 XD
echo\
echo *:該注入選項適用於Beta/創作者體驗服，但你可能需要向開發者獲取補丁方可注入。
echo\
echo [1]重置模組根目錄中的ReShade.ini
echo [2]注入至 原神（中國大陸/嗶哩嗶哩 公開/Devkit/Beta/創作者體驗服客戶端）*
echo [3]注入至 原神（國際服/Epic 公開/Beta/創作者體驗服客戶端）*
echo [4]注入至 崩壞三（通用 公開/Beta客戶端）*
echo [5]注入至 崩壞：星穹鐵道（通用 公開/Beta/創作者體驗服客戶端）*
echo [6]注入至 絕區零（通用 公開客戶端）
echo [7]切換至測試服客戶端注入列表
echo [8]聯動Blender/留影機插件注入至原神/絕區零（公開客戶端）
echo [9]聯動Starward啓動器注入HoYoShade
echo [10]其它選項
echo [11]退出程序

echo\
set /p "content=在此輸入選項前面的數字："

echo\

if "%content%" == "1" (
    goto ini_Reset
) else if "%content%" == "2" (
    cls
    echo 你選擇的注入目標爲:原神（中國大陸/嗶哩嗶哩 公開/Devkit/Beta/創作者體驗服客戶端）
    echo 注入器現已啓動，你現在可以使用啓動器啓動遊戲了。注入器會一併注入。
    echo 如果你選擇了錯誤的注入目標，只需關閉此窗口後重新運行啓動器重新選擇即可。
    echo\
    echo 重要：你必須要使用一個遊戲啓動器來啓動遊戲（無論是官方啓動器還是第三方啓動器），
    echo 不能直接雙擊運行進程/進程快捷方式以啓動遊戲。否則會注入失敗。
    echo\
    echo\
    echo 此注入選項支持注入HoYoShade至原神（中國大陸/嗶哩嗶哩 Devkit/Beta/創作者體驗服客戶端）。
    echo\
    echo 在注入此類客戶端時，你必須要使用官方向你提供的遊戲啓動器來啓動遊戲，
    echo 你不能直接雙擊運行進程/進程快捷方式以啓動遊戲，否則可能會導致注入失敗。
    echo 但如果官方未向你提供啓動器/你沒有啓動器且注入失敗，你可能需要向開發者獲取補丁方可注入。
    echo 此補丁爲閉源補丁且並不內置於HoYoShade中，你無法通過更改HoYoShade源代碼來實現注入功能。
    echo 有關更多信息，請聯繫開發者 哆啦D夢DuolaD （https://github.com/DuolaD） 以獲取更多信息。
    echo\
    start "" /wait /b inject.exe YuanShen.exe
    exit
) else if "%content%" == "3" (
    cls
    echo 你選擇的注入目標爲:原神（國際服/Epic 公開/Beta/創作者體驗服客戶端）
    echo 注入器現已啓動，你現在可以使用啓動器啓動遊戲了。注入器會一併注入。
    echo 如果你選擇了錯誤的注入目標，只需關閉此窗口後重新運行啓動器重新選擇即可。
    echo\
    echo 重要：你必須要使用一個遊戲啓動器來啓動遊戲（無論是官方啓動器還是第三方啓動器），
    echo 不能直接雙擊運行進程/進程快捷方式以啓動遊戲。否則會注入失敗。
    echo\
    echo\
    echo 此注入選項支持注入HoYoShade至原神（國際服 Beta/創作者體驗服客戶端）。
    echo\
    echo 在注入此類客戶端時，你必須要使用官方向你提供的遊戲啓動器來啓動遊戲，
    echo 你不能直接雙擊運行進程/進程快捷方式以啓動遊戲，否則可能會導致注入失敗。
    echo 但如果官方未向你提供啓動器/你沒有啓動器且注入失敗，你可能需要向開發者獲取補丁方可注入。
    echo 此補丁爲閉源補丁且並不內置於HoYoShade中，你無法通過更改HoYoShade源代碼來實現注入功能。
    echo 有關更多信息，請聯繫開發者 哆啦D夢DuolaD （https://github.com/DuolaD） 以獲取更多信息。
    echo\
    start "" /wait /b inject.exe GenshinImpact.exe
    exit
) else if "%content%" == "4" (
    cls
    echo 你選擇的注入目標爲:崩壞三（通用 公開/Beta客戶端）
    echo 注入器現已啓動，你現在可以使用啓動器啓動遊戲了。注入器會一併注入。
    echo 如果你選擇了錯誤的注入目標，只需關閉此窗口後重新運行啓動器重新選擇即可。
    echo\
    echo 重要：你必須要使用一個遊戲啓動器來啓動遊戲（無論是官方啓動器還是第三方啓動器），
    echo 不能直接雙擊運行進程/進程快捷方式以啓動遊戲。否則會注入失敗。
    echo\
    echo\
    echo 此注入選項支持注入HoYoShade至崩壞三（通用 Beta客戶端）。
    echo\
    echo 在注入此類客戶端時，你必須要使用官方向你提供的遊戲啓動器來啓動遊戲，
    echo 你不能直接雙擊運行進程/進程快捷方式以啓動遊戲，否則可能會導致注入失敗。
    echo 此補丁爲閉源補丁且並不內置於HoYoShade中，你無法通過更改HoYoShade源代碼來實現注入功能。
    echo 有關更多信息，請聯繫開發者 哆啦D夢DuolaD （https://github.com/DuolaD） 以獲取更多信息。
    echo\
    echo\
    start "" /wait /b inject.exe BH3.exe
    exit
) else if "%content%" == "5" (
    cls
    echo 你選擇的注入目標爲:崩壞：星穹鐵道（通用 公開/Beta/創作者體驗服客戶端）
    echo 注入器現已啓動，你現在可以使用啓動器啓動遊戲了。注入器會一併注入。
    echo 如果你選擇了錯誤的注入目標，只需關閉此窗口後重新運行啓動器重新選擇即可。
    echo\
    echo 重要：你必須要使用一個遊戲啓動器來啓動遊戲（無論是官方啓動器還是第三方啓動器），
    echo 不能直接雙擊運行進程/進程快捷方式以啓動遊戲。否則會注入失敗。
    echo\
    echo\
    echo 此注入選項支持注入HoYoShade至崩壞：星穹鐵道（通用 Beta/創作者體驗服客戶端）。
    echo\
    echo 在注入此類客戶端時，你必須要使用官方向你提供的遊戲啓動器來啓動遊戲，
    echo 你不能直接雙擊運行進程/進程快捷方式以啓動遊戲，否則可能會導致注入失敗。
    echo 但如果官方未向你提供啓動器/你沒有啓動器，你可能需要向開發者獲取補丁方可注入。
    echo 此補丁爲閉源補丁且並不內置於HoYoShade中，你無法通過更改HoYoShade源代碼來實現注入功能。
    echo 有關更多信息，請聯繫開發者 哆啦D夢DuolaD （https://github.com/DuolaD） 以獲取更多信息。
    echo\
    start "" /wait /b inject.exe StarRail.exe
    exit
) else if "%content%" == "6" (
    echo 你選擇的注入目標爲:絕區零（通用 公開客戶端）
    echo 注入器現已啓動，你現在可以使用啓動器啓動遊戲了。注入器會一併注入。
    echo 如果你選擇了錯誤的注入目標，只需關閉此窗口後重新運行啓動器重新選擇即可。
    echo\
    echo 重要：你必須要使用一個遊戲啓動器來啓動遊戲（無論是官方啓動器還是第三方啓動器），
    echo 不能直接雙擊運行進程/進程快捷方式以啓動遊戲。否則會注入失敗。
    echo\
    echo 注意：此注入選項不適用於任何 絕區零（公測前/後內測（Beta））客戶端，
    echo 如需注入至此類客戶端，請關閉窗口並重新啓動HoYoShade啓動器，並在公開客戶端注入列表選擇對應的客戶端。
    echo\
    start "" /wait /b inject.exe ZenlessZoneZero.exe
    exit
) else if "%content%" == "7" (
    goto beta_client_inject_choice_menu
) else if "%content%" == "8" (
    goto blender_hook_check
) else if "%content%" == "9" (
    reg query "HKEY_CLASSES_ROOT\starward" >nul 2>&1
    if %errorlevel%==0 (
        goto starward_menu
    ) else (
        echo 未檢測到Starward URL協議，這是聯動Starward啓動器的必要條件。
        echo 請先在Starward啓動器 - 應用設置 - 高級 - URL協議界面中，將“註冊URL協議”開關設置爲開啓。
        pause
        goto menu
    )
    pause
    goto menu
) else if "%content%" == "10" (
    goto other
) else if "%content%" == "11" (
    exit
) else (
    echo 輸入錯誤。
    timeout /t 2
    goto menu
    )
exit

:other
title HoYoShade啓動器
cls
echo 歡迎使用HoYoShade啓動器！
echo\
echo 模組版本：V3.0.0-Beta.1
echo 開發者：DuolaDStudio X ZelbertYQ X Ex_M
echo 由[幻港之蝶]注入內核驅動
echo\
echo 如果你需要檢查版本更新，可以去訪問我們的倉庫查看是否有發行更新版本
echo 注意！開發者選項僅用於調試/檢測錯誤需要。除非開發者明確要求你這樣做，或者你很清楚知道自己在做什麼，否則請勿輕易使用！
echo\
echo [1]訪問我們的GitHub倉庫
echo [2]贊助本Mod
echo [3]聯繫我們
echo [4]關於HoYoShade
echo [5]開發者選項
echo [6]返回主界面
echo [7]退出程序

echo\
set /p "content=在此輸入選項前面的數字："

if "%content%" == "1" (
    start "" "https://github.com/DuolaD/HoYoShade/"
    goto other
) else if "%content%" == "2" (
    start "" "https://github.com/DuolaD/HoYoShade/blob/V2.X.X-Stable/Readme.Chinese_Traditional.md#%E3%80%A2-%E8%B4%8A%E5%8A%A9"
    goto other
) else if "%content%" == "3" (
    start "" "https://github.com/DuolaD/HoYoShade/blob/V2.X.X-Stable/Readme.Chinese_Traditional.md#%E3%80%A2-%E8%81%AF%E7%B9%AB%E6%88%91"
    goto other
) else if "%content%" == "4" (
    goto about_HoYoShade
) else if "%content%" == "5" (
    goto develop
) else if "%content%" == "6" (
    goto menu
) else if "%content%" == "7" (
    exit
) else (
    echo\
    echo 輸入錯誤。
    timeout /t 2
    goto other
)
goto other

:develop
title HoYoShade啓動器(你已進入開發者選項！！！)
cls
echo 歡迎使用HoYoShade啓動器！
echo\
echo 模組版本：V3.0.0-Beta.1
echo 開發者：DuolaDStudio X ZelbertYQ X Ex_M
echo 由[幻港之蝶]注入內核驅動
echo\
echo 注意！開發者選項僅用於調試/檢測錯誤需要。除非開發者明確要求你這樣做，或者你很清楚知道自己在做什麼，否則請勿輕易使用！
echo\
echo [1]自定義注入
echo [2]返回主界面
echo [3]返回其它選項
echo [4]退出程序

echo\
set /p "content=在此輸入選項前面的數字："

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
    echo 輸入錯誤。
    timeout /t 2
    goto develop
)
goto develop@echo off

:customize_inject
title HoYoShade啓動器(你已進入自定義注入界面！！！)
cls
echo 歡迎使用HoYoShade啓動器！
echo\
echo 模組版本：V3.0.0-Beta.1
echo 開發者：DuolaDStudio X ZelbertYQ X Ex_M
echo 由[幻港之蝶]注入內核驅動
echo\
echo 注意！此功能僅供開發者測試新遊戲使用。這意味着可能會存在未知風險/Bug。
echo 除非開發者明確要求你這樣做，或者你很清楚知道自己在做什麼，否則請不要擅自使用此功能注入Reshade至其它遊戲內。
echo\
echo 使用方法：輸入目標程序文件名即可，無需添加'.exe'後綴，按回車確定。
echo 等待注入窗口界面彈出後啓動目標程序即可。
echo 輸入'\exit'即可返回開發界面。
echo\
set /p "content=在此輸入："
echo\
if "%content%" == "\exit" (
    goto develop
) else (
    echo 你選擇的注入目標爲:%content%.exe
    echo 注入器現已啓動，你現在可以使用啓動器啓動遊戲了。注入器會一併注入。
    echo 如果你選擇了錯誤的注入目標，只需關閉此窗口後重新運行啓動器重新選擇即可。
    echo\
    start "" /wait /b inject.exe %content%.exe
    exit
)

:about_HoYoShade
title HoYoShade
cls
echo HoYoShade
echo HoYo it,Great it.
echo 使ReShade支持米哈遊旗下所有可在PC端運行的遊戲。
echo 然後，彼此成就，彼此閃耀。
echo\
echo DuolaDStudio X ZelbertYQ x Ex_M
echo 聯合鉅獻
echo\
echo 模組版本：V3.0.0-Beta.1
echo\
echo HoYoShade基於ReShade官方插件和OpenHoYoShade框架二次開發，除效果庫/預設之外的所有文件均遵守BSL-3開源協議在GitHub上開源。
echo 你可以在Reshade.me網站中查看ReShade官方資訊。
echo Modify By DuolaDStudio Hong Kong Ltd,All rights reserved.
echo\
echo 請注意：HoYoShade爲免費開源Mod，ReShade爲免費開源插件，OpenHoYoShade爲免費開源框架。
echo 所有源碼都可以在GitHub上獲取，如果你是付費購買了未經修改/二次開發的(Open)HoYoShade
echo 請立即退款！商家行爲和所有開發者無關！
echo\
echo 詳細開發名單：
echo -DuolaDStudio Hong Kong Ltd.
echo   ——哆啦D夢DuolaD[RE適配/大版本更新開發/啓動器/預設]
echo   ——琳妮特LynetteNotFound[HoYoShade小版本更新開發/維護]
echo -Ex_M[技術支持/指導/GUI製作]
echo -ZelbertYQ[文檔站技術支持]
echo\
echo 鳴謝：
echo -CYTeam[HoYoShade合作伙伴/微軟企業儲存計劃提供/動態轉靜態鏈接解決方案]
echo -Cloudflare, Inc.[域名託管與管理]
echo\
echo 感謝有你！HoYoShade明天會更好！
pause
goto other

:ini_Reset
title HoYoShade啓動器
cls
echo 歡迎使用HoYoShade啓動器！
echo\
echo 模組版本：V3.0.0-Beta.1
echo 開發者：DuolaDStudio X ZelbertYQ X Ex_M
echo 由[幻港之蝶]注入內核驅動
echo\
echo 注意：在HoYoShade V3中，重置ReShade.ini的操作是全自動檢測並後臺運行的。
echo 也就是說，通常情況下你都不需要再手動進行重置ReShade.ini。
echo
echo 一般只有以下兩種情況，你才需要重置ReShade.ini配置文件：
echo ·倉庫Releases界面中明確寫明瞭建議/必須重置ReShade.ini配置文件，以此開啓新功能/修復Bug。
echo ·HoYoShade開發者/貢獻者明確要求你進行這個操作。
echo\
echo 除此之外，一般情況下你都不需要進行重置ReShade.ini操作。
echo\
echo 重置完畢後，你需要重新刪除已經複製到遊戲進程根目錄下的ReShade.ini配置文件，否則HoYoShade將無法按照預期正常工作。
echo 是否繼續重置操作？
echo\
echo [1]是
echo [2]否(返回啓動器主菜單)
echo\
set /p "content=在此輸入選項前面的數字："

if "%content%" == "1" (
    start "" /wait ".\LauncherResource\INIBuild.exe"
    :File_Reset
    cls
    echo 歡迎使用HoYoShade啓動器！
    echo\
    echo 模組版本：V3.0.0-Beta.1
    echo 開發者：DuolaDStudio X ZelbertYQ X Ex_M
    echo 由[幻港之蝶]注入內核驅動
    echo\
    echo 重置成功！重置後的ReShade.ini現已替換模組根目錄中的舊版ReShade.ini。
    echo 你需要重新刪除已經複製到遊戲進程根目錄下的ReShade.ini配置文件，否則HoYoShade將無法按照預期正常工作。
    echo\
    echo 如何找到遊戲進程根目錄？  
    echo 對於HoYoPlay（米哈遊啓動器）:點擊開始啓動按鈕旁邊的更多圖標-遊戲設置即可查看遊戲進程根目錄。  
    echo 點擊'打開所在目錄'即可使用資源管理器打開遊戲進程根目錄。  
    echo\
    echo 對於StarWard:點擊開始啓動按鈕旁邊的齒輪圖標即可查看遊戲進程根目錄。  
    echo 點擊遊戲進程根目錄即可使用資源管理器打開遊戲進程根目錄。  
    echo\
    echo 仍然不懂如何操作？你可以在 https://hoyosha.de 中查看用戶協議和圖文安裝說明。
    echo 位於中國大陸？ https://cn.hoyosha.de 可以提供更佳的訪問體驗。
    echo\
    pause
    goto menu
) else if "%content%" == "2" (
    goto menu
) else (
    echo\
    echo 輸入錯誤。
    timeout /t 2
    goto ini_Reset
)

:beta_client_inject_choice_menu
title HoYoShade啓動器
cls
echo 歡迎使用HoYoShade啓動器！
echo\
echo 模組版本：V3.0.0-Beta.1
echo 開發者：DuolaDStudio X ZelbertYQ X Ex_M
echo 由[幻港之蝶]注入內核驅動
echo\
echo 當前注入列表：測試服客戶端注入列表
echo 注意：當前注入列表僅支持部分Beta/創作者體驗服/Devkit等非公開客戶端，不支持任何公開客戶端
echo\
echo 本模組僅用於遊戲畫面調色使用，請遵守本Mod的用戶協議和遊戲及其開發/發行商相關條例。
echo 你可以在 https://hoyosha.de 中查看用戶協議和圖文/視頻安裝說明。
echo 位於中國大陸？ https://cn.hoyosha.de 可以提供更佳的訪問體驗。
echo\
echo 以下客戶端注入選項均只能用於注入至測試服客戶端。
echo\
echo 如果你想使用的測試服客戶端不在此列表，或者注入器未對遊戲啓動做出響應，則說明:
echo 1:你想使用的測試服客戶端注入選項與公開客戶端注入選項通用，請先嚐試使用公開客戶端注入列表嘗試注入。
echo 2:HoYoShade暫未適配你目前正在使用的測試服客戶端。
echo 如需適配，請在我們的訪問我們的GitHub倉庫（https://github.com/DuolaD/HoYoShade）提交issues。
echo\
echo [1] 重置模組根目錄中的ReShade.ini
echo [2] 注入至 原神（通用 國際服 DevKit/公測前內測（Beta）客戶端）
echo [3] 注入至 絕區零（通用 公測前內測（Beta）客戶端）
echo [4] 注入至 絕區零（通用 公測後內測（Beta）/創作者體驗服客戶端）
echo [5] 注入至 崩壞：因緣精靈（通用 中國大陸/國際服 CBT1 客戶端）
echo [6] 注入至 星布穀地（通用 中國大陸/國際服 CBT1/Devkit 客戶端）
echo [7] 切換至公開客戶端注入列表
echo [8] 其它選項
echo [9] 退出程序

echo\
set /p "content=在此輸入選項前面的數字："

echo\

if "%content%" == "1" (
    goto ini_Reset
) else if "%content%" == "2" (
    cls
    echo 你選擇的注入目標爲:原神（通用 國際服 DevKit/公測前內測（Beta）客戶端）
    echo 注入器現已啓動，你現在可以使用啓動器啓動遊戲了。注入器會一併注入。
    echo 如果你選擇了錯誤的注入目標，只需關閉此窗口後重新運行啓動器重新選擇即可。
    echo\
    echo 注意：此注入選項不適用於任何 原神（公開/公測後內測（Beta））客戶端，
    echo 如需注入至此類客戶端，請關閉窗口並重新啓動HoYoShade啓動器，並在公開客戶端注入列表選擇對應的客戶端。
    echo\
    echo 重要：你必須要使用官方向你提供的遊戲啓動器來啓動遊戲，
    echo 不能直接雙擊運行進程/進程快捷方式以啓動遊戲。否則可能會導致注入失敗。
    echo 如果官方未向你提供啓動器/你沒有啓動器，你可能需要向開發者獲取補丁方可注入。
    echo 此補丁爲閉源補丁且並不內置於HoYoShade中，你無法通過更改HoYoShade源代碼來實現注入功能。
    echo 有關更多信息，請聯繫開發者 哆啦D夢DuolaD （https://github.com/DuolaD） 以獲取更多信息。
    echo\
    start "" /wait /b inject.exe Genshin.exe
    exit
) else if "%content%" == "3" (
    cls
    echo 你選擇的注入目標爲:絕區零（通用 公測前內測（Beta）客戶端）
    echo 注入器現已啓動，你現在可以使用啓動器啓動遊戲了。注入器會一併注入。
    echo 如果你選擇了錯誤的注入目標，只需關閉此窗口後重新運行啓動器重新選擇即可。
    echo\
    echo 注意：此注入選項不適用於任何 絕區零（通用 公開/公測後內測/創作者體驗服）客戶端，
    echo 如需注入至此類客戶端，請關閉窗口並重新啓動HoYoShade啓動器，並選擇對應的客戶端注入選項。
    echo\
    echo 重要：你必須要使用官方向你提供的遊戲啓動器來啓動遊戲，
    echo 不能直接雙擊運行進程/進程快捷方式以啓動遊戲。否則可能會導致注入失敗。
    echo 如果官方未向你提供啓動器/你沒有啓動器，你可能需要向開發者獲取補丁方可注入。
    echo 此補丁爲閉源補丁且並不內置於HoYoShade中，你無法通過更改HoYoShade源代碼來實現注入功能。
    echo 有關更多信息，請聯繫開發者 哆啦D夢DuolaD （https://github.com/DuolaD） 以獲取更多信息。
    echo\
    start "" /wait /b inject.exe ZZZ.exe
    exit
) else if "%content%" == "4" (
    cls
    echo 你選擇的注入目標爲:絕區零（通用 公測後內測/創作者體驗服客戶端）
    echo 注入器現已啓動，你現在可以使用啓動器啓動遊戲了。注入器會一併注入。
    echo 如果你選擇了錯誤的注入目標，只需關閉此窗口後重新運行啓動器重新選擇即可。
    echo\
    echo 注意：此注入選項不適用於任何 絕區零（通用 公開/公測前內測）客戶端，
    echo 如需注入至此類客戶端，請關閉窗口並重新啓動HoYoShade啓動器，並選擇對應的客戶端注入選項。
    echo\
    echo 重要：你必須要使用官方向你提供的遊戲啓動器來啓動遊戲，
    echo 不能直接雙擊運行進程/進程快捷方式以啓動遊戲。否則可能會導致注入失敗。
    echo 如果官方未向你提供啓動器/你沒有啓動器，你可能需要向開發者獲取補丁方可注入。
    echo 此補丁爲閉源補丁且並不內置於HoYoShade中，你無法通過更改HoYoShade源代碼來實現注入功能。
    echo 有關更多信息，請聯繫開發者 哆啦D夢DuolaD （https://github.com/DuolaD） 以獲取更多信息。
    echo\
    start "" /wait /b inject.exe ZenlessZoneZeroBeta.exe
    exit
) else if "%content%" == "5" (
    cls
    echo 你選擇的注入目標爲:崩壞：因緣精靈（通用 中國大陸/國際服 CB1 客戶端）
    echo 注入器現已啓動，你現在可以使用啓動器啓動遊戲了。注入器會一併注入。
    echo 如果你選擇了錯誤的注入目標，只需關閉此窗口後重新運行啓動器重新選擇即可。
    echo\
    echo 重要：你必須要使用官方向你提供的遊戲啓動器來啓動遊戲，
    echo 不能直接雙擊運行進程/進程快捷方式以啓動遊戲。否則可能會導致注入失敗。
    echo 如果官方未向你提供啓動器/你沒有啓動器，你可能需要向開發者獲取補丁方可注入。
    echo 此補丁爲閉源補丁且並不內置於HoYoShade中，你無法通過更改HoYoShade源代碼來實現注入功能。
    echo 有關更多信息，請聯繫開發者 哆啦D夢DuolaD （https://github.com/DuolaD） 以獲取更多信息。
    echo\
    start "" /wait /b inject.exe NexusAnima.exe
    exit
) else if "%content%" == "6" (
    cls
    echo 你選擇的注入目標爲:星布穀地（通用 中國大陸/國際服 CBT1/Devkit 客戶端）
    echo 注入器現已啓動，你現在可以使用啓動器啓動遊戲了。注入器會一併注入。
    echo 如果你選擇了錯誤的注入目標，只需關閉此窗口後重新運行啓動器重新選擇即可。
    echo\
    echo 重要：你必須要使用官方向你提供的遊戲啓動器來啓動遊戲，
    echo 不能直接雙擊運行進程/進程快捷方式以啓動遊戲。否則可能會導致注入失敗。
    echo 如果官方未向你提供啓動器/你沒有啓動器，你可能需要向開發者獲取補丁方可注入。
    echo 此補丁爲閉源補丁且並不內置於HoYoShade中，你無法通過更改HoYoShade源代碼來實現注入功能。
    echo 有關更多信息，請聯繫開發者 哆啦D夢DuolaD （https://github.com/DuolaD） 以獲取更多信息。
    echo\
    start "" /wait /b inject.exe PetitPlanet.exe
    exit
) else if "%content%" == "7" (
    goto menu
) else if "%content%" == "8" (
    goto other
) else if "%content%" == "9" (
    exit
) else (
    echo\
    echo 輸入錯誤。
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
        echo 自檢未通過，模組根目錄下並沒有找到名爲 ys_client.exe.lnk 和/或 zzz_loader.exe.lnk 的快捷方式。
        echo 請在模組根目錄下創建指向 loader.exe 的快捷方式，命名為 ys_client.exe.lnk 和/或 zzz_loader.exe.lnk，然後再試一次。
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
title HoYoShade啓動器
cls
echo 歡迎使用HoYoShade啓動器！
echo\
echo 模組版本：V3.0.0-Beta.1
echo 開發者：DuolaDStudio X ZelbertYQ X Ex_M
echo 由[幻港之蝶]注入內核驅動
echo\
echo 我們檢測到當前你可能不在中国大陆/港澳台/新加坡地區，
echo 當前我們檢測到你的所在國家/地區爲：%country_code% 。
echo 這可能會導致本Mod的聯動注入功能和Blender/留影機插件無法在你所在的國家及地區獲得完整技術支持,或不予對你提供任何技術支持。
echo\
echo 是否確認嘗試繼續操作？
echo\
echo [1]是
echo [2]否（返回啓動器主菜單）
echo\
set /p "content=在此輸入選項前面的數字："
if "%content%" == "1" (
    goto blender_hook_menu
) else if "%content%" == "2" (
    goto menu
) else (
    echo\
    echo 輸入錯誤。
    timeout /t 2
    goto blender_hook_not_in_cn
)

:blender_hook_menu
cls
title HoYoShade啓動器
set blender_recheck=0
cls
echo 歡迎使用HoYoShade啓動器！
echo\
echo 模組版本：V3.0.0-Beta.1
echo 開發者：DuolaDStudio X ZelbertYQ X Ex_M
echo 由[幻港之蝶]注入內核驅動
echo\
if "%missing_curl%" == "1" (
    echo 我們檢測到當前操作系統中並不包含curl組件，這會導致地區檢測功能無法工作。
    echo\
    echo 你仍然可以繼續使用此Mod的聯動注入功能。
    echo 但如果你並不處於中國大陸/港澳臺/新加坡地區，可能會導致本Mod的聯動注入功能和Blender/留影機插件無法在你所在的國家及地區獲得完整技術支持,或不予對你提供任何技術支持。
    echo\
)
echo 當前 Blender/留影機插件 注入器檢測信息如下：
if "!ys_client_exist!"=="1" (
    echo [原神版 Blender/留影機插件] ：已加載
) else (
    echo [原神版 Blender/留影機插件] ：未找到
)
if "!zzz_loader_exist!"=="1" (
    echo [絕區零版 Blender/留影機插件] ：已加載
) else (
    echo [絕區零版 Blender/留影機插件] ：未找到
)
echo\
echo 當前我們檢測到你的所在國家/地區爲：%country_code% 。
echo\
echo 注意：如果你使用聯動注入功能，需要選擇你在Blender/留影機插件中綁定的對應服務器的客戶端，否則ReShade無法正常注入。
echo 如果這是你第一次啓動Blender/留影機插件，請確保在此處選擇的目標客戶端和你接下來在Blender/留影機插件中綁定的目標客戶端一致，否則ReShade無法正常注入。
echo\
echo 注意：選項[9] 僅付費版/作者版無人機可用。
echo\
echo 在當前HoYoShade版本中：
echo 原神版 Blender/留影機插件 僅支持V2版本。
echo 絕區零版 Blender/留影機插件 僅支持V1版本。
echo 其他版本的 Blender/留影機插件 將不受支持。
echo\
echo [1] 重置模組根目錄中的ReShade.ini
echo [2] 聯動 原神版 Blender/留影機插件 注入至 原神（通用 中國大陸/嗶哩嗶哩 公開客戶端）
echo [3] 聯動 原神版 Blender/留影機插件 注入至 原神（通用 國際服/Epic 公開 客戶端）
echo [4] 聯動 絕區零版 Blender/留影機插件 注入至 絕區零（通用 公開客戶端）
echo [5] 僅啓動 原神版 Blender/留影機插件
echo [6] 僅啓動 絕區零版 Blender/留影機插件
echo [7] 同步當前系統時間以修復系統時間不同步的提示
echo [8] 刪除 config 文件以重新指向其它客戶端
echo [9] 刪除 cookies.json/cookie.txt 文件以修復注入時“賬號未登錄”的報錯提示
echo [10] 刷新 Blender/留影機插件 注入器檢測信息
echo [11] 返回主界面
echo [12] 退出程序
echo\
set /p "choice=在此輸入選項前面的數字："
echo\
if "%choice%"=="1" (
    goto ini_Reset
) else if "%choice%"=="2" (
    if "!ys_client_exist!"=="0" (
        echo 自檢未通過，模組根目錄下並沒有找到名爲 ys_client.lnk 的快捷方式。
        echo 請在模組根目錄下創建指向 loader.exe 的快捷方式，命名爲 ys_client.lnk ，然後選擇 [10] 刷新 Blender/留影機插件 注入器檢測信息，再試一次。
        pause
        goto blender_hook_menu
    )
    echo 你選擇的注入目標爲:原神（通用 中國大陸/嗶哩嗶哩 公開客戶端）
    echo\
    echo ReShade和Blender/留影機插件注入器現已啓動。請不要關閉本窗口。
    echo Blender/留影機插件注入器啓動遊戲後，ReShade將會自動注入並關閉該窗口。
    echo 如果ReShade.ini複製到了正確的遊戲進程根目錄，那麼ReShade將會正確設置並啓動。
    echo\
    echo 如果你選擇了錯誤的注入目標，只需關閉此窗口和Blender/留影機插件注入器窗口後重新運行啓動器重新選擇即可。
    echo\
    start "" "%~dp0ys_client.exe.lnk"
    start "" /wait /b inject.exe YuanShen.exe
    exit
) else if "%choice%"=="3" (
    if "!ys_client_exist!"=="0" (
        echo 自檢未通過，模組根目錄下並沒有找到名爲 ys_client.lnk 的快捷方式。
        echo 請在模組根目錄下創建指向 loader.exe 的快捷方式，命名爲 ys_client.lnk ，然後選擇 [10] 刷新 Blender/留影機插件 注入器檢測信息，再試一次。
        pause
        goto blender_hook_menu
    )
    echo 你選擇的注入目標爲:原神（通用 國際服/Epic 公開 客戶端）
    echo\
    echo ReShade和Blender/留影機插件注入器現已啓動。請不要關閉本窗口。
    echo Blender/留影機插件注入器啓動遊戲後，ReShade將會自動注入並關閉該窗口。
    echo 如果ReShade.ini複製到了正確的遊戲進程根目錄，那麼ReShade將會正確設置並啓動。
    echo\
    echo 如果你選擇了錯誤的注入目標，只需關閉此窗口和Blender/留影機插件注入器窗口後重新運行啓動器重新選擇即可。
    echo\
    start "" "%~dp0ys_client.exe.lnk"
    start "" /wait /b inject.exe GenshinImpact.exe
    exit
) else if "%choice%"=="4" (
    if "!zzz_loader_exist!"=="0" (
        echo 自檢未通過，模組根目錄下並沒有找到名爲 zzz_loader.lnk 的快捷方式。
        echo 請在模組根目錄下創建指向 loader.exe 的快捷方式，命名爲 zzz_loader.lnk ，然後選擇 [10] 刷新 Blender/留影機插件 注入器檢測信息，再試一次。
        pause
        goto blender_hook_menu
    )
    echo 你選擇的注入目標爲:絕區零（通用 公開客戶端）
    echo\
    echo ReShade和Blender/留影機插件注入器現已啓動。請不要關閉本窗口。
    echo Blender/留影機插件注入器啓動遊戲後，ReShade將會自動注入並關閉該窗口。
    echo 如果ReShade.ini複製到了正確的遊戲進程根目錄，那麼ReShade將會正確設置並啓動。
    echo\
    echo 如果你選擇了錯誤的注入目標，只需關閉此窗口和Blender/留影機插件注入器窗口後重新運行啓動器重新選擇即可。
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
    echo 同步系統時間的耗時取決於你當前的網絡情況。
    echo 如果當前網絡較差，耗時可能會比預期較長。請耐心等待。
    echo\
    echo 正在檢查並啓動 Windows Time 服務...
    net start w32time >nul 2>&1
    echo\
    if /i "%country_code%"=="CN" (
        w32tm /config /manualpeerlist:"ntp.ntsc.ac.cn" /syncfromflags:manual /reliable:YES /update >nul 2>&1
        net stop w32time >nul 2>&1
        net start w32time >nul 2>&1
        echo 檢測到你當前位於中國大陸，可能難以訪問微軟官方時間源同步服務器。
        echo 當前你的操作系統同步時間源已更改爲中國大陸科學院國家授時中心官方時間源同步服務器，以方便鏈接服務器同步時間。
        echo\
    )
    echo 正在嘗試同步時間...
    echo\
    w32tm /resync >nul 2>&1
    if !errorlevel! == 0 (
        echo 時間同步成功！可訪問 https://time.is 以檢測時間是否已同步，然後重新嘗試運行Blender/留影機插件。
    ) else (
        echo 時間同步失敗，可能是因爲沒有正確配置NTP時間服務器或其他錯誤。
        echo 請確保NTP時間服務器設置正確，並且網絡連接正常。
        echo 你可以嘗試稍後再試，或訪問系統設置-時間和語言-日期和時間進行手動設置。
    )
    echo\
    echo ========================
    echo\
    echo 注意：如果日後在使用過程中，Blender/留影機插件仍然經常性報錯系統時間不同步的提示/你需要經常性使用本功能來修復報錯/系統時間和現實時間經常性不符。
    echo 你可以在下次出現提示前先前往 https://time.is 以檢測是否爲誤報，然後再使用本功能進行修復。
    echo\
    echo 如果這並不是誤報，那麼說明當前設備的時鐘電路極有可能未能在斷電/關機/休眠/睡眠的情況下正常工作。
    echo 你可以優先檢查設備主板BIOS的電池電量（通常爲CR2032，電壓低於2V說明電池電量耗盡）。
    echo 如果電壓過低，請嘗試更換全新的電池，並在BIOS中設置正確的時間，然後使用本功能同步系統時間。
    echo\
    echo 如果更換電池後故障依舊/當前設備因相關條款無法自行更換，請聯繫Blender/留影機插件開發者/你的設備製造商/第三方維修機構尋求幫助。
    echo\
    echo ========================
    echo\
    pause
    goto blender_hook_menu
) else if "%choice%"=="8" (
    :blender_select_config_target
    cls
    echo 請選擇要操作的插件版本：
    echo [1]  原神版 Blender/留影機插件
    echo [2]  絕區零版 Blender/留影機插件
    echo [3]  返回主菜單
    echo\
    set /p "blver=在此輸入選項前面的數字："
    if "!blver!"=="1" (
        if "!ys_client_exist!"=="0" (
            echo 自檢未通過，模組根目錄下並沒有找到名爲 ys_client.lnk 的快捷方式。
            echo 請在模組根目錄下創建指向 loader.exe 的快捷方式，命名爲 ys_client.lnk ，然後選擇 [10] 刷新 Blender/留影機插件 注入器檢測信息，再試一次。
            pause
            goto blender_hook_menu
        )
        set "shortcut=%~dp0ys_client.exe.lnk"
    ) else if "!blver!"=="2" (
        if "!zzz_loader_exist!"=="0" (
            echo 自檢未通過，模組根目錄下並沒有找到名爲 zzz_loader.lnk 的快捷方式。
            echo 請在模組根目錄下創建指向 loader.exe 的快捷方式，命名爲 zzz_loader.lnk ，然後選擇 [10] 刷新 Blender/留影機插件 注入器檢測信息，再試一次。
            pause
            goto blender_hook_menu
        )
        set "shortcut=%~dp0zzz_loader.exe.lnk"
    ) else if "!blver!"=="3" (
        goto blender_hook_menu
    ) else (
        echo\
        echo 輸入錯誤。
        timeout /t 2
        goto blender_select_config_target
    )
    set "target="
    for /f "delims=" %%i in ('powershell -noprofile -command "(New-Object -ComObject WScript.Shell).CreateShortcut(\"!shortcut!\").TargetPath"') do (
        set "target=%%i"
    )
    for %%i in ("!target!") do set "target_dir=%%~dpi"
    set "fileToDelete=config"
    set "target_dir=!target_dir!\"
    set "target_dir=!target_dir:~0,-1!"
    set "filePath=!target_dir!\config"
    if not exist "!filePath!" (
      echo 自檢失敗，config文件不存在於無人機模組目錄下。
      echo 這可能是因爲你暫未使用無人機綁定遊戲客戶端，或者你指向了一個錯誤的loader.exe文件。
      echo\
      echo 按下任意鍵後返回主菜單。
      pause
      goto blender_hook_menu
    ) else (
      :blender_delete_config
      cls
      echo 你確定你要繼續刪除config文件嗎？
      echo 刪除後你需要重新啓動一次客戶端以此讓無人機重新獲取遊戲進程根目錄。
      echo\
      echo [1] 是
      echo [2] 否（返回主菜單）
      echo\
      set /p "content=在此輸入選項前面的數字："
      if "!content!" == "1" (
          echo\
          echo\
          del "!filePath!"
          if exist "!filePath!" (
              echo 刪除失敗，可能是文件被佔用或路徑錯誤。
          ) else (
              echo 已成功刪除config文件。
          )
          echo\
          echo 按下任意鍵後返回主菜單。
          pause
          goto blender_hook_menu
      ) else if "!content!" == "2" (
          goto blender_hook_menu
      ) else (
          echo\
          echo 輸入錯誤。
          timeout /t 2
          goto blender_delete_config
      )
    )
) else if "%choice%"=="9" ( 
    :blender_select_cookies_target
    cls
    echo 請選擇要操作的插件版本：
    echo [1]  原神版 Blender/留影機插件
    echo [2]  絕區零版 Blender/留影機插件
    echo [3]  返回主菜單
    echo\
    set /p "blver=在此輸入選項前面的數字："
    if "!blver!"=="1" (
        if "!ys_client_exist!"=="0" (
            echo 自檢未通過，模組根目錄下並沒有找到名爲 ys_client.lnk 的快捷方式。
            echo 請在模組根目錄下創建指向 loader.exe 的快捷方式，命名爲 ys_client.lnk ，然後選擇 [10] 刷新 Blender/留影機插件 注入器檢測信息，再試一次。
            pause
            goto blender_hook_menu
        )
        set "shortcut=%~dp0ys_client.exe.lnk"
        set "cookie_filename=cookie.txt"
    ) else if "!blver!"=="2" (
        if "!zzz_loader_exist!"=="0" (
            echo 自檢未通過，模組根目錄下並沒有找到名爲 zzz_loader.lnk 的快捷方式。
            echo 請在模組根目錄下創建指向 loader.exe 的快捷方式，命名爲 zzz_loader.lnk ，然後選擇 [10] 刷新 Blender/留影機插件 注入器檢測信息，再試一次。
            pause
            goto blender_hook_menu
        )
        set "shortcut=%~dp0zzz_loader.exe.lnk"
        set "cookie_filename=cookies.json"
    ) else if "!blver!"=="3" (
        goto blender_hook_menu
    ) else (
        echo\
        echo 輸入錯誤。
        timeout /t 2
        goto blender_select_cookies_target
    )
    set "target="
    for /f "delims=" %%i in ('powershell -noprofile -command "(New-Object -ComObject WScript.Shell).CreateShortcut(\"!shortcut!\").TargetPath"') do (
        set "target=%%i"
    )
    for %%i in ("!target!") do set "target_dir=%%~dpi"
    set "fileToDelete=!cookie_filename!"
    set "target_dir=!target_dir!\"
    set "target_dir=!target_dir:~0,-1!"
    set "filePath=!target_dir!\!cookie_filename!"
    if not exist "!filePath!" (
      echo 自檢失敗，!cookie_filename! 文件不存在於無人機模組目錄下。
      echo 這可能是因爲你使用的是免費版無人機，或者你指向了一個錯誤的loader.exe文件。
      echo\
      echo 按下任意鍵後返回主菜單。
      pause
      goto blender_hook_menu
    ) else (
      :blender_delete_cookiesjson
      cls
      echo 你確定你要繼續刪除 !cookie_filename! 文件嗎？
      echo 刪除後你需要重新掃碼以登錄嗶哩嗶哩賬號。
      echo\
      echo [1] 是
      echo [2] 否（返回主菜單）
      echo\
      set /p "content=在此輸入選項前面的數字："
      if "!content!" == "1" (
          echo\
          echo\
          del "!filePath!"
          if exist "!filePath!" (
              echo 刪除失敗，可能是文件被佔用或路徑錯誤。
          ) else (
              echo 已成功刪除 !cookie_filename! 文件。
          )
          echo\
          echo 按下任意鍵後返回主菜單。
          pause
          goto blender_hook_menu
      ) else if "!content!" == "2" (
          goto blender_hook_menu
      ) else (
          echo\
          echo 輸入錯誤。
          timeout /t 2
          goto blender_delete_cookiesjson
      )
    )

) else if "%choice%"=="10" (
    set blender_recheck=1
    goto blender_hook_check
) else if "%choice%"=="11" (
    goto menu
) else if "%choice%"=="2" (
    exit
) else (
    echo 輸入錯誤。
    timeout /t 2
    goto blender_hook_menu
)

:starward_menu
title HoYoShade啓動器
cls
echo 歡迎使用HoYoShade啓動器！
echo\
echo 模組版本：V3.0.0-Beta.1
echo 開發者：DuolaDStudio X ZelbertYQ X Ex_M
echo 由[幻港之蝶]注入內核驅動
echo\
echo 當前注入列表：聯動Starward啓動器注入列表
echo 注意：當前注入列表不支持任何Beta/創作者體驗服/Devkit/私服等非公開客戶端
echo 使用前，請先確保你已Starward啓動器安裝遊戲/已在Starward啓動器中綁定遊戲客戶端路徑。
echo 並保持Apps設置/設定 - 進階 - URL協議 - 註冊URL協議開關保持開啓狀態。
echo\
echo 本模組僅用於遊戲畫面調色使用，請遵守本Mod的用戶協議和遊戲及其開發/發行商相關條例。
echo 你可以在 https://hoyosha.de 中查看用戶協議和圖文/視頻安裝說明。
echo 位於中國大陸？ https://cn.hoyosha.de 可以提供更佳的訪問體驗。
echo\
echo [1]重置模組根目錄中的ReShade.ini
echo [2]啓動游戲並注入至 原神（中國大陸 公開客戶端）
echo [3]啓動游戲並注入至 原神（嗶哩嗶哩 公開客戶端）
echo [4]啓動游戲並注入至 原神（國際服 公開客戶端）
echo [5]啓動游戲並注入至 崩壞三（中國大陸 公開客戶端）
echo [6]啓動游戲並注入至 崩壞三（國際服 公開客戶端）
echo [7]啓動游戲並注入至 崩壞：星穹鐵道（中國大陸 公開客戶端）
echo [8]啓動游戲並注入至 崩壞：星穹鐵道（嗶哩嗶哩 公開客戶端）
echo [9]啓動游戲並注入至 崩壞：星穹鐵道（國際服 公開客戶端）
echo [10]啓動游戲並注入至 絕區零（中國大陸 公開客戶端）
echo [11]啓動游戲並注入至 絕區零（嗶哩嗶哩 公開客戶端）
echo [12]啓動游戲並注入至 絕區零（國際服 公開客戶端）
echo [13]返回主界面
echo [14]其它選項
echo [15]退出程序

echo\
set /p "content=在此輸入選項前面的數字："

echo\

if "%content%" == "1" (
    goto ini_Reset
) else if "%content%" == "2" (
    cls
    echo 你選擇的注入目標爲:原神（中國大陸 公開客戶端）
    echo 注入器現已啓動。如果Starward的遊戲客戶端設置無誤，HoYoShade將會拉起Starward啓動遊戲，並注入ReShade至客戶端中。
    echo 如果你選擇了錯誤的注入目標，只需關閉此窗口/遊戲窗口後重新運行啓動器，重新選擇即可。
    echo\
    start "" /b inject.exe YuanShen.exe
    start starward://startgame/hk4e_cn
    exit
) else if "%content%" == "3" (
    cls
    echo 你選擇的注入目標爲:原神（嗶哩嗶哩 公開客戶端）
    echo 注入器現已啓動。如果Starward的遊戲客戶端設置無誤，HoYoShade將會拉起Starward啓動遊戲，並注入ReShade至客戶端中。
    echo 如果你選擇了錯誤的注入目標，只需關閉此窗口/遊戲窗口後重新運行啓動器，重新選擇即可。
    echo\
    start "" /b inject.exe YuanShen.exe
    start starward://startgame/hk4e_bilibili
    exit
) else if "%content%" == "4" (
    cls
    echo 你選擇的注入目標爲:原神（國際服 公開客戶端）
    echo 注入器現已啓動。如果Starward的遊戲客戶端設置無誤，HoYoShade將會拉起Starward啓動遊戲，並注入ReShade至客戶端中。
    echo 如果你選擇了錯誤的注入目標，只需關閉此窗口/遊戲窗口後重新運行啓動器，重新選擇即可。
    echo\
    start "" /b inject.exe GenshinImpact.exe
    start starward://startgame/hk4e_global
    exit
) else if "%content%" == "5" (
    cls
    echo 你選擇的注入目標爲:崩壞三（中國大陸 公開客戶端）
    echo 注入器現已啓動。如果Starward的遊戲客戶端設置無誤，HoYoShade將會拉起Starward啓動遊戲，並注入ReShade至客戶端中。
    echo 如果你選擇了錯誤的注入目標，只需關閉此窗口/遊戲窗口後重新運行啓動器，重新選擇即可。
    echo\
    start "" /b inject.exe BH3.exe
    start starward://startgame/bh3_cn
    exit
) else if "%content%" == "6" (
    cls
    echo 你選擇的注入目標爲:崩壞三（國際服 公開客戶端）
    echo 注入器現已啓動。如果Starward的遊戲客戶端設置無誤，HoYoShade將會拉起Starward啓動遊戲，並注入ReShade至客戶端中。
    echo 如果你選擇了錯誤的注入目標，只需關閉此窗口/遊戲窗口後重新運行啓動器，重新選擇即可。
    echo\
    start "" /b inject.exe BH3.exe
    start starward://startgame/bh3_global
    exit
) else if "%content%" == "7" (
    cls
    echo 你選擇的注入目標爲:崩壞：星穹鐵道（中國大陸 公開客戶端）
    echo 注入器現已啓動。如果Starward的遊戲客戶端設置無誤，HoYoShade將會拉起Starward啓動遊戲，並注入ReShade至客戶端中。
    echo 如果你選擇了錯誤的注入目標，只需關閉此窗口/遊戲窗口後重新運行啓動器，重新選擇即可。
    echo\
    start "" /b inject.exe StarRail.exe
    start starward://startgame/hkrpg_cn
    exit
) else if "%content%" == "8" (
    cls
    echo 你選擇的注入目標爲:崩壞：星穹鐵道（嗶哩嗶哩 公開客戶端）
    echo 注入器現已啓動。如果Starward的遊戲客戶端設置無誤，HoYoShade將會拉起Starward啓動遊戲，並注入ReShade至客戶端中。
    echo 如果你選擇了錯誤的注入目標，只需關閉此窗口/遊戲窗口後重新運行啓動器，重新選擇即可。
    echo\
    start "" /b inject.exe StarRail.exe
    start starward://startgame/hkrpg_bilibili
    exit
) else if "%content%" == "9" (
    cls
    echo 你選擇的注入目標爲:崩壞：星穹鐵道（國際服 公開客戶端）
    echo 注入器現已啓動。如果Starward的遊戲客戶端設置無誤，HoYoShade將會拉起Starward啓動遊戲，並注入ReShade至客戶端中。
    echo 如果你選擇了錯誤的注入目標，只需關閉此窗口/遊戲窗口後重新運行啓動器，重新選擇即可。
    echo\
    start "" /b inject.exe StarRail.exe
    start starward://startgame/hkrpg_global
    exit
) else if "%content%" == "10" (
    cls
    echo 你選擇的注入目標爲:絕區零（中國大陸 公開客戶端）
    echo 注入器現已啓動。如果Starward的遊戲客戶端設置無誤，HoYoShade將會拉起Starward啓動遊戲，並注入ReShade至客戶端中。
    echo 如果你選擇了錯誤的注入目標，只需關閉此窗口/遊戲窗口後重新運行啓動器，重新選擇即可。
    echo\
    start "" /b inject.exe ZenlessZoneZero.exe
    start starward://startgame/nap_cn
    exit
) else if "%content%" == "11" (
    cls
    echo 你選擇的注入目標爲:絕區零（嗶哩嗶哩 公開客戶端）
    echo 注入器現已啓動。如果Starward的遊戲客戶端設置無誤，HoYoShade將會拉起Starward啓動遊戲，並注入ReShade至客戶端中。
    echo 如果你選擇了錯誤的注入目標，只需關閉此窗口/遊戲窗口後重新運行啓動器，重新選擇即可。
    echo\
    start "" /b inject.exe ZenlessZoneZero.exe
    start starward://startgame/nap_bilibili
    exit
) else if "%content%" == "12" (
    cls
    echo 你選擇的注入目標爲:絕區零（國際服 公開客戶端）
    echo 注入器現已啓動。如果Starward的遊戲客戶端設置無誤，HoYoShade將會拉起Starward啓動遊戲，並注入ReShade至客戶端中。
    echo 如果你選擇了錯誤的注入目標，只需關閉此窗口/遊戲窗口後重新運行啓動器，重新選擇即可。
    echo\
    start "" /b inject.exe ZenlessZoneZero.exe
    start starward://startgame/nap_global
    exit
) else if "%content%" == "13" (
    goto menu
) else if "%content%" == "14" (
    goto other
) else if "%content%" == "15" (
    exit
) else (
    echo 輸入錯誤。
    timeout /t 2
    goto starward_menu
    )
exit
