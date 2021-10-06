set ThisDir1="%~dp0."
call %ThisDir1%\SETUP_Folders.bat

:: Free folders of files
del /f /q /s %GeneratedReleaseUnpackedDir%\Data\%TargetLanguage%\Movies\*.*

:: Copy files
xcopy /y /s %GameFilesOriginalEnglishDir%\Data\English\Movies\*.* %GeneratedReleaseUnpackedDir%\Data\%TargetLanguage%\Movies\
xcopy /y /s %GameFilesEditedDir%\Data\Russian\Movies\*.*          %GeneratedReleaseUnpackedDir%\Data\%TargetLanguage%\Movies\
