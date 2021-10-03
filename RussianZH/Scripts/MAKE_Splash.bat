set ThisDir1="%~dp0."
call %ThisDir1%\SETUP_Folders.bat

:: Free folders of files
del /f /q %GeneratedReleaseUnpackedDir%\*.bmp

:: Copy files
xcopy /y %GameFilesEditedDir%\*.bmp %GeneratedReleaseUnpackedDir%\
