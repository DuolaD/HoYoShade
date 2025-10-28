@echo off
echo Building HoYoShade Launcher...

:: 检查是否安装了 Visual Studio 或 Build Tools
where cl >nul 2>nul
if %errorlevel% neq 0 (
    echo Visual Studio or Build Tools not found in PATH.
    echo Trying to locate Visual Studio...
    
    :: 尝试找到 Visual Studio 2022
    if exist "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat" (
        call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"
    ) else if exist "C:\Program Files\Microsoft Visual Studio\2022\Professional\VC\Auxiliary\Build\vcvars64.bat" (
        call "C:\Program Files\Microsoft Visual Studio\2022\Professional\VC\Auxiliary\Build\vcvars64.bat"
    ) else if exist "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Auxiliary\Build\vcvars64.bat" (
        call "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Auxiliary\Build\vcvars64.bat"
    ) else (
        echo Visual Studio 2022 not found. Please install Visual Studio or Build Tools.
        pause
        exit /b 1
    )
)

:: 编译启动器
cl /EHsc /std:c++17 /O2 HoYoShadeLauncher.cpp /Fe:HoYoShadeLauncher.exe /link shell32.lib advapi32.lib

if %errorlevel% equ 0 (
    echo Build successful! HoYoShadeLauncher.exe created.
    
    :: 清理临时文件
    if exist HoYoShadeLauncher.obj del HoYoShadeLauncher.obj
    
    echo.
    echo You can now run HoYoShadeLauncher.exe
) else (
    echo Build failed!
)

pause