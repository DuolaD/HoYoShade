::Powered and Note By Github@DuolaD
::code1=ANSI(GB2312)
::code2=Big5
::code3=Shift_JIS
::code4=EUC-KR
::code5=UTF-8
::code6=Unicode

@echo off & setlocal enabledelayedexpansion
title HoYoShade Encoding Converter(Powered By DuolaD X AXBro)
echo Do not close this Window!This program well close it very Soon!
echo 不要关闭此窗口！这个程序很快就会关闭！
echo 不要關閉此視窗！這個程式很快就會關閉！

::Set the encoding type before file conversion, please refer to the Note above
set aaa=1

::Set the encoding type after file conversion, please refer to the Note above
set bbb=5

::set file=%~nx1

::You can Change 'Reshade.ini' to any '.txt' file if you want to use it to another place or just want modded HoYoShade By Yourself.
set file=ReShade.ini

::You don't need to modify the following code

set wfiles=%file%
echo !aaa!|findstr /be "[1-6]" >nul ||goto :eof
echo !bbb!|findstr /be "[1-6]" >nul ||goto :eof

if "!aaa!" == "!bbb!" goto :eof
echo>MakeBOM.vbs Set objFSO = CreateObject("Scripting.FileSystemObject")
echo>> MakeBOM.vbs Set objFile = objFSO.CreateTextFile("Unicode.BOM",,true)
cscript //Nologo MakeBOM.vbs
set codepth=AfterConvert
md %codepth%\tmp

:loop
set vvv=!aaa!

if "!aaa!" == "6" set vvv=!bbb!
for /f "tokens=%vvv%" %%a in ("936 950 932 949 65001") do (reg add "HKCU\Console\%%SystemRoot%%_System32_cmd.exe" /v CodePage /t REG_DWORD /d %%a /f >nul)
if not "!aaa!" == "6" (
if not "!bbb!" == "6" (
start /wait /min cmd /u /c "for %%a in (%%wfiles%%) do copy Unicode.BOM tmpfile.tmp&type "%%~fa" >> tmpfile.tmp&move /y tmpfile.tmp %codepth%\tmp\"%%~nxa""
set aaa=6
set wfiles=%codepth%\tmp\*
goto loop
)

)
if "!bbb!" == "6" (
start /wait /min cmd /u /c "for %%a in (%%wfiles%%) do copy Unicode.BOM tmpfile.tmp&type "%%~fa" >> tmpfile.tmp&move /y tmpfile.tmp %codepth%\"%%~nxa""
) else (start /wait /min cmd /c "for %%a in (%%wfiles%%) do type "%%~fa" > %codepth%\"%%~nxa"")
reg delete "HKCU\Console\%%SystemRoot%%_System32_cmd.exe" /v CodePage /f >nul
del MakeBOM.vbs
del Unicode.BOM
move /y "%codepth%\%file%" "%file%"
rd /s /q "%codepth%"

exit