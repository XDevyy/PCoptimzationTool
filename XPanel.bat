@echo off

:: Check if the script is running with administrator privileges
>nul 2>&1 net session || (
    echo You must run this script as an administrator.
    echo Right-click on the script and select "Run as Administrator".
    pause
    exit /b 1
)

setlocal enabledelayedexpansion

title XPanel v2.0.0 - lyxdev

:MENU
cls
echo +==============================================+
echo                 XPanel Tweaks.               
echo +==============================================+
echo 1. Delete Temporary Files
echo 2. Clear Specific Browser Cache
echo 3. Windows Update Cache
echo 4. Prefetch Files
echo 5. Windows Store Cache
echo 6. Windows Log Files
echo 7. Memory Dump Files
echo 8. Windows Delivery Optimization Files
echo 9. DirectX Shader Cache
echo 10. Set Priority for FortniteClient
echo 11. DNSFLUSH
echo 12. AutoRuns
echo 13. Set Priority for Roblox Client
echo +==============================================+
set /p choice=Enter your choice (1-13): 

if "%choice%" equ "1" (
    call :DeleteTempFiles
) else if "%choice%" equ "2" (
    call :ClearBrowserCache
) else if "%choice%" equ "3" (
    call :ClearWindowsUpdateCache
) else if "%choice%" equ "4" (
    call :ClearPrefetchFiles
) else if "%choice%" equ "5" (
    call :ClearWindowsStoreCache
) else if "%choice%" equ "6" (
    call :ClearWindowsLogFiles
) else if "%choice%" equ "7" (
    call :ClearMemoryDumpFiles
) else if "%choice%" equ "8" (
    call :ClearDeliveryOptimizationFiles
) else if "%choice%" equ "9" (
    call :ClearDirectXShaderCache
) else if "%choice%" equ "10" (
    call :SetFortnitePriority
) else if "%choice%" equ "11" (
    call :DNSFLUSH
) else if "%choice%" equ "12" (
    call :AUTORUNS
) else if "%choice%" equ "13" (
    call :ROBLOX
) else (
    echo Invalid choice. Please enter a number between 1 and 12.
    timeout /nobreak /t 3 >nul
    goto MENU
)

:DeleteTempFiles
echo Batch File By Lyx
RD /S /Q %temp%
MKDIR %temp%
takeown /f "%temp%" /r /d y
takeown /f "C:\Windows\Temp" /r /d y
RD /S /Q C:\Windows\Temp
MKDIR C:\Windows\Temp
takeown /f "C:\Windows\Temp" /r /d y
takeown /f %temp% /r /d y
pause
timeout /nobreak /t 3 >nul
goto MENU

:ClearBrowserCache
echo Clearing specific browser cache...
rem Add commands here to clear browser cache (e.g., for Chrome, Firefox, etc.)
echo Browser cache cleared successfully.
timeout /nobreak /t 3 >nul
goto MENU

:ClearWindowsUpdateCache
echo Clearing Windows Update cache...
net stop wuauserv
rd /s /q %windir%\SoftwareDistribution
net start wuauserv
echo Windows Update cache cleared successfully.
timeout /nobreak /t 3 >nul
goto MENU

:ClearPrefetchFiles
echo Clearing prefetch files...
del /q /f %windir%\Prefetch\*.* 2>nul
echo Prefetch files cleared successfully.
timeout /nobreak /t 3 >nul
goto MENU

:ClearWindowsStoreCache
echo Clearing Windows Store cache...
rd /s /q "%LocalAppData%\Microsoft\Windows\Store" 2>nul
echo Windows Store cache cleared successfully.
timeout /nobreak /t 3 >nul
goto MENU

:ClearWindowsLogFiles
echo Clearing Windows log files...
del /q /f %windir%\Logs\*.* 2>nul
echo Windows log files cleared successfully.
timeout /nobreak /t 3 >nul
goto MENU

:ClearMemoryDumpFiles
echo Clearing memory dump files...
del /q /f %SystemRoot%\Memory.dmp 2>nul
echo Memory dump files cleared successfully.
timeout /nobreak /t 3 >nul
goto MENU

:ClearDeliveryOptimizationFiles
echo Clearing Windows Delivery Optimization files...
del /q /f %windir%\SoftwareDistribution\DeliveryOptimization\Download*.* 2>nul
echo Delivery Optimization files cleared successfully.
timeout /nobreak /t 3 >nul
goto MENU

:ClearDirectXShaderCache
echo Clearing DirectX shader cache...
del /q /f %LocalAppData%\Microsoft\DirectX Shader Cache\*.* 2>nul
echo DirectX shader cache cleared successfully.
timeout /nobreak /t 3 >nul
goto MENU

:SetFortnitePriority
echo Setting priority for FortniteClient process to HIGH...
wmic process where "name='FortniteClient-Win64-Shipping.exe'" CALL setpriority 128
echo Priority set successfully.
timeout /nobreak /t 3 >nul

:DNSFLUSH
echo Flushing DNS Chache
ipconfig /flushdns
echo DNS cache flushed successfully.
timeout /nobreak /t 3 >nul
goto MENU

:AUTORUNS
echo Staring Autoruns.exe
start C:\Users\iaimo\OneDrive\Documents\FORTNITE-OPTIMIZATION\Autoruns.exe
echo Autoruns setting saved successfully.
timeout /nobreak /t 3 >nul
goto MENU

:ROBLOX
echo Setting priority for RobloxPlayerBeta process to HIGH...
wmic process where "name='RobloxPlayerBeta.exe'" CALL setpriority 128
echo Priority set successfully.
timeout /nobreak /t 3 >nul
goto MENU


