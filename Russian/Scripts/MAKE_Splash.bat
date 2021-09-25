set ThisDir1=%~dp0
call %ThisDir1%SETUP_Folders.bat

:: Free folders of files
del /f /q %GeneratedReleaseUnpackedDir%\Install_Final.bmp

:: Copy files
xcopy /y %GameFilesDir%\Install_Final.bmp %GeneratedReleaseUnpackedDir%\
