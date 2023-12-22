<div align="center">
  <h1 class="header">HoYoShade</h1>
  <h3>
    登峰造极，终抵银河。
  </h3>
</div>

  ![Compressed](Readme.md-image/compressed-with-watermark.jpg)

EN|简体中文|繁體中文

## 〢 Directory

- [介绍](#〢-介绍)
- [警告](#〢-警告)  
- [来源](#〢-来源)
- [如何安装?](#〢-如何安装?)
- [推荐游戏图像设置](#〢-推荐游戏图像设置)
- [截图展示](#〢-截图展示)
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
> 如果你在官方服务器的HoYoVerse游戏上运行HoYoShade，那么对于可能会发生的任何后果，HoYoShade仓库的所有贡献者及其所有基于HoYoShade二次开发的贡献者均不会为任何人承担任何责任。

## 〢 来源

| 名字 | 介绍 | 网址 |
| --- | --- | --- |
| **ReShade官方** | HoYoShade会保证最新发行版中的ReShade总是和ReShade最新版本保持一致 | [官方仓库](https://github.com/crosire/reshade),[官方网站](https://reshade.me/) |
| **Crosire的ReShade注入器** | 这只是一个注入器 | [前往ReShade官方仓库查看源码](https://github.com/crosire/reshade/blob/main/tools/injector.cpp) |
| **全部来自Pascal Gilcher的付费ReShade效果库** | 免费提供在所有HoYoShade V2.X.X版本(无论是否赞助) | [查看他的Patreon页面](https://www.patreon.com/mcflypg/posts) |

## 〢 How to install?

Old:
Download this mod on [GitHub release page.](https://gitee.com/DuolaD/HoYoShade/releases) or [Gitee release page.](https://github.com/DuolaD/HoYoShade/releases).  
unzip it.  
Follow the tutorial in the zip.  

New:(Still waiting for the GUI to be built completely.)

## 〢 Recommended Graphics settings for game

> [!NOTE]
> The recommended graphics settings here are based on Genshin Impact as a reference. You can use these recommended graphics settings to modify the graphics settings of other HoYoVerse games, or you can also choose to customize the graphics settings yourself.

> [!NOTE]
> If your graphics card performance is lower than the NVIDIA GTX series level, then it is not recommended for you to use HoYoShade and FPS unlock.

| Settings| A graphics card with lower performance than the NVIDIA GTX series | The NVIDIA GTX series or other graphics cards of the same level | The NVIDIA RTX series or other graphics cards of the same level |
| --------------------------- | --------------------------------- |------------------------------------ |:------------------------------------ |
| **Display Mode** | 1920x1080 (or higher) | 1920x1080 (or higher) | 1920x1080 (or higher) |
| **Brightness** | Default(You can choose to decrease the brightness by two to three points.)| Default(You can choose to decrease the brightness by two to three points.) | Default(You can choose to decrease the brightness by two to three points.)| Default(You can choose to decrease the brightness by two to three points.)|
| **FPS** | 60 | 60 | 60 (Use FPS Unlocker or another similar Mod can get more FPS) |
| **V-Sync** | OFF(If there is a tearing feeling in the picture, please enable this option.)| OFF(If there is a tearing feeling in the picture, please enable this option.) | OFF(If there is a tearing feeling in the picture, please enable this option.)|
| **Render Resolution** | 0.6~1.0 | 0.6~1.1 | 1.5 (Set 1.1 or 1.0 if your game FPS can not be stable at 60 after set 1.5)|
| **Shadow Quality** | Lowest or Low | Medium | High |
| **Visual Effects** | Lowest or Low | Medium | High |
| **SFX Quality** | Lowest or Low | Medium | High |
| **Environment Detail** | Lowest or Low | Medium or High | High or Highest |
| **Anti-Aliasing** | OFF or FSR 2 | FSR 2 | SMAA/FXAA (Use FSR 2 if you have low FPS) |
| **Volumetric Fog** | OFF | On(You can choose switch OFF) | On |
| **Reflections** | OFF | On(You can choose switch OFF) | On |
| **Motion Blur** | OFF or Low| Low or High | High or Extreme |
| **Bloom** | On(You can choose switch OFF) | On(You can choose switch OFF) | On(You can choose switch OFF) |
| **Crowd Density** | Low | Low or High | High |
| **Co-Op Teammates Effects** | OFF | On | On |
| **Subsurface Scattering** | OFF | Medium or High | High |
| **Anisotropic Filtering** | 16x | 16x | 16x |

> [!Warning]
> Do not change FPS settings in the game if you are using FPS unlock.

## 〢 Screenshots
<div align="center">
  <h1 class="header">Shot by [Youtube@AXBro阿向菌](https://www.youtube.com/@AXBroCN)</h1>
</div>

<div id="images">
  <img src="Readme.md-image/AXBro-1.jpg" alt="Screenshot1">
  <img src="Readme.md-image/AXBro-2.jpg" alt="Screenshot2">
  <img src="Readme.md-image/AXBro-3.jpg" alt="Screenshot3">
</div>

## 〢 Contributors
Thank you to all the collaborators for their dedication to the project!

<div align="center">
    <h3>哆啦D夢|DuolaD</h3>
	<a href="https://github.com/DuolaD">
		<img src="https://avatars.githubusercontent.com/u/110040721?v=4" width="70" style="border-radius: 50%" alt="DuolaD">
	</a>
    <be>
    <h3>阿向菌|AXBro</h3>
	<a href="https://www.youtube.com/@AXBroCN">
		<img src="Readme.md-image/AXBro-Logo.jpg" width="70" style="border-radius: 50%" alt="DuolaD">
	</a>
    <be>
    <h3>REL</h3>
	<a href="https://github.com/34736384">
		<img src="Readme.md-image/REL-Logo.jpg" width="70" style="border-radius: 50%" alt="DuolaD">
	</a>
    <be>
</div>
