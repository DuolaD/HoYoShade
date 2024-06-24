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
    echo 欢迎使用HoYoShade注入器！
    echo\
    echo 模组版本：V2.111.0 Stable
    echo 开发者：DuolaDStudio X 阿向菌AXBro X Ex_M
    echo\
    echo 我们检测到你是第一次使用本模组，Reshade.ini现已生成至模组根目录中。
    echo 你需要将Reshade.ini复制到游戏进程根目录，然后才能使用本模组。
    echo\
	echo 如何找到游戏进程根目录？  
	echo 对于HoYoPlay（米哈游启动器）:点击开始启动按钮旁边的更多图标-游戏设置即可查看游戏进程根目录。  
	echo 点击'打开所在目录'即可使用资源管理器打开游戏进程根目录。  
	echo\
	echo 对于StarWard:点击开始启动按钮旁边的齿轮图标即可查看游戏进程根目录。  
	echo 点击游戏进程根目录即可使用资源管理器打开游戏进程根目录。  
	echo\
	echo 仍然不懂如何操作？你可以在模组根目录/Tutorial文件夹中查看用户协议和图文安装说明。
	echo\
    pause
	goto menu
)

:menu
title HoYoShade Starter
cls
echo 欢迎使用HoYoShade注入器！
echo\
echo 模组版本：V2.111.0 Stable
echo 开发者：DuolaDStudio X 阿向菌AXBro X Ex_M
echo\
echo 请注意，你需要将Reshade.ini复制到游戏进程根目录，然后才能使用本模组。
echo\
echo 本模组仅用于游戏画面调色使用，请遵守本Mod的用户协议和游戏及其开发/发行商相关条例。
echo 你可以在模组根目录/Tutorial文件夹中查看用户协议和图文安装说明。
echo 使用模组拍摄素材发布视频时，请备注:"该视频由GitHub@DuolaD/HoYoShade提供渲染支持"。
echo 如因特殊原因无法备注，请通过"其它选项"中的联系方式联系开发者进行说明。
echo\
echo [1]重置模组根目录中的ReShade.ini
echo [2]注入至原神（中国大陆服客户端）
echo [3]注入至原神（哔哩哔哩服客户端）
echo [4]注入至原神（国际服客户端/Epic客户端）
echo [5]注入至崩坏三(通用客户端)
echo [6]注入至崩坏：星穹铁道(通用客户端)
echo [7]注入至绝区零(通用客户端)
echo [8]其它选项
echo [9]退出程序

echo\
set /p "content=在此输入选项前面的数字："

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
    echo 输入错误。
    timeout /t 2
    goto menu
    )
exit

:other
title HoYoShade Starter
cls
echo 欢迎使用HoYoShade注入器！
echo\
echo 模组版本：V2.111.0 Stable
echo 开发者：DuolaDStudio X 阿向菌AXBro X Ex_M
echo\
echo 如果你需要检查版本更新，可以去访问我们的仓库查看是否有发行更新版本
echo 开发者选项仅用于调试/检测错误需要，除非开发者明确要求你这样做，否则请勿轻易使用
echo\
echo 注：CYteam下载站除了提供本模组的镜像下载之外，还在中国大陆地区提供免费的国际服原神/崩铁/HoYoLAB安装包和私服资源。
echo 除此之外，CYteam还提供一些安卓的搞机资源。感兴趣的可以去看一看~
echo 感谢CYteam提供的下载站服务
echo\
echo [1]访问我们的GitHub仓库
echo [2]访问由CYteam提供的下载站服务
echo [3]赞助本Mod（支持微信和支付宝）
echo [4]加入我们模组的官方QQ群
echo [5]加入我和CYTeam的资源QQ群
echo [6]关于HoYoShade
echo [7]开发者选项
echo [8]返回主介面
echo [9]退出程序

echo\
set /p "content=在此输入选项前面的数字："

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
    echo 输入错误。
    timeout /t 2
    goto other
)
goto other

:develop
title HoYoShade Starter(你已进入开发者选项！！！)
cls
echo 欢迎使用HoYoShade注入器！
echo\
echo 模组版本：V2.111.0 Stable
echo 开发者：DuolaDStudio X 阿向菌AXBro X Ex_M
echo\
echo 注意！开发者选项仅用于调试/检测错误需要，除非开发者明确要求你这样做，否则请勿轻易使用！
echo\
echo [1]自定义注入
echo [2]返回主界面
echo [3]返回其它选项
echo [4]退出程序

echo\
set /p "content=在此输入选项前面的数字："

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
    echo 输入错误。
    timeout /t 2
    goto develop
)
goto develop@echo off


:BiliBili_Warning
title HoYoShade Starter(哔哩哔哩客户端启动前警告！)
cls
echo 欢迎使用HoYoShade注入器！
echo\
echo 模组版本：V2.111.0 Stable
echo 开发者：DuolaDStudio X 阿向菌AXBro X Ex_M
echo\
echo 注意！！！
echo 由于哔哩哔哩客户端使用的是外置软件登录游戏账号
echo 而并非类似官服/国际服/Epic客户端的游戏内登录游戏账号
echo 因此，请先确保游戏已成功登录游戏账号后再按'Home'键打开Reshade控制台进行后续操作
echo\
echo 如果你在游戏没有成功登录游戏账户前打开Reshade控制台，游戏在弹出登录窗口后会卡死
echo 如果你不小心没有注意到这点并发生了这种情况，只需打开任务管理器关闭游戏和与游戏相关的进程
echo 然后重新启动本模组注入器至等待注入游戏界面，并重新使用官方启动器打开游戏即可。
timeout /t 5
pause
goto YuanShen_inject

