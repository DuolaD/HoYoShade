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
    echo 歡迎使用HoYoShade注入器！
    echo\
    echo 模組版本：V2.111.0 Stable
    echo 開發者：DuolaDStudio X 阿向菌AXBro X Ex_M
    echo\
    echo 我們檢測到你是第一次使用本模組，Reshade.ini現已生成至模組根目錄中。
    echo 你需要將Reshade.ini複製到遊戲進程根目錄，然後才能使用本模組。
    echo\
	echo 如何找到遊戲進程根目錄？  
	echo 對於HoYoPlay（米哈遊啟動器）:點擊開始啟動按鈕旁的更多圖標-遊戲設定即可查看遊戲進程根目錄。  
	echo 點選'開啟所在目錄'即可使用資源管理器開啟遊戲進程根目錄。  
	echo\
	echo 對於StarWard:點擊開始啟動按鈕旁的齒輪圖標即可查看遊戲進程根目錄。  
	echo 點選遊戲進程根目錄即可使用資源管理器開啟遊戲進程根目錄。  
	echo\
	echo 仍然不懂如何操作？你可以在模組根目錄/Tutorial資料夾中查看用戶協議和圖文安裝說明。
	echo\
    pause
	goto menu
)

:menu
title HoYoShade Starter
cls
echo 歡迎使用HoYoShade注入器！
echo\
echo 模組版本：V2.111.0 Stable
echo 開發者：DuolaDStudio X 阿向菌AXBro X Ex_M
echo\
echo 請注意，你需要將Reshade.ini複製到遊戲進程根目錄，然後才能使用本模組。
echo\
echo 本模組僅用於遊戲畫面調色使用，請遵守本Mod的用戶協議及遊戲及其開發/發行商相關條例。
echo 你可以在模組根目錄/Tutorial資料夾中查看使用者協定和圖文安裝說明。
echo 使用模組拍攝素材發佈視頻時，請備註:"該視頻由GitHub@DuolaD/HoYoShade提供渲染支持"。
echo 如因特殊原因無法備註，請通過"其它選項"中的聯繫方式聯繫開發者進行說明。
echo\
echo [1]重置模組根目錄中的ReShade.ini
echo [2]注入至原神（中國大陸服客戶端）
echo [3]注入至原神（嗶哩嗶哩服客戶端）
echo [4]注入至原神（國際服客戶端/Epic客戶端）
echo [5]注入至崩壞三(通用客戶端)
echo [6]注入至崩壞：星穹鐵道(通用客戶端)
echo [7]注入至絕區零(通用客戶端)
echo [8]其它選項
echo [9]退出程序

echo\
set /p "content=在此輸入選項前面的數字："

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
    echo 輸入錯誤。
    timeout /t 2
    goto menu
    )
exit

:other
title HoYoShade Starter
cls
echo 歡迎使用HoYoShade注入器！
echo\
echo 模組版本：V2.111.0 Stable
echo 開發者：DuolaDStudio X 阿向菌AXBro X Ex_M
echo\
echo 如果你需要檢查版本更新，可以去訪問我們的倉庫查看是否有發行更新版本
echo 開發者選項僅用於調試/檢測錯誤需要，除非開發者明確要求你這樣做，否則請勿輕易使用
echo\
echo 注：CYteam網盤除了提供本模組的下載之外，還免費提供國際服原神/崩鐵/HoYoLAB安裝包。
echo 除此之外，CYteam還提供一些安卓的搞機資源。感興趣的可以去看一看~
echo 感謝CYteam提供的網盤服務
echo\
echo [1]訪問我們的GitHub主倉庫
echo [2]存取由CYteam提供的網盤服務
echo [3]在愛發電上贊助我（支持微信和支付寶）
echo [4]在Patreon上贊助我（支持海外支付方式）
echo [5]加入我們模組的官方QQ羣
echo [6]加入我和CYTeam的資源QQ羣
echo [7]關於HoYoShade
echo [8]開發者選項
echo [9]返回主介面
echo [10]退出程序

echo\
set /p "content=在此輸入選項前面的數字："

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
    echo 輸入錯誤。
    timeout /t 2
    goto other
)
goto other

:develop
title HoYoShade Starter(你已進入開發者選項！！！)
cls
echo 歡迎使用HoYoShade注入器！
echo\
echo 模組版本：V2.111.0 Stable
echo 開發者：DuolaDStudio X 阿向菌AXBro X Ex_M
echo\
echo 注意！開發者選項僅用於調試/檢測錯誤需要，除非開發者明確要求你這樣做，否則請勿輕易使用！
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


:BiliBili_Warning
title HoYoShade Starter(嗶哩嗶哩客戶端啓動前警告！)
cls
echo 歡迎使用HoYoShade注入器！
echo\
echo 模組版本：V2.111.0 Stable
echo 開發者：DuolaDStudio X 阿向菌AXBro X Ex_M
echo\
echo 注意！！！
echo 由於嗶哩嗶哩客戶端使用的是外置軟件登錄遊戲賬號
echo 而並非類似官服/國際服/Epic客戶端的遊戲內登錄遊戲賬號
echo 因此，請先確保遊戲已成功登錄遊戲賬號後再按'Home'鍵打開Reshade控制檯進行後續操作
echo\
echo 如果你在遊戲沒有成功登錄遊戲賬戶前打開Reshade控制檯，遊戲在彈出登錄窗口後會卡死
echo 如果你不小心沒有注意到這點併發生了這種情況，只需打開任務管理器關閉遊戲和與遊戲相關的進程
echo 然後重新啓動本模組注入器至等待注入遊戲界面，並重新使用官方啓動器打開遊戲即可。
timeout /t 5
pause
goto YuanShen_inject

