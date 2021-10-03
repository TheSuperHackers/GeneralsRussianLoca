set ThisDir1="%~dp0."
call %ThisDir1%\SETUP_Folders.bat

:: Define big file name(s)
set BigName=820_Audio%TargetLanguage%ZH

:: Free folders of big file contents
del /f /q /s %GeneratedBigFilesUnpackedDir%\%BigName%
del /f /q    %GeneratedBigFilesDir%\%BigName%.big

:: Copy .big contents
xcopy /y %GameFilesOriginalEnglishDir%\Data\Audio\Sounds\Russian\*.* %GeneratedBigFilesUnpackedDir%\%BigName%\Data\Audio\Sounds\%TargetLanguage%\
xcopy /y %GameFilesEditedDir%\Data\Audio\Sounds\Russian\*.*          %GeneratedBigFilesUnpackedDir%\%BigName%\Data\Audio\Sounds\%TargetLanguage%\

:: Generate .big file(s)
%ToolsDir%\GeneralsBigCreator\GeneralsBigCreator.exe -source %GeneratedBigFilesUnpackedDir%\%BigName% -dest %GeneratedBigFilesDir%\%BigName%.big

:: Generate Release file(s)
xcopy /y %GeneratedBigFilesDir%\%BigName%.big %GeneratedReleaseUnpackedDir%\%BigName%.big*