:YuanShen_inject
powershell -command Start-Process -FilePath inject.exe YuanShen.exe -Verb RunAs
exit

:customize_inject
title HoYoShade Starter(你已进入自定义注入界面！！！)
cls
echo 欢迎使用HoYoShade注入器！
echo\
echo 模组版本：V2.111.0 Stable
echo 开发者：DuolaDStudio X 阿向菌AXBro X Ex_M
echo\
echo 注意！此功能仅供开发者测试新游戏使用。这意味着可能会存在未知风险/Bug。
echo 除非你是二次开发者/你受开发者指导，否则请不要擅自使用此功能注入本Reshade至其它游戏内。
echo\
echo 使用方法：输入目标程序文件名即可，无需添加'.exe'后缀，按回车确定。
echo 等待注入窗口界面弹出后启动目标程序即可。
echo 输入'/exit'即可返回开发界面。
echo\
set /p "content=在此输入："
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
echo 使ReShade支持米哈游旗下所有可在PC端运行的游戏。
echo 然后，彼此成就，彼此闪耀。
echo\
echo DuolaDStudio X 阿向菌AXBro x Ex_M
echo 联合巨献
echo\
echo 模组版本：V2.111.0 Stable
echo\
echo HoYoShade基于ReShade官方元件和OpenHoYoShade框架二次开发，除效果库/预设之外的所有文件均遵守BSL-3开源协议在GitHub上开源。
echo 你可以在Reshade.me网站中查看ReShade官方资讯。
echo Modify By DuolaDStudio Hong Kong Ltd,All rights reserved.
echo\
echo 请注意：HoYoShade为免费开源Mod，ReShade为免费开源插件，OpenHoYoShade为免费开源框架。
echo 所有源码都可以在GitHub上获取，如果你是付费购买了未经修改/二次开发的(Open)HoYoShade
echo 请立即退款！商家行为和所有开发者无关！
echo\
echo 详细开发名单：
echo -DuolaDStudio Hong Kong Ltd.
echo   ——哆啦D梦DuolaD[RE适配器/大版本更新开发/注入器/预设]
echo   ——琳妮特LynetteNotFound[HoYoShade小版本更新开发/维护]
echo -Ex_M[技术支援/指导/GUI制作]
echo -阿向菌AXBro[付费效果库/宣传/面向技术支持]
echo\
echo 鸣谢：
echo -CYTeam[HoYoShade合作伙伴/微软企业储存计划提供/动态转静态连结解决方案]
echo -Cloudflare, Inc.[网域托管与管理]
echo -Aira2[非强制版本检测器检测与下载]
echo\
echo 感谢有你！HoYoShade明天会更好！
pause
goto other

:ini_Reset
title HoYoShade Starter
cls
echo 欢迎使用HoYoShade注入器！
echo\
echo 模组版本：V2.111.0 Stable
echo 开发者：DuolaDStudio X 阿向菌AXBro X Ex_M
echo\
echo 请注意：你只需要在模组目录移动后才需要重置ReShade.ini
echo 除此之外，一般情况下你都不需要进行重置操作。
echo\
echo 重置完毕后，你需要重新复制ReShade.ini至游戏进程根目录
echo 是否继续重置操作？
echo\
echo [1]是
echo [2]否(返回注入器主菜单)
echo\
set /p "content=在此输入选项前面的数字："

if "%content%" == "1" (
    start "" /wait ".\InjectResource\INIBuild.exe"
    start "" "convert_encoding.bat"
	:File_Reset
	cls
	echo 欢迎使用HoYoShade注入器！
	echo\
	echo 模组版本：V2.111.0 Stable
	echo 开发者：DuolaDStudio X 阿向菌AXBro X Ex_M
	echo\
    echo 重置成功！重置后的ReShade.ini现已替换模组根目录中的旧版ReShade.ini。
    echo 你需要将重置后的ReShade.ini替换游戏进程根目录原有的ReShade.ini，然后才能使用本模组。
    echo\
	echo 如何找到游戏进程根目录？  
	echo 对于HoYoPlay（米哈游启动器）:点击开始启动按钮旁边的更多图标-游戏设置即可查看游戏进程根目录。  
	echo 点击'打开所在目录'即可使用资源管理器打开游戏进程根目录。  
	echo\
	echo 对于StarWard:点击开始启动按钮旁边的齿轮图标即可查看游戏进程根目录。  
	echo 点击游戏进程根目录即可使用资源管理器打开游戏进程根目录。  
	echo\
	echo 仍然不懂如何操作？你可以在模组根目录/Tutorial文件夹中查看用户协议和图文安装说明。
	echo\
    pause
	goto menu
) else if "%content%" == "2" (
    goto menu
) else (
    echo\
    echo 输入错误。
    timeout /t 2
    goto ini_Reset
)