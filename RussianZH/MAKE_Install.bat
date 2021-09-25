@echo off
:: BatchGotAdmin
:-------------------------------------
::  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

:: --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------
echo on

set ThisDir0=%~dp0
call %ThisDir0%Scripts\MAKE_AudioRussianZH.bat
::call %ThisDir0%Scripts\MAKE_INIRussianZH.bat
call %ThisDir0%Scripts\MAKE_Movies.bat
call %ThisDir0%Scripts\MAKE_RussianZH.bat
call %ThisDir0%Scripts\MAKE_SpeechRussianZH.bat
::call %ThisDir0%Scripts\MAKE_Splash.bat

:: Apply user settings
call %ThisDir0%SETUP_UserSettings.bat

::Copy release files to game
xcopy /Y /S %GeneratedReleaseUnpackedDir% %GameRootDir%
