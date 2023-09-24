@echo on
set "regPath=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Star Rail"
set "regValue=InstallPath"

reg query "%regPath%" /v "%regValue%" >nul 2>nul
if %errorlevel% equ 0 (
    for /f "tokens=2*" %%A in ('reg query "%regPath%" /v "%regValue%" ^| findstr /i "%regValue%"') do (
        cd %%B/Games
    )
) else (
    echo The registry value does not exist.
)

pause