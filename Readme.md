<div align="center">
  <h1 class="header">HoYoShade</h1>
  <h3>
    Reaching the peak of perfection together to see the Milky Way.
  </h3>
</div>

  ![Compressed](Readme.md-image/compressed-with-watermark.jpg)

**EN**|[简体中文](Readme.Chinese_Simplified.md)|[繁體中文](Readme.Chinese_Traditional.md)  

## 〢 Directory

- [Introduction](#〢-Introduction)
- [Pre-Warning](#〢-Pre-Warning)
- [Support games list](#〢-Support-games-list)
- [Sources](#〢-Sources)
- [OpenHoYoShade and HoYoShade](#〢-OpenHoYoShade-and-HoYoShade)
- [How to install?](#〢-How-to-install)
- [Recommended Graphics settings for game](#〢-Recommended-Graphics-settings-for-game)
- [Screenshots](#〢-Screenshots)
- [Donate](#〢-Donate)
- [Contant Me](#〢-Contant-Me)
- [Contributors](#〢-Contributors)

## 〢 Introduction

An Unofficial ReShade For All HoYoVerse Games on PC.

The working principle of Reshade is to intercept communication between the CPU and GPU and modify image information to improve image quality. This repository's ReShade integrates some open-source projects based on the official ReShade (for the specific list please check the [Sources Page](#〢-Sources)), making it compatible with all HoYoVerse games on PC and creating some targeted presets. In the future, it will support more HoYoVerse games.

Please refer to the [Contributors Page](#〢-Contributors) for information about contributors to this repository.

## 〢 Pre-Warning

> [!Warning]
> The Genshin Impact/Yuanshen game in mainland China has strengthened its identification of mods and cheats by connecting to Tencent's anti-cheating system. This means that any mods or cheats are more likely to be identified by HoYoVerse,
and consequently, your account is more likely to be banned or face other serious consequences. 
No mod or cheat can guarantee the absolute safety of your game account. 
Although HoYoShade can run on the official servers of HoYoVerse games,
it does not guarantee the absolute safety of your game account.If you are worried that your game account will be banned, please consider setting up a private server.

> [!Warning]
> Before sharing game content with anyone else or streaming, HoYoShade recommends using other mods to hide your game UID and user information, and not to display HoYoShade or other mod interfaces to anyone else.

> [!NOTE]
> In addition, HoYoShade recommends updating your graphics card and chipset drivers to the latest version (if available) to minimize graphics-related issues prevent game crashes, and receive the latest support from your device manufacturer.

> [!NOTE]
> Contributors to the HoYoShade repository and all contributors who have developed based on HoYoShade will not be responsible for any consequences that may occur when running HoYoShade on the official servers of HoYoVerse games.

## 〢 Support games list

> [!NOTE]
> For the Private Server player, If the corresponding client required by the private server appears in the list of supported games, that means HoYoShade can support it.

|  | Tested | Support | Version restrictions |
| --- | --- | --- | --- |
| **Genshin Impact/YuanShen(CN Server)** | Yes | Yes | Unlimited |
| **Genshin Impact/YuanShen(BiliBili Server)** | Yes | Yes*1 | Unlimited |
| **Genshin Impact/YuanShen(Global Server)** | Yes | Yes | Unlimited |
| **Genshin Impact/YuanShen(Epic Version)** | Yes | Yes | Unlimited |
| **Honkai Impact 3rd/BH3(CN Server)** | Yes | Yes | Unlimited |
| **Honkai Impact 3rd/BH3(CN Steam Server)** | Yes | Yes*2 | Unlimited |
| **Honkai Impact 3rd/BH3(Traditional Chinese Server)** | Yes | Yes | Unlimited |
| **Honkai Impact 3rd/BH3(KR Server)** | Yes | Yes*2 | Unlimited |
| **Honkai Impact 3rd/BH3(JP Steam Server)** | Yes | Yes*2 | Unlimited |
| **Honkai Impact 3rd/BH3(SEA Server)** | Yes | Yes | Unlimited |
| **Honkai Impact 3rd/BH3(Europe & Americas Servers)** | Yes | Yes | Unlimited |
| **Honkai: Star Rail(CN Server)** | Yes | Yes | Unlimited |
| **Honkai: Star Rail(Global Server)** | Yes | Yes | Unlimited |
| **Honkai: Star Rail(Epic Version)** | Yes | Yes | Unlimited |
| **Zenless Zone Zero/ZZZ(CN/OS 1st/2rd CBT)** | Yes | Yes*3 | Unlimited |

*1:Do not open Reshade control panel before game success login account.  
*2:HoYoShade Injector not support game path check.  
*3:Support will be available one week before public.  

## 〢 Sources

| Name | information | URL address |
| --- | --- | --- |
| **ReShade Official** | Always the latest Version | [Official Repository](https://github.com/crosire/reshade),[Official Website](https://reshade.me/) |
| **Crosire's DLL injector** | Just an injector | [View source code in ReShade Official Repository](https://github.com/crosire/reshade/blob/main/tools/injector.cpp) |
| **All Paid ReShade-Shaders by Pascal Gilcher** | Available for all HoYoShade V2.X.X Version for free | [View Patreon Page](https://www.patreon.com/mcflypg/posts) |

## 〢 OpenHoYoShade and HoYoShade

Since we publish V2.012.2 Stable,we start publish OpenHoYoShade with HoYoShade.  

OpenHoYoShade is the underlying basic framework of HoYoShade, which covers all the necessary files to inject ReShade into all miHoYo/HoYoverse games.  
OpenHoYoShade storage footprint is smaller than HoYoShade,  
However, OpenHoYoShade does not have a built-in ReShade effect library, presets, etc., which is suitable for secondary developers who want to redevelop HoYoShade. 

If you just want to use reshade in the MiHoYo/HoYoVerse games, download HoYoShade.  
If you want to develop your own reshade and hope it can work in the MiHoYo/HoYoVerse games, but you don't want to learn some peace of shit——  
then,check OpenHoYoShade.  

The only thing you need to do to make OpenHoYoShade work quickly is to put the effect library and presets in their respective places.  
But if you want, you can develop more, such as injector,Reshade.ini Builder, etc. even Redistribution!(Long live open source!)  
(By the way......make sure you comply with BSD-3 license when you Redistribution)

also,If you want to get the old version of the injector/more information, click on the 'Code' button in the GitHub repository and select 'Download Zip'.  

If you still can't understand what are the different between OpenHoYoShade and HoYoShade,then check the graph:  

|  | OpenHoYoShade | HoYoShade |
| --- | --- | --- |
| **ReShade** | Yes | Yes |
| **All the necessary files to inject ReShade into all miHoYo/HoYoverse games** | Yes | Yes |
| **Program source code** | Yes | No |
| **Reshade effect library(Contains Addons)** | No(Need to prepare yourself) | Yes |
| **Presets** | No(Need to prepare yourself) | Yes |
| **Who needs them?** | Secondary developer | Gamer |

## 〢 How to install

Old:
Download this mod on [release page.](https://github.com/DuolaD/HoYoShade/releases/)  
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

## 〢 Donate

 **Click the button to contact me,**  
The amount of sponsorship is up to you.  

<div align="center"><p><span ><a href="https://patreon.com/DuolaD"><img src="https://img.shields.io/badge/Patreon-000000.svg?logo=patreon" /></a> <a href="https://afdian.net/a/DuolaD"><img src="https://img.shields.io/badge/Afdian-a47ef7.svg?logo=data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3NzcwN//AABEIACAAIAMBIgACEQEDEQH/xAAZAAEBAAMBAAAAAAAAAAAAAAAFBAEDBgD/xAAqEAACAQIFAQcFAAAAAAAAAAABAgMABAUREiExcRMUIjJBYcEGQlGx8P/EABYBAQEBAAAAAAAAAAAAAAAAAAEDBv/EABsRAAMAAgMAAAAAAAAAAAAAAAABAhEhAxJB/9oADAMBAAIRAxEAPwBq2hnunKW8TyMNzpHHWsXMU1rM0NwhSReVPpW7CMYbDw6ZNodg2pMtSkexBB/uKVVJbq2a+hntEhJOclzZRrv1ANaKuSpra0Wyc/rr2uq5sQt2mMc0MNxDx2scIhfqMvmpb6Hu0oCv2kTqHjfLLUp+eR1FUVZ00IfrpbGXdFjjRD3HSptmU+Hjc+7fnPegtdUWuI3VoCLa4kjVvMoOx6jg01LbTQm2GJ7iSOK1V5ZXG6heDn+sst6U+oY7SGO1S0ukl7FTEUVg33Fs8x7sfQcUVNjF9NGYnuXEbeZE8IPUDmo9dHWnSb8DB//Z" /></a> <a href="https://www.paypal.com/paypalme/Dmou114514233"><img src="https://img.shields.io/badge/PayPal-003087.svg?logo=paypal" /></a> <a href="Readme.md-image/WechatDonateCode.JPG"><img src="https://img.shields.io/badge/Wechat_Pay-07C160.svg?logo=wechat&logoColor=white" /></a> <a href="Readme.md-image/AirPayDonateCode.png"><img src="https://img.shields.io/badge/Alipay-1677FF.svg?logo=alipay&logoColor=white" /> </span></p></a></div>



## 〢 Contant Me  

> [!NOTE]
> If you are located in mainland China, certain contact methods may not be available. Contact methods marked with an asterisk at the end '*' can ensure availability in mainland China and receive a quicker response and support.

> [!NOTE]
> If you have any questions while using this mod, please create an issue in this repository first.

 **Click the button to contact me:**

<div align="center"><p><span ><a href="https://www.hoyolab.com/accountCenter/postList?id=192633110"><img src="https://img.shields.io/badge/HoYoLAB-Available-6680ff.svg?logo=data:image/png;base64,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" /></a> <a href="https://www.miyoushe.com"><img src="https://img.shields.io/badge/米游社-Unavailable_due_to_the_temporary_unavailability_of_Mainland_China_real_name_verification_for_me-blue.svg?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAACZElEQVR4AY2Rg5JdURBFp1IIiylX/ibFfEBs27Zt27ZtjM3nsT1zfe85O7tjZ7pqPRysPt2dNCQEoRvpR/qTqWQHuTY4hA/TYggfzXfrT70yzBNptpoSg+J6NfeXk15yuQ9ZQopJ+6AQAh4Af2NoGNhe5ONWqolEnY8T70zMjQE8I/udZJgIphBbLo2MAAuiGrOJCMZEgYPpNsrqfViuxplkE3O+C4QzIngsl8dFmC3fw5EXBvan2hjHy+PJYf6ubA7QamucS7F+FbwUQbEI1hQHuMGnljPbkfcWJvOySA5RkF4VILlJ4xIFC2L6R0GuCCqHMfuWbBdZMRcGMx3/YGEaL4/i+v4MB28THh7X8gXvTSyO/iSIi6BRBFtzXKREXEQ6WOsHNksOhoGdbOKZtyYOk5v5DlaVAcPCwJdG14qgY0iYggIfj3jgeRNwnoKVUYVZMeBIyMclZr741mAJJo6yvJ0lvjRcBK1JXyewLhTgZoaFc8XMyHFdLXZxhFnvca2g3ENda4B2U6GqycfpNwZWRpSUYorA5w/Mj7F2XrzI7NLMB5kWGtoCaEhAxgjT0ZDIibvYk2xjShyeCBSRurCnQuN2lo33JQ4ChZ8ii5cuvTMg4fkaF5hsT4mvRABBytgiZTC7UkBzp5Ks+BrtlkIam6y+LCU47sPPO/HtBUPDwI4CD28KbEjcZwlPcm38LTRJDjlaBHUEg8PA5pIAj7ItSNSz/uJKD/8KpdEsguWkRRq5jI2UJjqeRhfCU8BuEfQgAyjYNyuOB0ffmckcWRGAMg00kA7ikODr62VdAVvYor4fAfPaaUne+8MNAAAAAElFTkSuQmCC" /> </span></p></a>
  
<div align="center"><p><span ><a href="https://discordapp.com/users/960705009866137631"><img src="https://img.shields.io/badge/Discord-Available-5865F2.svg?logo=discord" /></a> <a href="https://v.kuaishou.com/iO8N0r"><img src="https://img.shields.io/badge/快手*-Available-ff4906.svg?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAD/klEQVR4AbyWA+wkTRTE97Nt27Ztnm3btm3btm3btm39tfjdVF6Syd0is6dK3qIzPVWP3T5B4O/bb+av279xrK9j+xzzO8Y1Mj/2zr7iEJfPYHAW73CspGMHtOE6mzhKitPI/7njJmwhIebGP2517Bb450749x746zb4/Wb487b4RRhXSXHL+28d2x9zg0jyvwPdK8PsIbB4PEzoAvUzQtqHJQ73WRNqazHF7Re3BPSJSf73HdA0FxzcThhSkmDBKMj7pkVD0cnxMhT7FPK9Danul5hYIvpIwN6YYa+XEc6eBOH4AZg1GMZ2hLVzTICwfAqU+xHGdXKE7oBzJ+3ZJROg2t/w1x3RBOyVAH/UsGd+BjYvBWHLMij1Nfx9p4VZoe9WERLPQzAAZ45BKAQ45k+GYBCE08564xzRasXvi6LMQlozFaQkQ+I5qP4v/HbTpQL/vRum9wNwyfrXgyp/QquCsGMNAvu2QN633FpxjdgCOpdDYOdayPhkuBe/3wRNc5vnoaBFRCTa+5sPynwHJw8j0L64rV9zAc1yA1gKCn94adH9dy+smIbAyDZKXRjPtUvBhTNQ9nvXS5GlewQ2LUZgcBOJ8y4griI0wMyB2qM0mPedykByojlRN318KfDehiE4tl8k1g2bl8D4zjasEs4BWDume1ROeRfgeRDNHwXFP4cRrdxoGEzQyhlQ4D23A7wJ8DCKx3WGOukg1QPwqw/+uQuq/gWj28GC0TCtD7QqAJmecsnjEqCCUc707R5GqgEjy/oclPsBavwHNf+372r/6FvCrGgLvGvP/hmvAJGoh5vnhaKfojSYkNvshVpXayYnKMyRLZACp47ApO6Q4yWJ8ChARLXT2GbhxCELa9FPlAqNVWs5sGf2bYa9l9smOLTTPSvmjYyzCCd2A9CEM7MOUHWb56A8m6gsz0Y2ed2hJJw/A/4UaJDZaxveATP6g7BsMnQpB1uXQyAABkXAUvSbT15FNtWM0qXjWhjWXGseBUzv704vkcgjzfIdqxE031VgMarbnYY6okGzQ8LiFDC0qWrCXvSLDyr9BkkJN1DAkKaa//ai3K/ByNaq8BsgQDVgm4y4dw3Yv9UtyNPhJ1/UATalF4I6yftpOK0vdsQet3bSWS9y/T5/yv73qqbTUFGIbrobSjjoYIraBf6wOaCRa97q217SuybkeQOGtwQh4awqXGkJN50LujVrHoBmgy6pEhXxSrY3LGy6fAxqCEsnQa/qkPt1hc88yPKMHbv+ZDxB4jWqI0/CvZGu5W6x/HePbXQ3u3cBDZZRbWByz8g2oavdFy4uRQdf52UhUR0TTAfCekUsBNSAOyh4OyYYXTP6YETXbMA7pwPePQcAdZmNkkx/udgAAAAASUVORK5CYII=" /></a> <a href="https://www.douyin.com/user/MS4wLjABAAAAGUohNGixQiCHKSoHJy0Ae6WS3R7pMd7lSfi5O4A9zH7gdcEd4JEX787i-RFNH257"><img src="https://img.shields.io/badge/抖音*-Available-000000.svg?logo=tiktok" /></a> <a href="https://t.me/D_mou"><img src="https://img.shields.io/badge/Telegram-Available-26A5E4.svg?logo=telegram" /></a> <a href="mailto:D_mou@outlook.com"><img src="https://img.shields.io/badge/Email*-Available-0078D4.svg?logo=microsoftoutlook" /></a> <a href="https://qm.qq.com/q/njKy8OrUU8"><img src="https://img.shields.io/badge/QQ*-Available-EB1923.svg?logo=tencentqq" /> </span></p></a>

<div align="left">

## 〢 Contributors
Thank you to all the collaborators for their dedication to the project!

<div align="center">
    <table>
        <tr>
            <td>
                <h3>DuolaDStudio Hong Kong Ltd.</h3>
                <a href="https://github.com/DuolaDStudio">
                    <img src="https://avatars.githubusercontent.com/u/152937804?s=200&v=4" width="70" style="border-radius: 50%" alt="DuolaDStudio Hong Kong Ltd.">
                </a>
		<h3>With:</h3>
		<h5>哆啦D夢|DuolaD & 琳尼特|LynetteNotFound</h5>
		<a href="https://github.com/DuolaD"><img src="https://avatars.githubusercontent.com/u/110040721?v=4" width="70" style="border-radius: 50%" alt="DuolaD"></img></a>
		<a href="https://github.com/LynetteNotFound">
                    <img src="https://avatars.githubusercontent.com/u/159673876?v=4" width="70" style="border-radius: 50%" alt="LynetteNotFound">
                </a>
            </td>
	    <td>
                <a href="https://github.com/DuolaDStudio">Organizations GitHub Pages</a><br>
		<a href="https://github.com/DuolaD">哆啦D夢|DuolaD's GitHub Personal Pages</a><br>
		<a href="https://github.com/LynetteNotFound">琳尼特|LynetteNotFound's GitHub Personal Pages</a><br>
		<br>
		<a>Note:哆啦D夢|DuolaD's Links to other profiles pages are listed above;</a><br>
		<a>琳尼特|LynetteNotFound does not publish contact information</a>
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
		<a href="https://www.hoyolab.com/accountCenter/postList?id=368916437">HoYoLAB Personal Pages</a><br>
		<a href="https://www.youtube.com/@AXBroCN">YouTube Channel</a><br>
                <a href="https://www.tiktok.com/@axbrocn?_r=1&_d=eaij8279i83mcl&sec_uid=MS4wLjABAAAAv9yK1VQOks5sB_wbFyXogwDO909TuxhAZ-e-qnpFlMiZ1B4FTIGrh9jdg5KTsuMr&share_author_id=7293608271650030634&sharer_language=en&source=h5_m&u_code=eaij8b3012e2l5&ug_btm=b8727%2Cb0&sec_user_id=MS4wLjABAAAAv9yK1VQOks5sB_wbFyXogwDO909TuxhAZ-e-qnpFlMiZ1B4FTIGrh9jdg5KTsuMr&utm_source=copy&social_share_type=4&utm_campaign=client_share&utm_medium=ios&tt_from=copy&user_id=7293608271650030634&share_link_id=9E0D9FA7-E376-4EAA-B1A1-21F25EE8A746&share_app_id=1233">TikTok Channel</a><br>
		<a href="https://space.bilibili.com/436127696">BiliBili Channel</a>
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
                <a href="https://github.com/34736384">GitHub Personal Pages</a><br>
		<a href="https://space.bilibili.com/44434084?spm_id_from=333.337.0.0">BiliBili Channel</a>
            </td>
        </tr>
    </table>
</div>
