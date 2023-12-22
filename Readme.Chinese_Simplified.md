<div align="center">
  <h1 class="header">HoYoShade</h1>
  <h3>
    登峰造极，终抵银河。
  </h3>
</div>

  ![Compressed](Readme.md-image/compressed-with-watermark.jpg)

[EN](Readme.md)|**简体中文**|[繁體中文](Readme.Chinese_Traditional.md)  
[GitHub](https://github.com/DuolaD/HoYoShade)|[Gitee](https://gitee.com/DuolaD/HoYoShade)  

## 〢 目录

- [介绍](#〢-介绍)
- [警告](#〢-警告)  
- [来源](#〢-来源)
- [如何安装?](#〢-如何安装?)
- [推荐游戏图像设置](#〢-推荐游戏图像设置)
- [截图展示](#〢-截图展示)
- [赞助](#〢-赞助)
- [联系我](#〢-联系我)
- [贡献者](#〢-贡献者)

## 〢 介绍

这是一个非官方Reshade，使其能在突破米哈游对于官方Reshade的封锁下正常用于所有可在PC端运行的米哈游游戏。

ReShade的工作原理是拦截CPU和GPU之间的通信，并修改渲染信息以达到提高图像质量的目的。HoYoShade集成了一些基于官方ReShade的开源项目(具体列表请查看[来源页面](#〢-来源))并对其进行修改，使其与PC上所有的米哈游游戏兼容，并制作一些有针对性的预设。未来，它将支持更多的米哈游游戏。

有关本仓库贡献者的信息，请访问[贡献者界面](#〢-贡献者)

## 〢 警告

> [!Warning]
> 中国大陆服原神由于对接了腾讯的反作弊系统，并且针对性加强了对于模组识别。所以任何模组及外挂均有更大可能被米哈游识别，这也意味着你的账号更有可能会被封禁或导致其它严重后果。没有任何模组和外挂可以保证你的游戏账号可以绝对安全。HoYoShade虽然可以运行在官方服务器的米哈游游戏上，但并不保证你的你的游戏账号绝对安全。

> [!Warning]
> 在你将游戏内容发送至其它任何人或者进行直播之前，HoYoShade建议你先使用其它Mod隐藏游戏UID和用户信息，并且不要将HoYoShade及其它模组界面展示给其它任何人。

> [!NOTE]
> HoYoShade建议你将你的显卡和芯片组驱动更新至最新版本（如果可用），以获得来自你设备制造商的最新支持以尽可能减少与图形相关的问题，降低游戏崩溃的几率，并获得来自设备制造商的最新支持。

> [!NOTE]
> 如果你在官方服务器的米哈游游戏上运行HoYoShade，那么对于可能会发生的任何后果，HoYoShade仓库的所有贡献者及其所有基于HoYoShade二次开发的贡献者均不会承担任何责任。

## 〢 来源

| 名字 | 介绍 | 网址 |
| --- | --- | --- |
| **ReShade官方** | HoYoShade会保证最新发行版中的ReShade总是和ReShade最新版本保持一致 | [官方仓库](https://github.com/crosire/reshade),[官方网站](https://reshade.me/) |
| **Crosire的ReShade注入器** | 这只是一个注入器 | [前往ReShade官方仓库查看源码](https://github.com/crosire/reshade/blob/main/tools/injector.cpp) |
| **全部来自Pascal Gilcher的付费ReShade效果库** | 免费提供在所有HoYoShade V2.X.X版本(无论是否赞助) | [查看他的Patreon页面](https://www.patreon.com/mcflypg/posts) |

## 〢 如何安装?

旧版本:
从[本仓库的GitHub发行页面](https://github.com/DuolaD/Reshade_For_HoyoVerse_Games/releases/tag/Publish)或者从[本仓库的Gitee发行界面](https://gitee.com/DuolaD/HoYoShade/releases)下载最新的zip包并解压或者从 
然后按照zip压缩包内的教程操作即可  

New:(等待GUI开发完成)

## 〢 推荐游戏图像设置

> [!NOTE]
> 这里推荐的图像设置是基于《原神》作为参考的。您可以使用这些推荐的图形设置来修改其他米哈游游戏的图像设置，或者您也可以选择自定义图像设置。

> [!NOTE]
> 如果您的显卡性能低于NVIDIA GTX系列水平，则不建议您使用HoYoShade和FPS解锁。

| 设置 | 比NVIDIA GTX系列性能低的显卡 | 英伟达GTX系列或其他同等级别的显卡 | 英伟达RTX系列或其他同等级别的显卡 |
| --------------------------- | --------------------------------- |------------------------------------ |:------------------------------------ |
| **分辨率** | 1920x1080 (或更高) | 1920x1080 (或更高) | 1920x1080 (或更高) |
| **亮度** | 默认值（您可以选择将亮度减少两到三个点） | 默认值（您可以选择将亮度减少两到三个点） | 默认值（您可以选择将亮度减少两到三个点）| 默认值（您可以选择将亮度减少两到三个点）|
| **帧率** | 60 | 60 | 60 (使用FPS解锁器或其它类似的模组可以获得更高的帧率) |
| **垂直同步** | 关闭（如果画面有撕裂感，请启用此选项） | 关闭（如果画面有撕裂感，请启用此选项） | 关闭（如果画面有撕裂感，请启用此选项）|
| **渲染精度** | 0.6~1.0 | 0.6~1.1 | 1.5 (如果您的游戏帧率在设置为1.5后无法稳定在60，请将其设置为1.1或1.0) |
| **阴影质量** | 极低 或 低 | 中 | 高 |
| **后期效果** | 极低 或 低 | 中 | 高 |
| **特效质量** | 极低 或 低 | 中 | 高 |
| **场景细节** | 极低 或 低 | 中 或 高 | 高 或 极高 |
| **抗锯齿** | 关闭 or FSR 2 | FSR 2 | SMAA/FXAA (如果您的帧率在选择SMAA/FXAA后偏低，请使用 FSR 2) |
| **体积雾** | 关闭 | 开启(你可以选择关闭) | 开启 |
| **反射** | 关闭 | 开启(你可以选择关闭) | 开启 |
| **动态模糊** | 关闭 或 低 | 低 或 高 | 高 或 非常高 |
| **Bloom** | 开启(你可以选择关闭) | 开启(你可以选择关闭) | 开启(你可以选择关闭) |
| **人群密度** | 低 | 低 或 高 | 高 |
| **多人游戏队友特效** | 完全屏蔽 | 打开 | 打开 |
| **次表面散射** | 关闭 | 中 或 高 | 高 |
| **各向异性采样** | 16x | 16x | 16x |

> [!Warning]
> 不要在使用FPS解锁器的情况下更改游戏中的帧率设置

## 〢 截图展示
<div align="center">
  <h1 class="header">截图来自[Youtube@AXBro阿向菌](https://www.youtube.com/@AXBroCN)</h1>
</div>

<div id="images">
  <img src="Readme.md-image/AXBro-1.jpg" alt="Screenshot1">
  <img src="Readme.md-image/AXBro-2.jpg" alt="Screenshot2">
  <img src="Readme.md-image/AXBro-3.jpg" alt="Screenshot3">
</div>

## 〢 赞助
如果你可以使用微信支付/支付宝，你可以使用微信扫描这个二维码对我进行赞助。
如果你可以使用PayPal，你可以[点击链接](https://www.paypal.com/paypalme/Dmou114514233)进行赞助。  
如果你想长期赞助HoYoShade，你可以去查看[Patreon页面(海外)](https://patreon.com/duolad)或者[爱发电页面(中国大陆地区)](https://afdian.net/a/DuolaD)

赞助的金额由你自行设定。

![WechatDonateCode](Readme.md-image/WechatDonateCode.JPG)  
![AirPayDonateCode](Readme.md-image/AirPayDonateCode.png) 

## 〢 联系我

> [!NOTE]
> 如果你处于中国大陆地区，则某些联系方式可能不可用。结尾带星号标识'*'的联系方式可以保证在中国大陆地区使用，并且可以获得更快速的响应和支持。

> [!NOTE]
> 如果你在使用此模组时有任何的问题，请先在本仓库创建一个issue。

我的邮箱地址* : D_mou@outlook.com  
[点我即可添加HoYoShade在腾讯QQ中的官方群组*](http://qm.qq.com/cgi-bin/qm/qr?_wv=1027&k=yECCeLBMXBEl1t8MEyCPPVenwC6xPiDz&authKey=75cidtiq9%2Fmy6kstaP1AbnZ%2BUQEm9ZZ3WHZG5hdGFDeWfI%2F%2FfrviZpB4T%2F1q6bCE&noverify=0&group_code=377103253)  
在腾讯QQ中搜索QQ此代码来添加好友，以此和我交流(注明来意)*:3484767759  
[点我即可在Telegram上和我交流(注明来意)](https://t.me/D_mou)  
[点我即可关注我的HoYoLAB(国际米游社)账号](https://www.hoyolab.com/accountCenter/postList?id=192633110). 

## 〢 贡献者
感谢所有贡献者对本项目的奉献！

<div align="center">
    <table>
        <tr>
            <td>
                <h3>哆啦D夢|DuolaD</h3>
                <a href="https://github.com/DuolaD">
                    <img src="https://avatars.githubusercontent.com/u/110040721?v=4" width="70" style="border-radius: 50%" alt="DuolaD">
                </a>
            </td>
            <td>
                <a href="https://github.com/DuolaD">GitHub个人主页</a><br>
		<a href="https://www.hoyolab.com/accountCenter/postList?id=192633110">HoYoLAB个人主页</a><br>
		<a href="https://www.youtube.com/@DuolaD_HK">YouTube频道</a>
            </td>
        </tr>
        <tr>
            <td>
                <h3>阿向菌|AXBro</h3>
                <a href="https://www.youtube.com/@AXBroCN">
                    <img src="Readme.md-image/AXBro-Logo.jpg" width="70" style="border-radius: 50%" alt="AXBro">
                </a>
            </td>
            <td>
                <a href="https://www.youtube.com/@AXBroCN">YouTube频道</a><br>
		<a href="https://space.bilibili.com/436127696">BiliBili频道</a>
            </td>
        </tr>
        <tr>
            <td>
                <h3>REL</h3>
                <a href="https://github.com/34736384">
                    <img src="Readme.md-image/REL-Logo.jpg" width="70" style="border-radius: 50%" alt="REL">
                </a>
            </td>
            <td>
                <a href="https://github.com/34736384">GitHub个人主页</a><br>
		<a href="https://space.bilibili.com/44434084?spm_id_from=333.337.0.0">BiliBili频道</a>
            </td>
        </tr>
    </table>
</div>
