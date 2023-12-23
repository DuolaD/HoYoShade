<div align="center">
  <h1 class="header">HoYoShade</h1>
  <h3>
    登峯造極，終抵銀河。
  </h3>
</div>

  ![Compressed](Readme.md-image/compressed-with-watermark.jpg)

[EN](Readme.md)|[簡體中文](Readme.Chinese_Simplified.md)|**繁體中文**  
[GitHub](https://github.com/DuolaD/HoYoShade)|[Gitee](https://gitee.com/DuolaD/HoYoShade)  

## 〢 目錄

- [介紹](#〢-介紹)
- [警告](#〢-警告)  
- [來源](#〢-來源)
- [如何安裝?](#〢-如何安裝?)
- [推薦遊戲圖像設置](#〢-推薦遊戲圖像設置)
- [截圖展示](#〢-截圖展示)
- [贊助](#〢-贊助)
- [聯繫我](#〢-聯繫我)
- [貢獻者](#〢-貢獻者)

## 〢 介紹

這是一個非官方Reshade，使其能在突破米哈遊對於官方Reshade的封鎖下正常用於所有可在PC端運行的米哈遊遊戲。

ReShade的工作原理是攔截CPU和GPU之間的通信，並修改渲染信息以達到提高圖像質量的目的。HoYoShade集成了一些基於官方ReShade的開源項目(具體列表請查看[來源頁面](#〢-來源))並對其進行修改，使其與PC上所有的米哈遊遊戲兼容，並製作一些有針對性的預設。未來，它將支持更多的米哈遊遊戲。

有關本倉庫貢獻者的信息，請訪問[貢獻者界面](#〢-貢獻者)

## 〢 警告

> [!Warning]
> 中國大陸服原神由於對接了騰訊的反作弊系統，並且針對性加強了對於模組識別。所以任何模組及外掛均有更大可能被米哈遊識別，這也意味着你的賬號更有可能會被封禁或導致其它嚴重後果。沒有任何模組和外掛可以保證你的遊戲賬號可以絕對安全。HoYoShade雖然可以運行在官方服務器的米哈遊遊戲上，但並不保證你的你的遊戲賬號絕對安全。

> [!Warning]
> 在你將遊戲內容發送至其它任何人或者進行直播之前，HoYoShade建議你先使用其它Mod隱藏遊戲UID和用戶信息，並且不要將HoYoShade及其它模組界面展示給其它任何人。

> [!NOTE]
> HoYoShade建議你將你的顯卡和芯片組驅動更新至最新版本（如果可用），以獲得來自你設備製造商的最新支持以儘可能減少與圖形相關的問題，降低遊戲崩潰的幾率，並獲得來自設備製造商的最新支持。

> [!NOTE]
> 如果你在官方服務器的米哈遊遊戲上運行HoYoShade，那麼對於可能會發生的任何後果，HoYoShade倉庫的所有貢獻者及其所有基於HoYoShade二次開發的貢獻者均不會承擔任何責任。

## 〢 來源

| 名字 | 介紹 | 網址 |
| --- | --- | --- |
| **ReShade官方** | HoYoShade會保證最新發行版中的ReShade總是和ReShade最新版本保持一致 | [官方倉庫](https://github.com/crosire/reshade),[官方網站](https://reshade.me/) |
| **Crosire的ReShade注入器** | 這只是一個注入器 | [前往ReShade官方倉庫查看源碼](https://github.com/crosire/reshade/blob/main/tools/injector.cpp) |
| **全部來自Pascal Gilcher的付費ReShade效果庫** | 免費提供在所有HoYoShade V2.X.X版本(無論是否贊助) | [查看他的Patreon頁面](https://www.patreon.com/mcflypg/posts) |

## 〢 如何安裝?

舊版本:
從[本倉庫的GitHub發行頁面](https://github.com/DuolaD/Reshade_For_HoyoVerse_Games/releases/tag/Publish)或者從[本倉庫的Gitee發行界面](https://gitee.com/DuolaD/HoYoShade/releases)下載最新的zip包並解壓或者從 
然後按照zip壓縮包內的教程操作即可  

New:(等待GUI開發完成)

## 〢 推薦遊戲畫面設置

> [!NOTE]
> 這裏推薦的畫面設置是基於《原神》作爲參考的。您可以使用這些推薦的畫面設置來修改其他米哈遊遊戲的畫面設置，或者您也可以選擇自定義畫面設置。

> [!NOTE]
> 如果您的顯卡性能低於NVIDIA GTX系列水平，則不建議您使用HoYoShade和FPS解鎖。

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
> 不要在使用FPS解鎖器的情況下更改遊戲中的幀率設置

## 〢 截圖展示
<div align="center">
  <h1 class="header">截圖來自[Youtube@AXBro阿向菌](https://www.youtube.com/@AXBroCN)</h1>
</div>

<div id="images">
  <img src="Readme.md-image/AXBro-1.jpg" alt="Screenshot1">
  <img src="Readme.md-image/AXBro-2.jpg" alt="Screenshot2">
  <img src="Readme.md-image/AXBro-3.jpg" alt="Screenshot3">
</div>

## 〢 贊助
如果你可以使用微信支付/支付寶，你可以使用微信掃描這個二維碼對我進行贊助。
如果你可以使用PayPal，你可以[點擊鏈接](https://www.paypal.com/paypalme/Dmou114514233)進行贊助。  
如果你想長期贊助HoYoShade，你可以去查看[Patreon頁面(海外)](https://patreon.com/duolad)或者[愛發電頁面(中國大陸地區)](https://afdian.net/a/DuolaD)

贊助的金額由你自行設定。

![WechatDonateCode](Readme.md-image/WechatDonateCode.JPG)  
![AirPayDonateCode](Readme.md-image/AirPayDonateCode.png) 

## 〢 聯繫我

> [!NOTE]
> 如果你處於中國大陸地區，則某些聯繫方式可能不可用。結尾帶星號標識'*'的聯繫方式可以保證在中國大陸地區使用，並且可以獲得更快速的響應和支持。

> [!NOTE]
> 如果你在使用此模組時有任何的問題，請先在本倉庫創建一個issue。

我的郵箱地址* : D_mou@outlook.com  
[點我即可添加HoYoShade在騰訊QQ中的官方羣組*](http://qm.qq.com/cgi-bin/qm/qr?_wv=1027&k=yECCeLBMXBEl1t8MEyCPPVenwC6xPiDz&authKey=75cidtiq9%2Fmy6kstaP1AbnZ%2BUQEm9ZZ3WHZG5hdGFDeWfI%2F%2FfrviZpB4T%2F1q6bCE&noverify=0&group_code=377103253)  
在騰訊QQ中搜索QQ此代碼來添加好友，以此和我交流(註明來意)*:3484767759  
[點我即可在Telegram上和我交流(註明來意)](https://t.me/D_mou)  
[點我即可關注我的HoYoLAB(國際米遊社)賬號](https://www.hoyolab.com/accountCenter/postList?id=192633110). 

## 〢 貢獻者
感謝所有貢獻者對本項目的奉獻！

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
                <a href="https://github.com/DuolaD">GitHub個人主頁</a><br>
		<a href="https://www.hoyolab.com/accountCenter/postList?id=192633110">HoYoLAB個人主頁</a><br>
		<a href="https://www.youtube.com/@DuolaD_HK">YouTube頻道</a>
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
                <h3>REL</h3>
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
