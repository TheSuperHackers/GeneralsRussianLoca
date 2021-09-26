set ThisDir1="%~dp0."
call %ThisDir1%\SETUP_Folders.bat

:: Free folders of files
del /f /q /s %GeneratedReleaseUnpackedDir%\*.bik

:: Copy files
xcopy /y /s %GameFilesDir%\Data\%SourceLanguage%\Movies\*.bik %GeneratedReleaseUnpackedDir%\Data\%TargetLanguage%\Movies\
