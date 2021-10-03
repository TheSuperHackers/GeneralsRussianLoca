set ThisDir1="%~dp0."
call %ThisDir1%\SETUP_Folders.bat

:: Define big file name(s)
set BigName=820_%TargetLanguage%ZH

:: Free folders of big file contents
del /f /q /s %GeneratedBigFilesUnpackedDir%\%BigName%
del /f /q    %GeneratedBigFilesDir%\%BigName%.big

:: Copy .big contents
xcopy /y %GameFilesOriginalEnglishDir%\Data\English\*.*              %GeneratedBigFilesUnpackedDir%\%BigName%\Data\%TargetLanguage%\
xcopy /y %GameFilesOriginalEnglishDir%\Data\English\Art\Textures\*.* %GeneratedBigFilesUnpackedDir%\%BigName%\Data\%TargetLanguage%\Art\Textures\
xcopy /y %GameFilesEditedDir%\Data\Russian\*.*                       %GeneratedBigFilesUnpackedDir%\%BigName%\Data\%TargetLanguage%\
xcopy /y %GameFilesEditedDir%\Data\Russian\Art\Textures\*.*          %GeneratedBigFilesUnpackedDir%\%BigName%\Data\%TargetLanguage%\Art\Textures\

:: Compress TGA and PSD to DDS and delete intermediate source copies
call %ThisDir1%\CrunchTextures.bat %GeneratedBigFilesUnpackedDir%\%BigName%

:: Generate .big file(s)
%ToolsDir%\GeneralsBigCreator\GeneralsBigCreator.exe -source %GeneratedBigFilesUnpackedDir%\%BigName% -dest %GeneratedBigFilesDir%\%BigName%.big

:: Generate Release file(s)
xcopy /y %GeneratedBigFilesDir%\%BigName%.big %GeneratedReleaseUnpackedDir%\%BigName%.big*