:YuanShen_inject
powershell -command Start-Process -FilePath inject.exe YuanShen.exe -Verb RunAs
exit

:customize_inject
title HoYoShade Starter(你已進入自定義注入界面！！！)
cls
echo 歡迎使用HoYoShade注入器！
echo\
echo 模組版本：V2.111.0 Stable
echo 開發者：DuolaDStudio X 阿向菌AXBro X Ex_M
echo\
echo 注意！此功能僅供開發者測試新遊戲使用。這意味着可能會存在未知風險/Bug。
echo 除非你是二次開發者/你受開發者指導，否則請不要擅自使用此功能注入本Reshade至其它遊戲內。
echo\
echo 使用方法：輸入目標程序文件名即可，無需添加'.exe'後綴，按回車確定。
echo 等待注入窗口界面彈出後啓動目標程序即可。
echo 輸入'/exit'即可返回開發界面。
echo\
set /p "content=在此輸入："
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
echo 使ReShade支持米哈遊旗下所有可在PC端運行的遊戲。
echo 然後，彼此成就，彼此閃耀。
echo\
echo DuolaDStudio X 阿向菌AXBro x Ex_M
echo 聯合鉅獻
echo\
echo 模組版本：V2.111.0 Stable
echo\
echo HoYoShade基於ReShade官方元件和OpenHoYoShade框架二次開發，除效果庫/預設之外的所有文件均遵守BSL-3開源協定在GitHub上開源。
echo 你可以在Reshade.me網站中查看ReShade官方資訊。
echo Modify By DuolaDStudio Hong Kong Ltd,All rights reserved.
echo\
echo 請注意：HoYoShade爲免費開源Mod，ReShade爲免費開源插件，OpenHoYoShade爲免費開源框架。
echo 所有原始碼都可以在GitHub上獲取，如果你是付費購買了未經修改/二次開發的(Open)HoYoShade
echo 請立即退款！商家行爲和所有開發者無關！
echo\
echo 詳細開發名單：
echo -DuolaDStudio Hong Kong Ltd.
echo   ——哆啦D夢DuolaD[RE適配器/大版本更新開發/注入器/預設]
echo   ——琳妮特LynetteNotFound[HoYoShade小版本更新開發/維護]
echo -Ex_M[技術支援/指導/GUI製作]
echo -阿向菌AXBro[付費效果庫/宣傳/面向技術支持]
echo\
echo 鳴謝：
echo -CYTeam[HoYoShade合作伙伴/微軟企業儲存計劃提供/動態轉靜態連結解決方案]
echo -Cloudflare, Inc.[網域託管與管理]
echo -Aira2[非強制版本檢測器檢測與下載]
echo\
echo 感謝有你！HoYoShade明天會更好！
pause
goto other

:ini_Reset
title HoYoShade Starter
cls
echo 歡迎使用HoYoShade注入器！
echo\
echo 模組版本：V2.111.0 Stable
echo 開發者：DuolaDStudio X 阿向菌AXBro X Ex_M
echo\
echo 請注意：你只需要在模組目錄移動後才需要重置ReShade.ini
echo 除此之外，一般情況下你都不需要進行重置操作。
echo\
echo 重置完畢後，你需要重新複製ReShade.ini至遊戲進程根目錄
echo 是否繼續重置操作？
echo\
echo [1]是
echo [2]否(返回注入器主菜單)
echo\
set /p "content=在此輸入選項前面的數字："

if "%content%" == "1" (
    start "" /wait ".\InjectResource\INIBuild.exe"
    start "" "convert_encoding.bat"
	:File_Reset
	cls
	echo 歡迎使用HoYoShade注入器！
	echo\
	echo 模組版本：V2.111.0 Stable
	echo 開發者：DuolaDStudio X 阿向菌AXBro X Ex_M
	echo\
    echo 重置成功！重置後的ReShade.ini現已替換模組根目錄中的舊版ReShade.ini。
    echo 你需要將重置後的ReShade.ini替換遊戲進程根目錄原有的ReShade.ini，然後才能使用本模組。
    echo\
	echo 如何找到遊戲進程根目錄？  
	echo 對於HoYoPlay（米哈遊啟動器）:點擊開始啟動按鈕旁的更多圖標-遊戲設定即可查看遊戲進程根目錄。  
	echo 點選'開啟所在目錄'即可使用資源管理器開啟遊戲進程根目錄。  
	echo\
	echo 對於StarWard:點擊開始啟動按鈕旁的齒輪圖標即可查看遊戲進程根目錄。  
	echo 點選遊戲進程根目錄即可使用資源管理器開啟遊戲進程根目錄。  
	echo\
	echo 仍然不懂如何操作？你可以在模組根目錄/Tutorial資料夾中查看用戶協議和圖文安裝說明。
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