set ThisDir1=%~dp0
call %ThisDir1%SETUP_Folders.bat

:: Free folders of files
del /s /f /q %GeneratedReleaseUnpackedDir%\*.bik

:: Copy files
xcopy /Y /S %GameFilesDir%\*.bik %GeneratedReleaseUnpackedDir%\
