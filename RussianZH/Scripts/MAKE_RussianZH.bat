set ThisDir1=%~dp0
call %ThisDir1%SETUP_Folders.bat

:: Define big file name(s)
set BigName=820_%TargetLanguage%ZH

:: Free folders of big file contents
del /f /q /s %GeneratedBigFilesUnpackedDir%\%BigName%
del /f /q    %GeneratedBigFilesDir%\%BigName%.big

:: Copy .big contents
xcopy /y %GameFilesDir%\Data\%SourceLanguage%\*.*              %GeneratedBigFilesUnpackedDir%\%BigName%\Data\%TargetLanguage%\
xcopy /y %GameFilesDir%\Data\%SourceLanguage%\Art\Textures\*.* %GeneratedBigFilesUnpackedDir%\%BigName%\Data\%TargetLanguage%\Art\Textures\

:: Discard now obsolete files
del /f /q %GeneratedBigFilesUnpackedDir%\%BigName%\Data\%TargetLanguage%\Install_Final.bmp
del /f /q %GeneratedBigFilesUnpackedDir%\%BigName%\Data\%TargetLanguage%\launcher.bmp

:: Generate .big file(s)
%ToolsDir%\GeneralsBigCreator\GeneralsBigCreator.exe -source %GeneratedBigFilesUnpackedDir%\%BigName% -dest %GeneratedBigFilesDir%\%BigName%.big

:: Generate Release file(s)
xcopy /y %GeneratedBigFilesDir%\%BigName%.big %GeneratedReleaseUnpackedDir%\%BigName%.big*
