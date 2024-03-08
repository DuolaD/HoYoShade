HoYoShade内置一个基于aria2的非强制性的版本检测器和包下载器，它会从内置网址获取Version.json。  
你在二次开发时可以更改下载源网址以让检测器获取来自于你的版本信息，也可以修改源码以便让检测器获取更多信息。  

(Open)HoYoShade默认内置网址为：http://hoyoshadelatestversion.duoladstudio.xyz/version.json

存储服务由CYTeam团队提供支持[北京腾讯云+Microsoft全球网络]  

[2024/3/8]我们预计将在本周将更新源的信息获取和通过在接入Microsoft全球网络之前Cloudflare Inc.的CDN代理，这样应该可以加速中国大陆地区的请求和下载速度。在此期间更新功能可能会出现不可用的情况，敬请理解。

对于Version.json，它的各部分说明如下：  

第一行：最新版本号  
第二行：版本后缀显示 0-Stable 1-Beta  
第三行：是否支持覆盖更新 0-不支持 1-支持  
第四行：最新版本完整HoYoShade包名  
第五行：最新版本覆盖升级HoYoShade包名 None-不支持覆盖更新  
第六行：最新版本完整OpenHoYoShade包名  
第七行：最新版本完整HoYoShade包下载链接  
第八行：最新版本覆盖升级HoYoShade包下载链接 None-不支持覆盖更新  
第九行：最新版本完整OpenHoYoShade包下载链接  
第十行：覆盖更新所需前置版本 None-不支持覆盖更新  
第十一行：覆盖更新前置版本后缀显示 0-Stable 1-Beta  

HoYoShade內建一個基於aria2的非強制性的版本偵測器和套件下載器，它會從內建網址取得Version.json。  
你在二次開發時可以更改下載源網址以讓檢測器獲取來自於你的版本信息，也可以修改源碼以便讓檢測器獲取更多信息。  

(Open)HoYoShade預設內建網址為：http://hoyoshadelatestversion.duoladstudio.xyz/version.json

儲存服務由CYTeam團隊提供支援[北京騰訊雲端+Microsoft全球網路]  

[2024/3/8]我們預計將在本週將更新來源的資訊取得和透過在接入Microsoft全球網路之前Cloudflare Inc.的CDN代理，這樣應該可以加速中國大陸地區的請求和下載速度。 在此期間更新功能可能會出現不可用的情況，敬請理解。

對於Version.json，它的各部分說明如下：  

第一行：最新版本號  
第二行：版本字尾顯示 0-Stable 1-Beta  
第三行：是否支援覆蓋更新 0-不支援 1-支持  
第四行：最新版本完整HoYoShade包名名稱  
第五行：最新版本覆蓋升級HoYoShade包名 None-不支援覆蓋更新  
第六行：最新版本完整OpenHoYoShade包名名稱  
第七行：最新版本完整HoYoShade包下載鏈接  
第八行：最新版本覆蓋升級HoYoShade套件下載連結 None-不支援覆蓋更新  
第九行：最新版本完整OpenHoYoShade包下載鏈接  
第十行：覆蓋更新所需前置版本 None-不支援覆蓋更新  
第十一行：覆蓋更新所需前置版本字尾顯示 0-Stable 1-Beta  

HoYoShade has a built-in non-mandatory version detector and package downloader based on aria2. It retrieves the Version.json from a built-in URL.    
When you are doing secondary development, you can change the download source URL to allow the detector to obtain version information from your source, and you can modify the source code to enable the detector to retrieve more information.  

(Open)HoYoShade Default built-in URL is:http://hoyoshadelatestversion.duoladstudio.xyz/version.json

Storage services are supported by CYTeam [Beijing Tencent Cloud and Microsoft's global network].  

[2024/3/8] We are planning to obtain updated source information and accelerate requests and download speeds in mainland China by leveraging CDN proxy from Cloudflare Inc. before connecting to Microsoft's global network. During this period, there may be instances where the update feature is unavailable. Thank you for your understanding.

For the "Version.json" file, here is an explanation of its different parts:  

line 1:Latest version number.  
line 2:Version suffix display. 0-Stable 1-Beta  
line 3:Override update Support. 0-Not Support 1-Support  
line 4:Latest version HoYoShade full package name.  
line 5:Latest version HoYoShade Override update package name. None-Not Support Override update  
line 6:Latest version OpenHoYoShade full package name.  
line 7:Latest HoYoShade full package Download link.  
line 8:Latest HoYoShade Override update package Download link. None-Not Support Override update  
line 9:Latest OpenHoYoShade full package Download link.  
line 10:Prerequisite override version number.  
line 11:Prerequisite override version suffix display. 0-Stable 1-Beta  
