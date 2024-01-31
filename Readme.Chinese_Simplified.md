<div align="center">
  <h1 class="header">HoYoShade</h1>
  <h3>
    登峰造极，终抵银河。
  </h3>
</div>

  ![Compressed](Readme.md-image/compressed-with-watermark.jpg)

[EN](Readme.md)|**简体中文**|[繁體中文](Readme.Chinese_Traditional.md)  

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
从[本仓库的发行页面](https://github.com/DuolaD/HoYoShade/releases/) 下载最新版本的HoYoShade.  
解压后按照zip压缩包内的教程操作即可  

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
  <h1 class="header">截图来自[YouTube@AXBro阿向菌](https://www.youtube.com/@AXBroCN)</h1>
</div>

<div id="images">
  <img src="Readme.md-image/AXBro-1.jpg" alt="Screenshot1">
  <img src="Readme.md-image/AXBro-2.jpg" alt="Screenshot2">
  <img src="Readme.md-image/AXBro-3.jpg" alt="Screenshot3">
</div>

## 〢 赞助

 **点击对应按钮来赞助HoYoShade**  
赞助的金额由你自行设定。

<div align="center"><p><span ><a href="https://patreon.com/DuolaD"><img src="https://img.shields.io/badge/Patreon-000000.svg?logo=patreon" /></a> <a href="https://afdian.net/a/DuolaD"><img src="https://img.shields.io/badge/爱发电-a47ef7.svg?logo=data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3NzcwN//AABEIACAAIAMBIgACEQEDEQH/xAAZAAEBAAMBAAAAAAAAAAAAAAAFBAEDBgD/xAAqEAACAQIFAQcFAAAAAAAAAAABAgMABAUREiExcRMUIjJBYcEGQlGx8P/EABYBAQEBAAAAAAAAAAAAAAAAAAEDBv/EABsRAAMAAgMAAAAAAAAAAAAAAAABAhEhAxJB/9oADAMBAAIRAxEAPwBq2hnunKW8TyMNzpHHWsXMU1rM0NwhSReVPpW7CMYbDw6ZNodg2pMtSkexBB/uKVVJbq2a+hntEhJOclzZRrv1ANaKuSpra0Wyc/rr2uq5sQt2mMc0MNxDx2scIhfqMvmpb6Hu0oCv2kTqHjfLLUp+eR1FUVZ00IfrpbGXdFjjRD3HSptmU+Hjc+7fnPegtdUWuI3VoCLa4kjVvMoOx6jg01LbTQm2GJ7iSOK1V5ZXG6heDn+sst6U+oY7SGO1S0ukl7FTEUVg33Fs8x7sfQcUVNjF9NGYnuXEbeZE8IPUDmo9dHWnSb8DB//Z" /></a> <a href="https://www.paypal.com/paypalme/Dmou114514233"><img src="https://img.shields.io/badge/PayPal-003087.svg?logo=paypal" /></a> <a href="WechatDonateCode.JPG"><img src="https://img.shields.io/badge/微信支付-07C160.svg?logo=wechat&logoColor=white" /></a> <a href="AirPayDonateCode.png"><img src="https://img.shields.io/badge/支付宝-1677FF.svg?logo=alipay&logoColor=white" /> </span></p></a></div>

## 〢 联系我

> [!NOTE]
> 如果你处于中国大陆地区，则某些联系方式可能不可用。结尾带星号标识'*'的联系方式可以保证在中国大陆地区使用，并且可以获得更快速的响应和支持。

> [!NOTE]
> 如果你在使用此模组时有任何的问题，请先在本仓库创建一个issue。

 **点击对应按钮来联系我：**

<div align="center"><p><span ><a href="https://www.hoyolab.com/accountCenter/postList?id=192633110"><img src="https://img.shields.io/badge/HoYoLAB-可用-6680ff.svg?logo=data:image/png;base64,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" /></a> <a href="https://www.miyoushe.com"><img src="https://img.shields.io/badge/米游社-由于无法完成中国大陆地区实名验证,暂不可用-blue.svg?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAACZElEQVR4AY2Rg5JdURBFp1IIiylX/ibFfEBs27Zt27ZtjM3nsT1zfe85O7tjZ7pqPRysPt2dNCQEoRvpR/qTqWQHuTY4hA/TYggfzXfrT70yzBNptpoSg+J6NfeXk15yuQ9ZQopJ+6AQAh4Af2NoGNhe5ONWqolEnY8T70zMjQE8I/udZJgIphBbLo2MAAuiGrOJCMZEgYPpNsrqfViuxplkE3O+C4QzIngsl8dFmC3fw5EXBvan2hjHy+PJYf6ubA7QamucS7F+FbwUQbEI1hQHuMGnljPbkfcWJvOySA5RkF4VILlJ4xIFC2L6R0GuCCqHMfuWbBdZMRcGMx3/YGEaL4/i+v4MB28THh7X8gXvTSyO/iSIi6BRBFtzXKREXEQ6WOsHNksOhoGdbOKZtyYOk5v5DlaVAcPCwJdG14qgY0iYggIfj3jgeRNwnoKVUYVZMeBIyMclZr741mAJJo6yvJ0lvjRcBK1JXyewLhTgZoaFc8XMyHFdLXZxhFnvca2g3ENda4B2U6GqycfpNwZWRpSUYorA5w/Mj7F2XrzI7NLMB5kWGtoCaEhAxgjT0ZDIibvYk2xjShyeCBSRurCnQuN2lo33JQ4ChZ8ii5cuvTMg4fkaF5hsT4mvRABBytgiZTC7UkBzp5Ks+BrtlkIam6y+LCU47sPPO/HtBUPDwI4CD28KbEjcZwlPcm38LTRJDjlaBHUEg8PA5pIAj7ItSNSz/uJKD/8KpdEsguWkRRq5jI2UJjqeRhfCU8BuEfQgAyjYNyuOB0ffmckcWRGAMg00kA7ikODr62VdAVvYor4fAfPaaUne+8MNAAAAAElFTkSuQmCC" /> </span></p></a>
  
<div align="center"><p><span ><a href="https://discordapp.com/users/960705009866137631"><img src="https://img.shields.io/badge/Discord-可用-5865F2.svg?logo=discord" /></a> <a href="https://v.kuaishou.com/iO8N0r"><img src="https://img.shields.io/badge/快手*-可用-ff4906.svg?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAD/klEQVR4AbyWA+wkTRTE97Nt27Ztnm3btm3btm3btm39tfjdVF6Syd0is6dK3qIzPVWP3T5B4O/bb+av279xrK9j+xzzO8Y1Mj/2zr7iEJfPYHAW73CspGMHtOE6mzhKitPI/7njJmwhIebGP2517Bb450749x746zb4/Wb487b4RRhXSXHL+28d2x9zg0jyvwPdK8PsIbB4PEzoAvUzQtqHJQ73WRNqazHF7Re3BPSJSf73HdA0FxzcThhSkmDBKMj7pkVD0cnxMhT7FPK9Danul5hYIvpIwN6YYa+XEc6eBOH4AZg1GMZ2hLVzTICwfAqU+xHGdXKE7oBzJ+3ZJROg2t/w1x3RBOyVAH/UsGd+BjYvBWHLMij1Nfx9p4VZoe9WERLPQzAAZ45BKAQ45k+GYBCE08564xzRasXvi6LMQlozFaQkQ+I5qP4v/HbTpQL/vRum9wNwyfrXgyp/QquCsGMNAvu2QN633FpxjdgCOpdDYOdayPhkuBe/3wRNc5vnoaBFRCTa+5sPynwHJw8j0L64rV9zAc1yA1gKCn94adH9dy+smIbAyDZKXRjPtUvBhTNQ9nvXS5GlewQ2LUZgcBOJ8y4griI0wMyB2qM0mPedykByojlRN318KfDehiE4tl8k1g2bl8D4zjasEs4BWDume1ROeRfgeRDNHwXFP4cRrdxoGEzQyhlQ4D23A7wJ8DCKx3WGOukg1QPwqw/+uQuq/gWj28GC0TCtD7QqAJmecsnjEqCCUc707R5GqgEjy/oclPsBavwHNf+372r/6FvCrGgLvGvP/hmvAJGoh5vnhaKfojSYkNvshVpXayYnKMyRLZACp47ApO6Q4yWJ8ChARLXT2GbhxCELa9FPlAqNVWs5sGf2bYa9l9smOLTTPSvmjYyzCCd2A9CEM7MOUHWb56A8m6gsz0Y2ed2hJJw/A/4UaJDZaxveATP6g7BsMnQpB1uXQyAABkXAUvSbT15FNtWM0qXjWhjWXGseBUzv704vkcgjzfIdqxE031VgMarbnYY6okGzQ8LiFDC0qWrCXvSLDyr9BkkJN1DAkKaa//ai3K/ByNaq8BsgQDVgm4y4dw3Yv9UtyNPhJ1/UATalF4I6yftpOK0vdsQet3bSWS9y/T5/yv73qqbTUFGIbrobSjjoYIraBf6wOaCRa97q217SuybkeQOGtwQh4awqXGkJN50LujVrHoBmgy6pEhXxSrY3LGy6fAxqCEsnQa/qkPt1hc88yPKMHbv+ZDxB4jWqI0/CvZGu5W6x/HePbXQ3u3cBDZZRbWByz8g2oavdFy4uRQdf52UhUR0TTAfCekUsBNSAOyh4OyYYXTP6YETXbMA7pwPePQcAdZmNkkx/udgAAAAASUVORK5CYII=" /></a> <a href="https://www.douyin.com/user/MS4wLjABAAAAGUohNGixQiCHKSoHJy0Ae6WS3R7pMd7lSfi5O4A9zH7gdcEd4JEX787i-RFNH257"><img src="https://img.shields.io/badge/抖音*-可用-000000.svg?logo=tiktok" /></a> <a href="https://t.me/D_mou"><img src="https://img.shields.io/badge/Telegram-可用-26A5E4.svg?logo=telegram" /></a> <a href="mailto:D_mou@outlook.com"><img src="https://img.shields.io/badge/Email*-可用-0078D4.svg?logo=microsoftoutlook" /></a> <a href="https://qm.qq.com/q/njKy8OrUU8"><img src="https://img.shields.io/badge/QQ*-可用-EB1923.svg?logo=tencentqq" /></span></p></a>

<div align="left">

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
		<a href="https://www.hoyolab.com/accountCenter/postList?id=368916437">HoYoLAB个人主页</a><br>
		<a href="https://www.youtube.com/@AXBroCN">YouTube频道</a><br>
                <a href="https://www.tiktok.com/@axbrocn?_r=1&_d=eaij8279i83mcl&sec_uid=MS4wLjABAAAAv9yK1VQOks5sB_wbFyXogwDO909TuxhAZ-e-qnpFlMiZ1B4FTIGrh9jdg5KTsuMr&share_author_id=7293608271650030634&sharer_language=en&source=h5_m&u_code=eaij8b3012e2l5&ug_btm=b8727%2Cb0&sec_user_id=MS4wLjABAAAAv9yK1VQOks5sB_wbFyXogwDO909TuxhAZ-e-qnpFlMiZ1B4FTIGrh9jdg5KTsuMr&utm_source=copy&social_share_type=4&utm_campaign=client_share&utm_medium=ios&tt_from=copy&user_id=7293608271650030634&share_link_id=9E0D9FA7-E376-4EAA-B1A1-21F25EE8A746&share_app_id=1233">TikTok频道</a><br>
		<a href="https://space.bilibili.com/436127696">BiliBili频道</a>
            </td>
        </tr>
        <tr>
            <td>
                <h3>REL(Ex_M)</h3>
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
