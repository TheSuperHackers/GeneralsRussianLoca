set ThisDir1=%~dp0
call %ThisDir1%SETUP_Folders.bat

:: Define big file name(s)
set BigName=820_Russian

:: Free folders of big file contents
del /f /q /s %GeneratedBigFilesUnpackedDir%\%BigName%
del /f /q    %GeneratedBigFilesDir%\%BigName%.big

:: Copy .big contents
xcopy /y %GameFilesDir%\Data\Russian\*.* %GeneratedBigFilesUnpackedDir%\%BigName%\Data\Russian\
xcopy /y %GameFilesDir%\Data\Russian\Art\Textures\*.* %GeneratedBigFilesUnpackedDir%\%BigName%\Data\Russian\Art\Textures\

:: Generate .big file(s)
%ToolsDir%\GeneralsBigCreator\GeneralsBigCreator.exe -source %GeneratedBigFilesUnpackedDir%\%BigName% -dest %GeneratedBigFilesDir%\%BigName%.big

:: Generate Release file(s)
xcopy /y %GeneratedBigFilesDir%\%BigName%.big %GeneratedReleaseUnpackedDir%\%BigName%.big*
