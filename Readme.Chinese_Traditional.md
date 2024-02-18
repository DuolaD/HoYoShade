<div align="center">
  <h1 class="header">HoYoShade</h1>
  <h3>
    登峯造極，終抵銀河。
  </h3>
</div>

  ![Compressed](Readme.md-image/compressed.jpg)

[EN](Readme.md)|[简体中文](Readme.Chinese_Simplified.md)|**繁體中文**  

> [!NOTE]
> 由於HoYoShade收到了DMCA警告，你無法再從Release介面下載低於V2.013.0 Stable版本的HoYoShade。  

## 〢 目錄

- [介紹](#〢-介紹)
- [警告](#〢-警告)
- [支持游戲列表](#〢-支持游戲列表)
- [來源](#〢-來源)
- [OpenHoYoShade和HoYoShade](#〢-OpenHoYoShade和HoYoShade)
- [如何安裝?](#〢-如何安裝)
- [推薦遊戲畫面設置](#〢-推薦遊戲畫面設置)
- [截圖展示](#〢-截圖展示)
- [關於DMCA](#〢-關於DMCA)
- [贊助](#〢-贊助)
- [聯繫我](#〢-聯繫我)
- [貢獻者](#〢-貢獻者)

## 〢 介紹

這是一個非官方Reshade，使其能在突破米哈遊對於官方Reshade的封鎖下正常用於所有可在PC端運行的米哈遊遊戲。

ReShade的工作原理是攔截CPU和GPU之間的通信，並修改渲染信息以達到提高圖像質量的目的。HoYoShade集成了一些基於官方ReShade的開源項目(具體列表請查看[來源頁面](#〢-來源))並對其進行修改，使其與PC上所有的米哈遊遊戲兼容，並製作一些有針對性的預設。未來，它將支持更多的米哈遊遊戲。

有關本倉庫貢獻者的信息，請訪問[貢獻者界面](#〢-貢獻者)

## 〢 警告

> [!Warning]
> ·中國大陸服原神由於對接了騰訊的反作弊系統，並且針對性加強了對於模組識別。所以任何模組及外掛均有更大可能被米哈遊識別，這也意味着你的賬號更有可能會被封禁或導致其它嚴重後果。沒有任何模組和外掛可以保證你的遊戲賬號可以絕對安全。HoYoShade雖然可以運行在官方服務器的米哈遊遊戲上，但並不保證你的你的遊戲賬號絕對安全。如果您擔心您的遊戲帳號會被封鎖，請考慮搭建私服。  
> ·在你將遊戲內容發送至其它任何人或者進行直播之前，HoYoShade建議你先使用其它Mod隱藏遊戲UID和用戶信息，並且不要將HoYoShade及其它模組界面展示給其它任何人。

> [!NOTE]
> ·HoYoShade建議你將你的顯卡和芯片組驅動更新至最新版本（如果可用），以獲得來自你設備製造商的最新支持以儘可能減少與圖形相關的問題，降低遊戲崩潰的幾率，並獲得來自設備製造商的最新支持。  
> ·如果你在官方服務器的米哈遊遊戲上運行HoYoShade，那麼對於可能會發生的任何後果，HoYoShade倉庫的所有貢獻者及其所有基於HoYoShade二次開發的貢獻者均不會承擔任何責任。

## 〢 支持游戲列表

> [!NOTE]
> ·對於私服玩家來說，如果私服需要的對應客戶端出現在支援的遊戲清單中，則表示HoYoShade可以提供支援。  
> ·對於未出現在支援遊戲清單中的遊戲，你可以自行嘗試選擇使用注入器中已支援的遊戲/在開發者選項中選擇自定義注入來嘗試注入HoYoShade。

| 客戶端 | 是否已測試 | 是否支持 | 是否存在游戲版本限制 |
| --- | --- | --- | --- |
| **原神/YuanShen/Genshin Impact(中國大陸服/天空島)** | 是 | 是 | 無遊戲版本限制 |
| **原神/YuanShen/Genshin Impact(嗶哩嗶哩服/世界樹)** | 是 | 是*1 | 無遊戲版本限制 |
| **原神/YuanShen/Genshin Impact(國際服)** | 是 | 是 | 無遊戲版本限制 |
| **原神/YuanShen/Genshin Impact(Epic版本)** | 是 | 是 | 無遊戲版本限制 |
| **崩壞3/BH3/Honkai Impact 3rd(中國大陸服)** | 是 | 是 | 無遊戲版本限制 |
| **崩壞3/BH3/Honkai Impact 3rd(中國大陸Steam服)** | 是 | 是*2 | 無遊戲版本限制 |
| **崩壞3/BH3/Honkai Impact 3rd(繁中服)** | 是 | 是 | 無遊戲版本限制 |
| **崩壞3/BH3/Honkai Impact 3rd(韓國服)** | 是 | 是*2 | 無遊戲版本限制 |
| **崩壞3/BH3/Honkai Impact 3rd(日本Steam服)** | 是 | 是*2 | 無遊戲版本限制 |
| **崩壞3/BH3/Honkai Impact 3rd(東南亞服)** | 是 | 是 | 無遊戲版本限制 |
| **崩壞3/BH3/Honkai Impact 3rd(歐美服)** | 是 | 是 | 無遊戲版本限制 |
| **崩壞:星穹鐵道/Honkai: Star Rail(中國大陸服)** | 是 | 是 | 無遊戲版本限制 |
| **崩壞:星穹鐵道/Honkai: Star Rail(國際服)** | 是 | 是 | 無遊戲版本限制 |
| **崩壞:星穹鐵道/Honkai: Star Rail(Epic版本)** | 是 | 是 | 無遊戲版本限制 |
| **絕區零/ZZZ/Zenless Zone Zero(中國大陸/海外 第一次/第二次公測前內測)** | 是 | 是*3 | 無遊戲版本限制 |

*1:請勿在遊戲成功登入帳號前開啟ReShade控制台  
*2:HoYoShade注入器並不支援該客戶端的遊戲進程路徑偵測  
*3:已開發完成，將在公測前一週提供注入支持  

## 〢 來源

| 名字 | 介紹 | 網址 |
| --- | --- | --- |
| **ReShade官方** | HoYoShade會保證最新發行版中的ReShade總是和ReShade最新版本保持一致 | [官方倉庫](https://github.com/crosire/reshade),[官方網站](https://reshade.me/) |
| **Crosire的ReShade注入器** | 這只是一個注入器 | [前往ReShade官方倉庫查看源碼](https://github.com/crosire/reshade/blob/main/tools/injector.cpp) |

## 〢 OpenHoYoShade和HoYoShade

我們自發行V2.012.2 Stable版本開始，會隨著HoYoShade版本更新一併發布OpenHoYoShade。  

OpenHoYoShade為HoYoShade底層基本框架，它涵蓋了使ReShade注入至全系米哈遊旗下遊戲的所有必要文件。  
OpenHoYoShade儲存佔用會比HoYoShade小,但OpenHoYoShade並沒有內建ReShade效果庫，預設等，適用於想對HoYoShade進行二次開發的二次開發者。  

如果你只是想在MiHoYo/HoYoVerse遊戲下使用ReShade，請下載HoYoShade。  
如果你想要開發一個可以在MiHoYo/HoYoVerse遊戲下使用的ReShade，但是你又不想學習過多的東西，那麼你可以選擇下載OpenHoYoShade。  

要讓 OpenHoYoShade 快速運作，您唯一需要做的就是將效果庫和預設放在各自正確的位置。  
但如果你願意，你可以進行進一步的開發，例如注入器、Reshade.ini建構器等等等等，甚至重新發行！ （開源萬歲！)  
(哦對了......當你重新發行文件時，確保你重新發行的文件遵守了BSD-3開源協議)  

當然了,如果你想要獲得舊版註入程序/更多信息，請在GitHub倉庫中點擊‘Code’按鈕，然後選擇‘Download Zip’。  

如果你還是不明白OpenHoYoShade和HoYoShade之間有什麼不同，那麼以下的圖表或許可以很好的幫助你說明：  

|  | OpenHoYoShade | HoYoShade |
| --- | --- | --- |
| **ReShade** | 有 | 有 |
| **使ReShade注入至全系米哈遊旗下遊戲的所有必要文件** | 有 | 有 |
| **程式原始碼** | 有 | 没有 |
| **Reshade的效果庫(包含插件)** | 沒有(你需要自行準備) | 有 |
| **預設** | 沒有(你需要自行準備) | 有 |
| **誰會需要他們？** | 二次開發者 | 普通遊戲玩家 |

## 〢 如何安裝

舊版本:
從[本倉庫的發行頁面](https://github.com/DuolaD/HoYoShade/releases/)下載最新的zip包並解壓。  
然後按照zip壓縮包內的教程操作即可  

New:(等待GUI開發完成)

## 〢 推薦遊戲畫面設置

> [!NOTE]
> ·這裏推薦的畫面設置是基於《原神》作爲參考的。您可以使用這些推薦的畫面設置來修改其他米哈遊遊戲的畫面設置，或者您也可以選擇自定義畫面設置。  
> ·如果您的顯卡性能低於NVIDIA GTX系列水平，則不建議您使用HoYoShade和FPS解鎖。

| 設置 | 比NVIDIA GTX系列性能低的顯卡 | 英偉達GTX系列或其他同等級別的顯卡 | 英偉達RTX系列或其他同等級別的顯卡 |
| --------------------------- | --------------------------------- |------------------------------------ |:------------------------------------ |
| **顯示模式** | 1920x1080 (或更高) | 1920x1080 (或更高) | 1920x1080 (或更高) |
| **亮度** | 默認值（您可以選擇將亮度減少兩到三個點） | 默認值（您可以選擇將亮度減少兩到三個點） | 默認值（您可以選擇將亮度減少兩到三個點）| 默認值（您可以選擇將亮度減少兩到三個點）|
| **FPS** | 60 | 60 | 60 (使用FPS解鎖器或其它類似的模組可以獲得更高的幀率) |
| **垂直同步** | 關閉（如果畫面有撕裂感，請啓用此選項） | 關閉（如果畫面有撕裂感，請啓用此選項） | 關閉（如果畫面有撕裂感，請啓用此選項）|
| **渲染精細度** | 0.6~1.0 | 0.6~1.1 | 1.5 (如果您的遊戲幀率在設置爲1.5後無法穩定在60，請將其設置爲1.1或1.0) |
| **陰影品質** | 極低 或 低 | 中 | 高 |
| **後期效果** | 極低 或 低 | 中 | 高 |
| **特效品質** | 極低 或 低 | 中 | 高 |
| **場景細節** | 極低 或 低 | 中 或 高 | 高 或 極高 |
| **反鋸齒** | 關閉 or FSR 2 | FSR 2 | SMAA/FXAA (如果您的幀率在選擇SMAA/FXAA後偏低，請使用 FSR 2) |
| **體積霧** | 關閉 | 開啓(你可以選擇關閉) | 開啓 |
| **反射** | 關閉 | 開啓(你可以選擇關閉) | 開啓 |
| **動態模糊** | 關閉 或 低 | 低 或 高 | 高 或 非常高 |
| **Bloom** | 開啓(你可以選擇關閉) | 開啓(你可以選擇關閉) | 開啓(你可以選擇關閉) |
| **人群密度** | 低 | 低 或 高 | 高 |
| **多人遊戲隊友特效** | 完全屏蔽 | 打開 | 打開 |
| **次表面散射** | 關閉 | 中 或 高 | 高 |
| **各向異性採樣** | 16x | 16x | 16x |

> [!Warning]
> 請注意，在一般情況下，大多數的FPS解鎖器會要求你不要在使用FPS解鎖器的情況下更改遊戲中的幀率設定。

## 〢 截圖展示
<div align="center">
  <h1 class="header">截圖來自[Youtube@AXBro阿向菌](https://www.youtube.com/@AXBroCN)</h1>
</div>

<div id="images">
  <img src="Readme.md-image/AXBro-1.jpg" alt="Screenshot1">
  <img src="Readme.md-image/AXBro-2.jpg" alt="Screenshot2">
  <img src="Readme.md-image/AXBro-3.jpg" alt="Screenshot3">
</div>

<div align="center">
  <h1 class="header">由HoYoShade用戶拍攝</h1>
</div>

<div id="images">
  <img src="Readme.md-image/ScreenShot1.png" alt="Screenshot1">
  <img src="Readme.md-image/ScreenShot2.jpg" alt="Screenshot2">
  <img src="Readme.md-image/ScreenShot3.jpg" alt="Screenshot3">
</div>

> [!NOTE]
> 截圖展示所使用的預設/效果庫可能經過了使用者自行新增/編輯。

## 〢 關於DMCA
由於HoYoShade收到了DMCA警告，你無法再從Release介面下載低於V2.013.0 Stable版本的HoYoShade。  

不受到影響的內容有：  
V1.0.0 Stable  
OpenHoYoShade[All]  
2.012.1_2.012.2_hdiff.zip  

## 〢 贊助
**點擊對應按鈕來贊助HoYoShade**  
贊助的金額由你自行設定。

<div align="center"><p><span ><a href="https://patreon.com/DuolaD"><img src="https://img.shields.io/badge/Patreon-000000.svg?logo=patreon" /></a> <a href="https://afdian.net/a/DuolaD"><img src="https://img.shields.io/badge/愛發電-a47ef7.svg?logo=data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3NzcwN//AABEIACAAIAMBIgACEQEDEQH/xAAZAAEBAAMBAAAAAAAAAAAAAAAFBAEDBgD/xAAqEAACAQIFAQcFAAAAAAAAAAABAgMABAUREiExcRMUIjJBYcEGQlGx8P/EABYBAQEBAAAAAAAAAAAAAAAAAAEDBv/EABsRAAMAAgMAAAAAAAAAAAAAAAABAhEhAxJB/9oADAMBAAIRAxEAPwBq2hnunKW8TyMNzpHHWsXMU1rM0NwhSReVPpW7CMYbDw6ZNodg2pMtSkexBB/uKVVJbq2a+hntEhJOclzZRrv1ANaKuSpra0Wyc/rr2uq5sQt2mMc0MNxDx2scIhfqMvmpb6Hu0oCv2kTqHjfLLUp+eR1FUVZ00IfrpbGXdFjjRD3HSptmU+Hjc+7fnPegtdUWuI3VoCLa4kjVvMoOx6jg01LbTQm2GJ7iSOK1V5ZXG6heDn+sst6U+oY7SGO1S0ukl7FTEUVg33Fs8x7sfQcUVNjF9NGYnuXEbeZE8IPUDmo9dHWnSb8DB//Z" /></a> <a href="https://www.paypal.com/paypalme/Dmou114514233"><img src="https://img.shields.io/badge/PayPal-003087.svg?logo=paypal" /></a> <a href="Readme.md-image/WechatDonateCode.JPG"><img src="https://img.shields.io/badge/微信支付-07C160.svg?logo=wechat&logoColor=white" /></a> <a href="Readme.md-image/AirPayDonateCode.png"><img src="https://img.shields.io/badge/支付寶-1677FF.svg?logo=alipay&logoColor=white" /> </span></p></a></div>

## 〢 聯繫我

> [!NOTE]
> ·如果你處於中國大陸地區，則某些聯繫方式可能不可用。結尾帶星號標識'*'的聯繫方式可以保證在中國大陸地區使用，並且可以獲得更快速的響應和支持。
> ·如果你在使用此模組時有任何的問題，請先在本倉庫創建一個issue。

**點擊對應按鈕聯絡我：**

<div align="center"><p><span ><a href="https://www.hoyolab.com/accountCenter/postList?id=192633110"><img src="https://img.shields.io/badge/HoYoLAB-可用-6680ff.svg?logo=data:image/png;base64,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" /></a> <a href="https://www.miyoushe.com"><img src="https://img.shields.io/badge/米遊社-由於無法完成中國大陸地區實名驗證,暫不可用-blue.svg?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAACZElEQVR4AY2Rg5JdURBFp1IIiylX/ibFfEBs27Zt27ZtjM3nsT1zfe85O7tjZ7pqPRysPt2dNCQEoRvpR/qTqWQHuTY4hA/TYggfzXfrT70yzBNptpoSg+J6NfeXk15yuQ9ZQopJ+6AQAh4Af2NoGNhe5ONWqolEnY8T70zMjQE8I/udZJgIphBbLo2MAAuiGrOJCMZEgYPpNsrqfViuxplkE3O+C4QzIngsl8dFmC3fw5EXBvan2hjHy+PJYf6ubA7QamucS7F+FbwUQbEI1hQHuMGnljPbkfcWJvOySA5RkF4VILlJ4xIFC2L6R0GuCCqHMfuWbBdZMRcGMx3/YGEaL4/i+v4MB28THh7X8gXvTSyO/iSIi6BRBFtzXKREXEQ6WOsHNksOhoGdbOKZtyYOk5v5DlaVAcPCwJdG14qgY0iYggIfj3jgeRNwnoKVUYVZMeBIyMclZr741mAJJo6yvJ0lvjRcBK1JXyewLhTgZoaFc8XMyHFdLXZxhFnvca2g3ENda4B2U6GqycfpNwZWRpSUYorA5w/Mj7F2XrzI7NLMB5kWGtoCaEhAxgjT0ZDIibvYk2xjShyeCBSRurCnQuN2lo33JQ4ChZ8ii5cuvTMg4fkaF5hsT4mvRABBytgiZTC7UkBzp5Ks+BrtlkIam6y+LCU47sPPO/HtBUPDwI4CD28KbEjcZwlPcm38LTRJDjlaBHUEg8PA5pIAj7ItSNSz/uJKD/8KpdEsguWkRRq5jI2UJjqeRhfCU8BuEfQgAyjYNyuOB0ffmckcWRGAMg00kA7ikODr62VdAVvYor4fAfPaaUne+8MNAAAAAElFTkSuQmCC" /> </span></p></a>
  
<div align="center"><p><span ><a href="https://discordapp.com/users/960705009866137631"><img src="https://img.shields.io/badge/Discord-可用-5865F2.svg?logo=discord" /></a> <a href="https://v.kuaishou.com/iO8N0r"><img src="https://img.shields.io/badge/快手*-可用-ff4906.svg?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAD/klEQVR4AbyWA+wkTRTE97Nt27Ztnm3btm3btm3btm39tfjdVF6Syd0is6dK3qIzPVWP3T5B4O/bb+av279xrK9j+xzzO8Y1Mj/2zr7iEJfPYHAW73CspGMHtOE6mzhKitPI/7njJmwhIebGP2517Bb450749x746zb4/Wb487b4RRhXSXHL+28d2x9zg0jyvwPdK8PsIbB4PEzoAvUzQtqHJQ73WRNqazHF7Re3BPSJSf73HdA0FxzcThhSkmDBKMj7pkVD0cnxMhT7FPK9Danul5hYIvpIwN6YYa+XEc6eBOH4AZg1GMZ2hLVzTICwfAqU+xHGdXKE7oBzJ+3ZJROg2t/w1x3RBOyVAH/UsGd+BjYvBWHLMij1Nfx9p4VZoe9WERLPQzAAZ45BKAQ45k+GYBCE08564xzRasXvi6LMQlozFaQkQ+I5qP4v/HbTpQL/vRum9wNwyfrXgyp/QquCsGMNAvu2QN633FpxjdgCOpdDYOdayPhkuBe/3wRNc5vnoaBFRCTa+5sPynwHJw8j0L64rV9zAc1yA1gKCn94adH9dy+smIbAyDZKXRjPtUvBhTNQ9nvXS5GlewQ2LUZgcBOJ8y4griI0wMyB2qM0mPedykByojlRN318KfDehiE4tl8k1g2bl8D4zjasEs4BWDume1ROeRfgeRDNHwXFP4cRrdxoGEzQyhlQ4D23A7wJ8DCKx3WGOukg1QPwqw/+uQuq/gWj28GC0TCtD7QqAJmecsnjEqCCUc707R5GqgEjy/oclPsBavwHNf+372r/6FvCrGgLvGvP/hmvAJGoh5vnhaKfojSYkNvshVpXayYnKMyRLZACp47ApO6Q4yWJ8ChARLXT2GbhxCELa9FPlAqNVWs5sGf2bYa9l9smOLTTPSvmjYyzCCd2A9CEM7MOUHWb56A8m6gsz0Y2ed2hJJw/A/4UaJDZaxveATP6g7BsMnQpB1uXQyAABkXAUvSbT15FNtWM0qXjWhjWXGseBUzv704vkcgjzfIdqxE031VgMarbnYY6okGzQ8LiFDC0qWrCXvSLDyr9BkkJN1DAkKaa//ai3K/ByNaq8BsgQDVgm4y4dw3Yv9UtyNPhJ1/UATalF4I6yftpOK0vdsQet3bSWS9y/T5/yv73qqbTUFGIbrobSjjoYIraBf6wOaCRa97q217SuybkeQOGtwQh4awqXGkJN50LujVrHoBmgy6pEhXxSrY3LGy6fAxqCEsnQa/qkPt1hc88yPKMHbv+ZDxB4jWqI0/CvZGu5W6x/HePbXQ3u3cBDZZRbWByz8g2oavdFy4uRQdf52UhUR0TTAfCekUsBNSAOyh4OyYYXTP6YETXbMA7pwPePQcAdZmNkkx/udgAAAAASUVORK5CYII=" /></a> <a href="https://www.douyin.com/user/MS4wLjABAAAAGUohNGixQiCHKSoHJy0Ae6WS3R7pMd7lSfi5O4A9zH7gdcEd4JEX787i-RFNH257"><img src="https://img.shields.io/badge/抖音*-可用-000000.svg?logo=tiktok" /></a> <a href="https://t.me/D_mou"><img src="https://img.shields.io/badge/Telegram-可用-26A5E4.svg?logo=telegram" /></a> <a href="mailto:D_mou@outlook.com"><img src="https://img.shields.io/badge/Email*-可用-0078D4.svg?logo=microsoftoutlook" /></a> <a href="https://qm.qq.com/q/njKy8OrUU8"><img src="https://img.shields.io/badge/QQ*-可用-EB1923.svg?logo=tencentqq" /> </span></p></a>

<div align="left">

## 〢 貢獻者
感謝所有貢獻者對本項目的奉獻！

<div align="center">
    <table>
        <tr>
            <td>
                <h3>DuolaDStudio Hong Kong Ltd.</h3>
                <a href="https://github.com/DuolaDStudio">
                    <img src="https://avatars.githubusercontent.com/u/152937804?s=200&v=4" width="70" style="border-radius: 50%" alt="DuolaDStudio Hong Kong Ltd.">
                </a>
		<h3>也就是以下成員：</h3>
		<h5>哆啦D夢|DuolaD & 琳尼特|LynetteNotFound</h5>
		<a href="https://github.com/DuolaD"><img src="https://avatars.githubusercontent.com/u/110040721?v=4" width="70" style="border-radius: 50%" alt="DuolaD"></img></a>
		<a href="https://github.com/LynetteNotFound">
                    <img src="https://avatars.githubusercontent.com/u/159673876?v=4" width="70" style="border-radius: 50%" alt="LynetteNotFound">
                </a>
            </td>
	    <td>
                <a href="https://github.com/DuolaDStudio">組織的GitHub主頁</a><br>
		<a href="https://github.com/DuolaD">哆啦D夢|DuolaD的GitHub個人主頁</a><br>
		<a href="https://github.com/LynetteNotFound">琳尼特|LynetteNotFound的GitHub個人主頁</a><br>
		<br>
		<a>注意:哆啦D夢|DuolaD的其它個人主頁連結見上;</a><br>
		<a>琳尼特|LynetteNotFound沒有公開聯係方式</a>
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
		<a href="https://www.hoyolab.com/accountCenter/postList?id=368916437">HoYoLAB個人主頁</a><br>
                <a href="https://www.youtube.com/@AXBroCN">YouTube頻道</a><br>
		<a href="https://www.tiktok.com/@axbrocn?_r=1&_d=eaij8279i83mcl&sec_uid=MS4wLjABAAAAv9yK1VQOks5sB_wbFyXogwDO909TuxhAZ-e-qnpFlMiZ1B4FTIGrh9jdg5KTsuMr&share_author_id=7293608271650030634&sharer_language=en&source=h5_m&u_code=eaij8b3012e2l5&ug_btm=b8727%2Cb0&sec_user_id=MS4wLjABAAAAv9yK1VQOks5sB_wbFyXogwDO909TuxhAZ-e-qnpFlMiZ1B4FTIGrh9jdg5KTsuMr&utm_source=copy&social_share_type=4&utm_campaign=client_share&utm_medium=ios&tt_from=copy&user_id=7293608271650030634&share_link_id=9E0D9FA7-E376-4EAA-B1A1-21F25EE8A746&share_app_id=1233">TikTok頻道</a><br>
		<a href="https://space.bilibili.com/436127696">BiliBili頻道</a>
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
                <a href="https://github.com/34736384">GitHub個人主頁</a><br>
		<a href="https://space.bilibili.com/44434084?spm_id_from=333.337.0.0">BiliBili頻道</a>
            </td>
        </tr>
    </table>
</div>
